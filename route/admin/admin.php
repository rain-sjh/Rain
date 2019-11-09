<?php

use think\facade\Route;

// 后台
Route::any('','Index/index');

// 通知
Route::group('notice', function () {
	Route::get('add','Notice/add');
	Route::get('list','Notice/list');
});

// 用户
Route::group('user', function () {
	Route::get('add','User/add');
	Route::any('edit','User/edit');
	Route::get('status','User/status');
	Route::get('list','User/list');
});

Route::group('role', function () {
	Route::get('list','User/roleList');
});

Route::group('setting', function () {
	Route::get('site','Setting/site');
});

Route::miss(function() {
	return '404 Not Found!';
});
