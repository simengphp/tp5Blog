/*
 Navicat Premium Data Transfer

 Source Server         : loaclhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 26/11/2018 08:36:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zan_action_group
-- ----------------------------
DROP TABLE IF EXISTS `zan_action_group`;
CREATE TABLE `zan_action_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `controller_id` int(11) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '方法名称 action_group' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_action_group
-- ----------------------------
INSERT INTO `zan_action_group` VALUES (1, '友链列表', '/friend/linkList', 2, 0, 1, 1542684978, 1542685002);
INSERT INTO `zan_action_group` VALUES (2, '友链回收站', '/friend/linkTrash', 2, 0, 2, 1542934032, 1542934032);
INSERT INTO `zan_action_group` VALUES (3, '文章分类', '/article/classList', 1, 0, 1, 1542934052, 1542934052);
INSERT INTO `zan_action_group` VALUES (4, '文章列表', '/article/articleList', 1, 0, 2, 1542934073, 1542934073);
INSERT INTO `zan_action_group` VALUES (5, '管理员列表', '/manager/adminList', 3, 0, 1, 1542940855, 1542940855);
INSERT INTO `zan_action_group` VALUES (6, '管理员回收站', '/manager/adminTrash', 3, 0, 2, 1542940880, 1542940880);
INSERT INTO `zan_action_group` VALUES (7, '控制器列表', '/manager/controllerList', 3, 0, 3, 1542940897, 1542940897);
INSERT INTO `zan_action_group` VALUES (8, '方法列表', '/manager/actionList', 3, 0, 4, 1542940910, 1542940910);
INSERT INTO `zan_action_group` VALUES (9, '角色列表', '/manager/roleList', 3, 0, 5, 1542940923, 1542940923);

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
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常 9删除',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_admin
-- ----------------------------
INSERT INTO `zan_admin` VALUES (10, '超级管理员', 'admin', 'c6d8e5b18624f32bc940706294e0eb8d', 1542933578, '20181008\\28c4e013e359e49dc1935da77d8a0a40.png', 1, 0, 1537954423, 1537954423);
INSERT INTO `zan_admin` VALUES (42, '管理员1', 'admin1', '1', 1539134825, '', NULL, 0, 0, 1539338154);
INSERT INTO `zan_admin` VALUES (43, '刘柱', 'admin11', 'fc580f8e5ecbc7a3b169940d3824c883', 0, '', NULL, 0, 1539334108, 1539565218);
INSERT INTO `zan_admin` VALUES (41, '管理员', '1', '48e81464369d200a1cddca8082a6d077', 1539046622, '', NULL, 0, 1538128075, 1539746779);

-- ----------------------------
-- Table structure for zan_attr
-- ----------------------------
DROP TABLE IF EXISTS `zan_attr`;
CREATE TABLE `zan_attr`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `i_id` int(11) NOT NULL DEFAULT 0 COMMENT '大属性的id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务器属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_attr
-- ----------------------------
INSERT INTO `zan_attr` VALUES (1, 2, '', 'windows', 0, 1, 1538967582, 1538968245);
INSERT INTO `zan_attr` VALUES (2, 2, '', 'linux', 0, 2, 1538967771, 1538968934);
INSERT INTO `zan_attr` VALUES (3, 2, '', 'unbantu', 0, 3, 1538968765, 1538969155);
INSERT INTO `zan_attr` VALUES (4, 2, '', 'unbantu4', 0, 4, 1538968809, 1539566256);
INSERT INTO `zan_attr` VALUES (5, 3, '', '1M', 0, 1, 1538969423, 1538969423);
INSERT INTO `zan_attr` VALUES (6, 3, '', '2M', 0, 2, 1538969430, 1538969430);
INSERT INTO `zan_attr` VALUES (7, 3, '', '3M', 0, 3, 1538969437, 1538969437);
INSERT INTO `zan_attr` VALUES (8, 3, '', '4M', 0, 4, 1538969444, 1538969444);
INSERT INTO `zan_attr` VALUES (9, 4, '1个月', '1', 0, 1, 1538969464, 1538969464);
INSERT INTO `zan_attr` VALUES (10, 4, '2个月', '2', 0, 2, 1538969470, 1538969470);
INSERT INTO `zan_attr` VALUES (11, 4, '3个月', '3', 0, 3, 1538969475, 1538969475);
INSERT INTO `zan_attr` VALUES (12, 1, '', '1核1G', 0, 1, 1538969806, 1538969806);
INSERT INTO `zan_attr` VALUES (13, 1, '', '1核2G', 0, 2, 1538969820, 1538969820);
INSERT INTO `zan_attr` VALUES (14, 1, '', '2核1G', 0, 3, 1538969833, 1538969838);
INSERT INTO `zan_attr` VALUES (15, 1, '', '2核2G', 0, 4, 1538969851, 1538969851);
INSERT INTO `zan_attr` VALUES (16, 4, '', '4', 0, 0, 1539219545, 1539219545);
INSERT INTO `zan_attr` VALUES (17, 4, '', '5', 0, 0, 1539219955, 1539566277);
INSERT INTO `zan_attr` VALUES (18, 4, '', '6', 0, 0, 1539219965, 1539566277);

-- ----------------------------
-- Table structure for zan_class
-- ----------------------------
DROP TABLE IF EXISTS `zan_class`;
CREATE TABLE `zan_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_index` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示在首页默认不显示 1显示 0不显示',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站文章的分类' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of zan_class
-- ----------------------------
INSERT INTO `zan_class` VALUES (1, '测', 1, 0, 9, 1538031965, 1539593302);
INSERT INTO `zan_class` VALUES (2, '测1', 1, 1, 9, 1538032004, 1539593302);
INSERT INTO `zan_class` VALUES (3, '对对对', 2, 0, 9, 1538032976, 1539565741);
INSERT INTO `zan_class` VALUES (4, '大师傅', 3, 0, 9, 1538032984, 1539565741);
INSERT INTO `zan_class` VALUES (5, '的1', 2, 0, 9, 1538033037, 1539565741);
INSERT INTO `zan_class` VALUES (6, '大1', 1, 0, 9, 1538033110, 1539565741);
INSERT INTO `zan_class` VALUES (7, '大23', 1, 0, 9, 1538033117, 1539565741);
INSERT INTO `zan_class` VALUES (8, '顶顶顶顶12', 1, 0, 9, 1538034956, 1539565741);
INSERT INTO `zan_class` VALUES (9, '对对对122', 1, 0, 9, 1538034968, 1539565741);
INSERT INTO `zan_class` VALUES (10, 'd', 0, 0, 9, 1538964025, 1539565741);
INSERT INTO `zan_class` VALUES (11, 'd111', 0, 0, 9, 1539220014, 1539565741);
INSERT INTO `zan_class` VALUES (12, 'ddddsdfadsf', 1, 0, 9, 1539331067, 1539565741);
INSERT INTO `zan_class` VALUES (13, '12dasf', 12, 0, 9, 1539331073, 1539565741);
INSERT INTO `zan_class` VALUES (14, 'asfasfd', 12, 0, 9, 1539331083, 1539565741);
INSERT INTO `zan_class` VALUES (15, 'sadfa12', 12, 0, 9, 1539331088, 1539565741);
INSERT INTO `zan_class` VALUES (16, '1212', 11, 0, 9, 1539331104, 1539565741);
INSERT INTO `zan_class` VALUES (17, '测11', 1111133, 0, 9, 1539331171, 1539565741);
INSERT INTO `zan_class` VALUES (18, '	测11', 0, 0, 9, 1539334120, 1539334130);
INSERT INTO `zan_class` VALUES (19, '	测11', 3, 0, 9, 1539334416, 1539334613);
INSERT INTO `zan_class` VALUES (20, '公司新闻', 1, 1, 0, 1539593349, 1539593349);
INSERT INTO `zan_class` VALUES (21, '行业资讯', 2, 1, 0, 1539593357, 1539593357);

-- ----------------------------
-- Table structure for zan_config
-- ----------------------------
DROP TABLE IF EXISTS `zan_config`;
CREATE TABLE `zan_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网站logo地址',
  `qr_code` varbinary(255) NOT NULL COMMENT '二维码',
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
INSERT INTO `zan_config` VALUES (1, '20181015\\c32755341edf64e09b553a925ffab742.png', 0x32303138313031375C61646361643563653236663762393431376631306337616365646536636335362E706E67, '天津赞普', '', '', '赞普', '88888888888888', '022-525555', 0x7A616E7075403136332E636F6D, '天津南开华苑', '津88888', '<p>关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们</p>\r\n', '', '', '', '', '', 0, 0, 0);

-- ----------------------------
-- Table structure for zan_controller_group
-- ----------------------------
DROP TABLE IF EXISTS `zan_controller_group`;
CREATE TABLE `zan_controller_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '控制器名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '控制器值',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(1) NULL DEFAULT 0,
  `sort` int(255) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主菜单名称，controller_group' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_controller_group
-- ----------------------------
INSERT INTO `zan_controller_group` VALUES (1, '文章管理', 'article', 'fa-suitcase', 0, 1, 1542682750, 1542683009);
INSERT INTO `zan_controller_group` VALUES (2, '友链管理', 'friend', 'fa-male', 0, 2, 1542682930, 1542682930);
INSERT INTO `zan_controller_group` VALUES (3, '管理员', 'admin', 'fa-user-plus', 0, 3, 1542940840, 1542940840);

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
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_friend_link
-- ----------------------------
INSERT INTO `zan_friend_link` VALUES (1, '1', '1', 0, 0, 1538101070, 1539565827);
INSERT INTO `zan_friend_link` VALUES (2, '的1', 'http://www.simengphp.com1', 0, 0, 1538101490, 1539565827);
INSERT INTO `zan_friend_link` VALUES (3, 'd', 'http://www.simengphp.com', 0, 0, 1538102078, 1539565827);
INSERT INTO `zan_friend_link` VALUES (4, 'd1', 'http://www.simengphp.com11', 2, 0, 1538102100, 1539565827);
INSERT INTO `zan_friend_link` VALUES (5, '的', 'http://www.simengphp.coml', 2, 0, 1538102556, 1539565827);
INSERT INTO `zan_friend_link` VALUES (6, '超级管理员1221', 'http://www.simengphp.com1100', 8, 0, 1538103585, 1539565827);
INSERT INTO `zan_friend_link` VALUES (7, '的1111', 'http://www.simengphp.com112', 1, 0, 1539220191, 1539565827);
INSERT INTO `zan_friend_link` VALUES (8, '刘柱', 'http://www.baidu.com1111', 1, 0, 1539331703, 1539565827);

-- ----------------------------
-- Table structure for zan_icloud
-- ----------------------------
DROP TABLE IF EXISTS `zan_icloud`;
CREATE TABLE `zan_icloud`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(255) NOT NULL,
  `is_show` tinyint(1) NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '云服务器属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_icloud
-- ----------------------------
INSERT INTO `zan_icloud` VALUES (1, '机型', 0, 1, NULL, 1538964307, 1538967667);
INSERT INTO `zan_icloud` VALUES (2, '镜像', 0, 2, NULL, 1538969379, 1538969379);
INSERT INTO `zan_icloud` VALUES (3, '公网带宽', 0, 3, NULL, 1538969399, 1539566168);
INSERT INTO `zan_icloud` VALUES (4, '购买时长', 0, 4, NULL, 1538969410, 1539566168);
INSERT INTO `zan_icloud` VALUES (5, '购买时长1', 0, 0, NULL, 1539220219, 1539566168);

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
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的资讯信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_infomation
-- ----------------------------
INSERT INTO `zan_infomation` VALUES (1, '20181017\\64cde0fed1808942cb9352a2df4f5a6a.jpg', '猜猜猜', '<p>1</p>\r\n', '1', '11', 0, 1, '1;打的费;打的费;打的费', 21, 0, 1538042359, 1538126886);
INSERT INTO `zan_infomation` VALUES (2, '20180928\\46c75f2dd53dfbb20bdc90e2fc7fe0a8.jpg', '人', '<p>llkjl撒发生的</p>\r\n', ' 哈哈哈哈', '12', 1, 1, '1;打的费;打的费;打的费', 21, 0, 1538042397, 1538126880);
INSERT INTO `zan_infomation` VALUES (3, '', '大师傅', '<p>1212</p>\r\n', '     12', '1', 1, 1, '1;打的费;打的费;打的费', 8, 0, 1538042397, 1538096835);
INSERT INTO `zan_infomation` VALUES (4, '20181017\\5266115551ebd67f36a8fda3ff89d2c9.jpg', '人1', '<p>1212</p>\r\n', '     ', 'admin', 123, 2, '1;打的费;打的费;打的费', 20, 0, 1538096922, 1538126516);
INSERT INTO `zan_infomation` VALUES (5, '20180928\\2603b9862b221e883ce1f0b064e407a4.png', '人111', '<p>12</p>\r\n', '的', '刘柱', 121, 2, '1;打的费;打的费;打的费', 4, 0, 1538097000, 1539565658);
INSERT INTO `zan_infomation` VALUES (6, '20181017\\a30fd294c0d27814bdc19baf47f816b3.png', '1', '<p><img alt=\"\" src=\"/uploads/20180929/03d4a2bf718e9f5cadd57f25f3aefd9b.png\" style=\"height:273px; width:300px\" /></p>\r\n', '等等', '1', 1, 2, '打的费1;打的费;打的费;打的费', 21, 0, 1538204013, 1539565663);
INSERT INTO `zan_infomation` VALUES (7, '20181017\\8f6c17d7da642aaa3f762eab69b6bf64.jpg', '测试测试测试测试测试测试测试测试', '<p>12</p>\r\n', '1', '', 0, 0, '1', 20, 0, 1539220429, 1539747797);
INSERT INTO `zan_infomation` VALUES (8, '20181017\\ac75a3734ebfdee47606b78ce065320e.jpg', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '<p>1</p>\r\n', '1', '', 0, 0, '12', 21, 0, 1539225187, 1539747797);

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
INSERT INTO `zan_jobs` VALUES (1, 1, 'PHP工程师', 12, 1, '11', '1', '1', '13', '大专', '1000', '1', '1', '<p>的</p>\r\n', '<p>1</p>\r\n', 0, 1538185569, 1539565941);
INSERT INTO `zan_jobs` VALUES (2, 2, '电话销售专员', 12, 0, '100', '民营', '计算机', '1', '1', '1', '11', '1', '<h2><img alt=\"\" src=\"/uploads/20180929/249f9096c03c6398cf25eadbf42835ee.png\" style=\"height:273px; width:300px\" /></h2>\r\n\r\n<h2>职位描述</h2>\r\n\r\n<p>1. 通过电话进行产品销售，与外部销售人员合作完成各项销售指标；</p>\r\n\r\n<p>2.&nbsp;通过电话沟通了解客户需求, 寻求销售机会并完成销售业绩；</p>\r\n\r\n<p>3.&nbsp;开发新客户，拓展与老客户的业务，建立和维护客户档案；</p>\r\n\r\n<p>4.&nbsp;协调公司内部资源，提高客户满意度；</p>\r\n\r\n<p>5.&nbsp;收集和分析市场数据，并定期反馈最新信息。</p>\r\n', '<p><strong>任职要求</strong></p>\r\n\r\n<p>1.&nbsp;市场营销专业优先，20-35岁；</p>\r\n\r\n<p>2.&nbsp;善于沟通，语言表达能力强;逻辑思维能力强；</p>\r\n\r\n<p>3.&nbsp;对工作认真负责，执行能力强，具有团队协作精神;能够承受较强的工作压力。</p>\r\n\r\n<p><strong><strong>联系方式：</strong></strong><br />\r\n公司名称：天津赞普科技股份有限公司<br />\r\n邮箱：suwl@zanpu.com<br />\r\n公司地址：天津市华苑榕苑路2号海益国际4号楼3层<br />\r\n公司主页：http://www.zanpu.com</p>\r\n', 0, 1538186646, 1539565941);

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
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航icon',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航底部图片',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导航栏名称',
  `key` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导航的连接地址',
  `p_id` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',
  `sort` int(255) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_footer` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示在底部 0不显示 1显示',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常 9删除',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站导航栏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_navigate
-- ----------------------------
INSERT INTO `zan_navigate` VALUES (1, '', '', '首页', '', '', 'http://www.simengphp.com', 0, 1, 0, 0, 1538113152, 1538123290);
INSERT INTO `zan_navigate` VALUES (2, '', '', '产品服务', '', '', 'http://www.simengphp.com1', 0, 2, 0, 0, 1538113473, 1539672258);
INSERT INTO `zan_navigate` VALUES (3, '', '', '数据中心', '', '', 'http://www.simengphp.com12', 0, 3, 0, 0, 1538113489, 1539739741);
INSERT INTO `zan_navigate` VALUES (4, '', '', '云计算', '', '', 'http://www.simengphp.com33', 2, 1, 0, 9, 1538113515, 1539672387);
INSERT INTO `zan_navigate` VALUES (5, '', '', 'CDN', '', '', 'http://www.simengphp.comm', 2, 2, 0, 9, 1538116244, 1539672389);
INSERT INTO `zan_navigate` VALUES (6, '', '', '赞普海逸机房', '', '', 'http://www.simengphp.com1111', 3, 3, 0, 0, 1538116273, 1538123833);
INSERT INTO `zan_navigate` VALUES (7, '', '', '数据中心1', 'dddd', 'dd', 'http://www.simengphp.com', 0, 0, 0, 9, 1539220330, 1539672165);
INSERT INTO `zan_navigate` VALUES (8, '', '', '云计算', '', '', 'http://www.simengphp.com111', 2, 1, 0, 0, 1539672413, 1539672413);
INSERT INTO `zan_navigate` VALUES (9, '', '', '数据接入', '11', '1', 'http://www.simengphp.com11', 8, 1, 0, 0, 1539672440, 1539673722);
INSERT INTO `zan_navigate` VALUES (10, '', '', 'CDN', '11', '11', 'http://www.simengphp.com111', 8, 1, 0, 0, 1539673770, 1539673770);
INSERT INTO `zan_navigate` VALUES (11, '', '', '数据中心555', '', '', 'http://www.simengphp.com111', 0, 1, 0, 9, 1539673887, 1539673997);
INSERT INTO `zan_navigate` VALUES (12, '', '', '投资者园地', '', '', 'http://www.zanpu.com', 0, 4, 1, 0, 1539739779, 1539739779);
INSERT INTO `zan_navigate` VALUES (13, '', '', '新闻中心', '', '', 'http://www.zanpu.com', 0, 5, 1, 0, 1539739795, 1539739795);
INSERT INTO `zan_navigate` VALUES (14, '', '', '招贤纳士', '', '', 'http://www.zanpu.com', 0, 6, 0, 0, 1539739814, 1539739814);
INSERT INTO `zan_navigate` VALUES (15, '', '', '关于赞普', '', '', 'http://www.zanpu.com', 0, 7, 1, 0, 1539739824, 1539739824);
INSERT INTO `zan_navigate` VALUES (16, '', '', '大数据', '', '', 'http://www.zanpu.com', 2, 2, 0, 0, 1539741130, 1539741130);
INSERT INTO `zan_navigate` VALUES (17, '', '', '托管', '', '', 'http://www.zanpu.com', 2, 3, 0, 0, 1539741146, 1539741146);
INSERT INTO `zan_navigate` VALUES (18, '', '', '大数据1', '', '', 'http://www.zanpu.com', 16, 1, 0, 0, 1539741172, 1539741172);
INSERT INTO `zan_navigate` VALUES (19, '', '', '大数据2', '', '', 'http://www.zanpu.com', 16, 2, 0, 0, 1539741182, 1539741182);
INSERT INTO `zan_navigate` VALUES (20, '', '', '大数据3', '', '', 'http://www.zanpu.com', 16, 1, 0, 0, 1539741194, 1539741194);
INSERT INTO `zan_navigate` VALUES (21, '', '', '大数据4', '', '', 'http://www.zanpu.com', 16, 12, 0, 0, 1539741203, 1539741203);
INSERT INTO `zan_navigate` VALUES (22, '', '', '托管1', '12', '', 'http://www.zanpu.com', 17, 12, 0, 0, 1539741245, 1539741245);
INSERT INTO `zan_navigate` VALUES (23, '', '', '托管2', '', '', 'http://www.zanpu.com', 17, 2, 0, 0, 1539741262, 1539741262);
INSERT INTO `zan_navigate` VALUES (24, '', '', '托管3', '12', '', 'http://www.zanpu.com', 17, 4, 0, 0, 1539741274, 1539741274);
INSERT INTO `zan_navigate` VALUES (25, '', '', '托管4', '', '', 'http://www.zanpu.com', 17, 1323, 0, 0, 1539741286, 1539741286);
INSERT INTO `zan_navigate` VALUES (26, '', '', '大数据5', '', '', 'http://www.zanpu.com', 16, 22, 0, 0, 1539741854, 1539741854);
INSERT INTO `zan_navigate` VALUES (27, '', '', '大数据6', '', '', 'http://www.zanpu.com', 16, 1212, 0, 0, 1539742034, 1539742034);
INSERT INTO `zan_navigate` VALUES (28, '', '', '大数据7', '', '', 'http://www.zanpu.com', 16, 12, 0, 0, 1539742043, 1539742043);
INSERT INTO `zan_navigate` VALUES (29, '', '', '大数据8', '', '', 'http://www.zanpu.com', 16, 22, 0, 0, 1539742056, 1539742056);
INSERT INTO `zan_navigate` VALUES (30, '', '', '大数据9', '', '', 'http://www.zanpu.com', 16, 111, 0, 9, 1539742071, 1539742082);
INSERT INTO `zan_navigate` VALUES (31, '', '20181018\\7c9db1b0eeb7fef0b97c230d1c97e2dc.jpg', '海逸机房', '', '', '/manage/room', 6, 1, 0, 0, 1539744582, 1539828209);
INSERT INTO `zan_navigate` VALUES (32, '', '', '测试1', '', '', 'http://www.zanpu.com', 0, 12, 1, 9, 1539758084, 1539758139);

-- ----------------------------
-- Table structure for zan_permission_group
-- ----------------------------
DROP TABLE IF EXISTS `zan_permission_group`;
CREATE TABLE `zan_permission_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '控制器名称',
  `action_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '具体方法名称',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色的id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_permission_group
-- ----------------------------
INSERT INTO `zan_permission_group` VALUES (62, '文章管理', '文章列表', 'article', '/article/articleList', 1, 'fa-suitcase', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (61, '友链管理', '友链列表', 'friend', '/friend/linkList', 1, 'fa-male', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (60, '友链管理', '友链回收站', 'friend', '/friend/linkTrash', 1, 'fa-male', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (59, '管理员', '管理员列表', 'admin', '/manager/adminList', 1, 'fa-user-plus', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (57, '管理员', '控制器列表', 'admin', '/manager/controllerList', 1, 'fa-user-plus', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (58, '管理员', '管理员回收站', 'admin', '/manager/adminTrash', 1, 'fa-user-plus', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (56, '管理员', '方法列表', 'admin', '/manager/actionList', 1, 'fa-user-plus', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (55, '管理员', '角色列表', 'admin', '/manager/roleList', 1, 'fa-user-plus', NULL, NULL);
INSERT INTO `zan_permission_group` VALUES (63, '文章管理', '文章分类', 'article', '/article/classList', 1, 'fa-suitcase', NULL, NULL);

-- ----------------------------
-- Table structure for zan_pic
-- ----------------------------
DROP TABLE IF EXISTS `zan_pic`;
CREATE TABLE `zan_pic`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_where` tinyint(255) NOT NULL DEFAULT 0 COMMENT '1是移动端 0是PC',
  `class_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类的id\r\n1、banner\r\n2、公司荣誉\r\n3、关于我们\r\n4、数据中心\r\n',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '连接地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '9删除 0正常',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站的图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_pic
-- ----------------------------
INSERT INTO `zan_pic` VALUES (1, 'alt1', '20181017\\50b8dac4db10e1d79d9922877c0409b6.png', 1, 0, 3, '', 0, 1538271092, 1539750605);
INSERT INTO `zan_pic` VALUES (2, 'alt11', '20181017\\94b00da89d25d7c4002fba3273b7dda1.png', 12, 0, 1, '', 0, 1538273182, 1539750605);
INSERT INTO `zan_pic` VALUES (3, '1', '20181017\\e6d7d207b4c1339c5c2009d1dd0e3816.png', 1, 0, 1, '', 0, 1539570198, 1539750605);
INSERT INTO `zan_pic` VALUES (4, 'banner', '20181017\\cd85fcde91677a7cac513825afacd2a7.png', 1, 1, 1, 'http://www.baidu.com', 0, 1539745527, 1539750605);
INSERT INTO `zan_pic` VALUES (5, '移动端测试', '20181017\\0722187c84c549b981cedb0b1d0d0de4.jpg', 2, 1, 1, 'http://www.baidu.com', 0, 1539759378, 1539759378);
INSERT INTO `zan_pic` VALUES (6, '数据中心', '20181018\\4b83b503cb8b9b782bc254c2f89b38fb.png', 0, 0, 4, 'dd', 0, 1539828950, 1539828950);

-- ----------------------------
-- Table structure for zan_price
-- ----------------------------
DROP TABLE IF EXISTS `zan_price`;
CREATE TABLE `zan_price`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attr_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '属性值集合 1|2|3|4',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '云服务器价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_price
-- ----------------------------
INSERT INTO `zan_price` VALUES (1, '12|1|5|9', 122.00, 0, 1538990649, 1538990649);
INSERT INTO `zan_price` VALUES (2, '13|1|5|9', 1211.00, 0, 1538991008, 1538991008);
INSERT INTO `zan_price` VALUES (3, '14|1|5|9', 12.00, 0, 1538991603, 1538991603);
INSERT INTO `zan_price` VALUES (4, '14|2|5|9', 1212.00, 0, 1538991606, 1538991606);
INSERT INTO `zan_price` VALUES (5, '14|1|5|10', 3.00, 0, 1538991614, 1538991614);
INSERT INTO `zan_price` VALUES (6, '14|1|7|10', 121.00, 0, 1538991619, 1538991619);
INSERT INTO `zan_price` VALUES (7, '14|1|8|10', 2.00, 0, 1538991624, 1538991624);
INSERT INTO `zan_price` VALUES (8, '15|1|5|9', 1212.00, 0, 1538991640, 1538991640);
INSERT INTO `zan_price` VALUES (9, '14|3|5|9', 121.00, 0, 1538991722, 1538991722);
INSERT INTO `zan_price` VALUES (10, '12|1|6|9', 1.00, 0, 1538991793, 1538991793);
INSERT INTO `zan_price` VALUES (11, '12|1|7|9', 1.00, 0, 1538991815, 1538991815);
INSERT INTO `zan_price` VALUES (12, '12|1|8|9', 12.00, 0, 1538991882, 1538991882);
INSERT INTO `zan_price` VALUES (13, '12|1|5|11', 1212.00, 0, 1538991908, 1538991908);
INSERT INTO `zan_price` VALUES (14, '12|1|5|10', 11.00, 0, 1538991922, 1538991922);
INSERT INTO `zan_price` VALUES (15, '12|1|7|11', 1.00, 0, 1538992095, 1538992095);
INSERT INTO `zan_price` VALUES (16, '12|1|6|11', 12.00, 0, 1538992160, 1538992160);
INSERT INTO `zan_price` VALUES (17, '12|1|8|11', 12.00, 0, 1538992165, 1538992165);
INSERT INTO `zan_price` VALUES (18, '12|3|8|11', 12.00, 0, 1538992167, 1538992167);
INSERT INTO `zan_price` VALUES (19, '12|2|8|11', 1212.00, 0, 1538992170, 1538992170);
INSERT INTO `zan_price` VALUES (20, '14|1|5|11', 12.00, 0, 1538992183, 1538992183);
INSERT INTO `zan_price` VALUES (21, '15|1|5|11', 12.00, 0, 1538992185, 1538992185);
INSERT INTO `zan_price` VALUES (22, '15|1|5|10', 121212.00, 0, 1538992189, 1538992189);
INSERT INTO `zan_price` VALUES (23, '15|1|8|11', 12.00, 0, 1538992197, 1538992197);
INSERT INTO `zan_price` VALUES (24, '15|2|8|11', 1212.00, 0, 1538992200, 1538992200);
INSERT INTO `zan_price` VALUES (25, '12|2|5|9', 1212.00, 0, 1538992257, 1538992257);
INSERT INTO `zan_price` VALUES (26, '12|2|8|9', 1212.00, 0, 1538992260, 1538992260);
INSERT INTO `zan_price` VALUES (27, '12|3|8|9', 1212.00, 0, 1538992264, 1538992264);
INSERT INTO `zan_price` VALUES (28, '13|2|5|9', 121212.00, 0, 1538992282, 1538992282);
INSERT INTO `zan_price` VALUES (29, '13|3|5|9', 1212.00, 0, 1538992285, 1538992285);
INSERT INTO `zan_price` VALUES (30, '13|1|6|9', 1212.00, 0, 1538992290, 1538992290);
INSERT INTO `zan_price` VALUES (31, '13|1|7|9', 1212.00, 0, 1538992293, 1538992293);
INSERT INTO `zan_price` VALUES (32, '13|1|8|9', 121212.00, 0, 1538992296, 1538992296);
INSERT INTO `zan_price` VALUES (33, '13|1|5|10', 122.00, 0, 1538992301, 1538992301);
INSERT INTO `zan_price` VALUES (34, '13|1|5|11', 121212.00, 0, 1538992303, 1538992303);
INSERT INTO `zan_price` VALUES (35, '13|2|6|9', 1212.00, 0, 1538992310, 1538992310);
INSERT INTO `zan_price` VALUES (36, '13|2|7|9', 1212.00, 0, 1538992313, 1538992313);
INSERT INTO `zan_price` VALUES (37, '13|2|8|9', 1212.00, 0, 1538992315, 1538992315);
INSERT INTO `zan_price` VALUES (38, '13|2|5|10', 1212.00, 0, 1538992320, 1538992320);
INSERT INTO `zan_price` VALUES (39, '13|2|5|11', 1212.00, 0, 1538992324, 1538992324);
INSERT INTO `zan_price` VALUES (40, '13|2|6|10', 1212.00, 0, 1538992330, 1538992330);
INSERT INTO `zan_price` VALUES (41, '13|2|6|11', 1212.00, 0, 1538992333, 1538992333);
INSERT INTO `zan_price` VALUES (42, '13|2|7|10', 12.00, 0, 1538992342, 1538992342);
INSERT INTO `zan_price` VALUES (43, '13|2|7|11', 12.00, 0, 1538992345, 1538992345);
INSERT INTO `zan_price` VALUES (44, '13|2|8|10', 1212.00, 0, 1538992350, 1538992350);
INSERT INTO `zan_price` VALUES (45, '13|2|8|11', 1212.00, 0, 1538992352, 1538992352);
INSERT INTO `zan_price` VALUES (46, '14|2|8|11', 1212.00, 0, 1538992363, 1538992363);
INSERT INTO `zan_price` VALUES (47, '14|2|5|11', 2.00, 0, 1538992376, 1538992376);
INSERT INTO `zan_price` VALUES (48, '14|2|6|11', 12.00, 0, 1538992378, 1538992378);
INSERT INTO `zan_price` VALUES (49, '14|2|7|11', 1.00, 0, 1538992380, 1538992380);
INSERT INTO `zan_price` VALUES (50, '14|2|8|10', 1.00, 0, 1538992387, 1538992387);
INSERT INTO `zan_price` VALUES (51, '14|2|8|9', 1.00, 0, 1538992389, 1538992389);
INSERT INTO `zan_price` VALUES (52, '14|2|6|10', 1.00, 0, 1538992393, 1538992393);
INSERT INTO `zan_price` VALUES (53, '14|2|7|10', 12.00, 0, 1538992415, 1538992415);
INSERT INTO `zan_price` VALUES (54, '14|2|7|9', 23.00, 0, 1538992418, 1538992418);
INSERT INTO `zan_price` VALUES (55, '14|3|8|9', 212.00, 0, 1538992426, 1538992426);
INSERT INTO `zan_price` VALUES (56, '14|1|8|11', 23.00, 0, 1539047430, 1539047430);

-- ----------------------------
-- Table structure for zan_role
-- ----------------------------
DROP TABLE IF EXISTS `zan_role`;
CREATE TABLE `zan_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `status` tinyint(1) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_role
-- ----------------------------
INSERT INTO `zan_role` VALUES (1, '超级管理员', 0, 11, 1542694043, 1542940929);
INSERT INTO `zan_role` VALUES (2, '管理员', 9, 1, 1542940810, 1542940818);

-- ----------------------------
-- Table structure for zan_simple
-- ----------------------------
DROP TABLE IF EXISTS `zan_simple`;
CREATE TABLE `zan_simple`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类的id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `title_other` varbinary(255) NOT NULL DEFAULT '' COMMENT '两个标题的值',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `serve` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '服务|后者作为两个内容',
  `key` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字|或者内容',
  `is_key` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是关键字 1是 0不是',
  `sort` int(11) NOT NULL COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '连接地址',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单页面数据管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_simple
-- ----------------------------
INSERT INTO `zan_simple` VALUES (1, 1, '数据接入', '', '20181009\\c1cd1efff3db9d0732dd42e7a347343d.png', '<p>企业专线</p>\r\n\r\n<p>社区服务</p>\r\n', '<p>业务响应速度快</p>\r\n\r\n<p>专业客服团队1</p>\r\n', 1, 1, '', 0, 1539056902, 1539566646);
INSERT INTO `zan_simple` VALUES (2, 1, 'IDC业务', '', '20181009\\778b417d3a54a54dcbfeb32cd583863b.png', '<p>优势</p>\r\n\r\n<p>强大</p>\r\n\r\n<p>高效</p>\r\n', '<p>服务</p>\r\n\r\n<p>托管</p>\r\n\r\n<p>租赁</p>\r\n', 1, 2, '', 0, 1539057099, 1539566646);
INSERT INTO `zan_simple` VALUES (3, 2, '基础设施', '', '20181017\\6157a49fbf504241b1365501cf03ff23.jpg', '', '<p>基础设施情况</p>\r\n\r\n<p>2N供电结构</p>\r\n\r\n<p>110V市电双路供电</p>\r\n', 1, 1, '', 0, 1539760637, 1539761142);
INSERT INTO `zan_simple` VALUES (4, 2, '资源情况', '', '20181017\\f055cc1c1796771835384dcec0aa0675.jpg', '', '<p>资源情况</p>\r\n\r\n<p>24个机房模块</p>\r\n\r\n<p>容量3700+标准机柜</p>\r\n', 1, 2, '', 0, 1539760662, 1539760703);
INSERT INTO `zan_simple` VALUES (5, 2, '资质介绍', '', '20181017\\33223d0ae13b0375d6ae7388f345497c.png', '', '<p>资质介绍</p>\r\n\r\n<p>CQC A类机房 T3标准</p>\r\n\r\n<p>ISP资质</p>\r\n', 1, 3, '', 0, 1539760698, 1539761136);
INSERT INTO `zan_simple` VALUES (6, 1, 'WIFI业务', '', '', '<p>WIFI业务</p>\r\n\r\n<p>WIFI业务12</p>\r\n\r\n<p>WIFI业务33</p>\r\n', '<p>WIFI业务</p>\r\n\r\n<p>WIFI业务3</p>\r\n\r\n<p>WIFI业务滚滚滚</p>\r\n', 1, 3, '', 0, 1539764583, 1539764583);
INSERT INTO `zan_simple` VALUES (7, 4, '地址', 0xE8A784E6A8A1, '20181018\\dd50095e656228ff29bb16bca2029453.jpg', '<i class=\"fa fa-circle\"></i><p>处于华苑产业区核心地带，紧邻津仓高速、天津外环快速路西北半环、复康路、地铁三号线，交通便利</p>\r\n', '<p>数据中心机房高4.5米，机房总面积500平米</p>\r\n', 1, 0, '', 0, 1539827333, 1539827333);
INSERT INTO `zan_simple` VALUES (8, 5, '供电系统', '', '', '', '<p>122</p>\r\n\r\n<p>阿斯蒂芬</p>\r\n', 1, 1, '', 0, 1539827483, 1539827505);
INSERT INTO `zan_simple` VALUES (9, 5, '制冷系统', '', '', '', '机房采用双路市电供电，全程双路由供电。机房服务器电源使用双总线1+1冗余，', 1, 2, '', 0, 1539827503, 1539827503);
INSERT INTO `zan_simple` VALUES (10, 5, '综合排布', '', '', '', '机房采用双路市电供电，全程双路由供电。机房服务器电源使用双', 1, 3, '', 0, 1539827517, 1539827517);
INSERT INTO `zan_simple` VALUES (11, 5, '机房监控', '', '', '', '机房采用双路市电供电，全程双路由供电。机房服务器电源使用双总线1+1冗余，在市', 1, 4, '', 0, 1539827529, 1539827529);
INSERT INTO `zan_simple` VALUES (12, 5, '机房网络', '', '', '', '<p>顶顶顶顶</p>\r\n\r\n<p>大的发送到</p>\r\n', 1, 5, '', 0, 1539827542, 1539827542);
INSERT INTO `zan_simple` VALUES (13, 6, '产品推荐', '', '20181018\\dc2136d9e3e82296ee93f33e232c5ede.png', '', '<p>机柜托管：1U,2U,24U</p>\r\n\r\n<p>线路：单线，双线，BGP</p>\r\n\r\n<p>IP：按需购买</p>\r\n', 1, 1, '', 0, 1539827714, 1539827714);
INSERT INTO `zan_simple` VALUES (14, 6, '主机1', '', '20181018\\1e7a64824f2557bf9b3a72f3f8eba6db.png', '', '<p>云主</p>\r\n\r\n<p>机块存储</p>\r\n\r\n<p>云备灾</p>\r\n', 1, 2, 'dd', 0, 1539830065, 1539830065);

-- ----------------------------
-- Table structure for zan_simple_class
-- ----------------------------
DROP TABLE IF EXISTS `zan_simple_class`;
CREATE TABLE `zan_simple_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '值',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `position` tinyint(1) NOT NULL DEFAULT 0 COMMENT '位置',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `pics` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多张图片',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单页的父类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_simple_class
-- ----------------------------
INSERT INTO `zan_simple_class` VALUES (1, '互联网综合业务服务商', '互联网综合业务服务商', 0, '', NULL, 0, 1539824611, 1539824611);
INSERT INTO `zan_simple_class` VALUES (2, '赞普大数据中心', '赞普大数据中心', 0, '', NULL, 0, 1539824638, 1539824638);
INSERT INTO `zan_simple_class` VALUES (3, '服务行业', '服务行业', 0, '', NULL, 0, 1539824645, 1539824645);
INSERT INTO `zan_simple_class` VALUES (4, '数据中心-海逸机房-基础信息', '基础信息', 1, '', NULL, 0, 1539825820, 1539825820);
INSERT INTO `zan_simple_class` VALUES (5, '数据中心-海逸机房-中心设计及管理', '中心设计及管理', 1, '', NULL, 0, 1539827441, 1539827441);
INSERT INTO `zan_simple_class` VALUES (6, '数据中心-海逸机房-产品推荐', '产品推荐1', 1, '20181018\\f399adb5f5112ea7e3bb92eb55c1e661.jpg', '20181018\\a118f3bfbad067b8a4f8c6d7cff131de.png|20181018\\971bdbca7ac6ef8e3a10eacaca2b6db0.jpg|20181018\\380d8d471ce195c581720b7c8e9aaabc.jpg|20181018\\4d12ea4921e0cff8703ec2ece3e6c558.jpg', 0, 1539827580, 1539827580);

SET FOREIGN_KEY_CHECKS = 1;
