-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 platform 的数据库结构
CREATE DATABASE IF NOT EXISTS `platform` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `platform`;

-- 导出  表 platform.article 结构
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `sub_title` varchar(256) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.department 结构
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sub_name` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.file_info 结构
CREATE TABLE IF NOT EXISTS `file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(256) DEFAULT NULL,
  `pos` varchar(256) DEFAULT NULL,
  `file_type` varchar(32) DEFAULT NULL,
  `file_encrypt` int(11) NOT NULL DEFAULT 0,
  `file_password` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.in_vul 结构
CREATE TABLE IF NOT EXISTS `in_vul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(256) NOT NULL DEFAULT '0',
  `cve` varchar(32) DEFAULT NULL,
  `vul_type` int(11) NOT NULL DEFAULT 0,
  `risk` int(11) NOT NULL DEFAULT 0 COMMENT '1 低 2 中 3高 4严重',
  `is_need_fix` int(11) NOT NULL DEFAULT 0 COMMENT '1 强制修复 2可以不修复',
  `url` varchar(256) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `affect` varchar(256) DEFAULT NULL,
  `fix` mediumtext DEFAULT NULL,
  `mitigation` mediumtext DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0废弃 1暂存 2内部发布 3公开发布',
  `fix_status` int(11) NOT NULL DEFAULT 1 COMMENT '1 未修复 2确认漏洞 3修复中 4等待复测 5等待发布 6修复完成 7缓解措施 8接受风险',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `expect_time` timestamp NULL DEFAULT NULL,
  `fixed_time` timestamp NULL DEFAULT NULL,
  `department` varchar(64) DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `security_user` varchar(64) DEFAULT NULL,
  `security_user_email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invul_title` (`title`),
  KEY `index_invul_cve` (`cve`),
  KEY `index_invul_risk` (`risk`),
  KEY `index_invul_create_time` (`create_time`),
  KEY `index_invul_expect_time` (`expect_time`),
  KEY `index_invul_url` (`url`),
  KEY `index_invul_status` (`status`),
  KEY `index_invul_type` (`vul_type`) USING BTREE,
  KEY `fix_status` (`fix_status`),
  CONSTRAINT `FK_invul_vultype_id` FOREIGN KEY (`vul_type`) REFERENCES `vul_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.log 结构
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_module` varchar(64) NOT NULL DEFAULT '0',
  `risk` int(11) NOT NULL DEFAULT 1 COMMENT '1常规 2风险',
  `log_type` int(11) NOT NULL DEFAULT 1 COMMENT '1增 2删 3改 4查',
  `result` int(11) NOT NULL DEFAULT 1 COMMENT '1成功 2失败',
  `msg` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_log_result` (`result`),
  KEY `index_log_risk` (`risk`),
  KEY `index_log_user_id` (`user_id`),
  KEY `type` (`log_type`) USING BTREE,
  KEY `module` (`log_module`) USING BTREE,
  CONSTRAINT `FK_log_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.login_user 结构
CREATE TABLE IF NOT EXISTS `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL DEFAULT '0',
  `mail` varchar(64) NOT NULL DEFAULT '0',
  `real_name` varchar(64) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 1,
  `dept` varchar(64) DEFAULT '0',
  `phone` varchar(16) DEFAULT '0',
  `auth` int(11) NOT NULL DEFAULT 0,
  `group` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_mail` (`mail`),
  KEY `index_user_status` (`status`),
  KEY `index_user_auth` (`auth`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.notice 结构
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(128) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.out_vul 结构
CREATE TABLE IF NOT EXISTS `out_vul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `vul_type` int(11) DEFAULT NULL,
  `cve` varchar(32) DEFAULT NULL,
  `risk` int(11) NOT NULL DEFAULT 1 COMMENT '1 低 2中 3高 4严重',
  `affect` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `fix` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0废弃 1暂存 2发布',
  `num` int(11) NOT NULL DEFAULT 0,
  `hot` int(11) NOT NULL DEFAULT 0 COMMENT '0普通 1热门',
  `show_time` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_outvul_title` (`title`),
  KEY `index_outvul_cve` (`cve`),
  KEY `index_outvul_risk` (`risk`),
  KEY `index_outvul_status` (`status`),
  KEY `index_outvul_type` (`vul_type`) USING BTREE,
  CONSTRAINT `FK_outvul_vultype_type` FOREIGN KEY (`vul_type`) REFERENCES `vul_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='外部漏洞表';

-- 数据导出被取消选择。

-- 导出  表 platform.system_info 结构
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mss_name` varchar(64) DEFAULT NULL,
  `mss_full_name` varchar(128) DEFAULT NULL,
  `sit_address` varchar(128) DEFAULT NULL,
  `sit_username` varchar(64) DEFAULT NULL,
  `sit_password` varchar(64) DEFAULT NULL,
  `uat_address` varchar(128) DEFAULT NULL,
  `uat_username` varchar(64) DEFAULT NULL,
  `uat_password` varchar(64) DEFAULT NULL,
  `dev_address` varchar(128) DEFAULT NULL,
  `dev_username` varchar(64) DEFAULT NULL,
  `dev_password` varchar(64) DEFAULT NULL,
  `prod_address` varchar(128) DEFAULT NULL,
  `prod_username` varchar(64) DEFAULT NULL,
  `prod_password` varchar(64) DEFAULT NULL,
  `pm_name` varchar(64) DEFAULT NULL,
  `pm_email` varchar(128) DEFAULT NULL,
  `pm_phone` varchar(16) DEFAULT NULL,
  `pm_manager` varchar(64) DEFAULT NULL,
  `pm_manager_email` varchar(64) DEFAULT NULL,
  `dev_manager` varchar(64) DEFAULT NULL,
  `dev_manager_email` varchar(64) DEFAULT NULL,
  `pmo` varchar(64) DEFAULT NULL,
  `pmo_email` varchar(64) DEFAULT NULL,
  `vendor_name` varchar(64) DEFAULT NULL,
  `vendor_email1` varchar(64) DEFAULT NULL,
  `vendor_email2` varchar(64) DEFAULT NULL,
  `vendor_email3` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.system_log 结构
CREATE TABLE IF NOT EXISTS `system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_module` varchar(64) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `log_type` int(11) DEFAULT 1 COMMENT '1信息 2告警 3错误',
  `msg` varchar(256) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `method` (`method`),
  KEY `module` (`log_module`) USING BTREE,
  KEY `type` (`log_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 platform.vul_type 结构
CREATE TABLE IF NOT EXISTS `vul_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_vulType_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='漏洞类型表';

-- 数据导出被取消选择。

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
