<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\Admin;

class AdminMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|token',
        'account' => 'require|uniqueCommon',
        'password' => 'require',
    ];

    protected $field = [
        'name'  => '管理员标签',
        'account'  => '管理员账号',
        'password'  => '管理员密码',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $admin = new Admin();
        $is_set = $admin->getOneAdmin($value, $data);
        if (!$is_set) {
            return ['账号已经存在'];
        }
        return true;
    }
}
