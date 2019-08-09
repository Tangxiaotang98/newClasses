/*
 Navicat Premium Data Transfer

 Source Server         : tyy
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : db_day0729

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 09/08/2019 15:37:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_firstcategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_firstcategory`;
CREATE TABLE `tb_firstcategory`  (
  `first_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一级目录id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级目录名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级目录描述',
  PRIMARY KEY (`first_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_firstcategory
-- ----------------------------
INSERT INTO `tb_firstcategory` VALUES (1, 'web前端', 'web前端是前端显示的地方，非常值得学习');
INSERT INTO `tb_firstcategory` VALUES (2, 'java', 'jafaffsd');
INSERT INTO `tb_firstcategory` VALUES (6, '数据库相关', '数据库的急啊看附件');

-- ----------------------------
-- Table structure for tb_key
-- ----------------------------
DROP TABLE IF EXISTS `tb_key`;
CREATE TABLE `tb_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL COMMENT '次数，内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_key
-- ----------------------------
INSERT INTO `tb_key` VALUES (1, 'mysql', 83);
INSERT INTO `tb_key` VALUES (2, 'java', 23);
INSERT INTO `tb_key` VALUES (3, 'abc', 4);
INSERT INTO `tb_key` VALUES (4, '数据库', 4);
INSERT INTO `tb_key` VALUES (5, 'java从入门到精通', 6);
INSERT INTO `tb_key` VALUES (6, 'SSM框架整合', 1);
INSERT INTO `tb_key` VALUES (7, 'aafsdfdfd', 2);

-- ----------------------------
-- Table structure for tb_secondcategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_secondcategory`;
CREATE TABLE `tb_secondcategory`  (
  `second_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程所在地址，图片的imId,在aliyun上存储的id',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `teacher_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `course_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `first_id` int(11) NULL DEFAULT NULL COMMENT '所属二级课程id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段',
  PRIMARY KEY (`second_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_secondcategory
-- ----------------------------
INSERT INTO `tb_secondcategory` VALUES (1, 'java从入门到精通', 'EADFF86494A11444DC0298CEA5A70841', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1564990689641.jpg', '覃遵跃', 'java学习', 2, 1, 'java入门课程，让你们打好基础', '初级');
INSERT INTO `tb_secondcategory` VALUES (2, 'sqlsever', 'E8A50D71C0FB321F4E223C9E2B54AEAC', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565235906769.jpg', '小明', '数据库', 6, 1, '这是一门数据库入门课程', '初级');
INSERT INTO `tb_secondcategory` VALUES (5, 'mysql', 'E7486EC4AB7772E7D4D4779A8BDA95DA', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565235978771.jpg', '黄伟', '数据库相关', 6, 1, 'mysql入门教程，能够让你掌握数据库的基本知识', '初级');
INSERT INTO `tb_secondcategory` VALUES (8, 'javascript学习', '20AA61393AD71ECF87E18408FE4A9DBB', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565080238901.jpg', '刘洋', '前端学习课程', 1, 1, 'javascript学习教程，能够让你对Javascript有一个更深的了解', '初级');
INSERT INTO `tb_secondcategory` VALUES (11, 'SSM框架整合', '4FB08953DCE2649468FFF4C5C0673EB6', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565005578205.jpg', '小红', '框架知识整合', 2, 1, '框架知识整合项目，能够让你对Java后端框架有一个更深刻的理解', '中级');
INSERT INTO `tb_secondcategory` VALUES (12, 'oracle数据库开发', 'C956CB063A198E371CC0876448C211B5', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565236220688.jpg', '张三', '数据库', 6, 1, 'oracle学习，让你对oracle数据库有一个基本了解', '初级');
INSERT INTO `tb_secondcategory` VALUES (13, 'vue入门到精通', 'D7321B4090F6A521BF689C8A0062DD58', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565003777547.jpg', '小红', '前端', 1, 1, 'vue知识的学习，对前端框架有一个更深刻的理解', '中级');
INSERT INTO `tb_secondcategory` VALUES (14, 'bootstrap学习', 'F0F522B5B2479C7BD8751A8EB137EE71', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565236330717.jpg', '李四', '前端框架学习', 1, 1, 'bootstrap是一个响应式的前端框架，通过本课程能够对bootstrap知识有一个基本了解', '中级');

-- ----------------------------
-- Table structure for tb_thirddir
-- ----------------------------
DROP TABLE IF EXISTS `tb_thirddir`;
CREATE TABLE `tb_thirddir`  (
  `third_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二级目录id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `second_id` int(11) NOT NULL COMMENT '所属一级目录id',
  PRIMARY KEY (`third_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_thirddir
-- ----------------------------
INSERT INTO `tb_thirddir` VALUES (3, '第一章', '课程基本介绍', 1);
INSERT INTO `tb_thirddir` VALUES (4, '第二章', 'Java入门', 1);
INSERT INTO `tb_thirddir` VALUES (9, '第三章', 'Java核心', 1);
INSERT INTO `tb_thirddir` VALUES (10, '第四章', 'Java高级', 1);
INSERT INTO `tb_thirddir` VALUES (12, '第一章', '这是对本课程的基本总结，让你能够更好的了解本课程', 2);
INSERT INTO `tb_thirddir` VALUES (13, '第二章', 'sqlserver基本概念讲述', 2);
INSERT INTO `tb_thirddir` VALUES (14, '第一章', '课程基本介绍', 5);
INSERT INTO `tb_thirddir` VALUES (15, '第二章', 'mysql入门介绍', 5);
INSERT INTO `tb_thirddir` VALUES (16, '第一章', '课程基本介绍', 8);
INSERT INTO `tb_thirddir` VALUES (17, '第二章', 'javascript对象', 8);
INSERT INTO `tb_thirddir` VALUES (18, '第一章', '课程基本介绍', 11);
INSERT INTO `tb_thirddir` VALUES (19, '第二章', 'spring学习', 11);
INSERT INTO `tb_thirddir` VALUES (20, '第一章', '课程基本介绍', 12);
INSERT INTO `tb_thirddir` VALUES (21, '第二章', 'oracle数据库基本概念', 12);
INSERT INTO `tb_thirddir` VALUES (22, '第一章', '课程基本介绍', 13);
INSERT INTO `tb_thirddir` VALUES (23, '第二章', 'vue的核心', 13);
INSERT INTO `tb_thirddir` VALUES (24, '第一章', '课程基本介绍', 14);
INSERT INTO `tb_thirddir` VALUES (25, '第二章', 'bootstrap对象的学习', 14);
INSERT INTO `tb_thirddir` VALUES (26, '第三章', 'bootstrap的主要效果', 14);
INSERT INTO `tb_thirddir` VALUES (27, '第四章', 'bootstrap的主要内容', 14);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `privilege` int(32) NOT NULL COMMENT '权限(1表示用户，2表示管理员)',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '1476113568@qq.com', '123456', 2, '简简单单');
INSERT INTO `tb_user` VALUES (3, '158738745@qq.com', '123456', 1, '花格子彡');
INSERT INTO `tb_user` VALUES (6, '123456789@qq.com', '123456', 2, 'admin');
INSERT INTO `tb_user` VALUES (7, '15374437708@qq.com', '123456', 1, '热川cc');
INSERT INTO `tb_user` VALUES (8, '15274462489@qq.com', '123456', 2, 'dfafa');
INSERT INTO `tb_user` VALUES (9, '15673874597@qq.com', '123456', 1, '三只梓子');

-- ----------------------------
-- Table structure for tb_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_userinfo`;
CREATE TABLE `tb_userinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_userinfo
-- ----------------------------
INSERT INTO `tb_userinfo` VALUES (1, 3, '女', '湖南永州', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1564990827653.jpeg', '123456789900');
INSERT INTO `tb_userinfo` VALUES (2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `tb_userinfo` VALUES (3, 9, NULL, NULL, 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1564991338106.jpeg', NULL);
INSERT INTO `tb_userinfo` VALUES (4, 1, '女', '湖南永州', 'http://tangxiaotang.oss-cn-shanghai.aliyuncs.com/1565188246885.png', '');

-- ----------------------------
-- Table structure for tb_video
-- ----------------------------
DROP TABLE IF EXISTS `tb_video`;
CREATE TABLE `tb_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频所在地址',
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站上视频的id',
  `third_id` int(11) NOT NULL COMMENT '三级课程id',
  `video_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频描述',
  `video_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_video
-- ----------------------------
INSERT INTO `tb_video` VALUES (1, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/4d922fec-16c5044759c/4d922fec-16c5044759c.mp4?Expires=1564718374&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=WtfK5CHM6OMoYxqZaCVI8whYShE%3D', 'bcd2f5e642574a9ca3fc847dcd85d521', 1, '第一个视频', NULL);
INSERT INTO `tb_video` VALUES (2, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/31dc7031-16c50460486/31dc7031-16c50460486.mp4?Expires=1564718468&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=y2JeWzXMECp937B9qveqMc4pEjk%3D', '7f3e66c87bbf4779ab918c8bbec750c9', 2, 'adsfsf', NULL);
INSERT INTO `tb_video` VALUES (3, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/d5a5a4f-16c51a85e5f/d5a5a4f-16c51a85e5f.mp4?Expires=1565249175&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=iHrg2G6oTEZC78cCSCC8CRarIzg%3D', '3a913c3d581045c98125fb0233e54ad0', 3, '第一个视频', NULL);
INSERT INTO `tb_video` VALUES (4, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/e12f8d8-16c5782619c/e12f8d8-16c5782619c.mp4?Expires=1565146567&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=93zohSmwPcuMBScZQcXKiXmuogU%3D', '837698c81fbf426bbf2898cac5a6d753', 4, '学习视频', NULL);
INSERT INTO `tb_video` VALUES (5, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/43ddb6e-16c578d15b1/43ddb6e-16c578d15b1.mp4?Expires=1565146571&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=ZKnEfoR9v%2FQQQA1kynNMuvwJCoA%3D', '49dd5d4523ff4f5a9de00af117d10d95', 9, '另一个视频', NULL);
INSERT INTO `tb_video` VALUES (6, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/97b035b-16c6fd73f82/97b035b-16c6fd73f82.mp4?Expires=1565249179&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=52HXeEfAm9no9Z8Iq0tt0UAdbu0%3D', 'fe825aa27f534b738cef8e6996c18bc2', 10, '第四章视频描述', NULL);
INSERT INTO `tb_video` VALUES (7, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/41dc11bf-16c6fd94181/41dc11bf-16c6fd94181.mp4?Expires=1565249203&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=O7rorKW6tfwAXJtxfzb5L50%2BhME%3D', '38278236776f4746aab7601a3ba5d1db', 12, 'sqlserver第一章', NULL);
INSERT INTO `tb_video` VALUES (8, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/1f48551d-16c6fda3b3b/1f48551d-16c6fda3b3b.mp4?Expires=1565248284&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=1LHbOiNFc2qoq75WqUEenXilJg0%3D', '63e9eca9f358441ab80f0c85ed2c3873', 13, 'sqlserver第二章视频', NULL);
INSERT INTO `tb_video` VALUES (9, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/4876989d-16c6fdb7857/4876989d-16c6fdb7857.mp4?Expires=1565248363&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=jEbPai1PeNL9MFqmY%2FF0OpH7M38%3D', 'bb3059b3dc634c129be57b81d384c8de', 14, 'mysql第一章视频', NULL);
INSERT INTO `tb_video` VALUES (10, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/24931573-16c6fdc3c23/24931573-16c6fdc3c23.mp4?Expires=1565248412&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=EqIFmUcNacZbJVJd5rkgagnaOko%3D', 'ee4ae29f5e7e49d8bae7488381f9efac', 15, 'mysql第二章视频', NULL);
INSERT INTO `tb_video` VALUES (11, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/40e9c6f9-16c6fdddbd0/40e9c6f9-16c6fdddbd0.mp4?Expires=1565254558&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=f%2B3zUCCLoo%2Fs0bw6hq%2BF6mv32m4%3D', 'e97be6d99f7e4c1ebb72d8ce92d1e2a0', 16, 'javascript第一章视频上传', NULL);
INSERT INTO `tb_video` VALUES (12, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/2d7b6e7c-16c6fdeb865/2d7b6e7c-16c6fdeb865.mp4?Expires=1565249148&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=T3e9WKP9nJ6SBkdO8u435raeQDA%3D', 'f8ceca0e780945fa8fc0f022094f3e87', 17, 'javascript第二章视频', NULL);
INSERT INTO `tb_video` VALUES (13, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/b727179-16c6fe0128e/b727179-16c6fe0128e.mp4?Expires=1565248688&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=PmwQ6%2BqjCKIkabnwtrUWulvX5IM%3D', '51fc31939d934da8a43a7d771b903715', 18, 'SSM第一章视频', NULL);
INSERT INTO `tb_video` VALUES (14, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/521b1b29-16c6fe11a6c/521b1b29-16c6fe11a6c.mp4?Expires=1565248732&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=E6kXEPYT0T6LICHeSx%2BabSryiBU%3D', '54ae8aebf55440419c76bd2f14c9899a', 19, 'SSM框架第二章视频', NULL);
INSERT INTO `tb_video` VALUES (15, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/5515a476-16c6fe2526f/5515a476-16c6fe2526f.mp4?Expires=1565248829&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=g983kB%2FCj%2BhHNJbCbn68n1Tln1I%3D', '3dd8abeed8d14c6396e49ee4afe5b258', 20, 'oracle第一章视频', NULL);
INSERT INTO `tb_video` VALUES (16, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/4f71abd6-16c6fe3454a/4f71abd6-16c6fe3454a.mp4?Expires=1565248878&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=D8TKoo7dtNfasMFsP1%2F941bogG4%3D', '1c30d90152074e298ffe8abcef518783', 21, 'oracle第二章视频', NULL);
INSERT INTO `tb_video` VALUES (17, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/49212d9-16c6fe48f92/49212d9-16c6fe48f92.mp4?Expires=1565248961&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=I3jTTSW10jSbSzVHfGM5j5VFHV0%3D', 'db5a41fa51df4d7280e51f81f8aedaa6', 22, 'vue第一章视频视频', NULL);
INSERT INTO `tb_video` VALUES (18, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/5565b24b-16c6fe56f14/5565b24b-16c6fe56f14.mp4?Expires=1565249019&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=wmpSUYn%2FX3H5ggdXjrdIIbE3hkA%3D', '16b8b8c0ea5f4f08b948adb5474e88b9', 23, 'vue第二章视频', NULL);
INSERT INTO `tb_video` VALUES (19, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/45145d5f-16c6fe636e5/45145d5f-16c6fe636e5.mp4?Expires=1565249067&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=1EBjVKVOVaumfHLjjBS%2FPKvoWus%3D', 'b595be8945be4c929ccb745fbc8db9e5', 24, 'bootstrap第一章视频', NULL);
INSERT INTO `tb_video` VALUES (20, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/1d64c1fa-16c6fe6cc4f/1d64c1fa-16c6fe6cc4f.mp4?Expires=1565249105&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=U9iJDFyuLpD6zidpmieLMzxxQ6c%3D', '7b84e890868f4f3991274bcfc47f995a', 25, 'bootstrap第二章视频', NULL);
INSERT INTO `tb_video` VALUES (21, 'https://outin-ea2a90ebb29511e9acfb00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/405a3ad7-16c703b545a/405a3ad7-16c703b545a.mp4?Expires=1565254646&OSSAccessKeyId=LTAIrkwb21KyGjJl&Signature=l6xARfuyXGFUYzW%2Bc2Qg4zxMlro%3D', '6682305c7dfd413f8d54b8f1a6f2677e', 26, '第一个视频', NULL);

SET FOREIGN_KEY_CHECKS = 1;
