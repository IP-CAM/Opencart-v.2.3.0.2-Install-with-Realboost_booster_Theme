SET SQL_MODE = "";



DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


INSERT INTO oc_api VALUES
("7","admin","dF5RSIAsOp8O2s6f6OOQaJRunOOTkraL3beDMtxv0Q7nZcFWJCFagDbe2cS7is135nxFfXp1uPAJbDVrGcIdIavl2kJIFTJa2AhizYev8MTBDsKd4XTLQzdFs0A6D4tTBVrFUxAwC8SKjAc0gMoum5Hnb2JIRycJcH4tM3B54rE2bKw0RQ7pHanJvMJ44m3IcrWYTmQtOPS7UeweGtGTxZ1LLCqPbBbjgfW7OPEjhcwLDpXGRf6qDb2AIkyUhoVR","1","2019-07-16 05:10:42","2019-07-16 05:16:08");




DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


INSERT INTO oc_api_ip VALUES
("1","4","46.118.98.36"),
("5","6","127.0.0.1"),
("8","7","::1"),
("6","8","localhost"),
("7","9","127.0.0.1"),
("9","7","127.0.0.1"),
("10","7","localhost"),
("11","0","::1"),
("12","0","::1"),
("13","7","::1"),
("14","7","::1"),
("15","7","::1");




DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


INSERT INTO oc_api_session VALUES
("13","7","XtNTKiwHKdnwrGd8Ba3C2ybBKvZW38wQ","vp6ig8m5d6jboou5siardoija1","","::1","2019-07-16 07:29:52","2019-07-16 07:29:52"),
("12","7","TbkJ3ZUJI2M5BYQLGzmgSmxlnztgANrX","nd67lrqt9e5a5pf74odq9838d1","","::1","2019-07-16 07:29:28","2019-07-16 07:29:28"),
("11","0","ep0XNg1mqikd4QMSfOXtAdpuZcjxqrzy","e7gj7sjuuu184m22t9pdn17rs7","","::1","2019-07-16 07:29:27","2019-07-16 07:29:27"),
("10","7","CqZqTu5cGEQpIHBnsbHRSM5cQzgDIP1D","pvfu77iliu453nsos9i9kec6p1","","::1","2019-07-16 07:26:32","2019-07-16 07:30:41"),
("9","0","NKe8s8zTCU5y9VaZoaZE6QjPcU3YdV9Z","dlorvv3q6er555mvi8ulpu0vh3","","::1","2019-07-16 07:19:32","2019-07-16 07:19:32");




DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute VALUES
("12","7","0");




DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_description VALUES
("12","1","Имя");




DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_group VALUES
("7","0");




DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_group_description VALUES
("7","1","данные пользователя");




DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `suffix` text,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


INSERT INTO oc_banner VALUES
("6","HP Products","1",""),
("7","Home Page Slideshow","1",""),
("8","Manufacturers","1",""),
("9","dota","1","dota");




DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `descr` text,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;


INSERT INTO oc_banner_image VALUES
("87","6","1","HP Banner","index.php?route=product/manufacturer/info&amp;manufacturer_id=7","catalog/demo/compaq_presario.jpg","0",""),
("94","8","1","NFL","","catalog/demo/manufacturer/nfl.png","0",""),
("95","8","1","RedBull","","catalog/demo/manufacturer/redbull.png","0",""),
("96","8","1","Sony","","catalog/demo/manufacturer/sony.png","0",""),
("91","8","1","Coca Cola","","catalog/demo/manufacturer/cocacola.png","0",""),
("92","8","1","Burger King","","catalog/demo/manufacturer/burgerking.png","0",""),
("93","8","1","Canon","","catalog/demo/manufacturer/canon.png","0",""),
("88","8","1","Harley Davidson","","catalog/demo/manufacturer/harley.png","0",""),
("89","8","1","Dell","","catalog/demo/manufacturer/dell.png","0",""),
("90","8","1","Disney","","catalog/demo/manufacturer/disney.png","0",""),
("126","7","1","MacBookAir","","catalog/demo/banners/MacBookAir.jpg","0","fsdbhdftbn"),
("127","7","1","iPhone 6","index.php?route=product/product&amp;path=57&amp;product_id=49","catalog/demo/banners/iPhone6.jpg","0","wsdwwv"),
("97","8","1","Starbucks","","catalog/demo/manufacturer/starbucks.png","0",""),
("98","8","1","Nintendo","","catalog/demo/manufacturer/nintendo.png","0",""),
("155","9","1","Победить &lt;br&gt;&lt;b&gt;Battle Cup&lt;/b&gt;","#3","catalog/banner/3.jpg","3","             Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!           "),
("154","9","1","&lt;br&gt;Заказать &lt;b&gt;буст рейтинга&lt;/b&gt;","#2","catalog/banner/2.jpg","2","             Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!           "),
("153","9","1","Обучение &lt;br&gt;&lt;b&gt;от бустеров&lt;/b&gt;","#1","catalog/banner/1.jpg","0","Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!"),
("128","7","1","y542eytj","fhtdjgfh,jm","catalog/banner/2.jpg","0","yukfuyki");




DROP TABLE IF EXISTS `oc_banner_info`;
CREATE TABLE `oc_banner_info` (
  `banner_image_id` int(11) NOT NULL,
  `descr` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;


INSERT INTO oc_category VALUES
("59","","0","1","1","0","1","2019-07-06 13:35:44","2019-07-13 01:28:22"),
("62","","59","0","1","0","1","2019-07-08 22:03:25","2019-07-09 01:07:58");




DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_description VALUES
("59","1","Услуги","","services","",""),
("62","1","Дота-форма","","dota-form","","");




DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_path VALUES
("59","59","0"),
("62","62","1"),
("62","59","0");




DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_to_layout VALUES
("59","0","3"),
("62","0","14");




DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_to_store VALUES
("59","0"),
("62","0");




DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;


INSERT INTO oc_country VALUES
("20","Белоруссия (Беларусь)","BY","BLR","","0","1"),
("80","Грузия","GE","GEO","","0","1"),
("109","Казахстан","KZ","KAZ","","0","1"),
("115","Киргизия (Кыргызстан)","KG","KGZ","","0","1"),
("176","Российская Федерация","RU","RUS","","0","1"),
("220","Украина","UA","UKR","","0","1"),
("226","Узбекистан","UZ","UZB","","0","1");




DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_coupon VALUES
("4","-10% Discount","2222","P","10.0000","0","0","0.0000","2014-01-01","2020-01-01","10","10","0","2009-01-27 13:55:03"),
("5","Free Shipping","3333","P","0.0000","0","1","100.0000","2014-01-01","2014-02-01","10","10","0","2009-03-14 21:13:53"),
("6","-10.00 Discount","1111","F","10.0000","0","0","10.0000","2014-01-01","2020-01-01","100000","10000","0","2009-03-14 21:15:18");




DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_currency VALUES
("1","Рубль","RUB","","р.","0","1.00000000","1","2019-07-16 04:07:32");




DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_customer VALUES
("1","1","0","1","Client","Client","client@client.com","123543245","","524a271ccffa955d5e49b49e8fd7bebb2655e4eb","VQEX9t8VW","","","0","0","[]","::1","1","1","1","","","2019-07-13 03:03:01"),
("2","1","0","1","wsedfsadfg","not supported","sdfdfsac@gmail.com","not provided","","a03ddb67756ac1938c6f3e5e0a2e287c7db9a532","YhgBupMhS","","","0","1","","::1","1","1","0","","","2019-07-16 00:41:52"),
("3","1","0","1","gfdsg","not supported","vfsdsdag@edf.rr","not provided","","b0015615ea1d26e621f012905e2f777857ad348c","BzEMzbFbD","","","0","2","","::1","1","1","0","","","2019-07-16 00:49:30"),
("4","1","0","1","sdvfgsa","not supported","1111@1111.ru","not provided","","85d5122ed2628c0128e838682b1deee56c15b131","NkO40P8lN","","","0","3","","::1","1","1","0","","","2019-07-16 00:51:27"),
("5","1","0","1","smith","not supported","fwsewsaqedf@ll.cc","not provided","","6c658f353c81637a1137f74aaac3e38587afda14","EAm0ctOTu","","","0","4","","::1","1","1","0","","","2019-07-16 00:53:11"),
("6","1","0","1","fdsg","not supported","asdf@dd.dd","not provided","","56dfe2fcb575a15f6c6bd9132abc60eb3c47899f","VY7uDx2gX","","","0","5","","::1","1","1","0","","","2019-07-16 01:35:31");




DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_customer_group VALUES
("1","0","1");




DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_customer_group_description VALUES
("1","1","Default","test");




DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO oc_customer_ip VALUES
("1","1","46.118.98.36","2019-07-13 03:04:13"),
("2","1","198.16.66.156","2019-07-13 18:03:49"),
("3","1","::1","2019-07-14 00:36:05"),
("4","2","::1","2019-07-16 00:43:19"),
("5","3","::1","2019-07-16 00:49:31"),
("6","4","::1","2019-07-16 00:51:49"),
("7","5","::1","2019-07-16 00:53:20"),
("8","6","::1","2019-07-16 01:35:32");




DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


INSERT INTO oc_customer_login VALUES
("1","jeweller","198.16.74.205","1","2019-07-13 11:09:58","2019-07-13 11:09:58"),
("2","dragon1myr@gmail.com","198.16.74.205","2","2019-07-13 11:10:15","2019-07-13 11:10:28"),
("3","dragon1myr@gmail.com","198.16.66.156","1","2019-07-13 18:00:46","2019-07-13 18:00:46"),
("4","ghjvhv","46.118.98.36","1","2019-07-13 18:02:50","2019-07-13 18:02:50"),
("5","client","::1","1","2019-07-13 23:52:08","2019-07-13 23:52:08"),
("6","admin","198.16.70.28","4","2019-07-14 22:26:47","2019-07-14 23:28:42"),
("7","dragon1myr@gmail.com","198.16.70.28","3","2019-07-14 22:42:13","2019-07-14 22:42:26"),
("8","jeweller","198.16.70.28","3","2019-07-14 22:47:33","2019-07-14 23:28:03"),
("9","melnik.zakhar222@gmail.com","194.213.120.12","2","2019-07-14 23:23:20","2019-07-14 23:23:29"),
("10","admin","198.16.66.123","1","2019-07-15 14:16:06","2019-07-15 14:16:06");




DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_search`;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;


INSERT INTO oc_extension VALUES
("1","payment","cod"),
("6","module","banner"),
("7","module","carousel"),
("36","payment","robokassa"),
("13","module","category"),
("14","module","account"),
("17","payment","free_checkout"),
("18","module","featured"),
("33","module","slideshow"),
("20","theme","theme_default"),
("21","dashboard","activity"),
("22","dashboard","sale"),
("23","dashboard","recent"),
("24","dashboard","order"),
("25","dashboard","online"),
("26","dashboard","map"),
("27","dashboard","customer"),
("28","dashboard","chart"),
("29","module","information"),
("31","module","html"),
("34","module","slidereview"),
("35","module","breadcrumbs"),
("39","module","ocmegamenu"),
("40","shipping","free"),
("41","total","sub_total"),
("42","total","total");




DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_filter VALUES
("1","1","0");




DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_filter_description VALUES
("1","1","1","myfilter-new1");




DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_filter_group VALUES
("1","1");




DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_filter_group_description VALUES
("1","1","myfilter");




DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_geo_zone VALUES
("3","Зона НДС","Облагаемые НДС","2014-09-09 11:48:13","2014-05-21 22:30:20");




DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


INSERT INTO oc_information VALUES
("3","1","3","1"),
("4","1","1","1"),
("5","0","4","1"),
("6","1","2","1"),
("7","0","0","1"),
("10","0","0","1");




DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_information_description VALUES
("4","1","О нас","&lt;p&gt;\n	About Us&lt;/p&gt;","О нас","",""),
("5","1","Условия соглашения","&lt;p&gt;\n	Terms &amp;amp; Conditions&lt;/p&gt;","Условия соглашения","",""),
("3","1","Политика Безопасности","&lt;p&gt;\n	Privacy Policy&lt;/p&gt;","Политика Безопасности","",""),
("6","1","Доставка","&lt;p&gt;\n	Delivery Information&lt;/p&gt;","Доставка","",""),
("7","1","Гарантии","\n&lt;!-- guarantee-list --&gt;\n&lt;div class=&quot;guarantee-list&quot;&gt;\n  &lt;div class=&quot;container&quot;&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/1.png&quot; alt=&quot;Robokassa&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы принимаем \n            платежи через \n            Robokassa\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__descr&quot;&gt;\n            Для того, чтобы принимать платежи &lt;br&gt;\n            Robokassa требует от нас:\n          &lt;/div&gt;\n\n          &lt;ul&gt;\n            &lt;li&gt;Предоставить паспортные данные&lt;/li&gt;\n            &lt;li&gt;Завести у ОКЕАН БАНКА карту на свои паспортные данные&lt;/li&gt;\n            &lt;li&gt;Сайт, принимающий платежи, должен пройти проверку&lt;/li&gt;\n            &lt;li&gt;Пройти процедуру идентификации (в соответствии с Федеральными Законами № 161 и 115)&lt;/li&gt;\n          &lt;/ul&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/2.png&quot; alt=&quot;Card&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы принимаем \n            оплату более \n            чем 50 \n            способами\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;ul&gt;\n            &lt;li&gt;Пластиковые карты и выставление счетов в интернет-банк&lt;/li&gt;\n            &lt;li&gt;Электронные деньги&lt;/li&gt;\n            &lt;li&gt;И многие другие способы&lt;/li&gt;\n          &lt;/ul&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/3.png&quot; alt=&quot;Webmoney&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы аттестованы \n            WebMoney\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__descr&quot;&gt;\n            Аттестат - это знак нашей безупречной работы, высокий \n            BL уровень аттестата означает, что через него \n            прошло много оплат.\n          &lt;/div&gt;\n          &lt;p&gt;\n            Вот список того, что нам необходимо было сделать, \n            чтобы получить аттестат.\n          &lt;/p&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n  &lt;/div&gt;\n&lt;/div&gt;\n\n","гарантии","",""),
("10","1","Работа","&lt;!-- guarantee-list --&gt;\n&lt;div class=&quot;guarantee-list&quot;&gt;\n  &lt;div class=&quot;container&quot;&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/1.png&quot; alt=&quot;Robokassa&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы принимаем \n            платежи через \n            Robokassa\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__descr&quot;&gt;\n            Для того, чтобы принимать платежи &lt;br&gt;\n            Robokassa требует от нас:\n          &lt;/div&gt;\n\n          &lt;ul&gt;\n            &lt;li&gt;Предоставить паспортные данные&lt;/li&gt;\n            &lt;li&gt;Завести у ОКЕАН БАНКА карту на свои паспортные данные&lt;/li&gt;\n            &lt;li&gt;Сайт, принимающий платежи, должен пройти проверку&lt;/li&gt;\n            &lt;li&gt;Пройти процедуру идентификации (в соответствии с Федеральными Законами № 161 и 115)&lt;/li&gt;\n          &lt;/ul&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/2.png&quot; alt=&quot;Card&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы принимаем \n            оплату более \n            чем 50 \n            способами\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;ul&gt;\n            &lt;li&gt;Пластиковые карты и выставление счетов в интернет-банк&lt;/li&gt;\n            &lt;li&gt;Электронные деньги&lt;/li&gt;\n            &lt;li&gt;И многие другие способы&lt;/li&gt;\n          &lt;/ul&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n    &lt;div class=&quot;guarantee-list_block&quot;&gt;\n      &lt;div class=&quot;row&quot;&gt;\n        &lt;div class=&quot;col-lg-5 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__img&quot;&gt;\n            &lt;img src=&quot;img/guarantees/3.png&quot; alt=&quot;Webmoney&quot;&gt;\n          &lt;/div&gt;\n\n          &lt;div class=&quot;guarantee-list__title&quot;&gt;\n            Мы аттестованы \n            WebMoney\n          &lt;/div&gt;\n        &lt;/div&gt;\n\n        &lt;div class=&quot;col-lg-7 my-auto&quot;&gt;\n          &lt;div class=&quot;guarantee-list__descr&quot;&gt;\n            Аттестат - это знак нашей безупречной работы, высокий \n            BL уровень аттестата означает, что через него \n            прошло много оплат.\n          &lt;/div&gt;\n          &lt;p&gt;\n            Вот список того, что нам необходимо было сделать, \n            чтобы получить аттестат.\n          &lt;/p&gt;\n        &lt;/div&gt;\n      &lt;/div&gt;\n    &lt;/div&gt;\n\n  &lt;/div&gt;\n&lt;/div&gt;\n","работа","","");




DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_information_to_layout VALUES
("5","0","0"),
("7","0","0"),
("10","0","0");




DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_information_to_store VALUES
("3","0"),
("4","0"),
("5","0"),
("6","0"),
("7","0"),
("10","0");




DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_language VALUES
("1","Russian","ru-ru","ru_RU.UTF-8,ru_RU,russian","ru-ru.png","russian","1","1");




DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO oc_layout VALUES
("1","Home"),
("2","Product"),
("3","Category"),
("4","Default"),
("5","Manufacturer"),
("6","Account"),
("7","Checkout"),
("8","Contact"),
("9","Sitemap"),
("10","Affiliate"),
("11","Information"),
("12","Compare"),
("13","Search"),
("14","CategoryForm"),
("15","ProductSpecialForm"),
("16","Product-OrderCalibration"),
("17","Product-BattleCup"),
("18","Product-training");




DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;


INSERT INTO oc_layout_module VALUES
("2","4","0","content_top","0"),
("3","4","0","content_top","1"),
("20","5","0","column_left","2"),
("69","10","affiliate","column_right","1"),
("129","6","breadcrumbs","content_top","0"),
("112","1","html.37","content_top","4"),
("111","1","html.36","content_top","3"),
("128","3","category","column_left","1"),
("110","1","slidereview.35","content_top","2"),
("109","1","html.34","content_top","1"),
("108","1","banner.32","content_top","0"),
("102","14","breadcrumbs","content_top","0"),
("114","15","breadcrumbs","content_top","0"),
("105","7","breadcrumbs","content_top","0"),
("106","7","html.39","content_bottom","0"),
("107","7","html.40","content_bottom","1"),
("115","15","html.37","content_bottom","0"),
("121","16","html.37","content_bottom","0"),
("120","16","breadcrumbs","content_top","0"),
("123","18","breadcrumbs","content_top","0"),
("124","18","html.37","content_bottom","0"),
("125","11","breadcrumbs","content_top","0"),
("126","11","slidereview.35","content_bottom","0"),
("127","11","html.37","content_bottom","1"),
("130","6","account","column_right","1");




DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;


INSERT INTO oc_layout_route VALUES
("84","6","0","account/%"),
("17","10","0","affiliate/%"),
("83","3","0","error/not_found"),
("72","1","0","common/home"),
("20","2","0","product/product"),
("82","11","0","information/information"),
("71","7","0","checkout/%"),
("31","8","0","information/contact"),
("32","9","0","information/sitemap"),
("34","4","0",""),
("45","5","0","product/manufacturer"),
("52","12","0","product/compare"),
("53","13","0","product/search"),
("67","14","0","product/categoryform"),
("73","15","0","product/productspecialform"),
("76","16","0","product/productordercalibration"),
("78","17","0","product/productbattlecup"),
("81","18","0","product/producttraining");




DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_length_class VALUES
("1","1.00000000"),
("2","10.00000000"),
("3","0.39370000");




DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_length_class_description VALUES
("1","1","Сантиметр","см"),
("2","1","Миллиметр","мм");




DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


INSERT INTO oc_manufacturer VALUES
("5","HTC","catalog/demo/htc_logo.jpg","0"),
("6","Palm","catalog/demo/palm_logo.jpg","0"),
("7","Hewlett-Packard","catalog/demo/hp_logo.jpg","0"),
("8","Apple","catalog/demo/apple_logo.jpg","0"),
("9","Canon","catalog/demo/canon_logo.jpg","0"),
("10","Sony","catalog/demo/sony_logo.jpg","0");




DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_manufacturer_to_store VALUES
("5","0"),
("6","0"),
("7","0"),
("8","0"),
("9","0"),
("10","0");




DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_megamenu`;
CREATE TABLE `oc_megamenu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


INSERT INTO oc_megamenu VALUES
("1","1","TopMenu","horizontal");




DROP TABLE IF EXISTS `oc_megamenu_sub_item`;
CREATE TABLE `oc_megamenu_sub_item` (
  `sub_menu_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_menu_item_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sub_menu_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_megamenu_sub_item VALUES
("2","3","2","1","Заказать Буст Рейтинга","0","uslugi/prokachka-mmr"),
("3","3","2","1","Выиграть Кубок","0","uslugi/winbattlecup");




DROP TABLE IF EXISTS `oc_megamenu_sub_item_description`;
CREATE TABLE `oc_megamenu_sub_item_description` (
  `sub_menu_item_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`sub_menu_item_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_megamenu_sub_item_description VALUES
("2","1","Заказать Буст Рейтинга"),
("3","1","Выиграть Кубок");




DROP TABLE IF EXISTS `oc_megamenu_top_item`;
CREATE TABLE `oc_megamenu_top_item` (
  `menu_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `has_title` tinyint(1) NOT NULL DEFAULT '0',
  `has_link` tinyint(1) NOT NULL DEFAULT '0',
  `has_child` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `item_align` varchar(255) NOT NULL,
  `sub_menu_type` varchar(255) NOT NULL,
  `sub_menu_content_type` varchar(255) NOT NULL,
  `sub_menu_content_columns` int(11) DEFAULT NULL,
  `sub_menu_content` text,
  PRIMARY KEY (`menu_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_megamenu_top_item VALUES
("4","1","1","1","1","0","0","1","Гарантии","guaranties","","left","mega","widget","1","[]"),
("3","1","1","1","1","1","0","0","Услуги","","","left","mega","widget","1","[]"),
("5","1","1","1","1","0","0","2","Работа","awork","","left","mega","widget","1","[]");




DROP TABLE IF EXISTS `oc_megamenu_top_item_description`;
CREATE TABLE `oc_megamenu_top_item_description` (
  `menu_item_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`menu_item_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_megamenu_top_item_description VALUES
("5","1","Работа"),
("3","1","Услуги"),
("4","1","Гарантии");




DROP TABLE IF EXISTS `oc_menu`;
CREATE TABLE `oc_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_menu_description`;
CREATE TABLE `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_menu_module`;
CREATE TABLE `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`menu_module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_modification VALUES
("2","|Quickfix by iSenseLabs","isenselabs_quickfix","iSenseLabs","1.4","http://isenselabs.com","<modification>\n    <name>|Quickfix by iSenseLabs</name>\n	<version>1.4</version>\n	<link>http://isenselabs.com</link>\n	<author>iSenseLabs</author>\n	<code>isenselabs_quickfix</code>\n\n	<file path=\"admin/controller/extension/installer.php\">\n		<operation error=\"skip\">\n			<search ><![CDATA[\'extension/installer/ftp\']]></search>\n			<add position=\"replace\"><![CDATA[\'extension/installer/localcopy\']]></add>\n		</operation>\n\n		<operation error=\"skip\">\n			<search ><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/\'. $this->rewrite_step(\'ftp\', \'localremove\'), \'token=\' . $this->session->data[\'token\'],]]></search>\n			<add position=\"replace\"><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/localcopy\', \'token=\' . $this->session->data[\'token\'],]]></add>\n		</operation>\n\n		<operation error=\"skip\">\n			<search ><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/\'. $this->rewrite_step(\'localcopy\', \'localremove\'), \'token=\' . $this->session->data[\'token\'],]]></search>\n			<add position=\"replace\"><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/localcopy\', \'token=\' . $this->session->data[\'token\'],]]></add>\n		</operation>\n\n		<operation>\n			<search><![CDATA[public function unzip() {]]></search>\n			<add position=\"before\"><![CDATA[			\n	public function localcopy() {\n		$this->load->language(\'extension/installer\');\n\n		$json = array();\n\n		if (!$this->user->hasPermission(\'modify\', \'extension/installer\')) {\n			$json[\'error\'] = $this->language->get(\'error_permission\');\n		}\n\n		if (VERSION == \'2.0.0.0\') {\n		    $directory = DIR_DOWNLOAD  . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\n		} else {\n		    $directory = DIR_UPLOAD  . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\n		}\n\n		if (!is_dir($directory)) {\n			$json[\'error\'] = $this->language->get(\'error_directory\');\n		}\n\n		if (!$json) {\n			// Get a list of files ready to upload\n			$files = array();\n\n			$path = array($directory . \'*\');\n\n			while (count($path) != 0) {\n				$next = array_shift($path);\n\n				foreach (glob($next) as $file) {\n					if (is_dir($file)) {\n						$path[] = $file . \'/*\';\n					}\n\n					$files[] = $file;\n				}\n			}\n\n			$root = dirname(DIR_APPLICATION).\'/\';\n\n			foreach ($files as $file) {\n				// Upload everything in the upload directory\n				$destination = substr($file, strlen($directory));\n\n				// Update from newer OpenCart versions:\n				if (substr($destination, 0, 5) == \'admin\') {\n					$destination = DIR_APPLICATION . substr($destination, 5);\n				} else if (substr($destination, 0, 7) == \'catalog\') {\n					$destination = DIR_CATALOG . substr($destination, 7);\n				} else if (substr($destination, 0, 5) == \'image\') {\n					$destination = DIR_IMAGE . substr($destination, 5);\n				} else if (substr($destination, 0, 6) == \'system\') {\n					$destination = DIR_SYSTEM . substr($destination, 6);\n				} else {\n					$destination = $root.$destination;\n				}\n\n				if (is_dir($file)) {\n					if (!file_exists($destination)) {\n						if (!mkdir($destination)) {\n							$json[\'error\'] = sprintf($this->language->get(\'error_ftp_directory\'), $destination);\n						}\n					}\n				}\n\n				if (is_file($file)) {\n					if (!copy($file, $destination)) {\n						$json[\'error\'] = sprintf($this->language->get(\'error_ftp_file\'), $file);\n					}\n				}\n			}\n		}\n\n		$this->response->addHeader(\'Content-Type: application/json\');\n		$this->response->setOutput(json_encode($json));\n	}]]></add>\n		</operation>\n	</file>	\n</modification>\n","1","2019-07-08 03:20:43");




DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;


INSERT INTO oc_module VALUES
("29","Home Page","carousel","{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}"),
("28","Home Page","featured","{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}"),
("32","banner-dota","banner","{\"name\":\"banner-dota\",\"banner_id\":\"9\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}"),
("34","html-block-mmr-boost","html","{\"name\":\"html-block-mmr-boost\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;!-- calculator --&gt;\\r\\n&lt;div class=&quot;container&quot;&gt;\\r\\n  &lt;div class=&quot;calculator&quot;&gt;\\r\\n    &lt;div class=&quot;calculator-title&quot;&gt;&lt;span&gt;Dota 2&lt;\\/span&gt; mmr boost&lt;\\/div&gt;\\r\\n    \\r\\n      &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n        &lt;div class=&quot;offset-lg-4 col-lg-2 col-md-6 col-sm-6 col-6&quot;&gt;\\r\\n          &lt;label class=&quot;calculator-subtitle&quot;&gt;My rank&lt;\\/label&gt;\\r\\n          &lt;input type=&quot;number&quot; id=&quot;from-rank&quot; value=&quot;2000&quot; min=&quot;0&quot; max=&quot;7500&quot; step=&quot;25&quot; required=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;col-lg-2  col-md-6 col-sm-6 col-6&quot;&gt;\\r\\n          &lt;label class=&quot;calculator-subtitle&quot;&gt;I want to be&lt;\\/label&gt;\\r\\n          &lt;input type=&quot;number&quot; id=&quot;to-rank&quot; value=&quot;3500&quot; min=&quot;0&quot; max=&quot;7500&quot; step=&quot;25&quot; required=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;offset-lg-2 col-lg-8&quot;&gt;\\r\\n          &lt;input type=&quot;text&quot; id=&quot;calculator-slider&quot; name=&quot;my_range&quot; value=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;col-lg-12&quot;&gt;\\r\\n          &lt;a href=&quot;#&quot; class=&quot;button&quot;&gt;Add to cart&lt;\\/a&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n      &lt;\\/div&gt;\\r\\n    \\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n\"}},\"my_range\":\"\",\"status\":\"1\"}"),
("35","слайды из отзыв","slidereview","{\"name\":\"\\u0441\\u043b\\u0430\\u0439\\u0434\\u044b \\u0438\\u0437 \\u043e\\u0442\\u0437\\u044b\\u0432\",\"status\":\"1\"}"),
("36","html-block-гарантии","html","{\"name\":\"html-block-\\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\",\"module_description\":{\"1\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\",\"description\":\"&lt;!-- Guarantees --&gt;\\r\\n&lt;div class=&quot;guarantees&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n\\r\\n    &lt;div class=&quot;guarantees-title def-title&quot;&gt;\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438&lt;\\/div&gt;\\r\\n\\r\\n    &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/1.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u043c \\u043f\\u043b\\u0430\\u0442\\u0435\\u0436\\u0438 \\u0447\\u0435\\u0440\\u0435\\u0437 Robokassa&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/2.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u043c \\u043e\\u043f\\u043b\\u0430\\u0442\\u0443 \\u0431\\u043e\\u043b\\u0435\\u0435 \\u0447\\u0435\\u043c 50 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u0430\\u043c\\u0438&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/3.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u0430\\u0442\\u0442\\u0435\\u0441\\u0442\\u043e\\u0432\\u0430\\u043d\\u044b WebMoney&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n    &lt;\\/div&gt;\\r\\n\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"status\":\"1\"}"),
("37","html-block-orange-block","html","{\"name\":\"html-block-orange-block\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;!-- Orange-text --&gt;\\r\\n&lt;div class=&quot;orange&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n\\r\\n    &lt;p class=&quot;orange-text&quot;&gt;\\r\\n      \\u0412\\u0441\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u043e\\u0432, \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0439, \\u043b\\u043e\\u0433\\u043e\\u0442\\u0438\\u043f\\u044b \\u0438 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043d\\u044b\\u0435 \\u0437\\u043d\\u0430\\u043a\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043a\\u043e\\u0440\\u043f\\u043e\\u0440\\u0430\\u0446\\u0438\\u0439 Valve \\u0438 WarGaming, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435\\r\\n      \\u0438\\u0445 \\u043b\\u0438\\u0446\\u0435\\u043d\\u0437\\u0438\\u0430\\u0440\\u043e\\u0432. \\u0414\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0438\\u0440\\u0443\\u0435\\u0442 \\u043a\\u0430\\u043a \\u0442\\u043e\\u0440\\u0433\\u043e\\u0432\\u0430\\u044f \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u043a\\u0430 \\u0438 \\u043d\\u0435 \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0438\\u043a\\u043e\\u043c \\r\\n      \\u043f\\u0440\\u043e\\u0434\\u0430\\u0432\\u0430\\u0435\\u043c\\u044b\\u0445 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432\\/\\u0443\\u0441\\u043b\\u0443\\u0433. \\u0412\\u0441\\u0435 \\u043f\\u0440\\u0430\\u0432\\u0430 \\u043f\\u0440\\u0438\\u043d\\u0430\\u0434\\u043b\\u0435\\u0436\\u0430\\u0442 \\u0438\\u0445 \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u044c\\u0446\\u0430\\u043c. \\r\\n    &lt;\\/p&gt;\\r\\n\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"status\":\"1\"}"),
("39","html-block-why-boost","html","{\"name\":\"html-block-why-boost\",\"module_description\":{\"1\":{\"title\":\"html-block-why-boost\",\"description\":\"\\r\\n&lt;!-- why-boost --&gt;\\r\\n&lt;div class=&quot;whyBoost&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n\\r\\n    &lt;div class=&quot;def-title whyBoost-title&quot;&gt;\\u0417\\u0430\\u0447\\u0435\\u043c \\u043d\\u0443\\u0436\\u0435\\u043d &lt;br&gt; \\u0431\\u0443\\u0441\\u0442 \\u0440\\u0435\\u0439\\u0442\\u0438\\u043d\\u0433\\u0430 \\u0432 Dota 2&lt;\\/div&gt;\\r\\n    &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6&quot;&gt;\\r\\n        &lt;div class=&quot;infoBoost&quot;&gt;\\r\\n          &lt;div class=&quot;infoBoost-title&quot;&gt;\\u042d\\u0442\\u043e \\u043f\\u043e\\u043c\\u043e\\u0436\\u0435\\u0442 \\u0442\\u0435\\u0431\\u0435&lt;\\/div&gt;\\r\\n\\r\\n          &lt;ul&gt;\\r\\n            &lt;li&gt;\\u0418\\u0433\\u0440\\u0430\\u0442\\u044c \\u0441 \\u0430\\u0434\\u0435\\u043a\\u0432\\u0430\\u0442\\u043d\\u044b\\u043c\\u0438 \\u0441\\u043e\\u044e\\u0437\\u043d\\u0438\\u043a\\u0430\\u043c\\u0438&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u041f\\u043e\\u0432\\u044b\\u0441\\u0438\\u0442\\u044c \\u0441\\u0442\\u0430\\u0442\\u0438\\u0441\\u0442\\u0438\\u043a\\u0443 \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0442\\u044c \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0435 \\u043e\\u0442 \\u0438\\u0433\\u0440\\u044b&lt;\\/li&gt;\\r\\n          &lt;\\/ul&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6&quot;&gt;\\r\\n        &lt;div class=&quot;infoBoost&quot;&gt;\\r\\n          &lt;div class=&quot;infoBoost-title&quot;&gt;\\u042d\\u0442\\u043e \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e&lt;\\/div&gt;\\r\\n\\r\\n          &lt;ul&gt;\\r\\n            &lt;li&gt;\\u0412\\u0441\\u0435 \\u0431\\u0443\\u0441\\u0442\\u0435\\u0440\\u044b \\u043f\\u0440\\u043e\\u0448\\u043b\\u0438 \\u043f\\u0440\\u043e\\u0432\\u0435\\u0440\\u043a\\u0443&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0430\\u043d\\u043e\\u043d\\u0438\\u043c\\u043d\\u043e&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u0411\\u0430\\u043d \\u043d\\u0435\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u0435\\u043d, \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u0435\\u043c VPN&lt;\\/li&gt;\\r\\n          &lt;\\/ul&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-12&quot;&gt;\\r\\n        &lt;div class=&quot;infoBoost&quot;&gt;\\r\\n          &lt;div class=&quot;infoBoost-title&quot;&gt;\\u041f\\u043e\\u0447\\u0435\\u043c\\u0443 \\u043c\\u044b&lt;\\/div&gt;\\r\\n\\r\\n          &lt;ul&gt;\\r\\n            &lt;li&gt;\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0441 2015 \\u0433\\u043e\\u0434\\u0430&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u041a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0430 \\u0422\\u041e\\u041f-500 \\u0411\\u0443\\u0441\\u0442\\u0435\\u0440\\u043e\\u0432&lt;\\/li&gt;\\r\\n            &lt;li&gt;\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043a\\u043e\\u043d\\u0442\\u0440\\u043e\\u043b\\u044c \\u0438 \\u0447\\u0430\\u0442 \\u043d\\u0430 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0435&lt;\\/li&gt;\\r\\n          &lt;\\/ul&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n    &lt;\\/div&gt;\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n\"}},\"status\":\"1\"}"),
("40","html-block-security","html","{\"name\":\"html-block-security\",\"module_description\":{\"1\":{\"title\":\"html-block-security\",\"description\":\"&lt;!-- security --&gt;\\r\\n&lt;div class=&quot;security&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n    &lt;div class=&quot;def-title&quot;&gt;\\u0412\\u0430\\u0448 \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442 \\u0432 \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0441\\u0442\\u0438!&lt;\\/div&gt;\\r\\n    &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-6 col-md-12&quot;&gt;\\r\\n        &lt;div class=&quot;security-block&quot;&gt;\\r\\n\\r\\n          &lt;div class=&quot;security-block_left&quot;&gt;\\r\\n            &lt;img src=&quot;img\\/icons\\/people.png&quot; alt=&quot;people&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n\\r\\n          &lt;div class=&quot;security-block_right&quot;&gt;\\r\\n            &lt;div class=&quot;security-block_title&quot;&gt;\\u0421\\u0435\\u043c\\u0435\\u0439\\u043d\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440&lt;\\/div&gt;\\r\\n            &lt;div class=&quot;security-block_descr&quot;&gt;\\r\\n              \\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u0442 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u0443\\u044e \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0441\\u0442\\u044c\\r\\n              \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430. \\u041d\\u0435 \\u0438\\u043c\\u0435\\u044f \\u043f\\u0438\\u043d \\u043a\\u043e\\u0434\\u0430 \\u0438 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u0430 \\u043a\\r\\n              \\u043f\\u043e\\u0447\\u0442\\u0435, \\u043d\\u0438\\u043a\\u0442\\u043e \\u043d\\u0435 \\u0441\\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f \\u043a\\r\\n              \\u0438\\u0437\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044e \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0412\\u0430\\u0448\\u0435\\u0433\\u043e \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430.\\r\\n            &lt;\\/div&gt;\\r\\n          &lt;\\/div&gt;\\r\\n\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-6 col-md-12&quot;&gt;\\r\\n        &lt;div class=&quot;security-block&quot;&gt;\\r\\n\\r\\n          &lt;div class=&quot;security-block_left&quot;&gt;\\r\\n            &lt;img src=&quot;img\\/icons\\/eye.png&quot; alt=&quot;eye&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n\\r\\n          &lt;div class=&quot;security-block_right&quot;&gt;\\r\\n            &lt;div class=&quot;security-block_title&quot;&gt;\\u041b\\u0435\\u043d\\u0442\\u0430 \\u0430\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e\\u0441\\u0442\\u0438&lt;\\/div&gt;\\r\\n            &lt;div class=&quot;security-block_descr&quot;&gt;\\r\\n              \\u041f\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0435\\u0442 \\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0437\\u0430 \\u0432\\u0441\\u0435\\u043c\\u0438 \\u0441\\u043e\\u0431\\u044b\\u0442\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\r\\n              \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0435 \\u0432 \\u0440\\u0435\\u0436\\u0438\\u043c\\u0435 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d. \\u0412\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u043f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c\\r\\n              \\u043f\\u043e\\u0431\\u0435\\u0434\\u044b, \\u043f\\u043e\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f. \\u042d\\u0442\\u043e \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e \\u0431\\u043b\\u0430\\u0433\\u043e\\u0434\\u0440\\u044f \\u0442\\u043e\\u043c\\u0443,\\r\\n              \\u0447\\u0442\\u043e \\u043c\\u044b \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u0435\\u043c CRM \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0443 \\u0434\\u043b\\u044f \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u0431\\u0443\\u0441\\u0442\\u0435\\u0440\\u043e\\u0432.\\r\\n            &lt;\\/div&gt;\\r\\n          &lt;\\/div&gt;\\r\\n\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n    &lt;\\/div&gt;\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\"}},\"status\":\"1\"}"),
("45","MainMenu","ocmegamenu","{\"name\":\"MainMenu\",\"status\":\"1\",\"menu\":\"No menus\",\"effect\":\"none\",\"menu_height\":\"40px\",\"menu_bg\":\"FFFFFF\",\"menu_text_color\":\"FFFFFF\",\"menu_pd_top\":\"0px\",\"menu_pd_right\":\"0px\",\"menu_pd_bottom\":\"0px\",\"menu_pd_left\":\"0px\",\"item_bg\":\"FFFFFF\",\"item_bg_hover\":\"FFFFFF\",\"item_font_color\":\"FFFFFF\",\"item_font_size\":\"14px\",\"item_font_transform\":\"none\",\"item_font_weight\":\"400\",\"item_font_color_hover\":\"FFFFFF\",\"item_font_weight_hover\":\"400\",\"item_show\":\"5\",\"mega_menu_bg\":\"FFFFFF\",\"mega_text_color\":\"FFFFFF\",\"mega_menu_width\":\"100%\",\"mega_menu_pd_top\":\"0px\",\"mega_menu_pd_right\":\"0px\",\"mega_menu_pd_bottom\":\"0px\",\"mega_menu_pd_left\":\"0px\",\"second_item_bg\":\"FFFFFF\",\"second_item_bg_hover\":\"FFFFFF\",\"second_item_font_color\":\"FFFFFF\",\"second_item_font_size\":\"12px\",\"second_item_font_transform\":\"none\",\"second_item_font_weight\":\"400\",\"second_item_font_color_hover\":\"FFFFFF\",\"second_item_font_weight_hover\":\"400\",\"third_item_bg\":\"FFFFFF\",\"third_item_bg_hover\":\"FFFFFF\",\"third_item_font_color\":\"FFFFFF\",\"third_item_font_size\":\"11px\",\"third_item_font_transform\":\"none\",\"third_item_font_weight\":\"400\",\"third_item_font_color_hover\":\"FFFFFF\",\"third_item_font_weight_hover\":\"400\"}");




DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


INSERT INTO oc_option VALUES
("18","text","0"),
("16","text","0"),
("14","radio","0"),
("15","checkbox","2"),
("13","radio","0"),
("17","text","0"),
("19","select","0");




DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_option_description VALUES
("15","1","boost_opt"),
("14","1","желаемый рейтинг"),
("17","1","userdata_phone"),
("13","1","ваш рейтинг"),
("16","1","userdata_name"),
("18","1","userdata_vk"),
("19","1","Калибровка");




DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;


INSERT INTO oc_option_value VALUES
("201","13","","0"),
("200","13","","0"),
("129","14","","0"),
("128","14","","0"),
("127","14","","0"),
("126","14","","0"),
("125","14","","0"),
("124","14","","0"),
("123","14","","0"),
("122","14","","0"),
("60","14","","0"),
("121","14","","0"),
("120","14","","0"),
("119","14","","0"),
("118","14","","0"),
("117","14","","0"),
("116","14","","0"),
("115","14","","0"),
("114","14","","0"),
("113","14","","0"),
("112","14","","0"),
("111","14","","0"),
("110","14","","0"),
("109","14","","0"),
("108","14","","0"),
("107","14","","0"),
("106","14","","0"),
("105","14","","0"),
("104","14","","0"),
("103","14","","0"),
("102","14","","0"),
("101","14","","0"),
("100","14","","0"),
("99","14","","0"),
("98","14","","0"),
("97","14","","0"),
("96","14","","0"),
("95","14","","0"),
("94","14","","0"),
("93","14","","0"),
("92","14","","0"),
("91","14","","0"),
("90","14","","0"),
("89","14","","0"),
("88","14","","0"),
("87","14","","0"),
("86","14","","0"),
("85","14","","0"),
("84","14","","0"),
("83","14","","0"),
("82","14","","0"),
("81","14","","0"),
("80","14","","0"),
("79","14","","0"),
("78","14","","0"),
("77","14","","0"),
("76","14","","0"),
("75","14","","0"),
("74","14","","0"),
("73","14","","0"),
("72","14","","0"),
("71","14","","0"),
("70","14","","0"),
("69","14","","0"),
("68","14","","0"),
("67","14","","0"),
("66","14","","0"),
("65","14","","0"),
("64","14","","0"),
("63","14","","0"),
("62","14","","0"),
("61","14","","0"),
("202","13","","0"),
("203","13","","0"),
("204","13","","0"),
("205","13","","0"),
("206","13","","0"),
("207","13","","0"),
("208","13","","0"),
("209","13","","0"),
("210","13","","0"),
("211","13","","0"),
("212","13","","0"),
("213","13","","0"),
("214","13","","0"),
("215","13","","0"),
("216","13","","0"),
("217","13","","0"),
("218","13","","0"),
("219","13","","0"),
("220","13","","0"),
("221","13","","0"),
("222","13","","0"),
("223","13","","0"),
("224","13","","0"),
("225","13","","0"),
("226","13","","0"),
("227","13","","0"),
("228","13","","0"),
("229","13","","0");
INSERT INTO oc_option_value VALUES
("230","13","","0"),
("231","13","","0"),
("232","13","","0"),
("233","13","","0"),
("234","13","","0"),
("235","13","","0"),
("236","13","","0"),
("237","13","","0"),
("238","13","","0"),
("239","13","","0"),
("240","13","","0"),
("241","13","","0"),
("242","13","","0"),
("243","13","","0"),
("244","13","","0"),
("245","13","","0"),
("246","13","","0"),
("247","13","","0"),
("248","13","","0"),
("249","13","","0"),
("250","13","","0"),
("251","13","","0"),
("252","13","","0"),
("253","13","","0"),
("254","13","","0"),
("255","13","","0"),
("256","13","","0"),
("257","13","","0"),
("258","13","","0"),
("259","13","","0"),
("260","13","","0"),
("261","13","","0"),
("262","13","","0"),
("263","13","","0"),
("264","13","","0"),
("265","13","","0"),
("266","13","","0"),
("267","13","","0"),
("268","13","","0"),
("269","13","","0"),
("270","15","","0"),
("271","15","","0"),
("272","15","","0"),
("273","15","","0"),
("283","19","catalog/rank-icon/rank5_0.png","4"),
("282","19","catalog/rank-icon/rank4_0.png","3"),
("281","19","catalog/rank-icon/rank3_0.png","2"),
("280","19","catalog/rank-icon/rank2_0.png","1"),
("274","19","catalog/rank-icon/rank1_0.png","0"),
("284","19","catalog/rank-icon/rank6_0.png","5"),
("285","19","catalog/rank-icon/rank7_0.png","6");




DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_option_value_description VALUES
("67","1","14","700"),
("66","1","14","600"),
("69","1","14","900"),
("65","1","14","500"),
("64","1","14","400"),
("63","1","14","300"),
("62","1","14","200"),
("61","1","14","100"),
("68","1","14","800"),
("60","1","14","0"),
("50","1","14","100"),
("49","1","13","100"),
("70","1","14","1000"),
("71","1","14","1100"),
("72","1","14","1200"),
("73","1","14","1300"),
("74","1","14","1400"),
("75","1","14","1500"),
("76","1","14","1600"),
("77","1","14","1700"),
("78","1","14","1800"),
("79","1","14","1900"),
("80","1","14","2000"),
("81","1","14","2100"),
("82","1","14","2200"),
("83","1","14","2300"),
("84","1","14","2400"),
("85","1","14","2500"),
("86","1","14","2600"),
("87","1","14","2700"),
("88","1","14","2800"),
("89","1","14","2900"),
("90","1","14","3000"),
("91","1","14","3200"),
("92","1","14","3300"),
("93","1","14","3400"),
("94","1","14","3500"),
("95","1","14","3600"),
("96","1","14","3700"),
("97","1","14","3800"),
("98","1","14","3900"),
("99","1","14","4000"),
("100","1","14","4100"),
("101","1","14","4200"),
("102","1","14","4300"),
("103","1","14","4400"),
("104","1","14","4500"),
("105","1","14","4600"),
("106","1","14","4700"),
("107","1","14","4800"),
("108","1","14","4900"),
("109","1","14","5000"),
("110","1","14","5100"),
("111","1","14","5200"),
("112","1","14","5300"),
("113","1","14","5400"),
("114","1","14","5500"),
("115","1","14","5600"),
("116","1","14","5700"),
("117","1","14","5800"),
("118","1","14","5900"),
("119","1","14","6000"),
("120","1","14","6100"),
("121","1","14","6200"),
("122","1","14","6300"),
("123","1","14","6400"),
("124","1","14","6500"),
("125","1","14","6600"),
("126","1","14","6700"),
("127","1","14","6800"),
("128","1","14","6900"),
("129","1","14","7000"),
("200","1","13","0"),
("201","1","13","100"),
("202","1","13","200"),
("203","1","13","300"),
("204","1","13","400"),
("205","1","13","500"),
("206","1","13","600"),
("207","1","13","700"),
("208","1","13","800"),
("209","1","13","900"),
("210","1","13","1000"),
("211","1","13","1100"),
("212","1","13","1200"),
("213","1","13","1300"),
("214","1","13","1400"),
("215","1","13","1500"),
("216","1","13","1600"),
("217","1","13","1700"),
("218","1","13","1800"),
("219","1","13","1900"),
("220","1","13","2000"),
("221","1","13","2100"),
("222","1","13","2200"),
("223","1","13","2300"),
("224","1","13","2400"),
("225","1","13","2500"),
("226","1","13","2600"),
("227","1","13","2700");
INSERT INTO oc_option_value_description VALUES
("228","1","13","2800"),
("229","1","13","2900"),
("230","1","13","3000"),
("231","1","13","3200"),
("232","1","13","3300"),
("233","1","13","3400"),
("234","1","13","3500"),
("235","1","13","3600"),
("236","1","13","3700"),
("237","1","13","3800"),
("238","1","13","3900"),
("239","1","13","4000"),
("240","1","13","4100"),
("241","1","13","4200"),
("242","1","13","4300"),
("243","1","13","4400"),
("244","1","13","4500"),
("245","1","13","4600"),
("246","1","13","4700"),
("247","1","13","4800"),
("248","1","13","4900"),
("249","1","13","5000"),
("250","1","13","5100"),
("251","1","13","5200"),
("252","1","13","5300"),
("253","1","13","5400"),
("254","1","13","5500"),
("255","1","13","5600"),
("256","1","13","5700"),
("257","1","13","5800"),
("258","1","13","5900"),
("259","1","13","6000"),
("260","1","13","6100"),
("261","1","13","6200"),
("262","1","13","6300"),
("263","1","13","6400"),
("264","1","13","6500"),
("265","1","13","6600"),
("266","1","13","6700"),
("267","1","13","6800"),
("268","1","13","6900"),
("269","1","13","7000"),
("270","1","15","Буст пати ММР"),
("271","1","15","Выполнить быстрее"),
("272","1","15","Играть на определенном герое"),
("273","1","15","Не играть в определенное время"),
("284","1","19","Ancient"),
("283","1","19","Legend"),
("282","1","19","Archon"),
("281","1","19","Crusader"),
("280","1","19","Guardian"),
("274","1","19","Herald"),
("285","1","19","Divine");




DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO oc_order VALUES
("18","0","INV-2016-00","0","Интернет магазин Opencart &quot;Русская сборка&quot;","http://localhost/boost/","0","0","","","","","","","","","","","","","","","0","","0","","","","","","","","","","","","","0","","0","","[]","","","","200.0000","3","0","0.0000","0","","1","1","RUB","1.00000000","::1","","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36","pl-PL,pl;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6,en;q=0.5","2019-07-16 05:59:59","2019-07-16 07:30:41"),
("14","0","INV-2016-00","0","Интернет магазин Opencart &quot;Русская сборка&quot;","http://localhost/boost/","0","0","","","","","","","","","","","","","","","0","","0","","[]","","","","","","","","","","","0","","0","","[]","","","","200.0000","0","0","0.0000","0","","1","1","RUB","1.00000000","::1","","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36","pl-PL,pl;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6,en;q=0.5","2019-07-16 05:52:36","2019-07-16 05:52:36");




DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_order_history VALUES
("4","18","2","0","a:1:{s:4:\"post\";a:7:{s:10:\"product_id\";s:2:\"54\";s:5:\"fname\";s:16:\"confirmbattlecup\";s:12:\"radio-group1\";s:2:\"on\";s:12:\"radio-group2\";s:2:\"on\";s:11:\"radio-group\";s:2:\"on\";s:4:\"text\";s:3:\"bgd\";s:5:\"email\";s:9:\"fdsg@dfbv\";}}","2019-07-16 06:00:00"),
("5","18","8","0","","2019-07-16 07:26:40"),
("6","18","3","0","","2019-07-16 07:30:41");




DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO oc_order_product VALUES
("1","1","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("2","2","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("3","3","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("4","4","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("5","5","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("6","6","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("7","7","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("8","8","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("9","9","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("10","10","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("18","18","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0"),
("14","14","54","Выиграть Кубок","выиграть кубок","1","200.0000","200.0000","0.0000","0");




DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


INSERT INTO oc_order_status VALUES
("1","1","Ожидание"),
("2","1","В обработке"),
("3","1","Доставлено"),
("7","1","Отменено"),
("5","1","Сделка завершена"),
("8","1","Возврат"),
("9","1","Отмена и аннулирование"),
("10","1","Неудавшийся"),
("11","1","Возмещенный"),
("12","1","Полностью измененный"),
("13","1","Полный возврат");




DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;


INSERT INTO oc_order_total VALUES
("1","5","sub_total","Сумма","200.0000","0"),
("2","5","total","Итого","200.0000","0"),
("3","6","sub_total","Сумма","200.0000","0"),
("4","6","total","Итого","200.0000","0"),
("5","7","sub_total","Сумма","200.0000","0"),
("6","7","total","Итого","200.0000","0"),
("7","8","sub_total","Сумма","200.0000","0"),
("8","8","total","Итого","200.0000","0"),
("9","9","sub_total","Сумма","200.0000","0"),
("10","9","total","Итого","200.0000","0"),
("11","10","sub_total","Сумма","200.0000","0"),
("12","10","total","Итого","200.0000","0"),
("28","18","total","Итого","200.0000","0"),
("27","18","sub_total","Сумма","200.0000","0"),
("19","14","sub_total","Сумма","200.0000","0"),
("20","14","total","Итого","200.0000","0");




DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;


INSERT INTO oc_product VALUES
("50","mmrboost","","","","","","","","1","7","","0","1","0.0000","0","0","2019-07-06","0.00000000","1","0.00000000","0.00000000","0.00000000","1","0","1","1","1","2","2019-07-06 13:41:04","2019-07-15 07:50:40"),
("51","mmrlowprior","","","","","","","","1","7","","0","1","0.0000","0","0","2019-07-08","0.00000000","1","0.00000000","0.00000000","0.00000000","1","1","1","1","1","0","2019-07-08 22:01:31","2019-07-08 22:04:51"),
("52","calibration","","","","","","","","1","7","","0","1","1350.0000","0","0","2019-07-12","0.00000000","1","0.00000000","0.00000000","0.00000000","1","1","1","1","1","0","2019-07-12 04:34:24","2019-07-15 18:58:15"),
("55","тренировка","","","","","","","","1","7","","0","1","1500.0000","0","0","2019-07-12","0.00000000","1","0.00000000","0.00000000","0.00000000","1","1","1","1","1","0","2019-07-12 05:41:29","2019-07-15 18:09:51"),
("54","выиграть кубок","","","","","","","","99995","7","","0","1","200.0000","0","0","2019-07-12","0.00000000","1","0.00000000","0.00000000","0.00000000","1","1","1","1","1","32","2019-07-12 05:12:37","2019-07-16 03:22:20");




DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_product_description VALUES
("51","1","выход из лоу приора","&lt;p&gt;услуга - выход с лоу приора&lt;/p&gt;","","прокачка, ммр","",""),
("52","1","Заказать калибровку","","","калибровка дота2","",""),
("54","1","Выиграть Кубок","","","выиграть кубок","",""),
("55","1","тренировка","","","тренировка","",""),
("50","1","Прокачка ММР","","","Прокачка ММР","","");




DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;


INSERT INTO oc_product_option VALUES
("297","50","14","","1"),
("298","50","15","","0"),
("227","50","13","","1"),
("305","52","19","","1");




DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;


INSERT INTO oc_product_option_value VALUES
("120","297","50","14","91","0","0","0.0000","","0","","0.00000000",""),
("177","305","52","19","285","0","0","150.0000","+","0","+","0.00000000","+"),
("124","297","50","14","95","0","0","7650.0000","+","0","+","0.00000000","+"),
("133","297","50","14","104","0","0","0.0000","+","0","+","0.00000000","+"),
("123","297","50","14","94","0","0","7285.0000","+","0","+","0.00000000","+"),
("154","297","50","14","125","0","0","60025.0000","+","0","+","0.00000000","+"),
("138","297","50","14","109","0","0","14385.0000","+","0","+","0.00000000","+"),
("111","297","50","14","82","0","0","4075.0000","+","0","+","0.00000000","+"),
("105","297","50","14","76","0","0","2845.0000","+","0","+","0.00000000","+"),
("121","297","50","14","92","0","0","6705.0000","+","0","+","0.00000000","+"),
("144","297","50","14","115","0","0","21825.0000","+","0","+","0.00000000","+"),
("98","297","50","14","69","0","0","1545.0000","+","0","+","0.00000000","+"),
("122","297","50","14","93","0","0","6995.0000","+","0","+","0.00000000","+"),
("89","297","50","14","60","0","0","0.0000","+","0","+","0.00000000","+"),
("134","297","50","14","105","0","0","12085.0000","+","0","+","0.00000000","+"),
("146","297","50","14","117","0","0","26025.0000","+","0","+","0.00000000","+"),
("113","297","50","14","84","0","0","4525.0000","+","0","+","0.00000000","+"),
("135","297","50","14","106","0","0","12660.0000","+","0","+","0.00000000","+"),
("140","297","50","14","111","0","0","16170.0000","+","0","+","0.00000000","+"),
("106","297","50","14","77","1","0","3040.0000","+","0","+","0.00000000","+"),
("119","297","50","14","90","0","0","6125.0000","+","0","+","0.00000000","+"),
("165","298","50","15","272","0","0","10.0000","%","0","+","0.00000000","+"),
("163","298","50","15","273","0","0","10.0000","%","0","+","0.00000000","+"),
("162","298","50","15","271","0","0","10.0000","+","0","+","0.00000000","+"),
("159","298","50","15","270","0","0","10.0000","%","0","+","0.00000000","+"),
("62","227","50","13","243","1","0","-11030.0000","+","0","+","0.00000000","+"),
("33","227","50","13","214","1","0","-2465.0000","+","0","+","0.00000000","+"),
("26","227","50","13","207","1","0","-1185.0000","+","0","+","0.00000000","+"),
("19","227","50","13","200","1","0","0.0000","+","0","+","0.00000000","+"),
("37","227","50","13","218","1","0","-3235.0000","+","0","+","0.00000000","+"),
("48","227","50","13","229","1","0","-5850.0000","+","0","+","0.00000000","+"),
("76","227","50","13","257","1","0","-26025.0000","+","0","+","0.00000000","+"),
("40","227","50","13","221","1","0","-3850.0000","+","0","+","0.00000000","+"),
("24","227","50","13","205","1","0","-825.0000","+","0","+","0.00000000","+"),
("79","227","50","13","260","1","0","-34275.0000","+","0","+","0.00000000","+"),
("73","227","50","13","254","1","0","-20000.0000","+","0","+","0.00000000","+"),
("84","227","50","13","265","1","0","-60025.0000","+","0","+","0.00000000","+"),
("50","227","50","13","231","1","0","0.0000","+","0","+","0.00000000","+"),
("43","227","50","13","224","1","0","-4525.0000","+","0","+","0.00000000","+"),
("32","227","50","13","213","1","0","-2280.0000","+","0","+","0.00000000","+"),
("78","227","50","13","259","1","0","-31225.0000","+","0","+","0.00000000","+"),
("77","227","50","13","258","1","0","-28475.0000","+","0","+","0.00000000","+"),
("68","227","50","13","249","1","0","-14385.0000","+","0","+","0.00000000","+"),
("34","227","50","13","215","1","0","-2650.0000","+","0","+","0.00000000","+"),
("45","227","50","13","226","1","0","-5025.0000","+","0","+","0.00000000","+"),
("20","227","50","13","201","1","0","-175.0000","+","0","+","0.00000000","+"),
("61","227","50","13","242","1","0","-10550.0000","+","0","+","0.00000000","+"),
("17","227","50","13","200","1","0","0.0000","-","0","+","0.00000000","+"),
("42","227","50","13","223","1","0","-4300.0000","+","0","+","0.00000000","+"),
("59","227","50","13","240","1","0","-9590.0000","+","0","+","0.00000000","+"),
("23","227","50","13","204","1","0","-700.0000","+","0","+","0.00000000","+"),
("75","227","50","13","256","1","0","-23775.0000","+","0","+","0.00000000","+"),
("38","227","50","13","219","1","0","-3430.0000","+","0","+","0.00000000","+"),
("86","227","50","13","267","1","0","-79025.0000","+","0","+","0.00000000","+"),
("72","227","50","13","253","1","0","-18490.0000","+","0","+","0.00000000","+"),
("49","227","50","13","230","1","0","-6125.0000","+","0","+","0.00000000","+"),
("53","227","50","13","234","1","0","-7285.0000","+","0","+","0.00000000","+"),
("81","227","50","13","262","1","0","-41275.0000","+","0","+","0.00000000","+"),
("28","227","50","13","209","1","0","-1545.0000","+","0","+","0.00000000","+"),
("52","227","50","13","233","0","0","-6995.0000","+","0","+","0.00000000","+"),
("41","227","50","13","222","1","0","-4075.0000","+","0","+","0.00000000","+"),
("36","227","50","13","217","1","0","-3040.0000","+","0","+","0.00000000","+"),
("35","227","50","13","216","1","0","-2845.0000","+","0","+","0.00000000","+"),
("82","227","50","13","263","1","0","-45575.0000","+","0","+","0.00000000","+"),
("44","227","50","13","225","1","0","-4750.0000","+","0","+","0.00000000","+"),
("63","227","50","13","244","1","0","-11510.0000","+","0","+","0.00000000","+"),
("30","227","50","13","211","1","0","-1910.0000","+","0","+","0.00000000","+"),
("47","227","50","13","228","1","0","-5575.0000","+","0","+","0.00000000","+"),
("21","227","50","13","202","1","0","-350.0000","+","0","+","0.00000000","+"),
("66","227","50","13","247","1","0","-13235.0000","+","0","+","0.00000000","+"),
("65","227","50","13","246","1","0","-12660.0000","+","0","+","0.00000000","+"),
("87","227","50","13","268","1","0","-88525.0000","+","0","+","0.00000000","+"),
("74","227","50","13","255","1","0","-21825.0000","+","0","+","0.00000000","+"),
("51","227","50","13","232","1","0","-6705.0000","+","0","+","0.00000000","+"),
("58","227","50","13","239","1","0","-9110.0000","+","0","+","0.00000000","+"),
("67","227","50","13","248","1","0","-13810.0000","+","0","+","0.00000000","+"),
("71","227","50","13","252","1","0","-17330.0000","+","0","+","0.00000000","+"),
("25","227","50","13","206","1","0","-1005.0000","+","0","+","0.00000000","+"),
("85","227","50","13","266","1","0","-69525.0000","+","0","+","0.00000000","+"),
("22","227","50","13","203","1","0","-525.0000","+","0","+","0.00000000","+"),
("46","227","50","13","227","1","0","-5300.0000","%","0","+","0.00000000","+"),
("55","227","50","13","236","1","0","-8015.0000","+","0","+","0.00000000","+"),
("70","227","50","13","251","1","0","-16170.0000","+","0","+","0.00000000","+"),
("31","227","50","13","212","1","0","-2095.0000","+","0","+","0.00000000","+"),
("57","227","50","13","238","1","0","-8745.0000","+","0","+","0.00000000","+"),
("64","227","50","13","245","1","0","-12085.0000","+","0","+","0.00000000","+"),
("88","227","50","13","269","1","0","-98025.0000","+","0","+","0.00000000","+"),
("83","227","50","13","264","1","0","-50525.0000","+","0","+","0.00000000","+"),
("176","305","52","19","284","0","0","150.0000","+","0","+","0.00000000","+"),
("175","305","52","19","283","0","0","0.0000","+","0","+","0.00000000","+"),
("174","305","52","19","282","0","0","0.0000","+","0","+","0.00000000","+"),
("173","305","52","19","281","0","0","0.0000","+","0","+","0.00000000","+"),
("172","305","52","19","280","0","0","0.0000","+","0","+","0.00000000","+"),
("166","305","52","19","274","0","0","0.0000","+","0","+","0.00000000","+"),
("56","227","50","13","237","0","0","-8380.0000","+","0","+","0.00000000","+"),
("69","227","50","13","250","1","0","-15195.0000","+","0","+","0.00000000","+"),
("39","227","50","13","220","1","0","-3625.0000","+","0","+","0.00000000","+"),
("27","227","50","13","208","1","0","-1365.0000","+","0","+","0.00000000","+"),
("80","227","50","13","261","1","0","-37625.0000","+","0","+","0.00000000","+"),
("54","227","50","13","235","1","0","-7650.0000","+","0","+","0.00000000","+");
INSERT INTO oc_product_option_value VALUES
("29","227","50","13","210","1","0","-1725.0000","+","0","+","0.00000000","+"),
("60","227","50","13","241","1","0","-10070.0000","+","0","+","0.00000000","+");




DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_product_to_category VALUES
("50","59"),
("50","62"),
("51","59"),
("51","62"),
("52","59"),
("55","59");




DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_product_to_layout VALUES
("51","0","0"),
("52","0","16"),
("55","0","18"),
("54","0","17");




DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_product_to_store VALUES
("50","0"),
("51","0"),
("52","0"),
("54","0"),
("55","0");




DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_return_action VALUES
("1","1","Возвращены средства"),
("2","1","Выдан в кредит"),
("3","1","Отправлен другой товар для замены");




DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


INSERT INTO oc_return_reason VALUES
("1","1","Получен/доставлен неисправным (сломан)"),
("2","1","Получен не тот (ошибочный) товар"),
("4","1","Ошибка, пожалуйста укажите/приложите подробности"),
("5","1","Другое (другая причина), пожалуйста укажите/приложите подробности");




DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO oc_return_status VALUES
("1","1","Рассматриваемый"),
("3","1","Готов (к отправке)"),
("2","1","Заказ в ожидании");




DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


INSERT INTO oc_review VALUES
("1","50","0","name1","Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum...","5","1","2019-07-07 08:08:36","0000-00-00 00:00:00"),
("2","50","0","admin","Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum...","4","1","2019-07-07 08:08:36","0000-00-00 00:00:00"),
("3","50","0","admin"," A text to be inserted ad the products- review admin panel, or, using review add tool, near goods","5","1","2019-07-07 08:08:36","0000-00-00 00:00:00"),
("4","50","0","Vasya2000","текст,  который добавляется с помощью -- админ панель--товар-отзывы, или же используя функционал добавления отзывов в пользовательской части.","5","0","2019-07-07 08:08:36","0000-00-00 00:00:00");




DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=525 DEFAULT CHARSET=utf8;


INSERT INTO oc_setting VALUES
("488","0","config","config_seo_url","0","0"),
("489","0","config","config_robots","abot\ndbot\nebot\nhbot\nkbot\nlbot\nmbot\nnbot\nobot\npbot\nrbot\nsbot\ntbot\nvbot\nybot\nzbot\nbot.\nbot/\n_bot\n.bot\n/bot\n-bot\n:bot\n(bot\ncrawl\nslurp\nspider\nseek\naccoona\nacoon\nadressendeutschland\nah-ha.com\nahoy\naltavista\nananzi\nanthill\nappie\narachnophilia\narale\naraneo\naranha\narchitext\naretha\narks\nasterias\natlocal\natn\natomz\naugurfind\nbackrub\nbannana_bot\nbaypup\nbdfetch\nbig brother\nbiglotron\nbjaaland\nblackwidow\nblaiz\nblog\nblo.\nbloodhound\nboitho\nbooch\nbradley\nbutterfly\ncalif\ncassandra\nccubee\ncfetch\ncharlotte\nchurl\ncienciaficcion\ncmc\ncollective\ncomagent\ncombine\ncomputingsite\ncsci\ncurl\ncusco\ndaumoa\ndeepindex\ndelorie\ndepspid\ndeweb\ndie blinde kuh\ndigger\nditto\ndmoz\ndocomo\ndownload express\ndtaagent\ndwcp\nebiness\nebingbong\ne-collector\nejupiter\nemacs-w3 search engine\nesther\nevliya celebi\nezresult\nfalcon\nfelix ide\nferret\nfetchrover\nfido\nfindlinks\nfireball\nfish search\nfouineur\nfunnelweb\ngazz\ngcreep\ngenieknows\ngetterroboplus\ngeturl\nglx\ngoforit\ngolem\ngrabber\ngrapnel\ngralon\ngriffon\ngromit\ngrub\ngulliver\nhamahakki\nharvest\nhavindex\nhelix\nheritrix\nhku www octopus\nhomerweb\nhtdig\nhtml index\nhtml_analyzer\nhtmlgobble\nhubater\nhyper-decontextualizer\nia_archiver\nibm_planetwide\nichiro\niconsurf\niltrovatore\nimage.kapsi.net\nimagelock\nincywincy\nindexer\ninfobee\ninformant\ningrid\ninktomisearch.com\ninspector web\nintelliagent\ninternet shinchakubin\nip3000\niron33\nisraeli-search\nivia\njack\njakarta\njavabee\njetbot\njumpstation\nkatipo\nkdd-explorer\nkilroy\nknowledge\nkototoi\nkretrieve\nlabelgrabber\nlachesis\nlarbin\nlegs\nlibwww\nlinkalarm\nlink validator\nlinkscan\nlockon\nlwp\nlycos\nmagpie\nmantraagent\nmapoftheinternet\nmarvin/\nmattie\nmediafox\nmediapartners\nmercator\nmerzscope\nmicrosoft url control\nminirank\nmiva\nmj12\nmnogosearch\nmoget\nmonster\nmoose\nmotor\nmultitext\nmuncher\nmuscatferret\nmwd.search\nmyweb\nnajdi\nnameprotect\nnationaldirectory\nnazilla\nncsa beta\nnec-meshexplorer\nnederland.zoek\nnetcarta webmap engine\nnetmechanic\nnetresearchserver\nnetscoop\nnewscan-online\nnhse\nnokia6682/\nnomad\nnoyona\nnutch\nnzexplorer\nobjectssearch\noccam\nomni\nopen text\nopenfind\nopenintelligencedata\norb search\nosis-project\npack rat\npageboy\npagebull\npage_verifier\npanscient\nparasite\npartnersite\npatric\npear.\npegasus\nperegrinator\npgp key agent\nphantom\nphpdig\npicosearch\npiltdownman\npimptrain\npinpoint\npioneer\npiranha\nplumtreewebaccessor\npogodak\npoirot\npompos\npoppelsdorf\npoppi\npopular iconoclast\npsycheclone\npublisher\npython\nrambler\nraven search\nroach\nroad runner\nroadhouse\nrobbie\nrobofox\nrobozilla\nrules\nsalty\nsbider\nscooter\nscoutjet\nscrubby\nsearch.\nsearchprocess\nsemanticdiscovery\nsenrigan\nsg-scout\nshai\'hulud\nshark\nshopwiki\nsidewinder\nsift\nsilk\nsimmany\nsite searcher\nsite valet\nsitetech-rover\nskymob.com\nsleek\nsmartwit\nsna-\nsnappy\nsnooper\nsohu\nspeedfind\nsphere\nsphider\nspinner\nspyder\nsteeler/\nsuke\nsuntek\nsupersnooper\nsurfnomore\nsven\nsygol\nszukacz\ntach black widow\ntarantula\ntempleton\n/teoma\nt-h-u-n-d-e-r-s-t-o-n-e\ntheophrastus\ntitan\ntitin\ntkwww\ntoutatis\nt-rex\ntutorgig\ntwiceler\ntwisted\nucsd\nudmsearch\nurl check\nupdated\nvagabondo\nvalkyrie\nverticrawl\nvictoria\nvision-search\nvolcano\nvoyager/\nvoyager-hc\nw3c_validator\nw3m2\nw3mir\nwalker\nwallpaper\nwanderer\nwauuu\nwavefire\nweb core\nweb hopper\nweb wombat\nwebbandit\nwebcatcher\nwebcopy\nwebfoot\nweblayers\nweblinker\nweblog monitor\nwebmirror\nwebmonkey\nwebquest\nwebreaper\nwebsitepulse\nwebsnarf\nwebstolperer\nwebvac\nwebwalk\nwebwatch\nwebwombat\nwebzinger\nwhizbang\nwhowhere\nwild ferret\nworldlight\nwwwc\nwwwster\nxenu\nxget\nxift\nxirq\nyandex\nyanga\nyeti\nyodao\nzao\nzippp\nzyborg","0"),
("496","0","config","config_file_ext_allowed","zip\ntxt\npng\njpe\njpeg\njpg\ngif\nbmp\nico\ntiff\ntif\nsvg\nsvgz\nzip\nrar\nmsi\ncab\nmp3\nqt\nmov\npdf\npsd\nai\neps\nps\ndoc","0"),
("497","0","config","config_file_mime_allowed","text/plain\nimage/png\nimage/jpeg\nimage/gif\nimage/bmp\nimage/tiff\nimage/svg+xml\napplication/zip\n&quot;application/zip&quot;\napplication/x-zip\n&quot;application/x-zip&quot;\napplication/x-zip-compressed\n&quot;application/x-zip-compressed&quot;\napplication/rar\n&quot;application/rar&quot;\napplication/x-rar\n&quot;application/x-rar&quot;\napplication/x-rar-compressed\n&quot;application/x-rar-compressed&quot;\napplication/octet-stream\n&quot;application/octet-stream&quot;\naudio/mpeg\nvideo/quicktime\napplication/pdf","0"),
("498","0","config","config_error_display","1","0"),
("499","0","config","config_error_log","1","0"),
("500","0","config","config_error_filename","error.log","0"),
("495","0","config","config_file_max_size","300000","0"),
("406","0","payment_robokassa","payment_robokassa_payment_object","commodity","0"),
("490","0","config","config_compression","0","0"),
("491","0","config","config_secure","0","0"),
("492","0","config","config_password","1","0"),
("493","0","config","config_shared","0","0"),
("519","0","config","config_encryption","02PWWQJ6Dtw19izXChAQ03ZGBcQRv3XxIbKOgDAQfsuZ3xKWA4nJdpIScYZUKZ4xrFfVFCETaUbJvM7lm3Z9sPmGD5y4PTyT8gKD764c10EAl6ujhfaoFzmQMV7AYQEQi2h5fYwZmRkfyKDdJKUo76jn9fS2WN1iCkFQLUlQDsKd3nDMkaEFiweYIg2OtyZ1wsw7axCqTG7cM30PgTqOfpUGcwJ9eZ4am9273eaToYxzmsjcfTR4UZ1EKuf6Yfn76XOyoLM3q62BihzZqhaGuFtpN9sMLrBNQO6ATQ9YZBGUwpT35C9VQjzzaXGvZRk1Rucdu4oMD3128IGQdQH662BVKP7wduN0QyqU6T7xgwuAexOei2LcyuAFDWIZZJEbdLkZQYP9J4MHqjQVwETEilRWnb9lOY8coCu3vF8bl7fZAntQy6hgBQtZFomNHBKYi27tTdQas4pXMmXxQRVdO3HLvAZgiGl2obqaDb4V7iiufxRzYUpnKiLThDgaknSUsGgpFZxTd5hR89otaF0KugYvtVg9yg2ocm4bhcF9Uf5OK4hM3jrPGSRBQmIR7DiA1BtBBjryREZzkS10wt4D2m1nEeNOkknkZ6IyQiMT2JGH0vd4uL7Qfz2Cl8qJtsTi5zoIrWbm2PI0KtQcP6Q5LY4086xL1EUW624kCaKnFh4W9yBMlKSOEuzNWR9TKsbaeA8oynhl1yAtZgJWJcNYf8RlfQLO4gVfUZDVz1K2rc9eaBydd4kkzfAKH0izDJfJ5W1LCV4nrEPrBd7oNp9hRFXrusbCBvJy4yrKQoFCjrHd9QxJC2zTaBGS0FHkjQ6LlQAvWS6JtuQK73H3qPyT8opLB1djgW5UXtTuNBqCeKLpYn79EXC6jfPpPLGxJSKdDUhRFFAqV6ATxYgupA7o6LJ03QM5H8VVMJXQmKtiPlIkWwEfNIU79asMNc6hONMCD3LYuvYBVLONhMmuYPFyfAZGE5T6XJ30V8wWwjYBnNGeTh4QKbYwRu40goSkamKG","0"),
("487","0","config","config_maintenance","0","0"),
("486","0","config","config_mail_alert_email","","0"),
("485","0","config","config_mail_alert","[\"order\"]","1"),
("482","0","config","config_mail_smtp_password","","0"),
("484","0","config","config_mail_smtp_timeout","5","0"),
("483","0","config","config_mail_smtp_port","25","0"),
("481","0","config","config_mail_smtp_username","","0"),
("480","0","config","config_mail_smtp_hostname","","0"),
("479","0","config","config_mail_parameter","","0"),
("478","0","config","config_mail_protocol","mail","0"),
("477","0","config","config_ftp_status","0","0"),
("476","0","config","config_ftp_root","","0"),
("475","0","config","config_ftp_password","","0"),
("474","0","config","config_ftp_username","","0"),
("473","0","config","config_ftp_port","21","0"),
("472","0","config","config_ftp_hostname","localhost","0"),
("471","0","config","config_icon","catalog/cart.png","0"),
("470","0","config","config_logo","catalog/logo.png","0"),
("469","0","config","config_captcha_page","[\"review\",\"return\",\"contact\"]","1"),
("468","0","config","config_captcha","","0"),
("467","0","config","config_return_status_id","2","0"),
("454","0","config","config_order_status_id","1","0"),
("465","0","config","config_affiliate_id","4","0"),
("466","0","config","config_return_id","0","0"),
("464","0","config","config_affiliate_commission","5","0"),
("463","0","config","config_affiliate_auto","0","0"),
("462","0","config","config_affiliate_approval","0","0"),
("461","0","config","config_stock_checkout","0","0"),
("460","0","config","config_stock_warning","0","0"),
("459","0","config","config_stock_display","0","0"),
("457","0","config","config_fraud_status_id","2","0"),
("520","0","config","config_api_id","5","0"),
("456","0","config","config_complete_status","[\"3\",\"5\"]","1"),
("95","0","free_checkout","free_checkout_status","1","0"),
("96","0","free_checkout","free_checkout_order_status_id","1","0"),
("409","0","payment_robokassa","payment_robokassa_sort_order","","0"),
("407","0","payment_robokassa","payment_robokassa_geo_zone_id","0","0"),
("104","0","free_checkout","free_checkout_sort_order","1","0"),
("105","0","cod","cod_sort_order","5","0"),
("106","0","cod","cod_total","0.01","0"),
("107","0","cod","cod_order_status_id","1","0"),
("108","0","cod","cod_geo_zone_id","0","0"),
("109","0","cod","cod_status","1","0"),
("408","0","payment_robokassa","payment_robokassa_status","1","0"),
("403","0","payment_robokassa","payment_robokassa_tax_type","osn","0"),
("404","0","payment_robokassa","payment_robokassa_tax","none","0"),
("401","0","payment_robokassa","payment_robokassa_test","1","0"),
("123","0","category","category_status","1","0"),
("124","0","account","account_status","1","0"),
("125","0","affiliate","affiliate_status","1","0"),
("126","0","theme_default","theme_default_product_limit","15","0"),
("127","0","theme_default","theme_default_product_description_length","100","0"),
("128","0","theme_default","theme_default_image_thumb_width","228","0"),
("129","0","theme_default","theme_default_image_thumb_height","228","0"),
("130","0","theme_default","theme_default_image_popup_width","500","0"),
("131","0","theme_default","theme_default_image_popup_height","500","0"),
("132","0","theme_default","theme_default_image_category_width","80","0"),
("133","0","theme_default","theme_default_image_category_height","80","0"),
("134","0","theme_default","theme_default_image_product_width","228","0"),
("135","0","theme_default","theme_default_image_product_height","228","0"),
("136","0","theme_default","theme_default_image_additional_width","74","0"),
("137","0","theme_default","theme_default_image_additional_height","74","0"),
("138","0","theme_default","theme_default_image_related_width","200","0"),
("139","0","theme_default","theme_default_image_related_height","200","0"),
("140","0","theme_default","theme_default_image_compare_width","90","0"),
("141","0","theme_default","theme_default_image_compare_height","90","0"),
("142","0","theme_default","theme_default_image_wishlist_width","47","0"),
("143","0","theme_default","theme_default_image_wishlist_height","47","0"),
("144","0","theme_default","theme_default_image_cart_height","47","0"),
("145","0","theme_default","theme_default_image_cart_width","47","0"),
("146","0","theme_default","theme_default_image_location_height","50","0"),
("147","0","theme_default","theme_default_image_location_width","268","0"),
("148","0","theme_default","theme_default_directory","default","0"),
("149","0","theme_default","theme_default_status","1","0"),
("150","0","dashboard_activity","dashboard_activity_status","1","0"),
("151","0","dashboard_activity","dashboard_activity_sort_order","7","0"),
("152","0","dashboard_sale","dashboard_sale_status","1","0"),
("153","0","dashboard_sale","dashboard_sale_width","3","0"),
("154","0","dashboard_chart","dashboard_chart_status","1","0"),
("155","0","dashboard_chart","dashboard_chart_width","6","0"),
("156","0","dashboard_customer","dashboard_customer_status","1","0"),
("157","0","dashboard_customer","dashboard_customer_width","3","0"),
("158","0","dashboard_map","dashboard_map_status","1","0"),
("159","0","dashboard_map","dashboard_map_width","6","0"),
("160","0","dashboard_online","dashboard_online_status","1","0"),
("161","0","dashboard_online","dashboard_online_width","3","0");
INSERT INTO oc_setting VALUES
("162","0","dashboard_order","dashboard_order_sort_order","1","0"),
("163","0","dashboard_order","dashboard_order_status","1","0"),
("164","0","dashboard_order","dashboard_order_width","3","0"),
("165","0","dashboard_sale","dashboard_sale_sort_order","2","0"),
("166","0","dashboard_customer","dashboard_customer_sort_order","3","0"),
("167","0","dashboard_online","dashboard_online_sort_order","4","0"),
("168","0","dashboard_map","dashboard_map_sort_order","5","0"),
("169","0","dashboard_chart","dashboard_chart_sort_order","6","0"),
("170","0","dashboard_recent","dashboard_recent_status","1","0"),
("171","0","dashboard_recent","dashboard_recent_sort_order","8","0"),
("172","0","dashboard_activity","dashboard_activity_width","4","0"),
("173","0","dashboard_recent","dashboard_recent_width","8","0"),
("455","0","config","config_processing_status","[\"2\",\"3\",\"1\",\"12\",\"5\"]","1"),
("453","0","config","config_checkout_id","5","0"),
("452","0","config","config_checkout_guest","1","0"),
("451","0","config","config_cart_weight","1","0"),
("450","0","config","config_invoice_prefix","INV-2016-00","0"),
("449","0","config","config_account_id","3","0"),
("448","0","config","config_login_attempts","5","0"),
("447","0","config","config_customer_price","0","0"),
("446","0","config","config_customer_group_display","[\"1\"]","1"),
("445","0","config","config_customer_group_id","1","0"),
("444","0","config","config_customer_search","0","0"),
("443","0","config","config_customer_activity","0","0"),
("442","0","config","config_customer_online","0","0"),
("441","0","config","config_tax_customer","shipping","0"),
("440","0","config","config_tax_default","shipping","0"),
("439","0","config","config_tax","0","0"),
("438","0","config","config_voucher_max","1000","0"),
("437","0","config","config_voucher_min","1","0"),
("436","0","config","config_review_guest","1","0"),
("435","0","config","config_review_status","1","0"),
("434","0","config","config_limit_admin","20","0"),
("433","0","config","config_product_count","1","0"),
("432","0","config","config_weight_class_id","1","0"),
("431","0","config","config_length_class_id","1","0"),
("430","0","config","config_currency_auto","1","0"),
("429","0","config","config_currency","RUB","0"),
("428","0","config","config_admin_language","ru-ru","0"),
("427","0","config","config_language","ru-ru","0"),
("426","0","config","config_zone_id","","0"),
("425","0","config","config_country_id","176","0"),
("424","0","config","config_comment","","0"),
("423","0","config","config_open","","0"),
("422","0","config","config_image","","0"),
("421","0","config","config_fax","495 888-88-88","0"),
("420","0","config","config_telephone","495 888-88-88","0"),
("518","0","config","config_email","1111@1111.ru","0"),
("418","0","config","config_geocode","","0"),
("417","0","config","config_address","г. Москва, ул. Ленина 10 оф. 32","0"),
("416","0","config","config_owner","Иванов Иван","0"),
("415","0","config","config_name","Интернет магазин Opencart &quot;Русская сборка&quot;","0"),
("413","0","config","config_theme","theme_default","0"),
("414","0","config","config_layout_id","1","0"),
("411","0","config","config_meta_description","Мой магазин","0"),
("412","0","config","config_meta_keyword","","0"),
("410","0","config","config_meta_title","Интернет магазин Opencart &quot;Русская сборка&quot;","0"),
("359","0","information","information_status","1","0"),
("362","0","breadcrumbs","breadcrumbs_status","1","0"),
("405","0","payment_robokassa","payment_robokassa_payment_method","full_prepayment","0"),
("402","0","payment_robokassa","payment_robokassa_fiscal","0","0"),
("400","0","payment_robokassa","payment_robokassa_order_status_id","2","0"),
("398","0","payment_robokassa","payment_robokassa_test_password_1","","0"),
("399","0","payment_robokassa","payment_robokassa_test_password_2","","0"),
("397","0","payment_robokassa","payment_robokassa_password_2","bXdSq8bruB","0"),
("396","0","payment_robokassa","payment_robokassa_password_1","bXdSq8bruB","0"),
("395","0","payment_robokassa","payment_robokassa_login","admin","0"),
("516","0","free","free_status","1","0"),
("515","0","free","free_geo_zone_id","0","0"),
("514","0","free","free_total","10","0"),
("517","0","free","free_sort_order","","0"),
("521","0","total","total_status","1","0"),
("522","0","total","total_sort_order","","0"),
("523","0","sub_total","sub_total_status","1","0"),
("524","0","sub_total","sub_total_sort_order","","0");




DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO oc_stock_status VALUES
("7","1","В наличии"),
("8","1","Предзаказ"),
("5","1","Нет в наличии"),
("6","1","Ожидание 2-3 дня");




DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


INSERT INTO oc_tax_class VALUES
("9","Налоги","Облагаемые налогом","2014-06-06 23:00:00","2014-09-09 11:50:31");




DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;


INSERT INTO oc_tax_rate VALUES
("87","3","НДС","18.0000","F","2011-09-21 21:49:23","2014-09-09 11:49:32");




DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_tax_rate_to_customer_group VALUES
("86","1"),
("87","1");




DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;


INSERT INTO oc_tax_rule VALUES
("121","10","86","payment","1"),
("120","10","87","store","0"),
("128","9","86","shipping","1"),
("127","9","87","shipping","2");




DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=982 DEFAULT CHARSET=utf8;


INSERT INTO oc_url_alias VALUES
("730","manufacturer_id=8","apple"),
("772","information_id=4","about_us"),
("943","category_id=59","uslugi"),
("981","product_id=54","winbattlecup"),
("977","product_id=55","trenirovka"),
("935","information_id=7","guaranties"),
("940","information_id=10","awork"),
("975","product_id=50","prokachka-mmr"),
("898","product_id=51","bust-rejtinga"),
("901","category_id=62","dota-forma"),
("979","product_id=52","kalibrovka"),
("828","manufacturer_id=9","canon"),
("829","manufacturer_id=5","htc"),
("830","manufacturer_id=7","hewlett-packard"),
("831","manufacturer_id=6","palm"),
("832","manufacturer_id=10","sony"),
("841","information_id=6","delivery"),
("842","information_id=3","privacy"),
("894","information_id=5","terms"),
("845","common/home",""),
("846","information/contact","contact"),
("847","information/sitemap","sitemap"),
("848","product/special","specials"),
("849","product/manufacturer","brands"),
("850","product/compare","compare-products"),
("851","product/search","search"),
("852","checkout/cart","cart"),
("853","checkout/checkout","checkout"),
("854","account/login","login"),
("855","account/logout","logout"),
("856","account/voucher","vouchers"),
("857","account/wishlist","wishlist"),
("858","account/account","my-account"),
("859","account/order","order-history"),
("860","account/newsletter","newsletter"),
("861","account/return/add","return-add"),
("862","account/forgotten","forgot-password"),
("863","account/download","downloads"),
("864","account/return","returns"),
("865","account/transaction","transactions"),
("866","account/register","create-account"),
("867","account/recurring","recurring"),
("868","account/address","address-book"),
("869","account/reward","reward-points"),
("870","account/edit","edit-account"),
("871","account/password","change-password"),
("880","affiliate/forgotten","affiliate-forgot-password"),
("881","affiliate/register","create-affiliate-account"),
("882","affiliate/login","affiliate-login"),
("883","affiliate/payment","affiliate-payment"),
("884","affiliate/tracking","affiliate-tracking"),
("885","affiliate/transaction","affiliate-transaction"),
("886","affiliate/account","affiliates");




DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


INSERT INTO oc_user VALUES
("1","1","admin","b1868dcface93e1c961080955cc03f474ef68690","nLLoBEX0Y","John","Doe","1111@1111.ru","","","::1","1","2019-07-16 00:24:27"),
("2","11","User","18208140b1d6bc499af742faa00e5d1b501934d4","e2ef8kGkY","User","User","User@User.com","","","","1","2019-07-13 03:03:41");




DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


INSERT INTO oc_user_group VALUES
("1","Administrator","{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/installer\",\"extension\\/modification (2)\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/breadcrumbs\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/ocmegamenu\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slidereview\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/robokassa\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/installer\",\"extension\\/modification (2)\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/breadcrumbs\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/ocmegamenu\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slidereview\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/robokassa\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}"),
("10","Demonstration",""),
("11","users","");




DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO oc_voucher_theme VALUES
("8","catalog/demo/canon_eos_5d_2.jpg"),
("7","catalog/demo/gift-voucher-birthday.jpg"),
("6","catalog/demo/apple_logo.jpg");




DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_voucher_theme_description VALUES
("6","1","Новый год"),
("7","1","День рождения"),
("8","1","Другое");




DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_weight_class VALUES
("1","1.00000000"),
("2","1000.00000000"),
("5","2.20460000"),
("6","35.27400000");




DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_weight_class_description VALUES
("1","1","Килограмм","кг"),
("2","1","Грамм","г");




DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;


INSERT INTO oc_zone VALUES
("1","20","Брест","BR","1"),
("2","20","Гомель","HO","1"),
("3","20","Минск","HM","1"),
("4","20","Гродно","HR","1"),
("5","20","Могилев","MA","1"),
("6","20","Минская область","MI","1"),
("7","20","Витебск","VI","1"),
("8","80","Abkhazia","AB","1"),
("9","80","Ajaria","AJ","1"),
("10","80","Tbilisi","TB","1"),
("11","80","Guria","GU","1"),
("12","80","Imereti","IM","1"),
("13","80","Kakheti","KA","1"),
("14","80","Kvemo Kartli","KK","1"),
("15","80","Mtskheta-Mtianeti","MM","1"),
("16","80","Racha Lechkhumi and Kvemo Svanet","RL","1"),
("17","80","Samegrelo-Zemo Svaneti","SZ","1"),
("18","80","Samtskhe-Javakheti","SJ","1"),
("19","80","Shida Kartli","SK","1"),
("20","109","Алматинская область","AL","1"),
("21","109","Алматы - город республ-го значения","AC","1"),
("22","109","Акмолинская область","AM","1"),
("23","109","Актюбинская область","AQ","1"),
("24","109","Астана - город республ-го значения","AS","1"),
("25","109","Атырауская область","AT","1"),
("26","109","Западно-Казахстанская область","BA","1"),
("27","109","Байконур - город республ-го значения","BY","1"),
("28","109","Мангистауская область","MA","1"),
("29","109","Южно-Казахстанская область","ON","1"),
("30","109","Павлодарская область","PA","1"),
("31","109","Карагандинская область","QA","1"),
("32","109","Костанайская область","QO","1"),
("33","109","Кызылординская область","QY","1"),
("34","109","Восточно-Казахстанская область","SH","1"),
("35","109","Северо-Казахстанская область","SO","1"),
("36","109","Жамбылская область","ZH","1"),
("37","115","Bishkek","GB","1"),
("38","115","Batken","B","1"),
("39","115","Chu","C","1"),
("40","115","Jalal-Abad","J","1"),
("41","115","Naryn","N","1"),
("42","115","Osh","O","1"),
("43","115","Talas","T","1"),
("44","115","Ysyk-Kol","Y","1"),
("45","176","Республика Хакасия","KK","1"),
("46","176","Московская область","MOS","1"),
("47","176","Чукотский АО","CHU","1"),
("48","176","Архангельская область","ARK","1"),
("49","176","Астраханская область","AST","1"),
("50","176","Алтайский край","ALT","1"),
("51","176","Белгородская область","BEL","1"),
("52","176","Еврейская АО","YEV","1"),
("53","176","Амурская область","AMU","1"),
("54","176","Брянская область","BRY","1"),
("55","176","Чувашская Республика","CU","1"),
("56","176","Челябинская область","CHE","1"),
("57","176","Карачаево-Черкесия","KC","1"),
("58","176","Забайкальский край","ZAB","1"),
("59","176","Ленинградская область","LEN","1"),
("60","176","Республика Калмыкия","KL","1"),
("61","176","Сахалинская область","SAK","1"),
("62","176","Республика Алтай","AL","1"),
("63","176","Чеченская Республика","CE","1"),
("64","176","Иркутская область","IRK","1"),
("65","176","Ивановская область","IVA","1"),
("66","176","Удмуртская Республика","UD","1"),
("67","176","Калининградская область","KGD","1"),
("68","176","Калужская область","KLU","1"),
("69","176","Республика Татарстан","TA","1"),
("70","176","Кемеровская область","KEM","1"),
("71","176","Хабаровский край","KHA","1"),
("72","176","Ханты-Мансийский АО - Югра","KHM","1"),
("73","176","Костромская область","KOS","1"),
("74","176","Краснодарский край","KDA","1"),
("75","176","Красноярский край","KYA","1"),
("76","176","Курганская область","KGN","1"),
("77","176","Курская область","KRS","1"),
("78","176","Республика Тыва","TY","1"),
("79","176","Липецкая область","LIP","1"),
("80","176","Магаданская область","MAG","1"),
("81","176","Республика Дагестан","DA","1"),
("82","176","Республика Адыгея","AD","1"),
("83","176","Москва","MOW","1"),
("84","176","Мурманская область","MUR","1"),
("85","176","Республика Кабардино-Балкария","KB","1"),
("86","176","Ненецкий АО","NEN","1"),
("87","176","Республика Ингушетия","IN","1"),
("88","176","Нижегородская область","NIZ","1"),
("89","176","Новгородская область","NGR","1"),
("90","176","Новосибирская область","NVS","1"),
("91","176","Омская область","OMS","1"),
("92","176","Орловская область","ORL","1"),
("93","176","Оренбургская область","ORE","1"),
("94","176","Пензенская область","PNZ","1"),
("95","176","Пермский край","PER","1"),
("96","176","Камчатский край","KAM","1"),
("97","176","Республика Карелия","KR","1"),
("98","176","Псковская область","PSK","1"),
("99","176","Ростовская область","ROS","1"),
("100","176","Рязанская область","RYA","1");
INSERT INTO oc_zone VALUES
("101","176","Ямало-Ненецкий АО","YAN","1"),
("102","176","Самарская область","SAM","1"),
("103","176","Республика Мордовия","MO","1"),
("104","176","Саратовская область","SAR","1"),
("105","176","Смоленская область","SMO","1"),
("106","176","Санкт-Петербург","SPE","1"),
("107","176","Ставропольский край","STA","1"),
("108","176","Республика Коми","KO","1"),
("109","176","Тамбовская область","TAM","1"),
("110","176","Томская область","TOM","1"),
("111","176","Тульская область","TUL","1"),
("112","176","Тверская область","TVE","1"),
("113","176","Тюменская область","TYU","1"),
("114","176","Республика Башкортостан","BA","1"),
("115","176","Ульяновская область","ULY","1"),
("116","176","Республика Бурятия","BU","1"),
("117","176","Республика Северная Осетия","SE","1"),
("118","176","Владимирская область","VLA","1"),
("119","176","Приморский край","PRI","1"),
("120","176","Волгоградская область","VGG","1"),
("121","176","Вологодская область","VLG","1"),
("122","176","Воронежская область","VOR","1"),
("123","176","Кировская область","KIR","1"),
("124","176","Республика Саха","SA","1"),
("125","176","Ярославская область","YAR","1"),
("126","176","Свердловская область","SVE","1"),
("127","176","Республика Марий Эл","ME","1"),
("128","176","Республика Крым","CR","1"),
("129","220","Черкассы","CK","1"),
("130","220","Чернигов","CH","1"),
("131","220","Черновцы","CV","1"),
("132","220","Днепропетровск","DN","1"),
("133","220","Донецк","DO","1"),
("134","220","Ивано-Франковск","IV","1"),
("135","220","Харьков","KH","1"),
("136","220","Хмельницкий","KM","1"),
("137","220","Кировоград","KR","1"),
("138","220","Киевская область","KV","1"),
("139","220","Киев","KY","1"),
("140","220","Луганск","LU","1"),
("141","220","Львов","LV","1"),
("142","220","Николаев","MY","1"),
("143","220","Одесса","OD","1"),
("144","220","Полтава","PO","1"),
("145","220","Ровно","RI","1"),
("146","176","Севастополь","SEV","1"),
("147","220","Сумы","SU","1"),
("148","220","Тернополь","TE","1"),
("149","220","Винница","VI","1"),
("150","220","Луцк","VO","1"),
("151","220","Ужгород","ZK","1"),
("152","220","Запорожье","ZA","1"),
("153","220","Житомир","ZH","1"),
("154","220","Херсон","KE","1"),
("155","226","Andijon","AN","1"),
("156","226","Buxoro","BU","1"),
("157","226","Farg\'ona","FA","1"),
("158","226","Jizzax","JI","1"),
("159","226","Namangan","NG","1"),
("160","226","Navoiy","NW","1"),
("161","226","Qashqadaryo","QA","1"),
("162","226","Qoraqalpog\'iston Republikasi","QR","1"),
("163","226","Samarqand","SA","1"),
("164","226","Sirdaryo","SI","1"),
("165","226","Surxondaryo","SU","1"),
("166","226","Toshkent City","TK","1"),
("167","226","Toshkent Region","TO","1"),
("168","226","Xorazm","XO","1"),
("169","176","Байконур - город республ-го значения","BY","1");




DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;


INSERT INTO oc_zone_to_geo_zone VALUES
("1","222","0","4","0000-00-00 00:00:00","0000-00-00 00:00:00"),
("110","176","0","3","2014-09-09 11:48:13","0000-00-00 00:00:00");


