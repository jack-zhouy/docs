-- --------------------------------------------------------
-- 主机:                           172.18.1.8
-- 服务器版本:                        5.6.16-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 cetc28_test.t_adjust_price_detail 结构
DROP TABLE IF EXISTS `t_adjust_price_detail`;
CREATE TABLE IF NOT EXISTS `t_adjust_price_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schedule_idx` bigint(20) DEFAULT '0' COMMENT '计划',
  `goods_idx` bigint(20) DEFAULT NULL COMMENT '商品',
  `price` double DEFAULT '0' COMMENT '价格',
  `note` varchar(50) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `updata_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调价计划表';

-- 正在导出表  cetc28_test.t_adjust_price_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_adjust_price_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adjust_price_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_adjust_price_schedule 结构
DROP TABLE IF EXISTS `t_adjust_price_schedule`;
CREATE TABLE IF NOT EXISTS `t_adjust_price_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0' COMMENT '计划名称',
  `effect_time` datetime DEFAULT NULL COMMENT '执行日期',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `note` varchar(50) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `updata_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调价计划表';

-- 正在导出表  cetc28_test.t_adjust_price_schedule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_adjust_price_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adjust_price_schedule` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_area 结构
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE IF NOT EXISTS `t_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `province` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `county` varchar(128) NOT NULL,
  `note` varchar(40) DEFAULT ' ' COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区域';

-- 正在导出表  cetc28_test.t_area 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_cloud_panva_user_rel 结构
DROP TABLE IF EXISTS `t_cloud_panva_user_rel`;
CREATE TABLE IF NOT EXISTS `t_cloud_panva_user_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cloud_user_idx` bigint(20) DEFAULT NULL,
  `panva_user_idx` bigint(20) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cloud_user_idx`,`panva_user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_cloud_panva_user_rel 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cloud_panva_user_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cloud_panva_user_rel` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_cloud_user 结构
DROP TABLE IF EXISTS `t_cloud_user`;
CREATE TABLE IF NOT EXISTS `t_cloud_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(20) NOT NULL DEFAULT ' ',
  `note` varchar(40) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开户时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Idx_userId` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户信息表';

-- 正在导出表  cetc28_test.t_cloud_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cloud_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cloud_user` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_complaint 结构
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE IF NOT EXISTS `t_complaint` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_sn` varchar(50) DEFAULT NULL COMMENT '投诉单号',
  `process_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '投诉状态',
  `detail` varchar(500) DEFAULT NULL COMMENT '投诉内容',
  `reslove_info` varchar(500) DEFAULT NULL COMMENT '处理结果',
  `addr_province` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `recv_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货人',
  `recv_phone` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货电话',
  `reserve_time` datetime DEFAULT NULL COMMENT '预约时间',
  `complainttype_idx` bigint(20) NOT NULL COMMENT '投诉类型',
  `laibleDepartment_idx` bigint(20) DEFAULT NULL COMMENT '责任部门',
  `dealedUser_idx` bigint(20) DEFAULT NULL COMMENT '处理人员',
  `requestCustomer_idx` bigint(20) NOT NULL COMMENT '请求客户',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cetc28_test.t_complaint 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_complaint` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_complaint_type 结构
DROP TABLE IF EXISTS `t_complaint_type`;
CREATE TABLE IF NOT EXISTS `t_complaint_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_complaint_type 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `t_complaint_type` DISABLE KEYS */;
INSERT INTO `t_complaint_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, 'complaint_0001', '送气速度慢', '', '2018-04-12 15:49:21', '2018-05-16 10:09:41'),
	(2, 'complaint_0002', '	维修速度慢', '', '2018-04-12 15:49:21', '2018-05-16 10:17:09'),
	(3, 'complaint_0003', '维修质量差', '', '2018-04-12 15:49:21', '2018-05-16 10:17:14'),
	(4, 'complaint_0004', '直销员服务态度差', '', '2018-04-12 15:49:21', '2018-05-16 10:17:19'),
	(5, 'complaint_0005', '营业员服务态度差\r', '', '2018-04-12 15:49:21', '2018-05-16 10:17:22'),
	(6, 'complaint_0006', '店长服务态度差', '', '2018-04-12 15:49:21', '2018-05-16 10:17:27'),
	(7, 'complaint_0007', '客服中心座席服务态度差', '', '2018-04-12 15:49:21', '2018-05-16 10:17:31'),
	(8, 'complaint_0008', '其它 ', '', '2018-04-12 15:49:47', '2018-05-16 10:17:33');
/*!40000 ALTER TABLE `t_complaint_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_coupon 结构
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE IF NOT EXISTS `t_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_idx` bigint(20) NOT NULL COMMENT ' ',
  `spec_idx` bigint(20) NOT NULL,
  `oper_idx` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `exp_time_start` date NOT NULL,
  `exp_time_end` date NOT NULL,
  `use_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `use_time` timestamp NULL DEFAULT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券';

-- 正在导出表  cetc28_test.t_coupon 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coupon` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_coupon_order 结构
DROP TABLE IF EXISTS `t_coupon_order`;
CREATE TABLE IF NOT EXISTS `t_coupon_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_idx` bigint(20) NOT NULL,
  `order_idx` bigint(20) NOT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `couponOrderIdx` (`coupon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券使用记录';

-- 正在导出表  cetc28_test.t_coupon_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_coupon_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coupon_order` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer 结构
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE IF NOT EXISTS `t_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL DEFAULT '0',
  `cst_number` varchar(40) NOT NULL DEFAULT ' ' COMMENT '客户编号',
  `have_cylinder` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '客户状态',
  `cst_type` bigint(20) NOT NULL DEFAULT '0',
  `settlement_type` bigint(20) NOT NULL DEFAULT '0',
  `cst_source` bigint(20) NOT NULL DEFAULT '0',
  `cst_level` bigint(20) NOT NULL DEFAULT '0',
  `cst_company_name` bigint(20) NOT NULL DEFAULT '0',
  `phone` varchar(12) NOT NULL DEFAULT '0' COMMENT '电话',
  `addr_province` varchar(50) NOT NULL DEFAULT '0',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `note` varchar(50) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updata_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Idx_number` (`cst_number`),
  KEY `Idx_user_id` (`user_idx`),
  KEY `Idx_settle_type` (`settlement_type`),
  KEY `Idx_type` (`cst_type`),
  KEY `Idx_source` (`cst_source`),
  KEY `Idx_level` (`cst_level`),
  KEY `Idx_detail_addr` (`addr_detail`),
  KEY `Idx_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息表';

-- 正在导出表  cetc28_test.t_customer 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_callin 结构
DROP TABLE IF EXISTS `t_customer_callin`;
CREATE TABLE IF NOT EXISTS `t_customer_callin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(12) NOT NULL DEFAULT '0' COMMENT '电话',
  `user_idx` bigint(20) NOT NULL DEFAULT '0',
  `addr_province` varchar(50) NOT NULL DEFAULT '0',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updata_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Idx_phone` (`phone`),
  KEY `Idx_user_idx` (`user_idx`),
  KEY `Idx_addr_detail` (`addr_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户信息表';

-- 正在导出表  cetc28_test.t_customer_callin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_callin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_callin` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_company 结构
DROP TABLE IF EXISTS `t_customer_company`;
CREATE TABLE IF NOT EXISTS `t_customer_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户性质编码',
  `name` varchar(20) NOT NULL COMMENT '客户性质',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_character` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户性质表';

-- 正在导出表  cetc28_test.t_customer_company 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_company` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_credit 结构
DROP TABLE IF EXISTS `t_customer_credit`;
CREATE TABLE IF NOT EXISTS `t_customer_credit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL COMMENT ' ',
  `amount` double NOT NULL,
  `credit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customerCreditIdx` (`credit_type`,`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='气票';

-- 正在导出表  cetc28_test.t_customer_credit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_credit` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_credit_detail 结构
DROP TABLE IF EXISTS `t_customer_credit_detail`;
CREATE TABLE IF NOT EXISTS `t_customer_credit_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL COMMENT ' ',
  `amount` double NOT NULL,
  `credit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `order_idx` bigint(20) NOT NULL DEFAULT '0',
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='气票';

-- 正在导出表  cetc28_test.t_customer_credit_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_credit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_credit_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_level 结构
DROP TABLE IF EXISTS `t_customer_level`;
CREATE TABLE IF NOT EXISTS `t_customer_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户性质编码',
  `name` varchar(20) NOT NULL COMMENT '客户性质',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_character` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户级别表';

-- 正在导出表  cetc28_test.t_customer_level 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_customer_level` DISABLE KEYS */;
INSERT INTO `t_customer_level` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(2, '00001', '一级客户', '', '2017-10-30 14:10:06', '2017-10-30 14:10:08'),
	(4, '00002', '二级客户', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, '00003', '三级客户', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, '00004', '四级客户', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, '00000', '未定义', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `t_customer_level` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_source 结构
DROP TABLE IF EXISTS `t_customer_source`;
CREATE TABLE IF NOT EXISTS `t_customer_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户来源编码',
  `name` varchar(20) NOT NULL COMMENT '客户来源',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户来源';

-- 正在导出表  cetc28_test.t_customer_source 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_customer_source` DISABLE KEYS */;
INSERT INTO `t_customer_source` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(2, '00001', '报纸广告', '', '2017-10-30 14:11:11', '2017-10-30 14:11:11'),
	(3, '00004', '别人介绍', '', '2017-10-30 14:11:11', '2017-10-30 14:11:11'),
	(4, '00003', '零售宣传', '', '2017-10-30 14:11:11', '2017-10-30 14:11:11'),
	(5, '00002', '电视广告', '', '2017-10-30 14:11:11', '2017-10-30 14:11:11'),
	(6, '00005', '网络推广', '', '2017-10-30 14:11:11', '2017-10-30 14:11:11');
/*!40000 ALTER TABLE `t_customer_source` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_customer_type 结构
DROP TABLE IF EXISTS `t_customer_type`;
CREATE TABLE IF NOT EXISTS `t_customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户类型编码',
  `name` varchar(20) NOT NULL COMMENT '客户类型名称',
  `note` varchar(40) NOT NULL COMMENT '客户类型备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '客户类型创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '客户类型修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_type` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户类型';

-- 正在导出表  cetc28_test.t_customer_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_customer_type` DISABLE KEYS */;
INSERT INTO `t_customer_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(2, '00001', '普通住宅客户', '普通住宅客户', '2017-11-27 14:08:16', '2017-11-27 14:08:16'),
	(3, '00002', '餐饮客户', '餐饮客户', '2018-05-09 15:16:36', '2018-05-09 15:16:36');
/*!40000 ALTER TABLE `t_customer_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_cylinder_auxiliary 结构
DROP TABLE IF EXISTS `t_cylinder_auxiliary`;
CREATE TABLE IF NOT EXISTS `t_cylinder_auxiliary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cylinder_idx` bigint(20) DEFAULT NULL,
  `location_dev_idx` bigint(20) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cylinder_idx`,`location_dev_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_cylinder_auxiliary 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cylinder_auxiliary` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cylinder_auxiliary` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_cylinder_user 结构
DROP TABLE IF EXISTS `t_cylinder_user`;
CREATE TABLE IF NOT EXISTS `t_cylinder_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cylinder_idx` bigint(20) DEFAULT NULL,
  `user_idx` bigint(20) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cylinder_idx`,`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_cylinder_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cylinder_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cylinder_user` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_department 结构
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `parent_idx` bigint(20) NOT NULL,
  `note` varchar(40) NOT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门';

-- 正在导出表  cetc28_test.t_department 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `code`, `name`, `parent_idx`, `note`, `create_time`, `update_time`) VALUES
	(1, 'root', '云南百江燃气', 0, '', '2018-04-19 09:46:14', '2018-04-19 09:46:14');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_deposit_detail 结构
DROP TABLE IF EXISTS `t_deposit_detail`;
CREATE TABLE IF NOT EXISTS `t_deposit_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oper_idx` bigint(20) NOT NULL COMMENT ' ',
  `amount` double NOT NULL,
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存入银行款';

-- 正在导出表  cetc28_test.t_deposit_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_deposit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_deposit_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_discount_condition_type 结构
DROP TABLE IF EXISTS `t_discount_condition_type`;
CREATE TABLE IF NOT EXISTS `t_discount_condition_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠类型';

-- 正在导出表  cetc28_test.t_discount_condition_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_discount_condition_type` DISABLE KEYS */;
INSERT INTO `t_discount_condition_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(16, '00001', '用户等级优惠', '用户等级优惠', '2018-03-21 16:37:08', '2018-03-21 16:37:40'),
	(17, '00002', '用户类别优惠', '用户类别优惠', '2018-03-21 16:37:58', '2018-04-17 14:52:17');
/*!40000 ALTER TABLE `t_discount_condition_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_discount_detail 结构
DROP TABLE IF EXISTS `t_discount_detail`;
CREATE TABLE IF NOT EXISTS `t_discount_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discount_strategy_idx` bigint(20) DEFAULT '0' COMMENT '优惠策略主表idx',
  `goods_idx` bigint(20) DEFAULT NULL COMMENT '商品',
  `discount` double DEFAULT '0' COMMENT '直减价格或折扣比例',
  `note` varchar(50) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `updata_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠策略明细表';

-- 正在导出表  cetc28_test.t_discount_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_discount_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_discount_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_discount_strategy 结构
DROP TABLE IF EXISTS `t_discount_strategy`;
CREATE TABLE IF NOT EXISTS `t_discount_strategy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0' COMMENT '优惠名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `discount_type` tinyint(4) DEFAULT NULL COMMENT '折扣类型',
  `discount_condition_type_idx` bigint(20) DEFAULT NULL COMMENT '规则条件idx',
  `condition_value` varchar(50) DEFAULT '0' COMMENT '条件取值',
  `use_type` tinyint(4) DEFAULT '0' COMMENT '优惠使用方式',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `note` varchar(50) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠策略表';

-- 正在导出表  cetc28_test.t_discount_strategy 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_discount_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_discount_strategy` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cylinder 结构
DROP TABLE IF EXISTS `t_gas_cylinder`;
CREATE TABLE IF NOT EXISTS `t_gas_cylinder` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `factory_idx` bigint(20) DEFAULT NULL,
  `spec_idx` bigint(20) DEFAULT NULL,
  `production_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_verify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scrap_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `life_status` tinyint(4) NOT NULL,
  `load_status` tinyint(4) NOT NULL,
  `service_status` tinyint(4) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_number` (`number`),
  KEY `Idx_id` (`id`),
  KEY `Idx_spec` (`spec_idx`),
  KEY `Idx_life_status` (`life_status`),
  KEY `Idx_service_status` (`service_status`),
  KEY `Idx_load_status` (`load_status`),
  KEY `Idx_spec_number` (`spec_idx`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_gas_cylinder 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cylinder` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cylinder_in_out 结构
DROP TABLE IF EXISTS `t_gas_cylinder_in_out`;
CREATE TABLE IF NOT EXISTS `t_gas_cylinder_in_out` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gas_cyr_idx` bigint(20) NOT NULL,
  `stock_type` tinyint(4) NOT NULL,
  `amount` int(11) NOT NULL,
  `src_user_idx` bigint(20) NOT NULL COMMENT ' ',
  `target_user_idx` bigint(20) NOT NULL,
  `op_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钢瓶出入库信息';

-- 正在导出表  cetc28_test.t_gas_cylinder_in_out 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder_in_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cylinder_in_out` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cylinder_spec 结构
DROP TABLE IF EXISTS `t_gas_cylinder_spec`;
CREATE TABLE IF NOT EXISTS `t_gas_cylinder_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_gas_cylinder_spec 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder_spec` DISABLE KEYS */;
INSERT INTO `t_gas_cylinder_spec` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(20, '0001', '5公斤', ' ', '2018-01-12 09:26:37', '2018-05-16 10:23:18'),
	(21, '0002', '15公斤', ' ', '2018-01-12 09:26:52', '2018-05-16 10:23:22'),
	(22, '0003', '50公斤', ' ', '2018-01-12 09:27:14', '2018-05-16 10:23:27');
/*!40000 ALTER TABLE `t_gas_cylinder_spec` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cyn_factory 结构
DROP TABLE IF EXISTS `t_gas_cyn_factory`;
CREATE TABLE IF NOT EXISTS `t_gas_cyn_factory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户性质编码',
  `name` varchar(20) NOT NULL COMMENT '客户性质',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_character` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户性质表';

-- 正在导出表  cetc28_test.t_gas_cyn_factory 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cyn_factory` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cyn_factory` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cyn_warn 结构
DROP TABLE IF EXISTS `t_gas_cyn_warn`;
CREATE TABLE IF NOT EXISTS `t_gas_cyn_warn` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gas_cyn_idx` bigint(20) DEFAULT NULL,
  `src_user_idx` bigint(20) DEFAULT NULL COMMENT '当前前端传入责任人',
  `take_over_idx` bigint(20) DEFAULT NULL COMMENT '交接记录IDx',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '告警状态',
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钢瓶交接告警';

-- 正在导出表  cetc28_test.t_gas_cyn_warn 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cyn_warn` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cyn_warn` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cyr_charge_spec 结构
DROP TABLE IF EXISTS `t_gas_cyr_charge_spec`;
CREATE TABLE IF NOT EXISTS `t_gas_cyr_charge_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gas_cyr_spec_idx` bigint(20) NOT NULL COMMENT ' ',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `price` double NOT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT=' ';

-- 正在导出表  cetc28_test.t_gas_cyr_charge_spec 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cyr_charge_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cyr_charge_spec` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cyr_dyn_detail 结构
DROP TABLE IF EXISTS `t_gas_cyr_dyn_detail`;
CREATE TABLE IF NOT EXISTS `t_gas_cyr_dyn_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oper_idx` bigint(20) NOT NULL,
  `gas_cyr_spec_idx` bigint(20) NOT NULL COMMENT ' ',
  `oper_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `amount` int(11) NOT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT=' ';

-- 正在导出表  cetc28_test.t_gas_cyr_dyn_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cyr_dyn_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cyr_dyn_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_gas_cyr_svc_status_op_his 结构
DROP TABLE IF EXISTS `t_gas_cyr_svc_status_op_his`;
CREATE TABLE IF NOT EXISTS `t_gas_cyr_svc_status_op_his` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gas_cyr_idx` bigint(20) NOT NULL,
  `gas_cyr_svc_status` tinyint(4) NOT NULL,
  `src_user_idx` bigint(20) NOT NULL COMMENT ' ',
  `target_user_idx` bigint(20) NOT NULL,
  `longitude` double unsigned zerofill NOT NULL DEFAULT '0000000000000000000000',
  `latitude` double unsigned zerofill NOT NULL DEFAULT '0000000000000000000000',
  `op_time` datetime NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Idx_gas_idx` (`gas_cyr_idx`),
  KEY `Idx_src_user` (`src_user_idx`),
  KEY `Idx_target_user` (`target_user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_gas_cyr_svc_status_op_his 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cyr_svc_status_op_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cyr_svc_status_op_his` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_goods 结构
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE IF NOT EXISTS `t_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type_idx` bigint(20) DEFAULT NULL,
  `area_idx` bigint(20) DEFAULT NULL,
  `specifications` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `weight` float NOT NULL,
  `life_expectancy` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cetc28_test.t_goods 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_goods_type 结构
DROP TABLE IF EXISTS `t_goods_type`;
CREATE TABLE IF NOT EXISTS `t_goods_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_goods_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_goods_type` DISABLE KEYS */;
INSERT INTO `t_goods_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(14, '0001', '液化气', '', '2017-12-08 16:14:28', '2017-12-14 10:36:13'),
	(19, '0002', '专卖瓶', '', '2018-04-03 11:08:18', '2018-04-13 13:29:02');
/*!40000 ALTER TABLE `t_goods_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_group 结构
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE IF NOT EXISTS `t_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_group 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `t_group` DISABLE KEYS */;
INSERT INTO `t_group` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, '00001', '管理员', '系统管理员', '2017-11-03 14:34:42', '2017-11-27 16:19:29'),
	(2, '00002', '客服人员', '客服人员', '2017-11-04 10:54:06', '2017-12-11 10:55:21'),
	(3, '00003', '配送员', '配送员', '2017-11-04 10:54:27', '2017-12-11 10:55:27'),
	(4, '00004', '客户', '客户', '2017-11-11 15:07:33', '2017-11-27 16:19:38'),
	(5, '00005', '门店店长', '门店店长', '2017-11-30 14:32:13', '2017-11-30 14:32:13'),
	(6, '00006', '钢检员', '钢检员', '2017-11-30 14:32:13', '2017-11-30 14:32:13'),
	(7, '00007', '调拨员', '调拨员', '2017-11-30 14:32:13', '2018-01-24 11:21:49'),
	(8, '00008', '财务', '财务', '2017-11-30 14:32:13', '2018-05-17 09:21:36');
/*!40000 ALTER TABLE `t_group` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_location_device 结构
DROP TABLE IF EXISTS `t_location_device`;
CREATE TABLE IF NOT EXISTS `t_location_device` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `electric_quantity` int(11) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_location_device 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_location_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_location_device` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_mend 结构
DROP TABLE IF EXISTS `t_mend`;
CREATE TABLE IF NOT EXISTS `t_mend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mend_sn` varchar(50) DEFAULT NULL COMMENT '报修单号',
  `process_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '报修状态',
  `detail` varchar(500) DEFAULT NULL COMMENT '报修内容',
  `reslove_info` varchar(500) DEFAULT NULL COMMENT '处理结果',
  `addr_province` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `recv_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货人',
  `recv_phone` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货电话',
  `reserve_time` datetime DEFAULT NULL COMMENT '预约时间',
  `mendtype_idx` bigint(20) NOT NULL COMMENT '报修类型',
  `laibleDepartment_idx` bigint(20) DEFAULT NULL COMMENT '责任部门',
  `dealedUser_idx` bigint(20) DEFAULT NULL COMMENT '处理人员',
  `requestCustomer_idx` bigint(20) NOT NULL COMMENT '请求客户',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cetc28_test.t_mend 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_mend` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mend` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_mend_type 结构
DROP TABLE IF EXISTS `t_mend_type`;
CREATE TABLE IF NOT EXISTS `t_mend_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_mend_type 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `t_mend_type` DISABLE KEYS */;
INSERT INTO `t_mend_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(22, 'mend_0001', '瓶身漏气 ', ' ', '2018-04-10 16:01:10', '2018-05-16 10:02:24'),
	(23, 'mend_0002', '角阀漏气', '', '2018-04-10 16:01:52', '2018-05-16 10:02:42'),
	(24, 'mend_0003', '减/中压阀漏气', '', '2018-04-11 11:05:34', '2018-05-16 10:03:27'),
	(25, 'mend_0004', '接头漏气', '', '2018-04-11 11:05:34', '2018-05-16 10:07:23'),
	(26, 'mend_0005', '胶管漏气', '', '2018-04-11 11:05:34', '2018-05-16 10:07:27'),
	(27, 'mend_0006', '灶具漏气', '', '2018-04-11 11:05:34', '2018-05-16 10:07:31'),
	(28, 'mend_0007', '不明原因漏气', '', '2018-04-11 11:05:34', '2018-05-16 10:07:35'),
	(29, 'mend_0008', '红火/黑火', '', '2018-04-11 11:05:34', '2018-05-16 10:07:41'),
	(30, 'mend_0010', '	灶具火小', '', '2018-04-11 11:05:34', '2018-05-16 10:07:54'),
	(31, 'mend_0009', '灶打不着火', '', '2018-04-11 11:05:34', '2018-05-16 10:07:48'),
	(32, 'mend_0011', '灶具堵', '', '2018-04-11 11:05:34', '2018-05-16 10:07:57'),
	(33, 'mend_0012', '角阀关不紧', '', '2018-04-11 11:05:34', '2018-05-16 10:08:00'),
	(34, 'mend_0013', '	更换配件', '', '2018-04-11 11:05:34', '2018-05-16 10:08:04'),
	(35, 'mend_0014', '	瓶口滑丝', '', '2018-04-11 11:05:34', '2018-05-16 10:08:08'),
	(36, 'mend_0015', '	免费更换配件', '', '2018-04-11 11:05:34', '2018-05-16 10:08:12'),
	(37, 'mend_0016', '	气出不来', '', '2018-04-11 11:05:34', '2018-05-16 10:08:17'),
	(38, 'mend_0017', '其它', '', '2018-04-11 11:05:34', '2018-05-16 10:08:17');
/*!40000 ALTER TABLE `t_mend_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_order 结构
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号 ',
  `call_in_phone` varchar(20) DEFAULT NULL,
  `customer_idx` bigint(20) NOT NULL COMMENT '订单客户ID',
  `amount` float NOT NULL COMMENT '金额总计',
  `origal_amount` float NOT NULL,
  `pay_type` smallint(6) DEFAULT '0' COMMENT '支付方式',
  `access_type` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `pay_status` smallint(6) NOT NULL DEFAULT '0',
  `order_trigger_type` smallint(6) NOT NULL DEFAULT '0',
  `invoice_status` smallint(6) NOT NULL DEFAULT '0',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `urgent` bit(1) DEFAULT b'0',
  `reserve_time` datetime DEFAULT NULL,
  `addr_province` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `recv_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货人',
  `recv_phone` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货电话',
  `comment` varchar(100) DEFAULT '0' COMMENT '订单附言',
  `note` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Idx_pay_status` (`pay_status`),
  KEY `Idx_status` (`status`),
  KEY `Idx_pay_type` (`pay_type`),
  KEY `Idx_order_sn` (`order_sn`(8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单';

-- 正在导出表  cetc28_test.t_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_order_detail 结构
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE IF NOT EXISTS `t_order_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL COMMENT '订单编号 idx',
  `goods_idx` bigint(20) NOT NULL COMMENT '商品ID',
  `deal_price` float NOT NULL COMMENT '成交价格',
  `original_price` float NOT NULL COMMENT '原价',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `subtotal` float NOT NULL DEFAULT '0' COMMENT '金额小计',
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Idx_order_idx` (`order_idx`),
  KEY `Idx_goods_idx` (`goods_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单详情';

-- 正在导出表  cetc28_test.t_order_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_detail` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_order_dispatcher 结构
DROP TABLE IF EXISTS `t_order_dispatcher`;
CREATE TABLE IF NOT EXISTS `t_order_dispatcher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL COMMENT '订单编号 idx',
  `dispatcher_idx` bigint(20) NOT NULL COMMENT '商品ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单详情';

-- 正在导出表  cetc28_test.t_order_dispatcher 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_dispatcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_dispatcher` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_order_op_his 结构
DROP TABLE IF EXISTS `t_order_op_his`;
CREATE TABLE IF NOT EXISTS `t_order_op_his` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL,
  `oper_idx` bigint(20) NOT NULL,
  `oper_log` varchar(100) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作历史信息';

-- 正在导出表  cetc28_test.t_order_op_his 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_op_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_op_his` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_order_weixin 结构
DROP TABLE IF EXISTS `t_order_weixin`;
CREATE TABLE IF NOT EXISTS `t_order_weixin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL,
  `weixin_order_sn` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单与微信订单关联';

-- 正在导出表  cetc28_test.t_order_weixin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_weixin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_weixin` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_security 结构
DROP TABLE IF EXISTS `t_security`;
CREATE TABLE IF NOT EXISTS `t_security` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `security_sn` varchar(50) DEFAULT NULL COMMENT '安检单号',
  `process_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '安检状态',
  `detail` varchar(500) DEFAULT NULL COMMENT '安检内容',
  `reslove_info` varchar(500) DEFAULT NULL COMMENT '处理结果',
  `addr_province` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `recv_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货人',
  `recv_phone` varchar(50) NOT NULL DEFAULT '0' COMMENT '收货电话',
  `reserve_time` datetime DEFAULT NULL COMMENT '预约时间',
  `securitytype_idx` bigint(20) NOT NULL COMMENT '安检类型',
  `laibleDepartment_idx` bigint(20) DEFAULT NULL COMMENT '责任部门',
  `dealedUser_idx` bigint(20) DEFAULT NULL COMMENT '处理人员',
  `requestCustomer_idx` bigint(20) NOT NULL COMMENT '请求客户',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cetc28_test.t_security 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_security` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_security_type 结构
DROP TABLE IF EXISTS `t_security_type`;
CREATE TABLE IF NOT EXISTS `t_security_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_security_type 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_security_type` DISABLE KEYS */;
INSERT INTO `t_security_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(20, 'security_0001', '灶台检查', '', '2018-04-12 15:46:21', '2018-05-16 10:14:52'),
	(21, 'security_0002', '钢瓶检查', '', '2018-04-12 15:46:40', '2018-05-16 10:15:58'),
	(22, 'security_0004', '其它', '', '2018-04-12 15:46:51', '2018-05-16 10:16:02'),
	(23, 'security_0003', '托盘检查', '', '2018-04-12 15:46:40', '2018-05-16 10:15:54');
/*!40000 ALTER TABLE `t_security_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_settlement_type 结构
DROP TABLE IF EXISTS `t_settlement_type`;
CREATE TABLE IF NOT EXISTS `t_settlement_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户类型编码',
  `name` varchar(20) NOT NULL COMMENT '客户类型名称',
  `note` varchar(40) NOT NULL COMMENT '客户类型备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '客户类型创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '客户类型修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_type` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='结算类型';

-- 正在导出表  cetc28_test.t_settlement_type 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_settlement_type` DISABLE KEYS */;
INSERT INTO `t_settlement_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(4, '00001', '普通客户', '普通客户', '2018-04-04 09:49:05', '2018-04-04 09:49:05'),
	(5, '00002', '月结客户', '月结客户', '2018-04-04 09:49:28', '2018-04-04 09:49:28'),
	(6, '00003', '气票客户', '气票客户', '2018-04-04 09:49:42', '2018-04-04 09:49:42');
/*!40000 ALTER TABLE `t_settlement_type` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_system_param 结构
DROP TABLE IF EXISTS `t_system_param`;
CREATE TABLE IF NOT EXISTS `t_system_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alive_expire_time` int(11) NOT NULL,
  `alive_check_time` int(11) NOT NULL,
  `push_order_range` int(11) NOT NULL,
  `tray_warning_weight` int(11) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_system_param 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_system_param` DISABLE KEYS */;
INSERT INTO `t_system_param` (`id`, `alive_expire_time`, `alive_check_time`, `push_order_range`, `tray_warning_weight`, `note`, `create_time`, `update_time`) VALUES
	(18, 10, 30, 5000, 1, ' ', '2017-12-12 11:56:02', '2018-07-05 15:58:55');
/*!40000 ALTER TABLE `t_system_param` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_sysuser 结构
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE IF NOT EXISTS `t_sysuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL,
  `department_idx` bigint(20) NOT NULL,
  `job_number` varchar(64) NOT NULL,
  `mobile_phone` varchar(16) DEFAULT NULL,
  `office_phone` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `alive_status` smallint(6) NOT NULL DEFAULT '0',
  `alive_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  cetc28_test.t_sysuser 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_sysuser` DISABLE KEYS */;
INSERT INTO `t_sysuser` (`id`, `user_idx`, `department_idx`, `job_number`, `mobile_phone`, `office_phone`, `email`, `alive_status`, `alive_update_time`) VALUES
	(1, 1, 1, 'admin0000', '--', '--', '--', 1, '2018-07-14 15:00:15');
/*!40000 ALTER TABLE `t_sysuser` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_ticket 结构
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE IF NOT EXISTS `t_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_sn` varchar(40) NOT NULL,
  `customer_idx` bigint(20) NOT NULL COMMENT ' ',
  `spec_idx` bigint(20) NOT NULL,
  `oper_idx` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `exp_time_start` date NOT NULL,
  `exp_time_end` date NOT NULL,
  `use_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `use_time` timestamp NULL DEFAULT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='气票';

-- 正在导出表  cetc28_test.t_ticket 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ticket` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_ticket_order 结构
DROP TABLE IF EXISTS `t_ticket_order`;
CREATE TABLE IF NOT EXISTS `t_ticket_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_idx` bigint(20) NOT NULL,
  `order_idx` bigint(20) NOT NULL,
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TicketOrderIndex` (`ticket_idx`,`order_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='气票';

-- 正在导出表  cetc28_test.t_ticket_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_ticket_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ticket_order` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_tray_device 结构
DROP TABLE IF EXISTS `t_tray_device`;
CREATE TABLE IF NOT EXISTS `t_tray_device` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `warning_status` int(11) NOT NULL,
  `weight` float NOT NULL,
  `time_stamp` varchar(50) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='托盘设备';

-- 正在导出表  cetc28_test.t_tray_device 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_tray_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tray_device` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_uninterrupt_gas_order 结构
DROP TABLE IF EXISTS `t_uninterrupt_gas_order`;
CREATE TABLE IF NOT EXISTS `t_uninterrupt_gas_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号 ',
  `dispatch_order_idx` bigint(20) NOT NULL COMMENT '原派送订单编号',
  `dispatcher_idx` bigint(20) NOT NULL COMMENT '派送工IDx',
  `user_idx` bigint(20) NOT NULL COMMENT '客户ID',
  `gas_cyn_idx` bigint(20) NOT NULL COMMENT '钢瓶idx',
  `full_weight` float NOT NULL COMMENT '满瓶气量',
  `empty_weight` float DEFAULT NULL COMMENT '空瓶气量',
  `goods_idx` bigint(20) DEFAULT NULL COMMENT '商品idx',
  `original_price` float DEFAULT NULL COMMENT '单价',
  `deal_price` float DEFAULT NULL COMMENT '成交单价',
  `origal_amount` float DEFAULT NULL COMMENT '原价总计金额',
  `deal_amount` float DEFAULT NULL COMMENT '金额总计（实际价格）',
  `pay_type` smallint(6) DEFAULT '0' COMMENT '支付方式',
  `pay_status` smallint(6) NOT NULL DEFAULT '0',
  `pay_time` timestamp NULL DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_user_idx` (`user_idx`),
  KEY `index_dispatcher_idx` (`dispatcher_idx`),
  KEY `index_gas_cyn_idx` (`gas_cyn_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='不间断供气订单';

-- 正在导出表  cetc28_test.t_uninterrupt_gas_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_uninterrupt_gas_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_uninterrupt_gas_order` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ' ' COMMENT '客户名称',
  `identity` varchar(40) NOT NULL DEFAULT '  ',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ' ',
  `group_idx` bigint(20) NOT NULL DEFAULT '0',
  `note` varchar(40) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开户时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Idx_user_id` (`user_id`),
  KEY `Idx_group` (`group_idx`),
  KEY `Idx_user_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户信息表';

-- 正在导出表  cetc28_test.t_user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `user_id`, `name`, `identity`, `password`, `group_idx`, `note`, `create_time`, `update_time`) VALUES
	(1, 'admin', 'admin', 'admin', '111111', 1, '管理员 ', '2018-07-14 14:59:02', '2018-07-14 14:59:21');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_user_gas_cyn_tray 结构
DROP TABLE IF EXISTS `t_user_gas_cyn_tray`;
CREATE TABLE IF NOT EXISTS `t_user_gas_cyn_tray` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL,
  `gas_tray_idx` bigint(20) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`gas_tray_idx`,`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  cetc28_test.t_user_gas_cyn_tray 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_user_gas_cyn_tray` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_gas_cyn_tray` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_user_position 结构
DROP TABLE IF EXISTS `t_user_position`;
CREATE TABLE IF NOT EXISTS `t_user_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL COMMENT ' ',
  `longitude` double NOT NULL COMMENT ' ',
  `latitude` double NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_type` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='当前位置信息';

-- 正在导出表  cetc28_test.t_user_position 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_user_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_position` ENABLE KEYS */;

-- 导出  表 cetc28_test.t_write_off_detail 结构
DROP TABLE IF EXISTS `t_write_off_detail`;
CREATE TABLE IF NOT EXISTS `t_write_off_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_idx` bigint(20) NOT NULL COMMENT ' ',
  `amount` double NOT NULL,
  `credit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0',
  `oper_idx` bigint(20) NOT NULL DEFAULT '0',
  `note` varchar(40) NOT NULL COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='汇款销账记录';

-- 正在导出表  cetc28_test.t_write_off_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_write_off_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_write_off_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
