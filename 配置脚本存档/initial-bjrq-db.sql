-- --------------------------------------------------------
-- 主机:                           rm-wz9gwzlj917p72g6p.mysql.rds.aliyuncs.com
-- 服务器版本:                        5.6.16-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 bjrq.t_adjust_price_detail 结构
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

-- 正在导出表  bjrq.t_adjust_price_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_adjust_price_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adjust_price_detail` ENABLE KEYS */;

-- 导出  表 bjrq.t_adjust_price_schedule 结构
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

-- 正在导出表  bjrq.t_adjust_price_schedule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_adjust_price_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adjust_price_schedule` ENABLE KEYS */;

-- 导出  表 bjrq.t_cloud_panva_user_rel 结构
CREATE TABLE IF NOT EXISTS `t_cloud_panva_user_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cloud_user_idx` bigint(20) DEFAULT NULL,
  `panva_user_idx` bigint(20) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cloud_user_idx`,`panva_user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_cloud_panva_user_rel 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cloud_panva_user_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cloud_panva_user_rel` ENABLE KEYS */;

-- 导出  表 bjrq.t_cloud_user 结构
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

-- 正在导出表  bjrq.t_cloud_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cloud_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cloud_user` ENABLE KEYS */;

-- 导出  表 bjrq.t_complaint 结构
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

-- 正在导出表  bjrq.t_complaint 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_complaint` ENABLE KEYS */;

-- 导出  表 bjrq.t_complaint_type 结构
CREATE TABLE IF NOT EXISTS `t_complaint_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_complaint_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_complaint_type` DISABLE KEYS */;
INSERT INTO `t_complaint_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(20, '00003', '其它', '其它ps', '2018-04-12 15:49:21', '2018-04-12 15:49:21'),
	(21, '00001', '配送迟到', '配送迟到ps', '2018-04-12 15:49:47', '2018-04-12 15:49:47');
/*!40000 ALTER TABLE `t_complaint_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_coupon 结构
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

-- 正在导出表  bjrq.t_coupon 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coupon` ENABLE KEYS */;

-- 导出  表 bjrq.t_coupon_order 结构
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

-- 正在导出表  bjrq.t_coupon_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_coupon_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coupon_order` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer 结构
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
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话',
  `addr_province` varchar(50) NOT NULL DEFAULT '0',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `note` varchar(50) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updata_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Idx_number` (`cst_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息表';

-- 正在导出表  bjrq.t_customer 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_callin 结构
CREATE TABLE IF NOT EXISTS `t_customer_callin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话',
  `user_idx` bigint(20) NOT NULL DEFAULT '0',
  `addr_province` varchar(50) NOT NULL DEFAULT '0',
  `addr_city` varchar(50) NOT NULL DEFAULT '0',
  `addr_county` varchar(50) NOT NULL DEFAULT '0',
  `addr_detail` varchar(50) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updata_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户信息表';

-- 正在导出表  bjrq.t_customer_callin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_callin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_callin` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_company 结构
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

-- 正在导出表  bjrq.t_customer_company 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_company` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_credit 结构
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

-- 正在导出表  bjrq.t_customer_credit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_credit` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_credit_detail 结构
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

-- 正在导出表  bjrq.t_customer_credit_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer_credit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_credit_detail` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_level 结构
CREATE TABLE IF NOT EXISTS `t_customer_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户性质编码',
  `name` varchar(20) NOT NULL COMMENT '客户性质',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_character` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='客户级别表';

-- 正在导出表  bjrq.t_customer_level 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_customer_level` DISABLE KEYS */;
INSERT INTO `t_customer_level` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, '00000', '未定义', '未定义', '2017-10-12 15:39:20', '2017-10-12 15:39:22'),
	(2, '00001', '一级客户', '一级客户', '2017-10-30 14:10:06', '2017-10-30 14:10:08'),
	(4, '00002', '2级客户', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, '00004', '4级客户', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `t_customer_level` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_source 结构
CREATE TABLE IF NOT EXISTS `t_customer_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '客户来源编码',
  `name` varchar(20) NOT NULL COMMENT '客户来源',
  `note` varchar(20) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户来源';

-- 正在导出表  bjrq.t_customer_source 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_customer_source` DISABLE KEYS */;
INSERT INTO `t_customer_source` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, '00000', '未定义', '未定义', '2017-10-12 15:40:30', '2017-10-12 15:40:31'),
	(2, '00002', '广告', '销售宣传', '2017-10-30 14:11:11', '2017-10-30 14:11:11');
/*!40000 ALTER TABLE `t_customer_source` ENABLE KEYS */;

-- 导出  表 bjrq.t_customer_type 结构
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

-- 正在导出表  bjrq.t_customer_type 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_customer_type` DISABLE KEYS */;
INSERT INTO `t_customer_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, '00000', '未定义', '未定义', '2017-11-27 14:07:50', '2017-11-27 14:07:50'),
	(2, '00001', '普通住宅客户', '普通住宅客户', '2017-11-27 14:08:16', '2017-11-27 14:08:16'),
	(3, '00002', '餐饮客户1', '餐饮客户', '2017-11-29 15:45:09', '2017-11-29 15:45:09');
/*!40000 ALTER TABLE `t_customer_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_cylinder_auxiliary 结构
CREATE TABLE IF NOT EXISTS `t_cylinder_auxiliary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cylinder_idx` bigint(20) DEFAULT NULL,
  `location_dev_idx` bigint(20) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cylinder_idx`,`location_dev_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_cylinder_auxiliary 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cylinder_auxiliary` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cylinder_auxiliary` ENABLE KEYS */;

-- 导出  表 bjrq.t_cylinder_user 结构
CREATE TABLE IF NOT EXISTS `t_cylinder_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cylinder_idx` bigint(20) DEFAULT NULL,
  `user_idx` bigint(20) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`cylinder_idx`,`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_cylinder_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_cylinder_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cylinder_user` ENABLE KEYS */;

-- 导出  表 bjrq.t_department 结构
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `parent_idx` bigint(20) NOT NULL,
  `note` varchar(40) NOT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门';

-- 正在导出表  bjrq.t_department 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `code`, `name`, `parent_idx`, `note`, `create_time`, `update_time`) VALUES
	(1, 'root', '云南百江燃气', 0, '', '2018-04-19 09:46:14', '2018-04-19 09:46:14');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 bjrq.t_deposit_detail 结构
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

-- 正在导出表  bjrq.t_deposit_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_deposit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_deposit_detail` ENABLE KEYS */;

-- 导出  表 bjrq.t_discount_condition_type 结构
CREATE TABLE IF NOT EXISTS `t_discount_condition_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠类型';

-- 正在导出表  bjrq.t_discount_condition_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_discount_condition_type` DISABLE KEYS */;
INSERT INTO `t_discount_condition_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(16, '00001', '用户等级优惠', '用户等级优惠', '2018-03-21 16:37:08', '2018-03-21 16:37:40'),
	(17, '00002', '用户类别优惠', '用户类别优惠', '2018-03-21 16:37:58', '2018-04-17 14:52:17');
/*!40000 ALTER TABLE `t_discount_condition_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_discount_detail 结构
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

-- 正在导出表  bjrq.t_discount_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_discount_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_discount_detail` ENABLE KEYS */;

-- 导出  表 bjrq.t_discount_strategy 结构
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

-- 正在导出表  bjrq.t_discount_strategy 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_discount_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_discount_strategy` ENABLE KEYS */;

-- 导出  表 bjrq.t_gas_cylinder 结构
CREATE TABLE IF NOT EXISTS `t_gas_cylinder` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
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
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_gas_cylinder 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cylinder` ENABLE KEYS */;

-- 导出  表 bjrq.t_gas_cylinder_in_out 结构
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

-- 正在导出表  bjrq.t_gas_cylinder_in_out 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder_in_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gas_cylinder_in_out` ENABLE KEYS */;

-- 导出  表 bjrq.t_gas_cylinder_spec 结构
CREATE TABLE IF NOT EXISTS `t_gas_cylinder_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_gas_cylinder_spec 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_gas_cylinder_spec` DISABLE KEYS */;
INSERT INTO `t_gas_cylinder_spec` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(20, '0001', '3公斤', ' ', '2018-01-12 09:26:37', '2018-01-12 09:26:37'),
	(21, '0002', '5公斤', ' ', '2018-01-12 09:26:52', '2018-01-12 09:26:52'),
	(22, '0003', '15公斤', ' ', '2018-01-12 09:27:14', '2018-01-12 09:27:14');
/*!40000 ALTER TABLE `t_gas_cylinder_spec` ENABLE KEYS */;

-- 导出  表 bjrq.t_goods 结构
CREATE TABLE IF NOT EXISTS `t_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type_idx` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 正在导出表  bjrq.t_goods 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` (`id`, `code`, `name`, `type_idx`, `specifications`, `unit`, `weight`, `life_expectancy`, `price`, `status`, `note`, `create_time`, `update_time`) VALUES
	(6, '004', '5公斤液化气', 14, '5公斤', '瓶', 5, 30, 7, 0, '5公斤液化气', '2017-12-08 11:02:47', '2018-04-18 11:01:00'),
	(7, '0005', '15公斤液化气', 14, '15公斤', '瓶', 15, 30, 18, 0, '15公斤液化气', '2017-12-14 10:15:12', '2018-04-03 18:52:40'),
	(9, '0001', '50公斤液化气', 14, '50', '瓶', 50, 30, 50, 0, '50公斤液化气', '2018-01-30 13:49:46', '2018-01-30 14:09:09'),
	(10, '10001', '15kg瓶', 19, '15kg', '公斤', 15, 1, 15, 0, NULL, '2018-04-13 13:30:10', '2018-04-13 13:30:10'),
	(11, '10005', '5kg瓶', 19, '5', '公斤', 5, 1, 5, 0, NULL, '2018-04-13 13:30:46', '2018-04-13 13:30:46');
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;

-- 导出  表 bjrq.t_goods_type 结构
CREATE TABLE IF NOT EXISTS `t_goods_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_goods_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_goods_type` DISABLE KEYS */;
INSERT INTO `t_goods_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(14, '0001', '液化气', '', '2017-12-08 16:14:28', '2017-12-14 10:36:13'),
	(19, '0002', '专卖瓶', '', '2018-04-03 11:08:18', '2018-04-13 13:29:02');
/*!40000 ALTER TABLE `t_goods_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_group 结构
CREATE TABLE IF NOT EXISTS `t_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_group 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `t_group` DISABLE KEYS */;
INSERT INTO `t_group` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(1, '00001', '管理员', '系统管理员', '2017-11-03 14:34:42', '2017-11-27 16:19:29'),
	(2, '00002', '客服人员', '客服人员', '2017-11-04 10:54:06', '2017-12-11 10:55:21'),
	(3, '00003', '配送员', '配送员', '2017-11-04 10:54:27', '2017-12-11 10:55:27'),
	(4, '00004', '客户', '客户', '2017-11-11 15:07:33', '2017-11-27 16:19:38'),
	(5, '00005', '门店店长', '门店店长', '2017-11-30 14:32:13', '2017-11-30 14:32:13'),
	(6, '00006', '钢检员', '钢检员', '2017-11-30 14:32:13', '2017-11-30 14:32:13'),
	(7, '00007', '调拨员', '调拨员', '2017-11-30 14:32:13', '2018-01-24 11:21:49');
/*!40000 ALTER TABLE `t_group` ENABLE KEYS */;

-- 导出  表 bjrq.t_location_device 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_location_device 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_location_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_location_device` ENABLE KEYS */;

-- 导出  表 bjrq.t_mend 结构
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

-- 正在导出表  bjrq.t_mend 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_mend` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mend` ENABLE KEYS */;

-- 导出  表 bjrq.t_mend_type 结构
CREATE TABLE IF NOT EXISTS `t_mend_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_mend_type 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_mend_type` DISABLE KEYS */;
INSERT INTO `t_mend_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(22, 'mend_0001', '煤气管泄漏', '煤气管泄漏ps', '2018-04-10 16:01:10', '2018-04-10 16:06:01'),
	(23, 'mend_0002', '灶台报修', '灶台报修ps', '2018-04-10 16:01:52', '2018-04-19 09:48:05'),
	(24, 'mend_0003', '其它', '其它ps', '2018-04-11 11:05:34', '2018-04-11 11:05:34');
/*!40000 ALTER TABLE `t_mend_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_order 结构
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号 ',
  `call_in_phone` varchar(20) NOT NULL,
  `customer_idx` bigint(20) NOT NULL COMMENT '订单客户ID',
  `amount` float NOT NULL COMMENT '金额总计',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `access_type` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `pay_status` smallint(6) NOT NULL DEFAULT '0',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  `comment` varchar(50) DEFAULT '0' COMMENT '订单附言',
  `note` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单';

-- 正在导出表  bjrq.t_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

-- 导出  表 bjrq.t_order_detail 结构
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
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单详情';

-- 正在导出表  bjrq.t_order_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_detail` ENABLE KEYS */;

-- 导出  表 bjrq.t_order_dispatcher 结构
CREATE TABLE IF NOT EXISTS `t_order_dispatcher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL COMMENT '订单编号 idx',
  `dispatcher_idx` bigint(20) NOT NULL COMMENT '商品ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单详情';

-- 正在导出表  bjrq.t_order_dispatcher 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_dispatcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_dispatcher` ENABLE KEYS */;

-- 导出  表 bjrq.t_order_op_his 结构
CREATE TABLE IF NOT EXISTS `t_order_op_his` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL,
  `oper_idx` bigint(20) NOT NULL,
  `oper_log` varchar(100) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作历史信息';

-- 正在导出表  bjrq.t_order_op_his 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_op_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_op_his` ENABLE KEYS */;

-- 导出  表 bjrq.t_order_weixin 结构
CREATE TABLE IF NOT EXISTS `t_order_weixin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_idx` bigint(20) NOT NULL,
  `weixin_order_sn` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单与微信订单关联';

-- 正在导出表  bjrq.t_order_weixin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_weixin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_weixin` ENABLE KEYS */;

-- 导出  表 bjrq.t_security 结构
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

-- 正在导出表  bjrq.t_security 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_security` ENABLE KEYS */;

-- 导出  表 bjrq.t_security_type 结构
CREATE TABLE IF NOT EXISTS `t_security_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_security_type 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_security_type` DISABLE KEYS */;
INSERT INTO `t_security_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(20, '00001', '灶台检查', '灶台检查ps', '2018-04-12 15:46:21', '2018-04-12 15:46:21'),
	(21, '00002', '钢瓶检查', '钢瓶检查ps', '2018-04-12 15:46:40', '2018-04-12 15:46:40'),
	(22, '00003', '其它', '其它ps', '2018-04-12 15:46:51', '2018-04-12 15:46:51');
/*!40000 ALTER TABLE `t_security_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_settlement_type 结构
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

-- 正在导出表  bjrq.t_settlement_type 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_settlement_type` DISABLE KEYS */;
INSERT INTO `t_settlement_type` (`id`, `code`, `name`, `note`, `create_time`, `update_time`) VALUES
	(4, '00001', '普通客户', '普通客户', '2018-04-04 09:49:05', '2018-04-04 09:49:05'),
	(5, '00002', '月结客户', '月结客户', '2018-04-04 09:49:28', '2018-04-04 09:49:28'),
	(6, '00003', '气票客户', '气票客户', '2018-04-04 09:49:42', '2018-04-04 09:49:42');
/*!40000 ALTER TABLE `t_settlement_type` ENABLE KEYS */;

-- 导出  表 bjrq.t_system_param 结构
CREATE TABLE IF NOT EXISTS `t_system_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alive_expire_time` int(11) NOT NULL,
  `alive_check_time` int(11) NOT NULL,
  `push_order_range` int(11) NOT NULL,
  `note` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  bjrq.t_system_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_system_param` DISABLE KEYS */;
INSERT INTO `t_system_param` (`id`, `alive_expire_time`, `alive_check_time`, `push_order_range`, `note`, `create_time`, `update_time`) VALUES
	(18, 10, 30, 5000, ' ', '2017-12-12 11:56:02', '2017-12-13 09:52:37');
/*!40000 ALTER TABLE `t_system_param` ENABLE KEYS */;

-- 导出  表 bjrq.t_sysuser 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- 正在导出表  bjrq.t_sysuser 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_sysuser` DISABLE KEYS */;
INSERT INTO `t_sysuser` (`id`, `user_idx`, `department_idx`, `job_number`, `mobile_phone`, `office_phone`, `email`, `alive_status`, `alive_update_time`) VALUES
	(17, 115, 1, '111', '11', '11', '11', 0, '2018-04-18 15:52:45');
/*!40000 ALTER TABLE `t_sysuser` ENABLE KEYS */;

-- 导出  表 bjrq.t_ticket 结构
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

-- 正在导出表  bjrq.t_ticket 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ticket` ENABLE KEYS */;

-- 导出  表 bjrq.t_ticket_order 结构
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

-- 正在导出表  bjrq.t_ticket_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_ticket_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ticket_order` ENABLE KEYS */;

-- 导出  表 bjrq.t_user 结构
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT ' ' COMMENT '客户名称',
  `identity` varchar(40) NOT NULL DEFAULT '  ',
  `password` varchar(20) NOT NULL DEFAULT ' ',
  `group_idx` bigint(20) NOT NULL DEFAULT '0',
  `note` varchar(40) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开户时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Idx_userId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户信息表';

-- 正在导出表  bjrq.t_user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `user_id`, `name`, `identity`, `password`, `group_idx`, `note`, `create_time`, `update_time`) VALUES
	(115, 'admin', 'admin', '111', '111111', 1, '', '2017-12-12 17:33:57', '2018-04-18 15:52:45');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 bjrq.t_user_position 结构
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

-- 正在导出表  bjrq.t_user_position 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_user_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_position` ENABLE KEYS */;

-- 导出  表 bjrq.t_write_off_detail 结构
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

-- 正在导出表  bjrq.t_write_off_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_write_off_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_write_off_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
