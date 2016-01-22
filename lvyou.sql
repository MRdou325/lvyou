-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016-01-22 18:52:28
-- 服务器版本: 5.6.11
-- PHP 版本: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `lvyou`
--
CREATE DATABASE IF NOT EXISTS `lvyou` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lvyou`;

-- --------------------------------------------------------

--
-- 表的结构 `ly_action`
--

CREATE TABLE IF NOT EXISTS `ly_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ly_action`
--

INSERT INTO `ly_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `ly_action_log`
--

CREATE TABLE IF NOT EXISTS `ly_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=199 ;

--
-- 转存表中的数据 `ly_action_log`
--

INSERT INTO `ly_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(41, 1, 1, 2130706433, 'member', 1, 'admin在2015-08-07 15:58登录了后台', 1, 1438934309),
(42, 10, 1, 2130706433, 'Menu', 139, '操作url：/ke1/index.php?s=/Admin/Menu/add.html', 1, 1438934379),
(43, 10, 1, 2130706433, 'Menu', 140, '操作url：/ke1/index.php?s=/Admin/Menu/add.html', 1, 1438934407),
(44, 6, 1, 2130706433, 'config', 48, '操作url：/ke1/index.php?s=/Admin/Config/edit.html', 1, 1438935079),
(45, 10, 1, 2130706433, 'Menu', 135, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935238),
(46, 10, 1, 2130706433, 'Menu', 76, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935585),
(47, 10, 1, 2130706433, 'Menu', 77, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935772),
(48, 10, 1, 2130706433, 'Menu', 78, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935784),
(49, 10, 1, 2130706433, 'Menu', 79, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935793),
(50, 10, 1, 2130706433, 'Menu', 121, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935802),
(51, 1, 1, 0, 'member', 1, 'Admin在2015-08-10 09:14登录了后台', 1, 1439169268),
(52, 11, 1, 0, 'category', 39, '操作url：/ke361/index.php?s=/Admin/Category/add.html', 1, 1439170241),
(53, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183147),
(54, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183360),
(55, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183605),
(56, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183727),
(57, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183865),
(58, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184333),
(59, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184405),
(60, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184441),
(61, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184463),
(62, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184483),
(63, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184526),
(64, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184589),
(65, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184616),
(66, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184908),
(67, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185317),
(68, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185375),
(69, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185393),
(70, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185628),
(71, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185676),
(72, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185723),
(73, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185734),
(74, 6, 1, 0, 'config', 20, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261081),
(75, 6, 1, 0, 'config', 20, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261218),
(76, 6, 1, 0, 'config', 0, '操作url：/ke361/index.php?s=/Admin/Config/del/id/49.html', 1, 1439261230),
(77, 6, 1, 0, 'config', 0, '操作url：/ke361/index.php?s=/Admin/Config/del/id/50.html', 1, 1439261234),
(78, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261990),
(79, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439262031),
(80, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439276485),
(81, 6, 1, 0, 'config', 56, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439276876),
(82, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439278647),
(83, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439293768),
(84, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439294227),
(85, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342618),
(86, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342635),
(87, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342649),
(88, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439342768),
(89, 10, 1, 0, 'Menu', 142, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439346606),
(90, 10, 1, 0, 'Menu', 142, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439346733),
(91, 10, 1, 0, 'Menu', 143, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439346763),
(92, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439348103),
(93, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349593),
(94, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349657),
(95, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349726),
(96, 6, 1, 0, 'config', 62, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439371229),
(97, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439372982),
(98, 6, 1, 0, 'config', 61, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439375941),
(99, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376161),
(100, 6, 1, 0, 'config', 57, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376167),
(101, 6, 1, 0, 'config', 59, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376190),
(102, 6, 1, 0, 'config', 56, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376201),
(103, 6, 1, 0, 'config', 58, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376206),
(104, 6, 1, 0, 'config', 60, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376214),
(105, 6, 1, 0, 'config', 62, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376224),
(106, 6, 1, 0, 'config', 61, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376234),
(107, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376250),
(108, 6, 1, 0, 'config', 63, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376257),
(109, 6, 1, 0, 'config', 60, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376266),
(110, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439518669),
(111, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439518700),
(112, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439518763),
(113, 10, 1, 0, 'Menu', 145, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439520458),
(114, 10, 1, 0, 'Menu', 145, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439520724),
(115, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:34登录了后台', 1, 1439541277),
(116, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:39登录了后台', 1, 1439541574),
(117, 1, 1, 0, 'member', 1, 'Admin在2015-08-14 16:46登录了后台', 1, 1439541964),
(118, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:46登录了后台', 1, 1439542001),
(119, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:51登录了后台', 1, 1439542286),
(120, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:57登录了后台', 1, 1439542628),
(121, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:59登录了后台', 1, 1439542740),
(122, 1, 4, 0, 'member', 4, '还可以在2015-08-14 17:03登录了后台', 1, 1439543003),
(123, 1, 1, 0, 'member', 1, 'Admin在2015-08-14 17:06登录了后台', 1, 1439543200),
(124, 10, 1, 0, 'Menu', 146, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439629315),
(125, 10, 1, 0, 'Menu', 147, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439629337),
(126, 10, 1, 0, 'Menu', 148, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439792162),
(127, 10, 1, 0, 'Menu', 148, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439792195),
(128, 10, 1, 0, 'Menu', 149, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439792258),
(129, 10, 1, 0, 'Menu', 150, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439810849),
(130, 10, 1, 0, 'Menu', 151, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439811530),
(131, 1, 4, 0, 'member', 4, '还可以在2015-08-19 13:42登录了后台', 1, 1439962950),
(132, 1, 4, 0, 'member', 4, '还可以在2015-08-19 13:45登录了后台', 1, 1439963112),
(133, 1, 1, 0, 'member', 1, 'Admin在2015-08-19 17:51登录了后台', 1, 1439977876),
(134, 1, 1, 0, 'member', 1, 'Admin在2015-08-19 17:57登录了后台', 1, 1439978241),
(135, 1, 4, 0, 'member', 4, '还可以在2015-08-19 18:37登录了后台', 1, 1439980622),
(136, 1, 5, 0, 'member', 5, '阿晖在2015-08-20 14:04登录了后台', 1, 1440050649),
(137, 1, 1, 0, 'member', 1, 'Admin在2015-08-20 18:06登录了后台', 1, 1440065183),
(138, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440065214),
(139, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440122140),
(140, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440134917),
(141, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440134958),
(142, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440134997),
(143, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135024),
(144, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135036),
(145, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135074),
(146, 10, 1, 0, 'Menu', 153, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440135318),
(147, 10, 1, 0, 'Menu', 76, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135881),
(148, 1, 1, 0, 'member', 1, 'Admin在2015-08-21 13:58登录了后台', 1, 1440136715),
(149, 1, 4, 0, 'member', 4, '还可以在2015-08-21 14:02登录了后台', 1, 1440136969),
(150, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:28登录了后台', 1, 1440412104),
(151, 1, 1, 0, 'member', 1, 'Admin在2015-08-24 18:43登录了后台', 1, 1440413035),
(152, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:47登录了后台', 1, 1440413229),
(153, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:47登录了后台', 1, 1440413248),
(154, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440413626),
(155, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440413652),
(156, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440413673),
(157, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440414219),
(158, 10, 1, 0, 'Menu', 155, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440414270),
(159, 10, 1, 0, 'Menu', 156, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440415335),
(160, 10, 1, 0, 'Menu', 157, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440466931),
(161, 10, 1, 0, 'Menu', 157, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440466996),
(162, 10, 1, 0, 'Menu', 158, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440468850),
(163, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440469161),
(164, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440469180),
(165, 1, 4, 0, 'member', 4, '还可以在2015-08-25 11:23登录了后台', 1, 1440473015),
(166, 1, 1, 0, 'member', 1, 'Admin在2015-08-25 11:25登录了后台', 1, 1440473137),
(167, 1, 4, 0, 'member', 4, '还可以在2015-08-25 13:01登录了后台', 1, 1440478881),
(168, 1, 1, 0, 'member', 1, 'Admin在2015-08-25 13:03登录了后台', 1, 1440479035),
(169, 10, 1, 0, 'Menu', 159, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440482453),
(170, 10, 1, 0, 'Menu', 160, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440484132),
(171, 6, 1, 0, 'config', 64, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1440486025),
(172, 10, 1, 0, 'Menu', 161, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440487219),
(173, 10, 1, 0, 'Menu', 162, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440487240),
(174, 6, 1, 0, 'config', 64, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1440488806),
(175, 1, 4, 0, 'member', 4, '还可以在2015-08-25 16:28登录了后台', 1, 1440491300),
(176, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1441077126),
(177, 1, 1, -1062680666, 'member', 1, 'Admin在2015-09-05 13:22登录了后台', 1, 1441430575),
(178, 6, 1, -1062680666, 'config', 5, '操作url：/lvyou/index.php?s=/Admin/Config/edit.html', 1, 1441450783),
(179, 6, 1, -1062680666, 'config', 5, '操作url：/lvyou/index.php?s=/Admin/Config/edit.html', 1, 1441451931),
(180, 1, 1, 2130706433, 'member', 1, 'Admin在2015-09-29 20:51登录了后台', 1, 1443531103),
(181, 10, 1, 0, 'Menu', 131, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218288),
(182, 10, 1, 0, 'Menu', 131, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218300),
(183, 10, 1, 0, 'Menu', 132, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218348),
(184, 10, 1, 0, 'Menu', 134, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218371),
(185, 10, 1, 0, 'Menu', 149, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218388),
(186, 10, 1, 0, 'Menu', 148, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218396),
(187, 10, 1, 0, 'Menu', 163, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447218518),
(188, 10, 1, 0, 'Menu', 164, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447218577),
(189, 10, 1, 0, 'Menu', 148, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218614),
(190, 10, 1, 0, 'Menu', 149, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447218624),
(191, 10, 1, 0, 'Menu', 165, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447218699),
(192, 10, 1, 0, 'Menu', 166, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447218734),
(193, 10, 1, 0, 'Menu', 167, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447308717),
(194, 10, 1, 0, 'Menu', 168, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447308761),
(195, 10, 1, 0, 'Menu', 134, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447322380),
(196, 10, 1, 0, 'Menu', 169, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447322443),
(197, 10, 1, 0, 'Menu', 169, '操作url：/lvyou/index.php?s=/Admin/Menu/edit.html', 1, 1447656694),
(198, 10, 1, 0, 'Menu', 170, '操作url：/lvyou/index.php?s=/Admin/Menu/add.html', 1, 1447657748);

-- --------------------------------------------------------

--
-- 表的结构 `ly_addons`
--

CREATE TABLE IF NOT EXISTS `ly_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ly_addons`
--

INSERT INTO `ly_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_article`
--

CREATE TABLE IF NOT EXISTS `ly_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cate_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `status` tinyint(1) NOT NULL DEFAULT '-1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `sort` mediumint(5) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_attachment`
--

CREATE TABLE IF NOT EXISTS `ly_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_attribute`
--

CREATE TABLE IF NOT EXISTS `ly_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `ly_attribute`
--

INSERT INTO `ly_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ly_auth_extend`
--

CREATE TABLE IF NOT EXISTS `ly_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `ly_auth_extend`
--

INSERT INTO `ly_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_auth_group`
--

CREATE TABLE IF NOT EXISTS `ly_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ly_auth_group`
--

INSERT INTO `ly_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `ly_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `ly_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ly_auth_rule`
--

CREATE TABLE IF NOT EXISTS `ly_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- 转存表中的数据 `ly_auth_rule`
--

INSERT INTO `ly_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', -1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', -1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', -1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', -1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', -1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/Nav/add', '新增', 1, ''),
(218, 'admin', 1, 'Admin/Nav/edit', '编辑', 1, ''),
(219, 'admin', 1, 'Admin/Navl/del', '删除', 1, ''),
(220, 'admin', 1, 'Admin/Nav/sort', '排序', 1, ''),
(221, 'admin', 1, 'Admin/Goods/index', '商品列表', 1, ''),
(222, 'admin', 1, 'Admin/Collect/index', '商品采集', 1, ''),
(223, 'admin', 1, 'Admin/CategoryGoods/add', '添加分类', 1, ''),
(224, 'admin', 1, 'Admin/Collect/collectList', '采集到的商品', 1, ''),
(225, 'admin', 1, 'Admin/Banner/add', '新增', 1, ''),
(226, 'admin', 1, 'Admin/Banner/del', '删除', 1, ''),
(227, 'admin', 1, 'Admin/FriendLink/add', '添加', 1, ''),
(228, 'admin', 2, 'Admin/Goods/index', '商品', 1, ''),
(229, 'admin', 1, 'Admin/Goods/edit', '添加商品', 1, ''),
(230, 'admin', 1, 'Admin/Banner/index', '幻灯片', 1, ''),
(231, 'admin', 1, 'Admin/Nav/index', '导航管理', 1, ''),
(232, 'admin', 1, 'Admin/FriendLink/index', '友情链接', 1, ''),
(233, 'admin', 1, 'Admin/CategoryGoods/index', '分类列表', 1, ''),
(234, 'admin', 1, 'Admin/Page/index', '说明页面', 1, ''),
(235, 'admin', 1, 'Admin/Topic/index', '专题列表', 1, ''),
(236, 'admin', 1, 'Admin/Topic/add', '增加专题', 1, ''),
(237, 'admin', 1, 'Admin/Goods/extra', '附加信息', 1, ''),
(238, 'admin', 1, 'Admin/Goods/extraedit', '新增附加信息', 1, ''),
(239, 'admin', 1, 'Admin/Page/add', '添加', 1, ''),
(240, 'admin', 1, 'Admin/Orders/index', '全部订单', 1, ''),
(241, 'admin', 1, 'Admin/Orders/edit', '查看订单', 1, ''),
(242, 'admin', 1, 'Admin/Orders/orderStatus', '订单状态', 1, ''),
(243, 'admin', 1, 'Admin/Orders/addstatus', '增加订单状态', 1, ''),
(244, 'admin', 2, 'Admin/Orders/index', '订单', 1, ''),
(245, 'admin', 1, 'Admin/Tag/add', '添加标签', 1, ''),
(246, 'admin', 1, 'Admin/Tag/index', '标签列表', 1, ''),
(247, 'admin', 2, 'Admin/Page/index', '工具', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ly_banner`
--

CREATE TABLE IF NOT EXISTS `ly_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(512) NOT NULL,
  `link` varchar(512) DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `click` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  `content` text,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ly_banner`
--

INSERT INTO `ly_banner` (`id`, `image`, `link`, `title`, `type`, `click`, `sort`, `content`, `status`) VALUES
(1, '/ke361/Uploads/site_logo/55cafb3fe40e4.jpg', 'www.baidu.com', '这是测试', 1, 0, 0, '文灶 单间出租,1200元一个月,可以煮饭,有空调，有热水器:1000|文灶 60m²绝版好房便宜出租:2000', 1),
(2, '/ke361/Uploads/site_logo/55cafb3943525.jpg', 'google.com', 'Euro', 1, 0, 0, '', 1),
(3, '/ke361/Uploads/site_logo/55cafb2d12d10.jpg', '', 'hhhh', 1, 0, 0, 'werwer:1000|weasdfw:2000|gahasd:4000', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_category`
--

CREATE TABLE IF NOT EXISTS `ly_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `ly_category`
--

INSERT INTO `ly_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'blog', '博客', 0, 2, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 1, 0),
(2, 'default_blog', '默认分类', 1, 2, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1386839751, 1, 31),
(39, 'ugg', 'UGG', 1, 2, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 1, '', '', 1439170241, 1439170241, 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `ly_category_goods`
--

CREATE TABLE IF NOT EXISTS `ly_category_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '宝贝分类id',
  `category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '宝贝分类名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `catepic_url` varchar(250) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `ad_url` varchar(250) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `p_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `goods_num` int(3) NOT NULL DEFAULT '0' COMMENT '包含宝贝数量',
  `home_num` int(11) NOT NULL,
  `is_home` tinyint(3) NOT NULL,
  `sku` varchar(10) NOT NULL DEFAULT 'SKU001',
  `is_home_banner` tinyint(3) NOT NULL DEFAULT '0',
  `is_home_banner_type` tinyint(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类状态，与宝贝状态对应：0=关闭，1开启',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '宝贝排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `ly_category_goods`
--

INSERT INTO `ly_category_goods` (`id`, `category_name`, `type`, `catepic_url`, `summary`, `ad_url`, `color`, `p_id`, `goods_num`, `home_num`, `is_home`, `sku`, `is_home_banner`, `is_home_banner_type`, `status`, `sort`) VALUES
(1, '国内', 1, '', '', '', 'green', 0, 0, 8, 1, 'GN', 1, 2, 1, 0),
(2, '境外', 1, '', '', '', 'green', 0, 0, 8, 1, 'JW', 1, 0, 1, 0),
(9, '酒店', 1, '', '', '', 'green', 4, 0, 0, 1, 'SKU001', 0, 0, 1, 0),
(11, '北京', 1, '', '', '', '', 10, 0, 0, 1, 'SKU001', 0, 0, 1, 0),
(12, '福建', 1, '', '', '', '', 10, 0, 0, 1, 'SKU001', 0, 0, 1, 0),
(13, '厦门', 1, '/ke361/Uploads/site_logo/55cafb3fe40e4.jpg', '', '', '', 12, 0, 0, 0, 'SKU001', 0, 0, 1, 0),
(14, '风景区', 1, '', '', '', 'green', 4, 0, 0, 0, '', 0, 0, 1, 0),
(15, '厦门', 1, '/ke361/Uploads/site_logo/55cafb3fe40e4.jpg', '厦门市（英文：Amoy），别称鹭岛，简称鹭，位于福建省东南端，南接漳州，北邻泉州，东南与大小金门和大担岛隔海相望。是闽南地区的主要城市之一，与漳州、泉州并称“厦漳泉”，闽南金三角经济区。', '', 'green', 1, 0, 0, 0, '', 0, 0, 1, 0),
(16, '上海', 1, '', '', '', 'green', 1, 0, 0, 0, '', 0, 0, 1, 0),
(17, '北京', 1, '', '', '', 'green', 1, 0, 0, 1, '', 0, 0, 1, 0),
(18, '周边资讯', 1, '', '', '', 'green', 2, 0, 0, 0, '', 0, 0, 1, 0),
(19, '国内资讯', 1, '', '', '', 'green', 2, 0, 0, 1, '', 0, 0, 1, 0),
(20, '境外资讯', 1, '', '', '', 'green', 2, 0, 0, 1, '', 0, 0, 1, 0),
(21, '周边攻略', 1, '', '', '', 'green', 3, 0, 0, 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_collect_goods`
--

CREATE TABLE IF NOT EXISTS `ly_collect_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num_iid` varchar(20) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '宝贝名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` varchar(255) NOT NULL COMMENT '商品类型',
  `discount_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '折扣价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `pic_url` varchar(255) NOT NULL COMMENT '图片地址',
  `item_url` varchar(255) NOT NULL DEFAULT '' COMMENT '宝贝地址',
  `click_url` text COMMENT '推广地址',
  PRIMARY KEY (`id`),
  KEY `num_iid` (`num_iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_config`
--

CREATE TABLE IF NOT EXISTS `ly_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `ly_config`
--

INSERT INTO `ly_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '这是网站标题', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '这是网站描述', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '网站关键词,网站', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '闽ICP备11025956号', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1439261218, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:显示\r\n6:幻灯片', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '300', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(45, 'TONGJI', 2, '统计代码', 1, '', '网站统计代码', 1437700726, 1437700726, 1, '', 0),
(47, 'URL_MODEL', 4, 'URL模式', 5, '0:普通模式\r\n1:PATHINFO模式\r\n2:REWRITE模式\r\n3:兼容模式', '', 1437701819, 1437701819, 1, '3', 0),
(48, 'HOME_DEFAULT_THEME', 4, '前台主题', 5, 'black:black', '', 1437702225, 1438935079, 1, 'black', 1),
(56, 'BANNER_PREVIOUS', 4, '显示上一张按钮', 6, '0:关闭,1:显示', '是否在幻灯片上显示上一张按钮', 1439276804, 1439376201, 1, '1', 2),
(55, 'BANNER_OVERPAUSE', 4, '鼠标经过停止', 6, '0:关闭,1:开启', '鼠标经过是否停止', 1439261906, 1439376250, 1, '1', 1),
(5, 'WEB_SITE_LOGO', 1, '网站logo', 1, '', '网站标题前台显示LOGO', 1439171677, 1441451931, 1, '/lvyou/Uploads/site_logo/55cabbd7249a5.gif', 0),
(52, 'WEB_SITE_ICO', 1, '网站图标', 1, '', '显示在浏览器上方的图标', 1439185020, 1439349657, 1, '/ke361/Uploads/site_logo/55cabb91db451.ico', 0),
(53, 'WEB_SITE_NAME', 1, '网站名称', 1, '', '网站名称', 1439186697, 1439186697, 1, '厦门旅行社', 0),
(54, 'WEB_SITE_TEL', 1, '联系电话', 1, '', '公司或者网站联系电话', 1439188783, 1439188783, 1, '0592-8888888', 0),
(57, 'BANNER_NEXT', 4, '显示下一张按钮', 6, '0:关闭,1:显示', '是否在幻灯片显示下一张按钮', 1439276861, 1439376167, 1, '1', 2),
(58, 'BANNER_BARTIMER', 4, '显示底部时间进度条', 6, '0:关闭,1:显示', '是否在幻灯片显示底部时间进度条', 1439276970, 1439376206, 1, '1', 2),
(59, 'BANNER_CIRCLETIMER', 4, '显示圆形时间进度条', 6, '0:关闭,1:显示', '是否在幻灯片显示圆形时间进度条', 1439277045, 1439376190, 1, '1', 2),
(60, 'BANNER_THUMBLIST', 4, '显示底部略缩图', 6, '0:关闭,1:显示', '是否在幻灯片显示底部显示略缩图', 1439277176, 1439376266, 1, '1', 2),
(61, 'BANNER_OPEN', 4, '首页显示幻灯片', 6, '0:关闭,1:开启', '首页是否显示幻灯片', 1439277361, 1439376234, 1, '1', 0),
(62, 'BANNER_WIDTH', 0, '幻灯片的宽度', 6, '', '幻灯片的宽度', 1439371173, 1439376224, 1, '1150', 1),
(63, 'BANNER_HEIGHT', 0, '幻灯片的高度', 6, '', '幻灯片的高度', 1439371208, 1439376257, 1, '525', 1),
(64, 'WEB_SUPPORT_OPEN', 4, '客服漂浮框', 1, '0:关闭,1:开启', '是否在前台显示', 1440482112, 1440488806, 1, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_document`
--

CREATE TABLE IF NOT EXISTS `ly_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ly_document`
--

INSERT INTO `ly_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(2, 0, 'test', '这是测试', 39, '这个只是一个测试的', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1439515487, 1439515487, 3);

-- --------------------------------------------------------

--
-- 表的结构 `ly_document_article`
--

CREATE TABLE IF NOT EXISTS `ly_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `ly_document_article`
--

INSERT INTO `ly_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(2, 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_document_download`
--

CREATE TABLE IF NOT EXISTS `ly_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `ly_favor`
--

CREATE TABLE IF NOT EXISTS `ly_favor` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人id',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ly_favor`
--

INSERT INTO `ly_favor` (`fid`, `goods_id`, `uid`) VALUES
(1, 400, 3),
(2, 468, 4),
(3, 468, 1),
(4, 469, 1),
(5, 469, 5),
(6, 468, 5),
(7, 436, 4),
(8, 470, 4);

-- --------------------------------------------------------

--
-- 表的结构 `ly_file`
--

CREATE TABLE IF NOT EXISTS `ly_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_friendlink`
--

CREATE TABLE IF NOT EXISTS `ly_friendlink` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `blank` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(150) NOT NULL DEFAULT '',
  `pic_url` varchar(250) NOT NULL DEFAULT '',
  `sort` smallint(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ly_friendlink`
--

INSERT INTO `ly_friendlink` (`aid`, `title`, `type`, `blank`, `url`, `pic_url`, `sort`, `state`) VALUES
(1, '厦门小鱼', 1, 1, 'www.xmfish.com', 'http://www.xmfish.com/images/chanel/www/index2/xiaoyulogo-145-30.png', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_goods`
--

CREATE TABLE IF NOT EXISTS `ly_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '线路或者签证',
  `num_iid` varchar(20) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '宝贝名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `add_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `add_uname` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '0' COMMENT '出发城市，签证所属领区',
  `days` int(11) NOT NULL DEFAULT '0' COMMENT '行程天数，签证办理时间',
  `aheaddays` int(11) NOT NULL DEFAULT '0' COMMENT '提前预定，签证有效期',
  `traffic` varchar(255) NOT NULL DEFAULT '0' COMMENT '交通方式，签证受理范围',
  `invite` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否需要邀请函',
  `audition` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否需要面试',
  `maxdays` int(11) NOT NULL DEFAULT '0' COMMENT '最大逗留天数',
  `discount_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '折扣价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `child_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '儿童票',
  `pic_url` varchar(255) NOT NULL COMMENT '图片地址',
  `item_body` longtext NOT NULL COMMENT '宝贝内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1审核通过，0未审核',
  `seo_title` varchar(255) DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) DEFAULT '',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间（时间戳）',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '商品点击数',
  `favor` int(11) NOT NULL DEFAULT '0' COMMENT '商品赞数',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `tags` text,
  PRIMARY KEY (`goods_id`),
  KEY `goods_id` (`goods_id`),
  KEY `num_iid` (`num_iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

--
-- 转存表中的数据 `ly_goods`
--

INSERT INTO `ly_goods` (`goods_id`, `goods_type`, `num_iid`, `title`, `cate_id`, `tid`, `add_id`, `add_uname`, `city`, `days`, `aheaddays`, `traffic`, `invite`, `audition`, `maxdays`, `discount_price`, `price`, `child_price`, `pic_url`, `item_body`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `ctime`, `hits`, `favor`, `sort`, `tags`) VALUES
(473, 2, '0', '【曾厝垵】格兰会法餐厅米其林下午茶套餐', 15, 0, 1, 'Admin', '', 0, 0, '', 0, 0, 0, '0.00', '58.00', '0.00', '/Uploads/goods_img/2015-11-16/5649a62597941.jpg', '<p>\r\n	<span><span style="font-size:14px;line-height:21px;">&nbsp;&nbsp;&nbsp;&nbsp;\r\n	<p style="font-size:14px;font-family:''Hiragino Sans GB'', '' Microsoft YaHei'', ''WenQuanYi Micro Hei'', arial, sans-serif;color:#333333;background-color:#FFFFFF;">\r\n		<a class="poi-link" href="http://www.meituan.com/shop/1884752" target="_blank" id="yui_3_16_0_1_1447664992823_2932">格兰会法餐厅</a>\r\n	</p>\r\n	<p style="font-size:14px;font-family:''Hiragino Sans GB'', '' Microsoft YaHei'', ''WenQuanYi Micro Hei'', arial, sans-serif;color:#333333;background-color:#FFFFFF;">\r\n		<span style="color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;font-weight:normal;">地址：思明区环岛路音乐广场</span>\r\n	</p>\r\n	<div class="biz-info__content" id="yui_3_16_0_1_1447664992823_2831" style="margin:0px;padding:0px;color:#333333;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;background-color:#FFFFFF;">\r\n		<div class="biz-item" id="yui_3_16_0_1_1447664992823_2452" style="margin:0px;padding:0px;color:#666666;">\r\n		</div>\r\n		<div class="biz-item" id="yui_3_16_0_1_1447664992823_2833" style="margin:0px;padding:0px;color:#666666;">\r\n			<span class="title-label" style="color:#333333;">电话：</span>0592-8108880\r\n		</div>\r\n	</div>\r\n<br />\r\n</span></span>\r\n</p>\r\n<ul class="list" id="yui_3_16_0_1_1447664992823_2930" style="color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<li>\r\n		免费提供餐巾纸\r\n	</li>\r\n	<li>\r\n		米其林英式下午茶套餐：\r\n	</li>\r\n	<li>\r\n		4款甜点点心+1杯现磨咖啡或鲜榨果汁\r\n	</li>\r\n	<li>\r\n		迷你巧克力牛角包\r\n	</li>\r\n	<li>\r\n		Mini Chocolate Croissant\r\n	</li>\r\n	<li>\r\n		迷你格兰会法餐厅三明治\r\n	</li>\r\n	<li>\r\n		Mini Club Sandwich\r\n	</li>\r\n	<li>\r\n		覆盆子马芬蛋糕\r\n	</li>\r\n	<li>\r\n		Raspberry Muffin\r\n	</li>\r\n	<li>\r\n		提拉米苏\r\n	</li>\r\n	<li id="yui_3_16_0_1_1447664992823_2929">\r\n		Tiramisu\r\n	</li>\r\n</ul>\r\n<p>\r\n	<span><span style="font-size:14px;line-height:21px;"><img src="/lvyou/uploads/goods_img/image/20151116/20151116104950_33538.jpg" alt="" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span><span style="font-size:14px;line-height:21px;"><img src="/lvyou/uploads/goods_img/image/20151116/20151116105004_50992.jpg" alt="" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span><span style="font-size:14px;line-height:21px;"><span style="color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;">海明威说“巴黎是一场流动的飨宴” 在格蘭會法餐厅，一切法式的浪漫随想，都可以触摸与品尝—— 从环岛路的温沙，到地中海岸线。 香颂挠耳，无论您决意完整地领略高卢贵族的佳肴美宴，或是犹豫只在咖啡斟满时、杯酒晃动间体验法兰西风情的点滴，格蘭會逾两千平米的空间皆可与您的心境完美交融--与环岛路沙滩接壤的一楼阳光长廊、大厅；坐拥180度通透海景的的尼斯厅，到二、三楼的七间VIP包房、红酒雪茄房，在品游法兰西文化精髓时，留步格蘭會的每一扇窗前，您都能驾驭一帧独一无二的广阔海景和无垠的心境。 米其林三星厨师Philip每日严选进口高级食材， 将地中海阳光与海水的鲜美空运至每位食客的舌尖。 从法国到印度洋上的珍珠塞舌尔，Chef Philip料理过全球50佳餐厅JAAN par Andre和英国时代周刊评选的印度洋上的优越餐桌，这一次邀您在鹭岛海岸优雅入席，从触指前菜的第一刻开始，Chef Philip将在格蘭會带您跟随季风赴一场正统的法式饕餮之旅。</span><br />\r\n</span></span>\r\n</p>', 1, '【曾厝垵】格兰会法餐厅米其林下午茶套餐', '厦门，曾厝垵，格兰会，法国餐厅，米其林，下午茶', '从法国到印度洋上的珍珠塞舌尔，Chef Philip料理过全球50佳餐厅JAAN par Andre和英国时代周刊评选的印度洋上的优越餐桌，这一次邀您在鹭岛海岸优雅入席，从触指前菜的第一刻开始，Chef Philip将在格蘭會带您跟随季风赴一场正统的法式饕餮之旅。​', 0, 38, 0, 0, NULL),
(472, 1, '0', '海边民墅', 15, 0, 1, 'Admin', '', 0, 0, '', 0, 0, 0, '0.00', '98.00', '0.00', '/Uploads/goods_img/2015-11-12/5644627e8bbee.jpg', '<div class="poi-hotelinfo__content cf" id="yui_3_16_0_1_1447322053361_2241" style="margin:0px;padding:20px;color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;background-color:#FFFFFF;">\r\n	联系方式15980866861酒店信息层高4层酒店简介厦门海边民墅位于美丽的环岛路－黄厝塔头128号。步行200米就可以到达海边，音乐广场、书法广场、小白鹭艺术中心围绕周边，艺术氛围浓厚。这里到胡里山炮台、厦门大学、南普陀乘公交6分钟即可。到中山路步行街（厦门繁华的商业街）、轮渡码头（前往鼓浪屿）乘公交15分钟左右。客栈在靠海(厦门环岛路）的渔村里，步行3分钟即可拥抱大海，漫步沙滩，徜徉环岛路，流连厦门大学，朝与学子相伴，暮赏凤凰花开，无限风华尽揽！\r\n</div>\r\n<div class="poi-hotelinfo__content-list cf" style="margin:0px;padding:8px 20px;color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;background-color:#FFFFFF;">\r\n	酒店设施暂无\r\n</div>\r\n<div class="poi-hotelinfo__content-list cf" id="yui_3_16_0_1_1447322053361_2238" style="margin:0px;padding:8px 20px;color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;background-color:#FFFFFF;">\r\n	酒店服务停车场 <span class="poi-hotelinfo__item">wifi</span> \r\n</div>\r\n<div class="poi-hotelinfo__content-list cf" style="margin:0px;padding:8px 20px;color:#666666;font-family:''Hiragino Sans GB'', ''WenQuanYi Micro Hei'', tahoma, sans-serif;background-color:#FFFFFF;">\r\n	房间设施电吹风 <span class="poi-hotelinfo__item">上网方式</span> <span class="poi-hotelinfo__item">24小时热水</span> <span class="poi-hotelinfo__item">独立卫生间</span> <span class="poi-hotelinfo__item">淋浴</span> <span class="poi-hotelinfo__item">洗漱工具</span> \r\n</div>', 1, '厦门海边民墅', '厦门，海边，民墅', '厦门海边民墅位于美丽的环岛路－黄厝塔头128号。步行200米就可以到达海边，音乐广场、书法广场、小白鹭艺术中心围绕周边，艺术氛围浓厚。', 0, 4, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ly_goods_extra`
--

CREATE TABLE IF NOT EXISTS `ly_goods_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_goods_to_tags`
--

CREATE TABLE IF NOT EXISTS `ly_goods_to_tags` (
  `goods_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ly_goods_type`
--

CREATE TABLE IF NOT EXISTS `ly_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ly_goods_type`
--

INSERT INTO `ly_goods_type` (`id`, `name`, `sort`, `status`) VALUES
(1, '酒店', 0, 1),
(2, '美食', 0, 1),
(3, '美景', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_hooks`
--

CREATE TABLE IF NOT EXISTS `ly_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ly_hooks`
--

INSERT INTO `ly_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `ly_link`
--

CREATE TABLE IF NOT EXISTS `ly_link` (
  `lid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `href` varchar(255) NOT NULL DEFAULT '' COMMENT '连接',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `order` mediumint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '连接',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_member`
--

CREATE TABLE IF NOT EXISTS `ly_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ly_member`
--

INSERT INTO `ly_member` (`uid`, `nickname`, `avatar`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '', 0, '0000-00-00', '', 20, 3, 0, 1441430549, 2130706433, 1443531103, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_menu`
--

CREATE TABLE IF NOT EXISTS `ly_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=171 ;

--
-- 转存表中的数据 `ly_menu`
--

INSERT INTO `ly_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 93, 6, 'Nav/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Nav/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Nav/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Navl/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '工具', 0, 5, 'Page/index', 0, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Nav/sort', 1, '', '', 0),
(131, '攻略', 0, 1, 'Goods/index', 0, '', '商品', 0),
(132, '周边列表', 131, 0, 'Goods/index', 0, '', '周边', 0),
(137, '商品采集', 131, 0, 'Collect/index', 1, '', '采集', 0),
(134, '添加周边', 131, 1, 'Goods/edit', 0, '', '周边', 0),
(135, '分类列表', 131, 10, 'CategoryGoods/index', 0, '', '分类', 0),
(139, '添加分类', 131, 0, 'CategoryGoods/add', 0, '', '分类', 0),
(140, '采集到的商品', 131, 0, 'Collect/collectList', 1, '', '采集', 0),
(141, '幻灯片', 93, 5, 'Banner/index', 0, '设置首页幻灯片', '', 0),
(142, '新增', 141, 0, 'Banner/add', 0, '', '幻灯片', 0),
(143, '删除', 141, 0, 'Banner/del', 0, '', '幻灯片', 0),
(144, '友情链接', 93, 6, 'FriendLink/index', 0, '', '', 0),
(152, '说明页面', 93, 0, 'Page/index', 0, '', '', 0),
(145, '添加', 144, 0, 'FriendLink/add', 0, '', '友情链接', 0),
(146, '专题列表', 131, 0, 'Topic/index', 0, '', '专题', 0),
(147, '增加专题', 131, 0, 'Topic/add', 0, '', '专题', 0),
(148, '添加标签', 131, 2, 'Tag/add', 0, '', '标签', 0),
(149, '标签列表', 131, 2, 'Tag/index', 0, '', '标签', 0),
(150, '附加信息', 132, 0, 'Goods/extra', 1, '', '', 0),
(151, '新增附加信息', 132, 0, 'Goods/extraedit', 1, '', '', 0),
(153, '添加', 152, 0, 'Page/add', 0, '', '', 0),
(154, '订单', 0, 1, 'Orders/index', 0, '', '', 0),
(155, '全部订单', 154, 0, 'Orders/index', 0, '', '', 0),
(156, '查看订单', 154, 0, 'Orders/edit', 1, '', '', 0),
(157, '订单状态', 154, 0, 'Orders/orderStatus', 0, '', '', 0),
(158, '增加订单状态', 154, 0, 'Orders/addstatus', 0, '', '', 0),
(159, '搜索关键词', 93, 0, 'Search/index', 0, '', '', 0),
(160, '添加', 159, 0, 'Search/add', 0, '', '', 0),
(161, '在线客服', 93, 0, 'Support/index', 0, '', '', 0),
(162, '添加', 161, 0, 'Support/add', 0, '', '', 0),
(169, '周边分类', 131, 0, 'Goods/goodstype', 0, '', '周边', 0),
(163, '攻略列表', 131, 0, 'Goods/Raiders', 0, '', '攻略', 0),
(164, '添加攻略', 131, 0, 'Goods/Raidersedit', 0, '', '攻略', 0),
(165, '资讯列表', 131, 0, 'Goods/news', 0, '', '资讯', 0),
(166, '新增资讯', 131, 0, 'Goods/newsedit', 0, '', '资讯', 0),
(167, '美食列表', 131, 0, 'Goods/food', 0, '', '美食', 0),
(168, '添加美食', 131, 0, 'Goods/foodedit', 0, '', '美食', 0),
(170, '添加周边分类', 131, 0, 'Goods/goodstypeedit', 1, '', '周边', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_model`
--

CREATE TABLE IF NOT EXISTS `ly_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ly_model`
--

INSERT INTO `ly_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `ly_nav`
--

CREATE TABLE IF NOT EXISTS `ly_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `head` tinyint(3) NOT NULL DEFAULT '1',
  `side` tinyint(3) NOT NULL DEFAULT '1',
  `foot` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ly_nav`
--

INSERT INTO `ly_nav` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `head`, `side`, `foot`) VALUES
(1, 0, '首页', 'Index/index', 0, 1379475111, 1439466839, 1, 0, 1, 1, 1),
(5, 0, '国内游', 'Goods/cate?id=10', 0, 1439193403, 1439448032, 1, 0, 1, 1, 0),
(6, 0, '还是首页', 'Index/index', 0, 1439380227, 1439466848, 1, 0, 0, 0, 1),
(7, 0, '联系我们', 'Page/index?id=2', 0, 1440136072, 1440136072, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_news`
--

CREATE TABLE IF NOT EXISTS `ly_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL DEFAULT '0',
  `pic` varchar(256) DEFAULT NULL,
  `summary` varchar(300) DEFAULT NULL,
  `content` text,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `source` varchar(256) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ly_news`
--

INSERT INTO `ly_news` (`id`, `cate_id`, `title`, `pic`, `summary`, `content`, `status`, `source`, `time`) VALUES
(1, 2, '旅游签证', NULL, '旅游签证（tourist visa）是签证的一种，一般是为了方便游客而开发旅游资源而设立的一种快速办理签证方式，相应的，受限制也大，一般来说有效期和停留期都较短，且只能够用来从事旅游相关的活动。', '旅游签证（tourist visa）是签证的一种，一般是为了方便游客而开发旅游资源而设立的一种快速办理签证方式，相应的，受限制也大，一般来说有效期和停留期都较短，且只能够用来从事旅游相关的活动。\r\n随着世界全球化得发展和交通技术的不断进步，世界旅游市场的不断壮大，可以预见，旅游签证变得更加普遍和便利，成为签证的又一主要形式，很多国家为促进当地旅游业专门为来访旅游者颁发旅游签证。\r\n旅游签证是签证种类中的一种，有一些国家专门为旅游者颁发旅游签证，即：“tourist visa”。旅游签证的特点是停留期短，一般为30天，最长为90天，一般不能延期。持旅游签证者不能在当地打工或从事与旅游无关的活动。团体旅游签证是旅游签证中的一种，其特点是签证不做在护照上，旅游者须随团集体出、入国境。', 0, 'http://baike.baidu.com/link?url=BdiqKI3ec-otLgFOMR_8CdpdW_5vWu_8BgXInuGbSfaG3J06mue-XhEX8h0DYKC_HC-V9PIi_MtdhnQD-JX29_', '2015-11-23 06:54:29');

-- --------------------------------------------------------

--
-- 表的结构 `ly_orders`
--

CREATE TABLE IF NOT EXISTS `ly_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `child_price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(120) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(250) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_orders_status`
--

CREATE TABLE IF NOT EXISTS `ly_orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ly_orders_status`
--

INSERT INTO `ly_orders_status` (`id`, `name`, `sort`, `status`) VALUES
(1, '已报名', 0, 1),
(2, '已安排', 1, 1),
(3, '已出发', 2, 1),
(4, '已结束', 3, 1),
(6, '意外停止', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_page`
--

CREATE TABLE IF NOT EXISTS `ly_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `seo_title` varchar(120) NOT NULL,
  `seo_keyword` varchar(200) NOT NULL,
  `seo_description` text NOT NULL,
  `content` text NOT NULL,
  `ishome` tinyint(3) NOT NULL DEFAULT '0',
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ly_page`
--

INSERT INTO `ly_page` (`id`, `name`, `seo_title`, `seo_keyword`, `seo_description`, `content`, `ishome`, `sort`, `status`) VALUES
(1, '公司介绍', '', '', '', '<span>        中国国旅（厦门）国际旅行社有限公司公司由中国国际旅行社总社有限公司、厦门港务集团和平旅游客运有限公司、厦门旅游集团有限公司联合控股。其中，中国国际旅行社总社有限公司，是目前国内规模最大、实力最强的旅行社企业集团，荣列国家统计局公布的“中国企业500 强” ，是500 强中唯一的旅游企业，现为中国国旅股份有限公司旗下两大企业之一。如今，“ 中国国旅、 cits” 已成为品牌价值高、主营业务突出、在国内外享有盛誉的中国旅游企业，品牌价值 115.27 亿元，居旅游业第一。 经营业务包括：入境旅游、国内旅游业务、出境旅游业务；国际航线或者香港、澳门、台湾地区航线的航空客运销售代理业务；兼业代理人身意外伤害保险。 </span>', 1, 0, 1),
(2, '联系我们', '', '', '', '<span><span><span><strong><span><span style="background-color:#ffffff;color:#ff0000;font-size:10.5pt;">在线咨询</span>：<br />\r\n</span></strong></span><span><span><strong>云南旅游：</strong></span><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=66573424"><span><strong><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></strong></span></a><br />\r\n<span><strong>国内旅游：</strong></span></span><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=522703167"><span><strong><img border="0" src="/uploadfile/201209/20120923142256684.gif" /></strong></span></a><br />\r\n<span><span><strong><span>出境旅游：</span></strong><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=370149205"><strong><span><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></span></strong></a><br />\r\n<strong><span>厦门地接：</span></strong><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=66573424"><strong><span><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></span></strong></a><br />\r\n</span><span style="background-color:#ffffff;font-size:10.5pt;"><span style="background-color:#ffffff;font-size:10.5pt;"><br />\r\n<span><strong>旅游热线</strong></span></span></span></span></span><span style="background-color:#ffffff;"><span style="background-color:#ffffff;color:#ff0000;font-size:10.5pt;">：<br />\r\n</span></span><span style="background-color:#ffffff;"><span style="background-color:#ffffff;font-size:10.5pt;">电话：0592-8265454<br />\r\n</span></span><span style="background-color:#ffffff;font-size:10.5pt;">手机：15160003414<br />\r\n联系人：吴帅<br />\r\n<span><strong><span><span>旅游支持：</span><span><span>中</span>国</span></span><span>国旅（厦门）国际旅行社</span></strong></span></span></span>', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_picture`
--

CREATE TABLE IF NOT EXISTS `ly_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `ly_picture`
--

INSERT INTO `ly_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(38, '/Uploads/avatar_img/55de6e22cf44a.jpg', '', '84efa71c62e8ab0d0a6350e60ff10710', 'bd90b9f2b12ce54943ad431b5fa6a65f8029d74c', 1, 1440640546),
(39, '/Uploads/avatar_img/55de6f1a46d4b.gif', '', 'c9e9def2c13e81a3fa71f8ddd2e4489e', '2616c2020c484a701abc44c347be3f467838ed30', 1, 1440640794),
(12, '/Uploads/goods_img/2015-08-10/55c80c005bb23.gif', '', '4dc27f9ced8488fb7d97298061d04642', 'b403a29541093538c4272213a97830fb0b1c6f84', 1, 1439173632),
(24, '/Uploads/site_logo/55cabbd7249a5.gif', '', 'd7dd02af10f817ce2e7e501eb03e8ccb', '9f6a855025735f9f584f754c7eafa1ff54e55af1', 1, 1439349719),
(47, '/Uploads/site_logo/55eacb1c4b818.gif', '', '20aba5a19cb8bb12ec8defcc32b88e20', '2d8f8662d4880e078c0ebd277a22b2960ddbba61', 1, 1441450780),
(15, '/Uploads/goods_img/2015-08-10/55c88294b81ff.jpg', '', '6557d32eb72493242182fbd0ed4f0c03', '3a1b6903ce6e501122d67db72298f5c3d78020d8', 1, 1439203988),
(37, '/Uploads/avatar_img/55de6e15e7808.jpg', '', '56a0c235a3d0e6d40f6ee0d86e8605a4', '92a246ded03fb2198cb4cfae70897e5fe69a3c2e', 1, 1440640533),
(18, '/Uploads/site_logo/2015-08-11/55c9a574d6384.jpg', '', '720cc2c4b3366e872b0184e1193e8797', '74f2de48fdb5740bc83b199b67b1f860d5325a46', 1, 1439278452),
(26, '/Uploads/site_logo/55cac5a3b1de8.jpg', '', 'e7633e674e94be66f7d190e73b503532', 'd5659a42272f445f9f8165949110e5da811849bb', 1, 1439352227),
(25, '/Uploads/site_logo/55cabd36b3bfa.jpg', '', 'ab970166c1a8a53a073db3607159d18b', 'b3f12dd1bd2c84cc9c5c47570e83d81df39aa679', 1, 1439350070),
(23, '/Uploads/site_logo/55cabb91db451.ico', '', 'fb44dc89394b9c62bf847ee420eaf4b3', 'af32d2a4d2213d734cca7ddf0ad309ba0fd2a3b8', 1, 1439349649),
(35, '/Uploads/avatar_img/55dc5c6b92926.jpg', '', '4c4d0e8eab071c880491f37151b6160b', '7e2b7a8f692d76d3685f8bb9e1ca612182181f67', 1, 1440504939),
(27, '/Uploads/site_logo/55cac5b0bf791.jpg', '', 'd5bb4de5dd7fcbb7d0d7c251cf318255', 'c50b9f6d713512e10b01d77a2b5b546abe4e4076', 1, 1439352240),
(28, '/Uploads/site_logo/55caf8b1adea6.jpg', '', '9e70874df5f1af96fbb2a243c0ad32cc', '64e4d0d5132a0c3dd60c9eae1230c9bb288b1169', 1, 1439365297),
(29, '/Uploads/site_logo/55cafb2d12d10.jpg', '', '678e9f8f48486c7bf3a5d000222c25a3', 'b8b701f9e8159ea102982f3d17db4ab00319abc2', 1, 1439365933),
(30, '/Uploads/site_logo/55cafb3943525.jpg', '', 'df9f41cccd8d52b6e353a077b7ddec31', '98c7a77d848c91fe6fc048dda54c081049414399', 1, 1439365945),
(31, '/Uploads/site_logo/55cafb3fe40e4.jpg', '', '4a3278495ba7ccb28477a0d4a10966b0', 'c8d2543521f7c2f8ae875321cd31059eed9904f1', 1, 1439365951),
(32, '/Uploads/goods_img/2015-08-17/55d166c009c9c.jpg', '', '18cb575c1ff1d6e72ac3c10ca0fb9848', 'd5389fe23307a6f2d08a9e7ac26497ce53c6b969', 1, 1439786687),
(33, '/Uploads/goods_img/2015-08-17/55d16e2b11a74.jpg', '', 'e903414bf1628ab27055d7698c672d5f', '5a9c29c15e5146da102ad891c85ea974e7e12eed', 1, 1439788586),
(34, '/Uploads/avatar_img/55dc569b49f4f.jpg', '', 'b0bdcdc1b0a531ebfab20289f37d8e47', 'f03264688408c466bdf84b8343d1a8871e090ae7', 1, 1440503451),
(36, '/Uploads/avatar_img/55de6e0f4d1cd.jpg', '', '750399a425c669a0dd9d98d15ce669ff', '2697d4d6f23b0e2db8cb3faaee9ada1b43795471', 1, 1440640527),
(40, '/Uploads/avatar_img/55de6fb5395e9.jpg', '', '2694bd81721b66c68f69dce9ae5fcddd', '8d43fe72ceaf70fff81c234b71e762f3501b95a7', 1, 1440640949),
(41, '/Uploads/goods_img/2015-08-29/55e10d7c90823.jpg', '', 'ef688f1326b09d84c056adbdbc7c0251', '846ec0af73a6f658f522e945a23bab4c45300ee2', 1, 1440812412),
(42, '/Uploads/goods_img/2015-08-29/55e1176122c2e.png', '', '8fc0e41a4230af583065b7c0cd95e060', '2e5a6e9a8800b06966537ba30523ba8909d546e8', 1, 1440814945),
(43, '/Uploads/category/55e512b787383.png', '', '74c966fb8f0ae54a27d24bfaa05a2809', '9d9dc46a874a8db5fe5684b7b96671af3fb32be8', 1, 1441075895),
(44, '/Uploads/category/55e512bb63578.jpg', '', '4db8c07b13aa5bfd898ad25c2eb9714e', '0366462a9b0e5d592be8ab1ca31d09441bbc31d6', 1, 1441075899),
(45, '/Uploads/site_logo/55e51782b39ea.png', '', 'a9c4351f9c90cd0c0bfd5f85da93d934', '69fe7c8a9baabc20ca61afda2824f9cefc80f63e', 1, 1441077122),
(46, '/Uploads/category/55e51bd0c7a5d.png', '', '0a7cedf7dd1345bb9959ac7b767247ce', 'ec87566a6a95bf6ce6264e2ecd822bb7504df140', 1, 1441078224),
(48, '/Uploads/goods_img/2015-11-12/5644627e8bbee.jpg', '', '63c9905b2c9a552cf2fd79abe7d33ebf', 'b0bcc3188bb29d780bb0be65a5fd17c4d514f766', 1, 1447322238),
(49, '/Uploads/goods_img/2015-11-16/5649a62597941.jpg', '', '2ad51a00dbe75aea3654e90b6212c7ba', 'e14ea85e04e21d3fb673dd08693b548c6744c471', 1, 1447667236);

-- --------------------------------------------------------

--
-- 表的结构 `ly_raiders`
--

CREATE TABLE IF NOT EXISTS `ly_raiders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '宝贝名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `add_uname` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '0' COMMENT '出发城市，签证所属领区',
  `days` int(11) NOT NULL DEFAULT '0' COMMENT '行程天数，签证办理时间',
  `traffic` varchar(255) NOT NULL DEFAULT '0' COMMENT '交通方式，签证受理范围',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `pic_url` varchar(255) NOT NULL COMMENT '图片地址',
  `item_body` longtext NOT NULL COMMENT '宝贝内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1审核通过，0未审核',
  `seo_title` varchar(255) DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) DEFAULT '',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间（时间戳）',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '商品点击数',
  `favor` int(11) NOT NULL DEFAULT '0' COMMENT '商品赞数',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `tags` text,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ly_raiders`
--

INSERT INTO `ly_raiders` (`Id`, `name`, `title`, `cate_id`, `add_id`, `add_uname`, `city`, `days`, `traffic`, `price`, `pic_url`, `item_body`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `ctime`, `hits`, `favor`, `sort`, `tags`) VALUES
(1, '带上含含去拉萨', '带上含含去拉萨', 0, 0, 'Admin', '拉萨', 0, '15', '14017.00', '', '坐上那火车去拉萨～～～～\r\n第一天在火车上，第二天....还在火车上\r\nEB73240276\r\n记得手机充好电，充电宝充好电，带够吃的喝的 .。。。。。', 1, '', '', '', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ly_scheme_keyword`
--

CREATE TABLE IF NOT EXISTS `ly_scheme_keyword` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `oncenum` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `sourcefrom` varchar(50) NOT NULL,
  `downimg` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) NOT NULL,
  `totalnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_search_keyword`
--

CREATE TABLE IF NOT EXISTS `ly_search_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索关键词',
  `times` int(11) NOT NULL COMMENT '次数',
  `isshow` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ly_search_keyword`
--

INSERT INTO `ly_search_keyword` (`id`, `name`, `times`, `isshow`) VALUES
(3, '5', 4, 1),
(2, '厦门', 8, 1),
(4, '丽江', 0, 1),
(5, '北京', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_support`
--

CREATE TABLE IF NOT EXISTS `ly_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `number` int(20) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ly_support`
--

INSERT INTO `ly_support` (`id`, `name`, `number`, `status`, `sort`) VALUES
(1, '云南专线', 66573424, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_tag`
--

CREATE TABLE IF NOT EXISTS `ly_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `pic_url` varchar(250) DEFAULT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ly_tag`
--

INSERT INTO `ly_tag` (`id`, `name`, `pic_url`, `sort`, `status`) VALUES
(1, '绝不进店', '', 0, 1),
(2, '绝无自费', '/Uploads/category/55e51bd0c7a5d.png', 0, 1),
(3, '含保险', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_topic`
--

CREATE TABLE IF NOT EXISTS `ly_topic` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ly_topic`
--

INSERT INTO `ly_topic` (`tid`, `name`, `pic_url`, `state`, `sort`) VALUES
(1, '跟团游', '', 1, 0),
(2, '主题游', '', 1, 0),
(3, '自驾游', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ly_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `ly_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `ly_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `ly_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ly_ucenter_member`
--

INSERT INTO `ly_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '5174bb2558df5314515f46ef639d25c3', '415770123@qq.com', '', 1441430549, 3232286630, 1443531103, 2130706433, 1441430549, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ly_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `ly_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_url`
--

CREATE TABLE IF NOT EXISTS `ly_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ly_userdata`
--

CREATE TABLE IF NOT EXISTS `ly_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
