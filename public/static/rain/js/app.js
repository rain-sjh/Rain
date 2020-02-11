layui.use(['form', 'element', 'table', 'upload', 'layer', 'carousel', 'flow'], function () {
    let layer = layui.layer,
        carousel = layui.carousel,
        form = layui.form,
        element = layui.element,
        table = layui.table,
        upload = layui.upload,
        flow = layui.flow;
    flow.lazyimg();
});

// 信息弹窗  0 橘色感叹号 / 1 绿色对号 / 2 红色错号 / 3 黄色问号 / 4 灰色锁头 / 5 红色哭脸 / 6 绿色笑脸
$.msg = function (msg = '', icon = 1) {
    let anim = 6;
    if ($.inArray(icon, [0, 2, 3, 5]) < 0) {
        anim = Math.floor(6 * Math.random());
    }
    layui.use('layer', function () {
        layer.msg(msg, {icon: icon, anim: anim, time: 1000});
    });
};

$.Flash = function (msg = '', icon = 1) {
    let anim = 6;
    if ($.inArray(icon, [0, 2, 3, 5]) < 0) {
        anim = Math.floor(6 * Math.random());
    }
    layui.use('layer', function () {
        layer.msg(msg, {
            icon: icon,
            anim: anim,
            time: 1000
        })
    });
};

$.Url = function (url = '') {
    if (url) {
        window.location.href = url;
    }
    window.location.reload();
};

// get 求情快速处理
$.Get = function (url, param = {}, $res) {
    if (url) {
        let getLoad = layer.load(2, {time: 3 * 1000});
        return $.get(url, param, function (res) {
            layer.close(getLoad);
            if (res.code === 200) {
                $.msg(res.msg);
                return $res ? $res(res.data) : '';
            } else {
                $.msg(res.msg, 2);
            }
        });
    }
};

// post 求情快速处理
$.Post = function (url, param = [], $res) {
    if (url) {
        let postLoad = layer.load(2, {time: 3 * 1000});
        return $.post(url, param, function (res) {
            layer.close(postLoad);
            if (res.code === 200) {
                $.msg(res.msg);
                return $res ? $res(res.data) : '';
            } else {
                $.msg(res.msg, 2);
            }
        })
    }
};

// 将链接以模态窗形式展示
$.Modal = function (url) {
    if (url) {
        let modelLoad = layer.load(2, {time: 3 * 1000});
        $.get(url, function (res) {
            layer.open({
                title: false,
                type: 1,
                area: 'auth',
                move: '.layui-card-header',
                shadeClose: true, //点击遮罩关闭
                content: res
            });
            layui.use(['form', 'flow'], function () {
                let form = layui.form,
                    flow = layui.flow;
                form.render();
                flow.lazyimg();
            });
            layer.close(modelLoad);
        })
    }
};

// 提交一个表单 name 不填写为全部表单, url默认为当前页面地址
$.Form = function (name = '*', url = '', res) {
    layui.use(['form'], function () {
        let form = layui.form;
        form.on('submit(' + name + ')', function (data) {
            if (url === '') {
                url = window.location.href;
            }
            $.Post(url, data.field, function (e) {
                return res ? res(e) : '';
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
};

// 数据流展示
$.Flow = function (selector, url) {
    layui.use('flow', function () {
        let flow = layui.flow;
        flow.load({
            elem: selector,
            scrollElem: $(selector).parent(),
            isAuto: true,
            done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                let list = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get(url, {page: page}, function (res) {
                    //假设你的列表返回在data集合中
                    if (res.code === 200) {
                        list.push(res.data.list);
                        next(list.join(''), page < res.data.lastPage);
                    }
                });
            }
        });
    });
};

// 删除一个内容
$.Del = function (url, res) {
    let param = {
        icon: 0,
        closeBtn: 0,
        btnAlign: 'c',
        title: false,
        btn: ['删除', '取消']
    };
    layer.confirm('确定要删除?', param, function (index) {
        layer.close(index);
        return $.Post(url,{_method:'DELETE'},res);
    });
};

layui.use(['upload', 'element'], function () {
    let upload = layui.upload;
    let element = layui.element;
    let index, _this;
    let uploadInst = upload.render({
        elem: '.layui-upload .layui-btn-upload',
        url: '/common/upload/image',
        before: function (obj) {
            // 上传图片预览
            _this = $(uploadInst.config.item).parents('.layui-upload');
            obj.preview(function (index, file, result) {
                $(_this).find('.layui-upload-img').attr('src', result)
            });
        },
        done: function (res) {
            layer.msg('上传成功');
            if (res.code === 200) {
                let data = res.data;
                $(data).each(function (index, item) {
                    $(_this).find('.layui-upload-item').val('/upload/' + item.path);
                });
            } else {
                $.msg(res.msg, 2);
            }
        },
        error: function (e) {
            layer.msg('上传失败');
            $(_this).find('.layui-btn-retry').removeClass('layui-hide');
            $(_this).find('.layui-btn-retry').click(function () {
                uploadInst.upload();
            })
        }
    });
});

