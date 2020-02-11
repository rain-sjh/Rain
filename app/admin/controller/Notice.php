<?php
/** @noinspection CallableParameterUseCaseInTypeContextInspection */
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


use app\model\Notice as NoticeAlias;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Request;
use think\response\Json;
use think\response\View;

class Notice
{
	/**
	 * 公共列表
	 * @param NoticeAlias $notice
	 * @return Json
	 * @throws DbException
	 * @noinspection CallableParameterUseCaseInTypeContextInspection
	 */
	public function list(NoticeAlias $notice): Json
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

	/**
	 * 添加公告
	 * @param Request $request
	 * @param NoticeAlias $notice
	 * @return Json|View
	 */
	public function add(Request $request, NoticeAlias $notice)
	{
		if ($request->isPost()) {
			$param = $request->post();
			if (empty($param)) {
				return error(404);
			}
			$notice->save($param);
			return success($notice, '公告发布成功!');
		}

		return view();
	}

	/**
	 * 修改公告
	 * @param Request $request
	 * @param NoticeAlias $notice
	 * @param $id
	 * @return Json|View
	 * @throws DbException
	 * @throws DataNotFoundException
	 * @throws ModelNotFoundException
	 */
	public function edit(Request $request, NoticeAlias $notice, $id)
	{
		$notice = $notice->find($id);
		if ($request->isPost()) {
			$param = $request->post();
			if (empty($param)) {
				return error(404);
			}
			$notice->save($param);
			return success($notice, '保存成功!');
		}

		return view('', [
			'notice' => $notice
		]);
	}

	/**
	 * 删除公告
	 * @param Request $request
	 * @param NoticeAlias $notice
	 * @param $id
	 * @return Json
	 */
	public function del(Request $request, NoticeAlias $notice, $id)
	{
		if ($request->isDelete()) {
			if ($notice::destroy($id)) {
				return success('删除成功!');
			}
			return error(403, '删除失败,请重试!');
		}
		return error(401);
	}

}
