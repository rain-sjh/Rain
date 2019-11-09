<?php
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
use app\model\User;
use think\Request;

class Auth extends Base
{
	public function login(Request $request)
	{
		if (Request()->isPost()) {
			$param = Request()->post();

			if (!captcha_check($param['code'])) {
				return error(405);
			}

			$user = User::getByUsername($param['username']);

			if (empty($user)) {
				return error(406, '您输入的账号不存在!');
			}

			if (!password_verify($param['password'], $user['password'])) {
				return error(406, '您输入的密码不正确!');
			}

			$token = md5(uniqid(rand(), true));

			$user->token = $token;
			$user->ip = getIP();
			$user->save();

			if (!empty($param['remember'])) {
				cookie('token', $token);
			}

			session('token', $token);

			return success('', '登录成功!');
		}

		if (!empty($request->user)) {
			$this->error('请不要重复登录!');
			if (session('?complete')) {
				// 删除session
				session('complete', null);
				return redirect('')->restore();
			}
			return redirect('/');
		}

		return view('login');
	}

	public function logout()
	{
		session('token', false);
		cache('token', false);
		return success('', '退出成功!');
	}

	public function verify()
	{
		return captcha();
	}
}
