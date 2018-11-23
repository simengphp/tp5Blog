<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/11/20
     * Time: 16:28
     */

namespace app\manager\model;


use think\Db;
use think\Exception;

class PermissionGroup extends Base
{
    public static function getList()
    {
        $list = Db::name('controller_group')->where('status', 0)->
        order('sort', 'asc')->select();
    }

    public static function curdMess($data)
    {
        $ret = Db::name('permission_group')->insert($data);
        return $ret;
    }

    public static function delRolePermission($id)
    {
        if (empty($id)) {
            throw new Exception('异常错误');
        }
        Db::name('permission_group')->where('role_id', $id)->delete();
    }


    public static function getOnePermission($action, $role_id)
    {
        $ret = self::where('role_id', $role_id)->
        where('action_detail', $action)->find();
        return $ret?1:0;
    }
}