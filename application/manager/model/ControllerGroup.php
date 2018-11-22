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

class ControllerGroup extends Base
{
    protected $table = 'zan_controller_group';
    protected $autoWriteTimestamp = true;
    protected $tableObj = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->tableObj = Db::name('controller_group');
    }

    public function controllerList($num, $data, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc,sort asc';
        if (isset($data['search'])) {
            $list=$this->tableObj->where('status', $status)->where('name', 'like', '%'.trim($data['search'].'%'))->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data]);
        } else {
            $list=$this->tableObj->where('status', $status)->order($order)->
            paginate($num);
        }
        return $list;
    }

    public function controllerListShow()
    {
        $order = 'create_time desc,sort asc';
        $list=$this->tableObj->where('status', 0)->order($order)->select();
        return $list;
    }

    public function curdMess(Request $request)
    {
        $data = $request->param();
        if (isset($data['id'])&&$data['id']>0) {
            unset($data['__token__']);
            $ret = $this->allowField(true)->limit(1)->update($data);
        } else {
            $ret = $this->allowField(true)->save($data);
        }
        return $ret;
    }

    public function delController($id, $num)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->update(['status'=>$num, 'update_time'=>time()]);
        return $ret;
    }
    public function editOneController($id)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->find();
        return $ret;
    }
}
