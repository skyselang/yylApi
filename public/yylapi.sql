/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : yylapi

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 24/03/2019 23:52:53
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
INSERT INTO `ya_admin` VALUES (1, 'yylAdmin', 'yyladmin@qq.com', 'yyladmin', '0827df0fd834daa31e9aec7396379033', '127.0.0.1', 8, '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', 1553428146, 0, 0, 1553263909);

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
  `request` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `response` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应参数',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `is_disable` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`interface_id`) USING BTREE,
  INDEX `interface_id`(`interface_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES (3, 0, 21, 1, '商家版', '', '', '', 'a:0:{}', 'a:0:{}', 200, 0, 0, '2019-03-24 22:49:13', '2019-03-24 22:49:13');
INSERT INTO `ya_interface` VALUES (4, 3, 21, 1, '登录', '', '', '', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:5:\"phone\";s:21:\"request_param_example\";s:11:\"18123456789\";s:21:\"request_param_explain\";s:12:\"手机号码\";s:18:\"request_param_must\";s:3:\"是\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 22:50:31', '2019-03-24 22:50:31');
INSERT INTO `ya_interface` VALUES (5, 3, 21, 1, '商家入驻', '', 'http://yylapi.com/admin.html', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:5:\"phone\";s:21:\"request_param_example\";s:11:\"18123456789\";s:21:\"request_param_explain\";s:12:\"手机号码\";s:18:\"request_param_must\";s:3:\"是\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 22:51:49', '2019-03-24 22:51:49');
INSERT INTO `ya_interface` VALUES (6, 3, 21, 1, '提交资料', '', 'http://yylapi.com/admin.html', 'GET', 'a:2:{i:0;a:5:{s:18:\"request_param_name\";s:2:\"13\";s:21:\"request_param_example\";s:2:\"13\";s:21:\"request_param_explain\";s:2:\"13\";s:18:\"request_param_must\";s:3:\"是\";s:18:\"request_param_type\";s:6:\"String\";}i:1;a:5:{s:18:\"request_param_name\";s:2:\"13\";s:21:\"reques', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 22:53:08', '2019-03-24 22:53:08');
INSERT INTO `ya_interface` VALUES (7, 0, 21, 1, '获取订单', '', '', 'GET', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 22:53:27', '2019-03-24 22:53:27');
INSERT INTO `ya_interface` VALUES (8, 0, 21, 1, '圈子', '', '', 'GET', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 22:59:28', '2019-03-24 22:59:28');
INSERT INTO `ya_interface` VALUES (9, 7, 21, 1, '订单列表', '', 'http://yylapi.com/admin.html', 'GET', 'a:1:{i:0;a:5:{s:18:\"request_param_name\";s:8:\"order_id\";s:21:\"request_param_example\";s:1:\"1\";s:21:\"request_param_explain\";s:8:\"订单id\";s:18:\"request_param_must\";s:3:\"是\";s:18:\"request_param_type\";s:6:\"String\";}}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 23:03:36', '2019-03-24 23:03:36');
INSERT INTO `ya_interface` VALUES (10, 3, 21, 1, '订单', '', '', 'GET', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 23:37:10', '2019-03-24 23:37:10');
INSERT INTO `ya_interface` VALUES (11, 10, 21, 1, '订单列表', '', '', 'GET', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_ex', 200, 0, 0, '2019-03-24 23:37:26', '2019-03-24 23:37:26');

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
-- Records of ya_interface_response
-- ----------------------------
INSERT INTO `ya_interface_response` VALUES (1, 0, 200, 'status', '0', '状态码，0成功，!0失败', 0);
INSERT INTO `ya_interface_response` VALUES (2, 0, 200, 'message', 'ok', '状态码描述', 0);
INSERT INTO `ya_interface_response` VALUES (3, 0, 200, 'data', 'json', '成功返回数据', 0);

-- ----------------------------
-- Table structure for ya_project
-- ----------------------------
DROP TABLE IF EXISTS `ya_project`;
CREATE TABLE `ya_project`  (
  `project_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `project_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `is_disable` tinyint(4) NULL DEFAULT 0 COMMENT '0启用1禁用',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `create_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `delete_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES (21, '尔尔科技', '尔尔科技商城接口文档', 1, 0, 0, 200, '2019-03-24 21:53:47', '2019-03-24 21:53:47', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES (22, '大米科技', '大米科技街口', 1, 0, 0, 200, '2019-03-24 23:46:27', '2019-03-24 23:46:27', '0000-00-00 00:00:00');

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
  `login_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登录时间',
  `exit_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '退出时间',
  `create_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `username`(`username`(250)) USING BTREE,
  INDEX `password`(`password`(250)) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_user
-- ----------------------------
INSERT INTO `ya_user` VALUES (1000, 'zxg', '0c4341657d9fd439b23a47eeb23f0b7b', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-23 11:19:22', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1001, 'yyladmin', '0827df0fd834daa31e9aec7396379033', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-23 11:20:21', '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1002, 'zxg1', '16f7e357f475f61b8b5703556d688ea0', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-23 11:20:39', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
