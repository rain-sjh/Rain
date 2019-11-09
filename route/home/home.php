<?php

use think\facade\Route;

Route::any('/', 'Index/index');
Route::any('login','Auth/login');
Route::any('logout','Auth/logout');
