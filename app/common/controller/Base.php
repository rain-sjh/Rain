<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2019 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
declare (strict_types=1);

namespace app\common\controller;

use think\facade\Session;
use think\Request;

/**
 * 控制器基础类
 */
class Base
{
	/**
	 * Base constructor.
	 * @param Request $request
	 */
	public function __construct(Request $request)
	{
		$this->initialize();
	}

	/**
	 *
	 */
	protected function initialize()
	{

	}


	/**
	 * 设置Session 闪存, 下次请求失效.
	 * @param $name
	 * @param $value
	 */
	protected function setFlash($name, $value)
	{
		Session::flash($name, $value);
	}

	/**
	 * 成功的闪存信息
	 * @param $msg
	 */
	protected function success($msg)
	{
		$this->setFlash('tips', json_encode([
			'msg' => $msg,
			'icon' => 1
		]));
	}

	/**
	 * 错误的闪存信息
	 * @param $msg
	 */
	protected function error($msg)
	{
		$this->setFlash('tips', json_encode([
			'msg' => $msg,
			'icon' => 2
		]));
	}

}
