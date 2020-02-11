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


use app\model\Menu;
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
	public function list(RoleModel $Role): View
	{
		$role = $Role->select();

		return view('list', [
			'role' => $role
		]);

	}

	/**
	 * 添加角色
	 * @param Request $request
	 * @param RoleModel $Role
	 * @return Json|View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function add(Request $request, RoleModel $Role)
	{
		if ($request->isPost()) {
			$param = $request->post();

			$param = $this->roleRule($Role, $param);

			$Role->save($param);

			return success('', '添加完成!');
		}
		return view('add');
	}

	/**
	 * 编辑角色
	 * @param Request $request
	 * @param RoleModel $Role
	 * @param $id
	 * @return Json|View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function edit(Request $request, RoleModel $Role, $id = '')
	{
		if ($request->isPost()) {
			$param = $request->post();
			$param = $this->roleRule($Role, $param);
			$role = $Role->find($param['id']);
			$role->save($param);

			return success('', '修改成功!');
		}

		$role = $Role->find($id);

		if (empty($role)) {
			return error(404, '没有找到这个角色!');
		}

		return view('edit', [
			'role' => $role
		]);
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
	public function del(Request $request, RoleModel $Role, $id): Json
	{
		if ($request->isPost()) {
			$role = $Role->find($id);
			$role->delete();

			return success('', '删除成功!');
		}

		return error(401);
	}

	/**
	 * 权限管理
	 * @param Request $request
	 * @param RoleModel $Role
	 * @param Menu $Menu
	 * @param $id
	 * @return View
	 */
	public function rule(Request $request, RoleModel $Role, Menu $Menu, $id)
	{
		$list = [];
		$menus = $Menu->where('parent_id', 0)
			->order('sort')
			->column('id,name,icon,parent_id,is_del,is_hide', 'id');
		if (!empty($menus)) {
			foreach ($menus as $menu) {
				$children = [];

				$list[] = [
					'id' => $menu['id'],
					'title' => $menu['name'],
					'children' => $children,
				];
			}
//			dd($list);
		}

		return view('rule', [

		]);
	}

	/**
	 * 获取列表
	 * @param Menu $Menu
	 * @param int $id
	 * @return array
	 */
	private function getParent(Menu $Menu, $id = 0)
	{
		$menus = $Menu->where('parent_id', 0)
			->order('sort')
			->column('id,name,icon,parent_id,is_del,is_hide', 'id');
		$list = [];
		if (!empty($menus)) {
			foreach ($menus as $menu) {
				$list[] = [
					'id' => $menu['id'],
					'title' => $menu['name'],
					'children' => [],
				];
			}
		}
		return $list;
	}

	/**
	 * 角色命名规则
	 * @param RoleModel $Role
	 * @param $param
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	private function roleRule(RoleModel $Role, $param)
	{
		$param['code'] = strtoupper($param['code']);

		if (!substr($param['code'], 0, 5) === 'ROLE_') {
			return error(402, '请按规范定义角色代码!')->send();
		}

		$condition = [];
		if (!empty($param['id'])) {
			$condition[] = ['id', '<>', $param['id']];
		}

		$role = $Role
			->whereOr([[
				['name', '=', $param['name']],
				['code', '=', $param['code']]
			]])
			->where($condition)
			->find();

		if (!empty($role)) {
			return error(402, '注意,名称或代码已存在!')->send();
		}

		return $param;
	}
}