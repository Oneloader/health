/*
 Navicat Premium Data Transfer

 Source Server         : k11
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : health2

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 21/08/2018 15:57:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for one_action
-- ----------------------------
DROP TABLE IF EXISTS `one_action`;
CREATE TABLE `one_action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '行为规则',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_action
-- ----------------------------
INSERT INTO `one_action` VALUES (1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220);
INSERT INTO `one_action` VALUES (2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180);
INSERT INTO `one_action` VALUES (3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646);
INSERT INTO `one_action` VALUES (4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726);
INSERT INTO `one_action` VALUES (5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551);
INSERT INTO `one_action` VALUES (6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988);
INSERT INTO `one_action` VALUES (7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057);
INSERT INTO `one_action` VALUES (8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963);
INSERT INTO `one_action` VALUES (9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301);
INSERT INTO `one_action` VALUES (10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392);
INSERT INTO `one_action` VALUES (11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- ----------------------------
-- Table structure for one_action_log
-- ----------------------------
DROP TABLE IF EXISTS `one_action_log`;
CREATE TABLE `one_action_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发行为的数据id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action_ip_ix`(`action_ip`) USING BTREE,
  INDEX `action_id_ix`(`action_id`) USING BTREE,
  INDEX `user_id_ix`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 622 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为日志表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_action_log
-- ----------------------------
INSERT INTO `one_action_log` VALUES (1, 1, 1, 2130706433, 'member', 1, 'admin在2018-06-28 14:07登录了后台', 1, 1530166069);
INSERT INTO `one_action_log` VALUES (2, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166098);
INSERT INTO `one_action_log` VALUES (3, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166118);
INSERT INTO `one_action_log` VALUES (4, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166142);
INSERT INTO `one_action_log` VALUES (5, 8, 1, 2130706433, 'attribute', 33, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530166214);
INSERT INTO `one_action_log` VALUES (6, 11, 1, 2130706433, 'category', 2, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530166335);
INSERT INTO `one_action_log` VALUES (7, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166358);
INSERT INTO `one_action_log` VALUES (8, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166458);
INSERT INTO `one_action_log` VALUES (9, 8, 1, 2130706433, 'attribute', 34, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530166648);
INSERT INTO `one_action_log` VALUES (10, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166663);
INSERT INTO `one_action_log` VALUES (11, 8, 1, 2130706433, 'attribute', 35, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530166780);
INSERT INTO `one_action_log` VALUES (12, 8, 1, 2130706433, 'attribute', 36, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530166805);
INSERT INTO `one_action_log` VALUES (13, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166830);
INSERT INTO `one_action_log` VALUES (14, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166866);
INSERT INTO `one_action_log` VALUES (15, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530166917);
INSERT INTO `one_action_log` VALUES (16, 8, 1, 2130706433, 'attribute', 37, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530167311);
INSERT INTO `one_action_log` VALUES (17, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530167311);
INSERT INTO `one_action_log` VALUES (18, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530167311);
INSERT INTO `one_action_log` VALUES (19, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167318);
INSERT INTO `one_action_log` VALUES (20, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167351);
INSERT INTO `one_action_log` VALUES (21, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167372);
INSERT INTO `one_action_log` VALUES (22, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167377);
INSERT INTO `one_action_log` VALUES (23, 7, 1, 2130706433, 'model', 5, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167394);
INSERT INTO `one_action_log` VALUES (24, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167413);
INSERT INTO `one_action_log` VALUES (25, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530167438);
INSERT INTO `one_action_log` VALUES (26, 8, 1, 2130706433, 'attribute', 40, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530167661);
INSERT INTO `one_action_log` VALUES (27, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530167696);
INSERT INTO `one_action_log` VALUES (28, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530168155);
INSERT INTO `one_action_log` VALUES (29, 8, 1, 2130706433, 'attribute', 42, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530168255);
INSERT INTO `one_action_log` VALUES (30, 8, 1, 2130706433, 'attribute', 43, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530168291);
INSERT INTO `one_action_log` VALUES (31, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530168303);
INSERT INTO `one_action_log` VALUES (32, 11, 1, 2130706433, 'category', 2, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530168319);
INSERT INTO `one_action_log` VALUES (33, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530168527);
INSERT INTO `one_action_log` VALUES (34, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530168569);
INSERT INTO `one_action_log` VALUES (35, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530168840);
INSERT INTO `one_action_log` VALUES (36, 8, 1, 2130706433, 'attribute', 33, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530169159);
INSERT INTO `one_action_log` VALUES (37, 8, 1, 2130706433, 'attribute', 33, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530169186);
INSERT INTO `one_action_log` VALUES (38, 8, 1, 2130706433, 'attribute', 33, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530169266);
INSERT INTO `one_action_log` VALUES (39, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/Admin/Category/remove/id/39.html', 1, 1530169323);
INSERT INTO `one_action_log` VALUES (40, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530169340);
INSERT INTO `one_action_log` VALUES (41, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169437);
INSERT INTO `one_action_log` VALUES (42, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169542);
INSERT INTO `one_action_log` VALUES (43, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169547);
INSERT INTO `one_action_log` VALUES (44, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169619);
INSERT INTO `one_action_log` VALUES (45, 8, 1, 2130706433, 'attribute', 3, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530169670);
INSERT INTO `one_action_log` VALUES (46, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530169755);
INSERT INTO `one_action_log` VALUES (47, 8, 1, 2130706433, 'attribute', 35, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530169860);
INSERT INTO `one_action_log` VALUES (48, 8, 1, 2130706433, 'attribute', 44, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530169967);
INSERT INTO `one_action_log` VALUES (49, 8, 1, 2130706433, 'attribute', 45, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530169967);
INSERT INTO `one_action_log` VALUES (50, 8, 1, 2130706433, 'attribute', 46, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530169967);
INSERT INTO `one_action_log` VALUES (51, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169975);
INSERT INTO `one_action_log` VALUES (52, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530169992);
INSERT INTO `one_action_log` VALUES (53, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530170018);
INSERT INTO `one_action_log` VALUES (54, 8, 1, 2130706433, 'attribute', 47, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530171834);
INSERT INTO `one_action_log` VALUES (55, 8, 1, 2130706433, 'attribute', 48, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530171871);
INSERT INTO `one_action_log` VALUES (56, 8, 1, 2130706433, 'attribute', 49, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530171901);
INSERT INTO `one_action_log` VALUES (57, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530171917);
INSERT INTO `one_action_log` VALUES (58, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530171948);
INSERT INTO `one_action_log` VALUES (59, 1, 1, 2130706433, 'member', 1, 'admin在2018-06-28 16:06登录了后台', 1, 1530173173);
INSERT INTO `one_action_log` VALUES (60, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530174828);
INSERT INTO `one_action_log` VALUES (61, 1, 1, 2130706433, 'member', 1, 'admin在2018-06-28 17:12登录了后台', 1, 1530177170);
INSERT INTO `one_action_log` VALUES (62, 1, 1, 2130706433, 'member', 1, 'admin在2018-06-29 12:20登录了后台', 1, 1530246057);
INSERT INTO `one_action_log` VALUES (63, 8, 1, 2130706433, 'attribute', 50, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530246129);
INSERT INTO `one_action_log` VALUES (64, 8, 1, 2130706433, 'attribute', 51, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530246129);
INSERT INTO `one_action_log` VALUES (65, 8, 1, 2130706433, 'attribute', 52, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530246129);
INSERT INTO `one_action_log` VALUES (66, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530246184);
INSERT INTO `one_action_log` VALUES (67, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530246197);
INSERT INTO `one_action_log` VALUES (68, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530246226);
INSERT INTO `one_action_log` VALUES (69, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530246265);
INSERT INTO `one_action_log` VALUES (70, 8, 1, 2130706433, 'attribute', 53, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530246403);
INSERT INTO `one_action_log` VALUES (71, 7, 1, 2130706433, 'model', 1, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530247998);
INSERT INTO `one_action_log` VALUES (72, 8, 1, 2130706433, 'attribute', 54, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530248075);
INSERT INTO `one_action_log` VALUES (73, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530248094);
INSERT INTO `one_action_log` VALUES (74, 8, 1, 2130706433, 'attribute', 3, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530248334);
INSERT INTO `one_action_log` VALUES (75, 7, 1, 2130706433, 'model', 1, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530249035);
INSERT INTO `one_action_log` VALUES (76, 8, 1, 2130706433, 'attribute', 55, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530249489);
INSERT INTO `one_action_log` VALUES (77, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530250147);
INSERT INTO `one_action_log` VALUES (78, 7, 1, 2130706433, 'model', 1, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530250195);
INSERT INTO `one_action_log` VALUES (79, 8, 1, 2130706433, 'attribute', 56, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530251219);
INSERT INTO `one_action_log` VALUES (80, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530251245);
INSERT INTO `one_action_log` VALUES (81, 8, 1, 2130706433, 'attribute', 57, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530251271);
INSERT INTO `one_action_log` VALUES (82, 7, 1, 2130706433, 'model', 8, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530251285);
INSERT INTO `one_action_log` VALUES (83, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530252473);
INSERT INTO `one_action_log` VALUES (84, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530252483);
INSERT INTO `one_action_log` VALUES (85, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530252491);
INSERT INTO `one_action_log` VALUES (86, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530252495);
INSERT INTO `one_action_log` VALUES (87, 8, 1, 2130706433, 'attribute', 54, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530256812);
INSERT INTO `one_action_log` VALUES (88, 8, 1, 2130706433, 'attribute', 54, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530256894);
INSERT INTO `one_action_log` VALUES (89, 8, 1, 2130706433, 'attribute', 54, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530257430);
INSERT INTO `one_action_log` VALUES (90, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530258018);
INSERT INTO `one_action_log` VALUES (91, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530258026);
INSERT INTO `one_action_log` VALUES (92, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530258036);
INSERT INTO `one_action_log` VALUES (93, 7, 1, 2130706433, 'model', 9, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530258091);
INSERT INTO `one_action_log` VALUES (94, 7, 1, 2130706433, 'model', 9, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530258105);
INSERT INTO `one_action_log` VALUES (95, 7, 1, 2130706433, 'model', 9, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530258138);
INSERT INTO `one_action_log` VALUES (96, 7, 1, 2130706433, 'model', 9, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530258149);
INSERT INTO `one_action_log` VALUES (97, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530258528);
INSERT INTO `one_action_log` VALUES (98, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530258555);
INSERT INTO `one_action_log` VALUES (99, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530258564);
INSERT INTO `one_action_log` VALUES (100, 8, 1, 2130706433, 'attribute', 58, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530258690);
INSERT INTO `one_action_log` VALUES (101, 7, 1, 2130706433, 'model', 9, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530258744);
INSERT INTO `one_action_log` VALUES (102, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-02 10:21登录了后台', 1, 1530498077);
INSERT INTO `one_action_log` VALUES (103, 8, 1, 2130706433, 'attribute', 59, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530499332);
INSERT INTO `one_action_log` VALUES (104, 8, 1, 2130706433, 'attribute', 60, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530499332);
INSERT INTO `one_action_log` VALUES (105, 8, 1, 2130706433, 'attribute', 61, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530499332);
INSERT INTO `one_action_log` VALUES (106, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530499364);
INSERT INTO `one_action_log` VALUES (107, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530499377);
INSERT INTO `one_action_log` VALUES (108, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530501189);
INSERT INTO `one_action_log` VALUES (109, 8, 1, 2130706433, 'attribute', 62, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530507066);
INSERT INTO `one_action_log` VALUES (110, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530507126);
INSERT INTO `one_action_log` VALUES (111, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530507162);
INSERT INTO `one_action_log` VALUES (112, 8, 1, 2130706433, 'attribute', 62, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530507299);
INSERT INTO `one_action_log` VALUES (113, 8, 1, 2130706433, 'attribute', 63, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530507607);
INSERT INTO `one_action_log` VALUES (114, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530507624);
INSERT INTO `one_action_log` VALUES (115, 8, 1, 2130706433, 'attribute', 48, '操作url：/index.php?s=/Admin/Attribute/remove/id/48.html', 1, 1530507917);
INSERT INTO `one_action_log` VALUES (116, 8, 1, 2130706433, 'attribute', 47, '操作url：/index.php?s=/Admin/Attribute/remove/id/47.html', 1, 1530507920);
INSERT INTO `one_action_log` VALUES (117, 8, 1, 2130706433, 'attribute', 64, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530507979);
INSERT INTO `one_action_log` VALUES (118, 8, 1, 2130706433, 'attribute', 65, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530507994);
INSERT INTO `one_action_log` VALUES (119, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530508011);
INSERT INTO `one_action_log` VALUES (120, 7, 1, 2130706433, 'model', 10, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530509281);
INSERT INTO `one_action_log` VALUES (121, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530510293);
INSERT INTO `one_action_log` VALUES (122, 7, 1, 2130706433, 'model', 7, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530510343);
INSERT INTO `one_action_log` VALUES (123, 8, 1, 2130706433, 'attribute', 66, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530510795);
INSERT INTO `one_action_log` VALUES (124, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530512837);
INSERT INTO `one_action_log` VALUES (125, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530512848);
INSERT INTO `one_action_log` VALUES (126, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530513066);
INSERT INTO `one_action_log` VALUES (127, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530513170);
INSERT INTO `one_action_log` VALUES (128, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530513178);
INSERT INTO `one_action_log` VALUES (129, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530513222);
INSERT INTO `one_action_log` VALUES (130, 8, 1, 2130706433, 'attribute', 67, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530513312);
INSERT INTO `one_action_log` VALUES (131, 8, 1, 2130706433, 'attribute', 68, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530513410);
INSERT INTO `one_action_log` VALUES (132, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530513424);
INSERT INTO `one_action_log` VALUES (133, 8, 1, 2130706433, 'attribute', 3, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530513939);
INSERT INTO `one_action_log` VALUES (134, 7, 1, 2130706433, 'model', 13, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530514036);
INSERT INTO `one_action_log` VALUES (135, 8, 1, 2130706433, 'attribute', 69, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530514087);
INSERT INTO `one_action_log` VALUES (136, 8, 1, 2130706433, 'attribute', 70, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530514116);
INSERT INTO `one_action_log` VALUES (137, 8, 1, 2130706433, 'attribute', 71, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530514149);
INSERT INTO `one_action_log` VALUES (138, 7, 1, 2130706433, 'model', 13, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530514271);
INSERT INTO `one_action_log` VALUES (139, 7, 1, 2130706433, 'model', 14, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530514473);
INSERT INTO `one_action_log` VALUES (140, 7, 1, 2130706433, 'model', 14, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530514571);
INSERT INTO `one_action_log` VALUES (141, 7, 1, 2130706433, 'model', 14, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530514594);
INSERT INTO `one_action_log` VALUES (142, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515327);
INSERT INTO `one_action_log` VALUES (143, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515346);
INSERT INTO `one_action_log` VALUES (144, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515354);
INSERT INTO `one_action_log` VALUES (145, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515366);
INSERT INTO `one_action_log` VALUES (146, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515372);
INSERT INTO `one_action_log` VALUES (147, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515513);
INSERT INTO `one_action_log` VALUES (148, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530515532);
INSERT INTO `one_action_log` VALUES (149, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530515546);
INSERT INTO `one_action_log` VALUES (150, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515646);
INSERT INTO `one_action_log` VALUES (151, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530515670);
INSERT INTO `one_action_log` VALUES (152, 8, 1, 2130706433, 'attribute', 72, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530515758);
INSERT INTO `one_action_log` VALUES (153, 8, 1, 2130706433, 'attribute', 73, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530515758);
INSERT INTO `one_action_log` VALUES (154, 7, 1, 2130706433, 'model', 15, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530515778);
INSERT INTO `one_action_log` VALUES (155, 7, 1, 2130706433, 'model', 15, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530515814);
INSERT INTO `one_action_log` VALUES (156, 11, 1, 2130706433, 'category', 44, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530515847);
INSERT INTO `one_action_log` VALUES (157, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530522146);
INSERT INTO `one_action_log` VALUES (158, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530523126);
INSERT INTO `one_action_log` VALUES (159, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530523133);
INSERT INTO `one_action_log` VALUES (160, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/Admin/Category/remove/id/45.html', 1, 1530523179);
INSERT INTO `one_action_log` VALUES (161, 8, 1, 2130706433, 'attribute', 40, '操作url：/index.php?s=/Admin/Attribute/remove/id/40.html', 1, 1530523276);
INSERT INTO `one_action_log` VALUES (162, 8, 1, 2130706433, 'attribute', 41, '操作url：/index.php?s=/Admin/Attribute/remove/id/41.html', 1, 1530523279);
INSERT INTO `one_action_log` VALUES (163, 8, 1, 2130706433, 'attribute', 42, '操作url：/index.php?s=/Admin/Attribute/remove/id/42.html', 1, 1530523281);
INSERT INTO `one_action_log` VALUES (164, 8, 1, 2130706433, 'attribute', 43, '操作url：/index.php?s=/Admin/Attribute/remove/id/43.html', 1, 1530523282);
INSERT INTO `one_action_log` VALUES (165, 8, 1, 2130706433, 'attribute', 74, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523309);
INSERT INTO `one_action_log` VALUES (166, 8, 1, 2130706433, 'attribute', 75, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523322);
INSERT INTO `one_action_log` VALUES (167, 7, 1, 2130706433, 'model', 6, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523337);
INSERT INTO `one_action_log` VALUES (168, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530523363);
INSERT INTO `one_action_log` VALUES (169, 8, 1, 2130706433, 'attribute', 76, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530523465);
INSERT INTO `one_action_log` VALUES (170, 8, 1, 2130706433, 'attribute', 77, '操作url：/index.php?s=/Admin/Model/generate.html', 1, 1530523465);
INSERT INTO `one_action_log` VALUES (171, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523476);
INSERT INTO `one_action_log` VALUES (172, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523486);
INSERT INTO `one_action_log` VALUES (173, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523498);
INSERT INTO `one_action_log` VALUES (174, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523521);
INSERT INTO `one_action_log` VALUES (175, 8, 1, 2130706433, 'attribute', 78, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523599);
INSERT INTO `one_action_log` VALUES (176, 8, 1, 2130706433, 'attribute', 79, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523637);
INSERT INTO `one_action_log` VALUES (177, 8, 1, 2130706433, 'attribute', 80, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523667);
INSERT INTO `one_action_log` VALUES (178, 8, 1, 2130706433, 'attribute', 81, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530523690);
INSERT INTO `one_action_log` VALUES (179, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530523725);
INSERT INTO `one_action_log` VALUES (180, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530523752);
INSERT INTO `one_action_log` VALUES (181, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530524348);
INSERT INTO `one_action_log` VALUES (182, 8, 1, 2130706433, 'attribute', 82, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530524879);
INSERT INTO `one_action_log` VALUES (183, 8, 1, 2130706433, 'attribute', 83, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530524902);
INSERT INTO `one_action_log` VALUES (184, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530524913);
INSERT INTO `one_action_log` VALUES (185, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-03 09:52登录了后台', 1, 1530582777);
INSERT INTO `one_action_log` VALUES (186, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530596571);
INSERT INTO `one_action_log` VALUES (187, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530596578);
INSERT INTO `one_action_log` VALUES (188, 11, 1, 2130706433, 'category', 44, '操作url：/index.php?s=/Admin/Category/remove/id/44.html', 1, 1530596649);
INSERT INTO `one_action_log` VALUES (189, 8, 1, 2130706433, 'attribute', 84, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530600260);
INSERT INTO `one_action_log` VALUES (190, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530600278);
INSERT INTO `one_action_log` VALUES (191, 8, 1, 2130706433, 'attribute', 84, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530600289);
INSERT INTO `one_action_log` VALUES (192, 8, 1, 2130706433, 'attribute', 85, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530600308);
INSERT INTO `one_action_log` VALUES (193, 8, 1, 2130706433, 'attribute', 85, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530600464);
INSERT INTO `one_action_log` VALUES (194, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530600481);
INSERT INTO `one_action_log` VALUES (195, 8, 1, 2130706433, 'attribute', 85, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530600581);
INSERT INTO `one_action_log` VALUES (196, 8, 1, 2130706433, 'attribute', 85, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530606117);
INSERT INTO `one_action_log` VALUES (197, 8, 1, 2130706433, 'attribute', 85, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530606201);
INSERT INTO `one_action_log` VALUES (198, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530607778);
INSERT INTO `one_action_log` VALUES (199, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530607788);
INSERT INTO `one_action_log` VALUES (200, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530607855);
INSERT INTO `one_action_log` VALUES (201, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530608159);
INSERT INTO `one_action_log` VALUES (202, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530608173);
INSERT INTO `one_action_log` VALUES (203, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530608192);
INSERT INTO `one_action_log` VALUES (204, 8, 1, 2130706433, 'attribute', 86, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530608249);
INSERT INTO `one_action_log` VALUES (205, 8, 1, 2130706433, 'attribute', 87, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530608280);
INSERT INTO `one_action_log` VALUES (206, 8, 1, 2130706433, 'attribute', 88, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530608302);
INSERT INTO `one_action_log` VALUES (207, 8, 1, 2130706433, 'attribute', 89, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530608325);
INSERT INTO `one_action_log` VALUES (208, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530608364);
INSERT INTO `one_action_log` VALUES (209, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530608382);
INSERT INTO `one_action_log` VALUES (210, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530608514);
INSERT INTO `one_action_log` VALUES (211, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530608824);
INSERT INTO `one_action_log` VALUES (212, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530609400);
INSERT INTO `one_action_log` VALUES (213, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530609415);
INSERT INTO `one_action_log` VALUES (214, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530609443);
INSERT INTO `one_action_log` VALUES (215, 8, 1, 2130706433, 'attribute', 90, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530609486);
INSERT INTO `one_action_log` VALUES (216, 8, 1, 2130706433, 'attribute', 91, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530609506);
INSERT INTO `one_action_log` VALUES (217, 8, 1, 2130706433, 'attribute', 92, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530609528);
INSERT INTO `one_action_log` VALUES (218, 8, 1, 2130706433, 'attribute', 93, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530609547);
INSERT INTO `one_action_log` VALUES (219, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530609558);
INSERT INTO `one_action_log` VALUES (220, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530609590);
INSERT INTO `one_action_log` VALUES (221, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-04 09:57登录了后台', 1, 1530669421);
INSERT INTO `one_action_log` VALUES (222, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530693597);
INSERT INTO `one_action_log` VALUES (223, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530693606);
INSERT INTO `one_action_log` VALUES (224, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530693640);
INSERT INTO `one_action_log` VALUES (225, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530693655);
INSERT INTO `one_action_log` VALUES (226, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530693678);
INSERT INTO `one_action_log` VALUES (227, 8, 1, 2130706433, 'attribute', 94, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530693817);
INSERT INTO `one_action_log` VALUES (228, 8, 1, 2130706433, 'attribute', 95, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530693878);
INSERT INTO `one_action_log` VALUES (229, 8, 1, 2130706433, 'attribute', 96, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530693948);
INSERT INTO `one_action_log` VALUES (230, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530696832);
INSERT INTO `one_action_log` VALUES (231, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1530696852);
INSERT INTO `one_action_log` VALUES (232, 8, 1, 2130706433, 'attribute', 97, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1530697133);
INSERT INTO `one_action_log` VALUES (233, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530697162);
INSERT INTO `one_action_log` VALUES (234, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530697296);
INSERT INTO `one_action_log` VALUES (235, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1530697302);
INSERT INTO `one_action_log` VALUES (236, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-06 13:12登录了后台', 1, 1530853938);
INSERT INTO `one_action_log` VALUES (237, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869490);
INSERT INTO `one_action_log` VALUES (238, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869503);
INSERT INTO `one_action_log` VALUES (239, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869515);
INSERT INTO `one_action_log` VALUES (240, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869535);
INSERT INTO `one_action_log` VALUES (241, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869545);
INSERT INTO `one_action_log` VALUES (242, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1530869992);
INSERT INTO `one_action_log` VALUES (243, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-09 10:10登录了后台', 1, 1531102200);
INSERT INTO `one_action_log` VALUES (244, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531111502);
INSERT INTO `one_action_log` VALUES (245, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531111541);
INSERT INTO `one_action_log` VALUES (246, 8, 1, 2130706433, 'attribute', 95, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531114908);
INSERT INTO `one_action_log` VALUES (247, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531120210);
INSERT INTO `one_action_log` VALUES (248, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531120242);
INSERT INTO `one_action_log` VALUES (249, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531122523);
INSERT INTO `one_action_log` VALUES (250, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531122535);
INSERT INTO `one_action_log` VALUES (251, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531122891);
INSERT INTO `one_action_log` VALUES (252, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531123385);
INSERT INTO `one_action_log` VALUES (253, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531124779);
INSERT INTO `one_action_log` VALUES (254, 8, 1, 2130706433, 'attribute', 98, '操作url：/index.php?s=/Admin/Attribute/remove/id/98.html', 1, 1531124829);
INSERT INTO `one_action_log` VALUES (255, 8, 1, 2130706433, 'attribute', 99, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531125140);
INSERT INTO `one_action_log` VALUES (256, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531125156);
INSERT INTO `one_action_log` VALUES (257, 8, 1, 2130706433, 'attribute', 99, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531126879);
INSERT INTO `one_action_log` VALUES (258, 8, 1, 2130706433, 'attribute', 99, '操作url：/index.php?s=/Admin/Attribute/remove/id/99.html', 1, 1531129395);
INSERT INTO `one_action_log` VALUES (259, 8, 1, 2130706433, 'attribute', 100, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531129418);
INSERT INTO `one_action_log` VALUES (260, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531129441);
INSERT INTO `one_action_log` VALUES (261, 8, 1, 2130706433, 'attribute', 100, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531129633);
INSERT INTO `one_action_log` VALUES (262, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-09 17:58登录了后台', 1, 1531130309);
INSERT INTO `one_action_log` VALUES (263, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-10 10:26登录了后台', 1, 1531189614);
INSERT INTO `one_action_log` VALUES (264, 7, 1, 2130706433, 'model', 20, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531195995);
INSERT INTO `one_action_log` VALUES (265, 8, 1, 2130706433, 'attribute', 101, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531196011);
INSERT INTO `one_action_log` VALUES (266, 8, 1, 2130706433, 'attribute', 102, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531196058);
INSERT INTO `one_action_log` VALUES (267, 7, 1, 2130706433, 'model', 2, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531196069);
INSERT INTO `one_action_log` VALUES (268, 11, 1, 2130706433, 'category', 52, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531196089);
INSERT INTO `one_action_log` VALUES (269, 11, 1, 2130706433, 'category', 52, '操作url：/index.php?s=/Admin/Category/remove/id/52.html', 1, 1531196112);
INSERT INTO `one_action_log` VALUES (270, 8, 1, 2130706433, 'attribute', 102, '操作url：/index.php?s=/Admin/Attribute/remove/id/102.html', 1, 1531196136);
INSERT INTO `one_action_log` VALUES (271, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-11 10:17登录了后台', 1, 1531275460);
INSERT INTO `one_action_log` VALUES (272, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-11 16:01登录了后台', 1, 1531296113);
INSERT INTO `one_action_log` VALUES (273, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-12 10:31登录了后台', 1, 1531362719);
INSERT INTO `one_action_log` VALUES (274, 8, 1, 2130706433, 'attribute', 103, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531377257);
INSERT INTO `one_action_log` VALUES (275, 8, 1, 2130706433, 'attribute', 103, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531377807);
INSERT INTO `one_action_log` VALUES (276, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531377857);
INSERT INTO `one_action_log` VALUES (277, 8, 1, 2130706433, 'attribute', 103, '操作url：/index.php?s=/Admin/Attribute/remove/id/103.html', 1, 1531379260);
INSERT INTO `one_action_log` VALUES (278, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531385370);
INSERT INTO `one_action_log` VALUES (279, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531387612);
INSERT INTO `one_action_log` VALUES (280, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531387637);
INSERT INTO `one_action_log` VALUES (281, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-13 10:24登录了后台', 1, 1531448673);
INSERT INTO `one_action_log` VALUES (282, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531453331);
INSERT INTO `one_action_log` VALUES (283, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531453391);
INSERT INTO `one_action_log` VALUES (284, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531453526);
INSERT INTO `one_action_log` VALUES (285, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531453584);
INSERT INTO `one_action_log` VALUES (286, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454084);
INSERT INTO `one_action_log` VALUES (287, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454087);
INSERT INTO `one_action_log` VALUES (288, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454097);
INSERT INTO `one_action_log` VALUES (289, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454118);
INSERT INTO `one_action_log` VALUES (290, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454121);
INSERT INTO `one_action_log` VALUES (291, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454128);
INSERT INTO `one_action_log` VALUES (292, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454129);
INSERT INTO `one_action_log` VALUES (293, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454145);
INSERT INTO `one_action_log` VALUES (294, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454158);
INSERT INTO `one_action_log` VALUES (295, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531454226);
INSERT INTO `one_action_log` VALUES (296, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454235);
INSERT INTO `one_action_log` VALUES (297, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531454263);
INSERT INTO `one_action_log` VALUES (298, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531454273);
INSERT INTO `one_action_log` VALUES (299, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531454297);
INSERT INTO `one_action_log` VALUES (300, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531454329);
INSERT INTO `one_action_log` VALUES (301, 11, 1, 2130706433, 'category', 43, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455609);
INSERT INTO `one_action_log` VALUES (302, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531455649);
INSERT INTO `one_action_log` VALUES (303, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531455680);
INSERT INTO `one_action_log` VALUES (304, 11, 1, 2130706433, 'category', 58, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455688);
INSERT INTO `one_action_log` VALUES (305, 11, 1, 2130706433, 'category', 57, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455693);
INSERT INTO `one_action_log` VALUES (306, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531455724);
INSERT INTO `one_action_log` VALUES (307, 11, 1, 2130706433, 'category', 59, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455731);
INSERT INTO `one_action_log` VALUES (308, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455741);
INSERT INTO `one_action_log` VALUES (309, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531455770);
INSERT INTO `one_action_log` VALUES (310, 11, 1, 2130706433, 'category', 60, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455776);
INSERT INTO `one_action_log` VALUES (311, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531455801);
INSERT INTO `one_action_log` VALUES (312, 11, 1, 2130706433, 'category', 61, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455822);
INSERT INTO `one_action_log` VALUES (313, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455863);
INSERT INTO `one_action_log` VALUES (314, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531455866);
INSERT INTO `one_action_log` VALUES (315, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456007);
INSERT INTO `one_action_log` VALUES (316, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456502);
INSERT INTO `one_action_log` VALUES (317, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456550);
INSERT INTO `one_action_log` VALUES (318, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456619);
INSERT INTO `one_action_log` VALUES (319, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456661);
INSERT INTO `one_action_log` VALUES (320, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531456701);
INSERT INTO `one_action_log` VALUES (321, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531458696);
INSERT INTO `one_action_log` VALUES (322, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531458746);
INSERT INTO `one_action_log` VALUES (323, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531458836);
INSERT INTO `one_action_log` VALUES (324, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531458860);
INSERT INTO `one_action_log` VALUES (325, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531458862);
INSERT INTO `one_action_log` VALUES (326, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1531458898);
INSERT INTO `one_action_log` VALUES (327, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531458903);
INSERT INTO `one_action_log` VALUES (328, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531458905);
INSERT INTO `one_action_log` VALUES (329, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463174);
INSERT INTO `one_action_log` VALUES (330, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463186);
INSERT INTO `one_action_log` VALUES (331, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463209);
INSERT INTO `one_action_log` VALUES (332, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463216);
INSERT INTO `one_action_log` VALUES (333, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463248);
INSERT INTO `one_action_log` VALUES (334, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463402);
INSERT INTO `one_action_log` VALUES (335, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463466);
INSERT INTO `one_action_log` VALUES (336, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463478);
INSERT INTO `one_action_log` VALUES (337, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463501);
INSERT INTO `one_action_log` VALUES (338, 8, 1, 2130706433, 'attribute', 104, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531463556);
INSERT INTO `one_action_log` VALUES (339, 8, 1, 2130706433, 'attribute', 105, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531463609);
INSERT INTO `one_action_log` VALUES (340, 8, 1, 2130706433, 'attribute', 106, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531463681);
INSERT INTO `one_action_log` VALUES (341, 8, 1, 2130706433, 'attribute', 107, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531463703);
INSERT INTO `one_action_log` VALUES (342, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531463757);
INSERT INTO `one_action_log` VALUES (343, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531463769);
INSERT INTO `one_action_log` VALUES (344, 8, 1, 2130706433, 'attribute', 108, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531469251);
INSERT INTO `one_action_log` VALUES (345, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531469287);
INSERT INTO `one_action_log` VALUES (346, 8, 1, 2130706433, 'attribute', 105, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531469352);
INSERT INTO `one_action_log` VALUES (347, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531469543);
INSERT INTO `one_action_log` VALUES (348, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531469569);
INSERT INTO `one_action_log` VALUES (349, 8, 1, 2130706433, 'attribute', 109, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531469631);
INSERT INTO `one_action_log` VALUES (350, 8, 1, 2130706433, 'attribute', 110, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531469659);
INSERT INTO `one_action_log` VALUES (351, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531469668);
INSERT INTO `one_action_log` VALUES (352, 11, 1, 2130706433, 'category', 70, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531469691);
INSERT INTO `one_action_log` VALUES (353, 11, 1, 2130706433, 'category', 69, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531470625);
INSERT INTO `one_action_log` VALUES (354, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531470683);
INSERT INTO `one_action_log` VALUES (355, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531473690);
INSERT INTO `one_action_log` VALUES (356, 11, 1, 2130706433, 'category', 53, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531473700);
INSERT INTO `one_action_log` VALUES (357, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-16 10:02登录了后台', 1, 1531706548);
INSERT INTO `one_action_log` VALUES (358, 8, 1, 2130706433, 'attribute', 109, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531728280);
INSERT INTO `one_action_log` VALUES (359, 8, 1, 2130706433, 'attribute', 110, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531728292);
INSERT INTO `one_action_log` VALUES (360, 8, 1, 2130706433, 'attribute', 105, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531728315);
INSERT INTO `one_action_log` VALUES (361, 8, 1, 2130706433, 'attribute', 106, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531728345);
INSERT INTO `one_action_log` VALUES (362, 8, 1, 2130706433, 'attribute', 94, '操作url：/index.php?s=/Admin/Attribute/remove/id/94.html', 1, 1531728599);
INSERT INTO `one_action_log` VALUES (363, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531728769);
INSERT INTO `one_action_log` VALUES (364, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531728834);
INSERT INTO `one_action_log` VALUES (365, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531728843);
INSERT INTO `one_action_log` VALUES (366, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531728851);
INSERT INTO `one_action_log` VALUES (367, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531728861);
INSERT INTO `one_action_log` VALUES (368, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531732661);
INSERT INTO `one_action_log` VALUES (369, 8, 1, 2130706433, 'attribute', 104, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531733441);
INSERT INTO `one_action_log` VALUES (370, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531733512);
INSERT INTO `one_action_log` VALUES (371, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531733522);
INSERT INTO `one_action_log` VALUES (372, 8, 1, 2130706433, 'attribute', 110, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531733822);
INSERT INTO `one_action_log` VALUES (373, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-17 09:44登录了后台', 1, 1531791880);
INSERT INTO `one_action_log` VALUES (374, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-18 10:34登录了后台', 1, 1531881278);
INSERT INTO `one_action_log` VALUES (375, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531895468);
INSERT INTO `one_action_log` VALUES (376, 8, 1, 2130706433, 'attribute', 111, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531895736);
INSERT INTO `one_action_log` VALUES (377, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531895747);
INSERT INTO `one_action_log` VALUES (378, 8, 1, 2130706433, 'attribute', 108, '操作url：/index.php?s=/Admin/Attribute/remove/id/108.html', 1, 1531895756);
INSERT INTO `one_action_log` VALUES (379, 8, 1, 2130706433, 'attribute', 112, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531895834);
INSERT INTO `one_action_log` VALUES (380, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531895845);
INSERT INTO `one_action_log` VALUES (381, 8, 1, 2130706433, 'attribute', 111, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531896149);
INSERT INTO `one_action_log` VALUES (382, 8, 1, 2130706433, 'attribute', 113, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531896193);
INSERT INTO `one_action_log` VALUES (383, 8, 1, 2130706433, 'attribute', 111, '操作url：/index.php?s=/Admin/Attribute/remove/id/111.html', 1, 1531896215);
INSERT INTO `one_action_log` VALUES (384, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531896238);
INSERT INTO `one_action_log` VALUES (385, 8, 1, 2130706433, 'attribute', 112, '操作url：/index.php?s=/Admin/Attribute/remove/id/112.html', 1, 1531896251);
INSERT INTO `one_action_log` VALUES (386, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531896260);
INSERT INTO `one_action_log` VALUES (387, 8, 1, 2130706433, 'attribute', 113, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531896365);
INSERT INTO `one_action_log` VALUES (388, 8, 1, 2130706433, 'attribute', 113, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531896496);
INSERT INTO `one_action_log` VALUES (389, 8, 1, 2130706433, 'attribute', 114, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531897955);
INSERT INTO `one_action_log` VALUES (390, 8, 1, 2130706433, 'attribute', 115, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531897984);
INSERT INTO `one_action_log` VALUES (391, 8, 1, 2130706433, 'attribute', 113, '操作url：/index.php?s=/Admin/Attribute/remove/id/113.html', 1, 1531898001);
INSERT INTO `one_action_log` VALUES (392, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531898620);
INSERT INTO `one_action_log` VALUES (393, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531898631);
INSERT INTO `one_action_log` VALUES (394, 8, 1, 2130706433, 'attribute', 116, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531898783);
INSERT INTO `one_action_log` VALUES (395, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531898806);
INSERT INTO `one_action_log` VALUES (396, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531898829);
INSERT INTO `one_action_log` VALUES (397, 8, 1, 2130706433, 'attribute', 117, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531899445);
INSERT INTO `one_action_log` VALUES (398, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1531899454);
INSERT INTO `one_action_log` VALUES (399, 8, 1, 2130706433, 'attribute', 54, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531901990);
INSERT INTO `one_action_log` VALUES (400, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-19 09:52登录了后台', 1, 1531965128);
INSERT INTO `one_action_log` VALUES (401, 8, 1, 2130706433, 'attribute', 104, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1531987683);
INSERT INTO `one_action_log` VALUES (402, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531991475);
INSERT INTO `one_action_log` VALUES (403, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1531991550);
INSERT INTO `one_action_log` VALUES (404, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-20 09:22登录了后台', 1, 1532049770);
INSERT INTO `one_action_log` VALUES (405, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-23 10:37登录了后台', 1, 1532313421);
INSERT INTO `one_action_log` VALUES (406, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532329995);
INSERT INTO `one_action_log` VALUES (407, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532331062);
INSERT INTO `one_action_log` VALUES (408, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532331093);
INSERT INTO `one_action_log` VALUES (409, 8, 1, 2130706433, 'attribute', 118, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532331416);
INSERT INTO `one_action_log` VALUES (410, 8, 1, 2130706433, 'attribute', 119, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532331437);
INSERT INTO `one_action_log` VALUES (411, 8, 1, 2130706433, 'attribute', 120, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532331484);
INSERT INTO `one_action_log` VALUES (412, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532331505);
INSERT INTO `one_action_log` VALUES (413, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532331525);
INSERT INTO `one_action_log` VALUES (414, 11, 1, 2130706433, 'category', 54, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532331703);
INSERT INTO `one_action_log` VALUES (415, 8, 1, 2130706433, 'attribute', 121, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532335329);
INSERT INTO `one_action_log` VALUES (416, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532335350);
INSERT INTO `one_action_log` VALUES (417, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532335472);
INSERT INTO `one_action_log` VALUES (418, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532336482);
INSERT INTO `one_action_log` VALUES (419, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532336530);
INSERT INTO `one_action_log` VALUES (420, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532337187);
INSERT INTO `one_action_log` VALUES (421, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-24 09:22登录了后台', 1, 1532395334);
INSERT INTO `one_action_log` VALUES (422, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1532396577);
INSERT INTO `one_action_log` VALUES (423, 8, 1, 2130706433, 'attribute', 122, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532399101);
INSERT INTO `one_action_log` VALUES (424, 9, 1, 2130706433, 'channel', 1, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402223);
INSERT INTO `one_action_log` VALUES (425, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402231);
INSERT INTO `one_action_log` VALUES (426, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402238);
INSERT INTO `one_action_log` VALUES (427, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402430);
INSERT INTO `one_action_log` VALUES (428, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402442);
INSERT INTO `one_action_log` VALUES (429, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402577);
INSERT INTO `one_action_log` VALUES (430, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402679);
INSERT INTO `one_action_log` VALUES (431, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402713);
INSERT INTO `one_action_log` VALUES (432, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402719);
INSERT INTO `one_action_log` VALUES (433, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532402724);
INSERT INTO `one_action_log` VALUES (434, 6, 1, 2130706433, 'config', 38, '操作url：/index.php?s=/Admin/Config/edit.html', 1, 1532413364);
INSERT INTO `one_action_log` VALUES (435, 6, 1, 2130706433, 'config', 39, '操作url：/index.php?s=/Admin/Config/edit.html', 1, 1532413519);
INSERT INTO `one_action_log` VALUES (436, 6, 1, 2130706433, 'config', 40, '操作url：/index.php?s=/Admin/Config/edit.html', 1, 1532416562);
INSERT INTO `one_action_log` VALUES (437, 6, 1, 2130706433, 'config', 0, '操作url：/index.php?s=/Admin/Config/del/id/40.html', 1, 1532421076);
INSERT INTO `one_action_log` VALUES (438, 6, 1, 2130706433, 'config', 9, '操作url：/index.php?s=/Admin/Config/edit.html', 1, 1532421084);
INSERT INTO `one_action_log` VALUES (439, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-25 10:02登录了后台', 1, 1532484139);
INSERT INTO `one_action_log` VALUES (440, 9, 1, 2130706433, 'channel', 1, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496333);
INSERT INTO `one_action_log` VALUES (441, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496376);
INSERT INTO `one_action_log` VALUES (442, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496387);
INSERT INTO `one_action_log` VALUES (443, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496396);
INSERT INTO `one_action_log` VALUES (444, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496405);
INSERT INTO `one_action_log` VALUES (445, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496608);
INSERT INTO `one_action_log` VALUES (446, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496629);
INSERT INTO `one_action_log` VALUES (447, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496638);
INSERT INTO `one_action_log` VALUES (448, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496644);
INSERT INTO `one_action_log` VALUES (449, 9, 1, 2130706433, 'channel', 1, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532496660);
INSERT INTO `one_action_log` VALUES (450, 8, 1, 2130706433, 'attribute', 123, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532499005);
INSERT INTO `one_action_log` VALUES (451, 7, 1, 2130706433, 'model', 12, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532499028);
INSERT INTO `one_action_log` VALUES (452, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532499554);
INSERT INTO `one_action_log` VALUES (453, 8, 1, 2130706433, 'attribute', 124, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532501349);
INSERT INTO `one_action_log` VALUES (454, 7, 1, 2130706433, 'model', 17, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532501359);
INSERT INTO `one_action_log` VALUES (455, 8, 1, 2130706433, 'attribute', 125, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532502290);
INSERT INTO `one_action_log` VALUES (456, 8, 1, 2130706433, 'attribute', 126, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532502320);
INSERT INTO `one_action_log` VALUES (457, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532502381);
INSERT INTO `one_action_log` VALUES (458, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532503224);
INSERT INTO `one_action_log` VALUES (459, 11, 1, 2130706433, 'category', 56, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532506072);
INSERT INTO `one_action_log` VALUES (460, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532506075);
INSERT INTO `one_action_log` VALUES (461, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532506101);
INSERT INTO `one_action_log` VALUES (462, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-26 14:39登录了后台', 1, 1532587171);
INSERT INTO `one_action_log` VALUES (463, 9, 1, 2130706433, 'channel', 1, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532587199);
INSERT INTO `one_action_log` VALUES (464, 9, 1, 2130706433, 'channel', 2, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532587206);
INSERT INTO `one_action_log` VALUES (465, 9, 1, 2130706433, 'channel', 3, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532587220);
INSERT INTO `one_action_log` VALUES (466, 9, 1, 2130706433, 'channel', 4, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532587227);
INSERT INTO `one_action_log` VALUES (467, 9, 1, 2130706433, 'channel', 5, '操作url：/index.php?s=/Admin/Channel/edit.html', 1, 1532587232);
INSERT INTO `one_action_log` VALUES (468, 11, 1, 2130706433, 'category', 51, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532590971);
INSERT INTO `one_action_log` VALUES (469, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532591101);
INSERT INTO `one_action_log` VALUES (470, 8, 1, 2130706433, 'attribute', 127, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532591176);
INSERT INTO `one_action_log` VALUES (471, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532591204);
INSERT INTO `one_action_log` VALUES (472, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-27 09:54登录了后台', 1, 1532656476);
INSERT INTO `one_action_log` VALUES (473, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532672444);
INSERT INTO `one_action_log` VALUES (474, 7, 1, 2130706433, 'model', 19, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1532672531);
INSERT INTO `one_action_log` VALUES (475, 8, 1, 2130706433, 'attribute', 121, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532673115);
INSERT INTO `one_action_log` VALUES (476, 8, 1, 2130706433, 'attribute', 120, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532673122);
INSERT INTO `one_action_log` VALUES (477, 8, 1, 2130706433, 'attribute', 120, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1532673129);
INSERT INTO `one_action_log` VALUES (478, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-30 09:48登录了后台', 1, 1532915329);
INSERT INTO `one_action_log` VALUES (479, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1532920703);
INSERT INTO `one_action_log` VALUES (480, 1, 1, 2130706433, 'member', 1, 'admin在2018-07-31 11:20登录了后台', 1, 1533007206);
INSERT INTO `one_action_log` VALUES (481, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-01 10:47登录了后台', 1, 1533091658);
INSERT INTO `one_action_log` VALUES (482, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-02 09:50登录了后台', 1, 1533174601);
INSERT INTO `one_action_log` VALUES (483, 8, 1, 2130706433, 'attribute', 128, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533186533);
INSERT INTO `one_action_log` VALUES (484, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533186547);
INSERT INTO `one_action_log` VALUES (485, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533186584);
INSERT INTO `one_action_log` VALUES (486, 8, 1, 2130706433, 'attribute', 129, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533193440);
INSERT INTO `one_action_log` VALUES (487, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533193451);
INSERT INTO `one_action_log` VALUES (488, 8, 1, 2130706433, 'attribute', 129, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533193535);
INSERT INTO `one_action_log` VALUES (489, 8, 1, 2130706433, 'attribute', 128, '操作url：/index.php?s=/Admin/Attribute/remove/id/128.html', 1, 1533193995);
INSERT INTO `one_action_log` VALUES (490, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-03 09:47登录了后台', 1, 1533260870);
INSERT INTO `one_action_log` VALUES (491, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533266997);
INSERT INTO `one_action_log` VALUES (492, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267007);
INSERT INTO `one_action_log` VALUES (493, 7, 1, 2130706433, 'model', 25, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267039);
INSERT INTO `one_action_log` VALUES (494, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267112);
INSERT INTO `one_action_log` VALUES (495, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267127);
INSERT INTO `one_action_log` VALUES (496, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267192);
INSERT INTO `one_action_log` VALUES (497, 7, 1, 2130706433, 'model', 25, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533267204);
INSERT INTO `one_action_log` VALUES (498, 7, 1, 2130706433, 'model', 25, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533268517);
INSERT INTO `one_action_log` VALUES (499, 8, 1, 2130706433, 'attribute', 130, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268573);
INSERT INTO `one_action_log` VALUES (500, 8, 1, 2130706433, 'attribute', 131, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268597);
INSERT INTO `one_action_log` VALUES (501, 8, 1, 2130706433, 'attribute', 132, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268611);
INSERT INTO `one_action_log` VALUES (502, 7, 1, 2130706433, 'model', 25, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533268645);
INSERT INTO `one_action_log` VALUES (503, 8, 1, 2130706433, 'attribute', 133, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268682);
INSERT INTO `one_action_log` VALUES (504, 8, 1, 2130706433, 'attribute', 134, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268707);
INSERT INTO `one_action_log` VALUES (505, 7, 1, 2130706433, 'model', 25, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533268721);
INSERT INTO `one_action_log` VALUES (506, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533268817);
INSERT INTO `one_action_log` VALUES (507, 8, 1, 2130706433, 'attribute', 135, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268834);
INSERT INTO `one_action_log` VALUES (508, 8, 1, 2130706433, 'attribute', 136, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268854);
INSERT INTO `one_action_log` VALUES (509, 8, 1, 2130706433, 'attribute', 137, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533268871);
INSERT INTO `one_action_log` VALUES (510, 8, 1, 2130706433, 'attribute', 138, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533269040);
INSERT INTO `one_action_log` VALUES (511, 8, 1, 2130706433, 'attribute', 139, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533269073);
INSERT INTO `one_action_log` VALUES (512, 8, 1, 2130706433, 'attribute', 140, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533269135);
INSERT INTO `one_action_log` VALUES (513, 8, 1, 2130706433, 'attribute', 141, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533269196);
INSERT INTO `one_action_log` VALUES (514, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533269211);
INSERT INTO `one_action_log` VALUES (515, 11, 1, 2130706433, 'category', 72, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1533269306);
INSERT INTO `one_action_log` VALUES (516, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1533269316);
INSERT INTO `one_action_log` VALUES (517, 8, 1, 2130706433, 'attribute', 142, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533270312);
INSERT INTO `one_action_log` VALUES (518, 8, 1, 2130706433, 'attribute', 143, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533270410);
INSERT INTO `one_action_log` VALUES (519, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533270438);
INSERT INTO `one_action_log` VALUES (520, 8, 1, 2130706433, 'attribute', 144, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533271727);
INSERT INTO `one_action_log` VALUES (521, 7, 1, 2130706433, 'model', 24, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533271758);
INSERT INTO `one_action_log` VALUES (522, 8, 1, 2130706433, 'attribute', 121, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533273198);
INSERT INTO `one_action_log` VALUES (523, 8, 1, 2130706433, 'attribute', 145, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533273326);
INSERT INTO `one_action_log` VALUES (524, 8, 1, 2130706433, 'attribute', 120, '操作url：/index.php?s=/Admin/Attribute/remove/id/120.html', 1, 1533273403);
INSERT INTO `one_action_log` VALUES (525, 8, 1, 2130706433, 'attribute', 146, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533276259);
INSERT INTO `one_action_log` VALUES (526, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533276278);
INSERT INTO `one_action_log` VALUES (527, 8, 1, 2130706433, 'attribute', 146, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533276305);
INSERT INTO `one_action_log` VALUES (528, 8, 1, 2130706433, 'attribute', 146, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1533276460);
INSERT INTO `one_action_log` VALUES (529, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-06 10:10登录了后台', 1, 1533521443);
INSERT INTO `one_action_log` VALUES (530, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-07 09:36登录了后台', 1, 1533605817);
INSERT INTO `one_action_log` VALUES (531, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-08 10:20登录了后台', 1, 1533694828);
INSERT INTO `one_action_log` VALUES (532, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-09 10:20登录了后台', 1, 1533781237);
INSERT INTO `one_action_log` VALUES (533, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533807640);
INSERT INTO `one_action_log` VALUES (534, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1533807672);
INSERT INTO `one_action_log` VALUES (535, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-10 09:40登录了后台', 1, 1533865250);
INSERT INTO `one_action_log` VALUES (536, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-13 09:27登录了后台', 1, 1534123651);
INSERT INTO `one_action_log` VALUES (537, 8, 1, 2130706433, 'attribute', 147, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534126311);
INSERT INTO `one_action_log` VALUES (538, 8, 1, 2130706433, 'attribute', 148, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534126684);
INSERT INTO `one_action_log` VALUES (539, 8, 1, 2130706433, 'attribute', 149, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534126932);
INSERT INTO `one_action_log` VALUES (540, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534127032);
INSERT INTO `one_action_log` VALUES (541, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534127064);
INSERT INTO `one_action_log` VALUES (542, 8, 1, 2130706433, 'attribute', 149, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534127093);
INSERT INTO `one_action_log` VALUES (543, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534128445);
INSERT INTO `one_action_log` VALUES (544, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534129711);
INSERT INTO `one_action_log` VALUES (545, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534129906);
INSERT INTO `one_action_log` VALUES (546, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534129954);
INSERT INTO `one_action_log` VALUES (547, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534129959);
INSERT INTO `one_action_log` VALUES (548, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534134136);
INSERT INTO `one_action_log` VALUES (549, 8, 1, 2130706433, 'attribute', 129, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534134388);
INSERT INTO `one_action_log` VALUES (550, 7, 1, 2130706433, 'model', 26, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534136922);
INSERT INTO `one_action_log` VALUES (551, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534136934);
INSERT INTO `one_action_log` VALUES (552, 8, 1, 2130706433, 'attribute', 151, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534136957);
INSERT INTO `one_action_log` VALUES (553, 7, 1, 2130706433, 'model', 26, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534136986);
INSERT INTO `one_action_log` VALUES (554, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534137008);
INSERT INTO `one_action_log` VALUES (555, 8, 1, 2130706433, 'attribute', 152, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534139072);
INSERT INTO `one_action_log` VALUES (556, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534139090);
INSERT INTO `one_action_log` VALUES (557, 8, 1, 2130706433, 'attribute', 152, '操作url：/index.php?s=/Admin/Attribute/remove/id/152.html', 1, 1534139202);
INSERT INTO `one_action_log` VALUES (558, 8, 1, 2130706433, 'attribute', 153, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534139378);
INSERT INTO `one_action_log` VALUES (559, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534139396);
INSERT INTO `one_action_log` VALUES (560, 8, 1, 2130706433, 'attribute', 153, '操作url：/index.php?s=/Admin/Attribute/remove/id/153.html', 1, 1534139774);
INSERT INTO `one_action_log` VALUES (561, 8, 1, 2130706433, 'attribute', 154, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534140294);
INSERT INTO `one_action_log` VALUES (562, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534140311);
INSERT INTO `one_action_log` VALUES (563, 8, 1, 2130706433, 'attribute', 154, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534140848);
INSERT INTO `one_action_log` VALUES (564, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534140854);
INSERT INTO `one_action_log` VALUES (565, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534142153);
INSERT INTO `one_action_log` VALUES (566, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-13 17:16登录了后台', 1, 1534151815);
INSERT INTO `one_action_log` VALUES (567, 8, 1, 2130706433, 'attribute', 107, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534155750);
INSERT INTO `one_action_log` VALUES (568, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-14 09:35登录了后台', 1, 1534210552);
INSERT INTO `one_action_log` VALUES (569, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534222286);
INSERT INTO `one_action_log` VALUES (570, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534222304);
INSERT INTO `one_action_log` VALUES (571, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534222313);
INSERT INTO `one_action_log` VALUES (572, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534231550);
INSERT INTO `one_action_log` VALUES (573, 7, 1, 2130706433, 'model', 16, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534231644);
INSERT INTO `one_action_log` VALUES (574, 8, 1, 2130706433, 'attribute', 155, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534232325);
INSERT INTO `one_action_log` VALUES (575, 7, 1, 2130706433, 'model', 21, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534232351);
INSERT INTO `one_action_log` VALUES (576, 8, 1, 2130706433, 'attribute', 117, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534232364);
INSERT INTO `one_action_log` VALUES (577, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534232799);
INSERT INTO `one_action_log` VALUES (578, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534233679);
INSERT INTO `one_action_log` VALUES (579, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-15 09:50登录了后台', 1, 1534297839);
INSERT INTO `one_action_log` VALUES (580, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534309006);
INSERT INTO `one_action_log` VALUES (581, 7, 1, 2130706433, 'model', 23, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534322627);
INSERT INTO `one_action_log` VALUES (582, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-16 09:48登录了后台', 1, 1534384113);
INSERT INTO `one_action_log` VALUES (583, 7, 1, 2130706433, 'model', 27, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534387808);
INSERT INTO `one_action_log` VALUES (584, 7, 1, 2130706433, 'model', 27, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534387822);
INSERT INTO `one_action_log` VALUES (585, 7, 1, 2130706433, 'model', 27, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534387851);
INSERT INTO `one_action_log` VALUES (586, 8, 1, 2130706433, 'attribute', 156, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534388184);
INSERT INTO `one_action_log` VALUES (587, 7, 1, 2130706433, 'model', 27, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534388577);
INSERT INTO `one_action_log` VALUES (588, 8, 1, 2130706433, 'attribute', 157, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534388744);
INSERT INTO `one_action_log` VALUES (589, 8, 1, 2130706433, 'attribute', 158, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534388811);
INSERT INTO `one_action_log` VALUES (590, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534388825);
INSERT INTO `one_action_log` VALUES (591, 7, 1, 2130706433, 'model', 27, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534388859);
INSERT INTO `one_action_log` VALUES (592, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534389012);
INSERT INTO `one_action_log` VALUES (593, 11, 1, 2130706433, 'category', 71, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534389210);
INSERT INTO `one_action_log` VALUES (594, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-17 09:43登录了后台', 1, 1534470229);
INSERT INTO `one_action_log` VALUES (595, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-20 09:44登录了后台', 1, 1534729469);
INSERT INTO `one_action_log` VALUES (596, 8, 1, 2130706433, 'attribute', 147, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534740098);
INSERT INTO `one_action_log` VALUES (597, 8, 1, 2130706433, 'attribute', 149, '操作url：/index.php?s=/Admin/Attribute/remove/id/149.html', 1, 1534740106);
INSERT INTO `one_action_log` VALUES (598, 8, 1, 2130706433, 'attribute', 150, '操作url：/index.php?s=/Admin/Attribute/remove/id/150.html', 1, 1534740118);
INSERT INTO `one_action_log` VALUES (599, 8, 1, 2130706433, 'attribute', 122, '操作url：/index.php?s=/Admin/Attribute/remove/id/122.html', 1, 1534740131);
INSERT INTO `one_action_log` VALUES (600, 7, 1, 2130706433, 'model', 18, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534741510);
INSERT INTO `one_action_log` VALUES (601, 8, 1, 2130706433, 'attribute', 93, '操作url：/index.php?s=/Admin/Attribute/remove/id/93.html', 1, 1534742088);
INSERT INTO `one_action_log` VALUES (602, 8, 1, 2130706433, 'attribute', 91, '操作url：/index.php?s=/Admin/Attribute/remove/id/91.html', 1, 1534742109);
INSERT INTO `one_action_log` VALUES (603, 11, 1, 2130706433, 'category', 55, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534743418);
INSERT INTO `one_action_log` VALUES (604, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534746807);
INSERT INTO `one_action_log` VALUES (605, 11, 1, 2130706433, 'category', 67, '操作url：/index.php?s=/Admin/Category/remove/id/67.html', 1, 1534746844);
INSERT INTO `one_action_log` VALUES (606, 11, 1, 2130706433, 'category', 68, '操作url：/index.php?s=/Admin/Category/remove/id/68.html', 1, 1534746865);
INSERT INTO `one_action_log` VALUES (607, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534746920);
INSERT INTO `one_action_log` VALUES (608, 11, 1, 2130706433, 'category', 66, '操作url：/index.php?s=/Admin/Category/remove/id/66.html', 1, 1534746943);
INSERT INTO `one_action_log` VALUES (609, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1534748753);
INSERT INTO `one_action_log` VALUES (610, 11, 1, 2130706433, 'category', 74, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1534748782);
INSERT INTO `one_action_log` VALUES (611, 11, 1, 2130706433, 'category', 75, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1534748820);
INSERT INTO `one_action_log` VALUES (612, 11, 1, 2130706433, 'category', 73, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534748848);
INSERT INTO `one_action_log` VALUES (613, 8, 1, 2130706433, 'attribute', 159, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534755044);
INSERT INTO `one_action_log` VALUES (614, 7, 1, 2130706433, 'model', 22, '操作url：/index.php?s=/Admin/Model/update.html', 1, 1534755063);
INSERT INTO `one_action_log` VALUES (615, 11, 1, 2130706433, 'category', 62, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534755436);
INSERT INTO `one_action_log` VALUES (616, 11, 1, 2130706433, 'category', 63, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534755497);
INSERT INTO `one_action_log` VALUES (617, 11, 1, 2130706433, 'category', 64, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534755506);
INSERT INTO `one_action_log` VALUES (618, 11, 1, 2130706433, 'category', 65, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1534755516);
INSERT INTO `one_action_log` VALUES (619, 1, 1, 2130706433, 'member', 1, 'admin在2018-08-21 09:42登录了后台', 1, 1534815747);
INSERT INTO `one_action_log` VALUES (620, 8, 1, 2130706433, 'attribute', 105, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534828995);
INSERT INTO `one_action_log` VALUES (621, 8, 1, 2130706433, 'attribute', 106, '操作url：/index.php?s=/Admin/Attribute/update.html', 1, 1534829006);

-- ----------------------------
-- Table structure for one_addons
-- ----------------------------
DROP TABLE IF EXISTS `one_addons`;
CREATE TABLE `one_addons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置',
  `author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_addons
-- ----------------------------
INSERT INTO `one_addons` VALUES (15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', 1383126253, 0);
INSERT INTO `one_addons` VALUES (2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', 1379512015, 0);
INSERT INTO `one_addons` VALUES (3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', 1379512022, 0);
INSERT INTO `one_addons` VALUES (4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', 1379512036, 0);
INSERT INTO `one_addons` VALUES (5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', 1379830910, 0);
INSERT INTO `one_addons` VALUES (6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1);
INSERT INTO `one_addons` VALUES (9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', 1380273962, 0);
INSERT INTO `one_addons` VALUES (16, 'moreImages', '多图片上传', '这是一个临时描述', 1, 'null', '无名', '0.1', 1531121219, 0);
INSERT INTO `one_addons` VALUES (24, 'PluploadImages', '多图上传 ', '多图上传 {:hook(\'PluploadImages\', array(\'count\'=>(int)\'限制数量\',\'name\'=>\'input_name\',\'value\'=>(arr|str)\'图片ID集\'))}', 1, 'null', '宗米+波仔', '1.3', 1534134555, 0);
INSERT INTO `one_addons` VALUES (18, 'UploadImages', '多图上传', '多图上传', 1, 'null', 'lhb', '0.1', 1533194221, 0);
INSERT INTO `one_addons` VALUES (25, 'UploadPic', '多图上传', '多图上传', 1, 'null', 'lhb', '0.1', 1534141459, 0);

-- ----------------------------
-- Table structure for one_attachment
-- ----------------------------
DROP TABLE IF EXISTS `one_attachment`;
CREATE TABLE `one_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_status`(`record_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for one_attribute
-- ----------------------------
DROP TABLE IF EXISTS `one_attribute`;
CREATE TABLE `one_attribute`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型id',
  `is_must` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `validate_rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `error_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_attribute
-- ----------------------------
INSERT INTO `one_attribute` VALUES (1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1530513940, 1383891233, '', 0, '', 'regex', '', 0, 'function');
INSERT INTO `one_attribute` VALUES (4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function');
INSERT INTO `one_attribute` VALUES (14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function');
INSERT INTO `one_attribute` VALUES (15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function');
INSERT INTO `one_attribute` VALUES (16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function');
INSERT INTO `one_attribute` VALUES (28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (67, 'main_title', '主标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 12, 0, 1, 1530513312, 1530513312, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (100, 'pluploadimages', '多图上传', 'varchar(255) NOT NULL', 'pluploadimages', '', '', 1, '', 12, 0, 1, 1531129633, 1531129418, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (106, 'article', '简介', 'text NOT NULL', 'textarea', '', '', 1, '', 22, 1, 1, 1534829006, 1531463681, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (55, 'subtitle', '副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1530249489, 1530249489, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (54, 'view_num', '首页编号', 'int(3) NOT NULL', 'select', '', '', 1, '1:首屏\r\n2:亚信集团\r\n3:医疗布局\r\n4:产业资源\r\n5:最新资讯\r\n6:关于我们', 1, 0, 1, 1531901990, 1530248075, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (77, 'sub_title', '副标题', 'varchar(255) NOT NULL ', 'string', '', '', 1, '', 16, 0, 1, 1530523465, 1530523465, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (76, 'main_title', '主标题', 'varchar(255) NOT NULL ', 'string', '', '', 1, '', 16, 0, 1, 1530523465, 1530523465, '', 0, '', '', '', 0, '');
INSERT INTO `one_attribute` VALUES (159, 'list_img', '列表图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 22, 0, 1, 1534755044, 1534755044, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (90, 'list_title', '列表标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 0, 1, 1530609486, 1530609486, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (107, 'video', '视频', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 22, 0, 1, 1534155751, 1531463703, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (95, 'list_title', '主标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 19, 0, 1, 1531114908, 1530693878, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (115, 'detail_type', '详情类型', 'char(50) NOT NULL', 'select', '1', '', 1, '1:文章详情;\r\n2:医院详情', 21, 0, 1, 1531897984, 1531897984, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (68, 'sub_title', '副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 12, 0, 1, 1530513410, 1530513410, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (92, 'list_img', '列表背景图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 18, 0, 1, 1530609528, 1530609528, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (105, 'list_title', '名称', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 22, 1, 1, 1534828995, 1531463609, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (104, 'detail_img', '封面图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 22, 0, 1, 1531987683, 1531463556, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (96, 'article', '详情内容', 'text NOT NULL', 'editor', '', '', 1, '', 19, 0, 1, 1530693948, 1530693948, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (97, 'list_img', '新闻封面图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 19, 0, 1, 1530697133, 1530697133, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (78, 'list_title', '主标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 16, 0, 1, 1530523599, 1530523599, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (109, 'list_title', '文章标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1531728280, 1531469632, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (114, 'detail_type', '详情类型', 'char(50) NOT NULL', 'select', '2', '', 1, '1:文章详情;\r\n2:医院详情', 22, 0, 1, 1531897955, 1531897955, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (79, 'list_subtitle', '列表副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 16, 0, 1, 1530523637, 1530523637, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (80, 'list_img', '列表图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 16, 0, 1, 1530523667, 1530523667, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (81, 'article', '详情', 'text NOT NULL', 'editor', '', '', 1, '', 16, 0, 1, 1530523690, 1530523690, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (82, 'banner_img', '背景图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 12, 0, 1, 1530524879, 1530524879, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (83, 'banner_video', '背景视频', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 12, 0, 1, 1530524902, 1530524902, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (84, 'button', '按钮文字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 12, 0, 1, 1530600289, 1530600260, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (85, 'button_url', '按钮跳转地址', 'char(50) NOT NULL', 'select', '', '', 1, ' :无跳转\r\nHome/Index/index:首页\r\nHome/User/register:注册', 12, 0, 1, 1530606201, 1530600309, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (86, 'list_title', '列表标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1530608249, 1530608249, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (87, 'list_subtitle', '列表副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1530608280, 1530608280, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (88, 'list_img', '列表背景图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 17, 0, 1, 1530608302, 1530608302, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (89, 'article', '列表详情', 'text NOT NULL', 'editor', '', '', 1, '', 17, 0, 1, 1530608325, 1530608325, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (110, 'article', '文章详情', 'text NOT NULL', 'editor', '', '', 1, '', 21, 0, 1, 1531733822, 1531469659, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (116, 'detail_img', '文章封面', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 21, 0, 1, 1531898783, 1531898783, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (117, 'sub_title', '简介', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1534232364, 1531899445, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (118, 'list_title', '列表标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1532331416, 1532331416, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (119, 'list_subtitle', '列表副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1532331437, 1532331437, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (146, 'tel', '联系电话', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1533276460, 1533276259, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (121, 'list_img', '列表图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 23, 0, 1, 1533273198, 1532335329, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (123, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 12, 0, 1, 1532499006, 1532499006, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (124, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1532501349, 1532501349, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (125, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 0, 1, 1532502290, 1532502290, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (126, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1532502320, 1532502320, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (127, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 19, 0, 1, 1532591176, 1532591176, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (130, 'list_title', '列表标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 25, 0, 1, 1533268573, 1533268573, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (129, 'expert', '卓越专家', 'text NOT NULL', 'pictures', '', '', 1, '', 22, 0, 1, 1534134388, 1533193440, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (131, 'list_subtitle', '列表副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 25, 0, 1, 1533268597, 1533268597, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (132, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 25, 0, 1, 1533268611, 1533268611, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (133, 'video', '宣传视频', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 25, 0, 1, 1533268682, 1533268682, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (134, 'video_img', '视频封面', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 25, 0, 1, 1533268707, 1533268707, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (135, 'list_title', '列表标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533268834, 1533268834, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (136, 'list_subtitle', '列表副标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533268854, 1533268854, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (137, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533268871, 1533268871, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (138, 'company', '公司名称', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533269040, 1533269040, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (139, 'address', '公司地址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533269073, 1533269073, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (140, 'tel', '公司电话', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533269135, 1533269135, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (141, 'mail', '公司邮箱', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1533269196, 1533269196, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (142, 'details', '公司详情', 'text NOT NULL', 'editor', '', '', 1, '', 24, 0, 1, 1533270312, 1533270312, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (143, 'company_img', '公司背景图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 24, 0, 1, 1533270410, 1533270410, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (144, 'list_img', '列表封面图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 24, 0, 1, 1533271727, 1533271727, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (145, 'company_img', '公司背景图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 23, 0, 1, 1533273326, 1533273326, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (147, 'en_ambient', '领先技术(英文)', 'text NOT NULL', 'textarea', '', '', 1, '', 22, 0, 1, 1534740098, 1534126311, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (148, 'tech', '领先技术简介', 'text NOT NULL', 'textarea', '', '', 1, '', 22, 0, 1, 1534126685, 1534126685, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (155, 'en_title', '英文标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1534232325, 1534232325, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (154, 'ambient_img', '环境图片', 'text NOT NULL', 'images', '', '', 1, '', 22, 0, 1, 1534140848, 1534140294, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (156, 'position', '职位', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 27, 0, 1, 1534388184, 1534388184, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (157, 'duty', '岗位职责', 'text NOT NULL', 'editor', '', '', 1, '', 27, 0, 1, 1534388744, 1534388744, '', 3, '', 'regex', '', 3, 'function');
INSERT INTO `one_attribute` VALUES (158, 'email', '简历投递邮箱', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 27, 0, 1, 1534388811, 1534388811, '', 3, '', 'regex', '', 3, 'function');

-- ----------------------------
-- Table structure for one_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `one_auth_extend`;
CREATE TABLE `one_auth_extend`  (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE INDEX `group_extend_type`(`group_id`, `extend_id`, `type`) USING BTREE,
  INDEX `uid`(`group_id`) USING BTREE,
  INDEX `group_id`(`extend_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与分类的对应关系表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_auth_extend
-- ----------------------------
INSERT INTO `one_auth_extend` VALUES (1, 1, 1);
INSERT INTO `one_auth_extend` VALUES (1, 1, 2);
INSERT INTO `one_auth_extend` VALUES (1, 2, 1);
INSERT INTO `one_auth_extend` VALUES (1, 2, 2);
INSERT INTO `one_auth_extend` VALUES (1, 3, 1);
INSERT INTO `one_auth_extend` VALUES (1, 3, 2);
INSERT INTO `one_auth_extend` VALUES (1, 4, 1);
INSERT INTO `one_auth_extend` VALUES (1, 37, 1);

-- ----------------------------
-- Table structure for one_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `one_auth_group`;
CREATE TABLE `one_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '组类型',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_auth_group
-- ----------------------------
INSERT INTO `one_auth_group` VALUES (1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `one_auth_group` VALUES (2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for one_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `one_auth_group_access`;
CREATE TABLE `one_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for one_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `one_auth_rule`;
CREATE TABLE `one_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1-url;2-主菜单',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`, `status`, `type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_auth_rule
-- ----------------------------
INSERT INTO `one_auth_rule` VALUES (1, 'admin', 2, 'Admin/Index/index', '首页', 1, '');
INSERT INTO `one_auth_rule` VALUES (2, 'admin', 2, 'Admin/Article/index', '内容', 1, '');
INSERT INTO `one_auth_rule` VALUES (3, 'admin', 2, 'Admin/User/index', '用户', 1, '');
INSERT INTO `one_auth_rule` VALUES (4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, '');
INSERT INTO `one_auth_rule` VALUES (5, 'admin', 2, 'Admin/Config/group', '系统', 1, '');
INSERT INTO `one_auth_rule` VALUES (7, 'admin', 1, 'Admin/article/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (8, 'admin', 1, 'Admin/article/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, '');
INSERT INTO `one_auth_rule` VALUES (10, 'admin', 1, 'Admin/article/update', '保存', 1, '');
INSERT INTO `one_auth_rule` VALUES (11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, '');
INSERT INTO `one_auth_rule` VALUES (12, 'admin', 1, 'Admin/article/move', '移动', 1, '');
INSERT INTO `one_auth_rule` VALUES (13, 'admin', 1, 'Admin/article/copy', '复制', 1, '');
INSERT INTO `one_auth_rule` VALUES (14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, '');
INSERT INTO `one_auth_rule` VALUES (15, 'admin', 1, 'Admin/article/permit', '还原', 1, '');
INSERT INTO `one_auth_rule` VALUES (16, 'admin', 1, 'Admin/article/clear', '清空', 1, '');
INSERT INTO `one_auth_rule` VALUES (17, 'admin', 1, 'Admin/Article/examine', '审核列表', 1, '');
INSERT INTO `one_auth_rule` VALUES (18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, '');
INSERT INTO `one_auth_rule` VALUES (19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, '');
INSERT INTO `one_auth_rule` VALUES (20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, '');
INSERT INTO `one_auth_rule` VALUES (21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, '');
INSERT INTO `one_auth_rule` VALUES (22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, '');
INSERT INTO `one_auth_rule` VALUES (23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, '');
INSERT INTO `one_auth_rule` VALUES (24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, '');
INSERT INTO `one_auth_rule` VALUES (25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, '');
INSERT INTO `one_auth_rule` VALUES (26, 'admin', 1, 'Admin/User/index', '用户信息', 1, '');
INSERT INTO `one_auth_rule` VALUES (27, 'admin', 1, 'Admin/User/action', '用户行为', 1, '');
INSERT INTO `one_auth_rule` VALUES (28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, '');
INSERT INTO `one_auth_rule` VALUES (29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, '');
INSERT INTO `one_auth_rule` VALUES (30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, '');
INSERT INTO `one_auth_rule` VALUES (31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, '');
INSERT INTO `one_auth_rule` VALUES (34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (42, 'admin', 1, 'Admin/Addons/create', '创建', 1, '');
INSERT INTO `one_auth_rule` VALUES (43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, '');
INSERT INTO `one_auth_rule` VALUES (44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, '');
INSERT INTO `one_auth_rule` VALUES (45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, '');
INSERT INTO `one_auth_rule` VALUES (46, 'admin', 1, 'Admin/Addons/config', '设置', 1, '');
INSERT INTO `one_auth_rule` VALUES (47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, '');
INSERT INTO `one_auth_rule` VALUES (48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, '');
INSERT INTO `one_auth_rule` VALUES (49, 'admin', 1, 'Admin/Addons/install', '安装', 1, '');
INSERT INTO `one_auth_rule` VALUES (50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, '');
INSERT INTO `one_auth_rule` VALUES (51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, '');
INSERT INTO `one_auth_rule` VALUES (52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, '');
INSERT INTO `one_auth_rule` VALUES (53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, '');
INSERT INTO `one_auth_rule` VALUES (54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (56, 'admin', 1, 'Admin/model/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (57, 'admin', 1, 'Admin/model/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, '');
INSERT INTO `one_auth_rule` VALUES (59, 'admin', 1, 'Admin/model/update', '保存数据', 1, '');
INSERT INTO `one_auth_rule` VALUES (60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (62, 'admin', 1, 'Admin/Config/del', '删除', 1, '');
INSERT INTO `one_auth_rule` VALUES (63, 'admin', 1, 'Admin/Config/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (64, 'admin', 1, 'Admin/Config/save', '保存', 1, '');
INSERT INTO `one_auth_rule` VALUES (65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, '');
INSERT INTO `one_auth_rule` VALUES (66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (67, 'admin', 1, 'Admin/Channel/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (69, 'admin', 1, 'Admin/Channel/del', '删除', 1, '');
INSERT INTO `one_auth_rule` VALUES (70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (72, 'admin', 1, 'Admin/Category/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (73, 'admin', 1, 'Admin/Category/remove', '删除', 1, '');
INSERT INTO `one_auth_rule` VALUES (74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, '');
INSERT INTO `one_auth_rule` VALUES (76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, '');
INSERT INTO `one_auth_rule` VALUES (77, 'admin', 1, 'Admin/file/download', '下载', -1, '');
INSERT INTO `one_auth_rule` VALUES (94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, '');
INSERT INTO `one_auth_rule` VALUES (80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, '');
INSERT INTO `one_auth_rule` VALUES (81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, '');
INSERT INTO `one_auth_rule` VALUES (82, 'admin', 1, 'Admin/Database/export', '备份', 1, '');
INSERT INTO `one_auth_rule` VALUES (83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, '');
INSERT INTO `one_auth_rule` VALUES (84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, '');
INSERT INTO `one_auth_rule` VALUES (86, 'admin', 1, 'Admin/Database/import', '恢复', 1, '');
INSERT INTO `one_auth_rule` VALUES (87, 'admin', 1, 'Admin/Database/del', '删除', 1, '');
INSERT INTO `one_auth_rule` VALUES (88, 'admin', 1, 'Admin/User/add', '新增用户', 1, '');
INSERT INTO `one_auth_rule` VALUES (89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, '');
INSERT INTO `one_auth_rule` VALUES (93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, '');
INSERT INTO `one_auth_rule` VALUES (95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, '');
INSERT INTO `one_auth_rule` VALUES (96, 'admin', 1, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `one_auth_rule` VALUES (97, 'admin', 1, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `one_auth_rule` VALUES (98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, '');
INSERT INTO `one_auth_rule` VALUES (100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, '');
INSERT INTO `one_auth_rule` VALUES (101, 'admin', 1, 'Admin/other', '其他', -1, '');
INSERT INTO `one_auth_rule` VALUES (102, 'admin', 1, 'Admin/Menu/add', '新增', 1, '');
INSERT INTO `one_auth_rule` VALUES (103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, '');
INSERT INTO `one_auth_rule` VALUES (104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, '');
INSERT INTO `one_auth_rule` VALUES (108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, '');
INSERT INTO `one_auth_rule` VALUES (109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, '');
INSERT INTO `one_auth_rule` VALUES (110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, '');
INSERT INTO `one_auth_rule` VALUES (205, 'admin', 1, 'Admin/think/add', '新增数据', 1, '');
INSERT INTO `one_auth_rule` VALUES (111, 'admin', 2, 'Admin/article/index', '文档列表', -1, '');
INSERT INTO `one_auth_rule` VALUES (112, 'admin', 2, 'Admin/article/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (113, 'admin', 2, 'Admin/article/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, '');
INSERT INTO `one_auth_rule` VALUES (115, 'admin', 2, 'Admin/article/update', '保存', -1, '');
INSERT INTO `one_auth_rule` VALUES (116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, '');
INSERT INTO `one_auth_rule` VALUES (117, 'admin', 2, 'Admin/article/move', '移动', -1, '');
INSERT INTO `one_auth_rule` VALUES (118, 'admin', 2, 'Admin/article/copy', '复制', -1, '');
INSERT INTO `one_auth_rule` VALUES (119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, '');
INSERT INTO `one_auth_rule` VALUES (120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, '');
INSERT INTO `one_auth_rule` VALUES (121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, '');
INSERT INTO `one_auth_rule` VALUES (122, 'admin', 2, 'Admin/article/permit', '还原', -1, '');
INSERT INTO `one_auth_rule` VALUES (123, 'admin', 2, 'Admin/article/clear', '清空', -1, '');
INSERT INTO `one_auth_rule` VALUES (124, 'admin', 2, 'Admin/User/add', '新增用户', -1, '');
INSERT INTO `one_auth_rule` VALUES (125, 'admin', 2, 'Admin/User/action', '用户行为', -1, '');
INSERT INTO `one_auth_rule` VALUES (126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, '');
INSERT INTO `one_auth_rule` VALUES (127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, '');
INSERT INTO `one_auth_rule` VALUES (128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, '');
INSERT INTO `one_auth_rule` VALUES (129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, '');
INSERT INTO `one_auth_rule` VALUES (130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, '');
INSERT INTO `one_auth_rule` VALUES (131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, '');
INSERT INTO `one_auth_rule` VALUES (132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, '');
INSERT INTO `one_auth_rule` VALUES (133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, '');
INSERT INTO `one_auth_rule` VALUES (135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, '');
INSERT INTO `one_auth_rule` VALUES (136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, '');
INSERT INTO `one_auth_rule` VALUES (137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, '');
INSERT INTO `one_auth_rule` VALUES (140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, '');
INSERT INTO `one_auth_rule` VALUES (149, 'admin', 2, 'Admin/Addons/create', '创建', -1, '');
INSERT INTO `one_auth_rule` VALUES (150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, '');
INSERT INTO `one_auth_rule` VALUES (151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, '');
INSERT INTO `one_auth_rule` VALUES (152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, '');
INSERT INTO `one_auth_rule` VALUES (153, 'admin', 2, 'Admin/Addons/config', '设置', -1, '');
INSERT INTO `one_auth_rule` VALUES (154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, '');
INSERT INTO `one_auth_rule` VALUES (155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, '');
INSERT INTO `one_auth_rule` VALUES (156, 'admin', 2, 'Admin/Addons/install', '安装', -1, '');
INSERT INTO `one_auth_rule` VALUES (157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, '');
INSERT INTO `one_auth_rule` VALUES (158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, '');
INSERT INTO `one_auth_rule` VALUES (159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, '');
INSERT INTO `one_auth_rule` VALUES (160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, '');
INSERT INTO `one_auth_rule` VALUES (161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (163, 'admin', 2, 'Admin/model/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (164, 'admin', 2, 'Admin/model/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, '');
INSERT INTO `one_auth_rule` VALUES (166, 'admin', 2, 'Admin/model/update', '保存数据', -1, '');
INSERT INTO `one_auth_rule` VALUES (167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, '');
INSERT INTO `one_auth_rule` VALUES (171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, '');
INSERT INTO `one_auth_rule` VALUES (172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (174, 'admin', 2, 'Admin/Config/del', '删除', -1, '');
INSERT INTO `one_auth_rule` VALUES (175, 'admin', 2, 'Admin/Config/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (176, 'admin', 2, 'Admin/Config/save', '保存', -1, '');
INSERT INTO `one_auth_rule` VALUES (177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (179, 'admin', 2, 'Admin/Channel/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (181, 'admin', 2, 'Admin/Channel/del', '删除', -1, '');
INSERT INTO `one_auth_rule` VALUES (182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (184, 'admin', 2, 'Admin/Category/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (185, 'admin', 2, 'Admin/Category/remove', '删除', -1, '');
INSERT INTO `one_auth_rule` VALUES (186, 'admin', 2, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `one_auth_rule` VALUES (187, 'admin', 2, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `one_auth_rule` VALUES (188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, '');
INSERT INTO `one_auth_rule` VALUES (189, 'admin', 2, 'Admin/Database/export', '备份', -1, '');
INSERT INTO `one_auth_rule` VALUES (190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, '');
INSERT INTO `one_auth_rule` VALUES (191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, '');
INSERT INTO `one_auth_rule` VALUES (192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, '');
INSERT INTO `one_auth_rule` VALUES (193, 'admin', 2, 'Admin/Database/import', '恢复', -1, '');
INSERT INTO `one_auth_rule` VALUES (194, 'admin', 2, 'Admin/Database/del', '删除', -1, '');
INSERT INTO `one_auth_rule` VALUES (195, 'admin', 2, 'Admin/other', '其他', 1, '');
INSERT INTO `one_auth_rule` VALUES (196, 'admin', 2, 'Admin/Menu/add', '新增', -1, '');
INSERT INTO `one_auth_rule` VALUES (197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, '');
INSERT INTO `one_auth_rule` VALUES (198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, '');
INSERT INTO `one_auth_rule` VALUES (199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `one_auth_rule` VALUES (200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, '');
INSERT INTO `one_auth_rule` VALUES (201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, '');
INSERT INTO `one_auth_rule` VALUES (202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, '');
INSERT INTO `one_auth_rule` VALUES (203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, '');
INSERT INTO `one_auth_rule` VALUES (204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, '');
INSERT INTO `one_auth_rule` VALUES (206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, '');
INSERT INTO `one_auth_rule` VALUES (207, 'admin', 1, 'Admin/Menu/import', '导入', 1, '');
INSERT INTO `one_auth_rule` VALUES (208, 'admin', 1, 'Admin/Model/generate', '生成', 1, '');
INSERT INTO `one_auth_rule` VALUES (209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, '');
INSERT INTO `one_auth_rule` VALUES (210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, '');
INSERT INTO `one_auth_rule` VALUES (211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, '');
INSERT INTO `one_auth_rule` VALUES (212, 'admin', 1, 'Admin/Config/sort', '排序', 1, '');
INSERT INTO `one_auth_rule` VALUES (213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, '');
INSERT INTO `one_auth_rule` VALUES (214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, '');
INSERT INTO `one_auth_rule` VALUES (215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, '');
INSERT INTO `one_auth_rule` VALUES (216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');
INSERT INTO `one_auth_rule` VALUES (217, 'admin', 1, 'Admin/article/index', '文档列表', 1, '');
INSERT INTO `one_auth_rule` VALUES (218, 'admin', 1, 'Admin/think/lists', '数据列表', 1, '');

-- ----------------------------
-- Table structure for one_category
-- ----------------------------
DROP TABLE IF EXISTS `one_category`;
CREATE TABLE `one_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `list_row` tinyint(3) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表每页行数',
  `meta_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许回复',
  `check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `extend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展设置',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类图标',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_category
-- ----------------------------
INSERT INTO `one_category` VALUES (1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 0, 0, '');
INSERT INTO `one_category` VALUES (2, 'default_blog', '默认分类', 1, 1, 10, '', '', '', '', '', '', '', '2,3,4,6', '2,4,6', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1530168319, 0, 0, '');
INSERT INTO `one_category` VALUES (40, 'home', 'YaSin', 0, 1, 10, '', '', '', '', '', '', '', '12', '12', '1', 0, 0, 1, 0, 1, '', NULL, 1530169340, 1530596578, 1, 0, '');
INSERT INTO `one_category` VALUES (41, 'third', '医疗布局', 40, 2, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530171948, 1531454118, 1, 0, '');
INSERT INTO `one_category` VALUES (42, 'first', '首屏', 40, 0, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530246226, 1530515513, 1, 0, '');
INSERT INTO `one_category` VALUES (43, 'Third_list', '综合医院', 41, 0, 10, '', '', '', '', '', '', '', '18', '18', '2,1,3', 0, 1, 1, 0, 1, '', NULL, 1530258018, 1531455609, 1, 0, '');
INSERT INTO `one_category` VALUES (47, 'second_list', '亚信集团列表', 46, 0, 10, '', '', '', '', '', '', '', '21,16', '21,16', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530523725, 1531898631, 1, 0, '');
INSERT INTO `one_category` VALUES (48, 'fourth', '产业资源', 40, 3, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530607778, 1531454128, 1, 0, '');
INSERT INTO `one_category` VALUES (46, 'second', '亚信集团', 40, 1, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 2, 0, 0, '', NULL, 1530523363, 1531454097, 1, 0, '');
INSERT INTO `one_category` VALUES (49, 'fourth_list', '院企合作', 48, 0, 10, '', '', '', '', '', '', '', '21,17', '21,17', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530608364, 1534233679, 1, 0, '');
INSERT INTO `one_category` VALUES (60, 'fuse', '医教研融合', 48, 1, 10, '', '', '', '', '', '', '', '', '', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531455770, 1531455776, 1, 0, '');
INSERT INTO `one_category` VALUES (50, 'fifth', '最新资讯', 40, 4, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530693597, 1531454145, 1, 0, '');
INSERT INTO `one_category` VALUES (51, 'fifth_list', '医院动态', 50, 0, 10, '', '', '', '', '', '', '', '19', '19', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1530696852, 1532590971, 1, 0, '');
INSERT INTO `one_category` VALUES (53, 'news', '集团新闻', 50, 1, 10, '', '', '', '', '', '', '', '19', '19', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531454226, 1531473700, 1, 0, '');
INSERT INTO `one_category` VALUES (57, 'specialty', '专科医院', 41, 1, 10, '', '', '', '', '', '', '', '', '', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531455649, 1531455693, 1, 0, '');
INSERT INTO `one_category` VALUES (54, 'about', '关于我们', 40, 5, 10, '', '', '', '', '', '', '', '12', '12', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531454263, 1532331703, 1, 0, '');
INSERT INTO `one_category` VALUES (55, 'call_us', '联系我们', 54, 0, 10, '', '', '', '', '', '', '', '24', '24', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531454297, 1534743418, 1, 0, '');
INSERT INTO `one_category` VALUES (56, 'recruit', '招贤纳士', 54, 1, 10, '', '', '', '', '', '', '', '23', '23', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531454329, 1532506072, 1, 0, '');
INSERT INTO `one_category` VALUES (58, 'High', '高端医疗', 41, 2, 10, '', '', '', '', '', '', '', '', '', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531455680, 1531455688, 1, 0, '');
INSERT INTO `one_category` VALUES (59, 'accelerator', '医疗创新加速器', 41, 3, 10, '', '', '', '', '', '', '', '', '', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531455724, 1531455731, 1, 0, '');
INSERT INTO `one_category` VALUES (61, 'partners', '全球伙伴', 48, 2, 10, '', '', '', '', '', '', '', '', '', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531455801, 1531455822, 1, 0, '');
INSERT INTO `one_category` VALUES (62, 'colligate_list', '综合医院列表', 43, 0, 6, '', '', '', '', '', '', '', '22', '22', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531456007, 1534755436, 1, 0, '');
INSERT INTO `one_category` VALUES (63, 'specialty_list', '专科医院列表', 57, 0, 6, '', '', '', '', '', '', '', '22', '22', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531456502, 1534755497, 1, 0, '');
INSERT INTO `one_category` VALUES (64, 'high_list', '高端医疗列表', 58, 0, 6, '', '', '', '', '', '', '', '22', '22', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531456550, 1534755506, 1, 0, '');
INSERT INTO `one_category` VALUES (65, 'accelerator_list', '创新加速器列表', 59, 0, 6, '', '', '', '', '', '', '', '22', '22', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531456619, 1534755516, 1, 0, '');
INSERT INTO `one_category` VALUES (74, 'teach_list', '医教研融合列表', 60, 0, 10, '', '', '', '', '', '', '', '21', '21', '', 0, 1, 1, 0, 0, '', NULL, 1534748782, 1534748782, 0, 0, '');
INSERT INTO `one_category` VALUES (75, 'partners_list', '全球伙伴列表', 61, 0, 10, '', '', '', '', '', '', '', '21', '21', '', 0, 1, 1, 0, 0, '', NULL, 1534748820, 1534748820, 0, 0, '');
INSERT INTO `one_category` VALUES (69, 'dynamic_list', '医院动态列表', 51, 0, 10, '', '', '', '', '', '', '', '21', '21', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531458746, 1531470625, 1, 0, '');
INSERT INTO `one_category` VALUES (70, 'news_list', '集团新闻列表', 53, 0, 10, '', '', '', '', '', '', '', '21', '21', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531458836, 1531469691, 1, 0, '');
INSERT INTO `one_category` VALUES (71, 'recruit_list', '招贤纳士列表', 56, 0, 10, '', '', '', '', '', '', '', '27', '27', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1531458898, 1534389210, 1, 0, '');
INSERT INTO `one_category` VALUES (73, 'cooperation_list', '院企合作列表', 49, 0, 10, '', '', '', '', '', '', '', '21', '21', '2', 0, 1, 1, 0, 0, '', NULL, 1534748753, 1534748848, 0, 0, '');
INSERT INTO `one_category` VALUES (72, 'video', '宣传视频', 54, 2, 10, '', '', '', '', '', '', '', '25', '25', '2', 0, 1, 1, 0, 0, '', NULL, 1532396577, 1533269306, 1, 0, '');

-- ----------------------------
-- Table structure for one_channel
-- ----------------------------
DROP TABLE IF EXISTS `one_channel`;
CREATE TABLE `one_channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级频道ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道标题',
  `en_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道英文标题',
  `url` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新窗口打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_channel
-- ----------------------------
INSERT INTO `one_channel` VALUES (1, 0, '亚信集团', 'YAXIN GROUP', '#stage2', 1, 1379475111, 1532587199, 1, 0);
INSERT INTO `one_channel` VALUES (2, 0, '医疗布局', 'BUSINESS', '#stage3', 2, 1379475131, 1532587206, 1, 0);
INSERT INTO `one_channel` VALUES (3, 0, '产业资源', 'RESOURCE', '#stage4', 3, 1379475154, 1532587220, 1, 0);
INSERT INTO `one_channel` VALUES (4, 0, '最新资讯', 'NEWS', '#stage5', 4, 1532402261, 1532587227, 1, 0);
INSERT INTO `one_channel` VALUES (5, 0, '关于我们', 'ABOUT US', '#stage6', 5, 1532402280, 1532587232, 1, 0);

-- ----------------------------
-- Table structure for one_config
-- ----------------------------
DROP TABLE IF EXISTS `one_config`;
CREATE TABLE `one_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_config
-- ----------------------------
INSERT INTO `one_config` VALUES (1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '亚信产业集团', 1);
INSERT INTO `one_config` VALUES (2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'OneThink内容管理框架', 5);
INSERT INTO `one_config` VALUES (3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 19);
INSERT INTO `one_config` VALUES (4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 6);
INSERT INTO `one_config` VALUES (9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1532421084, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 9);
INSERT INTO `one_config` VALUES (10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '渝ICP备14004393号-1', 22);
INSERT INTO `one_config` VALUES (11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 11);
INSERT INTO `one_config` VALUES (12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 14);
INSERT INTO `one_config` VALUES (13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 25);
INSERT INTO `one_config` VALUES (20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 15);
INSERT INTO `one_config` VALUES (21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17);
INSERT INTO `one_config` VALUES (22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20);
INSERT INTO `one_config` VALUES (23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 7);
INSERT INTO `one_config` VALUES (24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 10);
INSERT INTO `one_config` VALUES (25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 26);
INSERT INTO `one_config` VALUES (26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 12);
INSERT INTO `one_config` VALUES (27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13);
INSERT INTO `one_config` VALUES (28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 16);
INSERT INTO `one_config` VALUES (29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18);
INSERT INTO `one_config` VALUES (30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 24);
INSERT INTO `one_config` VALUES (31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 27);
INSERT INTO `one_config` VALUES (32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 28);
INSERT INTO `one_config` VALUES (33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2);
INSERT INTO `one_config` VALUES (34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3);
INSERT INTO `one_config` VALUES (35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 4);
INSERT INTO `one_config` VALUES (36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 29);
INSERT INTO `one_config` VALUES (37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 8);
INSERT INTO `one_config` VALUES (38, 'WEB_SITE_COPYRIGHT', 1, '版权信息', 1, '', '设置在网站底部显示的版权信息', 1532413332, 1532413364, 1, 'Copyright  2018 Chongqing Yisin Holdings Co., Ltd.All Rights Reserved.', 23);
INSERT INTO `one_config` VALUES (39, 'WEB_SITE_ADDRESS', 2, '公司地址', 1, '', '公司详细地址', 1532413428, 1532413519, 1, '重庆市渝北区洪湖西路26号亚信大厦', 21);

-- ----------------------------
-- Table structure for one_document
-- ----------------------------
DROP TABLE IF EXISTS `one_document`;
CREATE TABLE `one_document`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `name` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) UNSIGNED NOT NULL COMMENT '所属分组',
  `description` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '根节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属ID',
  `model_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容模型ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '内容类型',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐位',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '外链',
  `cover_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '封面',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '可见性',
  `deadline` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '截至时间',
  `attach` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件数量',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `comment` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT 0 COMMENT '优先级',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `view_num` int(3) NOT NULL COMMENT '首页编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE,
  INDEX `idx_status_type_pid`(`status`, `uid`, `pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_document
-- ----------------------------
INSERT INTO `one_document` VALUES (1, 1, '', 'OneThink1.1开发版发布', 2, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 11, 0, 0, 0, 1406001413, 1406001413, 1, 0);
INSERT INTO `one_document` VALUES (2, 1, '', '首页第二屏内容显示', 2, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 0, 1530168420, 1530168666, 1, 0);
INSERT INTO `one_document` VALUES (13, 1, '', '亚信集团', 46, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530523402, 1530523402, 1, 2);
INSERT INTO `one_document` VALUES (5, 1, '', '312', 41, 0, '', 0, 0, 7, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530171960, 1530172656, 1, 0);
INSERT INTO `one_document` VALUES (106, 1, '', '7', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825507, 1534825507, 1, 1);
INSERT INTO `one_document` VALUES (11, 1, '', 'Leading the Future Healthcare', 42, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530518760, 1532594782, 1, 1);
INSERT INTO `one_document` VALUES (9, 1, '', '医疗布局', 41, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530513300, 1532501261, 1, 3);
INSERT INTO `one_document` VALUES (15, 1, '', '亚信集团', 46, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530524340, 1532499305, 1, 2);
INSERT INTO `one_document` VALUES (16, 1, '', '产业资源', 48, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530607800, 1534240792, 1, 4);
INSERT INTO `one_document` VALUES (17, 1, '', '院企合作', 49, 0, '', 0, 0, 17, 2, 0, 0, 0, 1, 0, 0, 79, 0, 0, 0, 1530608460, 1532501384, 1, 4);
INSERT INTO `one_document` VALUES (18, 1, '', '综合医院', 43, 0, '', 0, 0, 18, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1530609600, 1534741583, 1, 3);
INSERT INTO `one_document` VALUES (19, 1, '', '最新资讯', 50, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530697311, 1530697311, 1, 5);
INSERT INTO `one_document` VALUES (43, 1, '', '医院名称', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 0, 1531732200, 1534755160, 1, 1);
INSERT INTO `one_document` VALUES (105, 1, '', '6', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825501, 1534825501, 1, 1);
INSERT INTO `one_document` VALUES (104, 1, '', 'homie', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825480, 1534825480, 1, 1);
INSERT INTO `one_document` VALUES (23, 1, '', '专科医院', 57, 0, '', 0, 0, 18, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530856380, 1534741716, 1, 3);
INSERT INTO `one_document` VALUES (24, 1, '', '高端医疗', 58, 0, '', 0, 0, 18, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530856440, 1534741752, 1, 3);
INSERT INTO `one_document` VALUES (25, 1, '', '医疗创新加速器', 59, 0, '', 0, 0, 18, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1530856440, 1534741771, 1, 3);
INSERT INTO `one_document` VALUES (103, 1, '', 'young OG', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825450, 1534825450, 1, 1);
INSERT INTO `one_document` VALUES (102, 1, '', '哟', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825437, 1534825437, 1, 1);
INSERT INTO `one_document` VALUES (101, 1, '', '哈~', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825425, 1534825425, 1, 1);
INSERT INTO `one_document` VALUES (100, 1, '', '嗨', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825414, 1534825414, 1, 1);
INSERT INTO `one_document` VALUES (99, 1, '', '没有', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825403, 1534825403, 1, 1);
INSERT INTO `one_document` VALUES (98, 1, '', '有', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825389, 1534825389, 1, 1);
INSERT INTO `one_document` VALUES (32, 1, '', '医教研融合', 60, 0, '', 0, 0, 17, 2, 0, 0, 0, 1, 0, 0, 26, 0, 0, 0, 1530867420, 1532501423, 1, 4);
INSERT INTO `one_document` VALUES (33, 1, '', '全球伙伴', 61, 0, '', 0, 0, 17, 2, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 1530867480, 1532501445, 1, 4);
INSERT INTO `one_document` VALUES (44, 1, '', '仁爱医院', 63, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 7, 0, 0, 0, 1531732680, 1534130142, 1, 1);
INSERT INTO `one_document` VALUES (91, 1, '', '友爱医院', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1534751400, 1534755184, 1, 1);
INSERT INTO `one_document` VALUES (41, 1, '', '1111111111总有一种力量让我们前行——亚信集团六周年庆典精彩回顾', 69, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 98, 0, 0, 0, 1531470660, 1533633869, 1, 1);
INSERT INTO `one_document` VALUES (42, 1, '', '2222222222总有一种力量让我们前行——亚信集团六周年庆典精彩回顾', 70, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 23, 0, 0, 0, 1531470720, 1531988342, 1, 1);
INSERT INTO `one_document` VALUES (45, 1, '', '集团背景', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 35, 0, 0, 9, 1531898640, 1534232385, 1, 1);
INSERT INTO `one_document` VALUES (46, 1, '', '投管历程', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 21, 0, 0, 8, 1531904280, 1532506736, 1, 1);
INSERT INTO `one_document` VALUES (47, 1, '', '医疗蓝图', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 7, 1531905480, 1532497847, 1, 1);
INSERT INTO `one_document` VALUES (48, 1, '', '公司结构', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 6, 1531988940, 1532497855, 1, 1);
INSERT INTO `one_document` VALUES (49, 1, '', '亚信委员会', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 7, 0, 0, 5, 1531988940, 1532497869, 1, 1);
INSERT INTO `one_document` VALUES (50, 1, '', '专业团队', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 4, 1531989000, 1532497884, 1, 1);
INSERT INTO `one_document` VALUES (51, 1, '', '丰富经验', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 3, 1531989000, 1532497894, 1, 1);
INSERT INTO `one_document` VALUES (52, 1, '', '集团荣誉', 47, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 5, 0, 0, 2, 1531989000, 1532497903, 1, 1);
INSERT INTO `one_document` VALUES (87, 1, '', '是什么', 65, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 18, 0, 0, 0, 1534309108, 1534309108, 1, 1);
INSERT INTO `one_document` VALUES (94, 1, '', '搞不懂', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751555, 1534751555, 1, 1);
INSERT INTO `one_document` VALUES (88, 1, '', 'Java开发工程师', 71, 0, '', 0, 0, 27, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534388909, 1534388909, 1, 1);
INSERT INTO `one_document` VALUES (56, 1, '', '医院动态', 69, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 146, 0, 0, 0, 1532060708, 1532060708, 1, 1);
INSERT INTO `one_document` VALUES (57, 1, '', '3', 69, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 200, 0, 0, 0, 1532060700, 1534318905, 1, 1);
INSERT INTO `one_document` VALUES (58, 1, '', '2', 69, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 109, 0, 0, 0, 1532060700, 1534318899, 1, 1);
INSERT INTO `one_document` VALUES (59, 1, '', '1', 69, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 72, 0, 0, 0, 1532060700, 1534318915, 1, 1);
INSERT INTO `one_document` VALUES (60, 1, '', '集团新闻 集团新闻', 70, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 140, 0, 0, 0, 1532061910, 1532061910, 1, 1);
INSERT INTO `one_document` VALUES (61, 1, '', '集团新闻 集团新闻', 70, 0, '', 0, 0, 21, 2, 0, 0, 0, 1, 0, 0, 252, 0, 0, 0, 1532061927, 1532061927, 1, 1);
INSERT INTO `one_document` VALUES (62, 1, '', '关于我们', 54, 0, '', 0, 0, 12, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532331720, 1532676409, 1, 6);
INSERT INTO `one_document` VALUES (78, 1, '', '协和医院', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 238, 0, 0, 0, 1533194820, 1534755075, 1, 1);
INSERT INTO `one_document` VALUES (66, 1, '', '联系我们', 55, 0, '', 0, 0, 23, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532337180, 1532672695, 1, 6);
INSERT INTO `one_document` VALUES (93, 1, '', '测试', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751544, 1534751544, 1, 1);
INSERT INTO `one_document` VALUES (97, 1, '', '测试问题', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751580, 1534755145, 1, 1);
INSERT INTO `one_document` VALUES (96, 1, '', '测试医院', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751613, 1534751613, 1, 1);
INSERT INTO `one_document` VALUES (70, 1, '', '招贤纳士', 56, 0, '', 0, 0, 23, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532509320, 1533276467, 1, 6);
INSERT INTO `one_document` VALUES (71, 1, '', '宣传视频', 72, 0, '', 0, 0, 23, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532509380, 1532922840, 1, 6);
INSERT INTO `one_document` VALUES (72, 1, '', '医院动态', 51, 0, '', 0, 0, 19, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532591100, 1532591227, 1, 5);
INSERT INTO `one_document` VALUES (95, 1, '', '干什么??', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751566, 1534751566, 1, 1);
INSERT INTO `one_document` VALUES (74, 1, '', '集团新闻', 53, 0, '', 0, 0, 19, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532591249, 1532591249, 1, 5);
INSERT INTO `one_document` VALUES (75, 1, '', '高端医疗', 64, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532669107, 1532669107, 3, 1);
INSERT INTO `one_document` VALUES (76, 1, '', '为阿达瓦', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 13, 0, 0, 0, 1532669460, 1534755170, 1, 1);
INSERT INTO `one_document` VALUES (77, 1, '', '高端医疗', 64, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1532669551, 1532669551, 1, 1);
INSERT INTO `one_document` VALUES (79, 1, '', '联系我们', 55, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 145, 0, 0, 0, 1533269400, 1533271766, 1, 1);
INSERT INTO `one_document` VALUES (80, 1, '', '宣传视频', 72, 0, '', 0, 0, 25, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1533270600, 1533272708, 1, 1);
INSERT INTO `one_document` VALUES (90, 1, '', 'python大数据', 71, 0, '', 0, 0, 27, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1534393033, 1534393033, 1, 1);
INSERT INTO `one_document` VALUES (89, 1, '', 'PHP开发工程师', 71, 0, '', 0, 0, 27, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534389240, 1534389284, 1, 1);
INSERT INTO `one_document` VALUES (92, 1, '', 'test', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534751520, 1534755193, 1, 1);
INSERT INTO `one_document` VALUES (107, 1, '', '8', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825513, 1534825513, 1, 1);
INSERT INTO `one_document` VALUES (108, 1, '', '9', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1534825518, 1534825518, 1, 1);
INSERT INTO `one_document` VALUES (109, 1, '', '10', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825527, 1534825527, 1, 1);
INSERT INTO `one_document` VALUES (110, 1, '', '11', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825533, 1534825533, 1, 1);
INSERT INTO `one_document` VALUES (111, 1, '', '12', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825538, 1534825538, 1, 1);
INSERT INTO `one_document` VALUES (112, 1, '', '13', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825550, 1534825550, 1, 1);
INSERT INTO `one_document` VALUES (113, 1, '', '15', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825559, 1534825559, 1, 1);
INSERT INTO `one_document` VALUES (114, 1, '', '16', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825568, 1534825568, 1, 1);
INSERT INTO `one_document` VALUES (115, 1, '', '17', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825574, 1534825574, 1, 1);
INSERT INTO `one_document` VALUES (116, 1, '', '18', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825585, 1534825585, 1, 1);
INSERT INTO `one_document` VALUES (117, 1, '', '19', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825594, 1534825594, 1, 1);
INSERT INTO `one_document` VALUES (118, 1, '', '20', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825602, 1534825602, 1, 1);
INSERT INTO `one_document` VALUES (119, 1, '', '21', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825740, 1534825740, 1, 1);
INSERT INTO `one_document` VALUES (120, 1, '', '21', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825746, 1534825746, 1, 1);
INSERT INTO `one_document` VALUES (121, 1, '', '22', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825752, 1534825752, 1, 1);
INSERT INTO `one_document` VALUES (122, 1, '', '23', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825758, 1534825758, 1, 1);
INSERT INTO `one_document` VALUES (123, 1, '', '24', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825764, 1534825764, 1, 1);
INSERT INTO `one_document` VALUES (124, 1, '', '25', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825778, 1534825778, 1, 1);
INSERT INTO `one_document` VALUES (125, 1, '', '26', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534825784, 1534825784, 1, 1);
INSERT INTO `one_document` VALUES (128, 1, '', '412', 62, 0, '', 0, 0, 22, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1534833103, 1534833103, 1, 1);

-- ----------------------------
-- Table structure for one_document_article
-- ----------------------------
DROP TABLE IF EXISTS `one_document_article`;
CREATE TABLE `one_document_article`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `parse` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容解析类型',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `template` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_article
-- ----------------------------
INSERT INTO `one_document_article` VALUES (1, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0);

-- ----------------------------
-- Table structure for one_document_article_details
-- ----------------------------
DROP TABLE IF EXISTS `one_document_article_details`;
CREATE TABLE `one_document_article_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章详情',
  `detail_type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '详情类型',
  `detail_img` int(10) UNSIGNED NOT NULL COMMENT '文章封面',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_article_details
-- ----------------------------
INSERT INTO `one_document_article_details` VALUES (41, '111111111总有一种力量让我们前行——亚信集团六周年庆典精彩回顾', '<div id=\"u1161\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#333333;\">\r\n	<div id=\"u1162\" class=\"text\">\r\n		<p>\r\n			测试test<span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span><span style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">测试test</span>\r\n		</p>\r\n	</div>\r\n</div>', '1', 2, '21312312', '');
INSERT INTO `one_document_article_details` VALUES (42, '222222222222总有一种力量让我们前行——亚信集团六周年庆典精彩回顾', '<div id=\"u1161\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#333333;\">\r\n	<div id=\"u1162\" class=\"text\">\r\n		<p>\r\n			4月15日，6周年·旺德福（Wonderful），亚信六周年庆典激情开启！亚信集团董事长荣毅先生、总裁王国亚女士、党总支书记兼总裁办主任田培忠先生、副总裁李龙吉先生、副总裁周琦先生、人力资源总监喻鹏先生、行政综合中心总监邹义群女士，以及亚信医院管理集团常务副总裁周祚贵先生、任我在线总经理赵路先生、安盛盈资产管理有限公司总经理李昕芮女士、修文百信医院院长代云富先生、梁平正康医院院长赵棋先生、北碚仁爱医院院长荣伟先生、亚信基金第三销售中心总经理贺钶俊先生、道韵医疗投资建设中心总监冒朝钰女士等公司领导出席了本次庆典。\r\n		</p>\r\n	</div>\r\n</div>\r\n<div id=\"u1163\" class=\"ax_default box_2\" style=\"font-family:PingFangSC-Regular, \" font-size:28px;color:#999999;text-align:center;\"=\"\">\r\n<div id=\"u1163_div\" class=\"\" style=\"background-color:#F2F2F2;border:none;\">\r\n</div>\r\n<div id=\"u1164\" class=\"text\">\r\n	<p>\r\n		暂无新闻图片\r\n	</p>\r\n</div>\r\n	</div>\r\n	<div id=\"u1165\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#333333;\">\r\n		<div id=\"u1165_div\" class=\"\" style=\"background-color:rgba(255, 255, 255, 0);border:none;\">\r\n		</div>\r\n		<div id=\"u1166\" class=\"text\">\r\n			<p>\r\n				荣毅董事长在庆典开始前以“总有一种力量让我们前行”为主题发表了精彩的开场致辞，荣董用真切的言语回顾了亚信六年来艰辛的创业经历，他说到：“六年归一日，百岁也亦年”，亚信将继续坚定信念，百尺竿头更进一步，开启亚信二次创业新征程。荣董精彩的致辞过后，欢乐的庆祝环节正式拉开帷幕！\r\n			</p>\r\n		</div>\r\n	</div>', '1', 4, '2222222222222', '');
INSERT INTO `one_document_article_details` VALUES (45, '集团背景', '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来。</span> \r\n</p>', '1', 6, '亚信健康产业集团简介描述内容，不超过两行。', 'GROUP BACKGROUND');
INSERT INTO `one_document_article_details` VALUES (46, '投管历程', '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来。</span> \r\n</p>', '1', 7, '14年基金投资背景，专注三大领域，重点布局医疗', '');
INSERT INTO `one_document_article_details` VALUES (47, '医疗蓝图', '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	222222222重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来。</span> \r\n</p>', '1', 8, '医疗健康产业的FUTURE战略：100家300-400平...', '');
INSERT INTO `one_document_article_details` VALUES (48, '公司结构', '<span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span><span>test测试</span>', '1', 9, '基本架构，简介描述内容，不超过两行。', '');
INSERT INTO `one_document_article_details` VALUES (49, '亚信委员会', '<span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span>', '1', 10, '暂无描述内容暂无描述内容暂无描述内容', '');
INSERT INTO `one_document_article_details` VALUES (50, '专业团队', '<span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">三大团队，简介描述内容，不超过两行。</span>', '1', 11, '三大团队，简介描述内容，不超过两行。', '');
INSERT INTO `one_document_article_details` VALUES (51, '丰富经验', '<span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">3年，25家企业，数个尖端合作伙伴</span>', '1', 12, '3年，25家企业，数个尖端合作伙伴', '');
INSERT INTO `one_document_article_details` VALUES (52, '集团荣誉', '<span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span><span style=\"color:#999999;font-family:ArialMT, Arial;font-size:14px;\">暂无描述内容暂无描述内容暂无描述内容</span>', '1', 13, '暂无描述内容暂无描述内容暂无描述内容', '');
INSERT INTO `one_document_article_details` VALUES (56, '医院动态', '医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态', '1', 1, '医院动态医院动态', '');
INSERT INTO `one_document_article_details` VALUES (57, '3', '医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态', '1', 1, '医院动态医院动态', '');
INSERT INTO `one_document_article_details` VALUES (58, '2', '医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态', '1', 4, '医院动态医院动态医院动态医院动态', '');
INSERT INTO `one_document_article_details` VALUES (59, '1', '医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态医院动态', '1', 1, '医院动态医院动态', '');
INSERT INTO `one_document_article_details` VALUES (60, '集团新闻 集团新闻 ', '<span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span>', '1', 1, '集团新闻 集团新闻 集团新闻 ', '');
INSERT INTO `one_document_article_details` VALUES (61, '集团新闻 集团新闻 ', '<span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span><span>集团新闻&nbsp;</span>', '1', 4, '集团新闻 集团新闻 集团新闻 ', '');
INSERT INTO `one_document_article_details` VALUES (63, '联系我们', '<div id=\"u1239\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:20px;color:#CCCCCC;\">\r\n	<div id=\"u1240\" class=\"text\">\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<div id=\"u1239\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:20px;color:#CCCCCC;\">\r\n			<div id=\"u1240\" class=\"text\">\r\n				<p>\r\n					重庆亚信健康产业集团有限公司\r\n				</p>\r\n			</div>\r\n		</div>\r\n		<div id=\"u1241\" class=\"ax_default\" style=\"font-family:ArialMT, Arial;font-size:13px;color:#333333;text-align:center;\">\r\n			<div id=\"u1242\" class=\"ax_default table_cell\" style=\"font-size:18px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1242_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1242.png\" style=\"width:300px;height:45px;\" /> \r\n				<div id=\"u1243\" class=\"text\">\r\n					<p>\r\n						公司地址\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div id=\"u1244\" class=\"ax_default table_cell\" style=\"font-size:18px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1244_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1242.png\" style=\"width:300px;height:45px;\" /> \r\n				<div id=\"u1245\" class=\"text\">\r\n					<p>\r\n						400电话\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div id=\"u1246\" class=\"ax_default table_cell\" style=\"font-size:18px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1246_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1246.png\" style=\"width:300px;height:45px;\" /> \r\n				<div id=\"u1247\" class=\"text\">\r\n					<p>\r\n						E-mail\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div id=\"u1248\" class=\"ax_default table_cell\" style=\"font-size:14px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1248_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1248.png\" style=\"width:300px;height:40px;\" /> \r\n				<div id=\"u1249\" class=\"text\">\r\n					<p>\r\n						中国.重庆 北碚区洪湖西路26号亚信大厦\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div id=\"u1250\" class=\"ax_default table_cell\" style=\"font-size:14px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1250_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1248.png\" style=\"width:300px;height:40px;\" /> \r\n				<div id=\"u1251\" class=\"text\">\r\n					<p>\r\n						400-111-0183\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div id=\"u1252\" class=\"ax_default table_cell\" style=\"font-size:14px;color:#CCCCCC;text-align:left;\">\r\n				<img id=\"u1252_img\" class=\"img \" src=\"file://C:/Users/Administrator/Desktop/%E4%BA%9A%E4%BF%A1%E5%81%A5%E5%BA%B7%E4%BA%A7%E4%B8%9A%E9%9B%86%E5%9B%A2%E5%AE%98%E7%BD%91/images/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC/u1252.png\" style=\"width:300px;height:40px;\" /> \r\n				<div id=\"u1253\" class=\"text\">\r\n					<p>\r\n						cantact@yasin.com\r\n					</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div id=\"u1254\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#CCCCCC;\">\r\n			<div id=\"u1254_div\" class=\"\" style=\"background-color:rgba(255, 255, 255, 0);border:none;\">\r\n			</div>\r\n			<div id=\"u1255\" class=\"text\">\r\n				<p>\r\n					亚信控股在初期建立的时候，恰逢国内民间金融行业开放时期，初涉金融行业的我们，并没有因为年轻而自傲或自负，在全体同仁的努力奋进下，我们一路向前，在短短一年时间里我们以更高的姿态展现在世人面前。这一年多来，亚信吸纳了社会各界精英人才，这也是对亚信控股大家庭的肯定。\r\n				</p>\r\n				<p>\r\n					<br />\r\n				</p>\r\n				<p>\r\n					亚信控股是一家年轻的集团公司，充满活力与激情，也乐于进取与成长。秉持着亚信控股的精神：真诚•协作 创新•成长 责任•价值，不断地追求进步与创新。某个阶段应该改变，我们就适时改变；哪里需要创新，我们就适度革新，也唯有如此才能以更快的步伐适应这个快速变动的时代。 　　除了在事业上的冲刺之外，更有为社会做出许多贡献，亚信并没有忘记“取之社会，用之社会”的道理，集团先后成立“亚信控股公益慈善基金会”和“亚信控股文化艺术慈善基金会”，积极投身于社会公益活动，承担相应社会责任，奉献我们的感恩之心来回馈社会。\r\n				</p>\r\n				<p>\r\n					<br />\r\n				</p>\r\n				<p>\r\n					关于未来，我们期望能在整体发展上表现得更加出色出众，亚信控股的宣传语是“风险管理家，财富好伙伴”，我们为了能提供給客户最优质最贴心最专业的服务，选择最适合我们的人才加入亚信成了当务之急，而“人才管理家，事业好伙伴”也是集团人力资源中心最重要的使命。然而，要成就大事业，必先有好的人才，我们成立了“金鼎学院”，就是希望能够让人才集聚于亚信、成长于亚信、展露于亚信。如果您赞同我们的经营管理理念，敢于接受挑战，对未来同样有一个美好的愿景，欢迎您加入亚信控股大家庭，与我们一起共创辉煌，书写精彩人生！\r\n				</p>\r\n			</div>\r\n		</div>\r\n		<p>\r\n			<br />\r\n		</p>\r\n	</div>\r\n</div>\r\n<div id=\"u1254\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#CCCCCC;\">\r\n	<div id=\"u1254_div\" class=\"\" style=\"background-color:rgba(255, 255, 255, 0);border:none;\">\r\n	</div>\r\n	<div id=\"u1255\" class=\"text\">\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n	</div>\r\n</div>', '1', 2, '暂无详细内容描述，暂无详细内容描述，暂无详细内容  暂无详细内容描述，暂无详细内容描述，暂无详细内容', '');

-- ----------------------------
-- Table structure for one_document_base
-- ----------------------------
DROP TABLE IF EXISTS `one_document_base`;
CREATE TABLE `one_document_base`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for one_document_contact_us
-- ----------------------------
DROP TABLE IF EXISTS `one_document_contact_us`;
CREATE TABLE `one_document_contact_us`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表标题',
  `list_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表副标题',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司电话',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司邮箱',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司详情',
  `company_img` int(10) UNSIGNED NOT NULL COMMENT '公司背景图',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表封面图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_contact_us
-- ----------------------------
INSERT INTO `one_document_contact_us` VALUES (79, '联系我们', '', 'CONTACT US', '重庆亚信健康产业集团有限公司', '中国.重庆.北碚区洪湖西路26号亚信大厦', '400-111-0183', 'cantact@yasin.com', '公司详情测试TESTtest--<span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span><span>公司详情测试TESTtest--</span>', 3, 21);

-- ----------------------------
-- Table structure for one_document_download
-- ----------------------------
DROP TABLE IF EXISTS `one_document_download`;
CREATE TABLE `one_document_download`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `parse` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容解析类型',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型下载表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for one_document_fifth_list
-- ----------------------------
DROP TABLE IF EXISTS `one_document_fifth_list`;
CREATE TABLE `one_document_fifth_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主标题',
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情内容',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '新闻封面图',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_fifth_list
-- ----------------------------
INSERT INTO `one_document_fifth_list` VALUES (72, '医院动态', '', 0, 'Hospital dynamics');
INSERT INTO `one_document_fifth_list` VALUES (74, '集团新闻', '', 0, 'Group news');

-- ----------------------------
-- Table structure for one_document_fourth_list
-- ----------------------------
DROP TABLE IF EXISTS `one_document_fourth_list`;
CREATE TABLE `one_document_fourth_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表标题',
  `list_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表副标题',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表背景图',
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表详情',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_fourth_list
-- ----------------------------
INSERT INTO `one_document_fourth_list` VALUES (17, '院企合作', '暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细  暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细', 18, '<div id=\"u1161\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#333333;\">\r\n	<div id=\"u1162\" class=\"text\">\r\n		<p>\r\n			4月15日，6周年·旺德福（Wonderful），亚信六周年庆典激情开启！亚信集团董事长荣毅先生、总裁王国亚女士、党总支书记兼总裁办主任田培忠先生、副总裁李龙吉先生、副总裁周琦先生、人力资源总监喻鹏先生、行政综合中心总监邹义群女士，以及亚信医院管理集团常务副总裁周祚贵先生、任我在线总经理赵路先生、安盛盈资产管理有限公司总经理李昕芮女士、修文百信医院院长代云富先生、梁平正康医院院长赵棋先生、北碚仁爱医院院长荣伟先生、亚信基金第三销售中心总经理贺钶俊先生、道韵医疗投资建设中心总监冒朝钰女士等公司领导出席了本次庆典。\r\n		</p>\r\n	</div>\r\n</div>\r\n<div id=\"u1163\" class=\"ax_default box_2\" style=\"font-family:PingFangSC-Regular, \" font-size:28px;color:#999999;text-align:center;\"=\"\">\r\n<div id=\"u1163_div\" class=\"\" style=\"background-color:#F2F2F2;border:none;\">\r\n</div>\r\n<div id=\"u1164\" class=\"text\">\r\n	<p>\r\n		暂无新闻图片\r\n	</p>\r\n</div>\r\n	</div>\r\n	<div id=\"u1165\" class=\"ax_default label\" style=\"font-family:ArialMT, Arial;font-size:14px;color:#333333;\">\r\n		<div id=\"u1165_div\" class=\"\" style=\"background-color:rgba(255, 255, 255, 0);border:none;\">\r\n		</div>\r\n		<div id=\"u1166\" class=\"text\">\r\n			<p>\r\n				荣毅董事长在庆典开始前以“总有一种力量让我们前行”为主题发表了精彩的开场致辞，荣董用真切的言语回顾了亚信六年来艰辛的创业经历，他说到：“六年归一日，百岁也亦年”，亚信将继续坚定信念，百尺竿头更进一步，开启亚信二次创业新征程。荣董精彩的致辞过后，欢乐的庆祝环节正式拉开帷幕！\r\n			</p>\r\n		</div>\r\n	</div>', 'Enterprise cooperation');
INSERT INTO `one_document_fourth_list` VALUES (32, '医教研融合', '暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细  暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细', 19, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span> \r\n</p>', 'Integration of medical teaching and research');
INSERT INTO `one_document_fourth_list` VALUES (33, '全球伙伴', '暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细  暂无详细内容描述，暂无详细内容描述，暂无详细内容描述，暂无详细', 20, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span> \r\n</p>', 'Global partners');

-- ----------------------------
-- Table structure for one_document_home
-- ----------------------------
DROP TABLE IF EXISTS `one_document_home`;
CREATE TABLE `one_document_home`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主标题',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `banner_img` int(10) UNSIGNED NOT NULL COMMENT '背景图',
  `banner_video` int(10) UNSIGNED NOT NULL COMMENT '背景视频',
  `button` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮文字',
  `button_url` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮跳转地址',
  `pluploadimages` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '多图上传',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_home
-- ----------------------------
INSERT INTO `one_document_home` VALUES (9, '医疗布局', '一体两翼布局  建未来医疗标杆', 0, 0, '', '', '', 'An integrated two wing layout for future medical benchmarks');
INSERT INTO `one_document_home` VALUES (11, 'Leading the Future Healthcare', '亚信 . 引领未来医疗健康产业', 1, 4, ' 探索亚信', 'Home/Index/index', '', '');
INSERT INTO `one_document_home` VALUES (15, '亚信集团', '专注未来医疗  创新无限可能', 22, 0, 'test', 'Home/User/register', '', 'It is impossible to focus on future medical innovation');
INSERT INTO `one_document_home` VALUES (16, '产业资源', '产业双驱模式 初心铸百年企业', 0, 0, '发现更多', '', '', 'Industrial double drive model for a hundred years');
INSERT INTO `one_document_home` VALUES (19, '最新资讯', '', 3, 0, '', '', '', '');
INSERT INTO `one_document_home` VALUES (62, '关于我们', '产融双驱模式 初心铸百年企业', 0, 0, '发现更多', '', '', 'Production and melting of double drive model for a hundred years');

-- ----------------------------
-- Table structure for one_document_hospital_details
-- ----------------------------
DROP TABLE IF EXISTS `one_document_hospital_details`;
CREATE TABLE `one_document_hospital_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detail_img` int(10) UNSIGNED NOT NULL COMMENT '封面图',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `video` int(10) UNSIGNED NOT NULL COMMENT '视频',
  `detail_type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '详情类型',
  `expert` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卓越专家',
  `en_ambient` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领先技术(英文)',
  `tech` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领先技术简介',
  `ambient_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '环境图片',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_hospital_details
-- ----------------------------
INSERT INTO `one_document_hospital_details` VALUES (87, 17, '是什么', '是什么是什么是什么是什么', 6, '2', '[{\"path\":\"/Uploads/Picture/2018-08-15/5b73b2dde71a9.jpg\",\"id\":\"33\",\"name\":\"老大\",\"position\":\"院长\",\"introduce\":\"流弊\"}]', 'what`s this?', '是什么what`s this?是什么what`s this?', '[{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"}]', 0);
INSERT INTO `one_document_hospital_details` VALUES (43, 5, '医院名称', '暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无综合医院简介内容，暂无', 1, '2', '[]', '', '', '[]', 27);
INSERT INTO `one_document_hospital_details` VALUES (44, 5, '仁爱医院', '仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院仁爱医院', 0, '2', '[{\"path\":\"/Uploads/Picture/2018-08-09/5b6c0a9c53fc0.jpg\",\"id\":\"28\",\"name\":\"王医生\",\"position\":\"主治医师\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b70f7bd75c60.jpg\",\"id\":\"29\",\"name\":\"张教授\",\"position\":\"教授\"}]', '', '', '', 0);
INSERT INTO `one_document_hospital_details` VALUES (75, 0, '高端医疗', '高端医疗高端医疗高端医疗高端医疗高端医疗', 0, '2', '', '', '', '', 0);
INSERT INTO `one_document_hospital_details` VALUES (76, 0, '为阿达瓦', '为阿达瓦为阿达瓦', 0, '2', '[{\"path\":\"/Uploads/Picture/2018-08-02/5b62b7455c0a8.gif\",\"id\":\"23\",\"name\":\"640\",\"position\":\"\"}]', '', '', '[]', 27);
INSERT INTO `one_document_hospital_details` VALUES (77, 0, '高端医疗', '高端医疗高端医疗', 0, '2', '', '', '', '', 0);
INSERT INTO `one_document_hospital_details` VALUES (78, 25, '协和医院', '协和医院简介协和医院简介协和医院简介协和医院简介协和医院简介', 1, '2', '[{\"path\":\"/Uploads/Picture/2018-08-09/5b6c072943df0.jpg\",\"id\":\"26\",\"name\":\"刘教授\",\"position\":\"教授\",\"introduce\":\"123123\",\"seniority\":\"教授不叫兽\"},{\"path\":\"/Uploads/Picture/2018-08-09/5b6c0a9c53fc0.jpg\",\"id\":\"28\",\"name\":\"王医生\",\"position\":\"主治医师\",\"introduce\":\"6461321\",\"seniority\":\"医生哈说呢过是\"},{\"path\":\"/Uploads/Picture/2018-08-15/5b73b2dde71a9.jpg\",\"id\":\"33\",\"name\":\"陈太医\",\"position\":\"太医\",\"introduce\":\"23562\",\"seniority\":\"太医阿斯顿这些\"},{\"path\":\"/Uploads/Picture/2018-08-20/5b7a4587623e0.jpg\",\"id\":\"34\",\"name\":\"江郎中\",\"position\":\"郎中\",\"introduce\":\"打算打算\",\"seniority\":\"郎中撒大声地\"}]', 'The main task of the hospital is to provide assistance or service to the public health problems or health needs, and take on the tasks of preventing, diagnosing and treating diseases, rehabilitation and health promotion. In order to ensure that the patient can obtain a safe and comfortable treatment environment and get proper health care, it is necessary to create and maintain a good hospital social environment for the patients.\r\n', '病室湿度以50%~60%为宜。湿度过高或过低都会给病人带 来不适感。当湿度过高时，蒸发作用弱，可抑制出汗，病人 感到潮湿，气闷，尿液排出量增加，加重肾脏负担；湿度过 低，空气干燥，人体蒸发大量水分，引起口干舌燥，咽痛， 烦渴等表现，对呼吸道疾患或气管切开病人尤其不利。', '[{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"}]', 27);
INSERT INTO `one_document_hospital_details` VALUES (91, 35, '友爱医院', '友爱医院友爱医院友爱医院友爱医院', 6, '2', '[{\"path\":\"/Uploads/Picture/2018-08-15/5b73b2dde71a9.jpg\",\"id\":\"33\",\"name\":\"李医生\",\"position\":\"医生\",\"introduce\":\"懂很多东西,很厉害,还博学多才\"}]', 'company companycompanycompanycompanycompanycompany ', '厉害厉害厉害厉害厉害厉害厉害厉害厉害厉害厉害厉害厉害', '[{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"},{\"path\":\"/Uploads/Picture/2018-08-13/5b71079c24b80.png\",\"id\":\"30\",\"name\":\"qwe\"}]', 27);
INSERT INTO `one_document_hospital_details` VALUES (92, 0, 'test', 'testtesttesttesttest', 0, '2', '[]', '', '', '[]', 27);
INSERT INTO `one_document_hospital_details` VALUES (93, 0, '测试', '测试测试测试测试', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (94, 0, '搞不懂', '搞不懂搞不懂搞不懂', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (95, 0, '干什么??干什么??', '干什么??干什么??干什么??', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (96, 0, '测试医院', '测试医院测试医院测试医院', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (97, 0, '测试问题测试问题', '测试问题测试问题测试问题', 0, '2', '[]', '', '', '[]', 27);
INSERT INTO `one_document_hospital_details` VALUES (98, 0, '有', '有有有有有有有', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (99, 0, '没有', '没有没有没有没有没有没有', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (100, 0, '嗨', '嗨嗨嗨嗨嗨嗨', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (101, 0, '哈~', '哈~哈~哈~哈~', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (102, 0, '哟', '哟哟哟哟哟', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (103, 0, 'young OG', 'young OGyoung OGyoung OGyoung OG', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (104, 0, 'homie', 'homiehomiehomie', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (105, 0, '6', '6', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (106, 0, '7', '7', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (107, 0, '8', '8', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (108, 0, '9', '9', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (109, 0, '10', '10', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (110, 0, '11', '11', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (111, 0, '12', '12', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (112, 0, '13', '13', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (113, 0, '15', '15', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (114, 0, '16', '16', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (115, 0, '17', '17', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (116, 0, '18', '18', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (117, 0, '19', '19', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (118, 0, '20', '20', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (119, 0, '21', '21', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (120, 0, '21', '21', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (121, 0, '22', '22', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (122, 0, '23', '23', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (123, 0, '24', '24', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (124, 0, '25', '25', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (125, 0, '26', '26', 0, '2', '[]', '', '', '[]', 0);
INSERT INTO `one_document_hospital_details` VALUES (128, 0, '412', '4123', 0, '2', '[]', '', '', '[]', 0);

-- ----------------------------
-- Table structure for one_document_propagandist_video
-- ----------------------------
DROP TABLE IF EXISTS `one_document_propagandist_video`;
CREATE TABLE `one_document_propagandist_video`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表标题',
  `list_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表副标题',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  `video` int(10) UNSIGNED NOT NULL COMMENT '宣传视频',
  `video_img` int(10) UNSIGNED NOT NULL COMMENT '视频封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_propagandist_video
-- ----------------------------
INSERT INTO `one_document_propagandist_video` VALUES (80, '宣传视频', '', 'Propagandist video', 5, 21);

-- ----------------------------
-- Table structure for one_document_recruit
-- ----------------------------
DROP TABLE IF EXISTS `one_document_recruit`;
CREATE TABLE `one_document_recruit`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位',
  `duty` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位职责',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历投递邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_recruit
-- ----------------------------
INSERT INTO `one_document_recruit` VALUES (88, 'Java开发工程师', '<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	1、利用公司提供的资源、渠道拔打电话，开发新客户；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	2、通过电话了解客户需求，进行产品推荐、邀约客户；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	3、维护老客户，挖掘客户的最大潜力；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	4、协调公司内部资源，提高客户满意度；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	5、收集和分析市场数据，并定期反馈最新信息。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	6、有金融行业电话外呼经验者优先\r\n</p>', 'hr@yashin.com.cn');
INSERT INTO `one_document_recruit` VALUES (89, 'PHP开发工程师', '<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	1、利用公司提供的资源、渠道拔打电话，开发新客户；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	2、通过电话了解客户需求，进行产品推荐、邀约客户；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	3、维护老客户，挖掘客户的最大潜力；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	4、协调公司内部资源，提高客户满意度；\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	5、收集和分析市场数据，并定期反馈最新信息。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;background:#F7F7F7;color:#A1A1A1;font-family:SimHei;\">\r\n	6、有金融行业电话外呼经验者优先\r\n</p>', 'php@yashin.com.cn');
INSERT INTO `one_document_recruit` VALUES (90, 'python大数据', '大数据大数据大数据大数据大数据', 'sessionvon@qq.com');

-- ----------------------------
-- Table structure for one_document_second_list
-- ----------------------------
DROP TABLE IF EXISTS `one_document_second_list`;
CREATE TABLE `one_document_second_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主标题',
  `list_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表副标题',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表图片',
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_second_list
-- ----------------------------
INSERT INTO `one_document_second_list` VALUES (14, '集团背景', '亚信健康产业集团简介描述内容，不超过两行。', 2, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来。</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (21, '投管历程', '14年基金投资背景，专注三大领域，重点布局医疗', 3, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (22, '医疗蓝图', '医疗健康产业的FUTURE战略：100家300-400平...', 2, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (26, '公司结构', '基本架构，简介描述内容，不超过两行。', 3, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (27, '亚信委员会', '暂无描述内容暂无描述内容暂无描述内容', 1, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (28, '专业团队', '三大团队，简介描述内容，不超过两行。', 2, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (29, '丰富经验', '3年，25家企业，数个尖端合作伙伴', 2, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (30, '集团荣誉', '暂无描述内容暂无描述内容暂无描述内容', 1, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');
INSERT INTO `one_document_second_list` VALUES (31, 'test测试', '123123', 4, '<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	重庆亚信控股股份有限公司2012年在重庆成立<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团目前拥有五家全资子公司、3家控股子公司、7家参股公司，业务涉及地产经纪、资产管理、金融服务、股权投资、社区服务等众多领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:20px;\">\r\n	旗下全资子公司包括：<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆诚祥房地产经纪有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆恒隆资产管理股份有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆亚信圆通投资信息咨询有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	亚信股权投资基金管理（重庆）有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	重庆菜鸟社区服务有限公司\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	集团注册资本人民币1亿元，拥有超过3000名员工。目前亚信已形成“房地产经纪、资产管理、金融服务、股权投资、社区服务”五大业务引擎，并矢志向\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以房地产经纪为核心的渠道销售能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以资产运营为基础、获取收益最大化为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以微信贷为核心的综合金融能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以股权投资为核心的投资管理能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“以社区末端配送服务为重点的电子商务能力”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	五驾马车驱动的西南一流投资集团大步迈进。&nbsp;&nbsp; 让客户认同，赢得社会肯定与信赖是亚信长期以来所追求的卓越目标。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	我们深刻了解到必须保持稳健成长，透过创新与优质服务，与客户一起成功是永续经营的基石。人才是企业发展之本，创新是企业发展之魂。作为人才与智慧密集型企业，亚信控股汇聚了各行各业的高端人才，并真正实现了对员工不抛弃、不放弃，搭建发展平台，与员工共同成长。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	在发展过程中，集团始终坚持时时刻刻对外学习的理念，以全球视野、创新思维，打造出一支踏实进取、敢想敢干的精英团队，建立了一个低调稳健的企业集团。\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	“伙伴亚信，信守不渝”\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:14px;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:ArialMT, Arial;font-size:18px;\">\r\n	<span style=\"font-size:14px;\">亚信控股以</span>“真诚·协作、创新·成长，责任·价值”<span style=\"font-size:14px;\">为核心价值观，</span>“诚信、承诺、创新、合作”<span style=\"font-size:14px;\">为经营理念，纳百川，融细流，以感恩之心做民族事业，承担起企业公民应尽的责任和义务，服务社区、保障就业、共赢未来</span>\r\n</p>');

-- ----------------------------
-- Table structure for one_document_sixth_list
-- ----------------------------
DROP TABLE IF EXISTS `one_document_sixth_list`;
CREATE TABLE `one_document_sixth_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表标题',
  `list_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表副标题',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表图片',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  `company_img` int(10) UNSIGNED NOT NULL COMMENT '公司背景图',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_sixth_list
-- ----------------------------
INSERT INTO `one_document_sixth_list` VALUES (66, '联系我们', '暂无详细内容描述，暂无详细内容描述，暂无详细内容  暂无详细内容描述，暂无详细内容描述，暂无详细内容', 21, 'Contact us', 0, '0');
INSERT INTO `one_document_sixth_list` VALUES (70, '招贤纳士', '', 21, 'join us', 3, '400-111-0183');
INSERT INTO `one_document_sixth_list` VALUES (71, '宣传视频', '', 21, 'Propagandist video', 0, '0');

-- ----------------------------
-- Table structure for one_document_third_list
-- ----------------------------
DROP TABLE IF EXISTS `one_document_third_list`;
CREATE TABLE `one_document_third_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `list_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表标题',
  `list_img` int(10) UNSIGNED NOT NULL COMMENT '列表背景图',
  `en_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_document_third_list
-- ----------------------------
INSERT INTO `one_document_third_list` VALUES (18, '综合医院', 14, 'general hospital');
INSERT INTO `one_document_third_list` VALUES (23, '专科医院', 15, 'Specialist Hospital');
INSERT INTO `one_document_third_list` VALUES (24, '高端医疗', 16, 'High end medical treatment');
INSERT INTO `one_document_third_list` VALUES (25, '医疗创新加速器', 17, 'Medical innovation accelerator');

-- ----------------------------
-- Table structure for one_file
-- ----------------------------
DROP TABLE IF EXISTS `one_file`;
CREATE TABLE `one_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件保存位置',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_md5`(`md5`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_file
-- ----------------------------
INSERT INTO `one_file` VALUES (1, 'OneRepublic、Logic - Start Agai', '5b35c87994f98.mp4', '2018-06-29/', 'mp4', 'application/octet-stream', 24204145, '40e02e43d6400579dcf7e7c63509fc92', 'cf56391946325d4dff44ba957c9563d3bcff7681', 0, '', 1530251385);
INSERT INTO `one_file` VALUES (2, ')`SPCBLM]47N5F~0NQTX@O7.png', '5b4308d54a381.png', '2018-07-09/', 'png', 'application/octet-stream', 1605282, '5b1e305b2131f5e8bb2385ccfeb18bb1', '497fe26f960a15912ab07ab2e0de2636f2fc64ad', 0, '', 1531119829);
INSERT INTO `one_file` VALUES (3, ')9HJ_FB~~CQ{BX@9O03YTJ3.png', '5b4308d9b3ee9.png', '2018-07-09/', 'png', 'application/octet-stream', 870827, 'f0b3741eb737588a0dda12df8ab8b662', '3be3fd5981bea5e0da535f1bced8303e33df0dd7', 0, '', 1531119833);
INSERT INTO `one_file` VALUES (4, 'Ryugi_2ndPre.mp4', '5b5808787dfa2.mp4', '2018-07-25/', 'mp4', 'application/octet-stream', 4041273, '24536d3880e74c3301495ac37f5e58b4', 'f9ff86526c9afb6cf421f4bd8c7bce6dc1abcec5', 0, '', 1532495992);
INSERT INTO `one_file` VALUES (5, 'Viewt_2ndPre.mp4', '5b598a3b473da.mp4', '2018-07-26/', 'mp4', 'application/octet-stream', 4019333, '09195a17eebc319d96bc60839942e229', '97fbee7ba7a8aaffd1ec7bb4c5b99e12fa539ea6', 0, '', 1532594747);
INSERT INTO `one_file` VALUES (6, 'movie.mp4', '5b6c028c84148.mp4', '2018-08-09/', 'mp4', 'application/octet-stream', 11345502, 'b0687892214746edf3639e8dc5570ecc', '9a374eeead596a4d76e7453d75987c2651aa0b77', 0, '', 1533805196);
INSERT INTO `one_file` VALUES (7, 'Himiko_2ndPre.mp4', '5b714cd196fa0.mp4', '2018-08-13/', 'mp4', 'application/octet-stream', 3996955, '70d72e81c148ecac76ab0fb945df50b3', '5bf278f57de8d863525dbb6f730da2aaeeafcdc4', 0, '', 1534151889);

-- ----------------------------
-- Table structure for one_home
-- ----------------------------
DROP TABLE IF EXISTS `one_home`;
CREATE TABLE `one_home`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for one_hooks
-- ----------------------------
DROP TABLE IF EXISTS `one_hooks`;
CREATE TABLE `one_hooks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `addons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 \'，\'分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_hooks
-- ----------------------------
INSERT INTO `one_hooks` VALUES (1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1);
INSERT INTO `one_hooks` VALUES (2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1);
INSERT INTO `one_hooks` VALUES (3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1);
INSERT INTO `one_hooks` VALUES (4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1);
INSERT INTO `one_hooks` VALUES (5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1);
INSERT INTO `one_hooks` VALUES (6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1);
INSERT INTO `one_hooks` VALUES (7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1);
INSERT INTO `one_hooks` VALUES (8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1);
INSERT INTO `one_hooks` VALUES (13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1);
INSERT INTO `one_hooks` VALUES (14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1);
INSERT INTO `one_hooks` VALUES (16, 'app_begin', '应用开始', 2, 1384481614, '', 1);
INSERT INTO `one_hooks` VALUES (27, 'PluploadImages', '多图上传钩子', 1, 0, 'PluploadImages', 1);
INSERT INTO `one_hooks` VALUES (26, 'UploadImages', '多图文上传钩子', 1, 1534134278, 'UploadImages', 1);
INSERT INTO `one_hooks` VALUES (28, 'UploadPic', '多图片上传', 1, 1534141049, 'UploadPic', 1);

-- ----------------------------
-- Table structure for one_member
-- ----------------------------
DROP TABLE IF EXISTS `one_member`;
CREATE TABLE `one_member`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员状态',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_member
-- ----------------------------
INSERT INTO `one_member` VALUES (1, 'admin', 0, '0000-00-00', '', 180, 44, 0, 1529992838, 2130706433, 1534815747, 1);

-- ----------------------------
-- Table structure for one_menu
-- ----------------------------
DROP TABLE IF EXISTS `one_menu`;
CREATE TABLE `one_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_menu
-- ----------------------------
INSERT INTO `one_menu` VALUES (1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1);
INSERT INTO `one_menu` VALUES (4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1);
INSERT INTO `one_menu` VALUES (14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (16, '用户', 0, 3, 'User/index', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1);
INSERT INTO `one_menu` VALUES (18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1);
INSERT INTO `one_menu` VALUES (19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1);
INSERT INTO `one_menu` VALUES (20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (22, '保存用户行为', 19, 0, 'User/saveAction', 0, '\"用户->用户行为\"保存编辑和新增的用户行为', '', 0, 1);
INSERT INTO `one_menu` VALUES (23, '变更行为状态', 19, 0, 'User/setStatus', 0, '\"用户->用户行为\"中的启用,禁用和删除权限', '', 0, 1);
INSERT INTO `one_menu` VALUES (24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '\"用户->用户信息\"中的禁用', '', 0, 1);
INSERT INTO `one_menu` VALUES (25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '\"用户->用户信息\"中的启用', '', 0, 1);
INSERT INTO `one_menu` VALUES (26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '\"用户->用户信息\"中的删除', '', 0, 1);
INSERT INTO `one_menu` VALUES (27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1);
INSERT INTO `one_menu` VALUES (28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1);
INSERT INTO `one_menu` VALUES (29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1);
INSERT INTO `one_menu` VALUES (30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1);
INSERT INTO `one_menu` VALUES (31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1);
INSERT INTO `one_menu` VALUES (32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1);
INSERT INTO `one_menu` VALUES (33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的\"保存\"按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (34, '授权', 27, 0, 'AuthManager/group', 0, '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', 0, 1);
INSERT INTO `one_menu` VALUES (35, '访问授权', 27, 0, 'AuthManager/access', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (36, '成员授权', 27, 0, 'AuthManager/user', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '\"成员授权\"列表页内的解除授权操作按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', 0, 1);
INSERT INTO `one_menu` VALUES (39, '分类授权', 27, 0, 'AuthManager/category', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, 1);
INSERT INTO `one_menu` VALUES (43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1);
INSERT INTO `one_menu` VALUES (45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1);
INSERT INTO `one_menu` VALUES (46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1);
INSERT INTO `one_menu` VALUES (47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1);
INSERT INTO `one_menu` VALUES (48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1);
INSERT INTO `one_menu` VALUES (49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1);
INSERT INTO `one_menu` VALUES (50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1);
INSERT INTO `one_menu` VALUES (51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1);
INSERT INTO `one_menu` VALUES (52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1);
INSERT INTO `one_menu` VALUES (53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1);
INSERT INTO `one_menu` VALUES (54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1);
INSERT INTO `one_menu` VALUES (55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1);
INSERT INTO `one_menu` VALUES (57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1);
INSERT INTO `one_menu` VALUES (58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1);
INSERT INTO `one_menu` VALUES (64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1);
INSERT INTO `one_menu` VALUES (72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1);
INSERT INTO `one_menu` VALUES (73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1);
INSERT INTO `one_menu` VALUES (74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1);
INSERT INTO `one_menu` VALUES (75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1);
INSERT INTO `one_menu` VALUES (82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1);
INSERT INTO `one_menu` VALUES (83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1);
INSERT INTO `one_menu` VALUES (84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1);
INSERT INTO `one_menu` VALUES (85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1);
INSERT INTO `one_menu` VALUES (86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1);
INSERT INTO `one_menu` VALUES (87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1);
INSERT INTO `one_menu` VALUES (88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1);
INSERT INTO `one_menu` VALUES (89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1);
INSERT INTO `one_menu` VALUES (90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1);
INSERT INTO `one_menu` VALUES (91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1);
INSERT INTO `one_menu` VALUES (92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1);
INSERT INTO `one_menu` VALUES (93, '其他', 0, 5, 'other', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1);
INSERT INTO `one_menu` VALUES (98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1);
INSERT INTO `one_menu` VALUES (108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1);
INSERT INTO `one_menu` VALUES (123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1);

-- ----------------------------
-- Table structure for one_model
-- ----------------------------
DROP TABLE IF EXISTS `one_model`;
CREATE TABLE `one_model`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '继承的模型',
  `relation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '新建表时是否需要主键字段',
  `field_sort` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单字段排序',
  `field_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '列表定义',
  `list_row` smallint(2) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表数据长度',
  `search_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `engine_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_model
-- ----------------------------
INSERT INTO `one_model` VALUES (1, 'document', '首页', 0, '', 1, '{\"1\":[\"55\",\"54\",\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1530250195, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (2, 'article', '文章', 1, '', 1, '{\"1\":[\"55\",\"54\",\"3\",\"24\",\"2\",\"5\",\"102\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1531196069, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (3, 'download', '下载', 1, '', 1, '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (12, 'home', 'Banner', 1, '', 1, '{\"1\":[\"3\",\"67\",\"123\",\"68\",\"84\",\"85\",\"82\",\"100\",\"83\",\"54\"],\"2\":[\"17\",\"16\",\"14\",\"9\",\"55\",\"10\",\"11\",\"2\",\"5\",\"13\",\"12\",\"20\",\"19\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1530512837, 1532499028, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (18, 'third_list', '医疗布局', 1, '', 1, '{\"1\":[\"3\",\"90\",\"125\",\"91\",\"92\",\"93\"],\"2\":[\"54\",\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"20\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1530609400, 1534741510, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (19, 'fifth_list', '最新资讯', 1, '', 1, '{\"1\":[\"3\",\"95\",\"127\",\"97\",\"54\"],\"2\":[\"96\",\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"20\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1530693640, 1532672531, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (21, 'article_details', '文章详情', 1, '', 1, '{\"1\":[\"3\",\"109\",\"155\",\"117\",\"116\",\"110\"],\"2\":[\"115\",\"9\",\"10\",\"11\",\"12\",\"2\",\"5\",\"13\",\"14\",\"55\",\"54\",\"20\",\"16\",\"17\",\"19\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1531463402, 1534232351, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (22, 'hospital_details', '医院详情', 1, '', 1, '{\"1\":[\"3\",\"105\",\"106\",\"159\",\"104\",\"107\",\"147\",\"148\",\"154\",\"129\"],\"2\":[\"114\",\"9\",\"10\",\"11\",\"2\",\"5\",\"13\",\"12\",\"55\",\"54\",\"20\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1531463466, 1534755063, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (23, 'sixth_list', '招贤纳士', 1, '', 1, '{\"1\":[\"3\",\"118\",\"126\",\"119\",\"121\",\"145\",\"146\",\"54\"],\"2\":[\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"19\",\"20\",\"14\",\"17\",\"16\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1532329995, 1534322627, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (16, 'second_list', '亚信集团', 1, '', 1, '{\"1\":[\"3\",\"78\",\"79\",\"80\",\"81\"],\"2\":[\"9\",\"77\",\"10\",\"5\",\"76\",\"2\",\"11\",\"12\",\"54\",\"20\",\"55\",\"19\",\"13\",\"14\",\"17\",\"16\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1530523465, 1534231644, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (17, 'fourth_list', '产业资源', 1, '', 1, '{\"1\":[\"3\",\"86\",\"124\",\"87\",\"88\",\"89\"],\"2\":[\"54\",\"9\",\"10\",\"2\",\"11\",\"5\",\"12\",\"55\",\"13\",\"20\",\"19\",\"17\",\"14\",\"16\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1530608159, 1532501359, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (24, 'contact_us', '联系我们', 1, '', 1, '{\"1\":[\"3\",\"135\",\"144\",\"136\",\"137\",\"143\",\"138\",\"139\",\"140\",\"141\",\"142\"],\"2\":[\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"54\",\"20\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1533266997, 1533271758, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (25, 'propagandist_video', '宣传视频', 1, '', 1, '{\"1\":[\"3\",\"130\",\"131\",\"132\",\"134\",\"133\"],\"2\":[\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"20\",\"54\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1533267039, 1533268721, 1, 'MyISAM');
INSERT INTO `one_model` VALUES (27, 'recruit', '招聘信息', 1, '', 1, '{\"1\":[\"3\",\"156\",\"157\",\"158\"],\"2\":[\"9\",\"10\",\"11\",\"2\",\"5\",\"12\",\"13\",\"55\",\"54\",\"20\",\"19\",\"14\",\"16\",\"17\"]}', '1:基础;2:扩展', '', '', '', '', '', '', 10, '', '', 1534387808, 1534388859, 1, 'MyISAM');

-- ----------------------------
-- Table structure for one_picture
-- ----------------------------
DROP TABLE IF EXISTS `one_picture`;
CREATE TABLE `one_picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of one_picture
-- ----------------------------
INSERT INTO `one_picture` VALUES (1, '/Uploads/Picture/2018-06-28/5b34842d0db89.png', '', '5b1e305b2131f5e8bb2385ccfeb18bb1', '497fe26f960a15912ab07ab2e0de2636f2fc64ad', 1, 1530168364);
INSERT INTO `one_picture` VALUES (2, '/Uploads/Picture/2018-06-28/5b3484334b001.png', '', 'f0b3741eb737588a0dda12df8ab8b662', '3be3fd5981bea5e0da535f1bced8303e33df0dd7', 1, 1530168371);
INSERT INTO `one_picture` VALUES (3, '/Uploads/Picture/2018-06-28/5b34862b41f79.png', '', '61ebdb3d53cba0d87aae4751994f781e', 'df50dae4adae208690b87581be21c37f6fd954f4', 1, 1530168875);
INSERT INTO `one_picture` VALUES (4, '/Uploads/Picture/2018-07-06/5b3f2c6b635d9.jpg', '', '0584f9bb5a4e52866b0f939603ab5d04', '85fb25eec7333594f54443f450907a3a04d265cb', 1, 1530866795);
INSERT INTO `one_picture` VALUES (5, '/Uploads/Picture/2018-07-16/5b4c611cd5d19.gif', '', 'ea0824c3e91a596bbe738d59e07f14f3', '2480321cc231deb4d1377a60890dbe34103d1d5a', 1, 1531732252);
INSERT INTO `one_picture` VALUES (6, '/Uploads/Picture/2018-07-25/5b580f9d62a22.jpg', '', '0071c909b137effd710771a461c13625', '85984af08f46f2d473a29e6e0d4d1f37ec95baed', 1, 1532497821);
INSERT INTO `one_picture` VALUES (7, '/Uploads/Picture/2018-07-25/5b580fad3ad6a.jpg', '', '72b495c4ad9fb58eebaa674966a3da1f', '36d68da1fab48a220fe927061c9967c0364e97f9', 1, 1532497837);
INSERT INTO `one_picture` VALUES (8, '/Uploads/Picture/2018-07-25/5b580fb5cf46a.jpg', '', '8bc8c3cb292f1b3d1fe611df3d02150e', '58eefcda587461f621f6d887fc9209d2cbe7e942', 1, 1532497845);
INSERT INTO `one_picture` VALUES (9, '/Uploads/Picture/2018-07-25/5b580fbe0bf6a.jpg', '', '11aada72739e5bd477e81a90a70b70fd', '2291c6071330d4f970f2e34707f80bc33066d31c', 1, 1532497854);
INSERT INTO `one_picture` VALUES (10, '/Uploads/Picture/2018-07-25/5b580fcc07532.jpg', '', 'a182b95e900093dd4e43e209d348740e', '62f6cfa0a68accc79219ce084c601c2b68349721', 1, 1532497867);
INSERT INTO `one_picture` VALUES (11, '/Uploads/Picture/2018-07-25/5b580fdb4ca92.jpg', '', 'a34f7edf6392b22dba291a01f959a04a', '59b34e86e7103986fdd154a4fa049afc13d28d4b', 1, 1532497883);
INSERT INTO `one_picture` VALUES (12, '/Uploads/Picture/2018-07-25/5b580fe48dd8a.jpg', '', 'b1a1b8577c5fb5d4bc9b3131bcafa347', '6188ff39be0007444590689d9850855f542b69d0', 1, 1532497892);
INSERT INTO `one_picture` VALUES (13, '/Uploads/Picture/2018-07-25/5b580fee28c5a.jpg', '', '875b14af8c14f6c2f67432707420b2e7', 'a8007cd41ba4f437c75846b23b852b142559646c', 1, 1532497902);
INSERT INTO `one_picture` VALUES (14, '/Uploads/Picture/2018-07-25/5b581034a9ada.png', '', '5e8175f874424e5711a883caa703e8a8', '3070101262418b324d4e35ad29a1d6c242046a82', 1, 1532497972);
INSERT INTO `one_picture` VALUES (15, '/Uploads/Picture/2018-07-25/5b581045a5872.png', '', '5e09852ca5c77f363d825ede6e459a57', '88e4da76199193f7c6fa107338ee5ac235fd65c4', 1, 1532497989);
INSERT INTO `one_picture` VALUES (16, '/Uploads/Picture/2018-07-25/5b581059cb9d2.png', '', 'd02fb2563fdb8337931e971d81d5476a', 'cd1cb57333669bad71338220a80bc0e264671564', 1, 1532498009);
INSERT INTO `one_picture` VALUES (17, '/Uploads/Picture/2018-07-25/5b58106b96a2a.png', '', '6b5bb27247b27ee092f1dbf4b08b8e29', '4219f0dfb1afa3d644f9d71a3d37a8d408a3f35b', 1, 1532498027);
INSERT INTO `one_picture` VALUES (18, '/Uploads/Picture/2018-07-25/5b581094df252.png', '', '1ef780f8afc3e6c5083601b2863188a3', '0696eab68d3234d14efb2a50af5f5fe8f84e53ce', 1, 1532498068);
INSERT INTO `one_picture` VALUES (19, '/Uploads/Picture/2018-07-25/5b5810a191ff2.png', '', 'd6dbd403890759e9f31a1bd931989fa9', '5e79743871a65751cc0dad146b890af504b3ac06', 1, 1532498081);
INSERT INTO `one_picture` VALUES (20, '/Uploads/Picture/2018-07-25/5b5810af68012.png', '', '15c49423238c8a35b307ff81bd5959ca', '91dd70e551101222555dcbf0cc8b08e3f5b51b53', 1, 1532498095);
INSERT INTO `one_picture` VALUES (21, '/Uploads/Picture/2018-07-25/5b5810cc9fab2.jpg', '', '8654ab766846a2e13a4f2781b1e7f46f', '1be17a18b6c106434b934ec091b9832ccf901654', 1, 1532498124);
INSERT INTO `one_picture` VALUES (22, '/Uploads/Picture/2018-07-25/5b5815663400a.jpg', '', 'd0c16e383a80b4ccdc2a114afc325f7f', 'af74772d27386ddeb6e8b23d7da3342dd77e458f', 1, 1532499302);
INSERT INTO `one_picture` VALUES (23, '/Uploads/Picture/2018-08-02/5b62b7455c0a8.gif', '', '4d1a6bed7eab9b7640d6e95fc29b5479', '59dd038a0559a51e9003b61ebda0900a48dc7f57', 1, 1533196101);
INSERT INTO `one_picture` VALUES (24, '/Uploads/Picture/2018-08-09/5b6bfd4872038.jpg', '', '838d113b2ed73cf006993a6bb6a7447d', '7ff49cf9519931fe53eb3a1e275406733d976e47', 1, 1533803848);
INSERT INTO `one_picture` VALUES (25, '/Uploads/Picture/2018-08-09/5b6c021faaa78.jpg', '', 'e804cf0345c84043939879cc8ab39fc4', 'c450a67fafc711bfe0f9766f422ce322f499e6a8', 1, 1533805087);
INSERT INTO `one_picture` VALUES (26, '/Uploads/Picture/2018-08-09/5b6c072943df0.jpg', '', '83a015da5901715d869db5056af8dae9', 'ecb204f3ea0164ad102dfada281a37590c54dfa5', 1, 1533806377);
INSERT INTO `one_picture` VALUES (27, '/Uploads/Picture/2018-08-09/5b6c0a8304e20.jpg', '', '47a546098d2156ac1b686e300b8975bb', '7fa2090b7c1d64f0392174a3f675d619a2774425', 1, 1533807234);
INSERT INTO `one_picture` VALUES (28, '/Uploads/Picture/2018-08-09/5b6c0a9c53fc0.jpg', '', '9ee17a18a9ed6a956995e0d871a7bb5a', '809e16caaf8f24f31dca3960ac768a5a19886247', 1, 1533807260);
INSERT INTO `one_picture` VALUES (29, '/Uploads/Picture/2018-08-13/5b70f7bd75c60.jpg', '', 'f32d66beb2f4d00b455e97ce0e220270', '5b1f9b1c341c20f98857b201f6325aab4f6610bd', 1, 1534130109);
INSERT INTO `one_picture` VALUES (30, '/Uploads/Picture/2018-08-13/5b71079c24b80.png', '', '1d5cfedb4077b6d594b07a3410d5a4cd', 'ce350ca4f537e02cb59d54bc21c2fd91533f79ca', 1, 1534134172);
INSERT INTO `one_picture` VALUES (31, '/Uploads/Picture/2018-08-13/5b711cb41f590.jpg', '', '7219502b98f24fa05ef7ab687013486f', '66e4930a67a61d3f89083c3fdfe294574b31cf98', 1, 1534139572);
INSERT INTO `one_picture` VALUES (32, '/Uploads/Picture/2018-08-14/5b7260119fab0.jpg', '', '7bcd13c41c98ed5e2d94e7b26a81c026', 'eb33e9e84f4c182f6a7ef1ed819998d78275313e', 1, 1534222353);
INSERT INTO `one_picture` VALUES (33, '/Uploads/Picture/2018-08-15/5b73b2dde71a9.jpg', '', 'b93de1e7e2cbb26e242e67728473741d', '39a7b530dbd82e2f313d4ed057a68bc445fe4c3a', 1, 1534309085);
INSERT INTO `one_picture` VALUES (34, '/Uploads/Picture/2018-08-20/5b7a4587623e0.jpg', '', 'afa018f2cf05f6aa8b9010b269b88818', 'd29dcb0a0b8d85a93fedb373d0135da71b2f154f', 1, 1534739847);
INSERT INTO `one_picture` VALUES (35, '/Uploads/Picture/2018-08-20/5b7a7222da9a8.jpg', '', '5cb283a88c102af5bdc7bab0a5bc312e', '422f55d7d9120b345713bbde4031f5743f8576bf', 1, 1534751266);

-- ----------------------------
-- Table structure for one_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `one_ucenter_admin`;
CREATE TABLE `one_ucenter_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员用户ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for one_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `one_ucenter_app`;
CREATE TABLE `one_ucenter_app`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用URL',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '同步登陆',
  `allow_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '应用状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for one_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `one_ucenter_member`;
CREATE TABLE `one_ucenter_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '用户状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of one_ucenter_member
-- ----------------------------
INSERT INTO `one_ucenter_member` VALUES (1, 'admin', '1816e9b72e605d2fef63aaf7d490a580', '1037757846@qq.com', '', 1529992838, 2130706433, 1534815747, 2130706433, 1529992838, 1);

-- ----------------------------
-- Table structure for one_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `one_ucenter_setting`;
CREATE TABLE `one_ucenter_setting`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置类型（1-用户配置）',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for one_url
-- ----------------------------
DROP TABLE IF EXISTS `one_url`;
CREATE TABLE `one_url`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT 2 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_url`(`url`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '链接表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for one_userdata
-- ----------------------------
DROP TABLE IF EXISTS `one_userdata`;
CREATE TABLE `one_userdata`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '类型标识',
  `target_id` int(10) UNSIGNED NOT NULL COMMENT '目标id',
  UNIQUE INDEX `uid`(`uid`, `type`, `target_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
