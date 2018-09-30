<?php
use think\Route;

Route::any('common/ajaxEditField', 'manager/Base/ajaxEditField');
Route::any('common/commonUpload', 'manager/Base/commonUpload');
/**登录路由*/
Route::any('manager/login', 'manager/Manager/login');
Route::get('manager/loginOut', 'manager/Manager/loginOut');

/**管理员的curd*/
Route::any('index/index', 'manager/Index/index');
Route::any('manager/adminList', 'manager/Admin/adminList');
Route::any('manager/curdAdmin', 'manager/Admin/curdAdmin');
Route::get('manager/restoreDelAdmin', 'manager/Admin/restoreDelAdmin');
Route::any('manager/adminTrash', 'manager/Admin/adminTrash');

/**文章分类相关*/
Route::any('article/classList', 'manager/Article/classList');
Route::any('article/curdClass', 'manager/Article/curdClass');
Route::get('article/restoreDelClass', 'manager/Article/restoreDelClass');
Route::any('article/classTrash', 'manager/Article/classTrash');
/**文章相关*/
Route::any('article/articleList', 'manager/Article/articleList');
Route::any('article/curdArticle', 'manager/Article/curdArticle');
Route::any('article/articleTrash', 'manager/Article/articleTrash');
Route::any('article/restoreDelArticle', 'manager/Article/restoreDelArticle');

/**友链相关*/
Route::any('friend/linkList', 'manager/Friend/linkList');
Route::any('friend/linkTrash', 'manager/Friend/linkTrash');
Route::any('friend/restoreDelLink', 'manager/Friend/restoreDelLink');
Route::any('friend/curdLink', 'manager/Friend/curdLink');

/**导航相关*/
Route::any('nav/navList', 'manager/Nav/navList');
Route::any('nav/navTrash', 'manager/Nav/navTrash');
Route::any('nav/restoreDelNav', 'manager/Nav/restoreDelNav');
Route::any('nav/curdNav', 'manager/Nav/curdNav');


/**招聘相关*/
Route::any('jobs/jobsList', 'manager/Jobs/jobsList');
Route::any('jobs/jobsTrash', 'manager/Jobs/jobsTrash');
Route::any('jobs/restoreDelJobs', 'manager/Jobs/restoreDelJobs');
Route::any('jobs/curdJobs', 'manager/Jobs/curdJobs');

/**留言管理*/
Route::any('message/messageList', 'manager/Message/messageList');
Route::any('message/restoreDelMessage', 'manager/Message/restoreDelMessage');

/**配置管理*/
Route::any('config/curdConfig', 'manager/Config/curdConfig');


/**图片管理*/
Route::any('pic/picList', 'manager/Pic/picList');
Route::any('pic/picTrash', 'manager/Pic/picTrash');
Route::any('pic/restoreDelPic', 'manager/Pic/restoreDelPic');
Route::any('pic/curdPic', 'manager/Pic/curdPic');
