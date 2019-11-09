<?php
// 全局中间件定义文件
use think\middleware\AllowCrossDomain;
use think\middleware\SessionInit;

return [
    // 跨域请求支持
     AllowCrossDomain::class,
    // 全局请求缓存
    // \think\middleware\CheckRequestCache::class,
    // 多语言加载
    // \think\middleware\LoadLangPack::class,
    // Session初始化
     SessionInit::class,
    // 表单令牌
//     \think\middleware\FormTokenCheck::class
];
