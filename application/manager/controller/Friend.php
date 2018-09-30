<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/27
     * Time: 11:29
     */

namespace app\manager\controller;

use app\manager\model\FriendLink;
use app\manager\validate\FriendMustValidate;
use think\Request;

class Friend extends Base
{
    protected $linkModel = null;
    public function _initialize()
    {
        $this->linkModel = new FriendLink();
        return parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function linkList(Request $request)
    {
        $data = $request->param();
        $list = $this->linkModel->linkList(2, $data);
        $this->assign('list', $list);
        return $this->fetch('linkList', ['top_name'=>'友情链接', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }

    public function curdLink(Request $request)
    {
        if ($request->isPost()) {
            $data = $request->param();
            $_SESSION['think']['__token__'] = $data['__token__'];
            $errorData = (new FriendMustValidate())->goCheck();
            if ($errorData !== true) {
                return redirect('/friend/curdLink', [], 500, ['error'=>$errorData,'data' => $data]);
            }
            /**处理数据*/
            $ret = $this->linkModel->curdMess($request);
            if ($ret) {
                $this->success(isset($data['id'])&&$data['id']>0?'修改成功':'添加成功', '/friend/linkList', [], 1);
            } else {
                return redirect('/friend/curdLink', [], 500, ['error'=>[isset($data['id'])&&$data['id']
                    ?'修改失败':'添加失败'],'data' => $data]);
            }
        } else {
            $data = $request->param();
            if ($data) {
                $ret = $this->linkModel->editOneLink($data['id']);
            } else {
                $ret['id'] = 0;
                $ret['name'] = '';
                $ret['value'] = '';
                $ret['sort'] = '';
            }
            return $this->fetch('curdLink', ['top_name'=>'友链列表', 'version'=>'1.0', 'ret'=>$ret]);
        }
    }


    public function linkTrash(Request $request)
    {
        $data = $request->param();
        $list = $this->linkModel->linkList(12, $data, 9);
        $this->assign('list', $list);
        return $this->fetch('linkList', ['top_name'=>'友链列表回收站', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }

    public function restoreDelLink(Request $request)
    {
        $data = $request->param();
        $status = $data['status'];
        $id = $data['id'];
        $ret = $this->linkModel->delLink($id, $status);
        if ($ret) {
            $this->success($status?'删除成功':'还原成功', '/friend/linkList', [], 1);
        } else {
            $this->error($status?'删除失败':'还原失败', '/friend/linkList', [], 1);
        }
    }
}
