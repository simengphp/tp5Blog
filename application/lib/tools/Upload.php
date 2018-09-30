<?php
    /**
     * Created by PhpStorm.
     * User: Administrator
     * Date: 2018/9/5
     * Time: 9:12
     */

namespace app\lib\tools;

use think\Request;

class Upload
{
    /**单个图片上传
     * @author crazy
     * @time 2018-09-05
     * @param request 请求类
     */
    public function uploadImage(Request $request, $file_name)
    {
        $file = $request->file($file_name);
        if ($file) {
            $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if ($info) {
                // 成功上传后 获取上传信息
                // 输出 jpg
                //return $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                return $info->getSaveName();
//                // 输出 42a79759f284b767dfcb2a0197904287.jpg
//                echo $info->getFilename();
            } else {
                // 上传失败获取错误信息
                return $file->getError();
            }
        }
    }

    /**单个图片上传
     * @author crazy
     * @time 2018-09-05
     * @param request 请求类
     */
    public function uploadImageEdit(Request $request, $file_name)
    {
        $file = $request->file($file_name);
        if ($file) {
            $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if ($info) {
                // 成功上传后 获取上传信息
                // 输出 jpg
                //return $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
//                return $info->getSaveName();
//                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                return $info->getFilename();
            } else {
                // 上传失败获取错误信息
                return $file->getError();
            }
        }
    }

    /**多图上传
     * @author crazy
     * @time 2018-09-05
     * @param request 请求类
     */
    public function uploadImageMore(Request $request, $file_name)
    {
        // 获取表单上传文件
        $files = $request->file($file_name);
        foreach ($files as $file) {
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size'=>15678,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if ($info) {
                // 成功上传后 获取上传信息
                // 输出 jpg
                echo $info->getExtension();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getFilename();
            } else {
                // 上传失败获取错误信息
                echo $file->getError();
                return;
            }
        }
    }
}
