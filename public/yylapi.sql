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

 Date: 26/03/2019 00:20:54
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
INSERT INTO `ya_admin` VALUES (1, 'yylAdmin', 'yyladmin@qq.com', 'yyladmin', '0827df0fd834daa31e9aec7396379033', '127.0.0.1', 14, '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', 1553520448, 0, 0, 1553520414);

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
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_interface
-- ----------------------------
INSERT INTO `ya_interface` VALUES (20, 0, 23, 1, '商家版', '', '', 'GET', 'a:0:{}', 'a:0:{}', 200, 0, 0, '2019-03-25 17:57:14', '2019-03-25 17:57:14');
INSERT INTO `ya_interface` VALUES (21, 20, 23, 1, '启动页', '', '', 'GET', 'a:0:{}', 'a:0:{}', 200, 0, 0, '2019-03-25 17:58:03', '2019-03-25 17:58:03');
INSERT INTO `ya_interface` VALUES (22, 22, 23, 1, '登录', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', 200, 0, 0, '2019-03-25 17:58:36', '2019-03-25 18:00:39');
INSERT INTO `ya_interface` VALUES (23, 23, 23, 1, '商家入驻', '', '', 'POST', 'a:0:{}', 'a:3:{i:0;a:3:{s:19:\"response_param_name\";s:6:\"status\";s:22:\"response_param_example\";s:1:\"0\";s:22:\"response_param_explain\";s:30:\"状态码，0成功，!0失败\";}i:1;a:3:{s:19:\"response_param_name\";s:7:\"message\";s:22:\"response_param_example\";s:2:\"ok\";s:22:\"response_param_explain\";s:15:\"状态码描述\";}i:2;a:3:{s:19:\"response_param_name\";s:4:\"data\";s:22:\"response_param_example\";s:4:\"json\";s:22:\"response_param_explain\";s:18:\"成功返回数据\";}}', 200, 0, 0, '2019-03-25 17:59:16', '2019-03-25 18:03:37');

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
  `apiurl_prefix` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口url前缀',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `is_disable` tinyint(4) NULL DEFAULT 0 COMMENT '0启用1禁用',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `create_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `delete_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_project
-- ----------------------------
INSERT INTO `ya_project` VALUES (23, '尔尔商城', '尔尔商城api接口文档', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:24:\"http://www.erershop.com/\";s:21:\"apiurl_prefix_default\";i:1;}}', 1, 0, 0, 200, '2019-03-25 10:23:50', '2019-03-25 14:42:17', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES (24, '12313', '12313', 'a:4:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"123123\";s:17:\"apiurl_prefix_url\";s:6:\"123123\";s:21:\"apiurl_prefix_default\";i:0;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:5:\"13123\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}i:3;a:3:{s:18:\"apiurl_prefix_name\";s:4:\"1313\";s:17:\"apiurl_prefix_url\";s:4:\"1313\";s:21:\"apiurl_prefix_default\";i:1;}}', 1, 0, 1, 200, '2019-03-25 14:43:13', '2019-03-25 14:43:13', '0000-00-00 00:00:00');
INSERT INTO `ya_project` VALUES (25, '尔尔', '尔尔', 'a:3:{i:0;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"开发\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:0;}i:1;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"测试\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}i:2;a:3:{s:18:\"apiurl_prefix_name\";s:6:\"正式\";s:17:\"apiurl_prefix_url\";s:36:\"http://192.168.0.125:8080/index.php/\";s:21:\"apiurl_prefix_default\";i:1;}}', 1, 0, 0, 200, '2019-03-25 20:50:52', '2019-03-25 20:50:52', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for ya_relation
-- ----------------------------
DROP TABLE IF EXISTS `ya_relation`;
CREATE TABLE `ya_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目用户关联' ROW_FORMAT = Dynamic;

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
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0正常1删除',
  `delete_time` datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `username`(`username`(250)) USING BTREE,
  INDEX `password`(`password`(250)) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1010 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ya_user
-- ----------------------------
INSERT INTO `ya_user` VALUES (1003, 'zxc', '0a1a1f25ab81feefd319813161e46514', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 20:26:23', '2019-03-25 20:28:14', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1004, 'qwe', '76d80224611fc919a5d54f0ff9fba446', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 20:34:33', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1005, 'asd', '7815696ecbf1c96e6894b779456d330e', '127.0.0.1', 2, '{\"os\":\"windows\",\"ie\":false,\"weixin\":false,\"android\":false,\"ios\":false}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 21:27:53', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1006, 'aass', '78fb84253ad5e7ec0ab63d04f70555de', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:10:53', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1007, 'qqww', '587b5c5a7899d8652cf24850a60e73e8', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:01', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1008, 'qqqwww', '0827df0fd834daa31e9aec7396379033', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:09', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');
INSERT INTO `ya_user` VALUES (1009, 'qqs', 'fa87d2d66521c64841a6f292d744acc4', '0.0.0.0', 0, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-25 23:11:18', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
