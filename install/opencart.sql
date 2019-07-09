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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_api VALUES
("1","Default","uITeZAwY1fSmQbOuMhwxxYEru4Bn2LV5DWpCKBSQlvoyN5yqqN2FYnBOhrEBkXXTyv8moFIuZ8yxQtKKcKpfkbmSiFQ2NTJh0S1Hpd7G6wuYu9ENT1Re57mJjVTnYlc9Fhm43wbL8Bx6reDRc2E0T0Rfs9XFU6ghihOjCc7XgcwCmiC26oyMK7bBaYwbABO6xbnZSXMocFTM5PPieyISlg3nQDERgUJfbqpsvouOExI9QyWOL1T6GHj05bWzZutK","1","2019-07-06 13:15:17","2019-07-06 13:15:17");




DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute VALUES
("1","6","1"),
("2","6","5"),
("3","6","3"),
("4","3","1"),
("5","3","2"),
("6","3","3"),
("7","3","4"),
("8","3","5"),
("9","3","6"),
("10","3","7"),
("11","3","8");




DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_description VALUES
("1","1","Description"),
("2","1","No. of Cores"),
("4","1","test 1"),
("5","1","test 2"),
("6","1","test 3"),
("7","1","test 4"),
("8","1","test 5"),
("9","1","test 6"),
("10","1","test 7"),
("11","1","test 8"),
("3","1","Clockspeed");




DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_group VALUES
("3","2"),
("4","1"),
("5","3"),
("6","4");




DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_attribute_group_description VALUES
("3","1","Memory"),
("4","1","Technical"),
("5","1","Motherboard"),
("6","1","Processor");




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
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;


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
("150","9","1","Обучение &lt;br&gt;&lt;b&gt;от бустеров&lt;/b&gt;","#1","catalog/banner/1.jpg","0","Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!"),
("151","9","1","&lt;br&gt;Заказать &lt;b&gt;буст рейтинга&lt;/b&gt;","#2","catalog/banner/2.jpg","2","             Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!           "),
("152","9","1","Победить &lt;br&gt;&lt;b&gt;Battle Cup&lt;/b&gt;","#3","catalog/banner/1.jpg","3","             Мы давно работаем в этой сфере и реализовали             огромное количество Ваших желаний!             Профессиональная помощь в играх!           "),
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
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;


INSERT INTO oc_category VALUES
("59","","0","1","1","0","1","2019-07-06 13:35:44","2019-07-06 13:35:44"),
("60","","59","0","1","0","1","2019-07-06 13:38:00","2019-07-06 13:39:36"),
("61","","59","0","1","0","1","2019-07-06 13:39:16","2019-07-06 13:39:27");




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
("60","1","буст аккаунта","","boost","",""),
("61","1","выход из лоу приора","","dota-spec","","");




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
("60","59","0"),
("61","59","0"),
("60","60","1"),
("61","61","1");




DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_to_layout VALUES
("59","0","0"),
("60","0","0"),
("61","0","0");




DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_category_to_store VALUES
("59","0"),
("60","0"),
("61","0");




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
("1","Рубль","RUB","","р.","0","1.00000000","1","2019-07-08 04:39:09");




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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


INSERT INTO oc_event VALUES
("1","voucher","catalog/model/checkout/order/addOrderHistory/after","extension/total/voucher/send","0","0000-00-00 00:00:00");




DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;


INSERT INTO oc_extension VALUES
("1","payment","cod"),
("2","total","shipping"),
("3","total","sub_total"),
("4","total","tax"),
("5","total","total"),
("6","module","banner"),
("7","module","carousel"),
("8","total","credit"),
("9","shipping","flat"),
("10","total","handling"),
("11","total","low_order_fee"),
("12","total","coupon"),
("13","module","category"),
("14","module","account"),
("15","total","reward"),
("16","total","voucher"),
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
("34","module","slidereview");




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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO oc_information VALUES
("3","1","3","1"),
("4","1","1","1"),
("5","0","4","1"),
("6","1","2","1");




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
("6","1","Доставка","&lt;p&gt;\n	Delivery Information&lt;/p&gt;","Доставка","","");




DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_information_to_layout VALUES
("5","0","0");




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
("6","0");




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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


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
("13","Search");




DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;


INSERT INTO oc_layout_module VALUES
("2","4","0","content_top","0"),
("3","4","0","content_top","1"),
("20","5","0","column_left","2"),
("69","10","affiliate","column_right","1"),
("68","6","account","column_right","1"),
("100","1","html.36","content_top","3"),
("99","1","slidereview.35","content_top","2"),
("72","3","category","column_left","1"),
("98","1","html.34","content_top","1"),
("97","1","banner.32","content_top","0"),
("101","1","html.37","content_top","4");




DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;


INSERT INTO oc_layout_route VALUES
("38","6","0","account/%"),
("17","10","0","affiliate/%"),
("44","3","0","product/category"),
("63","1","0","common/home"),
("20","2","0","product/product"),
("24","11","0","information/information"),
("23","7","0","checkout/%"),
("31","8","0","information/contact"),
("32","9","0","information/sitemap"),
("34","4","0",""),
("45","5","0","product/manufacturer"),
("52","12","0","product/compare"),
("53","13","0","product/search");




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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;


INSERT INTO oc_module VALUES
("29","Home Page","carousel","{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}"),
("28","Home Page","featured","{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}"),
("32","banner-dota","banner","{\"name\":\"banner-dota\",\"banner_id\":\"9\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}"),
("34","html-block-mmr-boost","html","{\"name\":\"html-block-mmr-boost\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;!-- calculator --&gt;\\r\\n&lt;div class=&quot;container&quot;&gt;\\r\\n  &lt;div class=&quot;calculator&quot;&gt;\\r\\n    &lt;div class=&quot;calculator-title&quot;&gt;&lt;span&gt;Dota 2&lt;\\/span&gt; mmr boost&lt;\\/div&gt;\\r\\n    \\r\\n      &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n        &lt;div class=&quot;offset-lg-4 col-lg-2 col-md-6 col-sm-6 col-6&quot;&gt;\\r\\n          &lt;label class=&quot;calculator-subtitle&quot;&gt;My rank&lt;\\/label&gt;\\r\\n          &lt;input type=&quot;number&quot; id=&quot;from-rank&quot; value=&quot;2000&quot; min=&quot;0&quot; max=&quot;7500&quot; step=&quot;25&quot; required=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;col-lg-2  col-md-6 col-sm-6 col-6&quot;&gt;\\r\\n          &lt;label class=&quot;calculator-subtitle&quot;&gt;I want to be&lt;\\/label&gt;\\r\\n          &lt;input type=&quot;number&quot; id=&quot;to-rank&quot; value=&quot;3500&quot; min=&quot;0&quot; max=&quot;7500&quot; step=&quot;25&quot; required=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;offset-lg-2 col-lg-8&quot;&gt;\\r\\n          &lt;input type=&quot;text&quot; id=&quot;calculator-slider&quot; name=&quot;my_range&quot; value=&quot;&quot;&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        &lt;div class=&quot;col-lg-12&quot;&gt;\\r\\n          &lt;a href=&quot;#&quot; class=&quot;button&quot;&gt;Add to cart&lt;\\/a&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n      &lt;\\/div&gt;\\r\\n    \\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n\"}},\"my_range\":\"\",\"status\":\"1\"}"),
("35","слайды из отзыв","slidereview","{\"name\":\"\\u0441\\u043b\\u0430\\u0439\\u0434\\u044b \\u0438\\u0437 \\u043e\\u0442\\u0437\\u044b\\u0432\",\"status\":\"1\"}"),
("36","html-block-гарантии","html","{\"name\":\"html-block-\\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\",\"module_description\":{\"1\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\",\"description\":\"&lt;!-- Guarantees --&gt;\\r\\n&lt;div class=&quot;guarantees&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n\\r\\n    &lt;div class=&quot;guarantees-title def-title&quot;&gt;\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438&lt;\\/div&gt;\\r\\n\\r\\n    &lt;div class=&quot;row&quot;&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/1.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u043c \\u043f\\u043b\\u0430\\u0442\\u0435\\u0436\\u0438 \\u0447\\u0435\\u0440\\u0435\\u0437 Robokassa&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/2.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u043c \\u043e\\u043f\\u043b\\u0430\\u0442\\u0443 \\u0431\\u043e\\u043b\\u0435\\u0435 \\u0447\\u0435\\u043c 50 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u0430\\u043c\\u0438&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n      &lt;div class=&quot;col-lg-4 col-md-6 col-sm-12&quot;&gt;\\r\\n        &lt;div class=&quot;guarantees-block&quot;&gt;\\r\\n          &lt;div class=&quot;container-img&quot;&gt;\\r\\n            &lt;img src=&quot;catalog\\/view\\/theme\\/default\\/img\\/guarantees\\/3.png&quot; alt=&quot;#&quot;&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;p&gt;\\u041c\\u044b \\u0430\\u0442\\u0442\\u0435\\u0441\\u0442\\u043e\\u0432\\u0430\\u043d\\u044b WebMoney&lt;\\/p&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n\\r\\n    &lt;\\/div&gt;\\r\\n\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"status\":\"1\"}"),
("37","html-block-orange-block","html","{\"name\":\"html-block-orange-block\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;!-- Orange-text --&gt;\\r\\n&lt;div class=&quot;orange&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n\\r\\n    &lt;p class=&quot;orange-text&quot;&gt;\\r\\n      \\u0412\\u0441\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u043e\\u0432, \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0439, \\u043b\\u043e\\u0433\\u043e\\u0442\\u0438\\u043f\\u044b \\u0438 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043d\\u044b\\u0435 \\u0437\\u043d\\u0430\\u043a\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043a\\u043e\\u0440\\u043f\\u043e\\u0440\\u0430\\u0446\\u0438\\u0439 Valve \\u0438 WarGaming, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435\\r\\n      \\u0438\\u0445 \\u043b\\u0438\\u0446\\u0435\\u043d\\u0437\\u0438\\u0430\\u0440\\u043e\\u0432. \\u0414\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0438\\u0440\\u0443\\u0435\\u0442 \\u043a\\u0430\\u043a \\u0442\\u043e\\u0440\\u0433\\u043e\\u0432\\u0430\\u044f \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u043a\\u0430 \\u0438 \\u043d\\u0435 \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0438\\u043a\\u043e\\u043c \\r\\n      \\u043f\\u0440\\u043e\\u0434\\u0430\\u0432\\u0430\\u0435\\u043c\\u044b\\u0445 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432\\/\\u0443\\u0441\\u043b\\u0443\\u0433. \\u0412\\u0441\\u0435 \\u043f\\u0440\\u0430\\u0432\\u0430 \\u043f\\u0440\\u0438\\u043d\\u0430\\u0434\\u043b\\u0435\\u0436\\u0430\\u0442 \\u0438\\u0445 \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u044c\\u0446\\u0430\\u043c. \\r\\n    &lt;\\/p&gt;\\r\\n\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"status\":\"1\"}");




DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


INSERT INTO oc_option VALUES
("1","radio","1"),
("2","checkbox","2"),
("4","text","3"),
("5","select","4"),
("6","textarea","5"),
("7","file","6"),
("8","date","7"),
("9","time","8"),
("10","datetime","9"),
("11","select","10"),
("12","date","11");




DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_option_description VALUES
("1","1","Radio"),
("2","1","Checkbox"),
("4","1","Text"),
("6","1","Textarea"),
("8","1","Date"),
("7","1","File"),
("5","1","Select"),
("9","1","Time"),
("10","1","Date &amp; Time"),
("12","1","Delivery Date"),
("11","1","Size");




DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;


INSERT INTO oc_option_value VALUES
("43","1","","3"),
("32","1","","1"),
("45","2","","4"),
("44","2","","3"),
("42","5","","4"),
("41","5","","3"),
("39","5","","1"),
("40","5","","2"),
("31","1","","2"),
("23","2","","1"),
("24","2","","2"),
("46","11","","1"),
("47","11","","2"),
("48","11","","3");




DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_option_value_description VALUES
("43","1","1","Large"),
("32","1","1","Small"),
("45","1","2","Checkbox 4"),
("44","1","2","Checkbox 3"),
("31","1","1","Medium"),
("42","1","5","Yellow"),
("41","1","5","Green"),
("39","1","5","Red"),
("40","1","5","Blue"),
("23","1","2","Checkbox 1"),
("24","1","2","Checkbox 2"),
("48","1","11","Large"),
("47","1","11","Medium"),
("46","1","11","Small");




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;


INSERT INTO oc_product VALUES
("50","mmrboost","","","","","","","","1","7","","0","1","0.0000","0","0","2019-07-06","0.00000000","1","0.00000000","0.00000000","0.00000000","1","1","1","1","1","0","2019-07-06 13:41:04","2019-07-06 13:41:22");




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
("50","1","Прокачка ММР","","","mmrup","","");




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
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;






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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;






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
("50","60"),
("50","61");




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
("50","0","0");




DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO oc_product_to_store VALUES
("50","0");




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
) ENGINE=MyISAM AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;


INSERT INTO oc_setting VALUES
("348","0","config","config_compression","0","0"),
("349","0","config","config_secure","0","0"),
("350","0","config","config_password","1","0"),
("351","0","config","config_shared","0","0"),
("352","0","config","config_encryption","5cKBww3hD8SxePqCXqG3qVGEelC3XHFhYmyH7cVXzgwVfGWbwdARsy2Qvonv5tMirS5xCtagASkh1qYcNZjyZSADGb3g2IWI4PcuYeb1fHvyEljaa4ccWpqgj7wFNFjH6vC3RnJbVqfGF28Jpj2u95s8fmislxtL3HtW2eMv5qbNRqdRHztX0jtprR1iioayjjVIa78vvIP2ycvTyVLNV0KUVJPTB4dbO2AGzE56Iw8nVRiXrNCim2GXwUrHL0357etwJY74ch49f3Z8OcB5X2JgL5Csj228uQn6KcCol2mkTu6jJm37WYxVaNJhDco1YPd4xHmmw4PXQY1l1a5rN8NTOaMHuqwZbVJ9CvhMBKxT4Pvj9iZFtd5wZDmjY1jeXWyWXTjFAEwkBxWUZYglrFTKk8xPw0u4OsXoiEpYm4mEqSC6rD3dAtuL2IIggiUfQS0Ae6uwwUhfoTYCQ7CB0AG47haZg1mEvOv4eAQuehw4UJbbpqRmuejlXEF498ASUMLznrnzXiSp5WAD6gXbFeh0JcLMrCEP2qjwVxJsItf0khHSTAQFhqJbgvAQ8IEGKx5UPpQrPPHERJSQIiQKR5gyTgWjNxcrYcl3vm3MGeuYvf1sdKZhCFMQifGMaGqGnmmEGqyBn5vZbSQEcTpjGpeISceu3FoAT5arUsyrsiOwpt3ekhTxnthIuxClluxXtT7KYsRyQM25SY3f6SksEUqWozXlg1zuwOvSGdB0AzlMTennumb8N5xlXR3e2tjWGASnrLKAW4jb5CoiTt4OaqGAULLFyzdVxLqQ4U2xnyDFMQr5chbg9sAlUv2G8VGC2ayj6NtLWPQFwtR2bXgbWkQFVR1iEOO7T0oEhSJY4E8OJ4bbBAtO10PGGBwtCoobOklYVnwIDMBnSPbvYSROpo0vajvKCtt46aXSN8b13ZR1VIVMjGcbNWz22fDsOLNeKm8lBZpiSxBlE8tLqCMcIqzU8cONIho4YPcUATivi4BmJznADiOnzIcPcBZhcQZV","0"),
("353","0","config","config_file_max_size","300000","0"),
("354","0","config","config_file_ext_allowed","zip\ntxt\npng\njpe\njpeg\njpg\ngif\nbmp\nico\ntiff\ntif\nsvg\nsvgz\nzip\nrar\nmsi\ncab\nmp3\nqt\nmov\npdf\npsd\nai\neps\nps\ndoc","0"),
("355","0","config","config_file_mime_allowed","text/plain\nimage/png\nimage/jpeg\nimage/gif\nimage/bmp\nimage/tiff\nimage/svg+xml\napplication/zip\n&quot;application/zip&quot;\napplication/x-zip\n&quot;application/x-zip&quot;\napplication/x-zip-compressed\n&quot;application/x-zip-compressed&quot;\napplication/rar\n&quot;application/rar&quot;\napplication/x-rar\n&quot;application/x-rar&quot;\napplication/x-rar-compressed\n&quot;application/x-rar-compressed&quot;\napplication/octet-stream\n&quot;application/octet-stream&quot;\naudio/mpeg\nvideo/quicktime\napplication/pdf","0"),
("4","0","voucher","voucher_sort_order","8","0"),
("5","0","voucher","voucher_status","1","0"),
("356","0","config","config_error_display","1","0"),
("357","0","config","config_error_log","1","0"),
("347","0","config","config_robots","abot\ndbot\nebot\nhbot\nkbot\nlbot\nmbot\nnbot\nobot\npbot\nrbot\nsbot\ntbot\nvbot\nybot\nzbot\nbot.\nbot/\n_bot\n.bot\n/bot\n-bot\n:bot\n(bot\ncrawl\nslurp\nspider\nseek\naccoona\nacoon\nadressendeutschland\nah-ha.com\nahoy\naltavista\nananzi\nanthill\nappie\narachnophilia\narale\naraneo\naranha\narchitext\naretha\narks\nasterias\natlocal\natn\natomz\naugurfind\nbackrub\nbannana_bot\nbaypup\nbdfetch\nbig brother\nbiglotron\nbjaaland\nblackwidow\nblaiz\nblog\nblo.\nbloodhound\nboitho\nbooch\nbradley\nbutterfly\ncalif\ncassandra\nccubee\ncfetch\ncharlotte\nchurl\ncienciaficcion\ncmc\ncollective\ncomagent\ncombine\ncomputingsite\ncsci\ncurl\ncusco\ndaumoa\ndeepindex\ndelorie\ndepspid\ndeweb\ndie blinde kuh\ndigger\nditto\ndmoz\ndocomo\ndownload express\ndtaagent\ndwcp\nebiness\nebingbong\ne-collector\nejupiter\nemacs-w3 search engine\nesther\nevliya celebi\nezresult\nfalcon\nfelix ide\nferret\nfetchrover\nfido\nfindlinks\nfireball\nfish search\nfouineur\nfunnelweb\ngazz\ngcreep\ngenieknows\ngetterroboplus\ngeturl\nglx\ngoforit\ngolem\ngrabber\ngrapnel\ngralon\ngriffon\ngromit\ngrub\ngulliver\nhamahakki\nharvest\nhavindex\nhelix\nheritrix\nhku www octopus\nhomerweb\nhtdig\nhtml index\nhtml_analyzer\nhtmlgobble\nhubater\nhyper-decontextualizer\nia_archiver\nibm_planetwide\nichiro\niconsurf\niltrovatore\nimage.kapsi.net\nimagelock\nincywincy\nindexer\ninfobee\ninformant\ningrid\ninktomisearch.com\ninspector web\nintelliagent\ninternet shinchakubin\nip3000\niron33\nisraeli-search\nivia\njack\njakarta\njavabee\njetbot\njumpstation\nkatipo\nkdd-explorer\nkilroy\nknowledge\nkototoi\nkretrieve\nlabelgrabber\nlachesis\nlarbin\nlegs\nlibwww\nlinkalarm\nlink validator\nlinkscan\nlockon\nlwp\nlycos\nmagpie\nmantraagent\nmapoftheinternet\nmarvin/\nmattie\nmediafox\nmediapartners\nmercator\nmerzscope\nmicrosoft url control\nminirank\nmiva\nmj12\nmnogosearch\nmoget\nmonster\nmoose\nmotor\nmultitext\nmuncher\nmuscatferret\nmwd.search\nmyweb\nnajdi\nnameprotect\nnationaldirectory\nnazilla\nncsa beta\nnec-meshexplorer\nnederland.zoek\nnetcarta webmap engine\nnetmechanic\nnetresearchserver\nnetscoop\nnewscan-online\nnhse\nnokia6682/\nnomad\nnoyona\nnutch\nnzexplorer\nobjectssearch\noccam\nomni\nopen text\nopenfind\nopenintelligencedata\norb search\nosis-project\npack rat\npageboy\npagebull\npage_verifier\npanscient\nparasite\npartnersite\npatric\npear.\npegasus\nperegrinator\npgp key agent\nphantom\nphpdig\npicosearch\npiltdownman\npimptrain\npinpoint\npioneer\npiranha\nplumtreewebaccessor\npogodak\npoirot\npompos\npoppelsdorf\npoppi\npopular iconoclast\npsycheclone\npublisher\npython\nrambler\nraven search\nroach\nroad runner\nroadhouse\nrobbie\nrobofox\nrobozilla\nrules\nsalty\nsbider\nscooter\nscoutjet\nscrubby\nsearch.\nsearchprocess\nsemanticdiscovery\nsenrigan\nsg-scout\nshai\'hulud\nshark\nshopwiki\nsidewinder\nsift\nsilk\nsimmany\nsite searcher\nsite valet\nsitetech-rover\nskymob.com\nsleek\nsmartwit\nsna-\nsnappy\nsnooper\nsohu\nspeedfind\nsphere\nsphider\nspinner\nspyder\nsteeler/\nsuke\nsuntek\nsupersnooper\nsurfnomore\nsven\nsygol\nszukacz\ntach black widow\ntarantula\ntempleton\n/teoma\nt-h-u-n-d-e-r-s-t-o-n-e\ntheophrastus\ntitan\ntitin\ntkwww\ntoutatis\nt-rex\ntutorgig\ntwiceler\ntwisted\nucsd\nudmsearch\nurl check\nupdated\nvagabondo\nvalkyrie\nverticrawl\nvictoria\nvision-search\nvolcano\nvoyager/\nvoyager-hc\nw3c_validator\nw3m2\nw3mir\nwalker\nwallpaper\nwanderer\nwauuu\nwavefire\nweb core\nweb hopper\nweb wombat\nwebbandit\nwebcatcher\nwebcopy\nwebfoot\nweblayers\nweblinker\nweblog monitor\nwebmirror\nwebmonkey\nwebquest\nwebreaper\nwebsitepulse\nwebsnarf\nwebstolperer\nwebvac\nwebwalk\nwebwatch\nwebwombat\nwebzinger\nwhizbang\nwhowhere\nwild ferret\nworldlight\nwwwc\nwwwster\nxenu\nxget\nxift\nxirq\nyandex\nyanga\nyeti\nyodao\nzao\nzippp\nzyborg","0"),
("345","0","config","config_maintenance","0","0"),
("346","0","config","config_seo_url","1","0"),
("344","0","config","config_mail_alert_email","","0"),
("343","0","config","config_mail_alert","[\"order\"]","1"),
("340","0","config","config_mail_smtp_password","","0"),
("341","0","config","config_mail_smtp_port","25","0"),
("342","0","config","config_mail_smtp_timeout","5","0"),
("339","0","config","config_mail_smtp_username","","0"),
("338","0","config","config_mail_smtp_hostname","","0"),
("337","0","config","config_mail_parameter","","0"),
("336","0","config","config_mail_protocol","mail","0"),
("335","0","config","config_ftp_status","0","0"),
("334","0","config","config_ftp_root","","0"),
("333","0","config","config_ftp_password","","0"),
("332","0","config","config_ftp_username","","0"),
("331","0","config","config_ftp_port","21","0"),
("330","0","config","config_ftp_hostname","localhost","0"),
("329","0","config","config_icon","catalog/cart.png","0"),
("328","0","config","config_logo","catalog/logo.png","0"),
("327","0","config","config_captcha_page","[\"review\",\"return\",\"contact\"]","1"),
("326","0","config","config_captcha","","0"),
("325","0","config","config_return_status_id","2","0"),
("324","0","config","config_return_id","0","0"),
("323","0","config","config_affiliate_id","4","0"),
("321","0","config","config_affiliate_auto","0","0"),
("318","0","config","config_stock_warning","0","0"),
("319","0","config","config_stock_checkout","0","0"),
("320","0","config","config_affiliate_approval","0","0"),
("317","0","config","config_stock_display","0","0"),
("316","0","config","config_api_id","1","0"),
("315","0","config","config_fraud_status_id","2","0"),
("314","0","config","config_complete_status","[\"3\",\"5\"]","1"),
("312","0","config","config_order_status_id","1","0"),
("313","0","config","config_processing_status","[\"2\",\"3\",\"1\",\"12\",\"5\"]","1"),
("95","0","free_checkout","free_checkout_status","1","0"),
("96","0","free_checkout","free_checkout_order_status_id","1","0"),
("97","0","shipping","shipping_sort_order","3","0"),
("98","0","sub_total","sub_total_sort_order","1","0"),
("99","0","sub_total","sub_total_status","1","0"),
("100","0","tax","tax_status","0","0"),
("101","0","total","total_sort_order","9","0"),
("102","0","total","total_status","1","0"),
("103","0","tax","tax_sort_order","5","0"),
("104","0","free_checkout","free_checkout_sort_order","1","0"),
("105","0","cod","cod_sort_order","5","0"),
("106","0","cod","cod_total","0.01","0"),
("107","0","cod","cod_order_status_id","1","0"),
("108","0","cod","cod_geo_zone_id","0","0"),
("109","0","cod","cod_status","1","0"),
("110","0","shipping","shipping_status","1","0"),
("111","0","shipping","shipping_estimator","1","0"),
("112","0","coupon","coupon_sort_order","4","0"),
("113","0","coupon","coupon_status","1","0"),
("114","0","flat","flat_sort_order","1","0"),
("115","0","flat","flat_status","1","0"),
("116","0","flat","flat_geo_zone_id","0","0"),
("117","0","flat","flat_tax_class_id","9","0"),
("118","0","flat","flat_cost","5.00","0"),
("119","0","credit","credit_sort_order","7","0"),
("120","0","credit","credit_status","1","0"),
("121","0","reward","reward_sort_order","2","0"),
("122","0","reward","reward_status","1","0"),
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
("147","0","theme_default","theme_default_image_location_width","268","0");
INSERT INTO oc_setting VALUES
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
("161","0","dashboard_online","dashboard_online_width","3","0"),
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
("322","0","config","config_affiliate_commission","5","0"),
("311","0","config","config_checkout_id","5","0"),
("310","0","config","config_checkout_guest","1","0"),
("309","0","config","config_cart_weight","1","0"),
("308","0","config","config_invoice_prefix","INV-2016-00","0"),
("307","0","config","config_account_id","3","0"),
("306","0","config","config_login_attempts","5","0"),
("305","0","config","config_customer_price","0","0"),
("304","0","config","config_customer_group_display","[\"1\"]","1"),
("303","0","config","config_customer_group_id","1","0"),
("302","0","config","config_customer_search","0","0"),
("301","0","config","config_customer_activity","0","0"),
("300","0","config","config_customer_online","0","0"),
("299","0","config","config_tax_customer","shipping","0"),
("298","0","config","config_tax_default","shipping","0"),
("297","0","config","config_tax","0","0"),
("296","0","config","config_voucher_max","1000","0"),
("280","0","config","config_image","","0"),
("281","0","config","config_open","","0"),
("282","0","config","config_comment","","0"),
("283","0","config","config_country_id","176","0"),
("284","0","config","config_zone_id","","0"),
("285","0","config","config_language","ru-ru","0"),
("286","0","config","config_admin_language","ru-ru","0"),
("287","0","config","config_currency","RUB","0"),
("288","0","config","config_currency_auto","1","0"),
("289","0","config","config_length_class_id","1","0"),
("290","0","config","config_weight_class_id","1","0"),
("291","0","config","config_product_count","1","0"),
("292","0","config","config_limit_admin","20","0"),
("293","0","config","config_review_status","1","0"),
("294","0","config","config_review_guest","1","0"),
("295","0","config","config_voucher_min","1","0"),
("279","0","config","config_fax","495 888-88-88","0"),
("276","0","config","config_geocode","","0"),
("277","0","config","config_email","root@localhost.ru","0"),
("278","0","config","config_telephone","495 888-88-88","0"),
("269","0","config","config_meta_description","Мой магазин","0"),
("270","0","config","config_meta_keyword","","0"),
("271","0","config","config_theme","theme_default","0"),
("272","0","config","config_layout_id","1","0"),
("273","0","config","config_name","Интернет магазин Opencart &quot;Русская сборка&quot;","0"),
("274","0","config","config_owner","Иванов Иван","0"),
("275","0","config","config_address","г. Москва, ул. Ленина 10 оф. 32","0"),
("268","0","config","config_meta_title","Интернет магазин Opencart &quot;Русская сборка&quot;","0"),
("358","0","config","config_error_filename","error.log","0"),
("359","0","information","information_status","1","0");




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
) ENGINE=MyISAM AUTO_INCREMENT=895 DEFAULT CHARSET=utf8;


INSERT INTO oc_url_alias VALUES
("730","manufacturer_id=8","apple"),
("772","information_id=4","about_us"),
("887","category_id=59","uslugi"),
("891","category_id=60","bust-akkaunta"),
("890","category_id=61","vyhod-iz-lou-priora"),
("893","product_id=50","prokachka-mmr"),
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO oc_user VALUES
("1","1","admin","3eb4a58d366d2d6bd2b210a8513c784f92d91ad6","0iLvRcOPD","John","Doe","root@localhost.ru","catalog/2.png","","::1","1","2019-07-06 13:15:17");




DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


INSERT INTO oc_user_group VALUES
("1","Administrator","{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/information\",\"extension\\/module\\/special\",\"extension\\/module\\/html\",\"extension\\/module\\/store\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/slidereview\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/information\",\"extension\\/module\\/special\",\"extension\\/module\\/html\",\"extension\\/module\\/store\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/slidereview\"]}"),
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


