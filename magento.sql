-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 17, 2012 at 06:32 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `magento`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `adminnotification_inbox`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_assert`
--

CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert ID',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert Type',
  `assert_data` text COMMENT 'Assert Data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Assert Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `admin_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_ADMIN_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Role Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` VALUES(1, 0, 1, 1, 'G', 0, 'Administrators');
INSERT INTO `admin_role` VALUES(2, 1, 2, 0, 'U', 1, 'pankaj');

-- --------------------------------------------------------

--
-- Table structure for table `admin_rule`
--

CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert ID',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role Type',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_rule`
--

INSERT INTO `admin_rule` VALUES(1, 1, 'all', NULL, 0, 'G', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(40) DEFAULT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin User Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` VALUES(1, 'pankaj', 'sahni', 'dropmail.pankaj@gmail.com', 'admin', 'cb309869a3bd56c9dfbe94e1deca5315:uB', '2012-07-17 18:16:54', '2012-07-05 11:52:45', '2012-07-17 09:56:24', 12, 0, 1, 'a:1:{s:11:"configState";a:95:{s:12:"dev_restrict";s:1:"1";s:9:"dev_debug";s:1:"1";s:12:"dev_template";s:1:"0";s:20:"dev_translate_inline";s:1:"0";s:7:"dev_log";s:1:"0";s:6:"dev_js";s:1:"0";s:7:"dev_css";s:1:"0";s:15:"payment_account";s:1:"1";s:31:"payment_paypal_group_all_in_one";s:1:"1";s:24:"payment_payflow_advanced";s:1:"0";s:25:"payment_required_settings";s:1:"1";s:25:"payment_payments_advanced";s:1:"1";s:15:"payment_express";s:1:"1";s:34:"payment_settings_payments_advanced";s:1:"1";s:43:"payment_settings_payments_advanced_advanced";s:1:"0";s:25:"payment_billing_agreement";s:1:"0";s:25:"payment_settlement_report";s:1:"0";s:16:"payment_frontend";s:1:"0";s:33:"payment_settings_express_checkout";s:1:"1";s:42:"payment_settings_express_checkout_advanced";s:1:"0";s:11:"payment_wpp";s:1:"0";s:29:"payment_wpp_required_settings";s:1:"1";s:32:"payment_wpp_and_express_checkout";s:1:"1";s:20:"payment_wpp_settings";s:1:"1";s:29:"payment_wpp_settings_advanced";s:1:"0";s:29:"payment_wpp_billing_agreement";s:1:"0";s:29:"payment_wpp_settlement_report";s:1:"0";s:20:"payment_wpp_frontend";s:1:"0";s:37:"payment_wpp_settings_express_checkout";s:1:"1";s:46:"payment_wpp_settings_express_checkout_advanced";s:1:"0";s:11:"payment_wps";s:1:"0";s:29:"payment_wps_required_settings";s:1:"1";s:34:"payment_settings_payments_standart";s:1:"1";s:43:"payment_settings_payments_standart_advanced";s:1:"0";s:31:"payment_paypal_payment_gateways";s:1:"0";s:45:"payment_paypal_verisign_with_express_checkout";s:1:"0";s:31:"payment_paypal_payflow_required";s:1:"1";s:35:"payment_paypal_payflow_api_settings";s:1:"1";s:31:"payment_settings_paypal_payflow";s:1:"1";s:40:"payment_settings_paypal_payflow_advanced";s:1:"0";s:40:"payment_paypal_payflow_settlement_report";s:1:"0";s:31:"payment_paypal_payflow_frontend";s:1:"0";s:39:"payment_paypal_payflow_express_checkout";s:1:"1";s:48:"payment_paypal_payflow_express_checkout_advanced";s:1:"0";s:20:"payment_payflow_link";s:1:"0";s:29:"payment_payflow_link_required";s:1:"1";s:33:"payment_payflow_link_payflow_link";s:1:"1";s:37:"payment_payflow_link_express_checkout";s:1:"1";s:29:"payment_settings_payflow_link";s:1:"1";s:38:"payment_settings_payflow_link_advanced";s:1:"0";s:38:"payment_payflow_link_settlement_report";s:1:"0";s:29:"payment_payflow_link_frontend";s:1:"0";s:46:"payment_settings_payflow_link_express_checkout";s:1:"1";s:55:"payment_settings_payflow_link_express_checkout_advanced";s:1:"0";s:38:"payment_payflow_link_billing_agreement";s:1:"0";s:42:"payment_paypal_alternative_payment_methods";s:1:"1";s:24:"payment_express_checkout";s:1:"0";s:33:"payment_express_checkout_required";s:1:"1";s:50:"payment_express_checkout_required_express_checkout";s:1:"1";s:19:"payment_settings_ec";s:1:"1";s:28:"payment_settings_ec_advanced";s:1:"0";s:42:"payment_express_checkout_billing_agreement";s:1:"0";s:42:"payment_express_checkout_settlement_report";s:1:"0";s:33:"payment_express_checkout_frontend";s:1:"0";s:14:"payment_ccsave";s:1:"1";s:20:"payment_banktransfer";s:1:"1";s:15:"payment_checkmo";s:1:"1";s:12:"payment_free";s:1:"1";s:22:"payment_cashondelivery";s:1:"1";s:21:"payment_purchaseorder";s:1:"1";s:31:"payment_authorizenet_directpost";s:1:"1";s:20:"payment_authorizenet";s:1:"1";s:16:"payment_Ccavanue";s:1:"1";s:24:"payment_avenues_standard";s:1:"1";s:7:"web_url";s:1:"0";s:7:"web_seo";s:1:"1";s:12:"web_unsecure";s:1:"0";s:10:"web_secure";s:1:"0";s:11:"web_default";s:1:"1";s:9:"web_polls";s:1:"0";s:10:"web_cookie";s:1:"0";s:11:"web_session";s:1:"0";s:24:"web_browser_capabilities";s:1:"0";s:17:"carriers_flatrate";s:1:"0";s:18:"carriers_tablerate";s:1:"0";s:21:"carriers_freeshipping";s:1:"0";s:12:"carriers_ups";s:1:"0";s:13:"carriers_usps";s:1:"0";s:14:"carriers_fedex";s:1:"0";s:12:"carriers_dhl";s:1:"0";s:15:"carriers_dhlint";s:1:"0";s:15:"general_country";s:1:"1";s:14:"general_region";s:1:"1";s:14:"general_locale";s:1:"0";s:25:"general_store_information";s:1:"1";}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_attribute`
--

CREATE TABLE `api2_acl_attribute` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `user_type` varchar(20) NOT NULL COMMENT 'Type of user',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `operation` varchar(20) NOT NULL COMMENT 'Operation',
  `allowed_attributes` text COMMENT 'Allowed attributes',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_API2_ACL_ATTRIBUTE_USER_TYPE_RESOURCE_ID_OPERATION` (`user_type`,`resource_id`,`operation`),
  KEY `IDX_API2_ACL_ATTRIBUTE_USER_TYPE` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Filter ACL Attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api2_acl_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_role`
--

CREATE TABLE `api2_acl_role` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `role_name` varchar(255) NOT NULL COMMENT 'Name of role',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_API2_ACL_ROLE_CREATED_AT` (`created_at`),
  KEY `IDX_API2_ACL_ROLE_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Roles' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `api2_acl_role`
--

INSERT INTO `api2_acl_role` VALUES(1, '2012-07-05 17:21:26', NULL, 'Guest');
INSERT INTO `api2_acl_role` VALUES(2, '2012-07-05 17:21:26', NULL, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_rule`
--

CREATE TABLE `api2_acl_rule` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `privilege` varchar(20) DEFAULT NULL COMMENT 'ACL Privilege',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_API2_ACL_RULE_ROLE_ID_RESOURCE_ID_PRIVILEGE` (`role_id`,`resource_id`,`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Rules' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api2_acl_rule`
--


-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_user`
--

CREATE TABLE `api2_acl_user` (
  `admin_id` int(10) unsigned NOT NULL COMMENT 'Admin ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  UNIQUE KEY `UNQ_API2_ACL_USER_ADMIN_ID` (`admin_id`),
  KEY `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Users';

--
-- Dumping data for table `api2_acl_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_assert`
--

CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert id',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert type',
  `assert_data` text COMMENT 'Assert additional data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_role`
--

CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent role id',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role level in tree',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order to display on admin area',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User id',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_API_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_API_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_role`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_rule`
--

CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Api rule Id',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Api role Id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Module code',
  `api_privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert id',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role type',
  `api_permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_API_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_API_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_rule`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_session`
--

CREATE TABLE `api_session` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User id',
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login date',
  `sessid` varchar(40) DEFAULT NULL COMMENT 'Sessioin id',
  KEY `IDX_API_SESSION_USER_ID` (`user_id`),
  KEY `IDX_API_SESSION_SESSID` (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';

--
-- Dumping data for table `api_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE `api_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'Last name',
  `email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'Nickname',
  `api_key` varchar(40) DEFAULT NULL COMMENT 'Api key',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User record create date',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User record modify date',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Quantity of log ins',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Refresh ACL flag',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Account status',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `avenues_api_debug`
--

CREATE TABLE `avenues_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `avenues_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `captcha_log`
--

CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

--
-- Dumping data for table `captcha_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` VALUES(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `UNQ_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cataloginventory_stock_item`
--

INSERT INTO `cataloginventory_stock_item` VALUES(1, 1, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 0.0000, 1, 0, '2012-07-17 10:04:45', NULL, 1, 0, 0, 1, 1, 0.0000, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `cataloginventory_stock_status`
--

INSERT INTO `cataloginventory_stock_status` VALUES(1, 1, 1, 0.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_affected_product`
--

CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';

--
-- Dumping data for table `catalogrule_affected_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_customer_group`
--

CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

--
-- Dumping data for table `catalogrule_customer_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

--
-- Dumping data for table `catalogrule_group_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `IDX_CATALOGRULE_PRODUCT_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `UNQ_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule_product_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_website`
--

CREATE TABLE `catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_CATALOGRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

--
-- Dumping data for table `catalogrule_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_fulltext`
--

CREATE TABLE `catalogsearch_fulltext` (
  `fulltext_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`fulltext_id`),
  UNIQUE KEY `UNQ_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`),
  FULLTEXT KEY `FTI_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Catalog search result table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalogsearch_fulltext`
--

INSERT INTO `catalogsearch_fulltext` VALUES(5, 1, 1, '001|Enabled|None|Red T-shirt|Red T-shirt|Red T-shirt|1|1');

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_query`
--

CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  KEY `IDX_CATALOGSEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `IDX_CATALOGSEARCH_QUERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog search query table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalogsearch_query`
--

INSERT INTO `catalogsearch_query` VALUES(1, 'red', 1, 2, NULL, NULL, 1, 1, 1, 1, '2012-07-17 10:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_result`
--

CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL COMMENT 'Query ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `relevance` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Relevance',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_CATALOGSEARCH_RESULT_QUERY_ID` (`query_id`),
  KEY `IDX_CATALOGSEARCH_RESULT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';

--
-- Dumping data for table `catalogsearch_result`
--

INSERT INTO `catalogsearch_result` VALUES(1, 1, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_CATEGORY_ID` (`category_id`),
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_PATH_CATEGORY_ID` (`path`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Index Table';

--
-- Dumping data for table `catalog_category_anc_categs_index_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_CATEGORY_ID` (`category_id`),
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_PATH_CATEGORY_ID` (`path`,`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Temp Table';

--
-- Dumping data for table `catalog_category_anc_categs_index_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_IDX_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Index Table';

--
-- Dumping data for table `catalog_category_anc_products_index_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_TMP_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Temp Table';

--
-- Dumping data for table `catalog_category_anc_products_index_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` VALUES(1, 3, 0, 0, '2012-07-05 11:51:40', '2012-07-05 11:51:40', '1', 0, 0, 2);
INSERT INTO `catalog_category_entity` VALUES(2, 3, 3, 1, '2012-07-05 11:51:41', '2012-07-05 11:51:41', '1/2', 1, 1, 1);
INSERT INTO `catalog_category_entity` VALUES(3, 3, 3, 2, '2012-07-10 10:51:51', '2012-07-10 10:51:51', '1/2/3', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DTIME_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

INSERT INTO `catalog_category_entity_datetime` VALUES(1, 3, 59, 0, 3, NULL);
INSERT INTO `catalog_category_entity_datetime` VALUES(2, 3, 60, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DEC_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

INSERT INTO `catalog_category_entity_decimal` VALUES(1, 3, 70, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` VALUES(1, 3, 67, 0, 1, 1);
INSERT INTO `catalog_category_entity_int` VALUES(2, 3, 67, 1, 1, 1);
INSERT INTO `catalog_category_entity_int` VALUES(3, 3, 42, 0, 2, 1);
INSERT INTO `catalog_category_entity_int` VALUES(4, 3, 67, 0, 2, 1);
INSERT INTO `catalog_category_entity_int` VALUES(5, 3, 42, 1, 2, 1);
INSERT INTO `catalog_category_entity_int` VALUES(6, 3, 67, 1, 2, 1);
INSERT INTO `catalog_category_entity_int` VALUES(7, 3, 42, 0, 3, 1);
INSERT INTO `catalog_category_entity_int` VALUES(8, 3, 67, 0, 3, 1);
INSERT INTO `catalog_category_entity_int` VALUES(9, 3, 50, 0, 3, NULL);
INSERT INTO `catalog_category_entity_int` VALUES(10, 3, 51, 0, 3, 0);
INSERT INTO `catalog_category_entity_int` VALUES(11, 3, 68, 0, 3, 0);
INSERT INTO `catalog_category_entity_int` VALUES(12, 3, 69, 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_TEXT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `catalog_category_entity_text`
--

INSERT INTO `catalog_category_entity_text` VALUES(1, 3, 65, 0, 1, NULL);
INSERT INTO `catalog_category_entity_text` VALUES(2, 3, 65, 1, 1, NULL);
INSERT INTO `catalog_category_entity_text` VALUES(3, 3, 65, 0, 2, NULL);
INSERT INTO `catalog_category_entity_text` VALUES(4, 3, 65, 1, 2, NULL);
INSERT INTO `catalog_category_entity_text` VALUES(5, 3, 44, 0, 3, 'T-shirts');
INSERT INTO `catalog_category_entity_text` VALUES(6, 3, 47, 0, 3, 'T-shirts');
INSERT INTO `catalog_category_entity_text` VALUES(7, 3, 48, 0, 3, 'T-shirts');
INSERT INTO `catalog_category_entity_text` VALUES(8, 3, 62, 0, 3, NULL);
INSERT INTO `catalog_category_entity_text` VALUES(9, 3, 65, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_VCHR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` VALUES(1, 3, 41, 0, 1, 'Root Catalog');
INSERT INTO `catalog_category_entity_varchar` VALUES(2, 3, 41, 1, 1, 'Root Catalog');
INSERT INTO `catalog_category_entity_varchar` VALUES(3, 3, 43, 1, 1, 'root-catalog');
INSERT INTO `catalog_category_entity_varchar` VALUES(4, 3, 41, 0, 2, 'Default Category');
INSERT INTO `catalog_category_entity_varchar` VALUES(5, 3, 41, 1, 2, 'Default Category');
INSERT INTO `catalog_category_entity_varchar` VALUES(6, 3, 49, 1, 2, 'PRODUCTS');
INSERT INTO `catalog_category_entity_varchar` VALUES(7, 3, 43, 1, 2, 'default-category');
INSERT INTO `catalog_category_entity_varchar` VALUES(8, 3, 41, 0, 3, 'T-shirts');
INSERT INTO `catalog_category_entity_varchar` VALUES(9, 3, 43, 0, 3, 't-shirts');
INSERT INTO `catalog_category_entity_varchar` VALUES(10, 3, 46, 0, 3, 'T-shirts');
INSERT INTO `catalog_category_entity_varchar` VALUES(11, 3, 49, 0, 3, 'PRODUCTS');
INSERT INTO `catalog_category_entity_varchar` VALUES(12, 3, 58, 0, 3, NULL);
INSERT INTO `catalog_category_entity_varchar` VALUES(13, 3, 61, 0, 3, NULL);
INSERT INTO `catalog_category_entity_varchar` VALUES(14, 3, 57, 1, 3, 't-shirts.html');
INSERT INTO `catalog_category_entity_varchar` VALUES(15, 3, 57, 0, 3, 't-shirts.html');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Dumping data for table `catalog_category_product`
--

INSERT INTO `catalog_category_product` VALUES(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `15D3C269665C74C2219037D534F4B0DC` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

--
-- Dumping data for table `catalog_category_product_index`
--

INSERT INTO `catalog_category_product_index` VALUES(2, 1, 60001, 0, 1, 4);
INSERT INTO `catalog_category_product_index` VALUES(3, 1, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_IDX_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Index Table';

--
-- Dumping data for table `catalog_category_product_index_enbl_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_TMP_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Temp Table';

--
-- Dumping data for table `catalog_category_product_index_enbl_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_idx`
--

CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_IDX_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Index Table';

--
-- Dumping data for table `catalog_category_product_index_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_tmp`
--

CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';

--
-- Dumping data for table `catalog_category_product_index_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_compare_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `is_configurable` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Configurable',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` VALUES(41, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(42, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(43, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(44, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0);
INSERT INTO `catalog_eav_attribute` VALUES(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(47, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(51, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(52, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(53, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(54, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(57, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(58, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(59, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(63, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(64, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(65, 'adminhtml/catalog_category_helper_sortby_available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(66, 'adminhtml/catalog_category_helper_sortby_default', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(67, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(68, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(70, 'adminhtml/catalog_category_helper_pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(71, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, NULL, 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(72, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 1, 0);
INSERT INTO `catalog_eav_attribute` VALUES(73, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, NULL, 1, 0, 1, 0);
INSERT INTO `catalog_eav_attribute` VALUES(74, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(75, NULL, 2, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(76, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(77, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(78, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'virtual,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(80, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(81, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple', 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(82, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(83, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(88, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(89, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(90, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(91, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(92, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple', 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(93, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(94, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(95, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(96, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(97, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(98, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(99, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(100, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(101, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(102, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(103, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(105, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(107, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(108, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(109, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(110, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(111, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(112, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(113, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(114, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(115, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(116, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(117, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,configurable,bundle,grouped', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(118, 'adminhtml/catalog_product_helper_form_msrp_enabled', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(119, 'adminhtml/catalog_product_helper_form_msrp_price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(120, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(121, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(122, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,downloadable,bundle', 1, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(123, 'giftmessage/adminhtml_product_helper_form_config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(124, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(125, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(126, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(127, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(128, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(129, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(130, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(131, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(132, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0);
INSERT INTO `catalog_eav_attribute` VALUES(133, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

--
-- Dumping data for table `catalog_product_bundle_price_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_selection`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_enabled_index`
--

CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Visibility Index Table';

--
-- Dumping data for table `catalog_product_enabled_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_product_entity`
--

INSERT INTO `catalog_product_entity` VALUES(1, 4, 4, 'simple', '001', 0, 0, '2012-07-10 11:15:50', '2012-07-17 10:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

INSERT INTO `catalog_product_entity_datetime` VALUES(1, 4, 93, 0, 1, NULL);
INSERT INTO `catalog_product_entity_datetime` VALUES(2, 4, 94, 0, 1, NULL);
INSERT INTO `catalog_product_entity_datetime` VALUES(3, 4, 77, 0, 1, NULL);
INSERT INTO `catalog_product_entity_datetime` VALUES(4, 4, 78, 0, 1, NULL);
INSERT INTO `catalog_product_entity_datetime` VALUES(5, 4, 104, 0, 1, NULL);
INSERT INTO `catalog_product_entity_datetime` VALUES(6, 4, 105, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

INSERT INTO `catalog_product_entity_decimal` VALUES(1, 4, 80, 0, 1, 1000.0000);
INSERT INTO `catalog_product_entity_decimal` VALUES(2, 4, 75, 0, 1, 1.0000);
INSERT INTO `catalog_product_entity_decimal` VALUES(3, 4, 76, 0, 1, NULL);
INSERT INTO `catalog_product_entity_decimal` VALUES(4, 4, 120, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_GLR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_group_price`
--

CREATE TABLE `catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CC12C83765B562314470A24F2BDD0F36` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_group_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_entity_int`
--

INSERT INTO `catalog_product_entity_int` VALUES(1, 4, 96, 0, 1, 1);
INSERT INTO `catalog_product_entity_int` VALUES(2, 4, 102, 0, 1, 4);
INSERT INTO `catalog_product_entity_int` VALUES(3, 4, 121, 0, 1, 1);
INSERT INTO `catalog_product_entity_int` VALUES(4, 4, 122, 0, 1, 0);
INSERT INTO `catalog_product_entity_int` VALUES(5, 4, 100, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

INSERT INTO `catalog_product_entity_media_gallery` VALUES(1, 88, 1, '/p/e/pear_1.gif');
INSERT INTO `catalog_product_entity_media_gallery` VALUES(2, 88, 1, '/g/r/green_apple_1.gif');
INSERT INTO `catalog_product_entity_media_gallery` VALUES(3, 88, 1, '/o/r/orange_1.gif');
INSERT INTO `catalog_product_entity_media_gallery` VALUES(4, 88, 1, '/r/e/red_apple_1.gif');
INSERT INTO `catalog_product_entity_media_gallery` VALUES(5, 88, 1, '/s/t/strawberry_1.gif');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

INSERT INTO `catalog_product_entity_media_gallery_value` VALUES(1, 0, NULL, 1, 0);
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES(2, 0, NULL, 2, 0);
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES(3, 0, NULL, 3, 0);
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES(4, 0, NULL, 4, 0);
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES(5, 0, NULL, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `catalog_product_entity_text`
--

INSERT INTO `catalog_product_entity_text` VALUES(1, 4, 72, 0, 1, 'Red T-shirt');
INSERT INTO `catalog_product_entity_text` VALUES(2, 4, 73, 0, 1, 'Red T-shirt');
INSERT INTO `catalog_product_entity_text` VALUES(3, 4, 83, 0, 1, NULL);
INSERT INTO `catalog_product_entity_text` VALUES(4, 4, 106, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

INSERT INTO `catalog_product_entity_varchar` VALUES(1, 4, 71, 0, 1, 'Red T-shirt');
INSERT INTO `catalog_product_entity_varchar` VALUES(2, 4, 97, 0, 1, 'red-t-shirt');
INSERT INTO `catalog_product_entity_varchar` VALUES(3, 4, 117, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(4, 4, 118, 0, 1, '2');
INSERT INTO `catalog_product_entity_varchar` VALUES(5, 4, 119, 0, 1, '4');
INSERT INTO `catalog_product_entity_varchar` VALUES(6, 4, 82, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(7, 4, 84, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(8, 4, 85, 0, 1, '/p/e/pear_1.gif');
INSERT INTO `catalog_product_entity_varchar` VALUES(9, 4, 86, 0, 1, '/p/e/pear_1.gif');
INSERT INTO `catalog_product_entity_varchar` VALUES(10, 4, 87, 0, 1, '/o/r/orange_1.gif');
INSERT INTO `catalog_product_entity_varchar` VALUES(11, 4, 103, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(12, 4, 107, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(13, 4, 109, 0, 1, 'container2');
INSERT INTO `catalog_product_entity_varchar` VALUES(14, 4, 123, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(15, 4, 98, 1, 1, 'red-t-shirt.html');
INSERT INTO `catalog_product_entity_varchar` VALUES(16, 4, 98, 0, 1, 'red-t-shirt.html');
INSERT INTO `catalog_product_entity_varchar` VALUES(17, 4, 112, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(18, 4, 113, 0, 1, NULL);
INSERT INTO `catalog_product_entity_varchar` VALUES(19, 4, 114, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `catalog_product_index_eav`
--

INSERT INTO `catalog_product_index_eav` VALUES(1, 122, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_idx`
--

CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_eav_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

INSERT INTO `catalog_product_index_eav_tmp` VALUES(1, 122, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_group_price`
--

CREATE TABLE `catalog_product_index_group_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';

--
-- Dumping data for table `catalog_product_index_group_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `IDX_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `catalog_product_index_price`
--

INSERT INTO `catalog_product_index_price` VALUES(1, 0, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price` VALUES(1, 1, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price` VALUES(1, 2, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price` VALUES(1, 3, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_idx`
--

CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_price_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_tmp`
--

CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

INSERT INTO `catalog_product_index_price_tmp` VALUES(1, 0, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price_tmp` VALUES(1, 1, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price_tmp` VALUES(1, 2, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);
INSERT INTO `catalog_product_index_price_tmp` VALUES(1, 3, 1, 0, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

--
-- Dumping data for table `catalog_product_index_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` VALUES(1, '2012-07-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

CREATE TABLE `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` VALUES(1, 1, 'position', 'int');
INSERT INTO `catalog_product_link_attribute` VALUES(2, 3, 'position', 'int');
INSERT INTO `catalog_product_link_attribute` VALUES(3, 3, 'qty', 'decimal');
INSERT INTO `catalog_product_link_attribute` VALUES(4, 4, 'position', 'int');
INSERT INTO `catalog_product_link_attribute` VALUES(5, 5, 'position', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_PRODUCT_LINK_ATTRIBUTE_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` VALUES(1, 'relation');
INSERT INTO `catalog_product_link_type` VALUES(3, 'super');
INSERT INTO `catalog_product_link_type` VALUES(4, 'up_sell');
INSERT INTO `catalog_product_link_type` VALUES(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

--
-- Dumping data for table `catalog_product_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `IDX_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) DEFAULT NULL COMMENT 'Value Index',
  `is_percent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID_VAL_IDX_WS_ID` (`product_super_attribute_id`,`value_index`,`website_id`),
  KEY `IDX_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Dumping data for table `catalog_product_website`
--

INSERT INTO `catalog_product_website` VALUES(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `checkout_agreement`
--


-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

--
-- Dumping data for table `checkout_agreement_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Block Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cms_block`
--

INSERT INTO `cms_block` VALUES(1, 'Footer Links', 'footer_links', '<ul>\r\n<li><a href="{{store direct_url="about-magento-demo-store"}}">About Us</a></li>\r\n<li><a href="{{store direct_url="customer-service"}}">Customer Service</a></li>\r\n<li class="last privacy"><a href="{{store direct_url="privacy-policy-cookie-restriction-mode"}}">Privacy Policy</a></li>\r\n</ul>', '2012-07-05 11:51:36', '2012-07-05 11:51:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `IDX_CMS_BLOCK_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Dumping data for table `cms_block_store`
--

INSERT INTO `cms_block_store` VALUES(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `root_template` varchar(255) DEFAULT NULL COMMENT 'Page Template',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  PRIMARY KEY (`page_id`),
  KEY `IDX_CMS_PAGE_IDENTIFIER` (`identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Page Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` VALUES(1, '404 Not Found 1', 'two_columns_right', 'Page keywords', 'Page description', 'no-route', NULL, '<div class="page-title"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class="disc">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class="disc">\r\n<li><a href="#" onclick="history.go(-1); return false;">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href="{{store url=""}}">Store Home</a> <span class="separator">|</span> <a href="{{store url="customer/account"}}">My Account</a></li></ul></dd></dl>\r\n', '2012-07-05 11:51:37', '2012-07-05 11:51:37', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_page` VALUES(2, 'Home page', 'two_columns_right', NULL, NULL, 'home', NULL, '<div class="page-title">\r\n<div class="wp_syntax">\r\n<div class="code">\r\n<pre class="xml" style="font-family: monospace;">{{block type="catalog/product_list" category_id="3" template="catalog/product/list.phtml"}}</pre>\r\n</div>\r\n</div>\r\n</div>', '2012-07-05 11:51:37', '2012-07-17 12:13:31', 1, 0, '<!--<reference name="content">\r\n        <block type="catalog/product_new" name="home.catalog.product.new" alias="product_new" template="catalog/product/new.phtml" after="cms_page">\r\n            <action method="addPriceBlockType">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n        <block type="reports/product_viewed" name="home.reports.product.viewed" alias="product_viewed" template="reports/home_product_viewed.phtml" after="product_new">\r\n            <action method="addPriceBlockType">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n        <block type="reports/product_compared" name="home.reports.product.compared" template="reports/home_product_compared.phtml" after="product_viewed">\r\n            <action method="addPriceBlockType">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n    </reference>\r\n    <reference name="right">\r\n        <action method="unsetChild"><alias>right.reports.product.viewed</alias></action>\r\n        <action method="unsetChild"><alias>right.reports.product.compared</alias></action>\r\n    </reference>-->', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_page` VALUES(3, 'About Us', 'two_columns_right', NULL, NULL, 'about-magento-demo-store', NULL, '<div class="page-title">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class="col3-set">\r\n<div class="col-1"><p><a href="http://www.varien.com/"><img src="{{skin url=''images/media/about_us_img.jpg''}}" title="Varien" alt="Varien" /></a></p><p style="line-height:1.2em;"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style="color:#888; font:1.2em/1.4em georgia, serif;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class="col-2">\r\n<p><strong style="color:#de036f;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class="col-3">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style="color:#de036f;">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class="divider"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style="line-height:1.2em;"><strong style="font:italic 2em Georgia, serif;">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>', '2012-07-05 11:51:37', '2012-07-05 11:51:37', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_page` VALUES(4, 'Customer Service', 'three_columns', NULL, NULL, 'customer-service', NULL, '<div class="page-title">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class="disc">\r\n<li><a href="#answer1">Shipping &amp; Delivery</a></li>\r\n<li><a href="#answer2">Privacy &amp; Security</a></li>\r\n<li><a href="#answer3">Returns &amp; Replacements</a></li>\r\n<li><a href="#answer4">Ordering</a></li>\r\n<li><a href="#answer5">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href="#answer6">Viewing Orders</a></li>\r\n<li><a href="#answer7">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id="answer1">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer2">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer3">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer4">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer5">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer6">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer7">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>', '2012-07-05 11:51:37', '2012-07-05 11:51:37', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_page` VALUES(5, 'Enable Cookies', 'one_column', NULL, NULL, 'enable-cookies', NULL, '<div class="std">\r\n    <ul class="messages">\r\n        <li class="notice-msg">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class="page-title">\r\n        <h1><a name="top"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class="subtitle">Enabling Cookies</h2>\r\n    <ul class="disc">\r\n        <li><a href="#ie7">Internet Explorer 7.x</a></li>\r\n        <li><a href="#ie6">Internet Explorer 6.x</a></li>\r\n        <li><a href="#firefox">Mozilla/Firefox</a></li>\r\n        <li><a href="#opera">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name="ie7"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-2.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-3.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-4.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-5.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-6.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="ie6"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src="{{skin url="images/cookies/ie6-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie6-2.gif"}}" alt="" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="firefox"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/firefox.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="opera"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/opera.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n</div>\r\n', '2012-07-05 11:51:37', '2012-07-05 11:51:37', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_page` VALUES(6, 'Privacy Policy', 'one_column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy Policy', '<p style="color: #ff0000; font-weight: bold; font-size: 13px">\n    Please replace this text with you Privacy Policy.\n    Please add any additional cookies your website uses below (e.g., Google Analytics)\n</p>\n<p>\n    This privacy policy sets out how {{config path="general/store_information/name"}} uses and protects any information\n    that you give {{config path="general/store_information/name"}} when you use this website.\n    {{config path="general/store_information/name"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path="general/store_information/name"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href="#list">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer''s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path="trans_email/ident_general/email"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path="general/store_information/address"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name="list"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class="data-table">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CURRENCY</th>\n            <td>Your preferred currency</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>POLL</th>\n            <td>The ID of any polls you have recently voted in.</td>\n        </tr>\n        <tr>\n            <th>POLLN</th>\n            <td>Information on what polls you have voted on.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>', '2012-07-05 11:51:37', '2012-07-05 11:51:37', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `IDX_CMS_PAGE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` VALUES(1, 0);
INSERT INTO `cms_page_store` VALUES(3, 0);
INSERT INTO `cms_page_store` VALUES(4, 0);
INSERT INTO `cms_page_store` VALUES(5, 0);
INSERT INTO `cms_page_store` VALUES(6, 0);
INSERT INTO `cms_page_store` VALUES(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache`
--

CREATE TABLE `core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `IDX_CORE_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

--
-- Dumping data for table `core_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_cache_option`
--

CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL COMMENT 'Code',
  `value` smallint(6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache Options';

--
-- Dumping data for table `core_cache_option`
--

INSERT INTO `core_cache_option` VALUES('block_html', 0);
INSERT INTO `core_cache_option` VALUES('collections', 0);
INSERT INTO `core_cache_option` VALUES('config', 0);
INSERT INTO `core_cache_option` VALUES('config_api', 0);
INSERT INTO `core_cache_option` VALUES('config_api2', 0);
INSERT INTO `core_cache_option` VALUES('eav', 0);
INSERT INTO `core_cache_option` VALUES('layout', 0);
INSERT INTO `core_cache_option` VALUES('translate', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache_tag`
--

CREATE TABLE `core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `IDX_CORE_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

--
-- Dumping data for table `core_cache_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `UNQ_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Config Data' AUTO_INCREMENT=473 ;

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` VALUES(1, 'default', 0, 'general/region/display_all', '0');
INSERT INTO `core_config_data` VALUES(2, 'default', 0, 'general/region/state_required', 'AT,CA,EE,FI,FR,DE,LV,LT,RO,ES,CH,US');
INSERT INTO `core_config_data` VALUES(3, 'default', 0, 'catalog/category/root_id', '2');
INSERT INTO `core_config_data` VALUES(4, 'default', 0, 'admin/dashboard/enable_charts', '1');
INSERT INTO `core_config_data` VALUES(5, 'default', 0, 'web/unsecure/base_url', 'http://localhost:8888/magento/');
INSERT INTO `core_config_data` VALUES(6, 'default', 0, 'web/secure/base_url', 'http://localhost:8888/magento/');
INSERT INTO `core_config_data` VALUES(7, 'default', 0, 'general/locale/code', 'en_US');
INSERT INTO `core_config_data` VALUES(8, 'default', 0, 'general/locale/timezone', 'America/Los_Angeles');
INSERT INTO `core_config_data` VALUES(9, 'default', 0, 'currency/options/base', 'USD');
INSERT INTO `core_config_data` VALUES(10, 'default', 0, 'currency/options/default', 'USD');
INSERT INTO `core_config_data` VALUES(11, 'default', 0, 'currency/options/allow', 'USD');
INSERT INTO `core_config_data` VALUES(12, 'stores', 1, 'dev/debug/profiler', '0');
INSERT INTO `core_config_data` VALUES(13, 'stores', 1, 'dev/debug/template_hints', '0');
INSERT INTO `core_config_data` VALUES(14, 'stores', 1, 'dev/debug/template_hints_blocks', '0');
INSERT INTO `core_config_data` VALUES(15, 'websites', 1, 'dev/debug/template_hints', '0');
INSERT INTO `core_config_data` VALUES(16, 'websites', 1, 'dev/debug/template_hints_blocks', '0');
INSERT INTO `core_config_data` VALUES(17, 'default', 0, 'currency/options/customsymbol', 'a:1:{s:3:"USD";s:2:"Rs";}');
INSERT INTO `core_config_data` VALUES(18, 'default', 0, 'dev/restrict/allow_ips', NULL);
INSERT INTO `core_config_data` VALUES(19, 'default', 0, 'dev/debug/profiler', '1');
INSERT INTO `core_config_data` VALUES(20, 'default', 0, 'dev/template/allow_symlink', '0');
INSERT INTO `core_config_data` VALUES(21, 'default', 0, 'dev/translate_inline/active', '0');
INSERT INTO `core_config_data` VALUES(22, 'default', 0, 'dev/translate_inline/active_admin', '0');
INSERT INTO `core_config_data` VALUES(23, 'default', 0, 'dev/log/active', '0');
INSERT INTO `core_config_data` VALUES(24, 'default', 0, 'dev/log/file', 'system.log');
INSERT INTO `core_config_data` VALUES(25, 'default', 0, 'dev/log/exception_file', 'exception.log');
INSERT INTO `core_config_data` VALUES(26, 'default', 0, 'dev/js/merge_files', '0');
INSERT INTO `core_config_data` VALUES(27, 'default', 0, 'dev/css/merge_css_files', '0');
INSERT INTO `core_config_data` VALUES(28, 'default', 0, 'paypal/general/merchant_country', 'US');
INSERT INTO `core_config_data` VALUES(29, 'default', 0, 'payment/payflow_advanced/partner', 'PayPal');
INSERT INTO `core_config_data` VALUES(30, 'default', 0, 'payment/payflow_advanced/vendor', 'PayPal');
INSERT INTO `core_config_data` VALUES(31, 'default', 0, 'payment/payflow_advanced/user', 'PayPal');
INSERT INTO `core_config_data` VALUES(32, 'default', 0, 'payment/payflow_advanced/pwd', NULL);
INSERT INTO `core_config_data` VALUES(33, 'default', 0, 'payment/payflow_advanced/sandbox_flag', '0');
INSERT INTO `core_config_data` VALUES(34, 'default', 0, 'payment/payflow_advanced/use_proxy', '0');
INSERT INTO `core_config_data` VALUES(35, 'default', 0, 'paypal/general/business_account', NULL);
INSERT INTO `core_config_data` VALUES(36, 'default', 0, 'paypal/wpp/api_authentication', '0');
INSERT INTO `core_config_data` VALUES(37, 'default', 0, 'paypal/wpp/api_username', NULL);
INSERT INTO `core_config_data` VALUES(38, 'default', 0, 'paypal/wpp/api_password', NULL);
INSERT INTO `core_config_data` VALUES(39, 'default', 0, 'paypal/wpp/api_signature', NULL);
INSERT INTO `core_config_data` VALUES(40, 'default', 0, 'paypal/wpp/sandbox_flag', '0');
INSERT INTO `core_config_data` VALUES(41, 'default', 0, 'paypal/wpp/use_proxy', '0');
INSERT INTO `core_config_data` VALUES(42, 'default', 0, 'payment/payflow_advanced/active', '0');
INSERT INTO `core_config_data` VALUES(43, 'default', 0, 'payment/payflow_advanced/title', 'Credit Card');
INSERT INTO `core_config_data` VALUES(44, 'default', 0, 'payment/payflow_advanced/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(45, 'default', 0, 'payment/payflow_advanced/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(46, 'default', 0, 'payment/payflow_advanced/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(47, 'default', 0, 'payment/payflow_advanced/debug', '0');
INSERT INTO `core_config_data` VALUES(48, 'default', 0, 'payment/payflow_advanced/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(49, 'default', 0, 'payment/payflow_advanced/csc_editable', '1');
INSERT INTO `core_config_data` VALUES(50, 'default', 0, 'payment/payflow_advanced/csc_required', '1');
INSERT INTO `core_config_data` VALUES(51, 'default', 0, 'payment/payflow_advanced/email_confirmation', '0');
INSERT INTO `core_config_data` VALUES(52, 'default', 0, 'payment/payflow_advanced/url_method', 'GET');
INSERT INTO `core_config_data` VALUES(53, 'default', 0, 'payment/paypal_billing_agreement/active', '1');
INSERT INTO `core_config_data` VALUES(54, 'default', 0, 'payment/paypal_billing_agreement/title', 'PayPal Billing Agreement');
INSERT INTO `core_config_data` VALUES(55, 'default', 0, 'payment/paypal_billing_agreement/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(56, 'default', 0, 'payment/paypal_billing_agreement/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(57, 'default', 0, 'payment/paypal_billing_agreement/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(58, 'default', 0, 'payment/paypal_billing_agreement/debug', '0');
INSERT INTO `core_config_data` VALUES(59, 'default', 0, 'payment/paypal_billing_agreement/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(60, 'default', 0, 'payment/paypal_billing_agreement/line_items_enabled', '0');
INSERT INTO `core_config_data` VALUES(61, 'default', 0, 'payment/paypal_billing_agreement/allow_billing_agreement_wizard', '1');
INSERT INTO `core_config_data` VALUES(62, 'default', 0, 'paypal/fetch_reports/ftp_login', NULL);
INSERT INTO `core_config_data` VALUES(63, 'default', 0, 'paypal/fetch_reports/ftp_password', NULL);
INSERT INTO `core_config_data` VALUES(64, 'default', 0, 'paypal/fetch_reports/ftp_sandbox', '0');
INSERT INTO `core_config_data` VALUES(65, 'default', 0, 'paypal/fetch_reports/ftp_ip', NULL);
INSERT INTO `core_config_data` VALUES(66, 'default', 0, 'paypal/fetch_reports/ftp_path', NULL);
INSERT INTO `core_config_data` VALUES(67, 'default', 0, 'paypal/fetch_reports/active', '0');
INSERT INTO `core_config_data` VALUES(68, 'default', 0, 'paypal/fetch_reports/schedule', '1');
INSERT INTO `core_config_data` VALUES(69, 'default', 0, 'paypal/fetch_reports/time', '00,00,00');
INSERT INTO `core_config_data` VALUES(70, 'default', 0, 'paypal/style/logo', 'nowAccepting_150x60');
INSERT INTO `core_config_data` VALUES(71, 'default', 0, 'paypal/style/page_style', NULL);
INSERT INTO `core_config_data` VALUES(72, 'default', 0, 'paypal/style/paypal_hdrimg', NULL);
INSERT INTO `core_config_data` VALUES(73, 'default', 0, 'paypal/style/paypal_hdrbackcolor', NULL);
INSERT INTO `core_config_data` VALUES(74, 'default', 0, 'paypal/style/paypal_hdrbordercolor', NULL);
INSERT INTO `core_config_data` VALUES(75, 'default', 0, 'paypal/style/paypal_payflowcolor', NULL);
INSERT INTO `core_config_data` VALUES(76, 'default', 0, 'payment/paypal_express/title', 'PayPal Express Checkout');
INSERT INTO `core_config_data` VALUES(77, 'default', 0, 'payment/paypal_express/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(78, 'default', 0, 'payment/paypal_express/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(79, 'default', 0, 'payment/paypal_express/visible_on_cart', '1');
INSERT INTO `core_config_data` VALUES(80, 'default', 0, 'payment/paypal_express/visible_on_product', '1');
INSERT INTO `core_config_data` VALUES(81, 'default', 0, 'payment/paypal_express/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(82, 'default', 0, 'payment/paypal_express/debug', '0');
INSERT INTO `core_config_data` VALUES(83, 'default', 0, 'payment/paypal_express/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(84, 'default', 0, 'payment/paypal_express/line_items_enabled', '1');
INSERT INTO `core_config_data` VALUES(85, 'default', 0, 'payment/paypal_express/transfer_shipping_options', '0');
INSERT INTO `core_config_data` VALUES(86, 'default', 0, 'paypal/wpp/button_flavor', 'dynamic');
INSERT INTO `core_config_data` VALUES(87, 'default', 0, 'payment/paypal_express/solution_type', 'Mark');
INSERT INTO `core_config_data` VALUES(88, 'default', 0, 'payment/paypal_express/require_billing_address', '0');
INSERT INTO `core_config_data` VALUES(89, 'default', 0, 'payment/paypal_express/allow_ba_signup', 'never');
INSERT INTO `core_config_data` VALUES(90, 'default', 0, 'payment/paypal_direct/active', '0');
INSERT INTO `core_config_data` VALUES(91, 'default', 0, 'payment/paypal_direct/title', 'PayPal Payments Pro');
INSERT INTO `core_config_data` VALUES(92, 'default', 0, 'payment/paypal_direct/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(93, 'default', 0, 'payment/paypal_direct/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(94, 'default', 0, 'payment/paypal_direct/cctypes', 'VI,MC');
INSERT INTO `core_config_data` VALUES(95, 'default', 0, 'payment/paypal_direct/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(96, 'default', 0, 'payment/paypal_direct/debug', '0');
INSERT INTO `core_config_data` VALUES(97, 'default', 0, 'payment/paypal_direct/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(98, 'default', 0, 'payment/paypal_direct/line_items_enabled', '0');
INSERT INTO `core_config_data` VALUES(99, 'default', 0, 'payment/paypal_direct/useccv', '1');
INSERT INTO `core_config_data` VALUES(100, 'default', 0, 'payment/paypal_direct/centinel', '0');
INSERT INTO `core_config_data` VALUES(101, 'default', 0, 'payment/paypal_standard/active', '0');
INSERT INTO `core_config_data` VALUES(102, 'default', 0, 'payment/paypal_standard/title', 'PayPal Website Payments Standard');
INSERT INTO `core_config_data` VALUES(103, 'default', 0, 'payment/paypal_standard/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(104, 'default', 0, 'payment/paypal_standard/payment_action', 'Sale');
INSERT INTO `core_config_data` VALUES(105, 'default', 0, 'payment/paypal_standard/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(106, 'default', 0, 'payment/paypal_standard/sandbox_flag', '0');
INSERT INTO `core_config_data` VALUES(107, 'default', 0, 'payment/paypal_standard/line_items_enabled', '1');
INSERT INTO `core_config_data` VALUES(108, 'default', 0, 'payment/paypal_standard/debug', '0');
INSERT INTO `core_config_data` VALUES(109, 'default', 0, 'payment/paypal_standard/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(110, 'default', 0, 'payment/verisign/partner', NULL);
INSERT INTO `core_config_data` VALUES(111, 'default', 0, 'payment/verisign/user', NULL);
INSERT INTO `core_config_data` VALUES(112, 'default', 0, 'payment/verisign/vendor', NULL);
INSERT INTO `core_config_data` VALUES(113, 'default', 0, 'payment/verisign/pwd', NULL);
INSERT INTO `core_config_data` VALUES(114, 'default', 0, 'payment/verisign/sandbox_flag', '0');
INSERT INTO `core_config_data` VALUES(115, 'default', 0, 'payment/verisign/use_proxy', '0');
INSERT INTO `core_config_data` VALUES(116, 'default', 0, 'payment/verisign/active', '0');
INSERT INTO `core_config_data` VALUES(117, 'default', 0, 'payment/verisign/title', 'Payflow Pro');
INSERT INTO `core_config_data` VALUES(118, 'default', 0, 'payment/verisign/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(119, 'default', 0, 'payment/verisign/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(120, 'default', 0, 'payment/verisign/cctypes', 'AE,VI');
INSERT INTO `core_config_data` VALUES(121, 'default', 0, 'payment/verisign/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(122, 'default', 0, 'payment/verisign/debug', '0');
INSERT INTO `core_config_data` VALUES(123, 'default', 0, 'payment/verisign/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(124, 'default', 0, 'payment/verisign/useccv', '1');
INSERT INTO `core_config_data` VALUES(125, 'default', 0, 'payment/verisign/centinel', '0');
INSERT INTO `core_config_data` VALUES(126, 'default', 0, 'payment/paypaluk_express/active', '0');
INSERT INTO `core_config_data` VALUES(127, 'default', 0, 'payment/paypaluk_express/title', 'PayPal Express Checkout Payflow Edition');
INSERT INTO `core_config_data` VALUES(128, 'default', 0, 'payment/paypaluk_express/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(129, 'default', 0, 'payment/paypaluk_express/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(130, 'default', 0, 'payment/paypaluk_express/visible_on_cart', '1');
INSERT INTO `core_config_data` VALUES(131, 'default', 0, 'payment/paypaluk_express/visible_on_product', '1');
INSERT INTO `core_config_data` VALUES(132, 'default', 0, 'payment/paypaluk_express/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(133, 'default', 0, 'payment/paypaluk_express/debug', '0');
INSERT INTO `core_config_data` VALUES(134, 'default', 0, 'payment/paypaluk_express/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(135, 'default', 0, 'payment/paypaluk_express/line_items_enabled', '1');
INSERT INTO `core_config_data` VALUES(136, 'default', 0, 'payment/payflow_link/partner', NULL);
INSERT INTO `core_config_data` VALUES(137, 'default', 0, 'payment/payflow_link/vendor', NULL);
INSERT INTO `core_config_data` VALUES(138, 'default', 0, 'payment/payflow_link/user', NULL);
INSERT INTO `core_config_data` VALUES(139, 'default', 0, 'payment/payflow_link/pwd', NULL);
INSERT INTO `core_config_data` VALUES(140, 'default', 0, 'payment/payflow_link/sandbox_flag', '0');
INSERT INTO `core_config_data` VALUES(141, 'default', 0, 'payment/payflow_link/use_proxy', '0');
INSERT INTO `core_config_data` VALUES(142, 'default', 0, 'payment/payflow_link/active', '0');
INSERT INTO `core_config_data` VALUES(143, 'default', 0, 'payment/paypal_express/active', '0');
INSERT INTO `core_config_data` VALUES(144, 'default', 0, 'payment/payflow_link/title', 'Credit Card');
INSERT INTO `core_config_data` VALUES(145, 'default', 0, 'payment/payflow_link/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(146, 'default', 0, 'payment/payflow_link/payment_action', 'Authorization');
INSERT INTO `core_config_data` VALUES(147, 'default', 0, 'payment/payflow_link/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(148, 'default', 0, 'payment/payflow_link/debug', '0');
INSERT INTO `core_config_data` VALUES(149, 'default', 0, 'payment/payflow_link/verify_peer', '1');
INSERT INTO `core_config_data` VALUES(150, 'default', 0, 'payment/payflow_link/csc_editable', '1');
INSERT INTO `core_config_data` VALUES(151, 'default', 0, 'payment/payflow_link/csc_required', '1');
INSERT INTO `core_config_data` VALUES(152, 'default', 0, 'payment/payflow_link/email_confirmation', '0');
INSERT INTO `core_config_data` VALUES(153, 'default', 0, 'payment/payflow_link/url_method', 'GET');
INSERT INTO `core_config_data` VALUES(154, 'default', 0, 'payment/ccsave/active', '0');
INSERT INTO `core_config_data` VALUES(155, 'default', 0, 'payment/ccsave/title', 'Credit Card (saved)');
INSERT INTO `core_config_data` VALUES(156, 'default', 0, 'payment/ccsave/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(157, 'default', 0, 'payment/ccsave/cctypes', 'AE,VI,MC,DI');
INSERT INTO `core_config_data` VALUES(158, 'default', 0, 'payment/ccsave/useccv', '0');
INSERT INTO `core_config_data` VALUES(159, 'default', 0, 'payment/ccsave/centinel', '0');
INSERT INTO `core_config_data` VALUES(160, 'default', 0, 'payment/ccsave/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(161, 'default', 0, 'payment/ccsave/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(162, 'default', 0, 'payment/ccsave/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(163, 'default', 0, 'payment/ccsave/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(164, 'default', 0, 'payment/banktransfer/active', '0');
INSERT INTO `core_config_data` VALUES(165, 'default', 0, 'payment/banktransfer/title', 'Bank Transfer Payment');
INSERT INTO `core_config_data` VALUES(166, 'default', 0, 'payment/banktransfer/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(167, 'default', 0, 'payment/banktransfer/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(168, 'default', 0, 'payment/banktransfer/instructions', NULL);
INSERT INTO `core_config_data` VALUES(169, 'default', 0, 'payment/banktransfer/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(170, 'default', 0, 'payment/banktransfer/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(171, 'default', 0, 'payment/banktransfer/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(172, 'default', 0, 'payment/checkmo/active', '0');
INSERT INTO `core_config_data` VALUES(173, 'default', 0, 'payment/checkmo/title', 'Check / Money order');
INSERT INTO `core_config_data` VALUES(174, 'default', 0, 'payment/checkmo/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(175, 'default', 0, 'payment/checkmo/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(176, 'default', 0, 'payment/checkmo/payable_to', NULL);
INSERT INTO `core_config_data` VALUES(177, 'default', 0, 'payment/checkmo/mailing_address', NULL);
INSERT INTO `core_config_data` VALUES(178, 'default', 0, 'payment/checkmo/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(179, 'default', 0, 'payment/checkmo/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(180, 'default', 0, 'payment/checkmo/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(181, 'default', 0, 'payment/free/title', 'No Payment Information Required');
INSERT INTO `core_config_data` VALUES(182, 'default', 0, 'payment/free/active', '0');
INSERT INTO `core_config_data` VALUES(183, 'default', 0, 'payment/free/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(184, 'default', 0, 'payment/free/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(185, 'default', 0, 'payment/free/sort_order', '1');
INSERT INTO `core_config_data` VALUES(186, 'default', 0, 'payment/cashondelivery/active', '0');
INSERT INTO `core_config_data` VALUES(187, 'default', 0, 'payment/cashondelivery/title', 'Cash On Delivery');
INSERT INTO `core_config_data` VALUES(188, 'default', 0, 'payment/cashondelivery/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(189, 'default', 0, 'payment/cashondelivery/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(190, 'default', 0, 'payment/cashondelivery/instructions', NULL);
INSERT INTO `core_config_data` VALUES(191, 'default', 0, 'payment/cashondelivery/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(192, 'default', 0, 'payment/cashondelivery/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(193, 'default', 0, 'payment/cashondelivery/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(194, 'default', 0, 'payment/purchaseorder/active', '0');
INSERT INTO `core_config_data` VALUES(195, 'default', 0, 'payment/purchaseorder/title', 'Purchase Order');
INSERT INTO `core_config_data` VALUES(196, 'default', 0, 'payment/purchaseorder/order_status', 'pending');
INSERT INTO `core_config_data` VALUES(197, 'default', 0, 'payment/purchaseorder/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(198, 'default', 0, 'payment/purchaseorder/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(199, 'default', 0, 'payment/purchaseorder/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(200, 'default', 0, 'payment/purchaseorder/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(201, 'default', 0, 'payment/authorizenet_directpost/active', '0');
INSERT INTO `core_config_data` VALUES(202, 'default', 0, 'payment/authorizenet_directpost/payment_action', 'authorize');
INSERT INTO `core_config_data` VALUES(203, 'default', 0, 'payment/authorizenet_directpost/title', 'Credit Card Direct Post (Authorize.net)');
INSERT INTO `core_config_data` VALUES(204, 'default', 0, 'payment/authorizenet_directpost/login', NULL);
INSERT INTO `core_config_data` VALUES(205, 'default', 0, 'payment/authorizenet_directpost/trans_key', NULL);
INSERT INTO `core_config_data` VALUES(206, 'default', 0, 'payment/authorizenet_directpost/trans_md5', NULL);
INSERT INTO `core_config_data` VALUES(207, 'default', 0, 'payment/authorizenet_directpost/order_status', 'processing');
INSERT INTO `core_config_data` VALUES(208, 'default', 0, 'payment/authorizenet_directpost/test', '1');
INSERT INTO `core_config_data` VALUES(209, 'default', 0, 'payment/authorizenet_directpost/cgi_url', 'https://secure.authorize.net/gateway/transact.dll');
INSERT INTO `core_config_data` VALUES(210, 'default', 0, 'payment/authorizenet_directpost/currency', 'USD');
INSERT INTO `core_config_data` VALUES(211, 'default', 0, 'payment/authorizenet_directpost/debug', '0');
INSERT INTO `core_config_data` VALUES(212, 'default', 0, 'payment/authorizenet_directpost/email_customer', '0');
INSERT INTO `core_config_data` VALUES(213, 'default', 0, 'payment/authorizenet_directpost/merchant_email', NULL);
INSERT INTO `core_config_data` VALUES(214, 'default', 0, 'payment/authorizenet_directpost/cctypes', 'AE,VI,MC,DI');
INSERT INTO `core_config_data` VALUES(215, 'default', 0, 'payment/authorizenet_directpost/useccv', '0');
INSERT INTO `core_config_data` VALUES(216, 'default', 0, 'payment/authorizenet_directpost/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(217, 'default', 0, 'payment/authorizenet_directpost/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(218, 'default', 0, 'payment/authorizenet_directpost/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(219, 'default', 0, 'payment/authorizenet_directpost/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(220, 'default', 0, 'payment/authorizenet/active', '0');
INSERT INTO `core_config_data` VALUES(221, 'default', 0, 'payment/authorizenet/title', 'Credit Card (Authorize.net)');
INSERT INTO `core_config_data` VALUES(222, 'default', 0, 'payment/authorizenet/login', NULL);
INSERT INTO `core_config_data` VALUES(223, 'default', 0, 'payment/authorizenet/payment_action', 'authorize');
INSERT INTO `core_config_data` VALUES(224, 'default', 0, 'payment/authorizenet/trans_key', NULL);
INSERT INTO `core_config_data` VALUES(225, 'default', 0, 'payment/authorizenet/order_status', 'processing');
INSERT INTO `core_config_data` VALUES(226, 'default', 0, 'payment/authorizenet/test', '1');
INSERT INTO `core_config_data` VALUES(227, 'default', 0, 'payment/authorizenet/cgi_url', 'https://secure.authorize.net/gateway/transact.dll');
INSERT INTO `core_config_data` VALUES(228, 'default', 0, 'payment/authorizenet/currency', 'USD');
INSERT INTO `core_config_data` VALUES(229, 'default', 0, 'payment/authorizenet/debug', '0');
INSERT INTO `core_config_data` VALUES(230, 'default', 0, 'payment/authorizenet/email_customer', '0');
INSERT INTO `core_config_data` VALUES(231, 'default', 0, 'payment/authorizenet/merchant_email', NULL);
INSERT INTO `core_config_data` VALUES(232, 'default', 0, 'payment/authorizenet/cctypes', 'AE,VI,MC,DI');
INSERT INTO `core_config_data` VALUES(233, 'default', 0, 'payment/authorizenet/useccv', '0');
INSERT INTO `core_config_data` VALUES(234, 'default', 0, 'payment/authorizenet/allowspecific', '0');
INSERT INTO `core_config_data` VALUES(235, 'default', 0, 'payment/authorizenet/min_order_total', NULL);
INSERT INTO `core_config_data` VALUES(236, 'default', 0, 'payment/authorizenet/max_order_total', NULL);
INSERT INTO `core_config_data` VALUES(237, 'default', 0, 'payment/authorizenet/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(238, 'default', 0, 'payment/authorizenet/allow_partial_authorization', '0');
INSERT INTO `core_config_data` VALUES(239, 'default', 0, 'payment/authorizenet/centinel', '0');
INSERT INTO `core_config_data` VALUES(240, 'default', 0, 'payment/Ccavanue/active', '0');
INSERT INTO `core_config_data` VALUES(241, 'default', 0, 'payment/Ccavanue/api_key', NULL);
INSERT INTO `core_config_data` VALUES(242, 'default', 0, 'payment/Ccavanue/api_secret', NULL);
INSERT INTO `core_config_data` VALUES(243, 'default', 0, 'payment/Ccavanue/payment_action', 'authorize');
INSERT INTO `core_config_data` VALUES(244, 'default', 0, 'payment/Ccavanue/order_status', NULL);
INSERT INTO `core_config_data` VALUES(245, 'default', 0, 'payment/Ccavanue/title', NULL);
INSERT INTO `core_config_data` VALUES(246, 'default', 0, 'payment/avenues_standard/active', '1');
INSERT INTO `core_config_data` VALUES(247, 'default', 0, 'payment/avenues_standard/title', 'avenues Standard');
INSERT INTO `core_config_data` VALUES(248, 'default', 0, 'payment/avenues_standard/account_id', 'M_dro19479_19479');
INSERT INTO `core_config_data` VALUES(249, 'default', 0, 'payment/avenues_standard/workingkey', '4yasvbucx9hxdijlc7');
INSERT INTO `core_config_data` VALUES(250, 'default', 0, 'web/url/use_store', '0');
INSERT INTO `core_config_data` VALUES(251, 'default', 0, 'web/url/redirect_to_base', '1');
INSERT INTO `core_config_data` VALUES(252, 'default', 0, 'web/seo/use_rewrites', '1');
INSERT INTO `core_config_data` VALUES(253, 'default', 0, 'web/unsecure/base_link_url', '{{unsecure_base_url}}');
INSERT INTO `core_config_data` VALUES(254, 'default', 0, 'web/unsecure/base_skin_url', '{{unsecure_base_url}}skin/');
INSERT INTO `core_config_data` VALUES(255, 'default', 0, 'web/unsecure/base_media_url', '{{unsecure_base_url}}media/');
INSERT INTO `core_config_data` VALUES(256, 'default', 0, 'web/unsecure/base_js_url', '{{unsecure_base_url}}js/');
INSERT INTO `core_config_data` VALUES(257, 'default', 0, 'web/secure/base_link_url', '{{secure_base_url}}');
INSERT INTO `core_config_data` VALUES(258, 'default', 0, 'web/secure/base_skin_url', '{{secure_base_url}}skin/');
INSERT INTO `core_config_data` VALUES(259, 'default', 0, 'web/secure/base_media_url', '{{secure_base_url}}media/');
INSERT INTO `core_config_data` VALUES(260, 'default', 0, 'web/secure/base_js_url', '{{secure_base_url}}js/');
INSERT INTO `core_config_data` VALUES(261, 'default', 0, 'web/secure/use_in_frontend', '0');
INSERT INTO `core_config_data` VALUES(262, 'default', 0, 'web/secure/use_in_adminhtml', '0');
INSERT INTO `core_config_data` VALUES(263, 'default', 0, 'web/secure/offloader_header', 'SSL_OFFLOADED');
INSERT INTO `core_config_data` VALUES(264, 'default', 0, 'web/default/front', 'cms');
INSERT INTO `core_config_data` VALUES(265, 'default', 0, 'web/default/cms_home_page', 'home');
INSERT INTO `core_config_data` VALUES(266, 'default', 0, 'web/default/no_route', 'cms/index/noRoute');
INSERT INTO `core_config_data` VALUES(267, 'default', 0, 'web/default/cms_no_route', 'no-route');
INSERT INTO `core_config_data` VALUES(268, 'default', 0, 'web/default/cms_no_cookies', 'enable-cookies');
INSERT INTO `core_config_data` VALUES(269, 'default', 0, 'web/default/show_cms_breadcrumbs', '1');
INSERT INTO `core_config_data` VALUES(270, 'default', 0, 'web/polls/poll_check_by_ip', '0');
INSERT INTO `core_config_data` VALUES(271, 'default', 0, 'web/cookie/cookie_lifetime', '3600');
INSERT INTO `core_config_data` VALUES(272, 'default', 0, 'web/cookie/cookie_path', NULL);
INSERT INTO `core_config_data` VALUES(273, 'default', 0, 'web/cookie/cookie_domain', NULL);
INSERT INTO `core_config_data` VALUES(274, 'default', 0, 'web/cookie/cookie_httponly', '1');
INSERT INTO `core_config_data` VALUES(275, 'default', 0, 'web/cookie/cookie_restriction', '0');
INSERT INTO `core_config_data` VALUES(276, 'default', 0, 'web/session/use_remote_addr', '0');
INSERT INTO `core_config_data` VALUES(277, 'default', 0, 'web/session/use_http_via', '0');
INSERT INTO `core_config_data` VALUES(278, 'default', 0, 'web/session/use_http_x_forwarded_for', '0');
INSERT INTO `core_config_data` VALUES(279, 'default', 0, 'web/session/use_http_user_agent', '0');
INSERT INTO `core_config_data` VALUES(280, 'default', 0, 'web/session/use_frontend_sid', '1');
INSERT INTO `core_config_data` VALUES(281, 'default', 0, 'web/browser_capabilities/cookies', '1');
INSERT INTO `core_config_data` VALUES(282, 'default', 0, 'web/browser_capabilities/javascript', '1');
INSERT INTO `core_config_data` VALUES(283, 'default', 0, 'carriers/flatrate/active', '0');
INSERT INTO `core_config_data` VALUES(284, 'default', 0, 'carriers/flatrate/title', 'Flat Rate');
INSERT INTO `core_config_data` VALUES(285, 'default', 0, 'carriers/flatrate/name', 'Fixed');
INSERT INTO `core_config_data` VALUES(286, 'default', 0, 'carriers/flatrate/type', 'I');
INSERT INTO `core_config_data` VALUES(287, 'default', 0, 'carriers/flatrate/price', '5.00');
INSERT INTO `core_config_data` VALUES(288, 'default', 0, 'carriers/flatrate/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(289, 'default', 0, 'carriers/flatrate/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(290, 'default', 0, 'carriers/flatrate/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(291, 'default', 0, 'carriers/flatrate/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(292, 'default', 0, 'carriers/flatrate/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(293, 'default', 0, 'carriers/flatrate/showmethod', '0');
INSERT INTO `core_config_data` VALUES(294, 'default', 0, 'carriers/flatrate/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(295, 'default', 0, 'carriers/tablerate/active', '0');
INSERT INTO `core_config_data` VALUES(296, 'default', 0, 'carriers/tablerate/title', 'Best Way');
INSERT INTO `core_config_data` VALUES(297, 'default', 0, 'carriers/tablerate/name', 'Table Rate');
INSERT INTO `core_config_data` VALUES(298, 'default', 0, 'carriers/tablerate/condition_name', 'package_weight');
INSERT INTO `core_config_data` VALUES(299, 'default', 0, 'carriers/tablerate/include_virtual_price', '1');
INSERT INTO `core_config_data` VALUES(300, 'default', 0, 'carriers/tablerate/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(301, 'default', 0, 'carriers/tablerate/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(302, 'default', 0, 'carriers/tablerate/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(303, 'default', 0, 'carriers/tablerate/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(304, 'default', 0, 'carriers/tablerate/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(305, 'default', 0, 'carriers/tablerate/showmethod', '0');
INSERT INTO `core_config_data` VALUES(306, 'default', 0, 'carriers/tablerate/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(307, 'default', 0, 'carriers/freeshipping/active', '0');
INSERT INTO `core_config_data` VALUES(308, 'default', 0, 'carriers/freeshipping/title', 'Free Shipping');
INSERT INTO `core_config_data` VALUES(309, 'default', 0, 'carriers/freeshipping/name', 'Free');
INSERT INTO `core_config_data` VALUES(310, 'default', 0, 'carriers/freeshipping/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(311, 'default', 0, 'carriers/freeshipping/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(312, 'default', 0, 'carriers/freeshipping/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(313, 'default', 0, 'carriers/freeshipping/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(314, 'default', 0, 'carriers/freeshipping/showmethod', '0');
INSERT INTO `core_config_data` VALUES(315, 'default', 0, 'carriers/freeshipping/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(316, 'default', 0, 'carriers/ups/active', '0');
INSERT INTO `core_config_data` VALUES(317, 'default', 0, 'carriers/ups/type', 'UPS');
INSERT INTO `core_config_data` VALUES(318, 'default', 0, 'carriers/ups/password', NULL);
INSERT INTO `core_config_data` VALUES(319, 'default', 0, 'carriers/ups/access_license_number', NULL);
INSERT INTO `core_config_data` VALUES(320, 'default', 0, 'carriers/ups/username', NULL);
INSERT INTO `core_config_data` VALUES(321, 'default', 0, 'carriers/ups/mode_xml', '1');
INSERT INTO `core_config_data` VALUES(322, 'default', 0, 'carriers/ups/gateway_xml_url', 'https://onlinetools.ups.com/ups.app/xml/Rate');
INSERT INTO `core_config_data` VALUES(323, 'default', 0, 'carriers/ups/origin_shipment', 'Shipments Originating in United States');
INSERT INTO `core_config_data` VALUES(324, 'default', 0, 'carriers/ups/negotiated_active', '0');
INSERT INTO `core_config_data` VALUES(325, 'default', 0, 'carriers/ups/title', 'United Parcel Service');
INSERT INTO `core_config_data` VALUES(326, 'default', 0, 'carriers/ups/gateway_url', 'http://www.ups.com/using/services/rave/qcostcgi.cgi');
INSERT INTO `core_config_data` VALUES(327, 'default', 0, 'carriers/ups/shipment_requesttype', '0');
INSERT INTO `core_config_data` VALUES(328, 'default', 0, 'carriers/ups/container', 'CP');
INSERT INTO `core_config_data` VALUES(329, 'default', 0, 'carriers/ups/shipper_number', NULL);
INSERT INTO `core_config_data` VALUES(330, 'default', 0, 'carriers/ups/dest_type', 'RES');
INSERT INTO `core_config_data` VALUES(331, 'default', 0, 'carriers/ups/unit_of_measure', 'LBS');
INSERT INTO `core_config_data` VALUES(332, 'default', 0, 'carriers/ups/tracking_xml_url', 'https://www.ups.com/ups.app/xml/Track');
INSERT INTO `core_config_data` VALUES(333, 'default', 0, 'carriers/ups/max_package_weight', '150');
INSERT INTO `core_config_data` VALUES(334, 'default', 0, 'carriers/ups/pickup', 'CC');
INSERT INTO `core_config_data` VALUES(335, 'default', 0, 'carriers/ups/min_package_weight', '0.1');
INSERT INTO `core_config_data` VALUES(336, 'default', 0, 'carriers/ups/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(337, 'default', 0, 'carriers/ups/handling_action', 'O');
INSERT INTO `core_config_data` VALUES(338, 'default', 0, 'carriers/ups/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(339, 'default', 0, 'carriers/ups/allowed_methods', '1DM,1DML,1DA,1DAL,1DAPI,1DP,1DPL,2DM,2DML,2DA,2DAL,3DS,GND,GNDCOM,GNDRES,STD,XPR,WXS,XPRL,XDM,XDML,XPD');
INSERT INTO `core_config_data` VALUES(340, 'default', 0, 'carriers/ups/free_method', 'GND');
INSERT INTO `core_config_data` VALUES(341, 'default', 0, 'carriers/ups/free_shipping_enable', '0');
INSERT INTO `core_config_data` VALUES(342, 'default', 0, 'carriers/ups/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(343, 'default', 0, 'carriers/ups/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(344, 'default', 0, 'carriers/ups/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(345, 'default', 0, 'carriers/ups/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(346, 'default', 0, 'carriers/ups/showmethod', '0');
INSERT INTO `core_config_data` VALUES(347, 'default', 0, 'carriers/ups/debug', '0');
INSERT INTO `core_config_data` VALUES(348, 'default', 0, 'carriers/ups/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(349, 'default', 0, 'carriers/usps/active', '0');
INSERT INTO `core_config_data` VALUES(350, 'default', 0, 'carriers/usps/gateway_url', 'http://production.shippingapis.com/ShippingAPI.dll');
INSERT INTO `core_config_data` VALUES(351, 'default', 0, 'carriers/usps/gateway_secure_url', 'https://secure.shippingapis.com/ShippingAPI.dll');
INSERT INTO `core_config_data` VALUES(352, 'default', 0, 'carriers/usps/title', 'United States Postal Service');
INSERT INTO `core_config_data` VALUES(353, 'default', 0, 'carriers/usps/userid', NULL);
INSERT INTO `core_config_data` VALUES(354, 'default', 0, 'carriers/usps/password', NULL);
INSERT INTO `core_config_data` VALUES(355, 'default', 0, 'carriers/usps/mode', '0');
INSERT INTO `core_config_data` VALUES(356, 'default', 0, 'carriers/usps/shipment_requesttype', '0');
INSERT INTO `core_config_data` VALUES(357, 'default', 0, 'carriers/usps/container', 'VARIABLE');
INSERT INTO `core_config_data` VALUES(358, 'default', 0, 'carriers/usps/size', 'REGULAR');
INSERT INTO `core_config_data` VALUES(359, 'default', 0, 'carriers/usps/machinable', 'true');
INSERT INTO `core_config_data` VALUES(360, 'default', 0, 'carriers/usps/max_package_weight', '70');
INSERT INTO `core_config_data` VALUES(361, 'default', 0, 'carriers/usps/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(362, 'default', 0, 'carriers/usps/handling_action', 'O');
INSERT INTO `core_config_data` VALUES(363, 'default', 0, 'carriers/usps/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(364, 'default', 0, 'carriers/usps/allowed_methods', 'Bound Printed Matter,Express Mail,Express Mail Flat Rate Envelope,Express Mail Flat Rate Envelope Hold For Pickup,Express Mail Flat-Rate Envelope Sunday/Holiday Guarantee,Express Mail Hold For Pickup,Express Mail International,Express Mail International Flat Rate Envelope,Express Mail PO to PO,Express Mail Sunday/Holiday Guarantee,First-Class Mail International Large Envelope,First-Class Mail International Letters,First-Class Mail International Package,First-Class Mail International Parcel,First-Class,First-Class Mail,First-Class Mail Flat,First-Class Mail Large Envelope,First-Class Mail International,First-Class Mail Letter,First-Class Mail Parcel,First-Class Mail Package,Global Express Guaranteed (GXG),Global Express Guaranteed Non-Document Non-Rectangular,Global Express Guaranteed Non-Document Rectangular,Library Mail,Media Mail,Parcel Post,Priority Mail,Priority Mail Small Flat Rate Box,Priority Mail Medium Flat Rate Box,Priority Mail Large Flat Rate Box,Priority Mail Flat Rate Box,Priority Mail Flat Rate Envelope,Priority Mail International,Priority Mail International Flat Rate Box,Priority Mail International Flat Rate Envelope,Priority Mail International Small Flat Rate Box,Priority Mail International Medium Flat Rate Box,Priority Mail International Large Flat Rate Box,USPS GXG Envelopes');
INSERT INTO `core_config_data` VALUES(365, 'default', 0, 'carriers/usps/free_method', NULL);
INSERT INTO `core_config_data` VALUES(366, 'default', 0, 'carriers/usps/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(367, 'default', 0, 'carriers/usps/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(368, 'default', 0, 'carriers/usps/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(369, 'default', 0, 'carriers/usps/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(370, 'default', 0, 'carriers/usps/debug', '0');
INSERT INTO `core_config_data` VALUES(371, 'default', 0, 'carriers/usps/showmethod', '0');
INSERT INTO `core_config_data` VALUES(372, 'default', 0, 'carriers/usps/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(373, 'default', 0, 'carriers/usps/free_shipping_enable', '0');
INSERT INTO `core_config_data` VALUES(374, 'default', 0, 'carriers/fedex/active', '0');
INSERT INTO `core_config_data` VALUES(375, 'default', 0, 'carriers/fedex/title', 'Federal Express');
INSERT INTO `core_config_data` VALUES(376, 'default', 0, 'carriers/fedex/account', NULL);
INSERT INTO `core_config_data` VALUES(377, 'default', 0, 'carriers/fedex/meter_number', NULL);
INSERT INTO `core_config_data` VALUES(378, 'default', 0, 'carriers/fedex/key', NULL);
INSERT INTO `core_config_data` VALUES(379, 'default', 0, 'carriers/fedex/password', NULL);
INSERT INTO `core_config_data` VALUES(380, 'default', 0, 'carriers/fedex/sandbox_mode', '0');
INSERT INTO `core_config_data` VALUES(381, 'default', 0, 'carriers/fedex/shipment_requesttype', '0');
INSERT INTO `core_config_data` VALUES(382, 'default', 0, 'carriers/fedex/packaging', 'YOUR_PACKAGING');
INSERT INTO `core_config_data` VALUES(383, 'default', 0, 'carriers/fedex/dropoff', 'REGULAR_PICKUP');
INSERT INTO `core_config_data` VALUES(384, 'default', 0, 'carriers/fedex/max_package_weight', '150');
INSERT INTO `core_config_data` VALUES(385, 'default', 0, 'carriers/fedex/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(386, 'default', 0, 'carriers/fedex/handling_action', 'O');
INSERT INTO `core_config_data` VALUES(387, 'default', 0, 'carriers/fedex/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(388, 'default', 0, 'carriers/fedex/residence_delivery', '0');
INSERT INTO `core_config_data` VALUES(389, 'default', 0, 'carriers/fedex/allowed_methods', 'EUROPE_FIRST_INTERNATIONAL_PRIORITY,FEDEX_1_DAY_FREIGHT,FEDEX_2_DAY_FREIGHT,FEDEX_2_DAY,FEDEX_2_DAY_AM,FEDEX_3_DAY_FREIGHT,FEDEX_EXPRESS_SAVER,FEDEX_GROUND,FIRST_OVERNIGHT,GROUND_HOME_DELIVERY,INTERNATIONAL_ECONOMY,INTERNATIONAL_ECONOMY_FREIGHT,INTERNATIONAL_FIRST,INTERNATIONAL_GROUND,INTERNATIONAL_PRIORITY,INTERNATIONAL_PRIORITY_FREIGHT,PRIORITY_OVERNIGHT,SMART_POST,STANDARD_OVERNIGHT,FEDEX_FREIGHT,FEDEX_NATIONAL_FREIGHT');
INSERT INTO `core_config_data` VALUES(390, 'default', 0, 'carriers/fedex/smartpost_hubid', NULL);
INSERT INTO `core_config_data` VALUES(391, 'default', 0, 'carriers/fedex/free_method', 'FEDEX_GROUND');
INSERT INTO `core_config_data` VALUES(392, 'default', 0, 'carriers/fedex/free_shipping_enable', '0');
INSERT INTO `core_config_data` VALUES(393, 'default', 0, 'carriers/fedex/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(394, 'default', 0, 'carriers/fedex/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(395, 'default', 0, 'carriers/fedex/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(396, 'default', 0, 'carriers/fedex/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(397, 'default', 0, 'carriers/fedex/debug', '0');
INSERT INTO `core_config_data` VALUES(398, 'default', 0, 'carriers/fedex/showmethod', '0');
INSERT INTO `core_config_data` VALUES(399, 'default', 0, 'carriers/fedex/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(400, 'default', 0, 'carriers/dhl/active', '0');
INSERT INTO `core_config_data` VALUES(401, 'default', 0, 'carriers/dhl/gateway_url', 'https://eCommerce.airborne.com/ApiLandingTest.asp');
INSERT INTO `core_config_data` VALUES(402, 'default', 0, 'carriers/dhl/title', 'DHL (Deprecated)');
INSERT INTO `core_config_data` VALUES(403, 'default', 0, 'carriers/dhl/id', NULL);
INSERT INTO `core_config_data` VALUES(404, 'default', 0, 'carriers/dhl/password', NULL);
INSERT INTO `core_config_data` VALUES(405, 'default', 0, 'carriers/dhl/account', NULL);
INSERT INTO `core_config_data` VALUES(406, 'default', 0, 'carriers/dhl/shipping_key', NULL);
INSERT INTO `core_config_data` VALUES(407, 'default', 0, 'carriers/dhl/shipping_intlkey', NULL);
INSERT INTO `core_config_data` VALUES(408, 'default', 0, 'carriers/dhl/shipment_requesttype', '0');
INSERT INTO `core_config_data` VALUES(409, 'default', 0, 'carriers/dhl/shipment_type', 'P');
INSERT INTO `core_config_data` VALUES(410, 'default', 0, 'carriers/dhl/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(411, 'default', 0, 'carriers/dhl/handling_action', 'O');
INSERT INTO `core_config_data` VALUES(412, 'default', 0, 'carriers/dhl/contentdesc', 'Big Box');
INSERT INTO `core_config_data` VALUES(413, 'default', 0, 'carriers/dhl/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(414, 'default', 0, 'carriers/dhl/max_package_weight', '150');
INSERT INTO `core_config_data` VALUES(415, 'default', 0, 'carriers/dhl/dutiable', '0');
INSERT INTO `core_config_data` VALUES(416, 'default', 0, 'carriers/dhl/dutypaymenttype', 'R');
INSERT INTO `core_config_data` VALUES(417, 'default', 0, 'carriers/dhl/allowed_methods', 'IE,E SAT,E 10:30AM,E,N,S,G');
INSERT INTO `core_config_data` VALUES(418, 'default', 0, 'carriers/dhl/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(419, 'default', 0, 'carriers/dhl/free_method', 'G');
INSERT INTO `core_config_data` VALUES(420, 'default', 0, 'carriers/dhl/free_shipping_enable', '0');
INSERT INTO `core_config_data` VALUES(421, 'default', 0, 'carriers/dhl/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(422, 'default', 0, 'carriers/dhl/additional_protection_enabled', '0');
INSERT INTO `core_config_data` VALUES(423, 'default', 0, 'carriers/dhl/additional_protection_min_value', NULL);
INSERT INTO `core_config_data` VALUES(424, 'default', 0, 'carriers/dhl/additional_protection_use_subtotal', '0');
INSERT INTO `core_config_data` VALUES(425, 'default', 0, 'carriers/dhl/additional_protection_value', NULL);
INSERT INTO `core_config_data` VALUES(426, 'default', 0, 'carriers/dhl/additional_protection_rounding', '0');
INSERT INTO `core_config_data` VALUES(427, 'default', 0, 'carriers/dhl/hazardous_materials', '0');
INSERT INTO `core_config_data` VALUES(428, 'default', 0, 'carriers/dhl/default_length', NULL);
INSERT INTO `core_config_data` VALUES(429, 'default', 0, 'carriers/dhl/default_width', NULL);
INSERT INTO `core_config_data` VALUES(430, 'default', 0, 'carriers/dhl/default_height', NULL);
INSERT INTO `core_config_data` VALUES(431, 'default', 0, 'carriers/dhl/shipment_days', '1,2,3,4,5,6');
INSERT INTO `core_config_data` VALUES(432, 'default', 0, 'carriers/dhl/intl_shipment_days', '1,2,3,4,5');
INSERT INTO `core_config_data` VALUES(433, 'default', 0, 'carriers/dhl/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(434, 'default', 0, 'carriers/dhl/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(435, 'default', 0, 'carriers/dhl/showmethod', '0');
INSERT INTO `core_config_data` VALUES(436, 'default', 0, 'carriers/dhl/debug', '0');
INSERT INTO `core_config_data` VALUES(437, 'default', 0, 'carriers/dhl/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(438, 'default', 0, 'carriers/dhlint/active', '0');
INSERT INTO `core_config_data` VALUES(439, 'default', 0, 'carriers/dhlint/title', 'DHL');
INSERT INTO `core_config_data` VALUES(440, 'default', 0, 'carriers/dhlint/gateway_url', 'https://xmlpi-ea.dhl.com/XMLShippingServlet');
INSERT INTO `core_config_data` VALUES(441, 'default', 0, 'carriers/dhlint/id', NULL);
INSERT INTO `core_config_data` VALUES(442, 'default', 0, 'carriers/dhlint/password', NULL);
INSERT INTO `core_config_data` VALUES(443, 'default', 0, 'carriers/dhlint/account', NULL);
INSERT INTO `core_config_data` VALUES(444, 'default', 0, 'carriers/dhlint/content_type', 'D');
INSERT INTO `core_config_data` VALUES(445, 'default', 0, 'carriers/dhlint/handling_type', 'F');
INSERT INTO `core_config_data` VALUES(446, 'default', 0, 'carriers/dhlint/handling_action', 'O');
INSERT INTO `core_config_data` VALUES(447, 'default', 0, 'carriers/dhlint/handling_fee', NULL);
INSERT INTO `core_config_data` VALUES(448, 'default', 0, 'carriers/dhlint/divide_order_weight', '1');
INSERT INTO `core_config_data` VALUES(449, 'default', 0, 'carriers/dhlint/unit_of_measure', 'K');
INSERT INTO `core_config_data` VALUES(450, 'default', 0, 'carriers/dhlint/size', '0');
INSERT INTO `core_config_data` VALUES(451, 'default', 0, 'carriers/dhlint/doc_methods', '2,5,6,7,9,B,C,D,U,K,L,G,W,I,N,O,R,S,T,X');
INSERT INTO `core_config_data` VALUES(452, 'default', 0, 'carriers/dhlint/ready_time', NULL);
INSERT INTO `core_config_data` VALUES(453, 'default', 0, 'carriers/dhlint/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.');
INSERT INTO `core_config_data` VALUES(454, 'default', 0, 'carriers/dhlint/free_method_doc', NULL);
INSERT INTO `core_config_data` VALUES(455, 'default', 0, 'carriers/dhlint/free_shipping_enable', '0');
INSERT INTO `core_config_data` VALUES(456, 'default', 0, 'carriers/dhlint/free_shipping_subtotal', NULL);
INSERT INTO `core_config_data` VALUES(457, 'default', 0, 'carriers/dhlint/sallowspecific', '0');
INSERT INTO `core_config_data` VALUES(458, 'default', 0, 'carriers/dhlint/specificcountry', NULL);
INSERT INTO `core_config_data` VALUES(459, 'default', 0, 'carriers/dhlint/showmethod', '0');
INSERT INTO `core_config_data` VALUES(460, 'default', 0, 'carriers/dhlint/debug', '0');
INSERT INTO `core_config_data` VALUES(461, 'default', 0, 'carriers/dhlint/sort_order', NULL);
INSERT INTO `core_config_data` VALUES(462, 'default', 0, 'general/country/default', 'IN');
INSERT INTO `core_config_data` VALUES(463, 'default', 0, 'general/country/allow', 'IN');
INSERT INTO `core_config_data` VALUES(464, 'default', 0, 'general/country/optional_zip_countries', 'HN');
INSERT INTO `core_config_data` VALUES(465, 'default', 0, 'general/country/eu_countries', 'HK');
INSERT INTO `core_config_data` VALUES(466, 'default', 0, 'general/locale/firstday', '0');
INSERT INTO `core_config_data` VALUES(467, 'default', 0, 'general/locale/weekend', '0,6');
INSERT INTO `core_config_data` VALUES(468, 'default', 0, 'general/store_information/name', NULL);
INSERT INTO `core_config_data` VALUES(469, 'default', 0, 'general/store_information/phone', NULL);
INSERT INTO `core_config_data` VALUES(470, 'default', 0, 'general/store_information/merchant_country', NULL);
INSERT INTO `core_config_data` VALUES(471, 'default', 0, 'general/store_information/merchant_vat_number', NULL);
INSERT INTO `core_config_data` VALUES(472, 'default', 0, 'general/store_information/address', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_email_template`
--

CREATE TABLE `core_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `UNQ_CORE_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `IDX_CORE_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_CORE_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_email_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_flag`
--

CREATE TABLE `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `IDX_CORE_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Flag' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_flag`
--

INSERT INTO `core_flag` VALUES(1, 'admin_notification_survey', 0, 'a:1:{s:13:"survey_viewed";b:1;}', '2012-07-05 11:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_link`
--

CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `area` varchar(64) DEFAULT NULL COMMENT 'Area',
  `package` varchar(64) DEFAULT NULL COMMENT 'Package',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `UNQ_CORE_LAYOUT_LINK_STORE_ID_PACKAGE_THEME_LAYOUT_UPDATE_ID` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `IDX_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_layout_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_layout_update`
--

CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`layout_update_id`),
  KEY `IDX_CORE_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_layout_update`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` VALUES('adminnotification_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('admin_setup', '1.6.1.0', '1.6.1.0');
INSERT INTO `core_resource` VALUES('api2_setup', '1.0.0.0', '1.0.0.0');
INSERT INTO `core_resource` VALUES('api_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('avenues_setup', '0.1.0', '0.1.0');
INSERT INTO `core_resource` VALUES('backup_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('bundle_setup', '1.6.0.0.1', '1.6.0.0.1');
INSERT INTO `core_resource` VALUES('captcha_setup', '1.7.0.0.0', '1.7.0.0.0');
INSERT INTO `core_resource` VALUES('catalogindex_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('cataloginventory_setup', '1.6.0.0.2', '1.6.0.0.2');
INSERT INTO `core_resource` VALUES('catalogrule_setup', '1.6.0.3', '1.6.0.3');
INSERT INTO `core_resource` VALUES('catalogsearch_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('catalog_setup', '1.6.0.0.14', '1.6.0.0.14');
INSERT INTO `core_resource` VALUES('checkout_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('cms_setup', '1.6.0.0.1', '1.6.0.0.1');
INSERT INTO `core_resource` VALUES('compiler_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('contacts_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('core_setup', '1.6.0.2', '1.6.0.2');
INSERT INTO `core_resource` VALUES('cron_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('customer_setup', '1.6.2.0.1', '1.6.2.0.1');
INSERT INTO `core_resource` VALUES('dataflow_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('directory_setup', '1.6.0.1', '1.6.0.1');
INSERT INTO `core_resource` VALUES('downloadable_setup', '1.6.0.0.2', '1.6.0.0.2');
INSERT INTO `core_resource` VALUES('eav_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('giftmessage_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('googlecheckout_setup', '1.6.0.1', '1.6.0.1');
INSERT INTO `core_resource` VALUES('importexport_setup', '1.6.0.2', '1.6.0.2');
INSERT INTO `core_resource` VALUES('index_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('log_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('moneybookers_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('newsletter_setup', '1.6.0.1', '1.6.0.1');
INSERT INTO `core_resource` VALUES('oauth_setup', '1.0.0.0', '1.0.0.0');
INSERT INTO `core_resource` VALUES('paygate_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('payment_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('paypaluk_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('paypal_setup', '1.6.0.2', '1.6.0.2');
INSERT INTO `core_resource` VALUES('persistent_setup', '1.0.0.0', '1.0.0.0');
INSERT INTO `core_resource` VALUES('poll_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('productalert_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('rating_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('reports_setup', '1.6.0.0.1', '1.6.0.0.1');
INSERT INTO `core_resource` VALUES('review_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('salesrule_setup', '1.6.0.3', '1.6.0.3');
INSERT INTO `core_resource` VALUES('sales_setup', '1.6.0.7', '1.6.0.7');
INSERT INTO `core_resource` VALUES('sendfriend_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('shipping_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('sitemap_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('tag_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('tax_setup', '1.6.0.3', '1.6.0.3');
INSERT INTO `core_resource` VALUES('usa_setup', '1.6.0.1', '1.6.0.1');
INSERT INTO `core_resource` VALUES('weee_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('widget_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('wishlist_setup', '1.6.0.0', '1.6.0.0');
INSERT INTO `core_resource` VALUES('xmlconnect_setup', '1.6.0.0', '1.6.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `core_session`
--

CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

--
-- Dumping data for table `core_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_store`
--

CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `UNQ_CORE_STORE_CODE` (`code`),
  KEY `IDX_CORE_STORE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CORE_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `IDX_CORE_STORE_GROUP_ID` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_store`
--

INSERT INTO `core_store` VALUES(0, 'admin', 0, 0, 'Admin', 0, 1);
INSERT INTO `core_store` VALUES(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_store_group`
--

CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `IDX_CORE_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `IDX_CORE_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Store Groups' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_store_group`
--

INSERT INTO `core_store_group` VALUES(0, 0, 'Default', 0, 0);
INSERT INTO `core_store_group` VALUES(1, 1, 'Main Website Store', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_translate`
--

CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `UNQ_CORE_TRANSLATE_STORE_ID_LOCALE_STRING` (`store_id`,`locale`,`string`),
  KEY `IDX_CORE_TRANSLATE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_translate`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_url_rewrite`
--

CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `id_path` varchar(255) DEFAULT NULL COMMENT 'Id Path',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `is_system` smallint(5) unsigned DEFAULT '1' COMMENT 'Defines is Rewrite System',
  `options` varchar(255) DEFAULT NULL COMMENT 'Options',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deascription',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_CORE_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_CORE_URL_REWRITE_ID_PATH_IS_SYSTEM_STORE_ID` (`id_path`,`is_system`,`store_id`),
  KEY `IDX_CORE_URL_REWRITE_TARGET_PATH_STORE_ID` (`target_path`,`store_id`),
  KEY `IDX_CORE_URL_REWRITE_ID_PATH` (`id_path`),
  KEY `IDX_CORE_URL_REWRITE_STORE_ID` (`store_id`),
  KEY `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` (`category_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Url Rewrites' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `core_url_rewrite`
--

INSERT INTO `core_url_rewrite` VALUES(1, 1, 'category/3', 't-shirts.html', 'catalog/category/view/id/3', 1, NULL, NULL, 3, NULL);
INSERT INTO `core_url_rewrite` VALUES(2, 1, 'product/1', 'red-t-shirt.html', 'catalog/product/view/id/1', 1, NULL, NULL, NULL, 1);
INSERT INTO `core_url_rewrite` VALUES(3, 1, 'product/1/3', 't-shirts/red-t-shirt.html', 'catalog/product/view/id/1/category/3', 1, NULL, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_variable`
--

CREATE TABLE `core_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_variable`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_variable_value`
--

CREATE TABLE `core_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `IDX_CORE_VARIABLE_VALUE_VARIABLE_ID` (`variable_id`),
  KEY `IDX_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_variable_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_website`
--

CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `UNQ_CORE_WEBSITE_CODE` (`code`),
  KEY `IDX_CORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `IDX_CORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Websites' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_website`
--

INSERT INTO `core_website` VALUES(0, 'admin', 'Admin', 0, 0, 0);
INSERT INTO `core_website` VALUES(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated`
--

CREATE TABLE `coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `coupon_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated_order`
--

CREATE TABLE `coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `coupon_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated_updated`
--

CREATE TABLE `coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Updated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `coupon_aggregated_updated`
--


-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `IDX_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `IDX_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cron_schedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` VALUES(1, 1, NULL, 0, NULL, 1, 10, NULL);
INSERT INTO `customer_eav_attribute` VALUES(2, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(3, 1, NULL, 0, NULL, 1, 20, NULL);
INSERT INTO `customer_eav_attribute` VALUES(4, 0, NULL, 0, NULL, 0, 30, NULL);
INSERT INTO `customer_eav_attribute` VALUES(5, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 40, NULL);
INSERT INTO `customer_eav_attribute` VALUES(6, 0, NULL, 0, NULL, 0, 50, NULL);
INSERT INTO `customer_eav_attribute` VALUES(7, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 60, NULL);
INSERT INTO `customer_eav_attribute` VALUES(8, 0, NULL, 0, NULL, 0, 70, NULL);
INSERT INTO `customer_eav_attribute` VALUES(9, 1, NULL, 0, 'a:1:{s:16:"input_validation";s:5:"email";}', 1, 80, NULL);
INSERT INTO `customer_eav_attribute` VALUES(10, 1, NULL, 0, NULL, 1, 25, NULL);
INSERT INTO `customer_eav_attribute` VALUES(11, 0, 'date', 0, 'a:1:{s:16:"input_validation";s:4:"date";}', 0, 90, NULL);
INSERT INTO `customer_eav_attribute` VALUES(12, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(13, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(14, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(15, 0, NULL, 0, 'a:1:{s:15:"max_text_length";i:255;}', 0, 100, NULL);
INSERT INTO `customer_eav_attribute` VALUES(16, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(17, 0, NULL, 0, NULL, 0, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(18, 0, NULL, 0, 'a:0:{}', 0, 110, NULL);
INSERT INTO `customer_eav_attribute` VALUES(19, 0, NULL, 0, NULL, 0, 10, NULL);
INSERT INTO `customer_eav_attribute` VALUES(20, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 20, NULL);
INSERT INTO `customer_eav_attribute` VALUES(21, 0, NULL, 0, NULL, 0, 30, NULL);
INSERT INTO `customer_eav_attribute` VALUES(22, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 40, NULL);
INSERT INTO `customer_eav_attribute` VALUES(23, 0, NULL, 0, NULL, 0, 50, NULL);
INSERT INTO `customer_eav_attribute` VALUES(24, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 60, NULL);
INSERT INTO `customer_eav_attribute` VALUES(25, 1, NULL, 2, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 70, NULL);
INSERT INTO `customer_eav_attribute` VALUES(26, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 80, NULL);
INSERT INTO `customer_eav_attribute` VALUES(27, 1, NULL, 0, NULL, 1, 90, NULL);
INSERT INTO `customer_eav_attribute` VALUES(28, 1, NULL, 0, NULL, 1, 100, NULL);
INSERT INTO `customer_eav_attribute` VALUES(29, 1, NULL, 0, NULL, 1, 100, NULL);
INSERT INTO `customer_eav_attribute` VALUES(30, 1, NULL, 0, 'a:0:{}', 1, 110, 'customer/attribute_data_postcode');
INSERT INTO `customer_eav_attribute` VALUES(31, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 120, NULL);
INSERT INTO `customer_eav_attribute` VALUES(32, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 130, NULL);
INSERT INTO `customer_eav_attribute` VALUES(33, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(34, 0, NULL, 0, 'a:1:{s:16:"input_validation";s:4:"date";}', 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(35, 1, NULL, 0, NULL, 1, 28, NULL);
INSERT INTO `customer_eav_attribute` VALUES(36, 1, NULL, 0, NULL, 1, 140, NULL);
INSERT INTO `customer_eav_attribute` VALUES(37, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(38, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(39, 0, NULL, 0, NULL, 1, 0, NULL);
INSERT INTO `customer_eav_attribute` VALUES(40, 0, NULL, 0, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute_website`
--

CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

--
-- Dumping data for table `customer_eav_attribute_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `IDX_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `IDX_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_form_attribute`
--

CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 1);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 3);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 4);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 4);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 4);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 4);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 5);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 5);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 5);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 5);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 6);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 6);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 6);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 6);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 7);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 7);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 7);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 7);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 8);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 8);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 8);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 8);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_checkout', 9);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 9);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 9);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 9);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 9);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_checkout', 10);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 10);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_checkout', 11);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 11);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 11);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 11);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 11);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_checkout', 15);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 15);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 15);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 15);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 15);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 17);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 17);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 17);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 17);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_checkout', 18);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 18);
INSERT INTO `customer_form_attribute` VALUES('checkout_register', 18);
INSERT INTO `customer_form_attribute` VALUES('customer_account_create', 18);
INSERT INTO `customer_form_attribute` VALUES('customer_account_edit', 18);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 19);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 19);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 19);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 20);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 20);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 20);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 21);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 21);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 21);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 22);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 22);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 22);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 23);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 23);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 23);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 24);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 24);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 24);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 25);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 25);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 25);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 26);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 26);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 26);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 27);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 27);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 27);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 28);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 28);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 28);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 29);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 29);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 29);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 30);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 30);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 30);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 31);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 31);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 31);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 32);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 32);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 32);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer', 35);
INSERT INTO `customer_form_attribute` VALUES('adminhtml_customer_address', 36);
INSERT INTO `customer_form_attribute` VALUES('customer_address_edit', 36);
INSERT INTO `customer_form_attribute` VALUES('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer Group' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` VALUES(0, 'NOT LOGGED IN', 3);
INSERT INTO `customer_group` VALUES(1, 'General', 3);
INSERT INTO `customer_group` VALUES(2, 'Wholesale', 3);
INSERT INTO `customer_group` VALUES(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch`
--

CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `adapter` varchar(128) DEFAULT NULL COMMENT 'Adapter',
  `params` text COMMENT 'Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`batch_id`),
  KEY `IDX_DATAFLOW_BATCH_PROFILE_ID` (`profile_id`),
  KEY `IDX_DATAFLOW_BATCH_STORE_ID` (`store_id`),
  KEY `IDX_DATAFLOW_BATCH_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_export`
--

CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Export Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_export_id`),
  KEY `IDX_DATAFLOW_BATCH_EXPORT_BATCH_ID` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Export' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch_export`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_import`
--

CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Import Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_import_id`),
  KEY `IDX_DATAFLOW_BATCH_IMPORT_BATCH_ID` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Import' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch_import`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_import_data`
--

CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `serial_number` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial Number',
  `value` text COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`import_id`),
  KEY `IDX_DATAFLOW_IMPORT_DATA_SESSION_ID` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_import_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile`
--

CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `actions_xml` text COMMENT 'Actions Xml',
  `gui_data` text COMMENT 'Gui Data',
  `direction` varchar(6) DEFAULT NULL COMMENT 'Direction',
  `entity_type` varchar(64) DEFAULT NULL COMMENT 'Entity Type',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `data_transfer` varchar(11) DEFAULT NULL COMMENT 'Data Transfer',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dataflow_profile`
--

INSERT INTO `dataflow_profile` VALUES(1, 'Export All Products', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="catalog/convert_adapter_product" method="load">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="catalog/convert_parser_product" method="unparse">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_mapper_column" method="map">\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_parser_csv" method="unparse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_adapter_io" method="save">\\r\\n    <var name="type">file</var>\\r\\n    <var name="path">var/export</var>\\r\\n    <var name="filename"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file');
INSERT INTO `dataflow_profile` VALUES(2, 'Export Product Stocks', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="catalog/convert_adapter_product" method="load">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="catalog/convert_parser_product" method="unparse">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_mapper_column" method="map">\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_parser_csv" method="unparse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_adapter_io" method="save">\\r\\n    <var name="type">file</var>\\r\\n    <var name="path">var/export</var>\\r\\n    <var name="filename"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:25:"export_product_stocks.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:4:"true";s:7:"product";a:2:{s:2:"db";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}s:4:"file";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file');
INSERT INTO `dataflow_profile` VALUES(3, 'Import All Products', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="dataflow/convert_parser_csv" method="parse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n    <var name="adapter">catalog/convert_adapter_product</var>\\r\\n    <var name="method">parse</var>\\r\\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive');
INSERT INTO `dataflow_profile` VALUES(4, 'Import Product Stocks', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="dataflow/convert_parser_csv" method="parse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n    <var name="adapter">catalog/convert_adapter_product</var>\\r\\n    <var name="method">parse</var>\\r\\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:18:"export_product.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive');
INSERT INTO `dataflow_profile` VALUES(5, 'Export Customers', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="customer/convert_adapter_customer" method="load">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n    <var name="filter/adressType"><![CDATA[default_billing]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="customer/convert_parser_customer" method="unparse">\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_mapper_column" method="map">\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_parser_csv" method="unparse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n</action>\\r\\n\\r\\n<action type="dataflow/convert_adapter_io" method="save">\\r\\n    <var name="type">file</var>\\r\\n    <var name="path">var/export</var>\\r\\n    <var name="filename"><![CDATA[export_customers.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:20:"export_customers.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'customer', 0, 'file');
INSERT INTO `dataflow_profile` VALUES(6, 'Import Customers', '2012-07-05 11:51:35', '2012-07-05 11:51:35', '<action type="dataflow/convert_parser_csv" method="parse">\\r\\n    <var name="delimiter"><![CDATA[,]]></var>\\r\\n    <var name="enclose"><![CDATA["]]></var>\\r\\n    <var name="fieldnames">true</var>\\r\\n    <var name="store"><![CDATA[0]]></var>\\r\\n    <var name="adapter">customer/convert_adapter_customer</var>\\r\\n    <var name="method">parse</var>\\r\\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:19:"export_customer.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'customer', 0, 'interactive');

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile_history`
--

CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `action_code` varchar(64) DEFAULT NULL COMMENT 'Action Code',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `performed_at` timestamp NULL DEFAULT NULL COMMENT 'Performed At',
  PRIMARY KEY (`history_id`),
  KEY `IDX_DATAFLOW_PROFILE_HISTORY_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile History' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dataflow_profile_history`
--

INSERT INTO `dataflow_profile_history` VALUES(1, 1, 'create', 0, '2012-07-05 11:51:35');
INSERT INTO `dataflow_profile_history` VALUES(2, 2, 'create', 0, '2012-07-05 11:51:35');
INSERT INTO `dataflow_profile_history` VALUES(3, 3, 'create', 0, '2012-07-05 11:51:35');
INSERT INTO `dataflow_profile_history` VALUES(4, 4, 'create', 0, '2012-07-05 11:51:35');
INSERT INTO `dataflow_profile_history` VALUES(5, 5, 'create', 0, '2012-07-05 11:51:35');
INSERT INTO `dataflow_profile_history` VALUES(6, 6, 'create', 0, '2012-07-05 11:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_session`
--

CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Session Id',
  `user_id` int(11) NOT NULL COMMENT 'User Id',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Created Date',
  `file` varchar(255) DEFAULT NULL COMMENT 'File',
  `type` varchar(32) DEFAULT NULL COMMENT 'Type',
  `direction` varchar(32) DEFAULT NULL COMMENT 'Direction',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Comment',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Session' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `IDX_DESIGN_CHANGE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Design Changes' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `design_change`
--

INSERT INTO `design_change` VALUES(1, 1, 'default/tshirts', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` VALUES('AD', 'AD', 'AND');
INSERT INTO `directory_country` VALUES('AE', 'AE', 'ARE');
INSERT INTO `directory_country` VALUES('AF', 'AF', 'AFG');
INSERT INTO `directory_country` VALUES('AG', 'AG', 'ATG');
INSERT INTO `directory_country` VALUES('AI', 'AI', 'AIA');
INSERT INTO `directory_country` VALUES('AL', 'AL', 'ALB');
INSERT INTO `directory_country` VALUES('AM', 'AM', 'ARM');
INSERT INTO `directory_country` VALUES('AN', 'AN', 'ANT');
INSERT INTO `directory_country` VALUES('AO', 'AO', 'AGO');
INSERT INTO `directory_country` VALUES('AQ', 'AQ', 'ATA');
INSERT INTO `directory_country` VALUES('AR', 'AR', 'ARG');
INSERT INTO `directory_country` VALUES('AS', 'AS', 'ASM');
INSERT INTO `directory_country` VALUES('AT', 'AT', 'AUT');
INSERT INTO `directory_country` VALUES('AU', 'AU', 'AUS');
INSERT INTO `directory_country` VALUES('AW', 'AW', 'ABW');
INSERT INTO `directory_country` VALUES('AX', 'AX', 'ALA');
INSERT INTO `directory_country` VALUES('AZ', 'AZ', 'AZE');
INSERT INTO `directory_country` VALUES('BA', 'BA', 'BIH');
INSERT INTO `directory_country` VALUES('BB', 'BB', 'BRB');
INSERT INTO `directory_country` VALUES('BD', 'BD', 'BGD');
INSERT INTO `directory_country` VALUES('BE', 'BE', 'BEL');
INSERT INTO `directory_country` VALUES('BF', 'BF', 'BFA');
INSERT INTO `directory_country` VALUES('BG', 'BG', 'BGR');
INSERT INTO `directory_country` VALUES('BH', 'BH', 'BHR');
INSERT INTO `directory_country` VALUES('BI', 'BI', 'BDI');
INSERT INTO `directory_country` VALUES('BJ', 'BJ', 'BEN');
INSERT INTO `directory_country` VALUES('BL', 'BL', 'BLM');
INSERT INTO `directory_country` VALUES('BM', 'BM', 'BMU');
INSERT INTO `directory_country` VALUES('BN', 'BN', 'BRN');
INSERT INTO `directory_country` VALUES('BO', 'BO', 'BOL');
INSERT INTO `directory_country` VALUES('BR', 'BR', 'BRA');
INSERT INTO `directory_country` VALUES('BS', 'BS', 'BHS');
INSERT INTO `directory_country` VALUES('BT', 'BT', 'BTN');
INSERT INTO `directory_country` VALUES('BV', 'BV', 'BVT');
INSERT INTO `directory_country` VALUES('BW', 'BW', 'BWA');
INSERT INTO `directory_country` VALUES('BY', 'BY', 'BLR');
INSERT INTO `directory_country` VALUES('BZ', 'BZ', 'BLZ');
INSERT INTO `directory_country` VALUES('CA', 'CA', 'CAN');
INSERT INTO `directory_country` VALUES('CC', 'CC', 'CCK');
INSERT INTO `directory_country` VALUES('CD', 'CD', 'COD');
INSERT INTO `directory_country` VALUES('CF', 'CF', 'CAF');
INSERT INTO `directory_country` VALUES('CG', 'CG', 'COG');
INSERT INTO `directory_country` VALUES('CH', 'CH', 'CHE');
INSERT INTO `directory_country` VALUES('CI', 'CI', 'CIV');
INSERT INTO `directory_country` VALUES('CK', 'CK', 'COK');
INSERT INTO `directory_country` VALUES('CL', 'CL', 'CHL');
INSERT INTO `directory_country` VALUES('CM', 'CM', 'CMR');
INSERT INTO `directory_country` VALUES('CN', 'CN', 'CHN');
INSERT INTO `directory_country` VALUES('CO', 'CO', 'COL');
INSERT INTO `directory_country` VALUES('CR', 'CR', 'CRI');
INSERT INTO `directory_country` VALUES('CU', 'CU', 'CUB');
INSERT INTO `directory_country` VALUES('CV', 'CV', 'CPV');
INSERT INTO `directory_country` VALUES('CX', 'CX', 'CXR');
INSERT INTO `directory_country` VALUES('CY', 'CY', 'CYP');
INSERT INTO `directory_country` VALUES('CZ', 'CZ', 'CZE');
INSERT INTO `directory_country` VALUES('DE', 'DE', 'DEU');
INSERT INTO `directory_country` VALUES('DJ', 'DJ', 'DJI');
INSERT INTO `directory_country` VALUES('DK', 'DK', 'DNK');
INSERT INTO `directory_country` VALUES('DM', 'DM', 'DMA');
INSERT INTO `directory_country` VALUES('DO', 'DO', 'DOM');
INSERT INTO `directory_country` VALUES('DZ', 'DZ', 'DZA');
INSERT INTO `directory_country` VALUES('EC', 'EC', 'ECU');
INSERT INTO `directory_country` VALUES('EE', 'EE', 'EST');
INSERT INTO `directory_country` VALUES('EG', 'EG', 'EGY');
INSERT INTO `directory_country` VALUES('EH', 'EH', 'ESH');
INSERT INTO `directory_country` VALUES('ER', 'ER', 'ERI');
INSERT INTO `directory_country` VALUES('ES', 'ES', 'ESP');
INSERT INTO `directory_country` VALUES('ET', 'ET', 'ETH');
INSERT INTO `directory_country` VALUES('FI', 'FI', 'FIN');
INSERT INTO `directory_country` VALUES('FJ', 'FJ', 'FJI');
INSERT INTO `directory_country` VALUES('FK', 'FK', 'FLK');
INSERT INTO `directory_country` VALUES('FM', 'FM', 'FSM');
INSERT INTO `directory_country` VALUES('FO', 'FO', 'FRO');
INSERT INTO `directory_country` VALUES('FR', 'FR', 'FRA');
INSERT INTO `directory_country` VALUES('GA', 'GA', 'GAB');
INSERT INTO `directory_country` VALUES('GB', 'GB', 'GBR');
INSERT INTO `directory_country` VALUES('GD', 'GD', 'GRD');
INSERT INTO `directory_country` VALUES('GE', 'GE', 'GEO');
INSERT INTO `directory_country` VALUES('GF', 'GF', 'GUF');
INSERT INTO `directory_country` VALUES('GG', 'GG', 'GGY');
INSERT INTO `directory_country` VALUES('GH', 'GH', 'GHA');
INSERT INTO `directory_country` VALUES('GI', 'GI', 'GIB');
INSERT INTO `directory_country` VALUES('GL', 'GL', 'GRL');
INSERT INTO `directory_country` VALUES('GM', 'GM', 'GMB');
INSERT INTO `directory_country` VALUES('GN', 'GN', 'GIN');
INSERT INTO `directory_country` VALUES('GP', 'GP', 'GLP');
INSERT INTO `directory_country` VALUES('GQ', 'GQ', 'GNQ');
INSERT INTO `directory_country` VALUES('GR', 'GR', 'GRC');
INSERT INTO `directory_country` VALUES('GS', 'GS', 'SGS');
INSERT INTO `directory_country` VALUES('GT', 'GT', 'GTM');
INSERT INTO `directory_country` VALUES('GU', 'GU', 'GUM');
INSERT INTO `directory_country` VALUES('GW', 'GW', 'GNB');
INSERT INTO `directory_country` VALUES('GY', 'GY', 'GUY');
INSERT INTO `directory_country` VALUES('HK', 'HK', 'HKG');
INSERT INTO `directory_country` VALUES('HM', 'HM', 'HMD');
INSERT INTO `directory_country` VALUES('HN', 'HN', 'HND');
INSERT INTO `directory_country` VALUES('HR', 'HR', 'HRV');
INSERT INTO `directory_country` VALUES('HT', 'HT', 'HTI');
INSERT INTO `directory_country` VALUES('HU', 'HU', 'HUN');
INSERT INTO `directory_country` VALUES('ID', 'ID', 'IDN');
INSERT INTO `directory_country` VALUES('IE', 'IE', 'IRL');
INSERT INTO `directory_country` VALUES('IL', 'IL', 'ISR');
INSERT INTO `directory_country` VALUES('IM', 'IM', 'IMN');
INSERT INTO `directory_country` VALUES('IN', 'IN', 'IND');
INSERT INTO `directory_country` VALUES('IO', 'IO', 'IOT');
INSERT INTO `directory_country` VALUES('IQ', 'IQ', 'IRQ');
INSERT INTO `directory_country` VALUES('IR', 'IR', 'IRN');
INSERT INTO `directory_country` VALUES('IS', 'IS', 'ISL');
INSERT INTO `directory_country` VALUES('IT', 'IT', 'ITA');
INSERT INTO `directory_country` VALUES('JE', 'JE', 'JEY');
INSERT INTO `directory_country` VALUES('JM', 'JM', 'JAM');
INSERT INTO `directory_country` VALUES('JO', 'JO', 'JOR');
INSERT INTO `directory_country` VALUES('JP', 'JP', 'JPN');
INSERT INTO `directory_country` VALUES('KE', 'KE', 'KEN');
INSERT INTO `directory_country` VALUES('KG', 'KG', 'KGZ');
INSERT INTO `directory_country` VALUES('KH', 'KH', 'KHM');
INSERT INTO `directory_country` VALUES('KI', 'KI', 'KIR');
INSERT INTO `directory_country` VALUES('KM', 'KM', 'COM');
INSERT INTO `directory_country` VALUES('KN', 'KN', 'KNA');
INSERT INTO `directory_country` VALUES('KP', 'KP', 'PRK');
INSERT INTO `directory_country` VALUES('KR', 'KR', 'KOR');
INSERT INTO `directory_country` VALUES('KW', 'KW', 'KWT');
INSERT INTO `directory_country` VALUES('KY', 'KY', 'CYM');
INSERT INTO `directory_country` VALUES('KZ', 'KZ', 'KAZ');
INSERT INTO `directory_country` VALUES('LA', 'LA', 'LAO');
INSERT INTO `directory_country` VALUES('LB', 'LB', 'LBN');
INSERT INTO `directory_country` VALUES('LC', 'LC', 'LCA');
INSERT INTO `directory_country` VALUES('LI', 'LI', 'LIE');
INSERT INTO `directory_country` VALUES('LK', 'LK', 'LKA');
INSERT INTO `directory_country` VALUES('LR', 'LR', 'LBR');
INSERT INTO `directory_country` VALUES('LS', 'LS', 'LSO');
INSERT INTO `directory_country` VALUES('LT', 'LT', 'LTU');
INSERT INTO `directory_country` VALUES('LU', 'LU', 'LUX');
INSERT INTO `directory_country` VALUES('LV', 'LV', 'LVA');
INSERT INTO `directory_country` VALUES('LY', 'LY', 'LBY');
INSERT INTO `directory_country` VALUES('MA', 'MA', 'MAR');
INSERT INTO `directory_country` VALUES('MC', 'MC', 'MCO');
INSERT INTO `directory_country` VALUES('MD', 'MD', 'MDA');
INSERT INTO `directory_country` VALUES('ME', 'ME', 'MNE');
INSERT INTO `directory_country` VALUES('MF', 'MF', 'MAF');
INSERT INTO `directory_country` VALUES('MG', 'MG', 'MDG');
INSERT INTO `directory_country` VALUES('MH', 'MH', 'MHL');
INSERT INTO `directory_country` VALUES('MK', 'MK', 'MKD');
INSERT INTO `directory_country` VALUES('ML', 'ML', 'MLI');
INSERT INTO `directory_country` VALUES('MM', 'MM', 'MMR');
INSERT INTO `directory_country` VALUES('MN', 'MN', 'MNG');
INSERT INTO `directory_country` VALUES('MO', 'MO', 'MAC');
INSERT INTO `directory_country` VALUES('MP', 'MP', 'MNP');
INSERT INTO `directory_country` VALUES('MQ', 'MQ', 'MTQ');
INSERT INTO `directory_country` VALUES('MR', 'MR', 'MRT');
INSERT INTO `directory_country` VALUES('MS', 'MS', 'MSR');
INSERT INTO `directory_country` VALUES('MT', 'MT', 'MLT');
INSERT INTO `directory_country` VALUES('MU', 'MU', 'MUS');
INSERT INTO `directory_country` VALUES('MV', 'MV', 'MDV');
INSERT INTO `directory_country` VALUES('MW', 'MW', 'MWI');
INSERT INTO `directory_country` VALUES('MX', 'MX', 'MEX');
INSERT INTO `directory_country` VALUES('MY', 'MY', 'MYS');
INSERT INTO `directory_country` VALUES('MZ', 'MZ', 'MOZ');
INSERT INTO `directory_country` VALUES('NA', 'NA', 'NAM');
INSERT INTO `directory_country` VALUES('NC', 'NC', 'NCL');
INSERT INTO `directory_country` VALUES('NE', 'NE', 'NER');
INSERT INTO `directory_country` VALUES('NF', 'NF', 'NFK');
INSERT INTO `directory_country` VALUES('NG', 'NG', 'NGA');
INSERT INTO `directory_country` VALUES('NI', 'NI', 'NIC');
INSERT INTO `directory_country` VALUES('NL', 'NL', 'NLD');
INSERT INTO `directory_country` VALUES('NO', 'NO', 'NOR');
INSERT INTO `directory_country` VALUES('NP', 'NP', 'NPL');
INSERT INTO `directory_country` VALUES('NR', 'NR', 'NRU');
INSERT INTO `directory_country` VALUES('NU', 'NU', 'NIU');
INSERT INTO `directory_country` VALUES('NZ', 'NZ', 'NZL');
INSERT INTO `directory_country` VALUES('OM', 'OM', 'OMN');
INSERT INTO `directory_country` VALUES('PA', 'PA', 'PAN');
INSERT INTO `directory_country` VALUES('PE', 'PE', 'PER');
INSERT INTO `directory_country` VALUES('PF', 'PF', 'PYF');
INSERT INTO `directory_country` VALUES('PG', 'PG', 'PNG');
INSERT INTO `directory_country` VALUES('PH', 'PH', 'PHL');
INSERT INTO `directory_country` VALUES('PK', 'PK', 'PAK');
INSERT INTO `directory_country` VALUES('PL', 'PL', 'POL');
INSERT INTO `directory_country` VALUES('PM', 'PM', 'SPM');
INSERT INTO `directory_country` VALUES('PN', 'PN', 'PCN');
INSERT INTO `directory_country` VALUES('PR', 'PR', 'PRI');
INSERT INTO `directory_country` VALUES('PS', 'PS', 'PSE');
INSERT INTO `directory_country` VALUES('PT', 'PT', 'PRT');
INSERT INTO `directory_country` VALUES('PW', 'PW', 'PLW');
INSERT INTO `directory_country` VALUES('PY', 'PY', 'PRY');
INSERT INTO `directory_country` VALUES('QA', 'QA', 'QAT');
INSERT INTO `directory_country` VALUES('RE', 'RE', 'REU');
INSERT INTO `directory_country` VALUES('RO', 'RO', 'ROU');
INSERT INTO `directory_country` VALUES('RS', 'RS', 'SRB');
INSERT INTO `directory_country` VALUES('RU', 'RU', 'RUS');
INSERT INTO `directory_country` VALUES('RW', 'RW', 'RWA');
INSERT INTO `directory_country` VALUES('SA', 'SA', 'SAU');
INSERT INTO `directory_country` VALUES('SB', 'SB', 'SLB');
INSERT INTO `directory_country` VALUES('SC', 'SC', 'SYC');
INSERT INTO `directory_country` VALUES('SD', 'SD', 'SDN');
INSERT INTO `directory_country` VALUES('SE', 'SE', 'SWE');
INSERT INTO `directory_country` VALUES('SG', 'SG', 'SGP');
INSERT INTO `directory_country` VALUES('SH', 'SH', 'SHN');
INSERT INTO `directory_country` VALUES('SI', 'SI', 'SVN');
INSERT INTO `directory_country` VALUES('SJ', 'SJ', 'SJM');
INSERT INTO `directory_country` VALUES('SK', 'SK', 'SVK');
INSERT INTO `directory_country` VALUES('SL', 'SL', 'SLE');
INSERT INTO `directory_country` VALUES('SM', 'SM', 'SMR');
INSERT INTO `directory_country` VALUES('SN', 'SN', 'SEN');
INSERT INTO `directory_country` VALUES('SO', 'SO', 'SOM');
INSERT INTO `directory_country` VALUES('SR', 'SR', 'SUR');
INSERT INTO `directory_country` VALUES('ST', 'ST', 'STP');
INSERT INTO `directory_country` VALUES('SV', 'SV', 'SLV');
INSERT INTO `directory_country` VALUES('SY', 'SY', 'SYR');
INSERT INTO `directory_country` VALUES('SZ', 'SZ', 'SWZ');
INSERT INTO `directory_country` VALUES('TC', 'TC', 'TCA');
INSERT INTO `directory_country` VALUES('TD', 'TD', 'TCD');
INSERT INTO `directory_country` VALUES('TF', 'TF', 'ATF');
INSERT INTO `directory_country` VALUES('TG', 'TG', 'TGO');
INSERT INTO `directory_country` VALUES('TH', 'TH', 'THA');
INSERT INTO `directory_country` VALUES('TJ', 'TJ', 'TJK');
INSERT INTO `directory_country` VALUES('TK', 'TK', 'TKL');
INSERT INTO `directory_country` VALUES('TL', 'TL', 'TLS');
INSERT INTO `directory_country` VALUES('TM', 'TM', 'TKM');
INSERT INTO `directory_country` VALUES('TN', 'TN', 'TUN');
INSERT INTO `directory_country` VALUES('TO', 'TO', 'TON');
INSERT INTO `directory_country` VALUES('TR', 'TR', 'TUR');
INSERT INTO `directory_country` VALUES('TT', 'TT', 'TTO');
INSERT INTO `directory_country` VALUES('TV', 'TV', 'TUV');
INSERT INTO `directory_country` VALUES('TW', 'TW', 'TWN');
INSERT INTO `directory_country` VALUES('TZ', 'TZ', 'TZA');
INSERT INTO `directory_country` VALUES('UA', 'UA', 'UKR');
INSERT INTO `directory_country` VALUES('UG', 'UG', 'UGA');
INSERT INTO `directory_country` VALUES('UM', 'UM', 'UMI');
INSERT INTO `directory_country` VALUES('US', 'US', 'USA');
INSERT INTO `directory_country` VALUES('UY', 'UY', 'URY');
INSERT INTO `directory_country` VALUES('UZ', 'UZ', 'UZB');
INSERT INTO `directory_country` VALUES('VA', 'VA', 'VAT');
INSERT INTO `directory_country` VALUES('VC', 'VC', 'VCT');
INSERT INTO `directory_country` VALUES('VE', 'VE', 'VEN');
INSERT INTO `directory_country` VALUES('VG', 'VG', 'VGB');
INSERT INTO `directory_country` VALUES('VI', 'VI', 'VIR');
INSERT INTO `directory_country` VALUES('VN', 'VN', 'VNM');
INSERT INTO `directory_country` VALUES('VU', 'VU', 'VUT');
INSERT INTO `directory_country` VALUES('WF', 'WF', 'WLF');
INSERT INTO `directory_country` VALUES('WS', 'WS', 'WSM');
INSERT INTO `directory_country` VALUES('YE', 'YE', 'YEM');
INSERT INTO `directory_country` VALUES('YT', 'YT', 'MYT');
INSERT INTO `directory_country` VALUES('ZA', 'ZA', 'ZAF');
INSERT INTO `directory_country` VALUES('ZM', 'ZM', 'ZMB');
INSERT INTO `directory_country` VALUES('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `UNQ_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `directory_country_format`
--


-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

CREATE TABLE `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Directory Country Region' AUTO_INCREMENT=485 ;

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` VALUES(1, 'US', 'AL', 'Alabama');
INSERT INTO `directory_country_region` VALUES(2, 'US', 'AK', 'Alaska');
INSERT INTO `directory_country_region` VALUES(3, 'US', 'AS', 'American Samoa');
INSERT INTO `directory_country_region` VALUES(4, 'US', 'AZ', 'Arizona');
INSERT INTO `directory_country_region` VALUES(5, 'US', 'AR', 'Arkansas');
INSERT INTO `directory_country_region` VALUES(6, 'US', 'AF', 'Armed Forces Africa');
INSERT INTO `directory_country_region` VALUES(7, 'US', 'AA', 'Armed Forces Americas');
INSERT INTO `directory_country_region` VALUES(8, 'US', 'AC', 'Armed Forces Canada');
INSERT INTO `directory_country_region` VALUES(9, 'US', 'AE', 'Armed Forces Europe');
INSERT INTO `directory_country_region` VALUES(10, 'US', 'AM', 'Armed Forces Middle East');
INSERT INTO `directory_country_region` VALUES(11, 'US', 'AP', 'Armed Forces Pacific');
INSERT INTO `directory_country_region` VALUES(12, 'US', 'CA', 'California');
INSERT INTO `directory_country_region` VALUES(13, 'US', 'CO', 'Colorado');
INSERT INTO `directory_country_region` VALUES(14, 'US', 'CT', 'Connecticut');
INSERT INTO `directory_country_region` VALUES(15, 'US', 'DE', 'Delaware');
INSERT INTO `directory_country_region` VALUES(16, 'US', 'DC', 'District of Columbia');
INSERT INTO `directory_country_region` VALUES(17, 'US', 'FM', 'Federated States Of Micronesia');
INSERT INTO `directory_country_region` VALUES(18, 'US', 'FL', 'Florida');
INSERT INTO `directory_country_region` VALUES(19, 'US', 'GA', 'Georgia');
INSERT INTO `directory_country_region` VALUES(20, 'US', 'GU', 'Guam');
INSERT INTO `directory_country_region` VALUES(21, 'US', 'HI', 'Hawaii');
INSERT INTO `directory_country_region` VALUES(22, 'US', 'ID', 'Idaho');
INSERT INTO `directory_country_region` VALUES(23, 'US', 'IL', 'Illinois');
INSERT INTO `directory_country_region` VALUES(24, 'US', 'IN', 'Indiana');
INSERT INTO `directory_country_region` VALUES(25, 'US', 'IA', 'Iowa');
INSERT INTO `directory_country_region` VALUES(26, 'US', 'KS', 'Kansas');
INSERT INTO `directory_country_region` VALUES(27, 'US', 'KY', 'Kentucky');
INSERT INTO `directory_country_region` VALUES(28, 'US', 'LA', 'Louisiana');
INSERT INTO `directory_country_region` VALUES(29, 'US', 'ME', 'Maine');
INSERT INTO `directory_country_region` VALUES(30, 'US', 'MH', 'Marshall Islands');
INSERT INTO `directory_country_region` VALUES(31, 'US', 'MD', 'Maryland');
INSERT INTO `directory_country_region` VALUES(32, 'US', 'MA', 'Massachusetts');
INSERT INTO `directory_country_region` VALUES(33, 'US', 'MI', 'Michigan');
INSERT INTO `directory_country_region` VALUES(34, 'US', 'MN', 'Minnesota');
INSERT INTO `directory_country_region` VALUES(35, 'US', 'MS', 'Mississippi');
INSERT INTO `directory_country_region` VALUES(36, 'US', 'MO', 'Missouri');
INSERT INTO `directory_country_region` VALUES(37, 'US', 'MT', 'Montana');
INSERT INTO `directory_country_region` VALUES(38, 'US', 'NE', 'Nebraska');
INSERT INTO `directory_country_region` VALUES(39, 'US', 'NV', 'Nevada');
INSERT INTO `directory_country_region` VALUES(40, 'US', 'NH', 'New Hampshire');
INSERT INTO `directory_country_region` VALUES(41, 'US', 'NJ', 'New Jersey');
INSERT INTO `directory_country_region` VALUES(42, 'US', 'NM', 'New Mexico');
INSERT INTO `directory_country_region` VALUES(43, 'US', 'NY', 'New York');
INSERT INTO `directory_country_region` VALUES(44, 'US', 'NC', 'North Carolina');
INSERT INTO `directory_country_region` VALUES(45, 'US', 'ND', 'North Dakota');
INSERT INTO `directory_country_region` VALUES(46, 'US', 'MP', 'Northern Mariana Islands');
INSERT INTO `directory_country_region` VALUES(47, 'US', 'OH', 'Ohio');
INSERT INTO `directory_country_region` VALUES(48, 'US', 'OK', 'Oklahoma');
INSERT INTO `directory_country_region` VALUES(49, 'US', 'OR', 'Oregon');
INSERT INTO `directory_country_region` VALUES(50, 'US', 'PW', 'Palau');
INSERT INTO `directory_country_region` VALUES(51, 'US', 'PA', 'Pennsylvania');
INSERT INTO `directory_country_region` VALUES(52, 'US', 'PR', 'Puerto Rico');
INSERT INTO `directory_country_region` VALUES(53, 'US', 'RI', 'Rhode Island');
INSERT INTO `directory_country_region` VALUES(54, 'US', 'SC', 'South Carolina');
INSERT INTO `directory_country_region` VALUES(55, 'US', 'SD', 'South Dakota');
INSERT INTO `directory_country_region` VALUES(56, 'US', 'TN', 'Tennessee');
INSERT INTO `directory_country_region` VALUES(57, 'US', 'TX', 'Texas');
INSERT INTO `directory_country_region` VALUES(58, 'US', 'UT', 'Utah');
INSERT INTO `directory_country_region` VALUES(59, 'US', 'VT', 'Vermont');
INSERT INTO `directory_country_region` VALUES(60, 'US', 'VI', 'Virgin Islands');
INSERT INTO `directory_country_region` VALUES(61, 'US', 'VA', 'Virginia');
INSERT INTO `directory_country_region` VALUES(62, 'US', 'WA', 'Washington');
INSERT INTO `directory_country_region` VALUES(63, 'US', 'WV', 'West Virginia');
INSERT INTO `directory_country_region` VALUES(64, 'US', 'WI', 'Wisconsin');
INSERT INTO `directory_country_region` VALUES(65, 'US', 'WY', 'Wyoming');
INSERT INTO `directory_country_region` VALUES(66, 'CA', 'AB', 'Alberta');
INSERT INTO `directory_country_region` VALUES(67, 'CA', 'BC', 'British Columbia');
INSERT INTO `directory_country_region` VALUES(68, 'CA', 'MB', 'Manitoba');
INSERT INTO `directory_country_region` VALUES(69, 'CA', 'NL', 'Newfoundland and Labrador');
INSERT INTO `directory_country_region` VALUES(70, 'CA', 'NB', 'New Brunswick');
INSERT INTO `directory_country_region` VALUES(71, 'CA', 'NS', 'Nova Scotia');
INSERT INTO `directory_country_region` VALUES(72, 'CA', 'NT', 'Northwest Territories');
INSERT INTO `directory_country_region` VALUES(73, 'CA', 'NU', 'Nunavut');
INSERT INTO `directory_country_region` VALUES(74, 'CA', 'ON', 'Ontario');
INSERT INTO `directory_country_region` VALUES(75, 'CA', 'PE', 'Prince Edward Island');
INSERT INTO `directory_country_region` VALUES(76, 'CA', 'QC', 'Quebec');
INSERT INTO `directory_country_region` VALUES(77, 'CA', 'SK', 'Saskatchewan');
INSERT INTO `directory_country_region` VALUES(78, 'CA', 'YT', 'Yukon Territory');
INSERT INTO `directory_country_region` VALUES(79, 'DE', 'NDS', 'Niedersachsen');
INSERT INTO `directory_country_region` VALUES(80, 'DE', 'BAW', 'Baden-Württemberg');
INSERT INTO `directory_country_region` VALUES(81, 'DE', 'BAY', 'Bayern');
INSERT INTO `directory_country_region` VALUES(82, 'DE', 'BER', 'Berlin');
INSERT INTO `directory_country_region` VALUES(83, 'DE', 'BRG', 'Brandenburg');
INSERT INTO `directory_country_region` VALUES(84, 'DE', 'BRE', 'Bremen');
INSERT INTO `directory_country_region` VALUES(85, 'DE', 'HAM', 'Hamburg');
INSERT INTO `directory_country_region` VALUES(86, 'DE', 'HES', 'Hessen');
INSERT INTO `directory_country_region` VALUES(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `directory_country_region` VALUES(88, 'DE', 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `directory_country_region` VALUES(89, 'DE', 'RHE', 'Rheinland-Pfalz');
INSERT INTO `directory_country_region` VALUES(90, 'DE', 'SAR', 'Saarland');
INSERT INTO `directory_country_region` VALUES(91, 'DE', 'SAS', 'Sachsen');
INSERT INTO `directory_country_region` VALUES(92, 'DE', 'SAC', 'Sachsen-Anhalt');
INSERT INTO `directory_country_region` VALUES(93, 'DE', 'SCN', 'Schleswig-Holstein');
INSERT INTO `directory_country_region` VALUES(94, 'DE', 'THE', 'Thüringen');
INSERT INTO `directory_country_region` VALUES(95, 'AT', 'WI', 'Wien');
INSERT INTO `directory_country_region` VALUES(96, 'AT', 'NO', 'Niederösterreich');
INSERT INTO `directory_country_region` VALUES(97, 'AT', 'OO', 'Oberösterreich');
INSERT INTO `directory_country_region` VALUES(98, 'AT', 'SB', 'Salzburg');
INSERT INTO `directory_country_region` VALUES(99, 'AT', 'KN', 'Kärnten');
INSERT INTO `directory_country_region` VALUES(100, 'AT', 'ST', 'Steiermark');
INSERT INTO `directory_country_region` VALUES(101, 'AT', 'TI', 'Tirol');
INSERT INTO `directory_country_region` VALUES(102, 'AT', 'BL', 'Burgenland');
INSERT INTO `directory_country_region` VALUES(103, 'AT', 'VB', 'Voralberg');
INSERT INTO `directory_country_region` VALUES(104, 'CH', 'AG', 'Aargau');
INSERT INTO `directory_country_region` VALUES(105, 'CH', 'AI', 'Appenzell Innerrhoden');
INSERT INTO `directory_country_region` VALUES(106, 'CH', 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `directory_country_region` VALUES(107, 'CH', 'BE', 'Bern');
INSERT INTO `directory_country_region` VALUES(108, 'CH', 'BL', 'Basel-Landschaft');
INSERT INTO `directory_country_region` VALUES(109, 'CH', 'BS', 'Basel-Stadt');
INSERT INTO `directory_country_region` VALUES(110, 'CH', 'FR', 'Freiburg');
INSERT INTO `directory_country_region` VALUES(111, 'CH', 'GE', 'Genf');
INSERT INTO `directory_country_region` VALUES(112, 'CH', 'GL', 'Glarus');
INSERT INTO `directory_country_region` VALUES(113, 'CH', 'GR', 'Graubünden');
INSERT INTO `directory_country_region` VALUES(114, 'CH', 'JU', 'Jura');
INSERT INTO `directory_country_region` VALUES(115, 'CH', 'LU', 'Luzern');
INSERT INTO `directory_country_region` VALUES(116, 'CH', 'NE', 'Neuenburg');
INSERT INTO `directory_country_region` VALUES(117, 'CH', 'NW', 'Nidwalden');
INSERT INTO `directory_country_region` VALUES(118, 'CH', 'OW', 'Obwalden');
INSERT INTO `directory_country_region` VALUES(119, 'CH', 'SG', 'St. Gallen');
INSERT INTO `directory_country_region` VALUES(120, 'CH', 'SH', 'Schaffhausen');
INSERT INTO `directory_country_region` VALUES(121, 'CH', 'SO', 'Solothurn');
INSERT INTO `directory_country_region` VALUES(122, 'CH', 'SZ', 'Schwyz');
INSERT INTO `directory_country_region` VALUES(123, 'CH', 'TG', 'Thurgau');
INSERT INTO `directory_country_region` VALUES(124, 'CH', 'TI', 'Tessin');
INSERT INTO `directory_country_region` VALUES(125, 'CH', 'UR', 'Uri');
INSERT INTO `directory_country_region` VALUES(126, 'CH', 'VD', 'Waadt');
INSERT INTO `directory_country_region` VALUES(127, 'CH', 'VS', 'Wallis');
INSERT INTO `directory_country_region` VALUES(128, 'CH', 'ZG', 'Zug');
INSERT INTO `directory_country_region` VALUES(129, 'CH', 'ZH', 'Zürich');
INSERT INTO `directory_country_region` VALUES(130, 'ES', 'A Coruсa', 'A Coruña');
INSERT INTO `directory_country_region` VALUES(131, 'ES', 'Alava', 'Alava');
INSERT INTO `directory_country_region` VALUES(132, 'ES', 'Albacete', 'Albacete');
INSERT INTO `directory_country_region` VALUES(133, 'ES', 'Alicante', 'Alicante');
INSERT INTO `directory_country_region` VALUES(134, 'ES', 'Almeria', 'Almeria');
INSERT INTO `directory_country_region` VALUES(135, 'ES', 'Asturias', 'Asturias');
INSERT INTO `directory_country_region` VALUES(136, 'ES', 'Avila', 'Avila');
INSERT INTO `directory_country_region` VALUES(137, 'ES', 'Badajoz', 'Badajoz');
INSERT INTO `directory_country_region` VALUES(138, 'ES', 'Baleares', 'Baleares');
INSERT INTO `directory_country_region` VALUES(139, 'ES', 'Barcelona', 'Barcelona');
INSERT INTO `directory_country_region` VALUES(140, 'ES', 'Burgos', 'Burgos');
INSERT INTO `directory_country_region` VALUES(141, 'ES', 'Caceres', 'Caceres');
INSERT INTO `directory_country_region` VALUES(142, 'ES', 'Cadiz', 'Cadiz');
INSERT INTO `directory_country_region` VALUES(143, 'ES', 'Cantabria', 'Cantabria');
INSERT INTO `directory_country_region` VALUES(144, 'ES', 'Castellon', 'Castellon');
INSERT INTO `directory_country_region` VALUES(145, 'ES', 'Ceuta', 'Ceuta');
INSERT INTO `directory_country_region` VALUES(146, 'ES', 'Ciudad Real', 'Ciudad Real');
INSERT INTO `directory_country_region` VALUES(147, 'ES', 'Cordoba', 'Cordoba');
INSERT INTO `directory_country_region` VALUES(148, 'ES', 'Cuenca', 'Cuenca');
INSERT INTO `directory_country_region` VALUES(149, 'ES', 'Girona', 'Girona');
INSERT INTO `directory_country_region` VALUES(150, 'ES', 'Granada', 'Granada');
INSERT INTO `directory_country_region` VALUES(151, 'ES', 'Guadalajara', 'Guadalajara');
INSERT INTO `directory_country_region` VALUES(152, 'ES', 'Guipuzcoa', 'Guipuzcoa');
INSERT INTO `directory_country_region` VALUES(153, 'ES', 'Huelva', 'Huelva');
INSERT INTO `directory_country_region` VALUES(154, 'ES', 'Huesca', 'Huesca');
INSERT INTO `directory_country_region` VALUES(155, 'ES', 'Jaen', 'Jaen');
INSERT INTO `directory_country_region` VALUES(156, 'ES', 'La Rioja', 'La Rioja');
INSERT INTO `directory_country_region` VALUES(157, 'ES', 'Las Palmas', 'Las Palmas');
INSERT INTO `directory_country_region` VALUES(158, 'ES', 'Leon', 'Leon');
INSERT INTO `directory_country_region` VALUES(159, 'ES', 'Lleida', 'Lleida');
INSERT INTO `directory_country_region` VALUES(160, 'ES', 'Lugo', 'Lugo');
INSERT INTO `directory_country_region` VALUES(161, 'ES', 'Madrid', 'Madrid');
INSERT INTO `directory_country_region` VALUES(162, 'ES', 'Malaga', 'Malaga');
INSERT INTO `directory_country_region` VALUES(163, 'ES', 'Melilla', 'Melilla');
INSERT INTO `directory_country_region` VALUES(164, 'ES', 'Murcia', 'Murcia');
INSERT INTO `directory_country_region` VALUES(165, 'ES', 'Navarra', 'Navarra');
INSERT INTO `directory_country_region` VALUES(166, 'ES', 'Ourense', 'Ourense');
INSERT INTO `directory_country_region` VALUES(167, 'ES', 'Palencia', 'Palencia');
INSERT INTO `directory_country_region` VALUES(168, 'ES', 'Pontevedra', 'Pontevedra');
INSERT INTO `directory_country_region` VALUES(169, 'ES', 'Salamanca', 'Salamanca');
INSERT INTO `directory_country_region` VALUES(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `directory_country_region` VALUES(171, 'ES', 'Segovia', 'Segovia');
INSERT INTO `directory_country_region` VALUES(172, 'ES', 'Sevilla', 'Sevilla');
INSERT INTO `directory_country_region` VALUES(173, 'ES', 'Soria', 'Soria');
INSERT INTO `directory_country_region` VALUES(174, 'ES', 'Tarragona', 'Tarragona');
INSERT INTO `directory_country_region` VALUES(175, 'ES', 'Teruel', 'Teruel');
INSERT INTO `directory_country_region` VALUES(176, 'ES', 'Toledo', 'Toledo');
INSERT INTO `directory_country_region` VALUES(177, 'ES', 'Valencia', 'Valencia');
INSERT INTO `directory_country_region` VALUES(178, 'ES', 'Valladolid', 'Valladolid');
INSERT INTO `directory_country_region` VALUES(179, 'ES', 'Vizcaya', 'Vizcaya');
INSERT INTO `directory_country_region` VALUES(180, 'ES', 'Zamora', 'Zamora');
INSERT INTO `directory_country_region` VALUES(181, 'ES', 'Zaragoza', 'Zaragoza');
INSERT INTO `directory_country_region` VALUES(182, 'FR', '1', 'Ain');
INSERT INTO `directory_country_region` VALUES(183, 'FR', '2', 'Aisne');
INSERT INTO `directory_country_region` VALUES(184, 'FR', '3', 'Allier');
INSERT INTO `directory_country_region` VALUES(185, 'FR', '4', 'Alpes-de-Haute-Provence');
INSERT INTO `directory_country_region` VALUES(186, 'FR', '5', 'Hautes-Alpes');
INSERT INTO `directory_country_region` VALUES(187, 'FR', '6', 'Alpes-Maritimes');
INSERT INTO `directory_country_region` VALUES(188, 'FR', '7', 'Ardèche');
INSERT INTO `directory_country_region` VALUES(189, 'FR', '8', 'Ardennes');
INSERT INTO `directory_country_region` VALUES(190, 'FR', '9', 'Ariège');
INSERT INTO `directory_country_region` VALUES(191, 'FR', '10', 'Aube');
INSERT INTO `directory_country_region` VALUES(192, 'FR', '11', 'Aude');
INSERT INTO `directory_country_region` VALUES(193, 'FR', '12', 'Aveyron');
INSERT INTO `directory_country_region` VALUES(194, 'FR', '13', 'Bouches-du-Rhône');
INSERT INTO `directory_country_region` VALUES(195, 'FR', '14', 'Calvados');
INSERT INTO `directory_country_region` VALUES(196, 'FR', '15', 'Cantal');
INSERT INTO `directory_country_region` VALUES(197, 'FR', '16', 'Charente');
INSERT INTO `directory_country_region` VALUES(198, 'FR', '17', 'Charente-Maritime');
INSERT INTO `directory_country_region` VALUES(199, 'FR', '18', 'Cher');
INSERT INTO `directory_country_region` VALUES(200, 'FR', '19', 'Corrèze');
INSERT INTO `directory_country_region` VALUES(201, 'FR', '2A', 'Corse-du-Sud');
INSERT INTO `directory_country_region` VALUES(202, 'FR', '2B', 'Haute-Corse');
INSERT INTO `directory_country_region` VALUES(203, 'FR', '21', 'Côte-d''Or');
INSERT INTO `directory_country_region` VALUES(204, 'FR', '22', 'Côtes-d''Armor');
INSERT INTO `directory_country_region` VALUES(205, 'FR', '23', 'Creuse');
INSERT INTO `directory_country_region` VALUES(206, 'FR', '24', 'Dordogne');
INSERT INTO `directory_country_region` VALUES(207, 'FR', '25', 'Doubs');
INSERT INTO `directory_country_region` VALUES(208, 'FR', '26', 'Drôme');
INSERT INTO `directory_country_region` VALUES(209, 'FR', '27', 'Eure');
INSERT INTO `directory_country_region` VALUES(210, 'FR', '28', 'Eure-et-Loir');
INSERT INTO `directory_country_region` VALUES(211, 'FR', '29', 'Finistère');
INSERT INTO `directory_country_region` VALUES(212, 'FR', '30', 'Gard');
INSERT INTO `directory_country_region` VALUES(213, 'FR', '31', 'Haute-Garonne');
INSERT INTO `directory_country_region` VALUES(214, 'FR', '32', 'Gers');
INSERT INTO `directory_country_region` VALUES(215, 'FR', '33', 'Gironde');
INSERT INTO `directory_country_region` VALUES(216, 'FR', '34', 'Hérault');
INSERT INTO `directory_country_region` VALUES(217, 'FR', '35', 'Ille-et-Vilaine');
INSERT INTO `directory_country_region` VALUES(218, 'FR', '36', 'Indre');
INSERT INTO `directory_country_region` VALUES(219, 'FR', '37', 'Indre-et-Loire');
INSERT INTO `directory_country_region` VALUES(220, 'FR', '38', 'Isère');
INSERT INTO `directory_country_region` VALUES(221, 'FR', '39', 'Jura');
INSERT INTO `directory_country_region` VALUES(222, 'FR', '40', 'Landes');
INSERT INTO `directory_country_region` VALUES(223, 'FR', '41', 'Loir-et-Cher');
INSERT INTO `directory_country_region` VALUES(224, 'FR', '42', 'Loire');
INSERT INTO `directory_country_region` VALUES(225, 'FR', '43', 'Haute-Loire');
INSERT INTO `directory_country_region` VALUES(226, 'FR', '44', 'Loire-Atlantique');
INSERT INTO `directory_country_region` VALUES(227, 'FR', '45', 'Loiret');
INSERT INTO `directory_country_region` VALUES(228, 'FR', '46', 'Lot');
INSERT INTO `directory_country_region` VALUES(229, 'FR', '47', 'Lot-et-Garonne');
INSERT INTO `directory_country_region` VALUES(230, 'FR', '48', 'Lozère');
INSERT INTO `directory_country_region` VALUES(231, 'FR', '49', 'Maine-et-Loire');
INSERT INTO `directory_country_region` VALUES(232, 'FR', '50', 'Manche');
INSERT INTO `directory_country_region` VALUES(233, 'FR', '51', 'Marne');
INSERT INTO `directory_country_region` VALUES(234, 'FR', '52', 'Haute-Marne');
INSERT INTO `directory_country_region` VALUES(235, 'FR', '53', 'Mayenne');
INSERT INTO `directory_country_region` VALUES(236, 'FR', '54', 'Meurthe-et-Moselle');
INSERT INTO `directory_country_region` VALUES(237, 'FR', '55', 'Meuse');
INSERT INTO `directory_country_region` VALUES(238, 'FR', '56', 'Morbihan');
INSERT INTO `directory_country_region` VALUES(239, 'FR', '57', 'Moselle');
INSERT INTO `directory_country_region` VALUES(240, 'FR', '58', 'Nièvre');
INSERT INTO `directory_country_region` VALUES(241, 'FR', '59', 'Nord');
INSERT INTO `directory_country_region` VALUES(242, 'FR', '60', 'Oise');
INSERT INTO `directory_country_region` VALUES(243, 'FR', '61', 'Orne');
INSERT INTO `directory_country_region` VALUES(244, 'FR', '62', 'Pas-de-Calais');
INSERT INTO `directory_country_region` VALUES(245, 'FR', '63', 'Puy-de-Dôme');
INSERT INTO `directory_country_region` VALUES(246, 'FR', '64', 'Pyrénées-Atlantiques');
INSERT INTO `directory_country_region` VALUES(247, 'FR', '65', 'Hautes-Pyrénées');
INSERT INTO `directory_country_region` VALUES(248, 'FR', '66', 'Pyrénées-Orientales');
INSERT INTO `directory_country_region` VALUES(249, 'FR', '67', 'Bas-Rhin');
INSERT INTO `directory_country_region` VALUES(250, 'FR', '68', 'Haut-Rhin');
INSERT INTO `directory_country_region` VALUES(251, 'FR', '69', 'Rhône');
INSERT INTO `directory_country_region` VALUES(252, 'FR', '70', 'Haute-Saône');
INSERT INTO `directory_country_region` VALUES(253, 'FR', '71', 'Saône-et-Loire');
INSERT INTO `directory_country_region` VALUES(254, 'FR', '72', 'Sarthe');
INSERT INTO `directory_country_region` VALUES(255, 'FR', '73', 'Savoie');
INSERT INTO `directory_country_region` VALUES(256, 'FR', '74', 'Haute-Savoie');
INSERT INTO `directory_country_region` VALUES(257, 'FR', '75', 'Paris');
INSERT INTO `directory_country_region` VALUES(258, 'FR', '76', 'Seine-Maritime');
INSERT INTO `directory_country_region` VALUES(259, 'FR', '77', 'Seine-et-Marne');
INSERT INTO `directory_country_region` VALUES(260, 'FR', '78', 'Yvelines');
INSERT INTO `directory_country_region` VALUES(261, 'FR', '79', 'Deux-Sèvres');
INSERT INTO `directory_country_region` VALUES(262, 'FR', '80', 'Somme');
INSERT INTO `directory_country_region` VALUES(263, 'FR', '81', 'Tarn');
INSERT INTO `directory_country_region` VALUES(264, 'FR', '82', 'Tarn-et-Garonne');
INSERT INTO `directory_country_region` VALUES(265, 'FR', '83', 'Var');
INSERT INTO `directory_country_region` VALUES(266, 'FR', '84', 'Vaucluse');
INSERT INTO `directory_country_region` VALUES(267, 'FR', '85', 'Vendée');
INSERT INTO `directory_country_region` VALUES(268, 'FR', '86', 'Vienne');
INSERT INTO `directory_country_region` VALUES(269, 'FR', '87', 'Haute-Vienne');
INSERT INTO `directory_country_region` VALUES(270, 'FR', '88', 'Vosges');
INSERT INTO `directory_country_region` VALUES(271, 'FR', '89', 'Yonne');
INSERT INTO `directory_country_region` VALUES(272, 'FR', '90', 'Territoire-de-Belfort');
INSERT INTO `directory_country_region` VALUES(273, 'FR', '91', 'Essonne');
INSERT INTO `directory_country_region` VALUES(274, 'FR', '92', 'Hauts-de-Seine');
INSERT INTO `directory_country_region` VALUES(275, 'FR', '93', 'Seine-Saint-Denis');
INSERT INTO `directory_country_region` VALUES(276, 'FR', '94', 'Val-de-Marne');
INSERT INTO `directory_country_region` VALUES(277, 'FR', '95', 'Val-d''Oise');
INSERT INTO `directory_country_region` VALUES(278, 'RO', 'AB', 'Alba');
INSERT INTO `directory_country_region` VALUES(279, 'RO', 'AR', 'Arad');
INSERT INTO `directory_country_region` VALUES(280, 'RO', 'AG', 'Argeş');
INSERT INTO `directory_country_region` VALUES(281, 'RO', 'BC', 'Bacău');
INSERT INTO `directory_country_region` VALUES(282, 'RO', 'BH', 'Bihor');
INSERT INTO `directory_country_region` VALUES(283, 'RO', 'BN', 'Bistriţa-Năsăud');
INSERT INTO `directory_country_region` VALUES(284, 'RO', 'BT', 'Botoşani');
INSERT INTO `directory_country_region` VALUES(285, 'RO', 'BV', 'Braşov');
INSERT INTO `directory_country_region` VALUES(286, 'RO', 'BR', 'Brăila');
INSERT INTO `directory_country_region` VALUES(287, 'RO', 'B', 'Bucureşti');
INSERT INTO `directory_country_region` VALUES(288, 'RO', 'BZ', 'Buzău');
INSERT INTO `directory_country_region` VALUES(289, 'RO', 'CS', 'Caraş-Severin');
INSERT INTO `directory_country_region` VALUES(290, 'RO', 'CL', 'Călăraşi');
INSERT INTO `directory_country_region` VALUES(291, 'RO', 'CJ', 'Cluj');
INSERT INTO `directory_country_region` VALUES(292, 'RO', 'CT', 'Constanţa');
INSERT INTO `directory_country_region` VALUES(293, 'RO', 'CV', 'Covasna');
INSERT INTO `directory_country_region` VALUES(294, 'RO', 'DB', 'Dâmboviţa');
INSERT INTO `directory_country_region` VALUES(295, 'RO', 'DJ', 'Dolj');
INSERT INTO `directory_country_region` VALUES(296, 'RO', 'GL', 'Galaţi');
INSERT INTO `directory_country_region` VALUES(297, 'RO', 'GR', 'Giurgiu');
INSERT INTO `directory_country_region` VALUES(298, 'RO', 'GJ', 'Gorj');
INSERT INTO `directory_country_region` VALUES(299, 'RO', 'HR', 'Harghita');
INSERT INTO `directory_country_region` VALUES(300, 'RO', 'HD', 'Hunedoara');
INSERT INTO `directory_country_region` VALUES(301, 'RO', 'IL', 'Ialomiţa');
INSERT INTO `directory_country_region` VALUES(302, 'RO', 'IS', 'Iaşi');
INSERT INTO `directory_country_region` VALUES(303, 'RO', 'IF', 'Ilfov');
INSERT INTO `directory_country_region` VALUES(304, 'RO', 'MM', 'Maramureş');
INSERT INTO `directory_country_region` VALUES(305, 'RO', 'MH', 'Mehedinţi');
INSERT INTO `directory_country_region` VALUES(306, 'RO', 'MS', 'Mureş');
INSERT INTO `directory_country_region` VALUES(307, 'RO', 'NT', 'Neamţ');
INSERT INTO `directory_country_region` VALUES(308, 'RO', 'OT', 'Olt');
INSERT INTO `directory_country_region` VALUES(309, 'RO', 'PH', 'Prahova');
INSERT INTO `directory_country_region` VALUES(310, 'RO', 'SM', 'Satu-Mare');
INSERT INTO `directory_country_region` VALUES(311, 'RO', 'SJ', 'Sălaj');
INSERT INTO `directory_country_region` VALUES(312, 'RO', 'SB', 'Sibiu');
INSERT INTO `directory_country_region` VALUES(313, 'RO', 'SV', 'Suceava');
INSERT INTO `directory_country_region` VALUES(314, 'RO', 'TR', 'Teleorman');
INSERT INTO `directory_country_region` VALUES(315, 'RO', 'TM', 'Timiş');
INSERT INTO `directory_country_region` VALUES(316, 'RO', 'TL', 'Tulcea');
INSERT INTO `directory_country_region` VALUES(317, 'RO', 'VS', 'Vaslui');
INSERT INTO `directory_country_region` VALUES(318, 'RO', 'VL', 'Vâlcea');
INSERT INTO `directory_country_region` VALUES(319, 'RO', 'VN', 'Vrancea');
INSERT INTO `directory_country_region` VALUES(320, 'FI', 'Lappi', 'Lappi');
INSERT INTO `directory_country_region` VALUES(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa');
INSERT INTO `directory_country_region` VALUES(322, 'FI', 'Kainuu', 'Kainuu');
INSERT INTO `directory_country_region` VALUES(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala');
INSERT INTO `directory_country_region` VALUES(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo');
INSERT INTO `directory_country_region` VALUES(325, 'FI', 'Etelä-Savo', 'Etelä-Savo');
INSERT INTO `directory_country_region` VALUES(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa');
INSERT INTO `directory_country_region` VALUES(327, 'FI', 'Pohjanmaa', 'Pohjanmaa');
INSERT INTO `directory_country_region` VALUES(328, 'FI', 'Pirkanmaa', 'Pirkanmaa');
INSERT INTO `directory_country_region` VALUES(329, 'FI', 'Satakunta', 'Satakunta');
INSERT INTO `directory_country_region` VALUES(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa');
INSERT INTO `directory_country_region` VALUES(331, 'FI', 'Keski-Suomi', 'Keski-Suomi');
INSERT INTO `directory_country_region` VALUES(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi');
INSERT INTO `directory_country_region` VALUES(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala');
INSERT INTO `directory_country_region` VALUES(334, 'FI', 'Päijät-Häme', 'Päijät-Häme');
INSERT INTO `directory_country_region` VALUES(335, 'FI', 'Kanta-Häme', 'Kanta-Häme');
INSERT INTO `directory_country_region` VALUES(336, 'FI', 'Uusimaa', 'Uusimaa');
INSERT INTO `directory_country_region` VALUES(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa');
INSERT INTO `directory_country_region` VALUES(338, 'FI', 'Kymenlaakso', 'Kymenlaakso');
INSERT INTO `directory_country_region` VALUES(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa');
INSERT INTO `directory_country_region` VALUES(340, 'EE', 'EE-37', 'Harjumaa');
INSERT INTO `directory_country_region` VALUES(341, 'EE', 'EE-39', 'Hiiumaa');
INSERT INTO `directory_country_region` VALUES(342, 'EE', 'EE-44', 'Ida-Virumaa');
INSERT INTO `directory_country_region` VALUES(343, 'EE', 'EE-49', 'Jõgevamaa');
INSERT INTO `directory_country_region` VALUES(344, 'EE', 'EE-51', 'Järvamaa');
INSERT INTO `directory_country_region` VALUES(345, 'EE', 'EE-57', 'Läänemaa');
INSERT INTO `directory_country_region` VALUES(346, 'EE', 'EE-59', 'Lääne-Virumaa');
INSERT INTO `directory_country_region` VALUES(347, 'EE', 'EE-65', 'Põlvamaa');
INSERT INTO `directory_country_region` VALUES(348, 'EE', 'EE-67', 'Pärnumaa');
INSERT INTO `directory_country_region` VALUES(349, 'EE', 'EE-70', 'Raplamaa');
INSERT INTO `directory_country_region` VALUES(350, 'EE', 'EE-74', 'Saaremaa');
INSERT INTO `directory_country_region` VALUES(351, 'EE', 'EE-78', 'Tartumaa');
INSERT INTO `directory_country_region` VALUES(352, 'EE', 'EE-82', 'Valgamaa');
INSERT INTO `directory_country_region` VALUES(353, 'EE', 'EE-84', 'Viljandimaa');
INSERT INTO `directory_country_region` VALUES(354, 'EE', 'EE-86', 'Võrumaa');
INSERT INTO `directory_country_region` VALUES(355, 'LV', 'LV-DGV', 'Daugavpils');
INSERT INTO `directory_country_region` VALUES(356, 'LV', 'LV-JEL', 'Jelgava');
INSERT INTO `directory_country_region` VALUES(357, 'LV', 'Jēkabpils', 'Jēkabpils');
INSERT INTO `directory_country_region` VALUES(358, 'LV', 'LV-JUR', 'Jūrmala');
INSERT INTO `directory_country_region` VALUES(359, 'LV', 'LV-LPX', 'Liepāja');
INSERT INTO `directory_country_region` VALUES(360, 'LV', 'LV-LE', 'Liepājas novads');
INSERT INTO `directory_country_region` VALUES(361, 'LV', 'LV-REZ', 'Rēzekne');
INSERT INTO `directory_country_region` VALUES(362, 'LV', 'LV-RIX', 'Rīga');
INSERT INTO `directory_country_region` VALUES(363, 'LV', 'LV-RI', 'Rīgas novads');
INSERT INTO `directory_country_region` VALUES(364, 'LV', 'Valmiera', 'Valmiera');
INSERT INTO `directory_country_region` VALUES(365, 'LV', 'LV-VEN', 'Ventspils');
INSERT INTO `directory_country_region` VALUES(366, 'LV', 'Aglonas novads', 'Aglonas novads');
INSERT INTO `directory_country_region` VALUES(367, 'LV', 'LV-AI', 'Aizkraukles novads');
INSERT INTO `directory_country_region` VALUES(368, 'LV', 'Aizputes novads', 'Aizputes novads');
INSERT INTO `directory_country_region` VALUES(369, 'LV', 'Aknīstes novads', 'Aknīstes novads');
INSERT INTO `directory_country_region` VALUES(370, 'LV', 'Alojas novads', 'Alojas novads');
INSERT INTO `directory_country_region` VALUES(371, 'LV', 'Alsungas novads', 'Alsungas novads');
INSERT INTO `directory_country_region` VALUES(372, 'LV', 'LV-AL', 'Alūksnes novads');
INSERT INTO `directory_country_region` VALUES(373, 'LV', 'Amatas novads', 'Amatas novads');
INSERT INTO `directory_country_region` VALUES(374, 'LV', 'Apes novads', 'Apes novads');
INSERT INTO `directory_country_region` VALUES(375, 'LV', 'Auces novads', 'Auces novads');
INSERT INTO `directory_country_region` VALUES(376, 'LV', 'Babītes novads', 'Babītes novads');
INSERT INTO `directory_country_region` VALUES(377, 'LV', 'Baldones novads', 'Baldones novads');
INSERT INTO `directory_country_region` VALUES(378, 'LV', 'Baltinavas novads', 'Baltinavas novads');
INSERT INTO `directory_country_region` VALUES(379, 'LV', 'LV-BL', 'Balvu novads');
INSERT INTO `directory_country_region` VALUES(380, 'LV', 'LV-BU', 'Bauskas novads');
INSERT INTO `directory_country_region` VALUES(381, 'LV', 'Beverīnas novads', 'Beverīnas novads');
INSERT INTO `directory_country_region` VALUES(382, 'LV', 'Brocēnu novads', 'Brocēnu novads');
INSERT INTO `directory_country_region` VALUES(383, 'LV', 'Burtnieku novads', 'Burtnieku novads');
INSERT INTO `directory_country_region` VALUES(384, 'LV', 'Carnikavas novads', 'Carnikavas novads');
INSERT INTO `directory_country_region` VALUES(385, 'LV', 'Cesvaines novads', 'Cesvaines novads');
INSERT INTO `directory_country_region` VALUES(386, 'LV', 'Ciblas novads', 'Ciblas novads');
INSERT INTO `directory_country_region` VALUES(387, 'LV', 'LV-CE', 'Cēsu novads');
INSERT INTO `directory_country_region` VALUES(388, 'LV', 'Dagdas novads', 'Dagdas novads');
INSERT INTO `directory_country_region` VALUES(389, 'LV', 'LV-DA', 'Daugavpils novads');
INSERT INTO `directory_country_region` VALUES(390, 'LV', 'LV-DO', 'Dobeles novads');
INSERT INTO `directory_country_region` VALUES(391, 'LV', 'Dundagas novads', 'Dundagas novads');
INSERT INTO `directory_country_region` VALUES(392, 'LV', 'Durbes novads', 'Durbes novads');
INSERT INTO `directory_country_region` VALUES(393, 'LV', 'Engures novads', 'Engures novads');
INSERT INTO `directory_country_region` VALUES(394, 'LV', 'Garkalnes novads', 'Garkalnes novads');
INSERT INTO `directory_country_region` VALUES(395, 'LV', 'Grobiņas novads', 'Grobiņas novads');
INSERT INTO `directory_country_region` VALUES(396, 'LV', 'LV-GU', 'Gulbenes novads');
INSERT INTO `directory_country_region` VALUES(397, 'LV', 'Iecavas novads', 'Iecavas novads');
INSERT INTO `directory_country_region` VALUES(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads');
INSERT INTO `directory_country_region` VALUES(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads');
INSERT INTO `directory_country_region` VALUES(400, 'LV', 'Inčukalna novads', 'Inčukalna novads');
INSERT INTO `directory_country_region` VALUES(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads');
INSERT INTO `directory_country_region` VALUES(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads');
INSERT INTO `directory_country_region` VALUES(403, 'LV', 'Jaunpils novads', 'Jaunpils novads');
INSERT INTO `directory_country_region` VALUES(404, 'LV', 'LV-JL', 'Jelgavas novads');
INSERT INTO `directory_country_region` VALUES(405, 'LV', 'LV-JK', 'Jēkabpils novads');
INSERT INTO `directory_country_region` VALUES(406, 'LV', 'Kandavas novads', 'Kandavas novads');
INSERT INTO `directory_country_region` VALUES(407, 'LV', 'Kokneses novads', 'Kokneses novads');
INSERT INTO `directory_country_region` VALUES(408, 'LV', 'Krimuldas novads', 'Krimuldas novads');
INSERT INTO `directory_country_region` VALUES(409, 'LV', 'Krustpils novads', 'Krustpils novads');
INSERT INTO `directory_country_region` VALUES(410, 'LV', 'LV-KR', 'Krāslavas novads');
INSERT INTO `directory_country_region` VALUES(411, 'LV', 'LV-KU', 'Kuldīgas novads');
INSERT INTO `directory_country_region` VALUES(412, 'LV', 'Kārsavas novads', 'Kārsavas novads');
INSERT INTO `directory_country_region` VALUES(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads');
INSERT INTO `directory_country_region` VALUES(414, 'LV', 'LV-LM', 'Limbažu novads');
INSERT INTO `directory_country_region` VALUES(415, 'LV', 'Lubānas novads', 'Lubānas novads');
INSERT INTO `directory_country_region` VALUES(416, 'LV', 'LV-LU', 'Ludzas novads');
INSERT INTO `directory_country_region` VALUES(417, 'LV', 'Līgatnes novads', 'Līgatnes novads');
INSERT INTO `directory_country_region` VALUES(418, 'LV', 'Līvānu novads', 'Līvānu novads');
INSERT INTO `directory_country_region` VALUES(419, 'LV', 'LV-MA', 'Madonas novads');
INSERT INTO `directory_country_region` VALUES(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads');
INSERT INTO `directory_country_region` VALUES(421, 'LV', 'Mālpils novads', 'Mālpils novads');
INSERT INTO `directory_country_region` VALUES(422, 'LV', 'Mārupes novads', 'Mārupes novads');
INSERT INTO `directory_country_region` VALUES(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads');
INSERT INTO `directory_country_region` VALUES(424, 'LV', 'Neretas novads', 'Neretas novads');
INSERT INTO `directory_country_region` VALUES(425, 'LV', 'Nīcas novads', 'Nīcas novads');
INSERT INTO `directory_country_region` VALUES(426, 'LV', 'LV-OG', 'Ogres novads');
INSERT INTO `directory_country_region` VALUES(427, 'LV', 'Olaines novads', 'Olaines novads');
INSERT INTO `directory_country_region` VALUES(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads');
INSERT INTO `directory_country_region` VALUES(429, 'LV', 'LV-PR', 'Preiļu novads');
INSERT INTO `directory_country_region` VALUES(430, 'LV', 'Priekules novads', 'Priekules novads');
INSERT INTO `directory_country_region` VALUES(431, 'LV', 'Priekuļu novads', 'Priekuļu novads');
INSERT INTO `directory_country_region` VALUES(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads');
INSERT INTO `directory_country_region` VALUES(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads');
INSERT INTO `directory_country_region` VALUES(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads');
INSERT INTO `directory_country_region` VALUES(435, 'LV', 'Raunas novads', 'Raunas novads');
INSERT INTO `directory_country_region` VALUES(436, 'LV', 'Riebiņu novads', 'Riebiņu novads');
INSERT INTO `directory_country_region` VALUES(437, 'LV', 'Rojas novads', 'Rojas novads');
INSERT INTO `directory_country_region` VALUES(438, 'LV', 'Ropažu novads', 'Ropažu novads');
INSERT INTO `directory_country_region` VALUES(439, 'LV', 'Rucavas novads', 'Rucavas novads');
INSERT INTO `directory_country_region` VALUES(440, 'LV', 'Rugāju novads', 'Rugāju novads');
INSERT INTO `directory_country_region` VALUES(441, 'LV', 'Rundāles novads', 'Rundāles novads');
INSERT INTO `directory_country_region` VALUES(442, 'LV', 'LV-RE', 'Rēzeknes novads');
INSERT INTO `directory_country_region` VALUES(443, 'LV', 'Rūjienas novads', 'Rūjienas novads');
INSERT INTO `directory_country_region` VALUES(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads');
INSERT INTO `directory_country_region` VALUES(445, 'LV', 'Salas novads', 'Salas novads');
INSERT INTO `directory_country_region` VALUES(446, 'LV', 'Salaspils novads', 'Salaspils novads');
INSERT INTO `directory_country_region` VALUES(447, 'LV', 'LV-SA', 'Saldus novads');
INSERT INTO `directory_country_region` VALUES(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads');
INSERT INTO `directory_country_region` VALUES(449, 'LV', 'Siguldas novads', 'Siguldas novads');
INSERT INTO `directory_country_region` VALUES(450, 'LV', 'Skrundas novads', 'Skrundas novads');
INSERT INTO `directory_country_region` VALUES(451, 'LV', 'Skrīveru novads', 'Skrīveru novads');
INSERT INTO `directory_country_region` VALUES(452, 'LV', 'Smiltenes novads', 'Smiltenes novads');
INSERT INTO `directory_country_region` VALUES(453, 'LV', 'Stopiņu novads', 'Stopiņu novads');
INSERT INTO `directory_country_region` VALUES(454, 'LV', 'Strenču novads', 'Strenču novads');
INSERT INTO `directory_country_region` VALUES(455, 'LV', 'Sējas novads', 'Sējas novads');
INSERT INTO `directory_country_region` VALUES(456, 'LV', 'LV-TA', 'Talsu novads');
INSERT INTO `directory_country_region` VALUES(457, 'LV', 'LV-TU', 'Tukuma novads');
INSERT INTO `directory_country_region` VALUES(458, 'LV', 'Tērvetes novads', 'Tērvetes novads');
INSERT INTO `directory_country_region` VALUES(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads');
INSERT INTO `directory_country_region` VALUES(460, 'LV', 'LV-VK', 'Valkas novads');
INSERT INTO `directory_country_region` VALUES(461, 'LV', 'LV-VM', 'Valmieras novads');
INSERT INTO `directory_country_region` VALUES(462, 'LV', 'Varakļānu novads', 'Varakļānu novads');
INSERT INTO `directory_country_region` VALUES(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads');
INSERT INTO `directory_country_region` VALUES(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads');
INSERT INTO `directory_country_region` VALUES(465, 'LV', 'LV-VE', 'Ventspils novads');
INSERT INTO `directory_country_region` VALUES(466, 'LV', 'Viesītes novads', 'Viesītes novads');
INSERT INTO `directory_country_region` VALUES(467, 'LV', 'Viļakas novads', 'Viļakas novads');
INSERT INTO `directory_country_region` VALUES(468, 'LV', 'Viļānu novads', 'Viļānu novads');
INSERT INTO `directory_country_region` VALUES(469, 'LV', 'Vārkavas novads', 'Vārkavas novads');
INSERT INTO `directory_country_region` VALUES(470, 'LV', 'Zilupes novads', 'Zilupes novads');
INSERT INTO `directory_country_region` VALUES(471, 'LV', 'Ādažu novads', 'Ādažu novads');
INSERT INTO `directory_country_region` VALUES(472, 'LV', 'Ērgļu novads', 'Ērgļu novads');
INSERT INTO `directory_country_region` VALUES(473, 'LV', 'Ķeguma novads', 'Ķeguma novads');
INSERT INTO `directory_country_region` VALUES(474, 'LV', 'Ķekavas novads', 'Ķekavas novads');
INSERT INTO `directory_country_region` VALUES(475, 'LT', 'LT-AL', 'Alytaus Apskritis');
INSERT INTO `directory_country_region` VALUES(476, 'LT', 'LT-KU', 'Kauno Apskritis');
INSERT INTO `directory_country_region` VALUES(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis');
INSERT INTO `directory_country_region` VALUES(478, 'LT', 'LT-MR', 'Marijampolės Apskritis');
INSERT INTO `directory_country_region` VALUES(479, 'LT', 'LT-PN', 'Panevėžio Apskritis');
INSERT INTO `directory_country_region` VALUES(480, 'LT', 'LT-SA', 'Šiaulių Apskritis');
INSERT INTO `directory_country_region` VALUES(481, 'LT', 'LT-TA', 'Tauragės Apskritis');
INSERT INTO `directory_country_region` VALUES(482, 'LT', 'LT-TE', 'Telšių Apskritis');
INSERT INTO `directory_country_region` VALUES(483, 'LT', 'LT-UT', 'Utenos Apskritis');
INSERT INTO `directory_country_region` VALUES(484, 'LT', 'LT-VL', 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` VALUES('en_US', 1, 'Alabama');
INSERT INTO `directory_country_region_name` VALUES('en_US', 2, 'Alaska');
INSERT INTO `directory_country_region_name` VALUES('en_US', 3, 'American Samoa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 4, 'Arizona');
INSERT INTO `directory_country_region_name` VALUES('en_US', 5, 'Arkansas');
INSERT INTO `directory_country_region_name` VALUES('en_US', 6, 'Armed Forces Africa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 7, 'Armed Forces Americas');
INSERT INTO `directory_country_region_name` VALUES('en_US', 8, 'Armed Forces Canada');
INSERT INTO `directory_country_region_name` VALUES('en_US', 9, 'Armed Forces Europe');
INSERT INTO `directory_country_region_name` VALUES('en_US', 10, 'Armed Forces Middle East');
INSERT INTO `directory_country_region_name` VALUES('en_US', 11, 'Armed Forces Pacific');
INSERT INTO `directory_country_region_name` VALUES('en_US', 12, 'California');
INSERT INTO `directory_country_region_name` VALUES('en_US', 13, 'Colorado');
INSERT INTO `directory_country_region_name` VALUES('en_US', 14, 'Connecticut');
INSERT INTO `directory_country_region_name` VALUES('en_US', 15, 'Delaware');
INSERT INTO `directory_country_region_name` VALUES('en_US', 16, 'District of Columbia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 17, 'Federated States Of Micronesia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 18, 'Florida');
INSERT INTO `directory_country_region_name` VALUES('en_US', 19, 'Georgia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 20, 'Guam');
INSERT INTO `directory_country_region_name` VALUES('en_US', 21, 'Hawaii');
INSERT INTO `directory_country_region_name` VALUES('en_US', 22, 'Idaho');
INSERT INTO `directory_country_region_name` VALUES('en_US', 23, 'Illinois');
INSERT INTO `directory_country_region_name` VALUES('en_US', 24, 'Indiana');
INSERT INTO `directory_country_region_name` VALUES('en_US', 25, 'Iowa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 26, 'Kansas');
INSERT INTO `directory_country_region_name` VALUES('en_US', 27, 'Kentucky');
INSERT INTO `directory_country_region_name` VALUES('en_US', 28, 'Louisiana');
INSERT INTO `directory_country_region_name` VALUES('en_US', 29, 'Maine');
INSERT INTO `directory_country_region_name` VALUES('en_US', 30, 'Marshall Islands');
INSERT INTO `directory_country_region_name` VALUES('en_US', 31, 'Maryland');
INSERT INTO `directory_country_region_name` VALUES('en_US', 32, 'Massachusetts');
INSERT INTO `directory_country_region_name` VALUES('en_US', 33, 'Michigan');
INSERT INTO `directory_country_region_name` VALUES('en_US', 34, 'Minnesota');
INSERT INTO `directory_country_region_name` VALUES('en_US', 35, 'Mississippi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 36, 'Missouri');
INSERT INTO `directory_country_region_name` VALUES('en_US', 37, 'Montana');
INSERT INTO `directory_country_region_name` VALUES('en_US', 38, 'Nebraska');
INSERT INTO `directory_country_region_name` VALUES('en_US', 39, 'Nevada');
INSERT INTO `directory_country_region_name` VALUES('en_US', 40, 'New Hampshire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 41, 'New Jersey');
INSERT INTO `directory_country_region_name` VALUES('en_US', 42, 'New Mexico');
INSERT INTO `directory_country_region_name` VALUES('en_US', 43, 'New York');
INSERT INTO `directory_country_region_name` VALUES('en_US', 44, 'North Carolina');
INSERT INTO `directory_country_region_name` VALUES('en_US', 45, 'North Dakota');
INSERT INTO `directory_country_region_name` VALUES('en_US', 46, 'Northern Mariana Islands');
INSERT INTO `directory_country_region_name` VALUES('en_US', 47, 'Ohio');
INSERT INTO `directory_country_region_name` VALUES('en_US', 48, 'Oklahoma');
INSERT INTO `directory_country_region_name` VALUES('en_US', 49, 'Oregon');
INSERT INTO `directory_country_region_name` VALUES('en_US', 50, 'Palau');
INSERT INTO `directory_country_region_name` VALUES('en_US', 51, 'Pennsylvania');
INSERT INTO `directory_country_region_name` VALUES('en_US', 52, 'Puerto Rico');
INSERT INTO `directory_country_region_name` VALUES('en_US', 53, 'Rhode Island');
INSERT INTO `directory_country_region_name` VALUES('en_US', 54, 'South Carolina');
INSERT INTO `directory_country_region_name` VALUES('en_US', 55, 'South Dakota');
INSERT INTO `directory_country_region_name` VALUES('en_US', 56, 'Tennessee');
INSERT INTO `directory_country_region_name` VALUES('en_US', 57, 'Texas');
INSERT INTO `directory_country_region_name` VALUES('en_US', 58, 'Utah');
INSERT INTO `directory_country_region_name` VALUES('en_US', 59, 'Vermont');
INSERT INTO `directory_country_region_name` VALUES('en_US', 60, 'Virgin Islands');
INSERT INTO `directory_country_region_name` VALUES('en_US', 61, 'Virginia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 62, 'Washington');
INSERT INTO `directory_country_region_name` VALUES('en_US', 63, 'West Virginia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 64, 'Wisconsin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 65, 'Wyoming');
INSERT INTO `directory_country_region_name` VALUES('en_US', 66, 'Alberta');
INSERT INTO `directory_country_region_name` VALUES('en_US', 67, 'British Columbia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 68, 'Manitoba');
INSERT INTO `directory_country_region_name` VALUES('en_US', 69, 'Newfoundland and Labrador');
INSERT INTO `directory_country_region_name` VALUES('en_US', 70, 'New Brunswick');
INSERT INTO `directory_country_region_name` VALUES('en_US', 71, 'Nova Scotia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 72, 'Northwest Territories');
INSERT INTO `directory_country_region_name` VALUES('en_US', 73, 'Nunavut');
INSERT INTO `directory_country_region_name` VALUES('en_US', 74, 'Ontario');
INSERT INTO `directory_country_region_name` VALUES('en_US', 75, 'Prince Edward Island');
INSERT INTO `directory_country_region_name` VALUES('en_US', 76, 'Quebec');
INSERT INTO `directory_country_region_name` VALUES('en_US', 77, 'Saskatchewan');
INSERT INTO `directory_country_region_name` VALUES('en_US', 78, 'Yukon Territory');
INSERT INTO `directory_country_region_name` VALUES('en_US', 79, 'Niedersachsen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 80, 'Baden-Württemberg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 81, 'Bayern');
INSERT INTO `directory_country_region_name` VALUES('en_US', 82, 'Berlin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 83, 'Brandenburg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 84, 'Bremen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 85, 'Hamburg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 86, 'Hessen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 87, 'Mecklenburg-Vorpommern');
INSERT INTO `directory_country_region_name` VALUES('en_US', 88, 'Nordrhein-Westfalen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 89, 'Rheinland-Pfalz');
INSERT INTO `directory_country_region_name` VALUES('en_US', 90, 'Saarland');
INSERT INTO `directory_country_region_name` VALUES('en_US', 91, 'Sachsen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 92, 'Sachsen-Anhalt');
INSERT INTO `directory_country_region_name` VALUES('en_US', 93, 'Schleswig-Holstein');
INSERT INTO `directory_country_region_name` VALUES('en_US', 94, 'Thüringen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 95, 'Wien');
INSERT INTO `directory_country_region_name` VALUES('en_US', 96, 'Niederösterreich');
INSERT INTO `directory_country_region_name` VALUES('en_US', 97, 'Oberösterreich');
INSERT INTO `directory_country_region_name` VALUES('en_US', 98, 'Salzburg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 99, 'Kärnten');
INSERT INTO `directory_country_region_name` VALUES('en_US', 100, 'Steiermark');
INSERT INTO `directory_country_region_name` VALUES('en_US', 101, 'Tirol');
INSERT INTO `directory_country_region_name` VALUES('en_US', 102, 'Burgenland');
INSERT INTO `directory_country_region_name` VALUES('en_US', 103, 'Voralberg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 104, 'Aargau');
INSERT INTO `directory_country_region_name` VALUES('en_US', 105, 'Appenzell Innerrhoden');
INSERT INTO `directory_country_region_name` VALUES('en_US', 106, 'Appenzell Ausserrhoden');
INSERT INTO `directory_country_region_name` VALUES('en_US', 107, 'Bern');
INSERT INTO `directory_country_region_name` VALUES('en_US', 108, 'Basel-Landschaft');
INSERT INTO `directory_country_region_name` VALUES('en_US', 109, 'Basel-Stadt');
INSERT INTO `directory_country_region_name` VALUES('en_US', 110, 'Freiburg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 111, 'Genf');
INSERT INTO `directory_country_region_name` VALUES('en_US', 112, 'Glarus');
INSERT INTO `directory_country_region_name` VALUES('en_US', 113, 'Graubünden');
INSERT INTO `directory_country_region_name` VALUES('en_US', 114, 'Jura');
INSERT INTO `directory_country_region_name` VALUES('en_US', 115, 'Luzern');
INSERT INTO `directory_country_region_name` VALUES('en_US', 116, 'Neuenburg');
INSERT INTO `directory_country_region_name` VALUES('en_US', 117, 'Nidwalden');
INSERT INTO `directory_country_region_name` VALUES('en_US', 118, 'Obwalden');
INSERT INTO `directory_country_region_name` VALUES('en_US', 119, 'St. Gallen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 120, 'Schaffhausen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 121, 'Solothurn');
INSERT INTO `directory_country_region_name` VALUES('en_US', 122, 'Schwyz');
INSERT INTO `directory_country_region_name` VALUES('en_US', 123, 'Thurgau');
INSERT INTO `directory_country_region_name` VALUES('en_US', 124, 'Tessin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 125, 'Uri');
INSERT INTO `directory_country_region_name` VALUES('en_US', 126, 'Waadt');
INSERT INTO `directory_country_region_name` VALUES('en_US', 127, 'Wallis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 128, 'Zug');
INSERT INTO `directory_country_region_name` VALUES('en_US', 129, 'Zürich');
INSERT INTO `directory_country_region_name` VALUES('en_US', 130, 'A Coruña');
INSERT INTO `directory_country_region_name` VALUES('en_US', 131, 'Alava');
INSERT INTO `directory_country_region_name` VALUES('en_US', 132, 'Albacete');
INSERT INTO `directory_country_region_name` VALUES('en_US', 133, 'Alicante');
INSERT INTO `directory_country_region_name` VALUES('en_US', 134, 'Almeria');
INSERT INTO `directory_country_region_name` VALUES('en_US', 135, 'Asturias');
INSERT INTO `directory_country_region_name` VALUES('en_US', 136, 'Avila');
INSERT INTO `directory_country_region_name` VALUES('en_US', 137, 'Badajoz');
INSERT INTO `directory_country_region_name` VALUES('en_US', 138, 'Baleares');
INSERT INTO `directory_country_region_name` VALUES('en_US', 139, 'Barcelona');
INSERT INTO `directory_country_region_name` VALUES('en_US', 140, 'Burgos');
INSERT INTO `directory_country_region_name` VALUES('en_US', 141, 'Caceres');
INSERT INTO `directory_country_region_name` VALUES('en_US', 142, 'Cadiz');
INSERT INTO `directory_country_region_name` VALUES('en_US', 143, 'Cantabria');
INSERT INTO `directory_country_region_name` VALUES('en_US', 144, 'Castellon');
INSERT INTO `directory_country_region_name` VALUES('en_US', 145, 'Ceuta');
INSERT INTO `directory_country_region_name` VALUES('en_US', 146, 'Ciudad Real');
INSERT INTO `directory_country_region_name` VALUES('en_US', 147, 'Cordoba');
INSERT INTO `directory_country_region_name` VALUES('en_US', 148, 'Cuenca');
INSERT INTO `directory_country_region_name` VALUES('en_US', 149, 'Girona');
INSERT INTO `directory_country_region_name` VALUES('en_US', 150, 'Granada');
INSERT INTO `directory_country_region_name` VALUES('en_US', 151, 'Guadalajara');
INSERT INTO `directory_country_region_name` VALUES('en_US', 152, 'Guipuzcoa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 153, 'Huelva');
INSERT INTO `directory_country_region_name` VALUES('en_US', 154, 'Huesca');
INSERT INTO `directory_country_region_name` VALUES('en_US', 155, 'Jaen');
INSERT INTO `directory_country_region_name` VALUES('en_US', 156, 'La Rioja');
INSERT INTO `directory_country_region_name` VALUES('en_US', 157, 'Las Palmas');
INSERT INTO `directory_country_region_name` VALUES('en_US', 158, 'Leon');
INSERT INTO `directory_country_region_name` VALUES('en_US', 159, 'Lleida');
INSERT INTO `directory_country_region_name` VALUES('en_US', 160, 'Lugo');
INSERT INTO `directory_country_region_name` VALUES('en_US', 161, 'Madrid');
INSERT INTO `directory_country_region_name` VALUES('en_US', 162, 'Malaga');
INSERT INTO `directory_country_region_name` VALUES('en_US', 163, 'Melilla');
INSERT INTO `directory_country_region_name` VALUES('en_US', 164, 'Murcia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 165, 'Navarra');
INSERT INTO `directory_country_region_name` VALUES('en_US', 166, 'Ourense');
INSERT INTO `directory_country_region_name` VALUES('en_US', 167, 'Palencia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 168, 'Pontevedra');
INSERT INTO `directory_country_region_name` VALUES('en_US', 169, 'Salamanca');
INSERT INTO `directory_country_region_name` VALUES('en_US', 170, 'Santa Cruz de Tenerife');
INSERT INTO `directory_country_region_name` VALUES('en_US', 171, 'Segovia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 172, 'Sevilla');
INSERT INTO `directory_country_region_name` VALUES('en_US', 173, 'Soria');
INSERT INTO `directory_country_region_name` VALUES('en_US', 174, 'Tarragona');
INSERT INTO `directory_country_region_name` VALUES('en_US', 175, 'Teruel');
INSERT INTO `directory_country_region_name` VALUES('en_US', 176, 'Toledo');
INSERT INTO `directory_country_region_name` VALUES('en_US', 177, 'Valencia');
INSERT INTO `directory_country_region_name` VALUES('en_US', 178, 'Valladolid');
INSERT INTO `directory_country_region_name` VALUES('en_US', 179, 'Vizcaya');
INSERT INTO `directory_country_region_name` VALUES('en_US', 180, 'Zamora');
INSERT INTO `directory_country_region_name` VALUES('en_US', 181, 'Zaragoza');
INSERT INTO `directory_country_region_name` VALUES('en_US', 182, 'Ain');
INSERT INTO `directory_country_region_name` VALUES('en_US', 183, 'Aisne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 184, 'Allier');
INSERT INTO `directory_country_region_name` VALUES('en_US', 185, 'Alpes-de-Haute-Provence');
INSERT INTO `directory_country_region_name` VALUES('en_US', 186, 'Hautes-Alpes');
INSERT INTO `directory_country_region_name` VALUES('en_US', 187, 'Alpes-Maritimes');
INSERT INTO `directory_country_region_name` VALUES('en_US', 188, 'Ardèche');
INSERT INTO `directory_country_region_name` VALUES('en_US', 189, 'Ardennes');
INSERT INTO `directory_country_region_name` VALUES('en_US', 190, 'Ariège');
INSERT INTO `directory_country_region_name` VALUES('en_US', 191, 'Aube');
INSERT INTO `directory_country_region_name` VALUES('en_US', 192, 'Aude');
INSERT INTO `directory_country_region_name` VALUES('en_US', 193, 'Aveyron');
INSERT INTO `directory_country_region_name` VALUES('en_US', 194, 'Bouches-du-Rhône');
INSERT INTO `directory_country_region_name` VALUES('en_US', 195, 'Calvados');
INSERT INTO `directory_country_region_name` VALUES('en_US', 196, 'Cantal');
INSERT INTO `directory_country_region_name` VALUES('en_US', 197, 'Charente');
INSERT INTO `directory_country_region_name` VALUES('en_US', 198, 'Charente-Maritime');
INSERT INTO `directory_country_region_name` VALUES('en_US', 199, 'Cher');
INSERT INTO `directory_country_region_name` VALUES('en_US', 200, 'Corrèze');
INSERT INTO `directory_country_region_name` VALUES('en_US', 201, 'Corse-du-Sud');
INSERT INTO `directory_country_region_name` VALUES('en_US', 202, 'Haute-Corse');
INSERT INTO `directory_country_region_name` VALUES('en_US', 203, 'Côte-d''Or');
INSERT INTO `directory_country_region_name` VALUES('en_US', 204, 'Côtes-d''Armor');
INSERT INTO `directory_country_region_name` VALUES('en_US', 205, 'Creuse');
INSERT INTO `directory_country_region_name` VALUES('en_US', 206, 'Dordogne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 207, 'Doubs');
INSERT INTO `directory_country_region_name` VALUES('en_US', 208, 'Drôme');
INSERT INTO `directory_country_region_name` VALUES('en_US', 209, 'Eure');
INSERT INTO `directory_country_region_name` VALUES('en_US', 210, 'Eure-et-Loir');
INSERT INTO `directory_country_region_name` VALUES('en_US', 211, 'Finistère');
INSERT INTO `directory_country_region_name` VALUES('en_US', 212, 'Gard');
INSERT INTO `directory_country_region_name` VALUES('en_US', 213, 'Haute-Garonne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 214, 'Gers');
INSERT INTO `directory_country_region_name` VALUES('en_US', 215, 'Gironde');
INSERT INTO `directory_country_region_name` VALUES('en_US', 216, 'Hérault');
INSERT INTO `directory_country_region_name` VALUES('en_US', 217, 'Ille-et-Vilaine');
INSERT INTO `directory_country_region_name` VALUES('en_US', 218, 'Indre');
INSERT INTO `directory_country_region_name` VALUES('en_US', 219, 'Indre-et-Loire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 220, 'Isère');
INSERT INTO `directory_country_region_name` VALUES('en_US', 221, 'Jura');
INSERT INTO `directory_country_region_name` VALUES('en_US', 222, 'Landes');
INSERT INTO `directory_country_region_name` VALUES('en_US', 223, 'Loir-et-Cher');
INSERT INTO `directory_country_region_name` VALUES('en_US', 224, 'Loire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 225, 'Haute-Loire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 226, 'Loire-Atlantique');
INSERT INTO `directory_country_region_name` VALUES('en_US', 227, 'Loiret');
INSERT INTO `directory_country_region_name` VALUES('en_US', 228, 'Lot');
INSERT INTO `directory_country_region_name` VALUES('en_US', 229, 'Lot-et-Garonne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 230, 'Lozère');
INSERT INTO `directory_country_region_name` VALUES('en_US', 231, 'Maine-et-Loire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 232, 'Manche');
INSERT INTO `directory_country_region_name` VALUES('en_US', 233, 'Marne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 234, 'Haute-Marne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 235, 'Mayenne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 236, 'Meurthe-et-Moselle');
INSERT INTO `directory_country_region_name` VALUES('en_US', 237, 'Meuse');
INSERT INTO `directory_country_region_name` VALUES('en_US', 238, 'Morbihan');
INSERT INTO `directory_country_region_name` VALUES('en_US', 239, 'Moselle');
INSERT INTO `directory_country_region_name` VALUES('en_US', 240, 'Nièvre');
INSERT INTO `directory_country_region_name` VALUES('en_US', 241, 'Nord');
INSERT INTO `directory_country_region_name` VALUES('en_US', 242, 'Oise');
INSERT INTO `directory_country_region_name` VALUES('en_US', 243, 'Orne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 244, 'Pas-de-Calais');
INSERT INTO `directory_country_region_name` VALUES('en_US', 245, 'Puy-de-Dôme');
INSERT INTO `directory_country_region_name` VALUES('en_US', 246, 'Pyrénées-Atlantiques');
INSERT INTO `directory_country_region_name` VALUES('en_US', 247, 'Hautes-Pyrénées');
INSERT INTO `directory_country_region_name` VALUES('en_US', 248, 'Pyrénées-Orientales');
INSERT INTO `directory_country_region_name` VALUES('en_US', 249, 'Bas-Rhin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 250, 'Haut-Rhin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 251, 'Rhône');
INSERT INTO `directory_country_region_name` VALUES('en_US', 252, 'Haute-Saône');
INSERT INTO `directory_country_region_name` VALUES('en_US', 253, 'Saône-et-Loire');
INSERT INTO `directory_country_region_name` VALUES('en_US', 254, 'Sarthe');
INSERT INTO `directory_country_region_name` VALUES('en_US', 255, 'Savoie');
INSERT INTO `directory_country_region_name` VALUES('en_US', 256, 'Haute-Savoie');
INSERT INTO `directory_country_region_name` VALUES('en_US', 257, 'Paris');
INSERT INTO `directory_country_region_name` VALUES('en_US', 258, 'Seine-Maritime');
INSERT INTO `directory_country_region_name` VALUES('en_US', 259, 'Seine-et-Marne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 260, 'Yvelines');
INSERT INTO `directory_country_region_name` VALUES('en_US', 261, 'Deux-Sèvres');
INSERT INTO `directory_country_region_name` VALUES('en_US', 262, 'Somme');
INSERT INTO `directory_country_region_name` VALUES('en_US', 263, 'Tarn');
INSERT INTO `directory_country_region_name` VALUES('en_US', 264, 'Tarn-et-Garonne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 265, 'Var');
INSERT INTO `directory_country_region_name` VALUES('en_US', 266, 'Vaucluse');
INSERT INTO `directory_country_region_name` VALUES('en_US', 267, 'Vendée');
INSERT INTO `directory_country_region_name` VALUES('en_US', 268, 'Vienne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 269, 'Haute-Vienne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 270, 'Vosges');
INSERT INTO `directory_country_region_name` VALUES('en_US', 271, 'Yonne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 272, 'Territoire-de-Belfort');
INSERT INTO `directory_country_region_name` VALUES('en_US', 273, 'Essonne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 274, 'Hauts-de-Seine');
INSERT INTO `directory_country_region_name` VALUES('en_US', 275, 'Seine-Saint-Denis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 276, 'Val-de-Marne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 277, 'Val-d''Oise');
INSERT INTO `directory_country_region_name` VALUES('en_US', 278, 'Alba');
INSERT INTO `directory_country_region_name` VALUES('en_US', 279, 'Arad');
INSERT INTO `directory_country_region_name` VALUES('en_US', 280, 'Argeş');
INSERT INTO `directory_country_region_name` VALUES('en_US', 281, 'Bacău');
INSERT INTO `directory_country_region_name` VALUES('en_US', 282, 'Bihor');
INSERT INTO `directory_country_region_name` VALUES('en_US', 283, 'Bistriţa-Năsăud');
INSERT INTO `directory_country_region_name` VALUES('en_US', 284, 'Botoşani');
INSERT INTO `directory_country_region_name` VALUES('en_US', 285, 'Braşov');
INSERT INTO `directory_country_region_name` VALUES('en_US', 286, 'Brăila');
INSERT INTO `directory_country_region_name` VALUES('en_US', 287, 'Bucureşti');
INSERT INTO `directory_country_region_name` VALUES('en_US', 288, 'Buzău');
INSERT INTO `directory_country_region_name` VALUES('en_US', 289, 'Caraş-Severin');
INSERT INTO `directory_country_region_name` VALUES('en_US', 290, 'Călăraşi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 291, 'Cluj');
INSERT INTO `directory_country_region_name` VALUES('en_US', 292, 'Constanţa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 293, 'Covasna');
INSERT INTO `directory_country_region_name` VALUES('en_US', 294, 'Dâmboviţa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 295, 'Dolj');
INSERT INTO `directory_country_region_name` VALUES('en_US', 296, 'Galaţi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 297, 'Giurgiu');
INSERT INTO `directory_country_region_name` VALUES('en_US', 298, 'Gorj');
INSERT INTO `directory_country_region_name` VALUES('en_US', 299, 'Harghita');
INSERT INTO `directory_country_region_name` VALUES('en_US', 300, 'Hunedoara');
INSERT INTO `directory_country_region_name` VALUES('en_US', 301, 'Ialomiţa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 302, 'Iaşi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 303, 'Ilfov');
INSERT INTO `directory_country_region_name` VALUES('en_US', 304, 'Maramureş');
INSERT INTO `directory_country_region_name` VALUES('en_US', 305, 'Mehedinţi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 306, 'Mureş');
INSERT INTO `directory_country_region_name` VALUES('en_US', 307, 'Neamţ');
INSERT INTO `directory_country_region_name` VALUES('en_US', 308, 'Olt');
INSERT INTO `directory_country_region_name` VALUES('en_US', 309, 'Prahova');
INSERT INTO `directory_country_region_name` VALUES('en_US', 310, 'Satu-Mare');
INSERT INTO `directory_country_region_name` VALUES('en_US', 311, 'Sălaj');
INSERT INTO `directory_country_region_name` VALUES('en_US', 312, 'Sibiu');
INSERT INTO `directory_country_region_name` VALUES('en_US', 313, 'Suceava');
INSERT INTO `directory_country_region_name` VALUES('en_US', 314, 'Teleorman');
INSERT INTO `directory_country_region_name` VALUES('en_US', 315, 'Timiş');
INSERT INTO `directory_country_region_name` VALUES('en_US', 316, 'Tulcea');
INSERT INTO `directory_country_region_name` VALUES('en_US', 317, 'Vaslui');
INSERT INTO `directory_country_region_name` VALUES('en_US', 318, 'Vâlcea');
INSERT INTO `directory_country_region_name` VALUES('en_US', 319, 'Vrancea');
INSERT INTO `directory_country_region_name` VALUES('en_US', 320, 'Lappi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 321, 'Pohjois-Pohjanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 322, 'Kainuu');
INSERT INTO `directory_country_region_name` VALUES('en_US', 323, 'Pohjois-Karjala');
INSERT INTO `directory_country_region_name` VALUES('en_US', 324, 'Pohjois-Savo');
INSERT INTO `directory_country_region_name` VALUES('en_US', 325, 'Etelä-Savo');
INSERT INTO `directory_country_region_name` VALUES('en_US', 326, 'Etelä-Pohjanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 327, 'Pohjanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 328, 'Pirkanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 329, 'Satakunta');
INSERT INTO `directory_country_region_name` VALUES('en_US', 330, 'Keski-Pohjanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 331, 'Keski-Suomi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 332, 'Varsinais-Suomi');
INSERT INTO `directory_country_region_name` VALUES('en_US', 333, 'Etelä-Karjala');
INSERT INTO `directory_country_region_name` VALUES('en_US', 334, 'Päijät-Häme');
INSERT INTO `directory_country_region_name` VALUES('en_US', 335, 'Kanta-Häme');
INSERT INTO `directory_country_region_name` VALUES('en_US', 336, 'Uusimaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 337, 'Itä-Uusimaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 338, 'Kymenlaakso');
INSERT INTO `directory_country_region_name` VALUES('en_US', 339, 'Ahvenanmaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 340, 'Harjumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 341, 'Hiiumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 342, 'Ida-Virumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 343, 'Jõgevamaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 344, 'Järvamaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 345, 'Läänemaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 346, 'Lääne-Virumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 347, 'Põlvamaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 348, 'Pärnumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 349, 'Raplamaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 350, 'Saaremaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 351, 'Tartumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 352, 'Valgamaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 353, 'Viljandimaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 354, 'Võrumaa');
INSERT INTO `directory_country_region_name` VALUES('en_US', 355, 'Daugavpils');
INSERT INTO `directory_country_region_name` VALUES('en_US', 356, 'Jelgava');
INSERT INTO `directory_country_region_name` VALUES('en_US', 357, 'Jēkabpils');
INSERT INTO `directory_country_region_name` VALUES('en_US', 358, 'Jūrmala');
INSERT INTO `directory_country_region_name` VALUES('en_US', 359, 'Liepāja');
INSERT INTO `directory_country_region_name` VALUES('en_US', 360, 'Liepājas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 361, 'Rēzekne');
INSERT INTO `directory_country_region_name` VALUES('en_US', 362, 'Rīga');
INSERT INTO `directory_country_region_name` VALUES('en_US', 363, 'Rīgas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 364, 'Valmiera');
INSERT INTO `directory_country_region_name` VALUES('en_US', 365, 'Ventspils');
INSERT INTO `directory_country_region_name` VALUES('en_US', 366, 'Aglonas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 367, 'Aizkraukles novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 368, 'Aizputes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 369, 'Aknīstes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 370, 'Alojas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 371, 'Alsungas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 372, 'Alūksnes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 373, 'Amatas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 374, 'Apes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 375, 'Auces novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 376, 'Babītes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 377, 'Baldones novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 378, 'Baltinavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 379, 'Balvu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 380, 'Bauskas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 381, 'Beverīnas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 382, 'Brocēnu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 383, 'Burtnieku novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 384, 'Carnikavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 385, 'Cesvaines novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 386, 'Ciblas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 387, 'Cēsu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 388, 'Dagdas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 389, 'Daugavpils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 390, 'Dobeles novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 391, 'Dundagas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 392, 'Durbes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 393, 'Engures novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 394, 'Garkalnes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 395, 'Grobiņas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 396, 'Gulbenes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 397, 'Iecavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 398, 'Ikšķiles novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 399, 'Ilūkstes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 400, 'Inčukalna novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 401, 'Jaunjelgavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 402, 'Jaunpiebalgas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 403, 'Jaunpils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 404, 'Jelgavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 405, 'Jēkabpils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 406, 'Kandavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 407, 'Kokneses novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 408, 'Krimuldas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 409, 'Krustpils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 410, 'Krāslavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 411, 'Kuldīgas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 412, 'Kārsavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 413, 'Lielvārdes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 414, 'Limbažu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 415, 'Lubānas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 416, 'Ludzas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 417, 'Līgatnes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 418, 'Līvānu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 419, 'Madonas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 420, 'Mazsalacas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 421, 'Mālpils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 422, 'Mārupes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 423, 'Naukšēnu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 424, 'Neretas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 425, 'Nīcas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 426, 'Ogres novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 427, 'Olaines novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 428, 'Ozolnieku novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 429, 'Preiļu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 430, 'Priekules novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 431, 'Priekuļu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 432, 'Pārgaujas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 433, 'Pāvilostas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 434, 'Pļaviņu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 435, 'Raunas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 436, 'Riebiņu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 437, 'Rojas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 438, 'Ropažu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 439, 'Rucavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 440, 'Rugāju novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 441, 'Rundāles novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 442, 'Rēzeknes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 443, 'Rūjienas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 444, 'Salacgrīvas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 445, 'Salas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 446, 'Salaspils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 447, 'Saldus novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 448, 'Saulkrastu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 449, 'Siguldas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 450, 'Skrundas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 451, 'Skrīveru novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 452, 'Smiltenes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 453, 'Stopiņu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 454, 'Strenču novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 455, 'Sējas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 456, 'Talsu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 457, 'Tukuma novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 458, 'Tērvetes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 459, 'Vaiņodes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 460, 'Valkas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 461, 'Valmieras novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 462, 'Varakļānu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 463, 'Vecpiebalgas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 464, 'Vecumnieku novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 465, 'Ventspils novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 466, 'Viesītes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 467, 'Viļakas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 468, 'Viļānu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 469, 'Vārkavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 470, 'Zilupes novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 471, 'Ādažu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 472, 'Ērgļu novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 473, 'Ķeguma novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 474, 'Ķekavas novads');
INSERT INTO `directory_country_region_name` VALUES('en_US', 475, 'Alytaus Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 476, 'Kauno Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 477, 'Klaipėdos Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 478, 'Marijampolės Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 479, 'Panevėžio Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 480, 'Šiaulių Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 481, 'Tauragės Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 482, 'Telšių Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 483, 'Utenos Apskritis');
INSERT INTO `directory_country_region_name` VALUES('en_US', 484, 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `IDX_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` VALUES('EUR', 'EUR', 1.000000000000);
INSERT INTO `directory_currency_rate` VALUES('EUR', 'USD', 1.415000000000);
INSERT INTO `directory_currency_rate` VALUES('USD', 'EUR', 0.706700000000);
INSERT INTO `directory_currency_rate` VALUES('USD', 'USD', 1.000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_purchased`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_purchased_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_LINK_TITLE_LINK_ID` (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_sample`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID` (`sample_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_sample_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `IDX_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute' AUTO_INCREMENT=134 ;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` VALUES(1, 1, 'website_id', NULL, 'customer/customer_attribute_backend_website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'customer/customer_attribute_source_website', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(2, 1, 'store_id', NULL, 'customer/customer_attribute_backend_store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'customer/customer_attribute_source_store', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(3, 1, 'created_in', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(4, 1, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(5, 1, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(6, 1, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(7, 1, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(8, 1, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'customer/customer_attribute_source_group', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(11, 1, 'dob', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, 'eav/entity_attribute_frontend_datetime', 'date', 'Date Of Birth', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(12, 1, 'password_hash', NULL, 'customer/customer_attribute_backend_password', 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(13, 1, 'default_billing', NULL, 'customer/customer_attribute_backend_billing', 'int', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(14, 1, 'default_shipping', NULL, 'customer/customer_attribute_backend_shipping', 'int', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(15, 1, 'taxvat', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(16, 1, 'confirmation', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(17, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(18, 1, 'gender', NULL, NULL, 'int', NULL, NULL, 'select', 'Gender', NULL, 'eav/entity_attribute_source_table', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(19, 2, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(20, 2, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(21, 2, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(22, 2, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(23, 2, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(24, 2, 'company', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(25, 2, 'street', NULL, 'customer/entity_address_attribute_backend_street', 'text', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(26, 2, 'city', NULL, NULL, 'varchar', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(27, 2, 'country_id', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country', NULL, 'customer/entity_address_attribute_source_country', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(28, 2, 'region', NULL, 'customer/entity_address_attribute_backend_region', 'varchar', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(29, 2, 'region_id', NULL, NULL, 'int', NULL, NULL, 'hidden', 'State/Province', NULL, 'customer/entity_address_attribute_source_region', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(30, 2, 'postcode', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(31, 2, 'telephone', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Telephone', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(32, 2, 'fax', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(33, 1, 'rp_token', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(34, 1, 'rp_token_created_at', NULL, NULL, 'datetime', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(35, 1, 'disable_auto_group_change', NULL, 'customer/attribute_backend_data_boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(36, 2, 'vat_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(37, 2, 'vat_is_valid', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(38, 2, 'vat_request_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(39, 2, 'vat_request_date', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(40, 2, 'vat_request_success', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(41, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(42, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'eav/entity_attribute_source_boolean', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(43, 3, 'url_key', NULL, 'catalog/category_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(44, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(45, 3, 'image', NULL, 'catalog/category_attribute_backend_image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(46, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(47, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(48, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(49, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'catalog/category_attribute_source_mode', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(50, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'catalog/category_attribute_source_page', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(51, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(52, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(53, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(54, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(55, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(56, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(57, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(58, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(59, 3, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(60, 3, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(61, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/category_attribute_source_layout', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(62, 3, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(63, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(64, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(65, 3, 'available_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(66, 3, 'default_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(67, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'eav/entity_attribute_source_boolean', 1, 0, '1', 0, NULL);
INSERT INTO `eav_attribute` VALUES(68, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(69, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(70, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(71, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(72, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(73, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(74, 4, 'sku', NULL, 'catalog/product_attribute_backend_sku', 'static', NULL, NULL, 'text', 'SKU', NULL, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `eav_attribute` VALUES(75, 4, 'price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(76, 4, 'special_price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Special Price', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(77, 4, 'special_from_date', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(78, 4, 'special_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(79, 4, 'cost', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(80, 4, 'weight', NULL, NULL, 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(81, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(82, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(83, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(84, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars');
INSERT INTO `eav_attribute` VALUES(85, 4, 'image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Base Image', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(86, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Small Image', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(87, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(88, 4, 'media_gallery', NULL, 'catalog/product_attribute_backend_media', 'varchar', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(89, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(90, 4, 'group_price', NULL, 'catalog/product_attribute_backend_groupprice', 'decimal', NULL, NULL, 'text', 'Group Price', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(91, 4, 'tier_price', NULL, 'catalog/product_attribute_backend_tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(92, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(93, 4, 'news_from_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(94, 4, 'news_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(95, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(96, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Status', NULL, 'catalog/product_status', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(97, 4, 'url_key', NULL, 'catalog/product_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(98, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(99, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(100, 4, 'is_recurring', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Recurring Profile', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, 'Products with recurring profile participate in catalog as nominal items.');
INSERT INTO `eav_attribute` VALUES(101, 4, 'recurring_profile', NULL, 'catalog/product_attribute_backend_recurring', 'text', NULL, NULL, 'text', 'Recurring Payment Profile', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(102, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'catalog/product_visibility', 1, 0, '4', 0, NULL);
INSERT INTO `eav_attribute` VALUES(103, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(104, 4, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(105, 4, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(106, 4, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(107, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/product_attribute_source_layout', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(108, 4, 'category_ids', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(109, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'catalog/entity_product_attribute_design_options_container', 0, 0, 'container2', 0, NULL);
INSERT INTO `eav_attribute` VALUES(110, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(111, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(112, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(113, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(114, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(115, 4, 'created_at', NULL, 'eav/entity_attribute_backend_time_created', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(116, 4, 'updated_at', NULL, 'eav/entity_attribute_backend_time_updated', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(117, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'catalog/product_attribute_source_countryofmanufacture', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(118, 4, 'msrp_enabled', NULL, 'catalog/product_attribute_backend_msrp', 'varchar', NULL, NULL, 'select', 'Apply MAP', NULL, 'catalog/product_attribute_source_msrp_type_enabled', 0, 0, '2', 0, NULL);
INSERT INTO `eav_attribute` VALUES(119, 4, 'msrp_display_actual_price_type', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'catalog/product_attribute_source_msrp_type_price', 0, 0, '4', 0, NULL);
INSERT INTO `eav_attribute` VALUES(120, 4, 'msrp', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Manufacturer''s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(121, 4, 'enable_googlecheckout', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Product Available for Purchase with Google Checkout', NULL, 'eav/entity_attribute_source_boolean', 0, 0, '1', 0, NULL);
INSERT INTO `eav_attribute` VALUES(122, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'tax/class_source_product', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(123, 4, 'gift_message_available', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(124, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(125, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(126, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(127, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'bundle/product_attribute_source_price_view', 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(128, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, NULL, 'Shipment', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(129, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(130, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(131, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL);
INSERT INTO `eav_attribute` VALUES(132, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL);
INSERT INTO `eav_attribute` VALUES(133, 3, 'thumbnail', NULL, 'catalog/category_attribute_backend_image', 'varchar', NULL, NULL, 'image', 'Thumbnail Image', NULL, NULL, 0, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `IDX_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` VALUES(1, 1, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(2, 2, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(3, 3, 'General', 10, 1);
INSERT INTO `eav_attribute_group` VALUES(4, 3, 'General Information', 2, 0);
INSERT INTO `eav_attribute_group` VALUES(5, 3, 'Display Settings', 20, 0);
INSERT INTO `eav_attribute_group` VALUES(6, 3, 'Custom Design', 30, 0);
INSERT INTO `eav_attribute_group` VALUES(7, 4, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(8, 4, 'Prices', 2, 0);
INSERT INTO `eav_attribute_group` VALUES(9, 4, 'Meta Information', 3, 0);
INSERT INTO `eav_attribute_group` VALUES(10, 4, 'Images', 4, 0);
INSERT INTO `eav_attribute_group` VALUES(11, 4, 'Recurring Profile', 5, 0);
INSERT INTO `eav_attribute_group` VALUES(12, 4, 'Design', 6, 0);
INSERT INTO `eav_attribute_group` VALUES(13, 5, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(14, 6, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(15, 7, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(16, 8, 'General', 1, 1);
INSERT INTO `eav_attribute_group` VALUES(17, 4, 'Gift Options', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` VALUES(1, 18, 0);
INSERT INTO `eav_attribute_option` VALUES(2, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` VALUES(1, 1, 0, 'Male');
INSERT INTO `eav_attribute_option_value` VALUES(2, 2, 0, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `IDX_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` VALUES(1, 1, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(2, 2, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(3, 3, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(4, 4, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(5, 5, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(6, 6, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(7, 7, 'Default', 1);
INSERT INTO `eav_attribute_set` VALUES(8, 8, 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes' AUTO_INCREMENT=132 ;

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` VALUES(1, 1, 1, 1, 1, 10);
INSERT INTO `eav_entity_attribute` VALUES(2, 1, 1, 1, 2, 0);
INSERT INTO `eav_entity_attribute` VALUES(3, 1, 1, 1, 3, 20);
INSERT INTO `eav_entity_attribute` VALUES(4, 1, 1, 1, 4, 30);
INSERT INTO `eav_entity_attribute` VALUES(5, 1, 1, 1, 5, 40);
INSERT INTO `eav_entity_attribute` VALUES(6, 1, 1, 1, 6, 50);
INSERT INTO `eav_entity_attribute` VALUES(7, 1, 1, 1, 7, 60);
INSERT INTO `eav_entity_attribute` VALUES(8, 1, 1, 1, 8, 70);
INSERT INTO `eav_entity_attribute` VALUES(9, 1, 1, 1, 9, 80);
INSERT INTO `eav_entity_attribute` VALUES(10, 1, 1, 1, 10, 25);
INSERT INTO `eav_entity_attribute` VALUES(11, 1, 1, 1, 11, 90);
INSERT INTO `eav_entity_attribute` VALUES(12, 1, 1, 1, 12, 0);
INSERT INTO `eav_entity_attribute` VALUES(13, 1, 1, 1, 13, 0);
INSERT INTO `eav_entity_attribute` VALUES(14, 1, 1, 1, 14, 0);
INSERT INTO `eav_entity_attribute` VALUES(15, 1, 1, 1, 15, 100);
INSERT INTO `eav_entity_attribute` VALUES(16, 1, 1, 1, 16, 0);
INSERT INTO `eav_entity_attribute` VALUES(17, 1, 1, 1, 17, 86);
INSERT INTO `eav_entity_attribute` VALUES(18, 1, 1, 1, 18, 110);
INSERT INTO `eav_entity_attribute` VALUES(19, 2, 2, 2, 19, 10);
INSERT INTO `eav_entity_attribute` VALUES(20, 2, 2, 2, 20, 20);
INSERT INTO `eav_entity_attribute` VALUES(21, 2, 2, 2, 21, 30);
INSERT INTO `eav_entity_attribute` VALUES(22, 2, 2, 2, 22, 40);
INSERT INTO `eav_entity_attribute` VALUES(23, 2, 2, 2, 23, 50);
INSERT INTO `eav_entity_attribute` VALUES(24, 2, 2, 2, 24, 60);
INSERT INTO `eav_entity_attribute` VALUES(25, 2, 2, 2, 25, 70);
INSERT INTO `eav_entity_attribute` VALUES(26, 2, 2, 2, 26, 80);
INSERT INTO `eav_entity_attribute` VALUES(27, 2, 2, 2, 27, 90);
INSERT INTO `eav_entity_attribute` VALUES(28, 2, 2, 2, 28, 100);
INSERT INTO `eav_entity_attribute` VALUES(29, 2, 2, 2, 29, 100);
INSERT INTO `eav_entity_attribute` VALUES(30, 2, 2, 2, 30, 110);
INSERT INTO `eav_entity_attribute` VALUES(31, 2, 2, 2, 31, 120);
INSERT INTO `eav_entity_attribute` VALUES(32, 2, 2, 2, 32, 130);
INSERT INTO `eav_entity_attribute` VALUES(33, 1, 1, 1, 33, 111);
INSERT INTO `eav_entity_attribute` VALUES(34, 1, 1, 1, 34, 112);
INSERT INTO `eav_entity_attribute` VALUES(35, 1, 1, 1, 35, 28);
INSERT INTO `eav_entity_attribute` VALUES(36, 2, 2, 2, 36, 140);
INSERT INTO `eav_entity_attribute` VALUES(37, 2, 2, 2, 37, 132);
INSERT INTO `eav_entity_attribute` VALUES(38, 2, 2, 2, 38, 133);
INSERT INTO `eav_entity_attribute` VALUES(39, 2, 2, 2, 39, 134);
INSERT INTO `eav_entity_attribute` VALUES(40, 2, 2, 2, 40, 135);
INSERT INTO `eav_entity_attribute` VALUES(41, 3, 3, 4, 41, 1);
INSERT INTO `eav_entity_attribute` VALUES(42, 3, 3, 4, 42, 2);
INSERT INTO `eav_entity_attribute` VALUES(43, 3, 3, 4, 43, 3);
INSERT INTO `eav_entity_attribute` VALUES(44, 3, 3, 4, 44, 4);
INSERT INTO `eav_entity_attribute` VALUES(45, 3, 3, 4, 45, 5);
INSERT INTO `eav_entity_attribute` VALUES(46, 3, 3, 4, 46, 6);
INSERT INTO `eav_entity_attribute` VALUES(47, 3, 3, 4, 47, 7);
INSERT INTO `eav_entity_attribute` VALUES(48, 3, 3, 4, 48, 8);
INSERT INTO `eav_entity_attribute` VALUES(49, 3, 3, 5, 49, 10);
INSERT INTO `eav_entity_attribute` VALUES(50, 3, 3, 5, 50, 20);
INSERT INTO `eav_entity_attribute` VALUES(51, 3, 3, 5, 51, 30);
INSERT INTO `eav_entity_attribute` VALUES(52, 3, 3, 4, 52, 12);
INSERT INTO `eav_entity_attribute` VALUES(53, 3, 3, 4, 53, 13);
INSERT INTO `eav_entity_attribute` VALUES(54, 3, 3, 4, 54, 14);
INSERT INTO `eav_entity_attribute` VALUES(55, 3, 3, 4, 55, 15);
INSERT INTO `eav_entity_attribute` VALUES(56, 3, 3, 4, 56, 16);
INSERT INTO `eav_entity_attribute` VALUES(57, 3, 3, 4, 57, 17);
INSERT INTO `eav_entity_attribute` VALUES(58, 3, 3, 6, 58, 10);
INSERT INTO `eav_entity_attribute` VALUES(59, 3, 3, 6, 59, 30);
INSERT INTO `eav_entity_attribute` VALUES(60, 3, 3, 6, 60, 40);
INSERT INTO `eav_entity_attribute` VALUES(61, 3, 3, 6, 61, 50);
INSERT INTO `eav_entity_attribute` VALUES(62, 3, 3, 6, 62, 60);
INSERT INTO `eav_entity_attribute` VALUES(63, 3, 3, 4, 63, 24);
INSERT INTO `eav_entity_attribute` VALUES(64, 3, 3, 4, 64, 25);
INSERT INTO `eav_entity_attribute` VALUES(65, 3, 3, 5, 65, 40);
INSERT INTO `eav_entity_attribute` VALUES(66, 3, 3, 5, 66, 50);
INSERT INTO `eav_entity_attribute` VALUES(67, 3, 3, 4, 67, 10);
INSERT INTO `eav_entity_attribute` VALUES(68, 3, 3, 6, 68, 5);
INSERT INTO `eav_entity_attribute` VALUES(69, 3, 3, 6, 69, 6);
INSERT INTO `eav_entity_attribute` VALUES(70, 3, 3, 5, 70, 51);
INSERT INTO `eav_entity_attribute` VALUES(71, 4, 4, 7, 71, 1);
INSERT INTO `eav_entity_attribute` VALUES(72, 4, 4, 7, 72, 2);
INSERT INTO `eav_entity_attribute` VALUES(73, 4, 4, 7, 73, 3);
INSERT INTO `eav_entity_attribute` VALUES(74, 4, 4, 7, 74, 4);
INSERT INTO `eav_entity_attribute` VALUES(75, 4, 4, 8, 75, 1);
INSERT INTO `eav_entity_attribute` VALUES(76, 4, 4, 8, 76, 3);
INSERT INTO `eav_entity_attribute` VALUES(77, 4, 4, 8, 77, 4);
INSERT INTO `eav_entity_attribute` VALUES(78, 4, 4, 8, 78, 5);
INSERT INTO `eav_entity_attribute` VALUES(79, 4, 4, 8, 79, 6);
INSERT INTO `eav_entity_attribute` VALUES(80, 4, 4, 7, 80, 5);
INSERT INTO `eav_entity_attribute` VALUES(81, 4, 4, 9, 82, 1);
INSERT INTO `eav_entity_attribute` VALUES(82, 4, 4, 9, 83, 2);
INSERT INTO `eav_entity_attribute` VALUES(83, 4, 4, 9, 84, 3);
INSERT INTO `eav_entity_attribute` VALUES(84, 4, 4, 10, 85, 1);
INSERT INTO `eav_entity_attribute` VALUES(85, 4, 4, 10, 86, 2);
INSERT INTO `eav_entity_attribute` VALUES(86, 4, 4, 10, 87, 3);
INSERT INTO `eav_entity_attribute` VALUES(87, 4, 4, 10, 88, 4);
INSERT INTO `eav_entity_attribute` VALUES(88, 4, 4, 7, 89, 6);
INSERT INTO `eav_entity_attribute` VALUES(89, 4, 4, 8, 90, 2);
INSERT INTO `eav_entity_attribute` VALUES(90, 4, 4, 8, 91, 7);
INSERT INTO `eav_entity_attribute` VALUES(91, 4, 4, 7, 93, 7);
INSERT INTO `eav_entity_attribute` VALUES(92, 4, 4, 7, 94, 8);
INSERT INTO `eav_entity_attribute` VALUES(93, 4, 4, 10, 95, 5);
INSERT INTO `eav_entity_attribute` VALUES(94, 4, 4, 7, 96, 9);
INSERT INTO `eav_entity_attribute` VALUES(95, 4, 4, 7, 97, 10);
INSERT INTO `eav_entity_attribute` VALUES(96, 4, 4, 7, 98, 11);
INSERT INTO `eav_entity_attribute` VALUES(97, 4, 4, 8, 99, 8);
INSERT INTO `eav_entity_attribute` VALUES(98, 4, 4, 11, 100, 1);
INSERT INTO `eav_entity_attribute` VALUES(99, 4, 4, 11, 101, 2);
INSERT INTO `eav_entity_attribute` VALUES(100, 4, 4, 7, 102, 12);
INSERT INTO `eav_entity_attribute` VALUES(101, 4, 4, 12, 103, 1);
INSERT INTO `eav_entity_attribute` VALUES(102, 4, 4, 12, 104, 2);
INSERT INTO `eav_entity_attribute` VALUES(103, 4, 4, 12, 105, 3);
INSERT INTO `eav_entity_attribute` VALUES(104, 4, 4, 12, 106, 4);
INSERT INTO `eav_entity_attribute` VALUES(105, 4, 4, 12, 107, 5);
INSERT INTO `eav_entity_attribute` VALUES(106, 4, 4, 7, 108, 13);
INSERT INTO `eav_entity_attribute` VALUES(107, 4, 4, 12, 109, 6);
INSERT INTO `eav_entity_attribute` VALUES(108, 4, 4, 7, 110, 14);
INSERT INTO `eav_entity_attribute` VALUES(109, 4, 4, 7, 111, 15);
INSERT INTO `eav_entity_attribute` VALUES(110, 4, 4, 7, 112, 16);
INSERT INTO `eav_entity_attribute` VALUES(111, 4, 4, 7, 113, 17);
INSERT INTO `eav_entity_attribute` VALUES(112, 4, 4, 7, 114, 18);
INSERT INTO `eav_entity_attribute` VALUES(113, 4, 4, 7, 115, 19);
INSERT INTO `eav_entity_attribute` VALUES(114, 4, 4, 7, 116, 20);
INSERT INTO `eav_entity_attribute` VALUES(115, 4, 4, 7, 117, 21);
INSERT INTO `eav_entity_attribute` VALUES(116, 4, 4, 8, 118, 9);
INSERT INTO `eav_entity_attribute` VALUES(117, 4, 4, 8, 119, 10);
INSERT INTO `eav_entity_attribute` VALUES(118, 4, 4, 8, 120, 11);
INSERT INTO `eav_entity_attribute` VALUES(119, 4, 4, 8, 121, 12);
INSERT INTO `eav_entity_attribute` VALUES(120, 4, 4, 8, 122, 13);
INSERT INTO `eav_entity_attribute` VALUES(121, 4, 4, 17, 123, 1);
INSERT INTO `eav_entity_attribute` VALUES(122, 4, 4, 7, 124, 22);
INSERT INTO `eav_entity_attribute` VALUES(123, 4, 4, 7, 125, 23);
INSERT INTO `eav_entity_attribute` VALUES(124, 4, 4, 7, 126, 24);
INSERT INTO `eav_entity_attribute` VALUES(125, 4, 4, 8, 127, 14);
INSERT INTO `eav_entity_attribute` VALUES(126, 4, 4, 7, 128, 25);
INSERT INTO `eav_entity_attribute` VALUES(127, 4, 4, 7, 129, 26);
INSERT INTO `eav_entity_attribute` VALUES(128, 4, 4, 7, 130, 27);
INSERT INTO `eav_entity_attribute` VALUES(129, 4, 4, 7, 131, 28);
INSERT INTO `eav_entity_attribute` VALUES(130, 4, 4, 7, 132, 29);
INSERT INTO `eav_entity_attribute` VALUES(131, 3, 3, 4, 133, 4);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `IDX_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `eav_entity_store`
--

INSERT INTO `eav_entity_store` VALUES(1, 5, 1, '1', '100000001');

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` VALUES(1, 'customer', 'customer/customer', 'customer/attribute', 'customer/entity', NULL, NULL, 1, 'default', 1, 'eav/entity_increment_numeric', 0, 8, '0', 'customer/eav_attribute', 'customer/attribute_collection');
INSERT INTO `eav_entity_type` VALUES(2, 'customer_address', 'customer/address', 'customer/attribute', 'customer/address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer/eav_attribute', 'customer/address_attribute_collection');
INSERT INTO `eav_entity_type` VALUES(3, 'catalog_category', 'catalog/category', 'catalog/resource_eav_attribute', 'catalog/category', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/category_attribute_collection');
INSERT INTO `eav_entity_type` VALUES(4, 'catalog_product', 'catalog/product', 'catalog/resource_eav_attribute', 'catalog/product', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/product_attribute_collection');
INSERT INTO `eav_entity_type` VALUES(5, 'order', 'sales/order', NULL, 'sales/order', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);
INSERT INTO `eav_entity_type` VALUES(6, 'invoice', 'sales/order_invoice', NULL, 'sales/invoice', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);
INSERT INTO `eav_entity_type` VALUES(7, 'creditmemo', 'sales/order_creditmemo', NULL, 'sales/creditmemo', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);
INSERT INTO `eav_entity_type` VALUES(8, 'shipment', 'sales/order_shipment', NULL, 'sales/shipment', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `IDX_EAV_FORM_ELEMENT_TYPE_ID` (`type_id`),
  KEY `IDX_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Element' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` VALUES(1, 1, NULL, 20, 0);
INSERT INTO `eav_form_element` VALUES(2, 1, NULL, 22, 1);
INSERT INTO `eav_form_element` VALUES(3, 1, NULL, 24, 2);
INSERT INTO `eav_form_element` VALUES(4, 1, NULL, 9, 3);
INSERT INTO `eav_form_element` VALUES(5, 1, NULL, 25, 4);
INSERT INTO `eav_form_element` VALUES(6, 1, NULL, 26, 5);
INSERT INTO `eav_form_element` VALUES(7, 1, NULL, 28, 6);
INSERT INTO `eav_form_element` VALUES(8, 1, NULL, 30, 7);
INSERT INTO `eav_form_element` VALUES(9, 1, NULL, 27, 8);
INSERT INTO `eav_form_element` VALUES(10, 1, NULL, 31, 9);
INSERT INTO `eav_form_element` VALUES(11, 1, NULL, 32, 10);
INSERT INTO `eav_form_element` VALUES(12, 2, NULL, 20, 0);
INSERT INTO `eav_form_element` VALUES(13, 2, NULL, 22, 1);
INSERT INTO `eav_form_element` VALUES(14, 2, NULL, 24, 2);
INSERT INTO `eav_form_element` VALUES(15, 2, NULL, 9, 3);
INSERT INTO `eav_form_element` VALUES(16, 2, NULL, 25, 4);
INSERT INTO `eav_form_element` VALUES(17, 2, NULL, 26, 5);
INSERT INTO `eav_form_element` VALUES(18, 2, NULL, 28, 6);
INSERT INTO `eav_form_element` VALUES(19, 2, NULL, 30, 7);
INSERT INTO `eav_form_element` VALUES(20, 2, NULL, 27, 8);
INSERT INTO `eav_form_element` VALUES(21, 2, NULL, 31, 9);
INSERT INTO `eav_form_element` VALUES(22, 2, NULL, 32, 10);
INSERT INTO `eav_form_element` VALUES(23, 3, NULL, 20, 0);
INSERT INTO `eav_form_element` VALUES(24, 3, NULL, 22, 1);
INSERT INTO `eav_form_element` VALUES(25, 3, NULL, 24, 2);
INSERT INTO `eav_form_element` VALUES(26, 3, NULL, 25, 3);
INSERT INTO `eav_form_element` VALUES(27, 3, NULL, 26, 4);
INSERT INTO `eav_form_element` VALUES(28, 3, NULL, 28, 5);
INSERT INTO `eav_form_element` VALUES(29, 3, NULL, 30, 6);
INSERT INTO `eav_form_element` VALUES(30, 3, NULL, 27, 7);
INSERT INTO `eav_form_element` VALUES(31, 3, NULL, 31, 8);
INSERT INTO `eav_form_element` VALUES(32, 3, NULL, 32, 9);
INSERT INTO `eav_form_element` VALUES(33, 4, NULL, 20, 0);
INSERT INTO `eav_form_element` VALUES(34, 4, NULL, 22, 1);
INSERT INTO `eav_form_element` VALUES(35, 4, NULL, 24, 2);
INSERT INTO `eav_form_element` VALUES(36, 4, NULL, 25, 3);
INSERT INTO `eav_form_element` VALUES(37, 4, NULL, 26, 4);
INSERT INTO `eav_form_element` VALUES(38, 4, NULL, 28, 5);
INSERT INTO `eav_form_element` VALUES(39, 4, NULL, 30, 6);
INSERT INTO `eav_form_element` VALUES(40, 4, NULL, 27, 7);
INSERT INTO `eav_form_element` VALUES(41, 4, NULL, 31, 8);
INSERT INTO `eav_form_element` VALUES(42, 4, NULL, 32, 9);
INSERT INTO `eav_form_element` VALUES(43, 5, 1, 5, 0);
INSERT INTO `eav_form_element` VALUES(44, 5, 1, 7, 1);
INSERT INTO `eav_form_element` VALUES(45, 5, 1, 9, 2);
INSERT INTO `eav_form_element` VALUES(46, 5, 2, 24, 0);
INSERT INTO `eav_form_element` VALUES(47, 5, 2, 31, 1);
INSERT INTO `eav_form_element` VALUES(48, 5, 2, 25, 2);
INSERT INTO `eav_form_element` VALUES(49, 5, 2, 26, 3);
INSERT INTO `eav_form_element` VALUES(50, 5, 2, 28, 4);
INSERT INTO `eav_form_element` VALUES(51, 5, 2, 30, 5);
INSERT INTO `eav_form_element` VALUES(52, 5, 2, 27, 6);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  KEY `IDX_EAV_FORM_FIELDSET_TYPE_ID` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_form_fieldset`
--

INSERT INTO `eav_form_fieldset` VALUES(1, 5, 'general', 1);
INSERT INTO `eav_form_fieldset` VALUES(2, 5, 'address', 2);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_EAV_FORM_FIELDSET_LABEL_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

--
-- Dumping data for table `eav_form_fieldset_label`
--

INSERT INTO `eav_form_fieldset_label` VALUES(1, 0, 'Personal Information');
INSERT INTO `eav_form_fieldset_label` VALUES(2, 0, 'Address Information');

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `IDX_EAV_FORM_TYPE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Type' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` VALUES(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0);
INSERT INTO `eav_form_type` VALUES(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0);
INSERT INTO `eav_form_type` VALUES(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0);
INSERT INTO `eav_form_type` VALUES(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0);
INSERT INTO `eav_form_type` VALUES(5, 'checkout_multishipping_register', 'checkout_multishipping_register', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` VALUES(1, 1);
INSERT INTO `eav_form_type_entity` VALUES(2, 1);
INSERT INTO `eav_form_type_entity` VALUES(5, 1);
INSERT INTO `eav_form_type_entity` VALUES(1, 2);
INSERT INTO `eav_form_type_entity` VALUES(2, 2);
INSERT INTO `eav_form_type_entity` VALUES(3, 2);
INSERT INTO `eav_form_type_entity` VALUES(4, 2);
INSERT INTO `eav_form_type_entity` VALUES(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

CREATE TABLE `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gift_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `googlecheckout_notification`
--

CREATE TABLE `googlecheckout_notification` (
  `serial_number` varchar(64) NOT NULL COMMENT 'Serial Number',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Checkout Notification Table';

--
-- Dumping data for table `googlecheckout_notification`
--


-- --------------------------------------------------------

--
-- Table structure for table `importexport_importdata`
--

CREATE TABLE `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `importexport_importdata`
--


-- --------------------------------------------------------

--
-- Table structure for table `index_event`
--

CREATE TABLE `index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `entity` varchar(64) NOT NULL COMMENT 'Entity',
  `entity_pk` bigint(20) DEFAULT NULL COMMENT 'Entity Primary Key',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `old_data` mediumtext COMMENT 'Old Data',
  `new_data` mediumtext COMMENT 'New Data',
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `UNQ_INDEX_EVENT_TYPE_ENTITY_ENTITY_PK` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Index Event' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `index_event`
--

INSERT INTO `index_event` VALUES(1, 'save', 'catalog_category', 1, '2012-07-05 11:51:41', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:37:"catalog_category_product_match_result";b:1;s:35:"catalogsearch_fulltext_match_result";b:1;}');
INSERT INTO `index_event` VALUES(2, 'save', 'catalog_category', 2, '2012-07-05 11:51:42', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:37:"catalog_category_product_match_result";b:1;s:35:"catalogsearch_fulltext_match_result";b:1;}');
INSERT INTO `index_event` VALUES(3, 'save', 'catalog_category', 3, '2012-07-10 10:51:52', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:37:"catalog_category_product_match_result";b:1;s:35:"catalogsearch_fulltext_match_result";b:1;}');
INSERT INTO `index_event` VALUES(4, 'save', 'cataloginventory_stock_item', 1, '2012-07-10 11:15:51', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:1;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:0;s:37:"catalog_category_product_match_result";b:0;s:35:"catalogsearch_fulltext_match_result";b:0;}');
INSERT INTO `index_event` VALUES(5, 'save', 'catalog_product', 1, '2012-07-10 11:15:52', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:1;s:34:"catalog_product_price_match_result";b:1;s:24:"catalog_url_match_result";b:1;s:37:"catalog_category_product_match_result";b:1;s:35:"catalogsearch_fulltext_match_result";b:1;}');
INSERT INTO `index_event` VALUES(6, 'catalog_reindex_price', 'catalog_product', 1, '2012-07-10 11:15:53', NULL, 'a:5:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:1;s:24:"catalog_url_match_result";b:0;s:37:"catalog_category_product_match_result";b:0;s:35:"catalogsearch_fulltext_match_result";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `index_process`
--

CREATE TABLE `index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Process Id',
  `indexer_code` varchar(32) NOT NULL COMMENT 'Indexer Code',
  `status` varchar(15) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT 'Ended At',
  `mode` varchar(9) NOT NULL DEFAULT 'real_time' COMMENT 'Mode',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `UNQ_INDEX_PROCESS_INDEXER_CODE` (`indexer_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Index Process' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `index_process`
--

INSERT INTO `index_process` VALUES(1, 'catalog_product_attribute', 'require_reindex', '2012-07-17 10:04:45', '2012-07-17 10:04:45', 'real_time');
INSERT INTO `index_process` VALUES(2, 'catalog_product_price', 'require_reindex', '2012-07-17 10:04:46', '2012-07-17 10:04:46', 'real_time');
INSERT INTO `index_process` VALUES(3, 'catalog_url', 'require_reindex', '2012-07-17 10:04:46', '2012-07-17 10:04:46', 'real_time');
INSERT INTO `index_process` VALUES(4, 'catalog_product_flat', 'require_reindex', NULL, NULL, 'real_time');
INSERT INTO `index_process` VALUES(5, 'catalog_category_flat', 'require_reindex', NULL, NULL, 'real_time');
INSERT INTO `index_process` VALUES(6, 'catalog_category_product', 'require_reindex', '2012-07-17 10:04:46', '2012-07-17 10:04:46', 'real_time');
INSERT INTO `index_process` VALUES(7, 'catalogsearch_fulltext', 'require_reindex', '2012-07-17 10:04:46', '2012-07-17 10:04:46', 'real_time');
INSERT INTO `index_process` VALUES(8, 'cataloginventory_stock', 'require_reindex', '2012-07-17 10:04:45', '2012-07-17 10:04:45', 'real_time');
INSERT INTO `index_process` VALUES(9, 'tag_summary', 'require_reindex', '2012-07-17 10:04:46', '2012-07-17 10:04:46', 'real_time');

-- --------------------------------------------------------

--
-- Table structure for table `index_process_event`
--

CREATE TABLE `index_process_event` (
  `process_id` int(10) unsigned NOT NULL COMMENT 'Process Id',
  `event_id` bigint(20) unsigned NOT NULL COMMENT 'Event Id',
  `status` varchar(7) NOT NULL DEFAULT 'new' COMMENT 'Status',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `IDX_INDEX_PROCESS_EVENT_EVENT_ID` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process Event';

--
-- Dumping data for table `index_process_event`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_customer`
--

CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Customers Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_quote`
--

CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time',
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';

--
-- Dumping data for table `log_quote`
--

INSERT INTO `log_quote` VALUES(1, 6, '2012-07-10 11:17:55', NULL);
INSERT INTO `log_quote` VALUES(2, 15, '2012-07-17 07:18:08', NULL);
INSERT INTO `log_quote` VALUES(3, 17, '2012-07-17 12:03:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_summary`
--

CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Summary ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_summary_type`
--

CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT 'Type Code',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `log_summary_type`
--

INSERT INTO `log_summary_type` VALUES(1, 'hour', 1, 'HOUR');
INSERT INTO `log_summary_type` VALUES(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `log_url`
--

CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'URL ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Visit Time',
  PRIMARY KEY (`url_id`),
  KEY `IDX_LOG_URL_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';

--
-- Dumping data for table `log_url`
--

INSERT INTO `log_url` VALUES(1, 1, '2012-07-05 11:53:48');
INSERT INTO `log_url` VALUES(2, 2, '2012-07-05 14:41:27');
INSERT INTO `log_url` VALUES(3, 2, '2012-07-05 14:41:47');
INSERT INTO `log_url` VALUES(4, 3, '2012-07-09 06:22:06');
INSERT INTO `log_url` VALUES(5, 4, '2012-07-09 10:54:42');
INSERT INTO `log_url` VALUES(6, 4, '2012-07-09 10:55:29');
INSERT INTO `log_url` VALUES(7, 4, '2012-07-09 11:01:55');
INSERT INTO `log_url` VALUES(8, 4, '2012-07-09 11:35:42');
INSERT INTO `log_url` VALUES(9, 5, '2012-07-10 10:10:13');
INSERT INTO `log_url` VALUES(10, 6, '2012-07-10 10:52:03');
INSERT INTO `log_url` VALUES(11, 6, '2012-07-10 11:01:37');
INSERT INTO `log_url` VALUES(12, 6, '2012-07-10 11:01:41');
INSERT INTO `log_url` VALUES(13, 6, '2012-07-10 11:02:37');
INSERT INTO `log_url` VALUES(14, 6, '2012-07-10 11:16:53');
INSERT INTO `log_url` VALUES(15, 6, '2012-07-10 11:17:41');
INSERT INTO `log_url` VALUES(16, 6, '2012-07-10 11:17:55');
INSERT INTO `log_url` VALUES(17, 6, '2012-07-10 11:17:58');
INSERT INTO `log_url` VALUES(18, 6, '2012-07-10 11:18:17');
INSERT INTO `log_url` VALUES(19, 6, '2012-07-10 11:18:36');
INSERT INTO `log_url` VALUES(20, 6, '2012-07-10 11:18:36');
INSERT INTO `log_url` VALUES(21, 6, '2012-07-10 11:19:47');
INSERT INTO `log_url` VALUES(22, 6, '2012-07-10 11:19:47');
INSERT INTO `log_url` VALUES(23, 6, '2012-07-10 11:19:48');
INSERT INTO `log_url` VALUES(24, 6, '2012-07-10 11:19:54');
INSERT INTO `log_url` VALUES(25, 6, '2012-07-10 11:19:55');
INSERT INTO `log_url` VALUES(26, 6, '2012-07-10 11:19:55');
INSERT INTO `log_url` VALUES(27, 6, '2012-07-10 11:20:19');
INSERT INTO `log_url` VALUES(28, 6, '2012-07-10 11:20:19');
INSERT INTO `log_url` VALUES(29, 6, '2012-07-10 11:20:43');
INSERT INTO `log_url` VALUES(30, 6, '2012-07-10 11:43:03');
INSERT INTO `log_url` VALUES(31, 6, '2012-07-10 11:43:21');
INSERT INTO `log_url` VALUES(32, 6, '2012-07-10 11:48:04');
INSERT INTO `log_url` VALUES(33, 6, '2012-07-10 11:48:15');
INSERT INTO `log_url` VALUES(34, 6, '2012-07-10 11:48:25');
INSERT INTO `log_url` VALUES(35, 6, '2012-07-10 11:52:19');
INSERT INTO `log_url` VALUES(36, 6, '2012-07-10 11:58:01');
INSERT INTO `log_url` VALUES(37, 7, '2012-07-11 04:58:55');
INSERT INTO `log_url` VALUES(38, 7, '2012-07-11 04:59:34');
INSERT INTO `log_url` VALUES(39, 8, '2012-07-11 07:23:54');
INSERT INTO `log_url` VALUES(40, 9, '2012-07-13 06:06:17');
INSERT INTO `log_url` VALUES(41, 10, '2012-07-13 10:21:56');
INSERT INTO `log_url` VALUES(42, 10, '2012-07-13 10:28:52');
INSERT INTO `log_url` VALUES(43, 10, '2012-07-13 10:28:52');
INSERT INTO `log_url` VALUES(44, 10, '2012-07-13 10:28:53');
INSERT INTO `log_url` VALUES(45, 10, '2012-07-13 10:28:53');
INSERT INTO `log_url` VALUES(46, 10, '2012-07-13 10:28:54');
INSERT INTO `log_url` VALUES(47, 10, '2012-07-13 10:31:07');
INSERT INTO `log_url` VALUES(48, 10, '2012-07-13 10:31:12');
INSERT INTO `log_url` VALUES(49, 10, '2012-07-13 10:32:05');
INSERT INTO `log_url` VALUES(50, 10, '2012-07-13 10:32:16');
INSERT INTO `log_url` VALUES(51, 10, '2012-07-13 10:32:16');
INSERT INTO `log_url` VALUES(52, 10, '2012-07-13 10:35:19');
INSERT INTO `log_url` VALUES(53, 10, '2012-07-13 10:35:20');
INSERT INTO `log_url` VALUES(54, 10, '2012-07-13 10:35:54');
INSERT INTO `log_url` VALUES(55, 11, '2012-07-16 07:04:34');
INSERT INTO `log_url` VALUES(56, 11, '2012-07-16 07:07:46');
INSERT INTO `log_url` VALUES(57, 11, '2012-07-16 07:07:56');
INSERT INTO `log_url` VALUES(58, 11, '2012-07-16 07:08:38');
INSERT INTO `log_url` VALUES(59, 11, '2012-07-16 07:40:58');
INSERT INTO `log_url` VALUES(60, 12, '2012-07-16 10:07:25');
INSERT INTO `log_url` VALUES(61, 12, '2012-07-16 10:07:32');
INSERT INTO `log_url` VALUES(62, 12, '2012-07-16 10:07:46');
INSERT INTO `log_url` VALUES(63, 12, '2012-07-16 10:08:44');
INSERT INTO `log_url` VALUES(64, 12, '2012-07-16 10:08:49');
INSERT INTO `log_url` VALUES(65, 12, '2012-07-16 10:22:07');
INSERT INTO `log_url` VALUES(66, 12, '2012-07-16 10:22:44');
INSERT INTO `log_url` VALUES(67, 13, '2012-07-16 14:10:57');
INSERT INTO `log_url` VALUES(68, 13, '2012-07-16 14:15:43');
INSERT INTO `log_url` VALUES(69, 13, '2012-07-16 14:16:06');
INSERT INTO `log_url` VALUES(70, 13, '2012-07-16 14:16:08');
INSERT INTO `log_url` VALUES(71, 13, '2012-07-16 14:47:45');
INSERT INTO `log_url` VALUES(72, 13, '2012-07-16 14:48:32');
INSERT INTO `log_url` VALUES(73, 13, '2012-07-16 14:48:35');
INSERT INTO `log_url` VALUES(74, 13, '2012-07-16 14:51:45');
INSERT INTO `log_url` VALUES(75, 13, '2012-07-16 14:57:36');
INSERT INTO `log_url` VALUES(76, 13, '2012-07-16 14:57:40');
INSERT INTO `log_url` VALUES(77, 13, '2012-07-16 14:57:45');
INSERT INTO `log_url` VALUES(78, 13, '2012-07-16 14:59:04');
INSERT INTO `log_url` VALUES(79, 13, '2012-07-16 14:59:42');
INSERT INTO `log_url` VALUES(80, 13, '2012-07-16 15:06:19');
INSERT INTO `log_url` VALUES(81, 13, '2012-07-16 15:07:11');
INSERT INTO `log_url` VALUES(82, 14, '2012-07-17 04:52:44');
INSERT INTO `log_url` VALUES(83, 14, '2012-07-17 04:53:52');
INSERT INTO `log_url` VALUES(84, 15, '2012-07-17 07:17:55');
INSERT INTO `log_url` VALUES(85, 15, '2012-07-17 07:18:01');
INSERT INTO `log_url` VALUES(86, 15, '2012-07-17 07:18:08');
INSERT INTO `log_url` VALUES(87, 15, '2012-07-17 07:18:10');
INSERT INTO `log_url` VALUES(88, 15, '2012-07-17 07:18:19');
INSERT INTO `log_url` VALUES(89, 15, '2012-07-17 07:18:40');
INSERT INTO `log_url` VALUES(90, 15, '2012-07-17 07:18:40');
INSERT INTO `log_url` VALUES(91, 15, '2012-07-17 07:20:33');
INSERT INTO `log_url` VALUES(92, 15, '2012-07-17 07:20:34');
INSERT INTO `log_url` VALUES(93, 15, '2012-07-17 07:20:34');
INSERT INTO `log_url` VALUES(94, 15, '2012-07-17 07:20:39');
INSERT INTO `log_url` VALUES(95, 15, '2012-07-17 07:20:40');
INSERT INTO `log_url` VALUES(96, 15, '2012-07-17 07:20:40');
INSERT INTO `log_url` VALUES(97, 15, '2012-07-17 07:20:50');
INSERT INTO `log_url` VALUES(98, 15, '2012-07-17 07:20:51');
INSERT INTO `log_url` VALUES(99, 15, '2012-07-17 07:20:59');
INSERT INTO `log_url` VALUES(100, 15, '2012-07-17 07:21:00');
INSERT INTO `log_url` VALUES(101, 15, '2012-07-17 07:22:30');
INSERT INTO `log_url` VALUES(102, 15, '2012-07-17 07:22:31');
INSERT INTO `log_url` VALUES(103, 16, '2012-07-17 07:58:27');
INSERT INTO `log_url` VALUES(104, 16, '2012-07-17 07:58:46');
INSERT INTO `log_url` VALUES(105, 17, '2012-07-17 09:19:23');
INSERT INTO `log_url` VALUES(106, 17, '2012-07-17 09:19:41');
INSERT INTO `log_url` VALUES(107, 17, '2012-07-17 09:54:43');
INSERT INTO `log_url` VALUES(108, 17, '2012-07-17 09:54:46');
INSERT INTO `log_url` VALUES(109, 17, '2012-07-17 10:04:51');
INSERT INTO `log_url` VALUES(110, 17, '2012-07-17 10:20:59');
INSERT INTO `log_url` VALUES(111, 17, '2012-07-17 10:21:00');
INSERT INTO `log_url` VALUES(112, 17, '2012-07-17 10:21:07');
INSERT INTO `log_url` VALUES(113, 17, '2012-07-17 10:22:00');
INSERT INTO `log_url` VALUES(114, 17, '2012-07-17 10:22:01');
INSERT INTO `log_url` VALUES(115, 17, '2012-07-17 10:22:03');
INSERT INTO `log_url` VALUES(116, 17, '2012-07-17 10:25:55');
INSERT INTO `log_url` VALUES(117, 17, '2012-07-17 10:25:56');
INSERT INTO `log_url` VALUES(118, 17, '2012-07-17 10:26:02');
INSERT INTO `log_url` VALUES(119, 17, '2012-07-17 10:26:17');
INSERT INTO `log_url` VALUES(120, 17, '2012-07-17 10:26:18');
INSERT INTO `log_url` VALUES(121, 17, '2012-07-17 10:26:20');
INSERT INTO `log_url` VALUES(122, 17, '2012-07-17 10:26:24');
INSERT INTO `log_url` VALUES(123, 17, '2012-07-17 10:26:25');
INSERT INTO `log_url` VALUES(124, 17, '2012-07-17 10:26:28');
INSERT INTO `log_url` VALUES(125, 17, '2012-07-17 10:29:01');
INSERT INTO `log_url` VALUES(126, 17, '2012-07-17 10:29:03');
INSERT INTO `log_url` VALUES(127, 17, '2012-07-17 10:29:04');
INSERT INTO `log_url` VALUES(128, 17, '2012-07-17 10:29:05');
INSERT INTO `log_url` VALUES(129, 17, '2012-07-17 10:35:42');
INSERT INTO `log_url` VALUES(130, 17, '2012-07-17 10:35:46');
INSERT INTO `log_url` VALUES(131, 17, '2012-07-17 10:35:48');
INSERT INTO `log_url` VALUES(132, 17, '2012-07-17 10:35:50');
INSERT INTO `log_url` VALUES(133, 17, '2012-07-17 10:36:03');
INSERT INTO `log_url` VALUES(134, 17, '2012-07-17 10:36:04');
INSERT INTO `log_url` VALUES(135, 17, '2012-07-17 10:36:06');
INSERT INTO `log_url` VALUES(136, 17, '2012-07-17 10:59:32');
INSERT INTO `log_url` VALUES(137, 17, '2012-07-17 10:59:33');
INSERT INTO `log_url` VALUES(138, 17, '2012-07-17 10:59:40');
INSERT INTO `log_url` VALUES(139, 17, '2012-07-17 11:05:55');
INSERT INTO `log_url` VALUES(140, 17, '2012-07-17 11:05:56');
INSERT INTO `log_url` VALUES(141, 17, '2012-07-17 11:05:58');
INSERT INTO `log_url` VALUES(142, 17, '2012-07-17 11:06:02');
INSERT INTO `log_url` VALUES(143, 17, '2012-07-17 11:06:04');
INSERT INTO `log_url` VALUES(144, 17, '2012-07-17 11:06:08');
INSERT INTO `log_url` VALUES(145, 17, '2012-07-17 11:07:55');
INSERT INTO `log_url` VALUES(146, 17, '2012-07-17 11:07:57');
INSERT INTO `log_url` VALUES(147, 17, '2012-07-17 11:07:58');
INSERT INTO `log_url` VALUES(148, 17, '2012-07-17 11:10:51');
INSERT INTO `log_url` VALUES(149, 17, '2012-07-17 11:10:52');
INSERT INTO `log_url` VALUES(150, 17, '2012-07-17 11:10:54');
INSERT INTO `log_url` VALUES(151, 17, '2012-07-17 11:11:51');
INSERT INTO `log_url` VALUES(152, 17, '2012-07-17 11:11:52');
INSERT INTO `log_url` VALUES(153, 17, '2012-07-17 11:11:54');
INSERT INTO `log_url` VALUES(154, 17, '2012-07-17 11:12:07');
INSERT INTO `log_url` VALUES(155, 17, '2012-07-17 11:12:10');
INSERT INTO `log_url` VALUES(156, 17, '2012-07-17 11:12:11');
INSERT INTO `log_url` VALUES(157, 17, '2012-07-17 11:12:14');
INSERT INTO `log_url` VALUES(158, 17, '2012-07-17 11:13:09');
INSERT INTO `log_url` VALUES(159, 17, '2012-07-17 11:13:11');
INSERT INTO `log_url` VALUES(160, 17, '2012-07-17 11:13:16');
INSERT INTO `log_url` VALUES(161, 17, '2012-07-17 11:13:21');
INSERT INTO `log_url` VALUES(162, 17, '2012-07-17 11:13:22');
INSERT INTO `log_url` VALUES(163, 17, '2012-07-17 11:13:24');
INSERT INTO `log_url` VALUES(164, 17, '2012-07-17 11:13:32');
INSERT INTO `log_url` VALUES(165, 17, '2012-07-17 11:13:33');
INSERT INTO `log_url` VALUES(166, 17, '2012-07-17 11:13:34');
INSERT INTO `log_url` VALUES(167, 17, '2012-07-17 11:15:02');
INSERT INTO `log_url` VALUES(168, 17, '2012-07-17 11:15:03');
INSERT INTO `log_url` VALUES(169, 17, '2012-07-17 11:15:07');
INSERT INTO `log_url` VALUES(170, 17, '2012-07-17 11:20:36');
INSERT INTO `log_url` VALUES(171, 17, '2012-07-17 11:20:38');
INSERT INTO `log_url` VALUES(172, 17, '2012-07-17 11:20:48');
INSERT INTO `log_url` VALUES(173, 17, '2012-07-17 12:00:26');
INSERT INTO `log_url` VALUES(174, 17, '2012-07-17 12:00:27');
INSERT INTO `log_url` VALUES(175, 17, '2012-07-17 12:00:29');
INSERT INTO `log_url` VALUES(176, 17, '2012-07-17 12:00:37');
INSERT INTO `log_url` VALUES(177, 17, '2012-07-17 12:00:38');
INSERT INTO `log_url` VALUES(178, 17, '2012-07-17 12:00:40');
INSERT INTO `log_url` VALUES(179, 17, '2012-07-17 12:00:46');
INSERT INTO `log_url` VALUES(180, 17, '2012-07-17 12:00:47');
INSERT INTO `log_url` VALUES(181, 17, '2012-07-17 12:00:48');
INSERT INTO `log_url` VALUES(182, 17, '2012-07-17 12:00:50');
INSERT INTO `log_url` VALUES(183, 17, '2012-07-17 12:01:03');
INSERT INTO `log_url` VALUES(184, 17, '2012-07-17 12:01:04');
INSERT INTO `log_url` VALUES(185, 17, '2012-07-17 12:01:05');
INSERT INTO `log_url` VALUES(186, 17, '2012-07-17 12:01:45');
INSERT INTO `log_url` VALUES(187, 17, '2012-07-17 12:01:47');
INSERT INTO `log_url` VALUES(188, 17, '2012-07-17 12:01:48');
INSERT INTO `log_url` VALUES(189, 17, '2012-07-17 12:01:53');
INSERT INTO `log_url` VALUES(190, 17, '2012-07-17 12:01:54');
INSERT INTO `log_url` VALUES(191, 17, '2012-07-17 12:01:56');
INSERT INTO `log_url` VALUES(192, 17, '2012-07-17 12:02:42');
INSERT INTO `log_url` VALUES(193, 17, '2012-07-17 12:02:44');
INSERT INTO `log_url` VALUES(194, 17, '2012-07-17 12:02:45');
INSERT INTO `log_url` VALUES(195, 17, '2012-07-17 12:02:47');
INSERT INTO `log_url` VALUES(196, 17, '2012-07-17 12:03:00');
INSERT INTO `log_url` VALUES(197, 17, '2012-07-17 12:03:06');
INSERT INTO `log_url` VALUES(198, 17, '2012-07-17 12:03:07');
INSERT INTO `log_url` VALUES(199, 17, '2012-07-17 12:03:11');
INSERT INTO `log_url` VALUES(200, 17, '2012-07-17 12:03:15');
INSERT INTO `log_url` VALUES(201, 17, '2012-07-17 12:03:17');
INSERT INTO `log_url` VALUES(202, 17, '2012-07-17 12:03:19');
INSERT INTO `log_url` VALUES(203, 17, '2012-07-17 12:03:30');
INSERT INTO `log_url` VALUES(204, 17, '2012-07-17 12:03:31');
INSERT INTO `log_url` VALUES(205, 17, '2012-07-17 12:03:33');
INSERT INTO `log_url` VALUES(206, 17, '2012-07-17 12:06:12');
INSERT INTO `log_url` VALUES(207, 17, '2012-07-17 12:06:14');
INSERT INTO `log_url` VALUES(208, 17, '2012-07-17 12:06:16');
INSERT INTO `log_url` VALUES(209, 17, '2012-07-17 12:06:26');
INSERT INTO `log_url` VALUES(210, 17, '2012-07-17 12:06:28');
INSERT INTO `log_url` VALUES(211, 17, '2012-07-17 12:06:30');
INSERT INTO `log_url` VALUES(212, 17, '2012-07-17 12:10:14');
INSERT INTO `log_url` VALUES(213, 17, '2012-07-17 12:10:16');
INSERT INTO `log_url` VALUES(214, 17, '2012-07-17 12:10:20');
INSERT INTO `log_url` VALUES(215, 17, '2012-07-17 12:12:54');
INSERT INTO `log_url` VALUES(216, 17, '2012-07-17 12:12:56');
INSERT INTO `log_url` VALUES(217, 17, '2012-07-17 12:12:58');
INSERT INTO `log_url` VALUES(218, 17, '2012-07-17 12:13:38');
INSERT INTO `log_url` VALUES(219, 17, '2012-07-17 12:13:39');
INSERT INTO `log_url` VALUES(220, 17, '2012-07-17 12:13:45');
INSERT INTO `log_url` VALUES(221, 17, '2012-07-17 12:13:49');
INSERT INTO `log_url` VALUES(222, 17, '2012-07-17 12:13:50');
INSERT INTO `log_url` VALUES(223, 17, '2012-07-17 12:13:52');
INSERT INTO `log_url` VALUES(224, 17, '2012-07-17 12:21:01');
INSERT INTO `log_url` VALUES(225, 17, '2012-07-17 12:21:03');
INSERT INTO `log_url` VALUES(226, 17, '2012-07-17 12:21:05');
INSERT INTO `log_url` VALUES(227, 17, '2012-07-17 12:21:09');
INSERT INTO `log_url` VALUES(228, 17, '2012-07-17 12:21:10');
INSERT INTO `log_url` VALUES(229, 17, '2012-07-17 12:21:12');
INSERT INTO `log_url` VALUES(230, 17, '2012-07-17 12:21:15');
INSERT INTO `log_url` VALUES(231, 17, '2012-07-17 12:21:16');
INSERT INTO `log_url` VALUES(232, 17, '2012-07-17 12:21:18');
INSERT INTO `log_url` VALUES(233, 17, '2012-07-17 12:36:06');
INSERT INTO `log_url` VALUES(234, 17, '2012-07-17 12:36:08');
INSERT INTO `log_url` VALUES(235, 17, '2012-07-17 12:36:10');
INSERT INTO `log_url` VALUES(236, 17, '2012-07-17 12:36:32');
INSERT INTO `log_url` VALUES(237, 17, '2012-07-17 12:36:34');
INSERT INTO `log_url` VALUES(238, 17, '2012-07-17 12:36:35');
INSERT INTO `log_url` VALUES(239, 17, '2012-07-17 12:36:39');
INSERT INTO `log_url` VALUES(240, 17, '2012-07-17 12:36:40');
INSERT INTO `log_url` VALUES(241, 17, '2012-07-17 12:36:42');
INSERT INTO `log_url` VALUES(242, 17, '2012-07-17 12:38:26');
INSERT INTO `log_url` VALUES(243, 17, '2012-07-17 12:38:28');
INSERT INTO `log_url` VALUES(244, 17, '2012-07-17 12:38:30');
INSERT INTO `log_url` VALUES(245, 17, '2012-07-17 12:40:31');
INSERT INTO `log_url` VALUES(246, 17, '2012-07-17 12:40:33');
INSERT INTO `log_url` VALUES(247, 17, '2012-07-17 12:40:40');
INSERT INTO `log_url` VALUES(248, 17, '2012-07-17 12:40:49');
INSERT INTO `log_url` VALUES(249, 17, '2012-07-17 12:41:19');
INSERT INTO `log_url` VALUES(250, 17, '2012-07-17 12:41:21');
INSERT INTO `log_url` VALUES(251, 17, '2012-07-17 12:41:23');
INSERT INTO `log_url` VALUES(252, 17, '2012-07-17 12:41:26');
INSERT INTO `log_url` VALUES(253, 17, '2012-07-17 12:41:28');
INSERT INTO `log_url` VALUES(254, 17, '2012-07-17 12:41:29');
INSERT INTO `log_url` VALUES(255, 17, '2012-07-17 12:41:34');
INSERT INTO `log_url` VALUES(256, 17, '2012-07-17 12:41:35');
INSERT INTO `log_url` VALUES(257, 17, '2012-07-17 12:41:38');
INSERT INTO `log_url` VALUES(258, 17, '2012-07-17 12:41:42');
INSERT INTO `log_url` VALUES(259, 17, '2012-07-17 12:41:44');
INSERT INTO `log_url` VALUES(260, 17, '2012-07-17 12:41:46');
INSERT INTO `log_url` VALUES(261, 17, '2012-07-17 12:41:48');
INSERT INTO `log_url` VALUES(262, 17, '2012-07-17 12:47:09');
INSERT INTO `log_url` VALUES(263, 17, '2012-07-17 12:47:11');
INSERT INTO `log_url` VALUES(264, 17, '2012-07-17 12:47:15');
INSERT INTO `log_url` VALUES(265, 17, '2012-07-17 12:47:18');
INSERT INTO `log_url` VALUES(266, 17, '2012-07-17 12:47:19');
INSERT INTO `log_url` VALUES(267, 17, '2012-07-17 12:47:49');
INSERT INTO `log_url` VALUES(268, 17, '2012-07-17 12:47:50');
INSERT INTO `log_url` VALUES(269, 17, '2012-07-17 12:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `log_url_info`
--

CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'URL ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table' AUTO_INCREMENT=270 ;

--
-- Dumping data for table `log_url_info`
--

INSERT INTO `log_url_info` VALUES(1, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/install/wizard/end/');
INSERT INTO `log_url_info` VALUES(2, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/install/wizard/end/');
INSERT INTO `log_url_info` VALUES(3, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/install/wizard/end/');
INSERT INTO `log_url_info` VALUES(4, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(5, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(6, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(7, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(8, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(9, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(10, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(11, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(12, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(13, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(14, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(15, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(16, 'http://localhost:8888/magento/index.php/checkout/cart/add/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,/product/1/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(17, 'http://localhost:8888/magento/index.php/checkout/cart/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(18, 'http://localhost:8888/magento/index.php/checkout/onepage/', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(19, 'http://localhost:8888/magento/index.php/checkout/onepage/saveMethod/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(20, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=billing', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(21, 'http://localhost:8888/magento/index.php/checkout/onepage/saveBilling/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(22, 'http://localhost:8888/magento/index.php/checkout/onepage/getAdditional/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(23, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=shipping_method', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(24, 'http://localhost:8888/magento/index.php/checkout/onepage/saveShippingMethod/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(25, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(26, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=payment', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(27, 'http://localhost:8888/magento/index.php/checkout/onepage/savePayment/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(28, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=review', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(29, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(30, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(31, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(32, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(33, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(34, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(35, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(36, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(37, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(38, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(39, 'http://localhost:8888/magento/index.php?XDEBUG_SESSION_START=netbeans-xdebug', NULL);
INSERT INTO `log_url_info` VALUES(40, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(41, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(42, 'http://localhost:8888/magento/ccavanue/css/styles.css', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(43, 'http://localhost:8888/magento/ccavanue/images/logo.gif', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(44, 'http://localhost:8888/magento/ccavanue/images/favicon.ico', NULL);
INSERT INTO `log_url_info` VALUES(45, 'http://localhost:8888/magento/ccavanue/images/favicon.ico', NULL);
INSERT INTO `log_url_info` VALUES(46, 'http://localhost:8888/magento/ccavanue/images/favicon.ico', NULL);
INSERT INTO `log_url_info` VALUES(47, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(48, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(49, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(50, 'http://localhost:8888/magento/ccavanue/images/logo.gif', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(51, 'http://localhost:8888/magento/ccavanue/css/styles.css', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(52, 'http://localhost:8888/magento/ccavanue/css/styles.css', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(53, 'http://localhost:8888/magento/ccavanue/images/logo.gif', 'http://localhost:8888/magento/ccavanue/index');
INSERT INTO `log_url_info` VALUES(54, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(55, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(56, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(57, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(58, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(59, 'http://localhost:8888/magento/ccavanue/index', NULL);
INSERT INTO `log_url_info` VALUES(60, 'http://localhost:8888/magento/hellowworld', NULL);
INSERT INTO `log_url_info` VALUES(61, 'http://localhost:8888/magento/helloworld', NULL);
INSERT INTO `log_url_info` VALUES(62, 'http://localhost:8888/magento/helloworld/index', NULL);
INSERT INTO `log_url_info` VALUES(63, 'http://localhost:8888/magento/helloworld/index', NULL);
INSERT INTO `log_url_info` VALUES(64, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(65, 'http://localhost:8888/magento/helloworld/index/goodbye', NULL);
INSERT INTO `log_url_info` VALUES(66, 'http://localhost:8888/magento/helloworld/index/params?foo=bar&baz=eof', NULL);
INSERT INTO `log_url_info` VALUES(67, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(68, 'http://localhost:8888/magento/helloworld/index/index?showLayout=page', NULL);
INSERT INTO `log_url_info` VALUES(69, 'http://localhost:8888/magento/helloworld/index/index?showLayout=page', NULL);
INSERT INTO `log_url_info` VALUES(70, 'http://localhost:8888/magento/helloworld/index/index?showLayout=page', NULL);
INSERT INTO `log_url_info` VALUES(71, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(72, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(73, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(74, 'http://localhost:8888/magento/helloworld/index/goodbye', NULL);
INSERT INTO `log_url_info` VALUES(75, 'http://localhost:8888/magento/helloworld/index/goodbye', NULL);
INSERT INTO `log_url_info` VALUES(76, 'http://localhost:8888/magento/helloworld/index/', NULL);
INSERT INTO `log_url_info` VALUES(77, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(78, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(79, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(80, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(81, 'http://localhost:8888/magento/helloworld/', NULL);
INSERT INTO `log_url_info` VALUES(82, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(83, 'http://localhost:8888/magento/helloworld/index', NULL);
INSERT INTO `log_url_info` VALUES(84, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(85, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(86, 'http://localhost:8888/magento/index.php/checkout/cart/add/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,/product/1/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(87, 'http://localhost:8888/magento/index.php/checkout/cart/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(88, 'http://localhost:8888/magento/index.php/checkout/onepage/', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(89, 'http://localhost:8888/magento/index.php/checkout/onepage/saveMethod/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(90, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=billing', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(91, 'http://localhost:8888/magento/index.php/checkout/onepage/saveBilling/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(92, 'http://localhost:8888/magento/index.php/checkout/onepage/getAdditional/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(93, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=shipping_method', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(94, 'http://localhost:8888/magento/index.php/checkout/onepage/saveShippingMethod/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(95, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=payment', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(96, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(97, 'http://localhost:8888/magento/index.php/checkout/onepage/savePayment/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(98, 'http://localhost:8888/magento/index.php/checkout/onepage/progress/?toStep=review', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(99, 'http://localhost:8888/magento/index.php/checkout/onepage/saveOrder/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(100, 'http://localhost:8888/magento/index.php/cCAVENUE/standard/redirect/', 'http://localhost:8888/magento/index.php/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(101, 'http://localhost:8888/magento/index.php/cCAVENUE/standard/success/', NULL);
INSERT INTO `log_url_info` VALUES(102, 'http://localhost:8888/magento/index.php/checkout/cart/', NULL);
INSERT INTO `log_url_info` VALUES(103, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(104, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(105, 'http://localhost:8888/magento/index.php/catalog/product/view/id/1/category/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(106, 'http://localhost:8888/magento/index.php/catalog/product/gallery/id/1/image/1/', 'http://localhost:8888/magento/index.php/t-shirts/red-t-shirt.html');
INSERT INTO `log_url_info` VALUES(107, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/t-shirts/red-t-shirt.html');
INSERT INTO `log_url_info` VALUES(108, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(109, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(110, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(111, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(112, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(113, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=list', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(114, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=list');
INSERT INTO `log_url_info` VALUES(115, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=list', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=list');
INSERT INTO `log_url_info` VALUES(116, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=list', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(117, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=list');
INSERT INTO `log_url_info` VALUES(118, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=list', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=list');
INSERT INTO `log_url_info` VALUES(119, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=list');
INSERT INTO `log_url_info` VALUES(120, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(121, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(122, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(123, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(124, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(125, 'http://localhost:8888/magento/index.php/catalog/product_compare/add/product/1/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(126, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(127, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(128, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(129, 'http://localhost:8888/magento/index.php/catalogsearch/ajax/suggest/?q=red', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(130, 'http://localhost:8888/magento/index.php/catalogsearch/result/?q=red', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(131, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/catalogsearch/result/?q=red');
INSERT INTO `log_url_info` VALUES(132, 'http://localhost:8888/magento/index.php/catalogsearch/result/?q=red', 'http://localhost:8888/magento/index.php/catalogsearch/result/?q=red');
INSERT INTO `log_url_info` VALUES(133, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/catalogsearch/result/?q=red');
INSERT INTO `log_url_info` VALUES(134, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(135, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(136, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(137, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(138, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(139, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(140, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(141, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(142, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(143, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(144, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(145, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(146, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(147, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(148, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(149, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(150, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(151, 'http://localhost:8888/magento/index.php', NULL);
INSERT INTO `log_url_info` VALUES(152, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(153, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(154, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(155, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(156, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(157, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(158, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(159, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(160, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(161, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(162, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(163, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(164, 'http://localhost:8888/magento/index.php', NULL);
INSERT INTO `log_url_info` VALUES(165, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(166, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(167, 'http://localhost:8888/magento/index.php', NULL);
INSERT INTO `log_url_info` VALUES(168, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(169, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(170, 'http://localhost:8888/magento/index.php', NULL);
INSERT INTO `log_url_info` VALUES(171, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(172, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(173, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(174, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(175, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(176, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(177, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(178, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(179, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=grid', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(180, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=grid', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(181, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=grid');
INSERT INTO `log_url_info` VALUES(182, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3?mode=grid', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=grid');
INSERT INTO `log_url_info` VALUES(183, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/t-shirts.html?mode=grid');
INSERT INTO `log_url_info` VALUES(184, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(185, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(186, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(187, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(188, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(189, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(190, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(191, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(192, 'http://localhost:8888/magento/index.php/catalog/product_compare/remove/product/1/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(193, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(194, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(195, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(196, 'http://localhost:8888/magento/index.php/checkout/cart/add/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,/product/1/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(197, 'http://localhost:8888/magento/index.php/checkout/cart/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(198, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(199, 'http://localhost:8888/magento/index.php/checkout/cart/', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(200, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/checkout/cart/');
INSERT INTO `log_url_info` VALUES(201, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(202, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(203, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(204, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(205, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(206, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(207, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(208, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(209, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(210, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(211, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(212, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(213, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(214, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(215, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(216, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(217, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(218, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(219, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(220, 'http://localhost:8888/magento/index.php/', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(221, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/');
INSERT INTO `log_url_info` VALUES(222, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(223, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(224, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(225, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(226, 'http://localhost:8888/magento/index.php/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php/t-shirts.html');
INSERT INTO `log_url_info` VALUES(227, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(228, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(229, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(230, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(231, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(232, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(233, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(234, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(235, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(236, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(237, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(238, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(239, 'http://localhost:8888/magento/', NULL);
INSERT INTO `log_url_info` VALUES(240, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(241, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(242, 'http://localhost:8888/magento/catalog/category/view/id/3', NULL);
INSERT INTO `log_url_info` VALUES(243, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(244, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(245, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(246, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(247, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(248, 'http://localhost:8888/magento/index.php', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(249, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/index.php');
INSERT INTO `log_url_info` VALUES(250, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(251, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(252, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(253, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(254, 'http://localhost:8888/magento/', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(255, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/');
INSERT INTO `log_url_info` VALUES(256, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(257, 'http://localhost:8888/magento/catalog/category/view/id/3', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(258, 'http://localhost:8888/magento/checkout/cart/add/uenc/aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vdC1zaGlydHMuaHRtbA,,/product/1/', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(259, 'http://localhost:8888/magento/checkout/cart/', 'http://localhost:8888/magento/t-shirts.html');
INSERT INTO `log_url_info` VALUES(260, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/checkout/cart/');
INSERT INTO `log_url_info` VALUES(261, 'http://localhost:8888/magento/checkout/cart/', 'http://localhost:8888/magento/checkout/cart/');
INSERT INTO `log_url_info` VALUES(262, 'http://localhost:8888/magento/checkout/onepage/', 'http://localhost:8888/magento/checkout/cart/');
INSERT INTO `log_url_info` VALUES(263, 'http://localhost:8888/magento/skin/frontend/base/default/js/jquery.preloader.js', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(264, 'http://localhost:8888/magento/checkout/onepage/', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(265, 'http://localhost:8888/magento/checkout/onepage/saveMethod/', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(266, 'http://localhost:8888/magento/checkout/onepage/progress/?toStep=billing', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(267, 'http://localhost:8888/magento/checkout/onepage/saveBilling/', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(268, 'http://localhost:8888/magento/checkout/onepage/getAdditional/', 'http://localhost:8888/magento/checkout/onepage/');
INSERT INTO `log_url_info` VALUES(269, 'http://localhost:8888/magento/checkout/onepage/progress/?toStep=shipping_method', 'http://localhost:8888/magento/checkout/onepage/');

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor`
--

CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Last URL ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `log_visitor`
--

INSERT INTO `log_visitor` VALUES(1, '7d83aba6524df12bc1cb79bed0a019a1', '2012-07-05 11:53:41', '2012-07-05 11:53:48', 1, 1);
INSERT INTO `log_visitor` VALUES(2, '9346c1033d01dc4246b6ce46ad2b36a0', '2012-07-05 14:41:26', '2012-07-05 14:41:47', 3, 1);
INSERT INTO `log_visitor` VALUES(3, '1ac465ea4bda76afded13da130d28923', '2012-07-09 06:22:02', '2012-07-09 06:22:06', 4, 1);
INSERT INTO `log_visitor` VALUES(4, '107787ab932394d68ac628cb623c63f8', '2012-07-09 10:54:41', '2012-07-09 11:35:42', 8, 1);
INSERT INTO `log_visitor` VALUES(5, 'ad2ce818f8d763fe5385839680883ad6', '2012-07-10 10:10:07', '2012-07-10 10:10:13', 9, 1);
INSERT INTO `log_visitor` VALUES(6, 'ad2ce818f8d763fe5385839680883ad6', '2012-07-10 10:52:03', '2012-07-10 11:58:01', 36, 1);
INSERT INTO `log_visitor` VALUES(7, '9ad46e13baeed7761d3e4574ce21b84b', '2012-07-11 04:58:50', '2012-07-11 04:59:34', 38, 1);
INSERT INTO `log_visitor` VALUES(8, '40132c4c8f7f12aeea155b6b372db14f', '2012-07-11 07:23:54', '2012-07-11 07:23:54', 39, 1);
INSERT INTO `log_visitor` VALUES(9, 'd5c34acec4db83c145e3500b62848981', '2012-07-13 06:06:12', '2012-07-13 06:06:17', 40, 1);
INSERT INTO `log_visitor` VALUES(10, '0cb01a59515439d37ed0863722dc8f48', '2012-07-13 10:21:53', '2012-07-13 10:35:54', 54, 1);
INSERT INTO `log_visitor` VALUES(11, 'ee3dca38d8f55be729e3fba611832c7c', '2012-07-16 07:04:27', '2012-07-16 07:40:58', 59, 1);
INSERT INTO `log_visitor` VALUES(12, '149f40b2b38e81588331ed880b160502', '2012-07-16 10:07:25', '2012-07-16 10:22:44', 66, 1);
INSERT INTO `log_visitor` VALUES(13, '3b52cfd5e71256f671c201e4e9af140f', '2012-07-16 14:10:57', '2012-07-16 15:07:11', 81, 1);
INSERT INTO `log_visitor` VALUES(14, 'b48a681c5549033b16633ce0159235f3', '2012-07-17 04:52:41', '2012-07-17 04:53:52', 83, 1);
INSERT INTO `log_visitor` VALUES(15, 'bc0ff6a53e1e3a3fb5db9e9275a7d480', '2012-07-17 07:17:55', '2012-07-17 07:22:31', 102, 1);
INSERT INTO `log_visitor` VALUES(16, 'bc0ff6a53e1e3a3fb5db9e9275a7d480', '2012-07-17 07:58:26', '2012-07-17 07:58:46', 104, 1);
INSERT INTO `log_visitor` VALUES(17, '775e5f0c700b0373549923b3a39e93aa', '2012-07-17 09:19:20', '2012-07-17 12:47:51', 269, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_info`
--

CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` bigint(20) DEFAULT NULL COMMENT 'Server Address',
  `remote_addr` bigint(20) DEFAULT NULL COMMENT 'Remote Address',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';

--
-- Dumping data for table `log_visitor_info`
--

INSERT INTO `log_visitor_info` VALUES(1, 'http://localhost:8888/magento/index.php/install/wizard/end/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(2, 'http://localhost:8888/magento/index.php/install/wizard/end/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(3, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(4, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(5, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(6, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(7, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(8, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(9, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(10, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(11, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(12, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(13, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(14, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(15, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(16, 'http://localhost:8888/magento/index.php/checkout/cart/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);
INSERT INTO `log_visitor_info` VALUES(17, 'http://localhost:8888/magento/index.php/t-shirts.html', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1', NULL, 'en-us,en;q=0.5', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_online`
--

CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` bigint(20) NOT NULL COMMENT 'Remote Address',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL',
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_visitor_online`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

CREATE TABLE `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

CREATE TABLE `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_queue_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `IDX_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

--
-- Dumping data for table `newsletter_queue_store_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_subscriber`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

CREATE TABLE `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_text_preprocessed` text COMMENT 'Template Text Preprocessed',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `IDX_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `IDX_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `IDX_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `IDX_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oauth_consumer`
--


-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  UNIQUE KEY `UNQ_OAUTH_NONCE_NONCE` (`nonce`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='oauth_nonce';

--
-- Dumping data for table `oauth_nonce`
--


-- --------------------------------------------------------

--
-- Table structure for table `oauth_token`
--

CREATE TABLE `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `IDX_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `oauth_token`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_cert`
--

CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `IDX_PAYPAL_CERT_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_cert`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_transaction`
--

CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_payment_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report`
--

CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `UNQ_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_settlement_report`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report_row`
--

CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT '' COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  PRIMARY KEY (`row_id`),
  KEY `IDX_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_settlement_report_row`
--


-- --------------------------------------------------------

--
-- Table structure for table `persistent_session`
--

CREATE TABLE `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `persistent_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Poll Id',
  `poll_title` varchar(255) DEFAULT NULL COMMENT 'Poll title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date posted',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `closed` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is closed',
  `answers_display` smallint(6) DEFAULT NULL COMMENT 'Answers display',
  PRIMARY KEY (`poll_id`),
  KEY `IDX_POLL_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Poll' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` VALUES(1, 'What is your favorite color', 7, 0, '2012-07-05 17:21:42', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poll_answer`
--

CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Answer Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `answer_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Answers display',
  PRIMARY KEY (`answer_id`),
  KEY `IDX_POLL_ANSWER_POLL_ID` (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Poll Answers' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `poll_answer`
--

INSERT INTO `poll_answer` VALUES(1, 1, 'Green', 4, 0);
INSERT INTO `poll_answer` VALUES(2, 1, 'Red', 1, 0);
INSERT INTO `poll_answer` VALUES(3, 1, 'Black', 0, 0);
INSERT INTO `poll_answer` VALUES(4, 1, 'Magenta', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_store`
--

CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `IDX_POLL_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Store';

--
-- Dumping data for table `poll_store`
--

INSERT INTO `poll_store` VALUES(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll answer id',
  `ip_address` bigint(20) DEFAULT NULL COMMENT 'Poll answer id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer id',
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_POLL_VOTE_POLL_ANSWER_ID` (`poll_answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Vote' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `poll_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `product_alert_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `product_alert_stock`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Frontend',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `UNQ_RATING_RATING_CODE` (`rating_code`),
  KEY `IDX_RATING_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Ratings' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` VALUES(1, 1, 'Quality', 0);
INSERT INTO `rating` VALUES(2, 1, 'Value', 0);
INSERT INTO `rating` VALUES(3, 1, 'Price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

CREATE TABLE `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` VALUES(1, 'product');
INSERT INTO `rating_entity` VALUES(2, 'product_review');
INSERT INTO `rating_entity` VALUES(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on frontend',
  PRIMARY KEY (`option_id`),
  KEY `IDX_RATING_OPTION_RATING_ID` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating options' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` VALUES(1, 1, '1', 1, 1);
INSERT INTO `rating_option` VALUES(2, 1, '2', 2, 2);
INSERT INTO `rating_option` VALUES(3, 1, '3', 3, 3);
INSERT INTO `rating_option` VALUES(4, 1, '4', 4, 4);
INSERT INTO `rating_option` VALUES(5, 1, '5', 5, 5);
INSERT INTO `rating_option` VALUES(6, 2, '1', 1, 1);
INSERT INTO `rating_option` VALUES(7, 2, '2', 2, 2);
INSERT INTO `rating_option` VALUES(8, 2, '3', 3, 3);
INSERT INTO `rating_option` VALUES(9, 2, '4', 4, 4);
INSERT INTO `rating_option` VALUES(10, 2, '5', 5, 5);
INSERT INTO `rating_option` VALUES(11, 3, '1', 1, 1);
INSERT INTO `rating_option` VALUES(12, 3, '2', 2, 2);
INSERT INTO `rating_option` VALUES(13, 3, '3', 3, 3);
INSERT INTO `rating_option` VALUES(14, 3, '4', 4, 4);
INSERT INTO `rating_option` VALUES(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rating_option_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rating_option_vote_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

CREATE TABLE `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

--
-- Dumping data for table `rating_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

CREATE TABLE `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

--
-- Dumping data for table `rating_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `report_compared_product_index`
--

INSERT INTO `report_compared_product_index` VALUES(1, 17, NULL, 1, 1, '2012-07-17 10:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `IDX_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `IDX_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `IDX_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `IDX_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `IDX_REPORT_EVENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `report_event`
--

INSERT INTO `report_event` VALUES(1, '2012-07-10 11:17:55', 4, 1, 6, 1, 1);
INSERT INTO `report_event` VALUES(2, '2012-07-17 07:18:07', 4, 1, 15, 1, 1);
INSERT INTO `report_event` VALUES(3, '2012-07-17 09:19:20', 1, 1, 17, 1, 1);
INSERT INTO `report_event` VALUES(4, '2012-07-17 10:29:01', 3, 1, 17, 1, 1);
INSERT INTO `report_event` VALUES(5, '2012-07-17 12:02:59', 4, 1, 17, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

CREATE TABLE `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` VALUES(1, 'catalog_product_view', 0);
INSERT INTO `report_event_types` VALUES(2, 'sendfriend_product', 0);
INSERT INTO `report_event_types` VALUES(3, 'catalog_product_compare_add_product', 0);
INSERT INTO `report_event_types` VALUES(4, 'checkout_cart_add_product', 0);
INSERT INTO `report_event_types` VALUES(5, 'wishlist_add_product', 0);
INSERT INTO `report_event_types` VALUES(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_viewed_product_aggregated_daily`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_viewed_product_aggregated_monthly`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_viewed_product_aggregated_yearly`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `report_viewed_product_index`
--

INSERT INTO `report_viewed_product_index` VALUES(1, 17, NULL, 1, 1, '2012-07-17 09:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `IDX_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `IDX_REVIEW_STATUS_ID` (`status_id`),
  KEY `IDX_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `IDX_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `IDX_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `IDX_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review_detail`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` VALUES(1, 'product');
INSERT INTO `review_entity` VALUES(2, 'customer');
INSERT INTO `review_entity` VALUES(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review_entity_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

CREATE TABLE `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review statuses' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` VALUES(1, 'Approved');
INSERT INTO `review_status` VALUES(2, 'Pending');
INSERT INTO `review_status` VALUES(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `IDX_REVIEW_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

--
-- Dumping data for table `review_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL COMMENT 'Discount Step',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Coupon',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon`
--

CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `IDX_SALESRULE_COUPON_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule_coupon`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_usage`
--

CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `IDX_SALESRULE_COUPON_USAGE_COUPON_ID` (`coupon_id`),
  KEY `IDX_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

--
-- Dumping data for table `salesrule_coupon_usage`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer_group`
--

CREATE TABLE `salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_SALESRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

--
-- Dumping data for table `salesrule_customer_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `UNQ_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `IDX_SALESRULE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_SALESRULE_LABEL_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_product_attribute`
--

CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

--
-- Dumping data for table `salesrule_product_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_website`
--

CREATE TABLE `salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_SALESRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

--
-- Dumping data for table `salesrule_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_billing_agreement`
--

CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_billing_agreement`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_billing_agreement_order`
--

CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

--
-- Dumping data for table `sales_billing_agreement_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo`
--

CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_STATE` (`state`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_creditmemo`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_creditmemo_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STATE` (`state`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

--
-- Dumping data for table `sales_flat_creditmemo_grid`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_item`
--

CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_creditmemo_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice`
--

CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_INVOICE_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_INVOICE_STATE` (`state`),
  KEY `IDX_SALES_FLAT_INVOICE_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_invoice`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_comment`
--

CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_invoice_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_grid`
--

CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_STATE` (`state`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_BILLING_NAME` (`billing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

--
-- Dumping data for table `sales_flat_invoice_grid`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_item`
--

CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_INVOICE_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_invoice_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order`
--

CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_ORDER_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS` (`status`),
  KEY `IDX_SALES_FLAT_ORDER_STATE` (`state`),
  KEY `IDX_SALES_FLAT_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_ORDER_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_FLAT_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_SALES_FLAT_ORDER_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_FLAT_ORDER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_flat_order`
--

INSERT INTO `sales_flat_order` VALUES(1, 'new', 'pending', NULL, 'aab647', 'Flat Rate - Fixed', 0, 1, NULL, 0.0000, NULL, NULL, NULL, 6.0000, 5.0000, NULL, NULL, NULL, 0.0000, NULL, 1.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 1.0000, 1.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 6.0000, 5.0000, NULL, NULL, NULL, 0.0000, NULL, 1.0000, 1.0000, 1.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, 0.0000, 1.0000, 6.0000, NULL, 0.0000, 1.0000, 6.0000, 1000.0000, NULL, '100000001', NULL, 'USD', 'dropmail.pankaj@yahoo.co.in', 'Pankaj', 'Sahni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', NULL, NULL, 'USD', NULL, NULL, NULL, NULL, NULL, '::1', 'flatrate_flatrate', 'USD', 'Main Website\nMain Website Store\nDefault Store View', NULL, NULL, '2012-07-17 07:20:58', '2012-07-17 07:21:00', 1, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, 5.0000, 5.0000, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_address`
--

CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_ADDRESS_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sales_flat_order_address`
--

INSERT INTO `sales_flat_order_address` VALUES(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '143001', 'Sahni', '23', 'noida', 'dropmail.pankaj@yahoo.co.in', '9990341474', 'IN', 'Pankaj', 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_order_address` VALUES(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '143001', 'Sahni', '23', 'noida', 'dropmail.pankaj@yahoo.co.in', '9990341474', 'IN', 'Pankaj', 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_grid`
--

CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_STATUS` (`status`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

--
-- Dumping data for table `sales_flat_order_grid`
--

INSERT INTO `sales_flat_order_grid` VALUES(1, 'pending', 1, 'Main Website\nMain Website Store\nDefault Store View', NULL, 6.0000, NULL, 6.0000, NULL, '100000001', 'USD', 'USD', 'Pankaj Sahni', 'Pankaj Sahni', '2012-07-17 07:20:58', '2012-07-17 07:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_item`
--

CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_FLAT_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_ORDER_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_flat_order_item`
--

INSERT INTO `sales_flat_order_item` VALUES(1, 1, NULL, 2, 1, '2012-07-17 07:20:58', '2012-07-17 07:21:00', 1, 'simple', 'a:1:{s:15:"info_buyRequest";a:3:{s:4:"uenc";s:72:"aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,";s:7:"product";s:1:"1";s:3:"qty";i:1;}}', 1000.0000, 0, '001', 'Red T-shirt', NULL, NULL, NULL, 0, 0, 0, NULL, 0.0000, 0.0000, 1.0000, 0.0000, 0.0000, NULL, 1.0000, 1.0000, 1.0000, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 0.0000, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 'a:0:{}', 0.0000, 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_payment`
--

CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `paybox_request_number` varchar(255) DEFAULT NULL COMMENT 'Paybox Request Number',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_PAYMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_flat_order_payment`
--

INSERT INTO `sales_flat_order_payment` VALUES(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5.0000, 5.0000, NULL, NULL, 6.0000, NULL, NULL, NULL, 6.0000, NULL, NULL, NULL, '0', '0', NULL, 'avenues_standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_status_history`
--

CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sales_flat_order_status_history`
--

INSERT INTO `sales_flat_order_status_history` VALUES(1, 1, 1, 0, NULL, 'pending', '2012-07-17 07:20:59', 'order');
INSERT INTO `sales_flat_order_status_history` VALUES(2, 1, 0, 0, 'Customer was redirected to avenues', 'pending', '2012-07-17 07:21:00', 'order');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote`
--

CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `IDX_SALES_FLAT_QUOTE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sales_flat_quote`
--

INSERT INTO `sales_flat_quote` VALUES(1, 1, '2012-07-10 11:17:55', '2012-07-10 11:20:18', NULL, 1, 0, 0, 1, 1.0000, 0, 1.0000, 1.0000, 'USD', 'USD', 'USD', 6.0000, 6.0000, 'guest', NULL, 3, 0, 'dropmail.pankaj@yahoo.co.in', NULL, 'ddgdg', NULL, 'dfgdg', NULL, NULL, NULL, 1, 0, '::1', NULL, NULL, NULL, NULL, 'USD', 1.0000, 1.0000, NULL, NULL, 1.0000, 1.0000, 1.0000, 1.0000, 1, 0, NULL, NULL, 0);
INSERT INTO `sales_flat_quote` VALUES(2, 1, '2012-07-17 07:18:07', '2012-07-17 07:20:59', NULL, 0, 0, 0, 1, 1.0000, 0, 1.0000, 1.0000, 'USD', 'USD', 'USD', 6.0000, 6.0000, 'guest', NULL, 3, 0, 'dropmail.pankaj@yahoo.co.in', NULL, 'Pankaj', NULL, 'Sahni', NULL, NULL, NULL, 1, 1, '::1', NULL, '100000001', NULL, NULL, 'USD', 1.0000, 1.0000, NULL, NULL, 1.0000, 1.0000, 1.0000, 1.0000, 1, 0, NULL, NULL, 0);
INSERT INTO `sales_flat_quote` VALUES(3, 1, '2012-07-17 12:02:59', '2012-07-17 12:47:49', NULL, 1, 0, 0, 1, 2.0000, 0, 1.0000, 1.0000, 'USD', 'USD', 'USD', 2.0000, 2.0000, 'guest', NULL, 3, 0, 'jhkjh@jkhkh.com', NULL, 'jkkjhk', NULL, 'kjhjk', NULL, NULL, NULL, 1, 0, '::1', NULL, NULL, NULL, NULL, 'USD', 1.0000, 1.0000, NULL, NULL, 2.0000, 2.0000, 2.0000, 2.0000, 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address`
--

CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sales_flat_quote_address`
--

INSERT INTO `sales_flat_quote_address` VALUES(3, 1, '2012-07-10 11:17:56', '2012-07-10 11:20:18', NULL, 1, NULL, 'billing', 'dropmail.pankaj@yahoo.co.in', NULL, 'ddgdg', NULL, 'dfgdg', NULL, NULL, '52-shori nagar', 'noida', 'up', 22, '143001', 'IN', '9990341474', NULL, 0, 0, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'a:0:{}', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_address` VALUES(4, 1, '2012-07-10 11:17:56', '2012-07-10 11:20:18', NULL, 0, NULL, 'shipping', 'dropmail.pankaj@yahoo.co.in', NULL, 'ddgdg', NULL, 'dfgdg', NULL, NULL, '52-shori nagar', 'noida', 'up', 22, '143001', 'IN', '9990341474', NULL, 1, 0, 0, 'flatrate_flatrate', 'Flat Rate - Fixed', 1000.0000, 1.0000, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, 5.0000, 5.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6.0000, 6.0000, NULL, 'a:0:{}', NULL, 0.0000, 0.0000, 1.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 5.0000, 5.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_address` VALUES(7, 2, '2012-07-17 07:18:09', '2012-07-17 07:20:58', NULL, 1, NULL, 'billing', 'dropmail.pankaj@yahoo.co.in', NULL, 'Pankaj', NULL, 'Sahni', NULL, NULL, '23', 'noida', NULL, NULL, '143001', 'IN', '9990341474', NULL, 0, 0, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'a:0:{}', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_address` VALUES(8, 2, '2012-07-17 07:18:09', '2012-07-17 07:20:58', NULL, 0, NULL, 'shipping', 'dropmail.pankaj@yahoo.co.in', NULL, 'Pankaj', NULL, 'Sahni', NULL, NULL, '23', 'noida', NULL, NULL, '143001', 'IN', '9990341474', NULL, 1, 0, 0, 'flatrate_flatrate', 'Flat Rate - Fixed', 1000.0000, 1.0000, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, 5.0000, 5.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6.0000, 6.0000, NULL, 'a:0:{}', NULL, 0.0000, 0.0000, 1.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 5.0000, 5.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_address` VALUES(11, 3, '2012-07-17 12:03:01', '2012-07-17 12:47:49', NULL, 1, NULL, 'billing', 'jhkjh@jkhkh.com', NULL, 'jkkjhk', NULL, 'kjhjk', NULL, NULL, 'hj', 'jkhjk', NULL, NULL, '143001', 'IN', '99999999', NULL, 0, 0, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'a:0:{}', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_address` VALUES(12, 3, '2012-07-17 12:03:01', '2012-07-17 12:47:49', NULL, 0, NULL, 'shipping', 'jhkjh@jkhkh.com', NULL, 'jkkjhk', NULL, 'kjhjk', NULL, NULL, 'hj', 'jkhjk', NULL, NULL, '143001', 'IN', '99999999', NULL, 1, 0, 0, NULL, NULL, 2000.0000, 2.0000, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 2.0000, 2.0000, NULL, 'a:0:{}', NULL, 0.0000, 0.0000, 2.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address_item`
--

CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_address_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item`
--

CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sales_flat_quote_item`
--

INSERT INTO `sales_flat_quote_item` VALUES(1, 1, '2012-07-10 11:17:55', '2012-07-10 11:17:55', 1, 1, NULL, 0, '001', 'Red T-shirt', NULL, NULL, NULL, 0, 0, 0, 1000.0000, 1.0000, 1.0000, 1.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 0.0000, 1000.0000, 'simple', NULL, NULL, NULL, NULL, NULL, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 'a:0:{}', 0.0000, 0.0000, 0.0000, NULL);
INSERT INTO `sales_flat_quote_item` VALUES(2, 2, '2012-07-17 07:18:07', '2012-07-17 07:18:07', 1, 1, NULL, 0, '001', 'Red T-shirt', NULL, NULL, NULL, 0, 0, 0, 1000.0000, 1.0000, 1.0000, 1.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 0.0000, 1000.0000, 'simple', NULL, NULL, NULL, NULL, NULL, 1.0000, 1.0000, 1.0000, 1.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 'a:0:{}', 0.0000, 0.0000, 0.0000, NULL);
INSERT INTO `sales_flat_quote_item` VALUES(3, 3, '2012-07-17 12:02:59', '2012-07-17 12:41:42', 1, 1, NULL, 0, '001', 'Red T-shirt', NULL, NULL, NULL, 0, 0, 0, 1000.0000, 2.0000, 1.0000, 1.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 2.0000, 2.0000, 0.0000, 2000.0000, 'simple', NULL, NULL, NULL, NULL, NULL, 1.0000, 1.0000, 2.0000, 2.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 'a:0:{}', 0.0000, 0.0000, 0.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item_option`
--

CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sales_flat_quote_item_option`
--

INSERT INTO `sales_flat_quote_item_option` VALUES(1, 1, 1, 'info_buyRequest', 'a:3:{s:4:"uenc";s:72:"aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,";s:7:"product";s:1:"1";s:3:"qty";i:1;}');
INSERT INTO `sales_flat_quote_item_option` VALUES(2, 2, 1, 'info_buyRequest', 'a:3:{s:4:"uenc";s:72:"aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vaW5kZXgucGhwL3Qtc2hpcnRzLmh0bWw,";s:7:"product";s:1:"1";s:3:"qty";i:1;}');
INSERT INTO `sales_flat_quote_item_option` VALUES(3, 3, 1, 'info_buyRequest', 'a:3:{s:4:"uenc";s:60:"aHR0cDovL2xvY2FsaG9zdDo4ODg4L21hZ2VudG8vdC1zaGlydHMuaHRtbA,,";s:7:"product";s:1:"1";s:3:"qty";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_payment`
--

CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `IDX_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sales_flat_quote_payment`
--

INSERT INTO `sales_flat_quote_payment` VALUES(1, 1, '2012-07-10 11:18:16', '2012-07-10 11:20:18', 'checkmo', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_payment` VALUES(2, 2, '2012-07-17 07:18:18', '2012-07-17 07:20:58', 'avenues_standard', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sales_flat_quote_payment` VALUES(3, 3, '2012-07-17 12:47:07', '2012-07-17 12:47:14', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `IDX_SALES_FLAT_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--

INSERT INTO `sales_flat_quote_shipping_rate` VALUES(3, 4, '2012-07-10 11:20:18', '2012-07-10 11:20:18', 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'flatrate', NULL, 5.0000, NULL, 'Fixed');
INSERT INTO `sales_flat_quote_shipping_rate` VALUES(6, 8, '2012-07-17 07:20:50', '2012-07-17 07:20:58', 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'flatrate', NULL, 5.0000, NULL, 'Fixed');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment`
--

CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_FLAT_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_shipment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_comment`
--

CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_shipment_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_grid`
--

CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

--
-- Dumping data for table `sales_flat_shipment_grid`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_item`
--

CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_shipment_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_track`
--

CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_shipment_track`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_invoiced_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

CREATE TABLE `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_updated`
--

CREATE TABLE `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_aggregated_updated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status`
--

CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status`
--

INSERT INTO `sales_order_status` VALUES('canceled', 'Canceled');
INSERT INTO `sales_order_status` VALUES('closed', 'Closed');
INSERT INTO `sales_order_status` VALUES('complete', 'Complete');
INSERT INTO `sales_order_status` VALUES('fraud', 'Suspected Fraud');
INSERT INTO `sales_order_status` VALUES('holded', 'On Hold');
INSERT INTO `sales_order_status` VALUES('payment_review', 'Payment Review');
INSERT INTO `sales_order_status` VALUES('pending', 'Pending');
INSERT INTO `sales_order_status` VALUES('pending_payment', 'Pending Payment');
INSERT INTO `sales_order_status` VALUES('pending_paypal', 'Pending PayPal');
INSERT INTO `sales_order_status` VALUES('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_label`
--

CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `IDX_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

--
-- Dumping data for table `sales_order_status_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_state`
--

CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  PRIMARY KEY (`status`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` VALUES('canceled', 'canceled', 1);
INSERT INTO `sales_order_status_state` VALUES('closed', 'closed', 1);
INSERT INTO `sales_order_status_state` VALUES('complete', 'complete', 1);
INSERT INTO `sales_order_status_state` VALUES('fraud', 'payment_review', 0);
INSERT INTO `sales_order_status_state` VALUES('holded', 'holded', 1);
INSERT INTO `sales_order_status_state` VALUES('payment_review', 'payment_review', 1);
INSERT INTO `sales_order_status_state` VALUES('pending', 'new', 1);
INSERT INTO `sales_order_status_state` VALUES('pending_payment', 'pending_payment', 1);
INSERT INTO `sales_order_status_state` VALUES('processing', 'processing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Hidden',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax_item`
--

CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `UNQ_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `IDX_SALES_ORDER_TAX_ITEM_TAX_ID` (`tax_id`),
  KEY `IDX_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_tax_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_payment_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_recurring_profile`
--

CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `state` varchar(20) NOT NULL COMMENT 'State',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `reference_id` varchar(32) DEFAULT NULL COMMENT 'Reference Id',
  `subscriber_name` varchar(150) DEFAULT NULL COMMENT 'Subscriber Name',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Datetime',
  `internal_reference_id` varchar(42) NOT NULL COMMENT 'Internal Reference Id',
  `schedule_description` varchar(255) NOT NULL COMMENT 'Schedule Description',
  `suspension_threshold` smallint(5) unsigned DEFAULT NULL COMMENT 'Suspension Threshold',
  `bill_failed_later` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Bill Failed Later',
  `period_unit` varchar(20) NOT NULL COMMENT 'Period Unit',
  `period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Frequency',
  `period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Max Cycles',
  `billing_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Billing Amount',
  `trial_period_unit` varchar(20) DEFAULT NULL COMMENT 'Trial Period Unit',
  `trial_period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Frequency',
  `trial_period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Max Cycles',
  `trial_billing_amount` text COMMENT 'Trial Billing Amount',
  `currency_code` varchar(3) NOT NULL COMMENT 'Currency Code',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `init_amount` decimal(12,4) DEFAULT NULL COMMENT 'Init Amount',
  `init_may_fail` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Init May Fail',
  `order_info` text NOT NULL COMMENT 'Order Info',
  `order_item_info` text NOT NULL COMMENT 'Order Item Info',
  `billing_address_info` text NOT NULL COMMENT 'Billing Address Info',
  `shipping_address_info` text COMMENT 'Shipping Address Info',
  `profile_vendor_info` text COMMENT 'Profile Vendor Info',
  `additional_info` text COMMENT 'Additional Info',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_INTERNAL_REFERENCE_ID` (`internal_reference_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_recurring_profile`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_recurring_profile_order`
--

CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_ORDER_PROFILE_ID_ORDER_ID` (`profile_id`,`order_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile Order' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_recurring_profile_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

CREATE TABLE `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_refunded_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

CREATE TABLE `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_shipping_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_SENDFRIEND_LOG_IP` (`ip`),
  KEY `IDX_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sendfriend_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shipping_tablerate`
--


-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `IDX_SITEMAP_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Sitemap' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sitemap`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `first_customer_id` int(10) unsigned DEFAULT NULL COMMENT 'First Customer Id',
  `first_store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'First Store Id',
  PRIMARY KEY (`tag_id`),
  KEY `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`first_customer_id`),
  KEY `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` (`first_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag_properties`
--

CREATE TABLE `tag_properties` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_TAG_PROPERTIES_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Properties';

--
-- Dumping data for table `tag_properties`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag_relation`
--

CREATE TABLE `tag_relation` (
  `tag_relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Relation Id',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Store Id',
  `active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`tag_relation_id`),
  UNIQUE KEY `UNQ_TAG_RELATION_TAG_ID_CUSTOMER_ID_PRODUCT_ID_STORE_ID` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_TAG_RELATION_PRODUCT_ID` (`product_id`),
  KEY `IDX_TAG_RELATION_TAG_ID` (`tag_id`),
  KEY `IDX_TAG_RELATION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_TAG_RELATION_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Relation' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tag_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag_summary`
--

CREATE TABLE `tag_summary` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `customers` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customers',
  `products` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Products',
  `uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Uses',
  `historical_uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Historical Uses',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_TAG_SUMMARY_STORE_ID` (`store_id`),
  KEY `IDX_TAG_SUMMARY_TAG_ID` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Summary';

--
-- Dumping data for table `tag_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `IDX_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `IDX_TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Calculation' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax_calculation`
--

INSERT INTO `tax_calculation` VALUES(1, 1, 1, 3, 2);
INSERT INTO `tax_calculation` VALUES(2, 2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` VALUES(1, 'US', 12, '*', 'US-CA-*-Rate 1', 8.2500, NULL, NULL, NULL);
INSERT INTO `tax_calculation_rate` VALUES(2, 'US', 43, '*', 'US-NY-*-Rate 1', 8.3750, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tax_calculation_rate_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALC_RULE_PRIORITY_POSITION_TAX_CALC_RULE_ID` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_calculation_rule`
--

INSERT INTO `tax_calculation_rule` VALUES(1, 'Retail Customer-Taxable Goods-Rate 1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Class' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` VALUES(2, 'Taxable Goods', 'PRODUCT');
INSERT INTO `tax_class` VALUES(3, 'Retail Customer', 'CUSTOMER');
INSERT INTO `tax_class` VALUES(4, 'Shipping', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

CREATE TABLE `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `FCA5E2C02689EB2641B30580D7AACF12` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tax_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_updated`
--

CREATE TABLE `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DB0AF14011199AA6CD31D5078B90AA8D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tax_order_aggregated_updated`
--


-- --------------------------------------------------------

--
-- Table structure for table `weee_discount`
--

CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  KEY `IDX_WEEE_DISCOUNT_WEBSITE_ID` (`website_id`),
  KEY `IDX_WEEE_DISCOUNT_ENTITY_ID` (`entity_id`),
  KEY `IDX_WEEE_DISCOUNT_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Discount';

--
-- Dumping data for table `weee_discount`
--


-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`value_id`),
  KEY `IDX_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `IDX_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `IDX_WEEE_TAX_COUNTRY` (`country`),
  KEY `IDX_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `weee_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `IDX_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

CREATE TABLE `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `package_theme` varchar(255) DEFAULT NULL COMMENT 'Package Theme',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget_instance`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

CREATE TABLE `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Block Reference',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget_instance_page`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `UNQ_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

--
-- Dumping data for table `widget_instance_page_layout`
--


-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_WISHLIST_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wishlist`
--


-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `IDX_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_WISHLIST_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wishlist_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item_option`
--

CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wishlist_item_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `xmlconnect_application`
--

CREATE TABLE `xmlconnect_application` (
  `application_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Application Id',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code',
  `type` varchar(32) NOT NULL COMMENT 'Device Type',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `active_from` date DEFAULT NULL COMMENT 'Active From',
  `active_to` date DEFAULT NULL COMMENT 'Active To',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  `browsing_mode` smallint(5) unsigned DEFAULT '0' COMMENT 'Browsing Mode',
  PRIMARY KEY (`application_id`),
  UNIQUE KEY `UNQ_XMLCONNECT_APPLICATION_CODE` (`code`),
  KEY `FK_XMLCONNECT_APPLICATION_STORE_ID_CORE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Application' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `xmlconnect_application`
--


-- --------------------------------------------------------

--
-- Table structure for table `xmlconnect_config_data`
--

CREATE TABLE `xmlconnect_config_data` (
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  `category` varchar(60) NOT NULL DEFAULT 'default' COMMENT 'Category',
  `path` varchar(250) NOT NULL COMMENT 'Path',
  `value` text NOT NULL COMMENT 'Value',
  UNIQUE KEY `UNQ_XMLCONNECT_CONFIG_DATA_APPLICATION_ID_CATEGORY_PATH` (`application_id`,`category`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Configuration Data';

--
-- Dumping data for table `xmlconnect_config_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `xmlconnect_history`
--

CREATE TABLE `xmlconnect_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `params` blob COMMENT 'Params',
  `title` varchar(200) NOT NULL COMMENT 'Title',
  `activation_key` varchar(255) NOT NULL COMMENT 'Activation Key',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code',
  PRIMARY KEY (`history_id`),
  KEY `FK_8F08B9513373BC19F49EE3EF8340E270` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect History' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `xmlconnect_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `xmlconnect_notification_template`
--

CREATE TABLE `xmlconnect_notification_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `name` varchar(255) NOT NULL COMMENT 'Template Name',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) NOT NULL COMMENT 'Message Title',
  `content` text NOT NULL COMMENT 'Message Content',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  PRIMARY KEY (`template_id`),
  KEY `FK_F9927C7518A907CF5C350942FD296DC3` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Template' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `xmlconnect_notification_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `xmlconnect_queue`
--

CREATE TABLE `xmlconnect_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `exec_time` timestamp NULL DEFAULT NULL COMMENT 'Scheduled Execution Time',
  `template_id` int(10) unsigned NOT NULL COMMENT 'Template Id',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) DEFAULT '' COMMENT 'Message Title',
  `content` text COMMENT 'Message Content',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  `type` varchar(12) NOT NULL COMMENT 'Type of Notification',
  PRIMARY KEY (`queue_id`),
  KEY `FK_2019AEC5FC55A516965583447CA26B14` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Queue' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `xmlconnect_queue`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_rule`
--
ALTER TABLE `admin_rule`
  ADD CONSTRAINT `FK_ADMIN_RULE_ROLE_ID_ADMIN_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api2_acl_rule`
--
ALTER TABLE `api2_acl_rule`
  ADD CONSTRAINT `FK_API2_ACL_RULE_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api2_acl_user`
--
ALTER TABLE `api2_acl_user`
  ADD CONSTRAINT `FK_API2_ACL_USER_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_rule`
--
ALTER TABLE `api_rule`
  ADD CONSTRAINT `FK_API_RULE_ROLE_ID_API_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_session`
--
ALTER TABLE `api_session`
  ADD CONSTRAINT `FK_API_SESSION_USER_ID_API_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_status`
--
ALTER TABLE `cataloginventory_stock_status`
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD CONSTRAINT `FK_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_query`
--
ALTER TABLE `catalogsearch_query`
  ADD CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_result`
--
ALTER TABLE `catalogsearch_result`
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY_ID_CATALOGSEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATSRCH_RESULT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product_index`
--
ALTER TABLE `catalog_category_product_index`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_IDX_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_enabled_index`
--
ALTER TABLE `catalog_product_enabled_index`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENABLED_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_group_price`
--
ALTER TABLE `catalog_product_entity_group_price`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DF909D22C11B60B1E5E3EE64AB220ECE` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_6E08D719F0501DD1D8E6D4EFF2511C85` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav`
--
ALTER TABLE `catalog_product_index_eav`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav_decimal`
--
ALTER TABLE `catalog_product_index_eav_decimal`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_group_price`
--
ALTER TABLE `catalog_product_index_group_price`
  ADD CONSTRAINT `FK_195DF97C81B0BDD6A2EEC50F870E16D1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_TTL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_LBL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRICING_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CDE8813117106CFAA3AD209358F66332` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LYT_LNK_LYT_UPDATE_ID_CORE_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store`
--
ALTER TABLE `core_store`
  ADD CONSTRAINT `FK_CORE_STORE_GROUP_ID_CORE_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_STORE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store_group`
--
ALTER TABLE `core_store_group`
  ADD CONSTRAINT `FK_CORE_STORE_GROUP_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_translate`
--
ALTER TABLE `core_translate`
  ADD CONSTRAINT `FK_CORE_TRANSLATE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_url_rewrite`
--
ALTER TABLE `core_url_rewrite`
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID_CORE_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated`
--
ALTER TABLE `coupon_aggregated`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated_order`
--
ALTER TABLE `coupon_aggregated_order`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated_updated`
--
ALTER TABLE `coupon_aggregated_updated`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `FK_CSTR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `FK_CSTR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD CONSTRAINT `FK_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataflow_batch`
--
ALTER TABLE `dataflow_batch`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE_ID_DATAFLOW_PROFILE_PROFILE_ID` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_batch_export`
--
ALTER TABLE `dataflow_batch_export`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_batch_import`
--
ALTER TABLE `dataflow_batch_import`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_import_data`
--
ALTER TABLE `dataflow_import_data`
  ADD CONSTRAINT `FK_DATAFLOW_IMPORT_DATA_SESSION_ID_DATAFLOW_SESSION_SESSION_ID` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_profile_history`
--
ALTER TABLE `dataflow_profile_history`
  ADD CONSTRAINT `FK_AEA06B0C500063D3CE6EA671AE776645` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `FK_DESIGN_CHANGE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `FK_D7CFDEB379F775328EB6F62695E2B3E1` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_46CC8E252307CE62F00A8F1887512A39` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B219BF25756700DEE44550B21220ECCE` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `FK_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `FK_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `FK_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `FK_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `FK_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `index_process_event`
--
ALTER TABLE `index_process_event`
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT_EVENT_ID_INDEX_EVENT_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT_PROCESS_ID_INDEX_PROCESS_PROCESS_ID` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `FK_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD CONSTRAINT `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD CONSTRAINT `FK_PAYPAL_CERT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `FK_POLL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `FK_POLL_ANSWER_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_store`
--
ALTER TABLE `poll_store`
  ADD CONSTRAINT `FK_POLL_STORE_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POLL_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD CONSTRAINT `FK_POLL_VOTE_POLL_ANSWER_ID_POLL_ANSWER_ANSWER_ID` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `FK_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `FK_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `FK_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `FK_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RATING_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `FK_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `FK_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_EVENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `FK_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD CONSTRAINT `FK_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `FK_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_billing_agreement`
--
ALTER TABLE `sales_billing_agreement`
  ADD CONSTRAINT `FK_SALES_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BILLING_AGREEMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_billing_agreement_order`
--
ALTER TABLE `sales_billing_agreement_order`
  ADD CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_AGRT_ID_SALES_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo`
--
ALTER TABLE `sales_flat_creditmemo`
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_comment`
--
ALTER TABLE `sales_flat_creditmemo_comment`
  ADD CONSTRAINT `FK_B0FCB0B5467075BE63D474F2CD5F7804` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_grid`
--
ALTER TABLE `sales_flat_creditmemo_grid`
  ADD CONSTRAINT `FK_78C711B225167A11CC077B03D1C8E1CC` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_item`
--
ALTER TABLE `sales_flat_creditmemo_item`
  ADD CONSTRAINT `FK_306DAC836C699F0B5E13BE486557AC8A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice`
--
ALTER TABLE `sales_flat_invoice`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_comment`
--
ALTER TABLE `sales_flat_invoice_comment`
  ADD CONSTRAINT `FK_5C4B36BBE5231A76AB8018B281ED50BC` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_grid`
--
ALTER TABLE `sales_flat_invoice_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_ENTT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_item`
--
ALTER TABLE `sales_flat_invoice_item`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order`
--
ALTER TABLE `sales_flat_order`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_address`
--
ALTER TABLE `sales_flat_order_address`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_grid`
--
ALTER TABLE `sales_flat_order_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ENTITY_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_item`
--
ALTER TABLE `sales_flat_order_item`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_payment`
--
ALTER TABLE `sales_flat_order_payment`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_status_history`
--
ALTER TABLE `sales_flat_order_status_history`
  ADD CONSTRAINT `FK_CE7C71E74CB74DDACED337CEE6753D5E` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote`
--
ALTER TABLE `sales_flat_quote`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address`
--
ALTER TABLE `sales_flat_quote_address`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address_item`
--
ALTER TABLE `sales_flat_quote_address_item`
  ADD CONSTRAINT `FK_2EF8E28181D666D94D4E30DC2B0F80BF` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_A345FC758F20C314169CE27DCE53477F` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B521389746C00700D1B2B76EBBE53854` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item`
--
ALTER TABLE `sales_flat_quote_item`
  ADD CONSTRAINT `FK_B201DEB5DE51B791AF5C5BF87053C5A7` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item_option`
--
ALTER TABLE `sales_flat_quote_item_option`
  ADD CONSTRAINT `FK_5F20E478CA64B6891EA8A9D6C2735739` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_payment`
--
ALTER TABLE `sales_flat_quote_payment`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_shipping_rate`
--
ALTER TABLE `sales_flat_quote_shipping_rate`
  ADD CONSTRAINT `FK_B1F177EFB73D3EDF5322BA64AC48D150` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment`
--
ALTER TABLE `sales_flat_shipment`
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_comment`
--
ALTER TABLE `sales_flat_shipment_comment`
  ADD CONSTRAINT `FK_C2D69CC1FB03D2B2B794B0439F6650CF` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_grid`
--
ALTER TABLE `sales_flat_shipment_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_ENTT_ID_SALES_FLAT_SHIPMENT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_item`
--
ALTER TABLE `sales_flat_shipment_item`
  ADD CONSTRAINT `FK_3AECE5007D18F159231B87E8306FC02A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_track`
--
ALTER TABLE `sales_flat_shipment_track`
  ADD CONSTRAINT `FK_BCD2FA28717D29F37E10A153E6F2F841` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_FLAT_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DA51A10B2405B64A4DAEF77A64F0DAAD` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_recurring_profile`
--
ALTER TABLE `sales_recurring_profile`
  ADD CONSTRAINT `FK_SALES_RECURRING_PROFILE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_RECURRING_PROFILE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_recurring_profile_order`
--
ALTER TABLE `sales_recurring_profile_order`
  ADD CONSTRAINT `FK_7FF85741C66DCD37A4FBE3E3255A5A01` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B8A7A5397B67455786E55461748C59F4` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `FK_SITEMAP_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`first_customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`first_store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `tag_properties`
--
ALTER TABLE `tag_properties`
  ADD CONSTRAINT `FK_TAG_PROPERTIES_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_PROPERTIES_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_relation`
--
ALTER TABLE `tag_relation`
  ADD CONSTRAINT `FK_TAG_RELATION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_summary`
--
ALTER TABLE `tag_summary`
  ADD CONSTRAINT `FK_TAG_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_SUMMARY_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `FK_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_discount`
--
ALTER TABLE `weee_discount`
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `FK_0A5D06DCEC6A6845F50E5FAAC5A1C96D` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_LYT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xmlconnect_application`
--
ALTER TABLE `xmlconnect_application`
  ADD CONSTRAINT `FK_XMLCONNECT_APPLICATION_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `xmlconnect_config_data`
--
ALTER TABLE `xmlconnect_config_data`
  ADD CONSTRAINT `FK_31EE36D814216200D7C0723145AC510E` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xmlconnect_history`
--
ALTER TABLE `xmlconnect_history`
  ADD CONSTRAINT `FK_8F08B9513373BC19F49EE3EF8340E270` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xmlconnect_notification_template`
--
ALTER TABLE `xmlconnect_notification_template`
  ADD CONSTRAINT `FK_F9927C7518A907CF5C350942FD296DC3` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xmlconnect_queue`
--
ALTER TABLE `xmlconnect_queue`
  ADD CONSTRAINT `FK_2019AEC5FC55A516965583447CA26B14` FOREIGN KEY (`template_id`) REFERENCES `xmlconnect_notification_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;
