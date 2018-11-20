<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/25
 * Time: 15:34
 */

namespace app\manager\controller;

use app\lib\tools\Upload;
use think\Controller;
use app\manager\model\Base as baseModel;
use think\Db;
use think\Request;

class Base extends Controller
{
    public function _initialize()
    {
        $request = Request::instance();
        $this->assign('action', $request->action());
        $this->assign('controller', $request->controller());
        $this->assign('top_name', 'cms');
        $this->assign('version', '1.0');
        if (!session('manager_id') && $request->action() != 'login') {
            $this->redirect('/manager/login');
        }
        $this->getRoleAction(session('admin_role_id'));
    }


    public function getRoleAction($admin_role_id)
    {
        $list = Db::query("SELECT DISTINCT(controller) FROM `zan_permission_group` 
        where role_id = {$admin_role_id}");
        foreach ($list as $key => $value) {
            $list[$key]['menu_title'] = Db::name('permission_group')->
            where('controller', $value['controller'])->limit(1)->column('menu_title')[0];
            $list[$key]['action_list'] = Db::name('permission_group')->
            where('controller', $value['controller'])->select();
            $list[$key]['menu_count'] = count($list[$key]['action_list']);
        }
        $this->assign('menu_list', $list);
    }

    public function ajaxEditField(Request $request)
    {
        $data = $request->param();
        $field= $data['field'];
        $value = $data['value'];
        $id = $data['id'];
        $table = $data['table'];
        try {
            $ret = (new baseModel())->editFieldBase($table, $id, $field, $value);
        } catch (\Exception $exception) {
            $ret = false;
        }
        if ($ret) {
            return true;
        } else {
            return false;
        }
    }

    public function commonUpload(Request $request)
    {
        /**头像*/
        $upload = new Upload();
        $file = $upload->uploadImageEdit($request, 'upload');
        $fileName = '/uploads/'.date('Ymd').'/'.$file;
        $this->mkHtml(1, $fileName, '上传成功');
    }

    //输出js调用
    public function mkHtml($fn, $fileurl, $message)
    {
        $str="<script>window.parent.CKEDITOR.tools.callFunction($fn,'".$fileurl."','".$message."')</script>";
        exit($str);
    }
}
