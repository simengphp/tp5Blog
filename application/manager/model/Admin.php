<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/26
     * Time: 10:55
     */

namespace app\manager\model;

use app\lib\tools\Upload;
use think\Db;
use think\Request;
use think\Session;

class Admin extends Base
{

    protected $autoWriteTimestamp = true;
    protected $admin = null;
    public function __construct($data = [])
    {
        $this->admin = Db::name('admin');
        parent::__construct($data);
    }

    public function getAdmin(Request $request)
    {
        $data = $request->param();
        $account = $data['account'];
        $password = md5(md5($data['password'].config('setting.salt')));
        $is_account = $this->admin->where('account', '=', $account)->
        where('status', '<>', '9')->find();
        if (!$is_account) {
            return ['code'=>404, 'error'=>'账号不存在'];
        }
        $is_true = $this->admin->where("account", '=', $account)
            ->where("password", '=', $password)->
            where('status', '<>', '9')->find();
        if (!$is_true) {
            return ['code'=>404, 'error'=>'账号密码错误'];
        }
        /**设置登录信息*/
        $this->admin->where("account", '=', $account)
            ->where("password", '=', $password)->update(['last_login_time'=>time()]);
        /**设置信息*/
        Session::set('manager_id', $is_true['id']);
        Session::set('manager_account', $is_true['account']);
        Session::set('manager_name', $is_true['name']);
        Session::set('manager_last_login_time', $is_true['last_login_time']);
        Session::set('manager_pic', $is_true['pic']);
        Session::set('admin_role_id', $is_true['role_id']);

        return ['code'=>200, 'success'=>'登录成功'];
    }

    /**管理员增加修改通用模型*/
    public function curdAdminMessage(Request $request)
    {
        // 过滤post数组中的非数据表字段数据
        $data = $request->param();
        /**头像*/
        $upload = new Upload();
        $file = $upload->uploadImage($request, 'pic');
        if (isset($data['id']) && $data['id']>0) {
            unset($data['__token__']);
            if ($file) {
                $data['pic'] = $file?$file:'';
            }
            $ret = $this->allowField(['name','account','pic'])->where('id', $data['id'])
                ->limit(1)->update($data);
        } else {
            $data['pic'] = $file?$file:'';
            $data['password'] = md5(md5($data['password'].config('setting.salt')));
            $ret = $this->allowField(true)->save($data);
        }
        return $ret;
    }


    /**获取一个信息，用户验证账号是否存在，用于rule的自定义规则*/
    public function getOneAdmin($account, $data)
    {
        if (isset($data['id']) && $data['id']>0) {
            $is_account = $this->admin->where('account', '=', $account)->
            where('status', '<>', '9')->where('id', 'neq', $data['id'])->find();
        } else {
            $is_account = $this->admin->where('account', '=', $account)->
            where('status', '<>', '9')->find();
        }
        if ($is_account) {
            return false;
        }
        return true;
    }

    /**修改获取信息展示*/
    public function editOneAdmin($id)
    {
        $is_account = $this->admin->where('id', $id)->find();
        return $is_account;
    }

    /**列表*/
    public function listMess($num, $data, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc';
        if (isset($data['search'])) {
            $list = $this->admin->where('status', $status)->
            where('name|account', 'like', '%'.trim($data['search']).'%')->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data]);
        } else {
            // 查询管理员数据 并且每页显示数据
            $list = $this->admin->where('status', $status)->order($order)->paginate($num);
        }
        return $list;
    }

    /**列表*/
//    public function listMessTrash($num, $data)
//    {
//        if (isset($data['search'])) {
//            $list = $this->admin->where('status', 9)->
//            where('name|account', '%'.trim($data['search']).'%')->order('update_time desc')->
//            paginate($num, false, ['var_page'=>'p', 'query'=>$data]);
//        } else {
//            // 查询管理员数据 并且每页显示数据
//            $list = $this->admin->where('status', 9)->order('update_time desc')->paginate($num);
//        }
//        return $list;
//    }

    /**删除*/
    public function delAdmin($id, $data)
    {
        $ret = $this->admin->where("id", $id)->limit(1)->update(['status'=>$data, 'update_time'=>time()]);
        return $ret;
    }
}
