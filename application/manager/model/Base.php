<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 10:55
     */

namespace app\manager\model;

use think\Db;
use think\Model;

class Base extends Model
{

    public function editFieldBase($table, $id, $field, $val)
    {
        $ret = Db::name($table)->where('id', $id)->limit(1)->update([$field=>$val, 'update_time'=>time()]);
        return $ret;
    }
}
