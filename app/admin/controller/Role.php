<?php
declare(strict_types=1);
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 邮箱: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 16:51
 * 侵权必究
 */

namespace app\admin\controller;


use app\model\Role as RoleModel;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Request;
use think\response\Json;
use think\response\View;

class Role
{
	/**
	 * 角色列表
	 * @param RoleModel $Role
	 * @return View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function list(RoleModel $Role)
	{
		$role = $Role->select();

		return view('list',[
			'role' => $role
		]);

	}

	public function add(Request $request,RoleModel $Role)
	{
		if ($request->isPost()) {
			$param = $request->post();
//			$Role->getBy
			dd($param);
		}
		return view('add');
	}

	/**
	 * 删除角色
	 * @param Request $request
	 * @param RoleModel $Role
	 * @param $id
	 * @return Json
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 * @throws Exception
	 */
	public function del(Request $request,RoleModel $Role, $id)
	{
		if ($request->isPost()) {
			$role = $Role->find($id);
			$role->delete();

			return success('','删除成功!');
		}

		return error(401);
	}
}