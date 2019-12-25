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
use app\model\User;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Request;
use think\response\Json;
use think\response\Redirect;
use think\response\View;

class Auth extends Base
{
	/**
	 * @param Request $request
	 * @param User $User
	 * @return Json|Redirect|View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function login(Request $request, User $User)
	{
		if ($request->isPost()) {
			$param = $request->post();

			if (!captcha_check($param['code'])) {
				return error(405);
			}

			$user = $User->getByUsername($param['username']);

			if (empty($user)) {
				return error(406, '您输入的账号不存在!');
			}

			if (!password_verify($param['password'], $user->password)) {
				return error(406, '您输入的密码不正确!');
			}

			$token = md5(uniqid((string)mt_rand(), true));

			$user = $User->find($user->id);
			$user->token = $token;
			$user->ip = get_ip();
			$user->save();

			if (!empty($param['remember'])) {
				cookie('token', $token);
			}

			session('token', $token);

			return success('', '登录成功!');
		}

		if (!empty($request->userInfo)) {
			if (session('?complete')) {
				// 删除session
				session('complete', null);
				return redirect('')->restore();
			}
			return redirect('/');
		}

		return view('login');
	}

	/**
	 * 退出登录
	 * @return Json
	 */
	public function logout()
	{
		session('token', false);
		cache('token', false);
		return success('', '退出成功!');
	}

}
