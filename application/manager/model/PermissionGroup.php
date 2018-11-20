<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/11/20
     * Time: 16:28
     */

namespace app\manager\model;


use think\Db;

class PermissionGroup extends Base
{
    public static function getList()
    {
        $list = Db::name('controller_group')->where('status', 0)->
        order('sort', 'asc')->select();
    }
}