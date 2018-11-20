<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

class RoleMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|uniqueCommon:role|token',
    ];

    protected $field = [
        'name'  => '角色名称',
    ];
    protected $message = [
        'name.uniqueCommon' =>  '角色已经存在',
    ];
}
