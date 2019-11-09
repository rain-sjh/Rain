<?php
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 作者: yulian1024@vip.qq.com
 * 日期: 2019/11/9
 * 时间: 11:18
 * 侵权必究
 */

namespace app\common\controller;

use app\model\File;
use think\Exception;
use think\Filesystem;

class Upload
{
	public function image(Filesystem $filesystem)
	{
		// 获取表单上传文件
		$files = request()->file();
		if (empty($files)) {
			return error(406, '没有发现文件!');
		}
		try {
			$param = [];
			foreach ($files as $file) {
				$path = $filesystem->disk('public')->putFile('/', $file);
				$param[] = [
					'name' => $file->getOriginalName(),
					'path' => $path,
					'size' => $file->getSize(),
					'type' => $file->getType(),
				];
			}
			$file = new File();
			$file->saveAll($param);

			return success($param);
		} catch (Exception $e) {
			return error(403, $e->getMessage());
		}
	}
}