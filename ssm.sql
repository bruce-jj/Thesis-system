/*
 Navicat Premium Data Transfer

 Source Server         : test2
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 25/11/2019 15:49:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456');
INSERT INTO `admin` VALUES (5, 'qqq', '123456');
INSERT INTO `admin` VALUES (6, 'min', '123');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `p_id` double NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `fk`(`t_no`) USING BTREE,
  CONSTRAINT `fk` FOREIGN KEY (`t_no`) REFERENCES `teacher` (`t_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, '基于SSM的逃课管理系统', '针对于数学与计算机学院的师生逃课现象', '1');
INSERT INTO `paper` VALUES (2, '基于SQL注入式攻破教务系统的窗体程序', '如何通过简单SQL注入攻击攻破某高校教务管理系统', '2');
INSERT INTO `paper` VALUES (3, '学生管理系统', '对学生进行简单管理', '3');
INSERT INTO `paper` VALUES (4, '班级管理系统', '对班级进行简单录入与管理', '1');
INSERT INTO `paper` VALUES (5, '图书管理系统', '图书管理系统', '1');
INSERT INTO `paper` VALUES (6, '创新团队管理系统	', '创新团队管理系统	', '1');
INSERT INTO `paper` VALUES (7, '土木工程师应具备的知识结构与素质	', '土木工程师应具备的知识结构与素质	', '2');
INSERT INTO `paper` VALUES (8, '土木工程中锚杆支护机理研究现状与展望	', '土木工程中锚杆支护机理研究现状与展望	', '2');
INSERT INTO `paper` VALUES (9, '土木施工中大体积混凝土裂缝成因	', '土木施工中大体积混凝土裂缝成因	', '2');
INSERT INTO `paper` VALUES (10, '建设工程质量检测行业现状及发展对策', '建设工程质量检测行业现状及发展对策', '3');
INSERT INTO `paper` VALUES (11, '浅谈建筑工程的建筑面积', '浅谈建筑工程的建筑面积', '3');
INSERT INTO `paper` VALUES (12, '工程监理与工程项目管理关系的研究', '工程监理与工程项目管理关系的研究', '3');
INSERT INTO `paper` VALUES (13, '试论房屋建筑工程施工的质量管理控制措施', '试论房屋建筑工程施工的质量管理控制措施', '2');
INSERT INTO `paper` VALUES (14, '探究电力调度自动化系统应用现状与发展趋势', '探究电力调度自动化系统应用现状与发展趋势', '1');
INSERT INTO `paper` VALUES (15, '建筑电气安装工程中常见问题的思考', '建筑电气安装工程中常见问题的思考', '2');
INSERT INTO `paper` VALUES (16, '浅谈住宅楼电气设计', '浅谈住宅楼电气设计', '3');
INSERT INTO `paper` VALUES (17, '浅谈高层建筑的电气设计与节能', '浅谈高层建筑的电气设计与节能', '2');
INSERT INTO `paper` VALUES (18, '漫谈在工程管理中如何控制工程造价', '漫谈在工程管理中如何控制工程造价', '1');
INSERT INTO `paper` VALUES (19, '浅谈建筑工程项目前期的成本控制', '浅谈建筑工程项目前期的成本控制', '2');
INSERT INTO `paper` VALUES (20, '论建设工程合同的无效的认定', '论建设工程合同的无效的认定', '2');
INSERT INTO `paper` VALUES (21, '论如何更好地逃课', '论如何更好地逃课', '3');
INSERT INTO `paper` VALUES (36, '如何像马老师一样成功', '浅谈如何比码云老师更有钱', '4');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_title` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`t_no`) USING BTREE,
  INDEX `t_name`(`t_name`) USING BTREE,
  INDEX `t_no`(`t_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '卢老爷', '研究生', 'zhangsan', '123456');
INSERT INTO `teacher` VALUES ('2', '麻花疼', '博士后', 'lisi', '123456');
INSERT INTO `teacher` VALUES ('3', '汪思聪', '博士', 'wangwu', '555555');
INSERT INTO `teacher` VALUES ('4', '码先生', '研究生', 'jack', 'jack');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'vincent', '123456', '370216714@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
