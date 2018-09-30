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

class FriendLink extends Base
{
    protected $autoWriteTimestamp = true;
    protected $tableObj = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->tableObj = Db::name('friend_link');
    }

    public function linkList($num, $data, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc,sort asc';
        if (isset($data['search'])) {
            $list=$this->tableObj->where('status', $status)->where('name|value', 'like', '%'.trim($data['search'].'%'))->order($order)->
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
            unset($data['__token__']);
            $ret = $this->allowField(false)->limit(1)->update($data);
        } else {
            $ret = $this->allowField(true)->save($data);
        }
        return $ret;
    }

    public function getOneLink($value, $data)
    {
        if (isset($data['id'])&&$data['id']>0) {
            $is_set = $this->tableObj->where('status', 0)->where('name|value', $value)->
            where('id', '<>', $data['id'])->find();
        } else {
            $is_set = $this->tableObj->where('status', 0)->where('name|value', $value)->find();
        }
        if ($is_set) {
            return false;
        }
        return true;
    }

    public function delLink($id, $num)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->update(['status'=>$num, 'update_time'=>time()]);
        return $ret;
    }
    public function editOneLink($id)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->find();
        return $ret;
    }
}
