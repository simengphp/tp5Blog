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

    public function getTime($time)
    {
        list($startTime, $endTime) = explode('-', $time);
        $startTime = strtotime($startTime);
        $endTime = strtotime(trim($endTime));
        $data['start'] = $startTime;
        $data['end'] = $endTime;
        //halt($data);
        return $data;
    }

    public function getOneValidate($tableObj, $field, $value, $data)
    {
        if (isset($data['id'])&&$data['id']>0) {
            $is_set = Db::name($tableObj)->where('status', 0)->where($field, $value)->
            where('id', '<>', $data['id'])->find();
        } else {
            $is_set = Db::name($tableObj)->where('status', 0)->where($field, $value)->find();
        }
        if ($is_set) {
            return false;
        }
        return true;
    }
}
