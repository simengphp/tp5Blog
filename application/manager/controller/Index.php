<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 11:23
     */

namespace app\manager\controller;

class Index extends Base
{
    public function index()
    {
        return $this->fetch('index', ['top_name'=>'首页', 'version'=>'1.0']);
    }
}
