/*
 Navicat Premium Data Transfer

 Source Server         : swat
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 30/09/2018 10:14:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zan_admin
-- ----------------------------
DROP TABLE IF EXISTS `zan_admin`;
CREATE TABLE `zan_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '操作者备注名称',
  `account` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `last_login_time` int(10) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '头像地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常 9删除',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_admin
-- ----------------------------
INSERT INTO `zan_admin` VALUES (10, '超级管理员', 'admin', 'c6d8e5b18624f32bc940706294e0eb8d', 1538267949, '20180926\\98d5cdffa103d0cd7e380ffe0ac8f56f.png', 0, 1537954423, 1537954423);
INSERT INTO `zan_admin` VALUES (41, 'd', '1', '48e81464369d200a1cddca8082a6d077', 0, '', 9, 1538128075, 1538128078);

-- ----------------------------
-- Table structure for zan_class
-- ----------------------------
DROP TABLE IF EXISTS `zan_class`;
CREATE TABLE `zan_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站文章的分类' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of zan_class
-- ----------------------------
INSERT INTO `zan_class` VALUES (1, '测', 1, 0, 1538031965, 1538034527);
INSERT INTO `zan_class` VALUES (2, '测1', 1, 0, 1538032004, 1538098486);
INSERT INTO `zan_class` VALUES (3, '对对对', 2, 0, 1538032976, 1538032976);
INSERT INTO `zan_class` VALUES (4, '大师傅', 3, 0, 1538032984, 1538033394);
INSERT INTO `zan_class` VALUES (5, '的1', 2, 0, 1538033037, 1538098981);
INSERT INTO `zan_class` VALUES (6, '大1', 1, 0, 1538033110, 1538127839);
INSERT INTO `zan_class` VALUES (7, '大23', 1, 0, 1538033117, 1538127843);
INSERT INTO `zan_class` VALUES (8, '顶顶顶顶12', 1, 0, 1538034956, 1538126509);
INSERT INTO `zan_class` VALUES (9, '对对对122', 1, 0, 1538034968, 1538213114);

-- ----------------------------
-- Table structure for zan_config
-- ----------------------------
DROP TABLE IF EXISTS `zan_config`;
CREATE TABLE `zan_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网站的标题',
  `keys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网站的关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网站的描述',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `stock` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '赞普股票代码',
  `tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `postcode` varbinary(255) NOT NULL DEFAULT '' COMMENT '公司邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司地址',
  `website_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网站备案信息',
  `company_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关于我们',
  `culture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业文化',
  `contact_me` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系我们',
  `resources` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人才理念',
  `ben` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '福利待遇',
  `timeline` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '招聘流程',
  `status` tinyint(255) NOT NULL DEFAULT 0,
  `create_time` int(10) NULL DEFAULT 0,
  `update_time` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站相关配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_config
-- ----------------------------
INSERT INTO `zan_config` VALUES (1, '天津赞普', '', '', '赞普', '8888', '022-525555', 0x7A616E7075403136332E636F6D, '天津南开华苑', '津88888', '<p><img alt=\"\" src=\"/uploads/20180929/e7d97d14d283754597fcad9bdf6d5663.png\" style=\"height:65px; width:192px\" /></p>\r\n\r\n<p>关于我们</p>\r\n', '<p>公司文化</p>\r\n', '<p>联系我们</p>\r\n', '<p>测算</p>\r\n', '<p>测算</p>\r\n', '<p>手册</p>\r\n', 0, 0, 0);

-- ----------------------------
-- Table structure for zan_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `zan_friend_link`;
CREATE TABLE `zan_friend_link`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `sort` tinyint(4) NOT NULL COMMENT '友链的排序',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NULL DEFAULT 0,
  `update_time` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_friend_link
-- ----------------------------
INSERT INTO `zan_friend_link` VALUES (1, '1', '1', 0, 0, 1538101070, 1538101070);
INSERT INTO `zan_friend_link` VALUES (2, '的1', 'http://www.simengphp.com1', 0, 0, 1538101490, 1538101882);
INSERT INTO `zan_friend_link` VALUES (3, 'd', 'http://www.simengphp.com', 0, 0, 1538102078, 1538102078);
INSERT INTO `zan_friend_link` VALUES (4, 'd1', 'http://www.simengphp.com11', 2, 0, 1538102100, 1538126226);
INSERT INTO `zan_friend_link` VALUES (5, '的', 'http://www.simengphp.coml', 2, 0, 1538102556, 1538126234);
INSERT INTO `zan_friend_link` VALUES (6, '超级管理员1221', 'http://www.simengphp.com1100', 8, 9, 1538103585, 1538213128);

-- ----------------------------
-- Table structure for zan_icloud_attr
-- ----------------------------
DROP TABLE IF EXISTS `zan_icloud_attr`;
CREATE TABLE `zan_icloud_attr`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '云服务器属性表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zan_infomation
-- ----------------------------
DROP TABLE IF EXISTS `zan_infomation`;
CREATE TABLE `zan_infomation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章封面图',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章描述',
  `author` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站作者',
  `look` int(255) NOT NULL DEFAULT 0 COMMENT '文章浏览量',
  `sort` tinyint(4) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站关键词',
  `class_id` int(11) NOT NULL COMMENT '网站分类的id',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的资讯信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_infomation
-- ----------------------------
INSERT INTO `zan_infomation` VALUES (1, '', '猜猜猜', '<p>1</p>\r\n', '1', '11', 0, 1, '1', 9, 0, 1538042359, 1538126886);
INSERT INTO `zan_infomation` VALUES (2, '20180928\\46c75f2dd53dfbb20bdc90e2fc7fe0a8.jpg', '人', '<p>llkjl撒发生的</p>\r\n', ' 哈哈哈哈', '12', 1, 1, '12', 5, 0, 1538042397, 1538126880);
INSERT INTO `zan_infomation` VALUES (3, '', '大师傅', '<p>1212</p>\r\n', '     12', '1', 1, 1, '1', 8, 0, 1538096835, 1538096835);
INSERT INTO `zan_infomation` VALUES (4, '', '人1', '<p>1212</p>\r\n', '     ', 'admin', 123, 2, '12', 5, 0, 1538096922, 1538126516);
INSERT INTO `zan_infomation` VALUES (5, '20180928\\2603b9862b221e883ce1f0b064e407a4.png', '人111', '<p>12</p>\r\n', '的', '刘柱', 121, 2, '12', 4, 0, 1538097000, 1538126514);
INSERT INTO `zan_infomation` VALUES (6, '', '1', '<p><img alt=\"\" src=\"/uploads/20180929/03d4a2bf718e9f5cadd57f25f3aefd9b.png\" style=\"height:273px; width:300px\" /></p>\r\n', '等等', '1', 1, 2, '打的费', 9, 9, 1538204013, 1538213119);

-- ----------------------------
-- Table structure for zan_jobs
-- ----------------------------
DROP TABLE IF EXISTS `zan_jobs`;
CREATE TABLE `zan_jobs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `num` int(11) UNSIGNED NOT NULL COMMENT '岗位编号-排序',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `jobs_num` tinyint(4) NOT NULL COMMENT '招聘人数',
  `jobs_status` tinyint(1) NOT NULL COMMENT '1招满  0招聘中',
  `company_size` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司规模',
  `company_nature` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司性质',
  `company_tmt` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司行业',
  `work_exp` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作经验',
  `edu` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最低学历',
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '薪资待遇',
  `job_nature` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作性质',
  `man_exp` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理经验',
  `job_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位描述',
  `job_require` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任职要求',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常 9删除',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站招聘' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_jobs
-- ----------------------------
INSERT INTO `zan_jobs` VALUES (1, 1, 'PHP工程师', 12, 1, '11', '1', '1', '13', '大专', '1000', '1', '1', '<p>的</p>\r\n', '<p>1</p>\r\n', 0, 1538185569, 1538186350);
INSERT INTO `zan_jobs` VALUES (2, 2, '电话销售专员', 12, 0, '100', '民营', '计算机', '1', '1', '1', '11', '1', '<h2><img alt=\"\" src=\"/uploads/20180929/249f9096c03c6398cf25eadbf42835ee.png\" style=\"height:273px; width:300px\" /></h2>\r\n\r\n<h2>职位描述</h2>\r\n\r\n<p>1. 通过电话进行产品销售，与外部销售人员合作完成各项销售指标；</p>\r\n\r\n<p>2.&nbsp;通过电话沟通了解客户需求, 寻求销售机会并完成销售业绩；</p>\r\n\r\n<p>3.&nbsp;开发新客户，拓展与老客户的业务，建立和维护客户档案；</p>\r\n\r\n<p>4.&nbsp;协调公司内部资源，提高客户满意度；</p>\r\n\r\n<p>5.&nbsp;收集和分析市场数据，并定期反馈最新信息。</p>\r\n', '<p><strong>任职要求</strong></p>\r\n\r\n<p>1.&nbsp;市场营销专业优先，20-35岁；</p>\r\n\r\n<p>2.&nbsp;善于沟通，语言表达能力强;逻辑思维能力强；</p>\r\n\r\n<p>3.&nbsp;对工作认真负责，执行能力强，具有团队协作精神;能够承受较强的工作压力。</p>\r\n\r\n<p><strong><strong>联系方式：</strong></strong><br />\r\n公司名称：天津赞普科技股份有限公司<br />\r\n邮箱：suwl@zanpu.com<br />\r\n公司地址：天津市华苑榕苑路2号海益国际4号楼3层<br />\r\n公司主页：http://www.zanpu.com</p>\r\n', 9, 1538186646, 1538213144);

-- ----------------------------
-- Table structure for zan_message
-- ----------------------------
DROP TABLE IF EXISTS `zan_message`;
CREATE TABLE `zan_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言者姓名',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言人电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言人的电话',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言标题',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言内容',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的留言板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_message
-- ----------------------------
INSERT INTO `zan_message` VALUES (1, '等等', '18522713541', '476319748@qq.com', '的', '的', 0, 0, 1538205584);

-- ----------------------------
-- Table structure for zan_navigate
-- ----------------------------
DROP TABLE IF EXISTS `zan_navigate`;
CREATE TABLE `zan_navigate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导航栏名称',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导航的连接地址',
  `p_id` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',
  `sort` int(255) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常 9删除',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站导航栏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_navigate
-- ----------------------------
INSERT INTO `zan_navigate` VALUES (1, '首页', 'http://www.simengphp.com', 0, 1, 0, 1538113152, 1538123290);
INSERT INTO `zan_navigate` VALUES (2, '产品服务', 'http://www.simengphp.com1', 0, 2, 0, 1538113473, 1538123783);
INSERT INTO `zan_navigate` VALUES (3, '数据中心', 'http://www.simengphp.com12', 0, 1, 0, 1538113489, 1538126182);
INSERT INTO `zan_navigate` VALUES (4, '云计算', 'http://www.simengphp.com33', 2, 2, 9, 1538113515, 1538213138);
INSERT INTO `zan_navigate` VALUES (5, 'CDN', 'http://www.simengphp.comm', 2, 1, 0, 1538116244, 1538126195);
INSERT INTO `zan_navigate` VALUES (6, '赞普海逸机房', 'http://www.simengphp.com1111', 3, 3, 0, 1538116273, 1538123833);

-- ----------------------------
-- Table structure for zan_pic
-- ----------------------------
DROP TABLE IF EXISTS `zan_pic`;
CREATE TABLE `zan_pic`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `class_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类的id\r\n1、banner\r\n2、公司荣誉\r\n3、关于我们\r\n',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '9删除 0正常',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_pic
-- ----------------------------
INSERT INTO `zan_pic` VALUES (1, 'alt1', '20180928\\2603b9862b221e883ce1f0b064e407a4.png', 2, 0, 1538271092, 1538271092);
INSERT INTO `zan_pic` VALUES (2, 'alt11', '20180930\\003c360baab9b2b1d23be1b7f2676e4c.png', 2, 0, 1538273182, 1538273182);

SET FOREIGN_KEY_CHECKS = 1;
