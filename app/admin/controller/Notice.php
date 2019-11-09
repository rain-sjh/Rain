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


use app\model\Notice as NoticeAlias;
use think\Request;

class Notice
{
	public function list(NoticeAlias $notice)
	{
		$notice = $notice->order('create_time desc')->paginate(4);

		$data = view('list', [
			'list' => $notice
		])->getContent();

		return success([
			'list' => $data,
			'lastPage' => $notice->lastPage()
		]);
	}

	public function add(Request $request, NoticeAlias $notice)
	{
		if ($request->isPost()) {
			$param = $request->post();
			if (empty($param)) {
				return error(404);
			}
			$notice->save($param);
			return success(false, '公告发布成功!');
		}

		return view();
	}

}
