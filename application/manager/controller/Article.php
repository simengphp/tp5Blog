<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/27
     * Time: 11:29
     */

namespace app\manager\controller;

use app\manager\model\ClassName;
use app\manager\model\Infomation;
use app\manager\validate\ArticleMustValidate;
use app\manager\validate\ClassMustValidate;
use think\Request;

class Article extends Base
{
    protected $articleModel = null;
    protected $infoModel = null;
    public function _initialize()
    {
        $this->articleModel = new ClassName();
        $this->infoModel = new Infomation();
        return parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function classList(Request $request)
    {
        $data = $request->param();
        $list = $this->articleModel->classList(12, $data);
        $this->assign('list', $list);
        return $this->fetch('classList', ['top_name'=>'文章分类列表', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }

    public function curdClass(Request $request)
    {
        if ($request->isPost()) {
            $data = $request->param();
            $_SESSION['think']['__token__'] = $data['__token__'];
            $errorData = (new ClassMustValidate())->goCheck();
            if ($errorData !== true) {
                return redirect('/article/curdClass', [], 500, ['error'=>$errorData,'data' => $data]);
            }
            /**处理数据*/
            $ret = $this->articleModel->curdMess($request);
            if ($ret) {
                $this->success(isset($data['id'])&&$data['id']>0?'修改成功':'添加成功', '/article/classList', [], 1);
            } else {
                return redirect('/article/curdClass', [], 500, ['error'=>[isset($data['id'])&&$data['id']
                    ?'修改失败':'添加失败'],'data' => $data]);
            }
        } else {
            $data = $request->param();
            if ($data) {
                $ret = $this->articleModel->editOneClass($data['id']);
            } else {
                $ret['id'] = 0;
                $ret['class_name'] = '';
                $ret['sort'] = '';
            }
            return $this->fetch('curdClass', ['top_name'=>'文章分类列表', 'version'=>'1.0', 'ret'=>$ret]);
        }
    }


    public function classTrash(Request $request)
    {
        $data = $request->param();
        $list = $this->articleModel->classList(12, $data, 9);
        $this->assign('list', $list);
        return $this->fetch('classList', ['top_name'=>'文章分类回收站', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }

    public function restoreDelClass(Request $request)
    {
        $data = $request->param();
        $status = $data['status'];
        $id = $data['id'];
        $ret = $this->articleModel->delClass($id, $status);
        if ($ret) {
            $this->success($status?'删除成功':'还原成功', '/article/classList', [], 1);
        } else {
            $this->error($status?'删除失败':'还原失败', '/article/classList', [], 1);
        }
    }


    /********************文章操作开始**************************/

    public function articleList(Request $request)
    {
        $data = $request->param();
        $list = $this->infoModel->articleList(2, $data);
        $this->assign('list', $list);
        return $this->fetch('articleList', ['top_name'=>'文章列表', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }

    public function curdArticle(Request $request)
    {
        if ($request->isPost()) {
            $data = $request->param();
            $_SESSION['think']['__token__'] = $data['__token__'];
            $errorData = (new ArticleMustValidate())->goCheck();
            //halt($data);
            if ($errorData !== true) {
                return redirect('/article/curdArticle', [], 500, ['error' => $errorData, 'data' => $data]);
            }
            /**处理数据*/
            $ret = $this->infoModel->curdArticleMessage($request);
            if ($ret) {
                $this->success(isset($data['id']) && $data['id'] > 0 ? '修改成功' : '添加成功', '/article/articleList', [], 1);
            } else {
                return redirect('/article/curdArticle', [], 500, ['error' => [isset($data['id']) && $data['id']
                    ? '修改失败' : '添加失败'], 'data' => $data]);
            }
        } else {
            $data = $request->param();
            if ($data) {
                $ret = $this->infoModel->editOneArticle($data['id']);
            } else {
                $ret['id'] = 0;
                $ret['pic'] = '';
                $ret['title'] = '';
                $ret['content'] = '';
                $ret['desc'] = '';
                $ret['author'] = '';
                $ret['look'] = '';
                $ret['sort'] = '';
                $ret['key'] = '';
                $ret['class_id'] = '';
            }
            $ret['class_list'] = $this->articleModel->classList(50, $data);
            return $this->fetch('curdArticle', ['top_name' => '添加文章', 'version' => '1.0', 'ret'=>$ret]);
        }
    }

    public function articleTrash(Request $request)
    {
        $data = $request->param();
        $list = $this->infoModel->articleList(2, $data, 9);
        $this->assign('list', $list);
        return $this->fetch('articleList', ['top_name'=>'文章回收站', 'version'=>'1.0', 'search'=>
            $data?$data:['search'=>'']]);
    }


    public function restoreDelArticle(Request $request)
    {
        $data = $request->param();
        $status = $data['status'];
        $id = $data['id'];
        $ret = $this->infoModel->delArticle($id, $status);
        if ($ret) {
            $this->success($status?'删除成功':'还原成功', '/article/articleList', [], 1);
        } else {
            $this->error($status?'删除失败':'还原失败', '/article/articleList', [], 1);
        }
    }
}
