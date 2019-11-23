<?php
declare(strict_types=1);
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 作者: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 11:18
 * 侵权必究
 */

namespace app\home\controller;


use app\common\controller\Base;
use think\response\View;

class Index extends Base
{
	/**
	 * 前台首页
	 * @return View
	 */
	public function index()
	{
		return view('index');
	}
}
