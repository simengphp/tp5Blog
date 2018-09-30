<?php
/**
 * Created by PhpStorm.
 * User: liuyang
 * Date: 2018/9/26
 * Time: 上午9:54
 */
use think\Route;

Route::get('web/index', 'website/Menu/index');
Route::get('web/cloud', 'website/Menu/cloudComputing');