<?php

use think\facade\Route;

Route::group('upload',function () {
	Route::any('image','Upload/image');
});
