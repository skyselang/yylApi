/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yylapi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-26 18:17:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ya_admin
-- ----------------------------
DROP TABLE IF EXISTS `ya_admin`;
CREATE TABLE `ya_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 DEFAULT 'yylAdmin' COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '邮箱',
  `username` varchar(50) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '密码',
  `login_ip` varchar(20) CHARACTER SET utf8mb4 DEFAULT '0.0.0.0' COMMENT '登录ip',
  `login_num` int(11) DEFAULT '0' COMMENT '登录次数',
  `device` varchar(200) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '登录设备',
  `login_time` int(11) DEFAULT '0' COMMENT '登录时间',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `exit_time` int(11) DEFAULT '0' COMMENT '退出时间',
  PRIMARY KEY (`admin_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `password` (`password`(250)) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

-- ----------------------------
-- Records of ya_admin
-- ----------------------------
INSERT INTO `ya_admin` VALUES ('1', 'yylAdmin', 'yyladmin@qq.com', 'yyladmin', '0827df0fd834daa31e9aec7396379033', '192.168.0.125', '19', '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '1553592607', '0', '0', '1553520414');

-- ----------------------------
-- Table structure for ya_interface
-- ----------------------------
DROP TABLE IF EXISTS `ya_interface`;
CREATE TABLE `ya_interface` (
  `interface_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '接口id',
  `interface_pid` int(11) DEFAULT '0' COMMENT '上级id，0顶级id',
  `project_id` int(11) DEFAULT '0' COMMENT '项目id',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `name` varchar(255) DEFAULT NULL COMMENT '接口名称',
  `explain` varchar(255) DEFAULT NULL COMMENT '接口说明',
  `url` varchar(255) DEFAULT NULL COMMENT '接口url',
  `method` varchar(255) DEFAULT 'GET' COMMENT '请求方式',
  `request` text COMMENT '请求参数',
  `response` text COMMENT '响应参数',
  `sort` int(11) DEFAULT '200' COMMENT '排序',
  `is_disable` tinyint(4) DEFAULT '0' COMMENT '0正常1删除',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '0正常1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`interface_id`) USING BTREE,
  KEY `interface_id` (`interface_id`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='接口';

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES ('20', '0', '23', '1', '商家版', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:57:14', '2019-03-25 17:57:14');
INSERT INTO `ya_interface` VALUES ('21', '20', '23', '1', '启动页', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:58:03', '2019-03-25 17:58:03');
INSERT INTO `ya_interface` VALUES ('22', '22', '23', '1', '登录', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:58:36', '2019-03-25 18:00:39');
INSERT INTO `ya_interface` VALUES ('23', '23', '23', '1', '商家入驻', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:59:16', '2019-03-25 18:03:37');
INSERT INTO `ya_interface` VALUES ('24', '20', '23', null, '登录', '', 'merchantsapi/Admin/login', 'POST', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"username\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:8:\"password\";s:21:\"request_param_example\";s:6:\"123123\";s:21:\"request_param_explain\";s:6:\"密码\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:19:\"状态码，1成功\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"登录成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:18:\"卖家用户信息\";}}', '200', '0', '0', '2019-03-26 10:23:38', '2019-03-26 17:27:43');
INSERT INTO `ya_interface` VALUES ('25', '27', '23', '1', '商家入驻-发送验证码', '', 'Home/Api/send_validate_code', 'POST', 'a:3:{i:0;a:5:{s:18:\"request_param_name\";s:5:\"scene\";s:21:\"request_param_example\";s:1:\"1\";s:21:\"request_param_explain\";s:7:\"填写1\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:4:\"type\";s:21:\"request_param_example\";s:6:\"mobile\";s:21:\"request_param_explain\";s:12:\"填写mobile\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:6:\"mobile\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:30:\"状态码，1成功，!1失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"发送成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}}', '200', '0', '0', '2019-03-26 10:48:19', '2019-03-26 16:39:46');
INSERT INTO `ya_interface` VALUES ('26', '27', '23', '1', '商家入驻-立即注册', '', 'merchantsapi/Login/do_login', 'POST', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:6:\"mobile\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:11:\"verify_code\";s:21:\"request_param_example\";s:4:\"9527\";s:21:\"request_param_explain\";s:9:\"验证码\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:31:\"状态码，1成功返回信息\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"登录成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:6:\"seller\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:12:\"用户信息\";}}', '200', '0', '0', '2019-03-26 14:23:50', '2019-03-26 18:08:05');
INSERT INTO `ya_interface` VALUES ('27', '24', '23', '1', '商家入驻', '', '', 'GET', 'a:0:{}', 'a:0:{}', '201', '0', '0', '2019-03-26 16:15:12', '2019-03-26 16:15:43');
INSERT INTO `ya_interface` VALUES ('28', '27', '23', '1', '填写信息', '', 'Admin/Api/applay_info_edit', 'POST', 'a:16:{i:0;a:5:{s:18:\"request_param_name\";s:7:\"user_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"用户id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:10:\"store_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"店铺简称\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:14:\"store_fullname\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"店铺全称\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:3;a:5:{s:18:\"request_param_name\";s:11:\"seller_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"卖家用户名\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:4;a:5:{s:18:\"request_param_name\";s:16:\"company_province\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"省份\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:5;a:5:{s:18:\"request_param_name\";s:12:\"company_city\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"城市\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:6;a:5:{s:18:\"request_param_name\";s:16:\"company_district\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"街道\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:7;a:5:{s:18:\"request_param_name\";s:15:\"company_address\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"详细地址\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:8;a:5:{s:18:\"request_param_name\";s:13:\"contacts_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"法人用户名\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:9;a:5:{s:18:\"request_param_name\";s:15:\"contacts_mobile\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:18:\"法人联系电话\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:10;a:5:{s:18:\"request_param_name\";s:23:\"business_licence_number\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"社会代号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:11;a:5:{s:18:\"request_param_name\";s:17:\"bank_account_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"银行名称\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:12;a:5:{s:18:\"request_param_name\";s:19:\"bank_account_number\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"银行账号\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:13;a:5:{s:18:\"request_param_name\";s:19:\"bank_account_person\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"银行开户行\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:14;a:5:{s:18:\"request_param_name\";s:5:\"sc_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:14:\"一级分类id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:15;a:5:{s:18:\"request_param_name\";s:6:\"wsc_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:14:\"二级分类id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:30:\"状态码，1成功，!1失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}}', '200', '0', '0', '2019-03-26 17:35:31', '2019-03-26 17:54:59');
INSERT INTO `ya_interface` VALUES ('29', '28', '23', '1', '选择店铺类型', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-26 18:09:09', '2019-03-26 18:09:09');
INSERT INTO `ya_interface` VALUES ('30', '28', '23', '1', '选择店铺地址', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-26 18:09:29', '2019-03-26 18:09:29');

-- ----------------------------
-- Table structure for ya_interface_response
-- ----------------------------
DROP TABLE IF EXISTS `ya_interface_response`;
CREATE TABLE `ya_interface_response` (
  `response_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '返回参数id',
  `project_id` int(11) DEFAULT '0' COMMENT '项目id',
  `response_sort` int(11) DEFAULT '200' COMMENT '返回参数排序',
  `response_name` varchar(255) DEFAULT NULL COMMENT '返回参数名',
  `response_example` varchar(255) DEFAULT NULL COMMENT '返回参数示例值',
  `response_explain` varchar(255) DEFAULT NULL COMMENT '返回参数说明',
  `is_delete` tinyint(255) DEFAULT '0' COMMENT '0正常1删除',
  PRIMARY KEY (`response_id`) USING BTREE,
  KEY `response_id` (`response_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='接口返回参数';

-- ----------------------------
-- Records of ya_interface_response
-- ----------------------------
INSERT INTO `ya_interface_response` VALUES ('1', '0', '200', 'status', '0', '状态码，0成功，!0失败', '0');
INSERT INTO `ya_interface_response` VALUES ('2', '0', '200', 'message', 'ok', '状态码描述', '0');
INSERT INTO `ya_interface_response` VALUES ('3', '0', '200', 'data', 'json', '成功返回数据', '0');

-- ----------------------------
-- Table structure for ya_project
-- ----------------------------
DROP TABLE IF EXISTS `ya_project`;
CREATE TABLE `ya_project` (
  `project_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `project_desc` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `apiurl_prefix` text COMMENT '接口url前缀',
  `admin_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `is_disable` tinyint(4) DEFAULT '0' COMMENT '0启用1禁用',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '0正常1删除',
  `sort` int(11) DEFAULT '200' COMMENT '排序',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `delete_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目';

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES ('23', '尔尔商城', '尔尔商城api接口文档', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:34:\"http://www.erershop.com/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '0', '200', '2019-03-25 10:23:50', '2019-03-26 15:25:58', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES ('24', '12313', '12313', 'a:4:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"123123\";s:17:\"apiurl_prefix_url\";s:6:\"123123\";s:21:\"apiurl_prefix_default\";i:0;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:5:\"13123\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}i:3;a:3:{s:18:\"apiurl_prefix_name\";s:4:\"1313\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '1', '200', '2019-03-25 14:43:13', '2019-03-25 14:43:13', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES ('25', '尔尔', '尔尔', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '1', '200', '2019-03-25 20:50:52', '2019-03-25 20:50:52', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for ya_relation
-- ----------------------------
DROP TABLE IF EXISTS `ya_relation`;
CREATE TABLE `ya_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `project_id` int(11) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目用户关联';

-- ----------------------------
-- Records of ya_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ya_user
-- ----------------------------
DROP TABLE IF EXISTS `ya_user`;
CREATE TABLE `ya_user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '密码',
  `login_ip` varchar(20) CHARACTER SET utf8mb4 DEFAULT '0.0.0.0' COMMENT '登录ip',
  `login_num` int(11) DEFAULT '0' COMMENT '登录次数',
  `device` varchar(255) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '登录设备',
  `login_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '登录时间',
  `exit_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '退出时间',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '0正常1删除',
  `delete_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `username` (`username`(250)) USING BTREE,
  KEY `password` (`password`(250)) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of ya_user
-- ----------------------------
INSERT INTO `ya_user` VALUES ('1003', 'zxc', '0a1a1f25ab81feefd319813161e46514', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 20:26:23', '2019-03-25 20:28:14', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1004', 'qwe', '76d80224611fc919a5d54f0ff9fba446', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 20:34:33', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1005', 'asd', '7815696ecbf1c96e6894b779456d330e', '127.0.0.1', '2', '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 21:27:53', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1006', 'aass', '78fb84253ad5e7ec0ab63d04f70555de', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:10:53', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1007', 'qqww', '587b5c5a7899d8652cf24850a60e73e8', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:01', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1008', 'qqqwww', '0827df0fd834daa31e9aec7396379033', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:09', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1009', 'qqs', 'fa87d2d66521c64841a6f292d744acc4', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:18', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
