<?php
declare(strict_types=1);
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 邮箱: yulian1024@vip.qq.com
 * 日期: 2019/11/12
 * 时间: 13:36
 * 侵权必究
 */

namespace app\model;


use think\Model;

/**
 * @method getByParentId($id)
 * @method getByPath($id)
 * @method getById($id)
 */
class Menu extends Model
{
	/**
	 * 根据路径获取父级id
	 * @param $path
	 * @return string |null
	 */
	public function getParentIdByPath($path)
	{
		$menu = new Menu();
		$menu = $menu->getByPath($path);
		if (empty($menu)) {
			return '';
		} else {
			return $menu['parent_id'];
		}
	}

	/**
	 * 根据路径获取父级
	 * @param $path
	 * @return mixed
	 */
	public function getParentByPath($path)
	{
		$menu = new Menu();
		$id = $menu->getParentIdByPath($path);

		return $menu->getById($id);
	}
}