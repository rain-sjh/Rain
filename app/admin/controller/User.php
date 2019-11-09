<?php
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 作者: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 11:18
 * 侵权必究
 */

namespace app\admin\controller;

use app\model\User as UserModel;
use app\Request;
use think\facade\Route;

class User
{
	public function list(UserModel $User)
	{
		$list = $User->order('id desc')
			->paginate();

		return view('list', [
			'list' => $list
		]);
	}

	public function add(Request $request,UserModel $User)
	{
		if ($request->isPost()) {
			$param = $request->post();
			if (!empty($User->getByUsername($param['username']))) {
				return error(406, '用户名已存在!');
			}
			$param['password'] = password_hash($param['password'], PASSWORD_BCRYPT);

			$user = new $User;
			$user->save($param);

			if (empty($user->id)) {
				return error(403);
			}
			return success();
		}
		return view();
	}

	public function status($id, $status)
	{
		if (empty($id)) {
			return error(404,'用户ID不能为空');
		}

		$user = UserModel::getById($id);
		if ($status == 'true') {
			$user->status = 0;
		} else {
			$user->status = 1;
		}
		$user->save();

		return success();
	}

	public function edit(Request $request,UserModel $User,$id)
	{
		$user = $User->field('id, avatar, nickname, username, phone, gender, birthday, summary')
			->getById($id);

		if ($request->isPost()) {
			$param = $request->post();
			if (empty($param['password'])) {
				unset($param['password']);
			} else {
				$param['password'] = password_hash($param['password'], PASSWORD_BCRYPT);
			}
			$user->save($param);
			return success(false,'保存成功');
		}
		return view('edit',[
			'user' => $user
		]);
	}

	public function roleList()
	{
		$url = Route::getRuleList();
		dd($url);
		return view();
	}
}
