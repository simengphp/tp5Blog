<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\ClassName;

class ClassMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'class_name' => 'require|uniqueCommon|token',
    ];

    protected $field = [
        'class_name'  => '分类',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $classObj = new ClassName();
        $is_set = $classObj->getOneClass($value, $data);
        if (!$is_set) {
            return ['分类名已经存在'];
        }
        return true;
    }
}
