<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/25
     * Time: 15:35
     */

namespace app\manager\controller;

use app\manager\model\Admin;
use think\Request;

class Manager extends Base
{

    public function login(Request $request)
    {
        if ($request->isPost()) {
            $data = $request->param();
            /**获取登录信息*/
            $admin = new Admin();
            $modelData = $admin->getAdmin($request);
            if ($modelData['code'] == 200) {
                return redirect('/index/index', [], 200, ['success'=>'']);
            }
            return redirect('/manager/login', [], $modelData['code'], ['error'=>$modelData['error'],'data' => $data]);
        } else {
            return $this->fetch('login');
        }
    }

    /**退出操作*/
    public function loginOut()
    {
        session(null);
        return $this->fetch('login');
    }
}
