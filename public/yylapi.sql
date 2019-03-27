/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yylapi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-27 20:00:17
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
INSERT INTO `ya_admin` VALUES ('1', 'yylAdmin', 'yyladmin@qq.com', 'yyladmin', '0827df0fd834daa31e9aec7396379033', '192.168.0.125', '28', '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '1553683888', '0', '0', '1553614274');

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
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='接口';

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES ('20', '0', '23', '1', '商家版', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:57:14', '2019-03-25 17:57:14');
INSERT INTO `ya_interface` VALUES ('21', '20', '23', '1', '启动页', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:58:03', '2019-03-25 17:58:03');
INSERT INTO `ya_interface` VALUES ('22', '22', '23', '1', '登录', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:58:36', '2019-03-25 18:00:39');
INSERT INTO `ya_interface` VALUES ('23', '23', '23', '1', '商家入驻', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:59:16', '2019-03-25 18:03:37');
INSERT INTO `ya_interface` VALUES ('24', '20', '23', '1', '登录', '', 'merchantsapi/Admin/login', 'POST', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"username\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:8:\"password\";s:21:\"request_param_example\";s:6:\"123123\";s:21:\"request_param_explain\";s:6:\"密码\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:19:\"状态码，1成功\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"登录成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:18:\"卖家用户信息\";}}', '200', '0', '0', '2019-03-26 10:23:38', '2019-03-26 17:27:43');
INSERT INTO `ya_interface` VALUES ('25', '27', '23', '1', '商家入驻-发送验证码', '', 'Home/Api/send_validate_code', 'POST', 'a:3:{i:0;a:5:{s:18:\"request_param_name\";s:5:\"scene\";s:21:\"request_param_example\";s:1:\"1\";s:21:\"request_param_explain\";s:7:\"填写1\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:4:\"type\";s:21:\"request_param_example\";s:6:\"mobile\";s:21:\"request_param_explain\";s:12:\"填写mobile\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:6:\"mobile\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:30:\"状态码，1成功，!1失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"发送成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}}', '200', '0', '0', '2019-03-26 10:48:19', '2019-03-26 16:39:46');
INSERT INTO `ya_interface` VALUES ('26', '27', '23', '1', '商家入驻-立即注册', '', 'merchantsapi/Login/do_login', 'POST', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:6:\"mobile\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:11:\"verify_code\";s:21:\"request_param_example\";s:4:\"9527\";s:21:\"request_param_explain\";s:9:\"验证码\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:31:\"状态码，1成功返回信息\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:12:\"登录成功\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:6:\"seller\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:12:\"用户信息\";}}', '200', '0', '0', '2019-03-26 14:23:50', '2019-03-26 18:08:05');
INSERT INTO `ya_interface` VALUES ('27', '24', '23', '1', '商家入驻', '', '', 'GET', 'a:0:{}', 'a:0:{}', '201', '0', '0', '2019-03-26 16:15:12', '2019-03-26 16:15:43');
INSERT INTO `ya_interface` VALUES ('28', '27', '23', '1', '填写信息', '', 'Admin/Api/applay_info_edit', 'POST', 'a:16:{i:0;a:5:{s:18:\"request_param_name\";s:7:\"user_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"用户id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:10:\"store_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"店铺简称\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:14:\"store_fullname\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"店铺全称\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:3;a:5:{s:18:\"request_param_name\";s:11:\"seller_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"卖家用户名\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:4;a:5:{s:18:\"request_param_name\";s:16:\"company_province\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"省份\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:5;a:5:{s:18:\"request_param_name\";s:12:\"company_city\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"城市\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:6;a:5:{s:18:\"request_param_name\";s:16:\"company_district\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:6:\"街道\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:7;a:5:{s:18:\"request_param_name\";s:15:\"company_address\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"详细地址\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:8;a:5:{s:18:\"request_param_name\";s:13:\"contacts_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"法人用户名\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:9;a:5:{s:18:\"request_param_name\";s:15:\"contacts_mobile\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:18:\"法人联系电话\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:10;a:5:{s:18:\"request_param_name\";s:23:\"business_licence_number\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"社会代号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:11;a:5:{s:18:\"request_param_name\";s:17:\"bank_account_name\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"银行名称\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:12;a:5:{s:18:\"request_param_name\";s:19:\"bank_account_number\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:12:\"银行账号\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:13;a:5:{s:18:\"request_param_name\";s:19:\"bank_account_person\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"银行开户行\";s:18:\"request_param_must\";s:1:\"1\";s:18:\"request_param_type\";s:6:\"String\";}i:14;a:5:{s:18:\"request_param_name\";s:5:\"sc_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:14:\"一级分类id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:15;a:5:{s:18:\"request_param_name\";s:6:\"wsc_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:14:\"二级分类id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:30:\"状态码，1成功，!1失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}}', '200', '0', '0', '2019-03-26 17:35:31', '2019-03-26 17:54:59');
INSERT INTO `ya_interface` VALUES ('29', '28', '23', '1', '选择店铺类型', '接口可获取省份，一级分类，再根据省份id分类id获取城市和二级分类', 'Admin/Api/getclass', 'GET', 'a:4:{i:0;a:5:{s:18:\"request_param_name\";s:7:\"user_id\";s:21:\"request_param_example\";s:1:\"1\";s:21:\"request_param_explain\";s:8:\"用户id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:6:\"mobile\";s:21:\"request_param_example\";s:11:\"18812345678\";s:21:\"request_param_explain\";s:9:\"手机号\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:15:\"regionparent_id\";s:21:\"request_param_example\";s:1:\"0\";s:21:\"request_param_explain\";s:7:\"填写0\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:3;a:5:{s:18:\"request_param_name\";s:14:\"classparent_id\";s:21:\"request_param_example\";s:1:\"0\";s:21:\"request_param_explain\";s:7:\"填写0\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:11:\"apply_state\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:51:\"状态码，1审核成功2审核未通过0待审核\";}i:1;a:3:{s:19:\"response_param_name\";s:11:\"store_class\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:6:\"分类\";}i:2;a:3:{s:19:\"response_param_name\";s:6:\"region\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:6:\"地区\";}}', '200', '0', '0', '2019-03-26 18:09:09', '2019-03-27 09:27:47');
INSERT INTO `ya_interface` VALUES ('30', '28', '23', '1', '选择店铺地址-城市', '', 'Admin/Api/getclass', 'GET', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:15:\"regionparent_id\";s:21:\"request_param_example\";s:3:\"338\";s:21:\"request_param_explain\";s:8:\"省份id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:14:\"classparent_id\";s:21:\"request_param_example\";s:1:\"0\";s:21:\"request_param_explain\";s:7:\"填写0\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:11:\"store_class\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:6:\"分类\";}i:1;a:3:{s:19:\"response_param_name\";s:6:\"region\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:6:\"城市\";}}', '200', '0', '0', '2019-03-26 18:09:29', '2019-03-27 09:26:36');
INSERT INTO `ya_interface` VALUES ('38', '28', '23', '1', '选择店铺地址-街道', '', 'Admin/Api/getclass', 'GET', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:15:\"regionparent_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"城市id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:14:\"classparent_id\";s:21:\"request_param_example\";s:1:\"0\";s:21:\"request_param_explain\";s:7:\"填写0\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:1:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"region\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:6:\"街道\";}}', '200', '0', '0', '2019-03-27 09:39:06', '2019-03-27 09:39:06');
INSERT INTO `ya_interface` VALUES ('39', '41', '23', '1', '上转图片接口', '上传成功直接返回文件路径', 'Interf/Uploadify/upload', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:4:\"file\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:10:\"表单name\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:2:{i:0;a:3:{s:19:\"response_param_name\";s:2:\"ok\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:13:\"0上传失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:12:\"上传失败\";}}', '200', '0', '0', '2019-03-27 09:47:42', '2019-03-27 10:26:59');
INSERT INTO `ya_interface` VALUES ('40', '41', '23', '1', '上传图片-提交图片路径', '', 'Admin/Api/applay_info_update', 'GET', 'a:5:{i:0;a:5:{s:18:\"request_param_name\";s:7:\"user_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"用户id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:2:\"id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"申请id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:21:\"business_licence_cert\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:18:\"企业营业执照\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:3;a:5:{s:18:\"request_param_name\";s:19:\"legal_identity_cert\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"身份证正面\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:4;a:5:{s:18:\"request_param_name\";s:17:\"store_person_cert\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:15:\"身份证反面\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"1\";s:22:\"response_param_explain\";s:19:\"状态码，1成功\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:8:\"apply_id\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:8:\"申请id\";}}', '200', '0', '0', '2019-03-27 09:57:21', '2019-03-27 10:29:19');
INSERT INTO `ya_interface` VALUES ('41', '27', '23', '1', '上传图片', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 10:00:00', '2019-03-27 10:01:07');
INSERT INTO `ya_interface` VALUES ('42', '27', '23', '1', '提交审核', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 10:31:03', '2019-03-27 10:31:03');
INSERT INTO `ya_interface` VALUES ('43', '27', '23', '1', '忘记密码', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 10:31:32', '2019-03-27 10:31:32');
INSERT INTO `ya_interface` VALUES ('44', '20', '23', '1', '主页', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 10:33:48', '2019-03-27 10:33:48');
INSERT INTO `ya_interface` VALUES ('45', '46', '23', '1', '店铺信息', '', 'merchantsapi/Store/get_store_info', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:12:\"店铺信息\";}}', '200', '0', '0', '2019-03-27 10:54:43', '2019-03-27 19:30:02');
INSERT INTO `ya_interface` VALUES ('46', '44', '23', '1', '商家名片', '', 'merchantsapi/Store/get_store_info', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:18:\"商家店铺信息\";}}', '200', '0', '0', '2019-03-27 10:54:43', '2019-03-27 11:04:26');
INSERT INTO `ya_interface` VALUES ('47', '46', '23', '1', '店铺营业额', '', 'merchantsapi/Report/get_turnover', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:2:\"66\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:15:\"营业额数据\";}}', '200', '0', '0', '2019-03-27 11:27:48', '2019-03-27 14:48:39');
INSERT INTO `ya_interface` VALUES ('48', '46', '23', '1', '商品展示', '', 'merchantsapi/Goods/get_Goods_show', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:2:\"73\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:12:\"商品列表\";}}', '200', '0', '0', '2019-03-27 11:38:40', '2019-03-27 14:58:31');
INSERT INTO `ya_interface` VALUES ('49', '44', '23', '1', '消息', 'type:个体消息：0，全体消息：1\ncategory：0系统消息，1物流通知，2优惠促销，3商品提醒，4我的资产，5商城好店', 'merchantsapi/Message/get_message', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:9:\"seller_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:17:\"商家管理员id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:12:\"消息列表\";}}', '201', '0', '0', '2019-03-27 15:00:31', '2019-03-27 17:35:48');
INSERT INTO `ya_interface` VALUES ('50', '49', '23', '1', '联系', '', 'merchantsapi/Chat/get_chat_list', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:2:\"73\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:12:\"信息列表\";}}', '200', '0', '0', '2019-03-27 15:29:42', '2019-03-27 16:59:57');
INSERT INTO `ya_interface` VALUES ('51', '49', '23', '1', '物流', '', 'merchantsapi/Message/get_message_logistics', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"store_id\";s:21:\"request_param_example\";s:0:\"\";s:21:\"request_param_explain\";s:8:\"店铺id\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:12:\"物流信息\";}}', '200', '0', '0', '2019-03-27 15:35:01', '2019-03-27 17:57:27');
INSERT INTO `ya_interface` VALUES ('52', '49', '23', '1', '系统', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 15:35:25', '2019-03-27 15:35:25');
INSERT INTO `ya_interface` VALUES ('53', '49', '23', '1', '评价', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 15:35:50', '2019-03-27 15:35:50');
INSERT INTO `ya_interface` VALUES ('54', '20', '23', '1', '商品管理', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:23:31', '2019-03-27 19:23:31');
INSERT INTO `ya_interface` VALUES ('55', '20', '23', '1', '社区', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:23:48', '2019-03-27 19:23:48');
INSERT INTO `ya_interface` VALUES ('56', '20', '23', '1', '尔圈', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:24:09', '2019-03-27 19:24:09');
INSERT INTO `ya_interface` VALUES ('57', '20', '23', '1', '订单管理', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:24:30', '2019-03-27 19:24:30');
INSERT INTO `ya_interface` VALUES ('58', '20', '23', '1', '个人中心', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:25:16', '2019-03-27 19:25:16');
INSERT INTO `ya_interface` VALUES ('59', '20', '23', '1', '通讯录', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:25:36', '2019-03-27 19:25:36');
INSERT INTO `ya_interface` VALUES ('60', '46', '23', '1', '商家名片分享', '', '', 'GET', 'a:0:{}', 'a:0:{}', '201', '0', '0', '2019-03-27 19:32:00', '2019-03-27 19:32:00');
INSERT INTO `ya_interface` VALUES ('61', '60', '23', '1', '商家名片分享后', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:33:51', '2019-03-27 19:33:51');
INSERT INTO `ya_interface` VALUES ('62', '61', '23', '1', '商家名片分享后-联系商家', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:34:27', '2019-03-27 19:34:27');
INSERT INTO `ya_interface` VALUES ('63', '60', '23', '1', '商家名片编辑', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:34:55', '2019-03-27 19:34:55');
INSERT INTO `ya_interface` VALUES ('64', '63', '23', '1', '本店商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:35:17', '2019-03-27 19:35:17');
INSERT INTO `ya_interface` VALUES ('65', '63', '23', '1', '合作商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:35:34', '2019-03-27 19:35:34');
INSERT INTO `ya_interface` VALUES ('66', '46', '23', '1', '二维码', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:36:03', '2019-03-27 19:36:03');
INSERT INTO `ya_interface` VALUES ('67', '44', '23', '1', '排行榜', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:36:45', '2019-03-27 19:36:45');
INSERT INTO `ya_interface` VALUES ('68', '67', '23', '1', '积分', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:37:38', '2019-03-27 19:37:38');
INSERT INTO `ya_interface` VALUES ('69', '67', '23', '1', '段位', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:37:38', '2019-03-27 19:37:38');
INSERT INTO `ya_interface` VALUES ('70', '67', '23', '1', '流水', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:37:38', '2019-03-27 19:37:38');
INSERT INTO `ya_interface` VALUES ('71', '67', '23', '1', '综合', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:37:38', '2019-03-27 19:37:38');
INSERT INTO `ya_interface` VALUES ('72', '67', '23', '1', '合作商家', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:37:38', '2019-03-27 19:37:38');
INSERT INTO `ya_interface` VALUES ('73', '57', '23', '1', '指派', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:51:50', '2019-03-27 19:51:50');
INSERT INTO `ya_interface` VALUES ('74', '57', '23', '1', '添加商品/编辑商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:52:46', '2019-03-27 19:52:46');
INSERT INTO `ya_interface` VALUES ('75', '57', '23', '1', '商品排序', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:53:34', '2019-03-27 19:53:34');
INSERT INTO `ya_interface` VALUES ('76', '57', '23', '1', '下拉框', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:54:20', '2019-03-27 19:54:20');
INSERT INTO `ya_interface` VALUES ('77', '57', '23', '1', '仓库中的商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:54:33', '2019-03-27 19:54:33');
INSERT INTO `ya_interface` VALUES ('78', '57', '23', '1', '合作商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:54:50', '2019-03-27 19:54:50');
INSERT INTO `ya_interface` VALUES ('79', '57', '23', '1', '分类管理', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:55:36', '2019-03-27 19:55:36');
INSERT INTO `ya_interface` VALUES ('80', '74', '23', '1', '选择类目', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:56:50', '2019-03-27 19:56:50');
INSERT INTO `ya_interface` VALUES ('81', '77', '23', '1', '仓库中的违规商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:57:14', '2019-03-27 19:57:14');
INSERT INTO `ya_interface` VALUES ('82', '79', '23', '1', '添加分类', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:57:41', '2019-03-27 19:57:41');
INSERT INTO `ya_interface` VALUES ('83', '79', '23', '1', '指派商品', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:58:37', '2019-03-27 19:58:37');
INSERT INTO `ya_interface` VALUES ('84', '83', '23', '1', '收到授权', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:59:05', '2019-03-27 19:59:05');
INSERT INTO `ya_interface` VALUES ('85', '83', '23', '1', '已合作', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-27 19:59:22', '2019-03-27 19:59:22');

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
INSERT INTO `ya_interface_response` VALUES ('2', '0', '200', 'msg', 'ok', '状态码描述', '0');
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目';

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES ('23', '尔尔商城', '尔尔商城api接口文档', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:34:\"http://www.erershop.com/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '0', '200', '2019-03-25 10:23:50', '2019-03-26 23:45:13', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for ya_relation
-- ----------------------------
DROP TABLE IF EXISTS `ya_relation`;
CREATE TABLE `ya_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `project_id` int(11) DEFAULT NULL COMMENT '项目id',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目用户关联';

-- ----------------------------
-- Records of ya_relation
-- ----------------------------
INSERT INTO `ya_relation` VALUES ('29', '1010', '23', '2019-03-26 22:35:25');
INSERT INTO `ya_relation` VALUES ('28', '1012', '23', '2019-03-26 22:35:25');

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
) ENGINE=MyISAM AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of ya_user
-- ----------------------------
INSERT INTO `ya_user` VALUES ('1010', 'yyl', 'e3bea3e29bccd4b8d4214482bcacb59b', '192.168.0.125', '8', '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-26 19:15:52', '2019-03-27 09:30:03', '0', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1011', 'cxy', '6abebdfdca07899fbd010cbdcbeb363f', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-26 19:57:35', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES ('1012', 'zxg', '0c4341657d9fd439b23a47eeb23f0b7b', '0.0.0.0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-26 19:57:42', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00');
