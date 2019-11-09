<?php
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

class Index
{
	public function index(Console $console)
	{
		$system = [
			// 操作系统
			'operating_system' => PHP_OS,
			// 运行环境
			'runtime_environment' => $_SERVER["SERVER_SOFTWARE"],
			// PHP运行方式
			'operation_mode' => php_sapi_name(),
			// ThinkPHP版本
			'thinkphp_version' => $console->call('version')->fetch(),
			//上传附件限制
			'upload_limit' => ini_get('upload_max_filesize'),
			// 执行时间限制
			'execution_time_limit' => ini_get('max_execution_time') . '秒',
			// 服务器时间
			'server_time' => date("Y年n月j日 H:i:s"),
			// 北京时间
			'beijing_time' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
			// 服务器域名/IP
			'server_domain_name' => $_SERVER['SERVER_NAME'] . ' [ ' . gethostbyname($_SERVER['SERVER_NAME']) . ' ]',
			// 剩余空间
			'free_space' => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M'
		];


		return view('index', [
			'system' => $system
		]);
	}

}