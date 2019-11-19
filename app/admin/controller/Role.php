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
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\response\View;

class Role
{

	/**
	 * @param RoleModel $Role
	 * @return View
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function list(RoleModel $Role)
	{
		$role = $Role->select();

		return view('',[
			'role' => $role
		]);

	}
}