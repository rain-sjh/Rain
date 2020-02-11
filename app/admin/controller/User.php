<?php
/** @noinspection PhpDynamicAsStaticMethodCallInspection */
declare(strict_types=1);
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
use app\model\Role;
use app\Request;
use think\db\exception\DbException;
use think\response\Json;
use think\response\View;

class User
{
	/**
	 * 用户列表
	 * @param UserModel $User
	 * @param Role $Role
	 * @return string
	 * @throws DbException
	 */
	public function list(UserModel $User,Role $Role)
	{
		$list = $User->order('id desc')
			->paginate();
		$role = $Role->column('name','code');

		return display('list', [
			'list' => $list,
			'role' => $role
		]);
	}

	/**
	 * 添加新用户
	 * @param Request $request
	 * @param UserModel $User
	 * @return Json|View
	 */
	public function add(Request $request, UserModel $User)
	{
		if ($request->isPost()) {
			$param = $request->post();
			if (!empty($User->getByUsername($param['username']))) {
				return error(406, '用户名已存在!');
			}
			$param['password'] = password_hash($param['password'], PASSWORD_BCRYPT);

			$user = new $User();
			$user->save($param);

			if (empty($user->id)) {
				return error(403);
			}
			return success();
		}
		return view();
	}

	/**
	 * 更改用户状态
	 * @param $id
	 * @param $status
	 * @return Json
	 */
	public function status($id, $status)
	{
		if (empty($id)) {
			return error(404,'用户ID不能为空');
		}

		$user = UserModel::getById($id);
		if ($status === 'true') {
			$user->status = 0;
		} else {
			$user->status = 1;
		}
		$user->save();

		return success();
	}

	/**
	 * 更改用户状态
	 * @param $id
	 * @param $role
	 * @return Json
	 */
	public function role($id, $role)
	{
		if (empty($id)) {
			return error(404,'用户ID不能为空');
		}

		$user = UserModel::getById($id);
		$user->role = $role;
		$user->save();

		return success();
	}

	/**
	 * 编辑用户信息
	 * @param Request $request
	 * @param UserModel $User
	 * @param $id
	 * @return Json|View
	 */
	public function edit(Request $request, UserModel $User, $id)
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

}
