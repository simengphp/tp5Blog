<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\FriendLink;

class FriendMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'name' => 'require|uniqueCommon|token',
        'value' => 'require|uniqueCommon|url',
    ];

    protected $field = [
        'name'  => '友链名称',
        'value'  => '友链值',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $classObj = new FriendLink();
        $is_set = $classObj->getOneLink($value, $data);
        if (!$is_set) {
            return [$value.'已经存在'];
        }
        return true;
    }
}
