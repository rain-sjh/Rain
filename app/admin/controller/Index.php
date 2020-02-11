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


use think\Console;
use think\Request;
use think\response\View;

class Index
{
	/**
	 * 控制台
	 * @param Request $request
	 * @param Console $console
	 * @return View
	 */
	public function index(Request $request, Console $console)
	{
		$system = [
			// 系统名称
			'system_name' => [
				'title' => '系统名称',
				'name' => '雨点 后台管理系统'
			],
			// 作者
			'author_name' => [
				'title' => '作者姓名',
				'name' => '孙家浩',
			],
			// 运行系统
			'operating_system' => [
				'title' => '运行系统',
				'name' => PHP_OS
			],
			// 运行环境
			'runtime_environment' => [
				'title' => '运行环境',
				'name' => $request->server('SERVER_SOFTWARE')
			],
			// PHP运行方式
			'operation_mode' => [
				'title' => '运行方式',
				'name' => PHP_SAPI
			],
			// 剩余空间
			'free_space' => [
				'title' => '剩余空间',
				'name' => round((disk_free_space('.') / (1024 * 1024)), 2) . 'M'
			],
			// 北京时间
			'beijing_time' => [
				'title' => '北京时间',
				'name' => gmdate('Y年n月j日 H:i:s', time() + 8 * 3600)
			],
			// 服务器时间
			'server_time' => [
				'title' => '服务器时间',
				'name' => date('Y年n月j日 H:i:s')
			],
			//上传附件限制
			'upload_limit' => [
				'title' => '上传附件限制',
				'name' => ini_get('upload_max_filesize')
			],
			// 执行时间限制
			'execution_time_limit' => [
				'title' => '执行时间限制',
				'name' => ini_get('max_execution_time') . '秒'
			],
			// 服务器域名/IP
			'server_domain_name' => [
				'title' => '服务器域名/IP',
				'name' => $request->server('SERVER_NAME') . ' [ ' . gethostbyname($request->server('SERVER_NAME')) . ' ]'
			],
			// ThinkPHP版本
			'thinkphp_version' => [
				'title' => 'ThinkPHP版本',
				'name' => $console->call('version')->fetch()
			],
		];

		return view('index', [
			'system' => $system
		]);
	}
}