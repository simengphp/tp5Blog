<?php
/**
 * Created by PhpStorm.
 * User: liuyang
 * Date: 2018/9/26
 * Time: 上午9:29
 */
namespace app\website\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    public function _initialize(Request $request = null)
    {
        parent::_initialize($request);
        //
//        $this->_init();
    }

    /**
     * 样式文件相应公共区域加载
     */
    public function _init()
    {
        $request = Request::instance();
//        var_dump($request);
    }
}