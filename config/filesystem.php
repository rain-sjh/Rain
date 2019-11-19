<?php

use think\facade\Env;

return [
    // 默认磁盘
    'default' => Env::get('filesystem.driver', 'local'),
    // 磁盘列表
    'disks'   => [
        'local'  => [
            'type' => 'local',
            'root' => public_path('public') . 'upload',
        ],
        'public' => [
            // 磁盘类型
            'type'       => 'local',
            // 磁盘路径
            'root'       => public_path('public') . 'upload',
        ],
        // 更多的磁盘配置信息
    ],
];
