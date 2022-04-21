/*
 Navicat Premium Data Transfer

 Source Server         : ctf
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : bishe

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 21/04/2022 16:13:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_admin_log`;
CREATE TABLE `admin_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `uid` int NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `success` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_admin_log
-- ----------------------------
INSERT INTO `admin_admin_log` VALUES (1485, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:22', 1);
INSERT INTO `admin_admin_log` VALUES (1486, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:34', 1);
INSERT INTO `admin_admin_log` VALUES (1487, 'GET', 1, '/admin/user/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:35', 1);
INSERT INTO `admin_admin_log` VALUES (1488, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:35', 1);
INSERT INTO `admin_admin_log` VALUES (1489, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:36', 1);
INSERT INTO `admin_admin_log` VALUES (1490, 'GET', 1, '/admin/role/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:36', 1);
INSERT INTO `admin_admin_log` VALUES (1491, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:37', 1);
INSERT INTO `admin_admin_log` VALUES (1492, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:38', 1);
INSERT INTO `admin_admin_log` VALUES (1493, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:44', 1);
INSERT INTO `admin_admin_log` VALUES (1494, 'GET', 1, '/admin/dict/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:45', 1);
INSERT INTO `admin_admin_log` VALUES (1495, 'GET', 1, '/admin/dict/dictType/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:45', 1);
INSERT INTO `admin_admin_log` VALUES (1496, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:46', 1);
INSERT INTO `admin_admin_log` VALUES (1497, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:22:47', 1);
INSERT INTO `admin_admin_log` VALUES (1498, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:23:08', 1);
INSERT INTO `admin_admin_log` VALUES (1499, 'GET', 1, '/admin/file/table', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-12 19:23:08', 1);
INSERT INTO `admin_admin_log` VALUES (1500, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:01', 1);
INSERT INTO `admin_admin_log` VALUES (1501, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:05', 1);
INSERT INTO `admin_admin_log` VALUES (1502, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:06', 1);
INSERT INTO `admin_admin_log` VALUES (1503, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:08', 1);
INSERT INTO `admin_admin_log` VALUES (1504, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:08', 1);
INSERT INTO `admin_admin_log` VALUES (1505, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:09', 1);
INSERT INTO `admin_admin_log` VALUES (1506, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:34:10', 1);
INSERT INTO `admin_admin_log` VALUES (1507, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:15', 1);
INSERT INTO `admin_admin_log` VALUES (1508, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:17', 1);
INSERT INTO `admin_admin_log` VALUES (1509, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:18', 1);
INSERT INTO `admin_admin_log` VALUES (1510, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:18', 1);
INSERT INTO `admin_admin_log` VALUES (1511, 'GET', 1, '/admin/role/power/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:20', 1);
INSERT INTO `admin_admin_log` VALUES (1512, 'GET', 1, '/admin/role/getRolePower/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:21', 1);
INSERT INTO `admin_admin_log` VALUES (1513, 'PUT', 1, '/admin/role/saveRolePower', '{&#39;roleId&#39;: &#39;1&#39;, &#39;powerIds&#39;: &#39;1,3,22,23,24,4,21,25,26,9,27,28,29,30,12,13,44,45,46,47,48,49,50,51,17,18,31,32,52,53,54,55,56,57&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:23', 1);
INSERT INTO `admin_admin_log` VALUES (1514, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:30', 1);
INSERT INTO `admin_admin_log` VALUES (1515, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:30', 1);
INSERT INTO `admin_admin_log` VALUES (1516, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:31', 1);
INSERT INTO `admin_admin_log` VALUES (1517, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:31', 1);
INSERT INTO `admin_admin_log` VALUES (1518, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:33', 1);
INSERT INTO `admin_admin_log` VALUES (1519, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:34', 1);
INSERT INTO `admin_admin_log` VALUES (1520, 'GET', 1, '/admin/role/power/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:36', 1);
INSERT INTO `admin_admin_log` VALUES (1521, 'GET', 1, '/admin/role/getRolePower/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:36', 1);
INSERT INTO `admin_admin_log` VALUES (1522, 'GET', 1, '/admin/power/edit/57', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:42', 1);
INSERT INTO `admin_admin_log` VALUES (1523, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:35:42', 1);
INSERT INTO `admin_admin_log` VALUES (1524, 'PUT', 1, '/admin/power/update', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:39', 1);
INSERT INTO `admin_admin_log` VALUES (1525, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:41', 1);
INSERT INTO `admin_admin_log` VALUES (1526, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:43', 1);
INSERT INTO `admin_admin_log` VALUES (1527, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:43', 1);
INSERT INTO `admin_admin_log` VALUES (1528, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:44', 1);
INSERT INTO `admin_admin_log` VALUES (1529, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:44', 1);
INSERT INTO `admin_admin_log` VALUES (1530, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:47', 1);
INSERT INTO `admin_admin_log` VALUES (1531, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:36:48', 1);
INSERT INTO `admin_admin_log` VALUES (1532, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:24', 1);
INSERT INTO `admin_admin_log` VALUES (1533, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:26', 1);
INSERT INTO `admin_admin_log` VALUES (1534, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:26', 1);
INSERT INTO `admin_admin_log` VALUES (1535, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:27', 1);
INSERT INTO `admin_admin_log` VALUES (1536, 'GET', 1, '/admin/role/power/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:38', 1);
INSERT INTO `admin_admin_log` VALUES (1537, 'GET', 1, '/admin/role/getRolePower/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:39', 1);
INSERT INTO `admin_admin_log` VALUES (1538, 'PUT', 1, '/admin/role/saveRolePower', '{&#39;roleId&#39;: &#39;1&#39;, &#39;powerIds&#39;: &#39;1,3,22,23,24,4,21,25,26,9,27,28,29,30,12,13,44,45,46,47,48,49,50,51,17,18,31,32,52,53,54,55,56,57,58&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:42', 1);
INSERT INTO `admin_admin_log` VALUES (1539, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:48', 1);
INSERT INTO `admin_admin_log` VALUES (1540, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:48', 1);
INSERT INTO `admin_admin_log` VALUES (1541, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:49', 1);
INSERT INTO `admin_admin_log` VALUES (1542, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:37:49', 1);
INSERT INTO `admin_admin_log` VALUES (1543, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:42:32', 1);
INSERT INTO `admin_admin_log` VALUES (1544, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:42:32', 1);
INSERT INTO `admin_admin_log` VALUES (1545, 'GET', 1, '/admin/role/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:42:34', 1);
INSERT INTO `admin_admin_log` VALUES (1546, 'GET', 1, '/admin/role/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:42:34', 1);
INSERT INTO `admin_admin_log` VALUES (1547, 'GET', 1, '/admin/role/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:42:38', 1);
INSERT INTO `admin_admin_log` VALUES (1548, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:46:01', 1);
INSERT INTO `admin_admin_log` VALUES (1549, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:46:01', 1);
INSERT INTO `admin_admin_log` VALUES (1550, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 14:46:02', 1);
INSERT INTO `admin_admin_log` VALUES (1551, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:16:50', 1);
INSERT INTO `admin_admin_log` VALUES (1552, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:16:50', 1);
INSERT INTO `admin_admin_log` VALUES (1553, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:16:52', 1);
INSERT INTO `admin_admin_log` VALUES (1554, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:17:26', 1);
INSERT INTO `admin_admin_log` VALUES (1555, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:17:26', 1);
INSERT INTO `admin_admin_log` VALUES (1556, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:17:27', 1);
INSERT INTO `admin_admin_log` VALUES (1557, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:17:27', 1);
INSERT INTO `admin_admin_log` VALUES (1558, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:42:19', 1);
INSERT INTO `admin_admin_log` VALUES (1559, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:42:19', 1);
INSERT INTO `admin_admin_log` VALUES (1560, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 15:42:20', 1);
INSERT INTO `admin_admin_log` VALUES (1561, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 16:10:24', 1);
INSERT INTO `admin_admin_log` VALUES (1562, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:41:51', 1);
INSERT INTO `admin_admin_log` VALUES (1563, 'GET', 1, '/admin/file/table', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:41:51', 1);
INSERT INTO `admin_admin_log` VALUES (1564, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:29', 1);
INSERT INTO `admin_admin_log` VALUES (1565, 'GET', 1, '/admin/user/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:30', 1);
INSERT INTO `admin_admin_log` VALUES (1566, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:30', 1);
INSERT INTO `admin_admin_log` VALUES (1567, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:32', 1);
INSERT INTO `admin_admin_log` VALUES (1568, 'GET', 1, '/admin/user/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:32', 1);
INSERT INTO `admin_admin_log` VALUES (1569, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-13 21:55:32', 1);
INSERT INTO `admin_admin_log` VALUES (1570, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:32:12', 1);
INSERT INTO `admin_admin_log` VALUES (1571, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:32:36', 1);
INSERT INTO `admin_admin_log` VALUES (1572, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:32:36', 1);
INSERT INTO `admin_admin_log` VALUES (1573, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:32:37', 1);
INSERT INTO `admin_admin_log` VALUES (1574, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:32:38', 1);
INSERT INTO `admin_admin_log` VALUES (1575, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:22', 1);
INSERT INTO `admin_admin_log` VALUES (1576, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:23', 1);
INSERT INTO `admin_admin_log` VALUES (1577, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:24', 1);
INSERT INTO `admin_admin_log` VALUES (1578, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:25', 1);
INSERT INTO `admin_admin_log` VALUES (1579, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:27', 1);
INSERT INTO `admin_admin_log` VALUES (1580, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:33:27', 1);
INSERT INTO `admin_admin_log` VALUES (1581, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:35:15', 1);
INSERT INTO `admin_admin_log` VALUES (1582, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:35:17', 1);
INSERT INTO `admin_admin_log` VALUES (1583, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:09', 1);
INSERT INTO `admin_admin_log` VALUES (1584, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:11', 1);
INSERT INTO `admin_admin_log` VALUES (1585, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:20', 1);
INSERT INTO `admin_admin_log` VALUES (1586, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:20', 1);
INSERT INTO `admin_admin_log` VALUES (1587, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:23', 1);
INSERT INTO `admin_admin_log` VALUES (1588, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:23', 1);
INSERT INTO `admin_admin_log` VALUES (1589, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:27', 1);
INSERT INTO `admin_admin_log` VALUES (1590, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:28', 1);
INSERT INTO `admin_admin_log` VALUES (1591, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:29', 1);
INSERT INTO `admin_admin_log` VALUES (1592, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:30', 1);
INSERT INTO `admin_admin_log` VALUES (1593, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:36:30', 1);
INSERT INTO `admin_admin_log` VALUES (1594, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:27', 1);
INSERT INTO `admin_admin_log` VALUES (1595, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:29', 1);
INSERT INTO `admin_admin_log` VALUES (1596, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:30', 1);
INSERT INTO `admin_admin_log` VALUES (1597, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;70&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:39', 1);
INSERT INTO `admin_admin_log` VALUES (1598, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;20&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:40', 1);
INSERT INTO `admin_admin_log` VALUES (1599, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:41', 1);
INSERT INTO `admin_admin_log` VALUES (1600, 'GET', 1, '/admin/role/power/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:46', 1);
INSERT INTO `admin_admin_log` VALUES (1601, 'GET', 1, '/admin/role/getRolePower/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:47', 1);
INSERT INTO `admin_admin_log` VALUES (1602, 'PUT', 1, '/admin/role/saveRolePower', '{&#39;powerIds&#39;: &#39;1,3,22,23,24,4,21,25,26,9,27,28,29,30,12,13,44,45,46,47,48,49,50,51,17,18,31,32,52,53,54,55,56,57,58,59,60&#39;, &#39;roleId&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:51', 1);
INSERT INTO `admin_admin_log` VALUES (1603, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:54', 1);
INSERT INTO `admin_admin_log` VALUES (1604, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:54', 1);
INSERT INTO `admin_admin_log` VALUES (1605, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:54', 1);
INSERT INTO `admin_admin_log` VALUES (1606, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:54', 1);
INSERT INTO `admin_admin_log` VALUES (1607, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:54', 1);
INSERT INTO `admin_admin_log` VALUES (1608, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:56', 1);
INSERT INTO `admin_admin_log` VALUES (1609, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:37:56', 1);
INSERT INTO `admin_admin_log` VALUES (1610, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:04', 1);
INSERT INTO `admin_admin_log` VALUES (1611, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:04', 1);
INSERT INTO `admin_admin_log` VALUES (1612, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:04', 1);
INSERT INTO `admin_admin_log` VALUES (1613, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:04', 1);
INSERT INTO `admin_admin_log` VALUES (1614, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:04', 1);
INSERT INTO `admin_admin_log` VALUES (1615, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:06', 1);
INSERT INTO `admin_admin_log` VALUES (1616, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:06', 1);
INSERT INTO `admin_admin_log` VALUES (1617, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:46:06', 1);
INSERT INTO `admin_admin_log` VALUES (1618, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:54', 1);
INSERT INTO `admin_admin_log` VALUES (1619, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:54', 1);
INSERT INTO `admin_admin_log` VALUES (1620, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:54', 1);
INSERT INTO `admin_admin_log` VALUES (1621, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:54', 1);
INSERT INTO `admin_admin_log` VALUES (1622, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:54', 1);
INSERT INTO `admin_admin_log` VALUES (1623, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:56', 1);
INSERT INTO `admin_admin_log` VALUES (1624, 'GET', 1, '/admin/role/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:56', 1);
INSERT INTO `admin_admin_log` VALUES (1625, 'GET', 1, '/admin/user/data', '{&#39;page&#39;: &#39;1&#39;, &#39;limit&#39;: &#39;10&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:56', 1);
INSERT INTO `admin_admin_log` VALUES (1626, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:47:56', 1);
INSERT INTO `admin_admin_log` VALUES (1627, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:08', 1);
INSERT INTO `admin_admin_log` VALUES (1628, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:08', 1);
INSERT INTO `admin_admin_log` VALUES (1629, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:08', 1);
INSERT INTO `admin_admin_log` VALUES (1630, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:08', 1);
INSERT INTO `admin_admin_log` VALUES (1631, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:08', 1);
INSERT INTO `admin_admin_log` VALUES (1632, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:12', 1);
INSERT INTO `admin_admin_log` VALUES (1633, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:12', 1);
INSERT INTO `admin_admin_log` VALUES (1634, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:19', 1);
INSERT INTO `admin_admin_log` VALUES (1635, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:19', 1);
INSERT INTO `admin_admin_log` VALUES (1636, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:19', 1);
INSERT INTO `admin_admin_log` VALUES (1637, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:19', 1);
INSERT INTO `admin_admin_log` VALUES (1638, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:19', 1);
INSERT INTO `admin_admin_log` VALUES (1639, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:23', 1);
INSERT INTO `admin_admin_log` VALUES (1640, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:24', 1);
INSERT INTO `admin_admin_log` VALUES (1641, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:51:24', 1);
INSERT INTO `admin_admin_log` VALUES (1642, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:04', 1);
INSERT INTO `admin_admin_log` VALUES (1643, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:04', 1);
INSERT INTO `admin_admin_log` VALUES (1644, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:04', 1);
INSERT INTO `admin_admin_log` VALUES (1645, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:04', 1);
INSERT INTO `admin_admin_log` VALUES (1646, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:05', 1);
INSERT INTO `admin_admin_log` VALUES (1647, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:09', 1);
INSERT INTO `admin_admin_log` VALUES (1648, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:09', 1);
INSERT INTO `admin_admin_log` VALUES (1649, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:09', 1);
INSERT INTO `admin_admin_log` VALUES (1650, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:09', 1);
INSERT INTO `admin_admin_log` VALUES (1651, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:54:09', 1);
INSERT INTO `admin_admin_log` VALUES (1652, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:06', 1);
INSERT INTO `admin_admin_log` VALUES (1653, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:06', 1);
INSERT INTO `admin_admin_log` VALUES (1654, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:06', 1);
INSERT INTO `admin_admin_log` VALUES (1655, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:06', 1);
INSERT INTO `admin_admin_log` VALUES (1656, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:06', 1);
INSERT INTO `admin_admin_log` VALUES (1657, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:10', 1);
INSERT INTO `admin_admin_log` VALUES (1658, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:10', 1);
INSERT INTO `admin_admin_log` VALUES (1659, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:10', 1);
INSERT INTO `admin_admin_log` VALUES (1660, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 00:55:10', 1);
INSERT INTO `admin_admin_log` VALUES (1661, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:04', 1);
INSERT INTO `admin_admin_log` VALUES (1662, 'GET', 1, '/admin/file/table', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:04', 1);
INSERT INTO `admin_admin_log` VALUES (1663, 'GET', 1, '/admin/dict/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:07', 1);
INSERT INTO `admin_admin_log` VALUES (1664, 'GET', 1, '/admin/dict/dictType/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:08', 1);
INSERT INTO `admin_admin_log` VALUES (1665, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1666, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1667, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1668, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1669, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1670, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1671, 'GET', 1, '/admin/dict/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:41', 1);
INSERT INTO `admin_admin_log` VALUES (1672, 'GET', 1, '/admin/file/table', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:43', 1);
INSERT INTO `admin_admin_log` VALUES (1673, 'GET', 1, '/admin/dict/dictType/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:44', 1);
INSERT INTO `admin_admin_log` VALUES (1674, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:44', 1);
INSERT INTO `admin_admin_log` VALUES (1675, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:44', 1);
INSERT INTO `admin_admin_log` VALUES (1676, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 01:15:44', 1);
INSERT INTO `admin_admin_log` VALUES (1677, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 08:40:01', 1);
INSERT INTO `admin_admin_log` VALUES (1678, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:28:09', 1);
INSERT INTO `admin_admin_log` VALUES (1679, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:28:10', 1);
INSERT INTO `admin_admin_log` VALUES (1680, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:28:10', 1);
INSERT INTO `admin_admin_log` VALUES (1681, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:28:58', 1);
INSERT INTO `admin_admin_log` VALUES (1682, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:28:59', 1);
INSERT INTO `admin_admin_log` VALUES (1683, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:29:01', 1);
INSERT INTO `admin_admin_log` VALUES (1684, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 14:29:02', 1);
INSERT INTO `admin_admin_log` VALUES (1685, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 17:01:22', 1);
INSERT INTO `admin_admin_log` VALUES (1686, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:39', 1);
INSERT INTO `admin_admin_log` VALUES (1687, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:39', 1);
INSERT INTO `admin_admin_log` VALUES (1688, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:39', 1);
INSERT INTO `admin_admin_log` VALUES (1689, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:40', 1);
INSERT INTO `admin_admin_log` VALUES (1690, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:40', 1);
INSERT INTO `admin_admin_log` VALUES (1691, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:41', 1);
INSERT INTO `admin_admin_log` VALUES (1692, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:12:42', 1);
INSERT INTO `admin_admin_log` VALUES (1693, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:36', 1);
INSERT INTO `admin_admin_log` VALUES (1694, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:37', 1);
INSERT INTO `admin_admin_log` VALUES (1695, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:38', 1);
INSERT INTO `admin_admin_log` VALUES (1696, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:38', 1);
INSERT INTO `admin_admin_log` VALUES (1697, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:46', 1);
INSERT INTO `admin_admin_log` VALUES (1698, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:46', 1);
INSERT INTO `admin_admin_log` VALUES (1699, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:48', 1);
INSERT INTO `admin_admin_log` VALUES (1700, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:49', 1);
INSERT INTO `admin_admin_log` VALUES (1701, 'GET', 1, '/dept/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:50', 1);
INSERT INTO `admin_admin_log` VALUES (1702, 'POST', 1, '/dept/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:51', 1);
INSERT INTO `admin_admin_log` VALUES (1703, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:54', 1);
INSERT INTO `admin_admin_log` VALUES (1704, 'GET', 1, '/admin/dict/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:55', 1);
INSERT INTO `admin_admin_log` VALUES (1705, 'GET', 1, '/admin/dict/dictType/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 18:13:56', 1);
INSERT INTO `admin_admin_log` VALUES (1706, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:25:55', 1);
INSERT INTO `admin_admin_log` VALUES (1707, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:25:56', 1);
INSERT INTO `admin_admin_log` VALUES (1708, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:25:57', 1);
INSERT INTO `admin_admin_log` VALUES (1709, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:25:57', 1);
INSERT INTO `admin_admin_log` VALUES (1710, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:27:33', 1);
INSERT INTO `admin_admin_log` VALUES (1711, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:27:33', 1);
INSERT INTO `admin_admin_log` VALUES (1712, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:27:34', 1);
INSERT INTO `admin_admin_log` VALUES (1713, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:27:35', 1);
INSERT INTO `admin_admin_log` VALUES (1714, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:28:50', 1);
INSERT INTO `admin_admin_log` VALUES (1715, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:28:53', 1);
INSERT INTO `admin_admin_log` VALUES (1716, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:29:39', 1);
INSERT INTO `admin_admin_log` VALUES (1717, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:29:40', 1);
INSERT INTO `admin_admin_log` VALUES (1718, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:29:42', 1);
INSERT INTO `admin_admin_log` VALUES (1719, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:29:43', 1);
INSERT INTO `admin_admin_log` VALUES (1720, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:30:48', 1);
INSERT INTO `admin_admin_log` VALUES (1721, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:30:54', 1);
INSERT INTO `admin_admin_log` VALUES (1722, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:30:57', 1);
INSERT INTO `admin_admin_log` VALUES (1723, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:30:59', 1);
INSERT INTO `admin_admin_log` VALUES (1724, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:30:59', 1);
INSERT INTO `admin_admin_log` VALUES (1725, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:00', 1);
INSERT INTO `admin_admin_log` VALUES (1726, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:02', 1);
INSERT INTO `admin_admin_log` VALUES (1727, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:03', 1);
INSERT INTO `admin_admin_log` VALUES (1728, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:39', 1);
INSERT INTO `admin_admin_log` VALUES (1729, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:41', 1);
INSERT INTO `admin_admin_log` VALUES (1730, 'GET', 1, '/admin/power/add', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:51', 1);
INSERT INTO `admin_admin_log` VALUES (1731, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:31:51', 1);
INSERT INTO `admin_admin_log` VALUES (1732, 'POST', 1, '/admin/power/save', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:02', 1);
INSERT INTO `admin_admin_log` VALUES (1733, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:04', 1);
INSERT INTO `admin_admin_log` VALUES (1734, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:05', 1);
INSERT INTO `admin_admin_log` VALUES (1735, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:06', 1);
INSERT INTO `admin_admin_log` VALUES (1736, 'GET', 1, '/admin/power/edit/64', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:09', 1);
INSERT INTO `admin_admin_log` VALUES (1737, 'GET', 1, '/admin/power/selectParent', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:10', 1);
INSERT INTO `admin_admin_log` VALUES (1738, 'PUT', 1, '/admin/power/update', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:16', 1);
INSERT INTO `admin_admin_log` VALUES (1739, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:18', 1);
INSERT INTO `admin_admin_log` VALUES (1740, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:19', 1);
INSERT INTO `admin_admin_log` VALUES (1741, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:19', 1);
INSERT INTO `admin_admin_log` VALUES (1742, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:28', 1);
INSERT INTO `admin_admin_log` VALUES (1743, 'GET', 1, '/admin/file/table', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:29', 1);
INSERT INTO `admin_admin_log` VALUES (1744, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:30', 1);
INSERT INTO `admin_admin_log` VALUES (1745, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:31', 1);
INSERT INTO `admin_admin_log` VALUES (1746, 'GET', 1, '/admin/role/power/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:39', 1);
INSERT INTO `admin_admin_log` VALUES (1747, 'GET', 1, '/admin/role/getRolePower/1', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:40', 1);
INSERT INTO `admin_admin_log` VALUES (1748, 'PUT', 1, '/admin/role/saveRolePower', '{&#39;roleId&#39;: &#39;1&#39;, &#39;powerIds&#39;: &#39;1,3,22,23,24,4,21,25,26,9,27,28,29,30,12,13,44,45,46,47,48,49,50,51,17,18,31,32,52,53,54,55,56,57,58,59,60,61,62,63,64&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:45', 1);
INSERT INTO `admin_admin_log` VALUES (1749, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:51', 1);
INSERT INTO `admin_admin_log` VALUES (1750, 'GET', 1, '/admin/file/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:51', 1);
INSERT INTO `admin_admin_log` VALUES (1751, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:51', 1);
INSERT INTO `admin_admin_log` VALUES (1752, 'GET', 1, '/admin/file/table', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:52', 1);
INSERT INTO `admin_admin_log` VALUES (1753, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:52', 1);
INSERT INTO `admin_admin_log` VALUES (1754, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:54', 1);
INSERT INTO `admin_admin_log` VALUES (1755, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39', '2022-04-14 19:32:54', 1);
INSERT INTO `admin_admin_log` VALUES (1756, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 13:41:38', 1);
INSERT INTO `admin_admin_log` VALUES (1757, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:21', 1);
INSERT INTO `admin_admin_log` VALUES (1758, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:21', 1);
INSERT INTO `admin_admin_log` VALUES (1759, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:21', 1);
INSERT INTO `admin_admin_log` VALUES (1760, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:25', 1);
INSERT INTO `admin_admin_log` VALUES (1761, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:26', 1);
INSERT INTO `admin_admin_log` VALUES (1762, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:27', 1);
INSERT INTO `admin_admin_log` VALUES (1763, 'POST', 1, '/admin/power/data', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:27', 1);
INSERT INTO `admin_admin_log` VALUES (1764, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 16:29:29', 1);
INSERT INTO `admin_admin_log` VALUES (1765, 'GET', 1, '/admin/user/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:23', 1);
INSERT INTO `admin_admin_log` VALUES (1766, 'GET', 1, '/admin/power/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:23', 1);
INSERT INTO `admin_admin_log` VALUES (1767, 'GET', 1, '/admin/role/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:23', 1);
INSERT INTO `admin_admin_log` VALUES (1768, 'GET', 1, '/admin/monitor/', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:23', 1);
INSERT INTO `admin_admin_log` VALUES (1769, 'GET', 1, '/admin/role/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:25', 1);
INSERT INTO `admin_admin_log` VALUES (1770, 'GET', 1, '/admin/user/data', '{&#39;limit&#39;: &#39;10&#39;, &#39;page&#39;: &#39;1&#39;}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:25', 1);
INSERT INTO `admin_admin_log` VALUES (1771, 'GET', 1, '/dept/tree', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 17:12:25', 1);
INSERT INTO `admin_admin_log` VALUES (1772, 'POST', 1, '/passport/login', 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-21 14:54:08', 1);

-- ----------------------------
-- Table structure for admin_dept
-- ----------------------------
DROP TABLE IF EXISTS `admin_dept`;
CREATE TABLE `admin_dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` int NULL DEFAULT NULL COMMENT '父级编号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int NULL DEFAULT NULL COMMENT '状态(1开启,0关闭)',
  `remark` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '备注',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_dept
-- ----------------------------
INSERT INTO `admin_dept` VALUES (1, 0, '总公司', 1, '就眠仪式', '12312345679', '123qq.com', 1, NULL, '这是总公司', NULL, '2021-06-01 17:23:20');
INSERT INTO `admin_dept` VALUES (4, 1, '济南分公司', 2, '就眠仪式', '12312345678', '1234qq.com', 1, NULL, '这是济南', '2021-06-01 17:24:33', '2021-06-01 17:25:19');
INSERT INTO `admin_dept` VALUES (5, 1, '唐山分公司', 4, 'mkg', '12312345678', '123@qq.com', 1, NULL, '这是唐山', '2021-06-01 17:25:15', '2021-06-01 17:25:20');
INSERT INTO `admin_dept` VALUES (7, 4, '济南分公司开发部', 5, '就眠仪式', '12312345678', '123@qq.com', 1, NULL, '测试', '2021-06-01 17:27:39', '2021-06-01 17:27:39');
INSERT INTO `admin_dept` VALUES (8, 5, '唐山测试部', 6, 'mkg', '12312345678', '123@qq.com', 1, NULL, '测试部', '2021-06-01 17:28:27', '2021-06-01 17:28:27');

-- ----------------------------
-- Table structure for admin_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `admin_dict_data`;
CREATE TABLE `admin_dict_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型名称',
  `data_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型标识',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型描述',
  `is_default` int NULL DEFAULT NULL COMMENT '是否默认',
  `enable` int NULL DEFAULT NULL COMMENT '是否开启',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_dict_data
-- ----------------------------
INSERT INTO `admin_dict_data` VALUES (8, '男', 'boy', 'user_sex', NULL, 1, '男 : body', '2021-04-16 13:36:34', '2021-04-16 14:05:06');
INSERT INTO `admin_dict_data` VALUES (9, '女', 'girl', 'user_sex', NULL, 1, '女 : girl', '2021-04-16 13:36:55', '2021-04-16 13:36:55');

-- ----------------------------
-- Table structure for admin_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `admin_dict_type`;
CREATE TABLE `admin_dict_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型名称',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型标识',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典类型描述',
  `enable` int NULL DEFAULT NULL COMMENT '是否开启',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_dict_type
-- ----------------------------
INSERT INTO `admin_dict_type` VALUES (1, '用户性别', 'user_sex', '用户性别', 1, NULL, '2021-04-16 13:37:11');

-- ----------------------------
-- Table structure for admin_photo
-- ----------------------------
DROP TABLE IF EXISTS `admin_photo`;
CREATE TABLE `admin_photo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mime` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_photo
-- ----------------------------
INSERT INTO `admin_photo` VALUES (3, '6958819_pear-admin_1607443454_1.png', 'http://127.0.0.1:5000/_uploads/photos/6958819_pear-admin_1607443454_1.png', 'image/png', '2204', '2021-03-19 18:53:02');
INSERT INTO `admin_photo` VALUES (17, '1617291580000.jpg', 'http://127.0.0.1:5000/_uploads/photos/1617291580000.jpg', 'image/png', '94211', '2021-04-01 23:39:41');

-- ----------------------------
-- Table structure for admin_power
-- ----------------------------
DROP TABLE IF EXISTS `admin_power`;
CREATE TABLE `admin_power`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限类型',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限路径',
  `open_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '打开方式',
  `parent_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '父类编号',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `enable` int NULL DEFAULT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_power
-- ----------------------------
INSERT INTO `admin_power` VALUES (1, '系统管理', '0', '', NULL, NULL, '0', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, 1);
INSERT INTO `admin_power` VALUES (3, '用户管理', '1', 'admin:user:main', '/admin/user/', '_iframe', '1', 'layui-icon layui-icon layui-icon layui-icon layui-icon-rate', 1, NULL, NULL, 1);
INSERT INTO `admin_power` VALUES (4, '权限管理', '1', 'admin:power:main', '/admin/power/', '_iframe', '1', NULL, 2, NULL, NULL, 1);
INSERT INTO `admin_power` VALUES (9, '角色管理', '1', 'admin:role:main', '/admin/role', '_iframe', '1', 'layui-icon layui-icon-username', 2, '2021-03-16 22:24:58', '2021-03-25 19:15:24', 1);
INSERT INTO `admin_power` VALUES (12, '系统监控', '1', 'admin:monitor:main', '/admin/monitor', '_iframe', '1', 'layui-icon layui-icon-vercode', 5, '2021-03-18 22:05:19', '2021-03-25 19:15:27', 1);
INSERT INTO `admin_power` VALUES (13, '日志管理', '1', 'admin:log:main', '/admin/log', '_iframe', '1', 'layui-icon layui-icon-read', 4, '2021-03-18 22:37:10', '2021-06-03 11:06:25', 1);
INSERT INTO `admin_power` VALUES (17, '文件管理', '0', '', '', '', '0', 'layui-icon layui-icon-camera', 2, '2021-03-19 18:56:23', '2021-03-25 19:15:08', 1);
INSERT INTO `admin_power` VALUES (18, '图片上传', '1', 'admin:file:main', '/admin/file', '_iframe', '17', 'layui-icon layui-icon-camera', 5, '2021-03-19 18:57:19', '2021-03-25 19:15:13', 1);
INSERT INTO `admin_power` VALUES (21, '权限增加', '2', 'admin:power:add', '', '', '4', 'layui-icon layui-icon-add-circle', 1, '2021-03-22 19:43:52', '2021-03-25 19:15:22', 1);
INSERT INTO `admin_power` VALUES (22, '用户增加', '2', 'admin:user:add', '', '', '3', 'layui-icon layui-icon-add-circle', 1, '2021-03-22 19:45:40', '2021-03-25 19:15:17', 1);
INSERT INTO `admin_power` VALUES (23, '用户编辑', '2', 'admin:user:edit', '', '', '3', 'layui-icon layui-icon-rate', 2, '2021-03-22 19:46:15', '2021-03-25 19:15:18', 1);
INSERT INTO `admin_power` VALUES (24, '用户删除', '2', 'admin:user:remove', '', '', '3', 'layui-icon None', 3, '2021-03-22 19:46:51', '2021-03-25 19:15:18', 1);
INSERT INTO `admin_power` VALUES (25, '权限编辑', '2', 'admin:power:edit', '', '', '4', 'layui-icon layui-icon-edit', 2, '2021-03-22 19:47:36', '2021-03-25 19:15:22', 1);
INSERT INTO `admin_power` VALUES (26, '用户删除', '2', 'admin:power:remove', '', '', '4', 'layui-icon layui-icon-delete', 3, '2021-03-22 19:48:17', '2021-03-25 19:15:23', 1);
INSERT INTO `admin_power` VALUES (27, '用户增加', '2', 'admin:role:add', '', '', '9', 'layui-icon layui-icon-add-circle', 1, '2021-03-22 19:49:09', '2021-03-25 19:15:24', 1);
INSERT INTO `admin_power` VALUES (28, '角色编辑', '2', 'admin:role:edit', '', '', '9', 'layui-icon layui-icon-edit', 2, '2021-03-22 19:49:41', '2021-03-25 19:15:25', 1);
INSERT INTO `admin_power` VALUES (29, '角色删除', '2', 'admin:role:remove', '', '', '9', 'layui-icon layui-icon-delete', 3, '2021-03-22 19:50:15', '2021-03-25 19:15:26', 1);
INSERT INTO `admin_power` VALUES (30, '角色授权', '2', 'admin:role:power', '', '', '9', 'layui-icon layui-icon-component', 4, '2021-03-22 19:50:54', '2021-03-25 19:15:26', 1);
INSERT INTO `admin_power` VALUES (31, '图片增加', '2', 'admin:file:add', '', '', '18', 'layui-icon layui-icon-add-circle', 1, '2021-03-22 19:58:05', '2021-03-25 19:15:28', 1);
INSERT INTO `admin_power` VALUES (32, '图片删除', '2', 'admin:file:delete', '', '', '18', 'layui-icon layui-icon-delete', 2, '2021-03-22 19:58:45', '2021-03-25 19:15:29', 1);
INSERT INTO `admin_power` VALUES (44, '数据字典', '1', 'admin:dict:main', '/admin/dict', '_iframe', '1', 'layui-icon layui-icon-console', 6, '2021-04-16 13:59:49', '2021-04-16 13:59:49', 1);
INSERT INTO `admin_power` VALUES (45, '字典增加', '2', 'admin:dict:add', '', '', '44', 'layui-icon ', 1, '2021-04-16 14:00:59', '2021-04-16 14:00:59', 1);
INSERT INTO `admin_power` VALUES (46, '字典修改', '2', 'admin:dict:edit', '', '', '44', 'layui-icon ', 2, '2021-04-16 14:01:33', '2021-04-16 14:01:33', 1);
INSERT INTO `admin_power` VALUES (47, '字典删除', '2', 'admin:dict:remove', '', '', '44', 'layui-icon ', 3, '2021-04-16 14:02:06', '2021-04-16 14:02:06', 1);
INSERT INTO `admin_power` VALUES (48, '部门管理', '1', 'admin:dept:main', '/dept', '_iframe', '1', 'layui-icon layui-icon-group', 3, '2021-06-01 16:22:11', '2021-07-07 13:49:39', 1);
INSERT INTO `admin_power` VALUES (49, '部门增加', '2', 'admin:dept:add', '', '', '48', 'layui-icon None', 1, '2021-06-01 17:35:52', '2021-06-01 17:36:15', 1);
INSERT INTO `admin_power` VALUES (50, '部门编辑', '2', 'admin:dept:edit', '', '', '48', 'layui-icon ', 2, '2021-06-01 17:36:41', '2021-06-01 17:36:41', 1);
INSERT INTO `admin_power` VALUES (51, '部门删除', '2', 'admin:dept:remove', '', '', '48', 'layui-icon None', 3, '2021-06-01 17:37:15', '2021-06-01 17:37:26', 1);
INSERT INTO `admin_power` VALUES (52, '定时任务', '0', '', '', '', '0', 'layui-icon layui-icon-log', 3, '2021-06-22 21:09:01', '2021-06-22 21:09:01', 1);
INSERT INTO `admin_power` VALUES (53, '任务管理', '1', 'admin:task:main', '/admin/task', '_iframe', '52', 'layui-icon ', 1, '2021-06-22 21:15:00', '2021-06-22 21:15:00', 1);
INSERT INTO `admin_power` VALUES (54, '任务增加', '2', 'admin:task:add', '', '', '53', 'layui-icon ', 1, '2021-06-22 22:20:54', '2021-06-22 22:20:54', 1);
INSERT INTO `admin_power` VALUES (55, '任务修改', '2', 'admin:task:edit', '', '', '53', 'layui-icon ', 2, '2021-06-22 22:21:34', '2021-06-22 22:21:34', 1);
INSERT INTO `admin_power` VALUES (56, '任务删除', '2', 'admin:task:remove', '', '', '53', 'layui-icon ', 3, '2021-06-22 22:22:18', '2021-06-22 22:22:18', 1);
INSERT INTO `admin_power` VALUES (57, '容器管理', '0', '', '', '', '0', 'layui-icon layui-icon-senior', 6, '2022-04-13 14:35:15', '2022-04-13 14:36:40', 1);
INSERT INTO `admin_power` VALUES (58, '设备管理', '1', 'docker:main', '/docker', '_iframe', '57', 'layui-icon ', 6, '2022-04-13 14:37:24', '2022-04-13 14:37:24', 1);
INSERT INTO `admin_power` VALUES (59, '比赛管理', '0', '', '', '', '0', 'layui-icon layui-icon-website', 6, '2022-04-14 00:33:22', '2022-04-14 00:33:22', 1);
INSERT INTO `admin_power` VALUES (60, '题目列表', '1', 'timu:main', '/timu', '_iframe', '59', 'layui-icon ', 1, '2022-04-14 00:36:09', '2022-04-14 00:36:09', 1);
INSERT INTO `admin_power` VALUES (61, '题库管理', '0', '', '', '', '0', 'layui-icon layui-icon-theme', 5, '2022-04-14 19:28:52', '2022-04-14 19:28:52', 1);
INSERT INTO `admin_power` VALUES (62, '赛事题库', '1', '', '', '_iframe', '61', 'layui-icon ', 6, '2022-04-14 19:30:57', '2022-04-14 19:30:57', 1);
INSERT INTO `admin_power` VALUES (63, '答题记录', '1', '', '', '', '61', 'layui-icon ', 9, '2022-04-14 19:31:40', '2022-04-14 19:31:40', 1);
INSERT INTO `admin_power` VALUES (64, '赛事容器', '1', '', '', '', '61', 'layui-icon layui-icon ', 10, '2022-04-14 19:32:03', '2022-04-14 19:32:16', 1);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '详情',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `enable` int NULL DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '管理员', 'admin', NULL, '管理员', 1, NULL, NULL, 1);
INSERT INTO `admin_role` VALUES (2, '普通用户', 'common', NULL, '只有查看，没有增删改权限', 2, '2021-03-22 20:02:38', '2021-04-01 22:29:56', 1);

-- ----------------------------
-- Table structure for admin_role_power
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_power`;
CREATE TABLE `admin_role_power`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识',
  `power_id` int NULL DEFAULT NULL COMMENT '用户编号',
  `role_id` int NULL DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `power_id`(`power_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `admin_role_power_ibfk_1` FOREIGN KEY (`power_id`) REFERENCES `admin_power` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_role_power_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 375 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role_power
-- ----------------------------
INSERT INTO `admin_role_power` VALUES (265, 1, 2);
INSERT INTO `admin_role_power` VALUES (266, 3, 2);
INSERT INTO `admin_role_power` VALUES (267, 4, 2);
INSERT INTO `admin_role_power` VALUES (268, 9, 2);
INSERT INTO `admin_role_power` VALUES (269, 12, 2);
INSERT INTO `admin_role_power` VALUES (270, 13, 2);
INSERT INTO `admin_role_power` VALUES (271, 17, 2);
INSERT INTO `admin_role_power` VALUES (272, 18, 2);
INSERT INTO `admin_role_power` VALUES (273, 44, 2);
INSERT INTO `admin_role_power` VALUES (274, 48, 2);
INSERT INTO `admin_role_power` VALUES (334, 1, 1);
INSERT INTO `admin_role_power` VALUES (335, 3, 1);
INSERT INTO `admin_role_power` VALUES (336, 4, 1);
INSERT INTO `admin_role_power` VALUES (337, 9, 1);
INSERT INTO `admin_role_power` VALUES (338, 12, 1);
INSERT INTO `admin_role_power` VALUES (339, 13, 1);
INSERT INTO `admin_role_power` VALUES (340, 17, 1);
INSERT INTO `admin_role_power` VALUES (341, 18, 1);
INSERT INTO `admin_role_power` VALUES (342, 21, 1);
INSERT INTO `admin_role_power` VALUES (343, 22, 1);
INSERT INTO `admin_role_power` VALUES (344, 23, 1);
INSERT INTO `admin_role_power` VALUES (345, 24, 1);
INSERT INTO `admin_role_power` VALUES (346, 25, 1);
INSERT INTO `admin_role_power` VALUES (347, 26, 1);
INSERT INTO `admin_role_power` VALUES (348, 27, 1);
INSERT INTO `admin_role_power` VALUES (349, 28, 1);
INSERT INTO `admin_role_power` VALUES (350, 29, 1);
INSERT INTO `admin_role_power` VALUES (351, 30, 1);
INSERT INTO `admin_role_power` VALUES (352, 31, 1);
INSERT INTO `admin_role_power` VALUES (353, 32, 1);
INSERT INTO `admin_role_power` VALUES (354, 44, 1);
INSERT INTO `admin_role_power` VALUES (355, 45, 1);
INSERT INTO `admin_role_power` VALUES (356, 46, 1);
INSERT INTO `admin_role_power` VALUES (357, 47, 1);
INSERT INTO `admin_role_power` VALUES (358, 48, 1);
INSERT INTO `admin_role_power` VALUES (359, 49, 1);
INSERT INTO `admin_role_power` VALUES (360, 50, 1);
INSERT INTO `admin_role_power` VALUES (361, 51, 1);
INSERT INTO `admin_role_power` VALUES (362, 52, 1);
INSERT INTO `admin_role_power` VALUES (363, 53, 1);
INSERT INTO `admin_role_power` VALUES (364, 54, 1);
INSERT INTO `admin_role_power` VALUES (365, 55, 1);
INSERT INTO `admin_role_power` VALUES (366, 56, 1);
INSERT INTO `admin_role_power` VALUES (367, 57, 1);
INSERT INTO `admin_role_power` VALUES (368, 58, 1);
INSERT INTO `admin_role_power` VALUES (369, 59, 1);
INSERT INTO `admin_role_power` VALUES (370, 60, 1);
INSERT INTO `admin_role_power` VALUES (371, 61, 1);
INSERT INTO `admin_role_power` VALUES (372, 62, 1);
INSERT INTO `admin_role_power` VALUES (373, 63, 1);
INSERT INTO `admin_role_power` VALUES (374, 64, 1);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password_hash` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '哈希密码',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `enable` int NULL DEFAULT NULL COMMENT '启用',
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '真实名字',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'pbkdf2:sha256:150000$raM7mDSr$58fe069c3eac01531fc8af85e6fc200655dd2588090530084d182e6ec9d52c85', NULL, '2021-06-01 17:28:55', 1, '超级管理', '要是不能把握时机，就要终身蹭蹬，一事无成！', 'http://127.0.0.1:5000/_uploads/photos/1617291580000.jpg', 1);
INSERT INTO `admin_user` VALUES (7, 'test', 'pbkdf2:sha256:150000$cRS8bYNh$adb57e64d929863cf159f924f74d0634f1fecc46dba749f1bfaca03da6d2e3ac', '2021-03-22 20:03:42', '2021-06-01 17:29:47', 1, '超级管理', '要是不能把握时机，就要终身蹭蹬，一事无成', '/static/admin/admin/images/avatar.jpg', 1);
INSERT INTO `admin_user` VALUES (8, 'wind', 'pbkdf2:sha256:150000$skME1obT$6a2c20cd29f89d7d2f21d9e373a7e3445f70ebce3ef1c3a555e42a7d17170b37', '2021-06-01 17:30:39', '2021-06-01 17:30:52', 1, '风', NULL, '/static/admin/admin/images/avatar.jpg', 7);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识',
  `user_id` int NULL DEFAULT NULL COMMENT '用户编号',
  `role_id` int NULL DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `admin_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (21, 1, 1);
INSERT INTO `admin_user_role` VALUES (22, 7, 2);
INSERT INTO `admin_user_role` VALUES (24, 8, 2);

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('4dc550acfb3f');

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `user_id` int NULL DEFAULT NULL COMMENT '关联用户',
  `question_id` int NULL DEFAULT NULL COMMENT '对应题目',
  `rank` int NULL DEFAULT NULL COMMENT '解题名次',
  `flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提交内容',
  `score` int NULL DEFAULT NULL COMMENT '分数',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提交答案IP',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `ctf_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for container_resource
-- ----------------------------
DROP TABLE IF EXISTS `container_resource`;
CREATE TABLE `container_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image_resource_id` int NULL DEFAULT NULL COMMENT '容器对应的镜像资源',
  `container_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器名称',
  `status` int NULL DEFAULT NULL COMMENT '1-启用/2-销毁',
  `container_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器的实际ID',
  `flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器的Flag',
  `container_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器状态 不实时显示',
  `container_port` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '端口映射',
  `addr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快照主机IP',
  `user_id` int NULL DEFAULT NULL COMMENT '关联用户',
  `destroy_time` datetime NULL DEFAULT NULL COMMENT '销毁时间',
  `question_id` int NULL DEFAULT NULL COMMENT '对应的题库',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `image_resource_id`(`image_resource_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `container_resource_ibfk_1` FOREIGN KEY (`image_resource_id`) REFERENCES `image_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `container_resource_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `ctf_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `container_resource_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of container_resource
-- ----------------------------

-- ----------------------------
-- Table structure for ctf_question
-- ----------------------------
DROP TABLE IF EXISTS `ctf_question`;
CREATE TABLE `ctf_question`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目名称',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `score` int NULL DEFAULT NULL COMMENT '积分',
  `desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Flag',
  `active_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否时动态Flag',
  `attachment` json NULL COMMENT '附件',
  `image_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `image_id`(`image_id`) USING BTREE,
  CONSTRAINT `ctf_question_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `image_resource` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ctf_question
-- ----------------------------

-- ----------------------------
-- Table structure for docker_host
-- ----------------------------
DROP TABLE IF EXISTS `docker_host`;
CREATE TABLE `docker_host`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名',
  `ip` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外部访问连接',
  `docker_api` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `online_time` datetime NULL DEFAULT NULL COMMENT '最后一次在线时间',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `system` json NULL COMMENT '详情信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ip`(`ip`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of docker_host
-- ----------------------------
INSERT INTO `docker_host` VALUES (2, '火数云服务器', '42.51.0.90', 'http://42.51.0.90:2376/', '8核8g10M', NULL, 1, '{\"os\": \"CentOS Linux 7 (Core)\", \"cpu\": 8, \"memory\": 7.64}', '2022-04-13 16:02:24');
INSERT INTO `docker_host` VALUES (3, '本地wsl', '172.18.214.54', 'http://172.18.214.54:2375', '本地', NULL, 1, '{\"os\": \"Ubuntu 20.04.4 LTS\", \"cpu\": 8, \"memory\": 12.41}', '2022-04-14 17:02:01');

-- ----------------------------
-- Table structure for image_resource
-- ----------------------------
DROP TABLE IF EXISTS `image_resource`;
CREATE TABLE `image_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `host_id` int NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `cpu` int NULL DEFAULT NULL COMMENT 'CPU个数',
  `memory` int NULL DEFAULT NULL COMMENT '内存大小M',
  `file` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `build_result` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像状态说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `host_id`(`host_id`) USING BTREE,
  CONSTRAINT `image_resource_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `docker_host` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_resource
-- ----------------------------

-- ----------------------------
-- Table structure for question_file
-- ----------------------------
DROP TABLE IF EXISTS `question_file`;
CREATE TABLE `question_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `question_id` int NULL DEFAULT NULL COMMENT '关联的题目ID',
  `filename` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件相对路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_file
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
