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

use app\model\Menu;
use think\facade\Config;
use Twig\Extension\AbstractExtension;
use Twig\NodeVisitor\NodeVisitorInterface;
use Twig\TokenParser\TokenParserInterface;
use Twig\TwigFunction;
use Twig\TwigFilter;
use Twig\TwigTest;

class TwigExpand extends AbstractExtension
{
	/**
	 * 返回要添加到现有列表的过滤器列表.
	 *
	 * @return TwigFilter[]
	 */
	public function getFilters()
	{
		return [
			new TwigFilter('city', [$this, 'city'])
		];
	}

	/**
	 * 返回要添加到现有列表的函数列表.
	 *
	 * @return TwigFunction[]
	 */
	public function getFunctions()
	{
		return [
			new TwigFunction('load', [$this, 'load']),
			new TwigFunction('active', [$this, 'active'], ['is_safe' => ['html', 'javascript']]),
			new TwigFunction('image', [$this, 'image']),
			new TwigFunction('avatar', [$this, 'avatar']),
			new TwigFunction('flash', [$this, 'flash'], ['is_safe' => ['html', 'javascript']]),
			new TwigFunction('config', [$this, 'config']),
			new TwigFunction('menus', [$this, 'menus']),
			new TwigFunction('user', [$this, 'user']),
		];
	}

	/**
	 * 返回令牌解析器实例以添加到现有列表.
	 *
	 * @return TokenParserInterface[]
	 */
//	public function getTokenParsers()
//	{
//		return [];
//	}

	/**
	 * 返回要添加到现有列表的节点访问者实例.
	 *
	 * @return NodeVisitorInterface[]
	 */
//	public function getNodeVisitors()
//	{
//		return [];
//	}

	/**
	 * 返回要添加到现有列表的测试列表.
	 *
	 * @return TwigTest[]
	 */
//	public function getTests()
//	{
//		return [];
//	}

	/**
	 * 返回要添加到现有列表的运算符列表.
	 *
	 * @return array<array> First array of unary operators, second array of binary operators
	 */
//	public function getOperators()
//	{
//		return [];
//	}

	/**
	 * 资源加载,基于static目录
	 * @param string $path
	 * @return string
	 */
	public function load($path = '')
	{

		$path = '/static/' . $path;

		return $path;
	}


	/**
	 * 是否活跃
	 * @param string $id
	 * @param string $select
	 * @return string
	 */
	public function active($id = '', $select = '')
	{
		$Menu = new Menu();
		$app = app('http')->getName();
		$default_app = Config::get('app.default_app');
		if ($default_app !== $app) {
			$default_path = '/' . $app;
		} else {
			$default_path = '/';
		}
		$path = request()->pathinfo() ?: $default_path;
		$menu = $Menu->getByPath($path);
		if (!empty($menu) && in_array($id, [$menu->id, $menu->parent_id], false)) {
			return $select;
		}

		$menu = $Menu->getById($menu->parent_id);
		if (!empty($menu) && in_array($id, [$menu->id, $menu->parent_id], false)) {
			return $select;
		}
		return '';
	}

	/**
	 * 图片处理
	 * @param string $path
	 * @param string $default
	 * @param string $base
	 * @return string
	 */
	public function image($path = '', $default = '/static/rain/image/default.png', $base = '')
	{
		if (empty($path)) {
			$path = $default;
		} else {
			$path = $base . $path;
		}
		return $path;
	}

	/**
	 * 用户头像
	 * @param string $path
	 * @param int $gender
	 * @return string
	 */
	public function avatar($path = '', $gender = 0)
	{
		if (stripos($path, 'http') !== 0) {
			if (!empty($path) && file_exists(public_path('/public/upload/') . $path)) {
				$path = '/upload/' . $path;
			} elseif (empty($gender)) {
				$path = '/static/rain/image/unknown.jpg';
			} elseif ($gender === 1) {
				$path = '/static/rain/image/male.png';
			} elseif ($gender === 2) {
				$path = '/static/rain/image/female.png';
			}
		}
		return $path;
	}

	/**
	 * 解析IP
	 * @param string $ip
	 * @return mixed|string
	 */
	public function city($ip = '')
	{
		$res = '未知';
		if (!empty($ip)) {
			$data = get_city($ip);
			if ($data['isp_id'] === 'local') {
				$res = $data['isp'];
			} else {
				$res = $data['country'] . $data['area'] . $data['region'] . $data['city'] . $data['county'] . $data['isp'];
			}
		}
		return $res;
	}

	/**
	 * 调起闪存信息
	 * @return bool|string
	 */
	public function flash()
	{
		$tips = session('tips');
		if ($tips) {
			$tips = json_decode($tips, true);
			return "$.Flash('{$tips['msg']}', '{$tips['icon']}');";
		}
		return false;
	}

	/**
	 * 获取系统配置
	 * @param $key
	 * @return mixed
	 */
	public function config($key)
	{
		$config = request()->configInfo;

		return $config[$key] ?? null;
	}

	/**
	 * 获取菜单配置
	 * @param $name
	 * @return string |null
	 */
	public function menus($name)
	{
		$menus = request()->menuInfo;
		return $menus[$name] ?? null;
	}

	/**
	 * 获取登录用户信息
	 * @param $name
	 * @return string |null
	 */
	public function user($name)
	{
		$user = request()->userInfo;

		return $user[$name] ?? null;
	}
}
