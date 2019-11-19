<?php
declare(strict_types=1);
/**
 * 工具: PhpStorm
 * 作者: 孙家浩
 * 邮箱: yulian1024@vip.qq.com
 * 日期: 2019/11/15
 * 时间: 14:10
 * 侵权必究
 */

use think\facade\Route;

Route::any('/', 'Index/index');
Route::any('login','Auth/login');
Route::any('logout','Auth/logout');
