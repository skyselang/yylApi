/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : yylapi

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 30/05/2019 00:26:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ya_admin
-- ----------------------------
DROP TABLE IF EXISTS `ya_admin`;
CREATE TABLE `ya_admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'yylAdmin' COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '密码',
  `login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.0.0.0' COMMENT '登录ip',
  `login_num` int(11) NULL DEFAULT 0 COMMENT '登录次数',
  `device` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录设备',
  `login_time` int(11) NULL DEFAULT 0 COMMENT '登录时间',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT 0 COMMENT '修改时间',
  `exit_time` int(11) NULL DEFAULT 0 COMMENT '退出时间',
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `password`(`password`(250)) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_admin
-- ----------------------------
INSERT INTO `ya_admin` VALUES (1, 'yylAdmin', NULL, 'yyladmin', '0827df0fd834daa31e9aec7396379033', '127.0.0.1', 3, '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', 1559132939, 0, 0, 0);

-- ----------------------------
-- Table structure for ya_interface
-- ----------------------------
DROP TABLE IF EXISTS `ya_interface`;
CREATE TABLE `ya_interface`  (
  `interface_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '接口id',
  `interface_pid` int(11) NULL DEFAULT 0 COMMENT '上级id，0顶级id',
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `admin_id` int(11) NULL DEFAULT 0 COMMENT '管理员id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口说明',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口url',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'GET' COMMENT '请求方式',
  `request` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '响应参数',
  `response_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回数据示例',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `is_disable` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`interface_id`) USING BTREE,
  INDEX `interface_id`(`interface_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES (177, 0, 27, 1, '获取活动浏览量', '接口默认get请求，非必须参数可不传', 'share/api/api', 'GET', 'a:3:{i:0;a:5:{s:18:\"request_param_name\";s:1:\"1\";s:21:\"request_param_example\";s:1:\"3\";s:21:\"request_param_explain\";s:1:\"2\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:1:\"1\";s:21:\"request_param_example\";s:1:\"3\";s:21:\"request_param_explain\";s:1:\"2\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}i:2;a:5:{s:18:\"request_param_name\";s:1:\"1\";s:21:\"request_param_example\";s:1:\"3\";s:21:\"request_param_explain\";s:1:\"2\";s:18:\"request_param_must\";s:1:\"0\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:4:\"code\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:29:\"返回码，0成功，1失败\";}i:1;a:3:{s:19:\"response_param_name\";s:3:\"msg\";s:22:\"response_param_example\";s:21:\"获取浏览数成功\";s:22:\"response_param_explain\";s:15:\"返回码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:0:\"\";s:22:\"response_param_explain\";s:25:\"成功时返回json数据\";}}', '<p>失败</p><p style=\"white-space: normal;\">{</p><p style=\"white-space: normal;\">&nbsp; &nbsp; &quot;code&quot;: 1,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&quot;msg&quot;:&#39;缺少参数&#39;</p><p style=\"white-space: normal;\">}</p><p style=\"white-space: normal;\">成功</p><p>{</p><p>&nbsp; &nbsp; &quot;code&quot;: 0,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&quot;msg&quot;:&#39;ok&#39;,<br/></p><p>&nbsp; &nbsp; &quot;data&quot;:{//成功返回数据<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &quot;prom_id&quot;: 107,//活动id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &quot;visit_num&quot;: 4 //浏览数</p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>}</p><p><br/></p>', 200, 0, 0, '2019-05-06 22:10:59', '2019-05-30 00:25:57');
INSERT INTO `ya_interface` VALUES (178, 0, 28, 1, '接口1', '', '', 'GET', 'a:0:{}', 'a:0:{}', NULL, 200, 0, 0, '2019-05-06 22:11:13', '2019-05-06 22:11:13');
INSERT INTO `ya_interface` VALUES (179, 0, 29, 1, '接口2', '', '', 'GET', 'a:0:{}', 'a:0:{}', NULL, 200, 0, 0, '2019-05-06 22:11:37', '2019-05-06 22:11:37');
INSERT INTO `ya_interface` VALUES (180, 0, 30, 1, '接口3', '', '', 'GET', 'a:0:{}', 'a:0:{}', NULL, 200, 0, 0, '2019-05-06 22:11:51', '2019-05-06 22:11:51');
INSERT INTO `ya_interface` VALUES (181, 0, 30, 1, '接口31', '', '', 'GET', 'a:0:{}', 'a:0:{}', NULL, 200, 0, 0, '2019-05-06 22:12:09', '2019-05-06 22:12:09');

-- ----------------------------
-- Table structure for ya_interface_response
-- ----------------------------
DROP TABLE IF EXISTS `ya_interface_response`;
CREATE TABLE `ya_interface_response`  (
  `response_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '返回参数id',
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `response_sort` int(11) NULL DEFAULT 200 COMMENT '返回参数排序',
  `response_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数名',
  `response_example` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数示例值',
  `response_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数说明',
  `is_delete` tinyint(255) NULL DEFAULT 0 COMMENT '0正常1删除',
  PRIMARY KEY (`response_id`) USING BTREE,
  INDEX `response_id`(`response_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口返回参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ya_project
-- ----------------------------
DROP TABLE IF EXISTS `ya_project`;
CREATE TABLE `ya_project`  (
  `project_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `project_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `apiurl_prefix` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口url前缀',
  `admin_id` int(11) NULL DEFAULT 0 COMMENT '创建者id',
  `is_disable` tinyint(4) NULL DEFAULT 0 COMMENT '0启用1禁用',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES (27, '项目名称0', '项目描述0', 'a:1:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"本地\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.1.110:8081/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}}', 1, 0, 0, 200, '2019-05-06 22:06:47', '2019-05-06 22:09:51', NULL);
INSERT INTO `ya_project` VALUES (28, '项目名称1', '项目描述1', 'a:1:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"本地\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.1.110:8081/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}}', 1, 0, 0, 200, '2019-05-06 22:09:15', '2019-05-06 22:09:15', NULL);
INSERT INTO `ya_project` VALUES (29, '项目名称2', '项目描述2', 'a:1:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"本地\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.1.110:8081/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}}', 1, 0, 0, 200, '2019-05-06 22:09:30', '2019-05-06 22:09:30', NULL);
INSERT INTO `ya_project` VALUES (30, '项目名称3', '项目描述3', 'a:1:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"本地\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.1.110:8081/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}}', 1, 0, 0, 200, '2019-05-06 22:10:23', '2019-05-06 22:10:23', NULL);

-- ----------------------------
-- Table structure for ya_relation
-- ----------------------------
DROP TABLE IF EXISTS `ya_relation`;
CREATE TABLE `ya_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目用户关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_relation
-- ----------------------------
INSERT INTO `ya_relation` VALUES (30, 1013, 27, '2019-05-06 22:24:45');

-- ----------------------------
-- Table structure for ya_user
-- ----------------------------
DROP TABLE IF EXISTS `ya_user`;
CREATE TABLE `ya_user`  (
  `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.0.0.0' COMMENT '登录ip',
  `login_num` int(11) NULL DEFAULT 0 COMMENT '登录次数',
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录设备',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常1删除',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `exit_time` datetime(0) NULL DEFAULT NULL COMMENT '退出时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1014 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_user
-- ----------------------------
INSERT INTO `ya_user` VALUES (1013, 'yyladmin', '0827df0fd834daa31e9aec7396379033', '192.168.1.110', 1, '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', 0, '2019-05-06 22:24:25', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
