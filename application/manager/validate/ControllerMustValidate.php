<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

class ControllerMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|uniqueCommon:controller_group|token',
        'value' => 'require|uniqueCommon:controller_group',
    ];

    protected $field = [
        'name'  => '控制器名称',
    ];
    protected $message = [
        'name.uniqueCommon' =>  '控制器名称已经存在',
        'value.uniqueCommon' =>  '控制器值已经存在',
    ];
}
