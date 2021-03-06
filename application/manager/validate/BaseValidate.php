<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/8/30
     * Time: 15:43
     */

namespace app\manager\validate;

use app\manager\model\Base;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck()
    {
        $allData = Request::instance()->param();
        if ($this->batch()->check($allData) != true) {
            return $this->error;
        }
        return true;
    }

    /**上面和require一起定义的一个函数*/
    public function idMust($value, $rule = '', $data = '', $field = '')
    {
        if (is_numeric($value) && $value) {
            return true;
        } else {
            return $field.'格式错误';
        }
    }

    public function uniqueCommon($value, $table = '', $data = '', $field = '')
    {
        $cloudObj = new Base();
        $is_set = $cloudObj->getOneValidate($table, $field, $value, $data);
        if (!$is_set) {
            return false;
        }
        return true;
    }

    /**判断空值
     * @author crazy
     * @time 2018-09-06
     */
    public function isEmpty($value, $rule = '', $data = '', $field = '')
    {
        if (empty($value)) {
            return false;
        } else {
            return true;
        }
    }

    /**验证用户提交过来的字段是否是我自己定义的
     * @author crazy
     * @time 2018-09-07
     * @param $arr 接受的参数
     * @return array
     */
    public function getDataRule(array $arr)
    {
        $rule_data = $this->rule;
        $newArray = [];
        foreach ($rule_data as $key => $value) {
            $newArray[$key] = $arr[$key];
        }
        return $newArray;
    }
}
