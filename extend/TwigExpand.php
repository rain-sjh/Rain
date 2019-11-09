<?php
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 作者: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 11:18
 * 侵权必究
 */

use Twig\Extension\AbstractExtension;
use Twig\NodeVisitor\NodeVisitorInterface;
use Twig\TokenParser\TokenParserInterface;
use Twig\TwigFunction;
use Twig\TwigFilter;
use Twig\TwigTest;

class TwigExpand extends AbstractExtension
{
	/**
	 * 过滤器 拓展.
	 * @return TwigFilter[]
	 */
	public function getFilters()
	{
		return [
			new TwigFilter('getCity', [$this, 'getCity'])
		];
	}

	/**
	 * 函数 拓展.
	 * @return TwigFunction[]
	 */
	public function getFunctions()
	{
		return [
			new TwigFunction('load', [$this, 'load']),
			new TwigFunction('is_controller', [$this, 'is_controller']),
			new TwigFunction('is_action', [$this, 'is_action']),
			new TwigFunction('avatar', [$this, 'avatar']),
			new TwigFunction('flash', [$this, 'getFlash'], ['is_safe' => ['html','javascript']]),
		];
	}

	/**
	 * Token的解析器 拓展.
	 * @return array|TokenParserInterface[]
	 */
	public function getTokenParsers()
	{
		return [];
	}

	/**
	 * 节点访问器 拓展.
	 * @return array|NodeVisitorInterface[]
	 */
	public function getNodeVisitors()
	{
		return [];
	}

	/**
	 * 测试 拓展.
	 *
	 * @return TwigTest[]
	 */
	public function getTests()
	{
		return [];
	}

	/**
	 * 运算符 拓展.
	 * @return array<array> First array of unary operators, second array of binary operators
	 */
	public function getOperators()
	{
		return [];
	}

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
	 * 是否是当前控制器
	 * @param string $name
	 * @param string $select
	 * @return string
	 */
	public function is_controller($name = '', $select = '')
	{
		if (strtolower(Request()->controller()) == strtolower($name)) {
			return $select;
		}
		return '';
	}

	/**
	 * 是否是当前方法
	 * @param string $name
	 * @param string $select
	 * @return string
	 */
	public function is_action($name = '', $select = '')
	{
		if (strtolower(Request()->action()) == strtolower($name)) {
			return $select;
		}
		return '';
	}

	/**
	 * 用户头像
	 * @param string $path
	 * @param int $gender
	 * @return string
	 */
	public function avatar($path = '', $gender = 0)
	{
		if (strtolower(substr($path, 0, 4)) != 'http') {
			if (file_exists(public_path('/public/uploads/') . $path) && !empty($path)) {
				$path = '/uploads/' . $path;
			} else {
				if (empty($gender)) {
					$path = '/static/rain/image/Unknown.jpg';
				} elseif ($gender == 1) {
					$path = '/static/rain/image/male.png';
				} elseif ($gender == 2) {
					$path = '/static/rain/image/female.png';
				}
			}
		}
		return $path;
	}

	/**
	 * 解析IP
	 * @param string $ip
	 * @return mixed|string
	 */
	public function getCity($ip = '')
	{
		$res = '未知';
		if (!empty($ip)) {
			$data = getCity($ip);
			if ($data['isp_id'] == 'local') {
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
	public function getFlash()
	{
		$tips = session('tips');
		if ($tips) {
			$tips = json_decode($tips, true);
			return "$(function () {
			        layui.use('layer', function () {
			            let layer = layui.layer;
			            $.msg('{$tips['msg']}', '{$tips['icon']}');
			        });
				});";
		}
		return false;
	}
}
