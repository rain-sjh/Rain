<?php
declare(strict_types=1);

// 应用公共文件
use think\response\Json;

/**
 * 接口成功返回
 * @param mixed $data
 * @param mixed $msg
 * @return Json
 */
function success($data = [], $msg = '请求成功!')
{
	if (is_string($data)) {
		$msg = $data;
	}
	return json([
		'code' => 200,
		'msg' => $msg,
		'data' => $data
	]);
}

/**
 * 接口错误返回
 * @param $code
 * @param string $msg
 * @return Json
 */
function error($code, $msg = '')
{
	$list = [
		401 => '请求方式错误!',
		402 => '操作不当!',
		403 => '意外,未知的错误!',
		404 => '请求资源不存在!',
		405 => '验证码错误或已过期!',
		406 => '参数错误!',
		407 => '登录过期,请重新登录!',
		500 => '服务器不可用!'
	];

	if (empty($msg)) {
		$msg = empty($list[$code]) ? '未知错误!' : $list[$code];
	}

	return json([
		'code' => $code,
		'msg' => $msg
	]);
}

/**
 * token 加密
 * @param $str
 * @return bool|false|string
 */
function token_encrypt($str)
{
	return base64_encode(XXTEA::encrypt($str, get_ip()));
}

/**
 * token 解密
 * @param $str
 * @return bool|false|string
 */
function token_decrypt($str)
{
	return XXTEA::decrypt(base64_decode($str), get_ip());
}

/**
 * 获取用户真实 IP
 */
function get_ip()
{
	if (isset($_SERVER)) {
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		} else {
			$ip = $_SERVER['REMOTE_ADDR'];
		}
	} elseif (getenv('HTTP_X_FORWARDED_FOR')) {
		$ip = getenv('HTTP_X_FORWARDED_FOR');
	} elseif (getenv('HTTP_CLIENT_IP')) {
		$ip = getenv('HTTP_CLIENT_IP');
	} else {
		$ip = getenv('REMOTE_ADDR');
	}
	return $ip;
}

/**
 * 获取 IP  地理位置
 * 淘宝IP接口
 * @Return: array
 * @param string $ip
 * @return array|bool|mixed
 */
function get_city($ip = '')
{
	$data = cache($ip);
	if (empty($data)) {
		if ($ip === '') {
			$url = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json';
			$res = json_decode(file_get_contents($url), true);
			$data = $res;
		} else {
			$url = 'http://ip.taobao.com/service/getIpInfo.php?ip=' . $ip;
			$res = json_decode(file_get_contents($url), true);
			if ((string)$res['code'] === '1') {
				return false;
			}
			$data = $res['data'];
		}
		cache($ip, $data);
	}
	return $data;
}