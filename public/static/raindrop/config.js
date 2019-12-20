// 使用2D画布模拟降雨
// - 香草JS，没有框架
// - 帧速率独立物理
// - 通过demo提供慢速/快进支持
// - 支持high-DPI屏幕
// - 雨点被画成矢量线
// - 飞溅粒子是惰性预渲染，所以梯度不计算每一帧
// - 所有粒子都利用对象池进一步提高性能

// 初始化
document.addEventListener("DOMContentLoaded", function() {
	demo.init();
	window.addEventListener('resize', demo.resize);
});

// 演示的命名空间
var demo = {
	// 可定制的属性
	// - 物理速度倍增器:允许减慢或加速模拟
	speed: 1,
	// - 粒子的颜色
	color: {
		r: '80',
		g: '175',
		b: '255',
		a: '0.5'
	},
	
	// 终端定制
	// 演示是否正在运行
	started: false,
	// 画布和相关的上下文引用
	canvas: null,
	ctx: null,
	// 视窗尺寸(下降)
	width: 0,
	height: 0,
	// devicePixelRatio别名(应该只用于渲染，物理不应该关心)
	dpr: window.devicePixelRatio || 1,
	// 上次落下的时间
	drop_time: 0,
	// 滴药之间的理想时间(用鼠标/手指改变)
	drop_delay: 25,
	// 风应用于雨(用鼠标/手指改变)
	wind: 4,
	// 雨的颜色(初始设置)
	rain_color: null,
	rain_color_clear: null,
	// 雨粒子
	rain: [],
	rain_pool: [],
	// 雨滴(飞溅)粒子
	drops: [],
	drop_pool: []
};

// 演示初始化(应该只运行一次)
demo.init = function() {
	if (!demo.started) {
		demo.started = true;
		demo.canvas = document.getElementById('canvas');
		demo.ctx = demo.canvas.getContext('2d');
		var c = demo.color;
		demo.rain_color = 'rgba(' + c.r + ',' + c.g + ',' + c.b + ',' + c.a + ')';
		demo.rain_color_clear = 'rgba(' + c.r + ',' + c.g + ',' + c.b + ',0)';
		demo.resize();
		Ticker.addListener(demo.step);
		
		// 
		// const gui = new dat.GUI();
		// gui.add(demo, 'speed', 0.2, 2);
		
		// 指示几秒钟后淡出
/*		var instructions = document.getElementById('instructions');
		setTimeout(function() {
			instructions.style.opacity = 0;
			setTimeout(function(){
				instructions.parentNode.removeChild(instructions);
			}, 2000);
		}, 4000);*/
	}
};

// (重新)画布大小(清除所有粒子)
demo.resize = function() {
	// 本地化常见的引用
	var rain = demo.rain;
	var drops = demo.drops;
	// 回收粒子
	for (var i = rain.length - 1; i >= 0; i--) {
			rain.pop().recycle();
	}
	for (var i = drops.length - 1; i >= 0; i--) {
			drops.pop().recycle();
	}
	// 调整
	demo.width = window.innerWidth;
	demo.height = window.innerHeight;
	demo.canvas.width = demo.width * demo.dpr;
	demo.canvas.height = demo.height * demo.dpr;
};

demo.step = function(time, lag) {
	// 本地化常见的引用
	var demo = window.demo;
	var speed = demo.speed;
	var width = demo.width;
	var height = demo.height;
	var wind = demo.wind;
	var rain = demo.rain;
	var rain_pool = demo.rain_pool;
	var drops = demo.drops;
	var drop_pool = demo.drop_pool;
	
	// 对物理学的乘数
	var multiplier = speed * lag;
	
	// 产卵滴
	demo.drop_time += time * speed;
	while (demo.drop_time > demo.drop_delay) {
		demo.drop_time -= demo.drop_delay;
		var new_rain = rain_pool.pop() || new Rain();
		new_rain.init();
		var wind_expand = Math.abs(height / new_rain.speed * wind); // 扩大产卵宽度的风增加
		var spawn_x = Math.random() * (width + wind_expand);
		if (wind > 0) spawn_x -= wind_expand;
		new_rain.x = spawn_x;
		rain.push(new_rain);
	}
	
	// 雨物理
	for (var i = rain.length - 1; i >= 0; i--) {
		var r = rain[i];
		r.y += r.speed * r.z * multiplier;
		r.x += r.z * wind * multiplier;
		// 移走视线之外的雨水
		if (r.y > height) {
			// 如果雨水到达视图底部，显示飞溅
			r.splash();
		}
		// 回收雨水
		if (r.y > height + Rain.height * r.z || (wind < 0 && r.x < wind) || (wind > 0 && r.x > width + wind)) {
			r.recycle();
			rain.splice(i, 1);
		}
	}
	
	// 飞溅减少物理
	var drop_max_speed = Drop.max_speed;
	for (var i = drops.length - 1; i >= 0; i--) {
		var d = drops[i];
		d.x += d.speed_x * multiplier;
		d.y += d.speed_y * multiplier;
		// 应用重力-魔术数字0.3代表一个伪造的重力常数
		d.speed_y += 0.3 * multiplier;
		// 施加风力(但减小风力)
		d.speed_x += wind / 25 * multiplier;
		if (d.speed_x < -drop_max_speed) {
			d.speed_x = -drop_max_speed;
		}else if (d.speed_x > drop_max_speed) {
			d.speed_x = drop_max_speed;
		}
		// 回收
		if (d.y > height + d.radius) {
			d.recycle();
			drops.splice(i, 1);
		}
	}
	
	demo.draw();
};

demo.draw = function() {
	// 本地化常见的引用
	var demo = window.demo;
	var width = demo.width;
	var height = demo.height;
	var dpr = demo.dpr;
	var rain = demo.rain;
	var drops = demo.drops;
	var ctx = demo.ctx;
	
	// 重新开始
	ctx.clearRect(0, 0, width*dpr, height*dpr);
	
	// 绘制雨(先绘制所有路径，然后描边一次)
	ctx.beginPath();
	var rain_height = Rain.height * dpr;
	for (var i = rain.length - 1; i >= 0; i--) {
		var r = rain[i];
		var real_x = r.x * dpr;
		var real_y = r.y * dpr;
		ctx.moveTo(real_x, real_y);
		// 魔法数字1.5弥补了绘图角度雨缺乏三角
		ctx.lineTo(real_x - demo.wind * r.z * dpr * 1.5, real_y - rain_height * r.z);
	}
	ctx.lineWidth = Rain.width * dpr;
	ctx.strokeStyle = demo.rain_color;
	ctx.stroke();
	
	// 绘制飞溅点(只需复制预渲染画布)
	for (var i = drops.length - 1; i >= 0; i--) {
		var d = drops[i];
		var real_x = d.x * dpr - d.radius;
		var real_y = d.y * dpr - d.radius;
		ctx.drawImage(d.canvas, real_x, real_y);
	}
};


// 雨的定义
function Rain() {
	this.x = 0;
	this.y = 0;
	this.z = 0;
	this.speed = 25;
	this.splashed = false;
}
Rain.width = 2;
Rain.height = 40;
Rain.prototype.init = function() {
	this.y = Math.random() * -100;
	this.z = Math.random() * 0.5 + 0.5;
	this.splashed = false;
};
Rain.prototype.recycle = function() {
	demo.rain_pool.push(this);
};
// 回收雨水粒子，制造出大量的水滴
Rain.prototype.splash = function() {
	if (!this.splashed) {
		this.splashed = true;
		var drops = demo.drops;
		var drop_pool = demo.drop_pool;

		for (var i=0; i<16; i++) {
			var drop = drop_pool.pop() || new Drop();
			drops.push(drop);
			drop.init(this.x);
		}
	}
};


// 液滴的定义
function Drop() {
	this.x = 0;
	this.y = 0;
	this.radius = Math.round(Math.random() * 2 + 1) * demo.dpr;
	this.speed_x = 0;
	this.speed_y = 0;
	this.canvas = document.createElement('canvas');
	this.ctx = this.canvas.getContext('2d');
	
	// 渲染一次并缓存
	var diameter = this.radius * 2;
	this.canvas.width = diameter;
	this.canvas.height = diameter;

	var grd = this.ctx.createRadialGradient(this.radius, this.radius , 1, this.radius, this.radius, this.radius);
	grd.addColorStop(0, demo.rain_color);
	grd.addColorStop(1, demo.rain_color_clear);
	this.ctx.fillStyle = grd;
	this.ctx.fillRect(0, 0, diameter, diameter);
}

Drop.max_speed = 5;

Drop.prototype.init = function(x) {
	this.x = x;
	this.y = demo.height;
	var angle = Math.random() * Math.PI - (Math.PI * 0.5);
	var speed = Math.random() * Drop.max_speed;
	this.speed_x = Math.sin(angle) * speed;
	this.speed_y = -Math.cos(angle) * speed;
};
Drop.prototype.recycle = function() {
	demo.drop_pool.push(this);
};




// 处理交互
demo.mouseHandler = function(evt) {
	demo.updateCursor(evt.clientX, evt.clientY);
};
demo.touchHandler = function(evt) {
	evt.preventDefault();
	var touch = evt.touches[0];
	demo.updateCursor(touch.clientX, touch.clientY);
};
demo.updateCursor = function(x, y) {
	x /= demo.width;
	y /= demo.height;
	var y_inverse = (1 - y);
	
	demo.drop_delay = y_inverse*y_inverse*y_inverse * 100 + 2;
	demo.wind = (x - 0.5) * 50;
};

document.addEventListener('mousemove', demo.mouseHandler);
document.addEventListener('touchstart', demo.touchHandler);
document.addEventListener('touchmove', demo.touchHandler);



// 帧标记器辅助模块
var Ticker = (function(){
	var PUBLIC_API = {};

	// 公共
	// 一旦注册，将重复调用函数引用，并将运行时间和滞后乘数作为参数传递
	PUBLIC_API.addListener = function addListener(fn) {
		if (typeof fn !== 'function') throw('Ticker.addListener() requires a function reference passed in.');

		listeners.push(fn);

		// 开始frame-loop懒洋洋地
		if (!started) {
			started = true;
			queueFrame();
		}
	};

	// 私人
	var started = false;
	var last_timestamp = 0;
	var listeners = [];
	// 对新帧进行排队(调用frameHandler)
	function queueFrame() {
		if (window.requestAnimationFrame) {
			requestAnimationFrame(frameHandler);
		} else {
			webkitRequestAnimationFrame(frameHandler);
		}
	}
	function frameHandler(timestamp) {
		var frame_time = timestamp - last_timestamp;
		last_timestamp = timestamp;
		// 确保没有报告负时间(第一帧可能很奇怪)
		if (frame_time < 0) {
			frame_time = 17;
		}
		// - 将最小帧率限制在15fps[~68ms](假设60fps[~17ms]为“正常”)
		else if (frame_time > 68) {
			frame_time = 68;
		}

		// 火自定义侦听器
		for (var i = 0, len = listeners.length; i < len; i++) {
			listeners[i].call(window, frame_time, frame_time / 16.67);
		}
		
		// 总是对另一帧进行排队
		queueFrame();
	}

	return PUBLIC_API;
}());