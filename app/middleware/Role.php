<?php
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 作者: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 11:18
 * 侵权必究
 */

namespace app\middleware;


use app\model\User;
use Closure;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\View;
use app\Request;

class Role
{
	/** @var array 放行列表 */
	protected $allow = [
		'home' => [
			'' => [
				''
			],
			'Auth' => [
				'login'
			],
			'Index' => [
				'index',
			]
		],
		'common' => [
			'Upload' => [
				'image'
			]
		]
	];

	protected $user;

	/**
	 * @param Request $request
	 * @param Closure $next
	 * @return mixed
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function handle(Request $request, Closure $next)
	{
		$this->verifyToken();
		$this->verifyWhitelist();

		View::assign('userInfo',$this->user);
		$request->user = $this->user;
		return $next($request);
	}

	/**
	 * 验证TOKEN 并返回 用户信息
	 * @return bool
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function verifyToken()
	{
		// 当cookie存在token信息则自动登录
		if (!empty(cookie('token'))) {
			session('token', cookie('token'));
		}
		// 读取token
		$token = session('token');
		// 读取用户信息
		$this->user = User::where('token', $token)
			->field('id,avatar,nickname,username,gender,token')
			->find();

		return true;
	}

	public function verifyWhitelist()
	{
		// 当前应用
		$app = app('http')->getName();
		// 当前控制器
		$controller = request()->controller();
		// 当前方法
		$action = request()->action();
		// 白名单
		$allow = isset($this->allow[$app][$controller]) ? $this->allow[$app][$controller] : [];
		// 不在白名单,验证登录身份
		if (!in_array($action, $allow)) {
			if (empty($user)) {
				// 设置session标记完成
				session('complete', true);
				if (request()->isAjax()) return error(407);
				return redirect('/login')->remember()->send();
			}
		}

		return true;
	}

}
