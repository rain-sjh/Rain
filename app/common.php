<?php
// 应用公共文件

function success($data = [], $msg = '请求成功!')
{
	return json([
		'code' => 200,
		'msg' => $msg,
		'data' => $data
	]);
}

function error($code, $msg = '')
{
	$list = [
		401 => '请求方式错误!',
		403 => '意外,未知的错误!',
		404 => '请求资源不存在!',
		405 => '验证码错误或已过期!',
		406 => '参数错误!',
		407 => '登录过期,请重新登录!',
		500 => '服务器不可用!'
	];
	return json([
		'code' => $code,
		'msg' => $msg ? $msg : (empty($list[$code]) ? '未知错误!' : $list[$code])
	]);
}

function token_encrypt($str)
{
	$token = XXTEA::encrypt($str, getIP());
	$token = base64_encode($token);
	return $token;
}

function token_decrypt($str)
{
	$str = base64_decode($str);
	$token = XXTEA::decrypt($str, getIP());
	return $token;
}

/**
 * 获取用户真实 IP
 */
function getIP()
{
	static $ip;
	if (isset($_SERVER)) {
		if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
			$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
		} else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
			$ip = $_SERVER["HTTP_CLIENT_IP"];
		} else {
			$ip = $_SERVER["REMOTE_ADDR"];
		}
	} else {
		if (getenv("HTTP_X_FORWARDED_FOR")) {
			$ip = getenv("HTTP_X_FORWARDED_FOR");
		} else if (getenv("HTTP_CLIENT_IP")) {
			$ip = getenv("HTTP_CLIENT_IP");
		} else {
			$ip = getenv("REMOTE_ADDR");
		}
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
function getCity($ip = '')
{
	if ($ip == '') {
		$url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
		$ip = json_decode(file_get_contents($url), true);
		$data = $ip;
	} else {
		$url = "http://ip.taobao.com/service/getIpInfo.php?ip=" . $ip;
		$ip = json_decode(file_get_contents($url));
		if ((string)$ip->code == '1') {
			return false;
		}
		$data = (array)$ip->data;
	}

	return $data;
}