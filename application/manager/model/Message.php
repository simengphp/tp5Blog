<?php
/**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/27
     * Time: 14:24
     */

namespace app\manager\model;

use think\Db;
use think\Request;

class Message extends Base
{
    protected $autoWriteTimestamp = true;
    protected $tableObj = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->tableObj = Db::name('message');
    }

    public function messageList($num, $data, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc';
        if (isset($data['search'])) {
            $list=$this->tableObj->where('status', $status)->where('name|tel|title|email', 'like', '%'.trim($data['search'].'%'))->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data]);
        } else {
            $list=$this->tableObj->where('status', $status)->order($order)->
            paginate($num);
        }
        return $list;
    }

    public function curdMess(Request $request)
    {
        $data = $request->param();
        if (isset($data['id'])&&$data['id']>0) {
            $ret = $this->allowField(true)->limit(1)->update($data);
        } else {
            $ret = $this->allowField(true)->save($data);
        }
        return $ret;
    }

    public function delMessage($id, $num)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->update(['status'=>$num, 'update_time'=>time()]);
        return $ret;
    }
}
