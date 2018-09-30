<?php
/**
 * Created by PhpStorm.
 * User: liuyang
 * Date: 2018/9/26
 * Time: 上午9:27
 */
namespace app\website\controller;

use think\Request;

class Menu extends Base
{

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
    }


    public function index()
    {
        return $this->fetch('index');
    }


    public function cloudComputing()
    {
        return $this->fetch('cloudComputing');
    }


}