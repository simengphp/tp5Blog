<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

class ActionMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|uniqueCommon:action_group|token',
        'action' => 'require|uniqueCommon:action_group',
        'controller_id' => 'require',
    ];

    protected $field = [
        'name'  => '控制器名称',
    ];
    protected $message = [
        'name.uniqueCommon' =>  '方法名称已经存在',
        'action.uniqueCommon' =>  '方法值已经存在',
    ];
}
