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

namespace app\admin\controller;


use app\model\Config;
use app\model\Menu;
use Exception;
use think\Console;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Request;
use think\response\Json;
use think\response\View;

class Setting
{
	/**
	 * 系统设置
	 * @param Request $request
	 * @param Config $config
	 * @return Json|View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function site(Request $request, Config $config)
	{
		$site = $config->find('site');

		if ($request->isPost()) {
			$param = $request->post();
			if (empty($site)) {
				$site = new $config();
				$site->key = 'site';
			}
			$site->content = $param;
			$site->save();

			return success('', '信息保存成功');
		}

		return view('', [
			'site' => $site->content
		]);
	}

	/**
	 * 菜单列表
	 * @param Menu $menu
	 * @return View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function menu(Menu $menu)
	{
		$menus = $menu->order('sort create_time')
			->select();

		$list = [];
		foreach ($menus as $menu) {
			$list[$menu->parent_id][] = $menu;
		}

		return view('', [
			'menus' => $list
		]);
	}

	/**
	 * 添加菜单
	 * @param Menu $menu
	 * @param int $id
	 * @return Json|View
	 */
	public function addMenu(Menu $menu, $id = 0)
	{
		if (request()->isPost()) {
			$param = request()->post();
			$menu->save($param);
			if (empty($menu->id)) {
				return error(403, '保存出错了!');
			}
			return success('', '添加成功!');
		}
		return view('', [
			'id' => $id
		]);
	}

	/**
	 * 修改菜单
	 * @param Menu $menu
	 * @param int $id
	 * @return Json|View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function editMenu(Menu $menu, $id = 0)
	{
		$menu = $menu->find($id);
		if (request()->isPost()) {
			$param = request()->post();
			$menu->save($param);
			if (empty($menu->id)) {
				return error(403, '保存出错了!');
			}
			return success('', '修改成功!');
		}

		return view('', [
			'menu' => $menu
		]);
	}

	/**
	 * 删除菜单
	 * @param Menu $Menu
	 * @param $id
	 * @return Json
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 * @throws Exception
	 */
	public function delMenu(Menu $Menu, $id)
	{
		$menu = $Menu->find($id);
		if (empty($menu)) {
			return error(404, '没有找到!是不是已经删除了?');
		}
		$child = $Menu->getByParentId($menu->id);
		if (empty($child)) {
			$menu->delete();
			return success('', '删除成功!');
		}
		return error(406, '请逐级删除!');
	}

	public function clear(Console $console)
	{
		$a = $console->call('clear', ['--log','--dir'])->fetch();
		dd($a);
	}
}