<?php
/**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/27
     * Time: 14:24
     */

namespace app\manager\model;

use app\lib\tools\Upload;
use think\Db;
use think\Request;

class Pic extends Base
{
    protected $autoWriteTimestamp = true;
    protected $tableObj = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->tableObj = Db::name('Pic');
    }

    public function getClassIdAttr($value)
    {
        $classId = [1=>'banner',2=>'公司荣誉',3=>'关于我们'];
        return $classId[$value];
    }

    public function picList($num, $data, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc';
        if (isset($data['search'])) {
            $list=$this->tableObj->where('status', $status)->where('alt', 'like', '%'.trim($data['search'].'%'))->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data])->
            each(function($item, $key)
            {
                $item['class_id'] = $this->getClassIdAttr($item['class_id']);
                return $item;
            });
        } else {
            $list=$this->tableObj->where('status', $status)->order($order)->
            paginate($num)->each(function($item, $key){
                $item['class_id'] = $this->getClassIdAttr($item['class_id']);
                return $item;});;
        }
        return $list;
    }

    public function curdMess(Request $request)
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
            $ret = $this->allowField(true)->where('id', $data['id'])
                ->limit(1)->update($data);
        } else {
            $data['pic'] = $file?$file:'';
            $ret = $this->allowField(true)->save($data);
        }
        return $ret;
    }

    public function delPic($id, $num)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->update(['status'=>$num, 'update_time'=>time()]);
        return $ret;
    }
    public function editOnePic($id)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->find();
        return $ret;
    }
}
