<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 15:49
     */

namespace app\manager\validate;

use app\manager\model\Jobs;

class JobsMustValidate extends BaseValidate
{
    /**在Validate这个类里面已经定义了这个属性，我们直接重写*/
    protected $rule = [
        'num' => 'require|uniqueCommon|token',
        'title' => 'require|uniqueCommon',
        'jobs_num' => 'require',
        'company_size' => 'require',
        'company_nature' => 'require',
        'company_tmt' => 'require',
        'jobs_status' => 'require',
        'work_exp' => 'require',
        'edu' => 'require',
        'salary' => 'require',
        'man_exp' => 'require',
        'job_nature' => 'require',
        'job_desc' => 'require',
        'job_require' => 'require',
    ];

    protected $field = [
        'num'  => '岗位编号',
        'title'  => '岗位名称',
        'jobs_num'  => '招聘人数',
        'company_size' => '公司规模',
        'company_nature' => '公司性质',
        'company_tmt' => '公司行业',
        'work_exp' => '工作年限',
        'edu' => '最低学历',
        'salary' => '薪资',
        'man_exp' => '管理经验',
        'job_nature' => '工作性质',
        'job_require'  => '任职要求',
        'job_desc'  => '职位描述',
    ];

    public function uniqueCommon($value, $rule = '', $data = '', $field = '')
    {
        $classObj = new Jobs();
        $is_set = $classObj->getOneJobs($value, $data);
        if (!$is_set) {
            return [$value.'已经存在'];
        }
        return true;
    }
}
