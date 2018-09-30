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

class Navigate extends Base
{
    protected $autoWriteTimestamp = true;
    protected $tableObj = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->tableObj = Db::name('navigate');
    }

    public function navList($num, $data, $status = 0)
    {
        $order = $status?'f.update_time desc':'f.create_time desc,f.sort asc';
        if (isset($data['search']) && !empty($data['search'])) {
            $list=$this->tableObj->alias('f')->where('f.status', $status)->
            where('f.name', 'like', '%'.trim($data['search'].'%'))->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data])->
            each(function($item, $key) use ($status)
            {
                $item['child_menu'] = $this->getChildNav($status, $item['id']);
                return $item;
            });
        } else {
            $list=$this->tableObj->alias('f')->where('f.status', $status)->where('p_id', 0)->order($order)->paginate($num)
            ->each(function($item, $key) use ($status)
            {
                $item['child_menu'] = $this->getChildNav($status, $item['id']);
                return $item;
            });
        }
        //halt($this->getLastSql());
        return $list;
    }

    public function navListTrash($num, $data, $status = 0)
    {
        $order = $status?'f.update_time desc':'f.create_time desc,f.sort asc';
        if (isset($data['search'])) {
            $list=$this->tableObj->alias('f')->where('f.status', $status)->
            where('f.name', 'like', '%'.trim($data['search'].'%'))->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data])->
            each(function($item, $key) use ($status)
            {
                $item['child_menu'] = [];
                return $item;
            });
        } else {
            $list=$this->tableObj->alias('f')->where('f.status', $status)->order($order)->paginate($num)
                ->each(function($item, $key) use ($status)
                {
                    $item['child_menu'] = [];
                    return $item;
                });
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

    public function getOneNav($value, $data)
    {
        if (isset($data['id'])&&$data['id']>0) {
            $is_set = $this->tableObj->where('status', 0)->where('name', $value)->
            where('id', '<>', $data['id'])->find();
        } else {
            $is_set = $this->tableObj->where('status', 0)->where('name', $value)->find();
        }
        if ($is_set) {
            return false;
        }
        return true;
    }

    public function editFieldNav($id, $field, $val)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->update([$field=>$val, 'update_time'=>time()]);
        return $ret;
    }
    public function editOneNav($id)
    {
        $ret = $this->tableObj->where('id', $id)->limit(1)->find();
        return $ret;
    }

    public function getChildNav($status, $p_id = 0)
    {
        $ret = $this->tableObj->where('p_id', $p_id)->where('status', $status)->select();
        return $ret;
    }
}
