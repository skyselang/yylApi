/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yylapi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-25 18:09:21
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
INSERT INTO `ya_admin` VALUES ('1', 'yylAdmin', 'yyladmin@qq.com', 'yyladmin', '0827df0fd834daa31e9aec7396379033', '192.168.0.125', '12', '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '1553480176', '0', '0', '1553263909');

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='接口';

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES ('20', '0', '23', '1', '商家版', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:57:14', '2019-03-25 17:57:14');
INSERT INTO `ya_interface` VALUES ('21', '20', '23', '1', '启动页', '', '', 'GET', 'a:0:{}', 'a:0:{}', '200', '0', '0', '2019-03-25 17:58:03', '2019-03-25 17:58:03');
INSERT INTO `ya_interface` VALUES ('22', '22', '23', '1', '登录', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:58:36', '2019-03-25 18:00:39');
INSERT INTO `ya_interface` VALUES ('23', '23', '23', '1', '商家入驻', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', '200', '0', '0', '2019-03-25 17:59:16', '2019-03-25 18:03:37');

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目';

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES ('23', '尔尔商城', '尔尔商城api接口文档', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:24:\"http://www.erershop.com/\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '0', '200', '2019-03-25 10:23:50', '2019-03-25 14:42:17', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES ('24', '12313', '12313', 'a:4:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"123123\";s:17:\"apiurl_prefix_url\";s:6:\"123123\";s:21:\"apiurl_prefix_default\";i:0;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:5:\"13123\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}i:3;a:3:{s:18:\"apiurl_prefix_name\";s:4:\"1313\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}}', '1', '0', '1', '200', '2019-03-25 14:43:13', '2019-03-25 14:43:13', '0000-00-00 00:00:00');

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
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `username` (`username`(250)) USING BTREE,
  KEY `password` (`password`(250)) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of ya_user
-- ----------------------------
