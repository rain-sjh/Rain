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

namespace app\middleware;


use app\model\Config;
use app\model\Menu;
use app\model\User;
use Closure;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use app\Request;
use think\response\Json;

class Role
{
	/**
	 * 放行名单
	 * @var array
	 */
	protected $allow = [
		'home' => [
			'',
			'login',
			'captcha',
			'Index/index'
		],
		'common' => [
			'Upload/image'
		]
	];
	private $user;
	private $menus;
	private $config;

	/**
	 * 初始化
	 * @param Request $request
	 * @param Closure $next
	 * @return mixed
	 * @throws DataNotFoundException
	 * @throws DbException
	 * @throws ModelNotFoundException
	 */
	public function handle(Request $request, Closure $next)
	{
		$this->verifyToken();
		$this->verifyWhitelist();
		$this->getConfig();
		$request->userInfo = $this->user;
		$request->menuInfo = $this->menus;
		$request->configInfo = $this->config;
		return $next($request);
	}

	/**
	 * 验证TOKEN 并返回 用户信息
	 */
	private function verifyToken()
	{
		// 当cookie存在token信息则自动登录
		if (!empty(cookie('token'))) {
			session('token', cookie('token'));
		}
		// 读取token
		$token = session('token');
		if ($token) {
			// 读取用户信息
			$user = new User();
			$this->user = $user->where('token', $token)
				->field('id,avatar,nickname,username,gender,token')
				->find();
		}
	}

	/**
	 * 登录权限管理
	 */
	private function verifyWhitelist()
	{
		// 当前应用
		$app = app('http')->getName();
		// 当前控制器
		$path = request()->pathinfo();
		// 白名单
		$allow = $this->allow[$app] ?? [];
		// 不在白名单,验证登录身份
		if (empty($this->user) && !in_array($path, $allow, true)) {
			// 设置session标记完成
			session('complete', true);
			if (request()->isAjax()) {
				return error(407);
			}
			return redirect('/login')->remember()->send();
		}

		$Menu = new Menu();

		$menus = $Menu->order('sort create_time')
			->select()->toArray();

		foreach ($menus as $item) {
			if (empty($item['parent_id'])) {
				if (empty($item['path'])) {
					$tabs = $Menu->order('sort create_time')->getByParentId($item['id']);

					if (!empty($tabs)) {
						if (empty($tabs->path)) {
							$tabs = $Menu->order('sort create_time')
								->getByParentId($tabs->id);
						}
						$item['path'] = $tabs->path ?? '';
					}

				}
				$this->menus['menu'][] = $item;
			}
		}

		$default_app = \think\facade\Config::get('app.default_app');

		if ($default_app !== $app) {
			$default_path = '/' . $app;
		} else {
			$default_path = '/';
		}

		$path = request()->pathinfo() ?: $default_path;

		$menu = $Menu->getByPath($path);
		if (!empty($menu->parent_id)) {
			$parent = $Menu->getById($menu['parent_id']);
			if (empty($parent['parent_id'])) {
				$tab = $parent['id'];
			} else {
				$tab = $parent['parent_id'];
			}
			foreach ($menus as $item) {
				if ($item['parent_id'] === $tab) {
					$this->menus['tabs'][$item['id']] = $item;
					foreach ($menus as $i) {
						if ($i['parent_id'] === $item['id']) {
							$this->menus['tabs'][$item['id']]['data'][] = $i;
						}
					}
				}
			}
		}
	}

	/**
	 *  获取系统配置
	 */
	private function getConfig()
	{
		$config = new Config();
		$config = $config->column('content', 'key');

		foreach ($config as &$item) {
			$item = json_decode($item, true);
		}
		unset($item);
		$this->config = $config;
	}
}
