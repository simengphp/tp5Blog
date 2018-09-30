<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\Navigate;

class NavMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|uniqueCommon|token',
        'link' => 'require|uniqueCommon|url',
    ];

    protected $field = [
        'name'  => '导航名称',
        'value'  => '链接',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $classObj = new Navigate();
        $is_set = $classObj->getOneNav($value, $data);
        if (!$is_set) {
            return [$value.'已经存在'];
        }
        return true;
    }
}
