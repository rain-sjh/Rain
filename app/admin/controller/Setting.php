<?php /** @noinspection CallableParameterUseCaseInTypeContextInspection */
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
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\App;
use think\facade\View;
use think\Request;
use think\response\Json;

class Setting
{
	/**
	 * 系统设置
	 * @param Request $request
	 * @param Config $config
	 * @return View|Json|\think\response\View
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
	 * @param Menu $Menu
	 * @return View|\think\response\View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function menu(Menu $Menu)
	{
		$menus = $Menu->order('sort create_time')
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
	 * @return View|Json|\think\response\View
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
	 * @return Json|\think\response\View
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

	/**
	 * 系统优化
	 * @return \think\response\View
	 */
	public function optimization()
	{
		return view('optimization');
	}

	/**
	 * 清理缓存
	 * @param App $app
	 */
	public function flushCache(App $app)
	{
		$runtime = $app->getRootPath() . 'runtime';
		$list = scandir($runtime);
		foreach ($list as $item) {
			if (!in_array($item, ['.', '..', '.gitignore', 'session'])) {
				$this->clear($runtime . '/' . $item . '/');
				rmdir($runtime . '/' . $item);
			}
		}
		return success('', '刷新成功!');
	}

	/**
	 * @param $path
	 */
	private function clear($path){
		//如果是目录则继续
		if(is_dir($path)){
			//扫描一个文件夹内的所有文件夹和文件并返回数组
			$p = scandir($path);
			foreach($p as $val){
				//排除目录中的.和..
				if($val !== '.' && $val !== '..'){
					//如果是目录则递归子目录，继续操作
					if(is_dir($path.$val)){
						//子目录中操作删除文件夹和文件
						$this->clear($path.$val.'/');
						//目录清空后删除空文件夹
						rmdir($path.$val.'/');
					}else{
						//如果是文件直接删除
						unlink($path.$val);
					}
				}
			}
		}
	}
}