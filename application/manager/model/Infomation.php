<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/27
     * Time: 15:57
     */

namespace app\manager\model;

use app\lib\tools\Upload;
use think\Db;
use think\Request;

class Infomation extends Base
{
    protected $table_obj = null;
    protected $autoWriteTimestamp = true;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->table_obj = Db::name('infomation');
    }

    public function articleList($num = 10, $data = null, $status = 0)
    {
        $order = $status?'update_time desc':'create_time desc,sort asc';
        if (isset($data['search'])) {
            $list = $this->table_obj->where('status', $status)->where('title', 'like', '%'.$data['search'].'%')->order($order)->
            paginate($num, false, ['var_page'=>'p', 'query'=>$data]);
        } else {
            $list = $this->table_obj->where('status', $status)->order($order)->paginate($num);
        }
        return $list;
    }

    /**管理员增加修改通用模型*/
    public function curdArticleMessage(Request $request)
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

    public function editOneArticle($id)
    {
        $ret = $this->table_obj->where('id', $id)->limit(1)->find();
        return $ret;
    }

    public function getOneArticle($value, $data)
    {
        if (isset($data['id'])&&$data['id']>0) {
            $is_set = $this->table_obj->where('status', 0)->where('title', $value)->
            where('id', '<>', $data['id'])->find();
        } else {
            $is_set = $this->table_obj->where('status', 0)->where('title', $value)->find();
        }
        if ($is_set) {
            return false;
        }
        return true;
    }

    public function delArticle($id, $num)
    {
        $ret = $this->table_obj->where('id', $id)->limit(1)->update(['status'=>$num, 'update_time'=>time()]);
        return $ret;
    }
}
