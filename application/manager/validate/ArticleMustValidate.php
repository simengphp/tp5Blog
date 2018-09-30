<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\ClassName;
use app\manager\model\Infomation;

class ArticleMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'title' => 'require|uniqueCommon|token',
        'content' => 'require',
        'desc' => 'require',
        'key' => 'require',
        'class_id' => 'require',
    ];

    protected $field = [
        'title'  => '文章标题',
        'content'  => '文章内容',
        'desc'  => '文章描述',
        'key'  => '文章关键词',
        'class_id'  => '文章分类',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $classObj = new Infomation();
        $is_set = $classObj->getOneArticle($value, $data);
        if (!$is_set) {
            return ['文章标题已经存在'];
        }
        return true;
    }
}
