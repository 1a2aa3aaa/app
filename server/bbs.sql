-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-11-29 09:13:11
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbs`
--

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE `collect` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collect`
--

INSERT INTO `collect` (`pid`, `uid`) VALUES
(2, 1),
(3, 1),
(5, 8),
(10, 8),
(4, 8);

-- --------------------------------------------------------

--
-- 表的结构 `ishf`
--

CREATE TABLE `ishf` (
  `puid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `iss` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ishf`
--

INSERT INTO `ishf` (`puid`, `pid`, `muid`, `mid`, `iss`) VALUES
(7, 4, 1, 0, 1),
(2, 4, 8, 17, 1),
(2, 4, 8, 22, 1),
(2, 4, 8, 23, 1),
(2, 4, 8, 24, 1),
(2, 4, 8, 25, 1),
(2, 4, 8, 26, 1),
(2, 4, 8, 34, 1),
(2, 4, 8, 35, 1),
(2, 4, 8, 36, 1),
(2, 4, 8, 37, 1),
(2, 4, 8, 38, 1),
(2, 4, 8, 39, 1),
(2, 4, 8, 40, 1),
(2, 4, 8, 42, 1);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `mcontent` varchar(100) NOT NULL,
  `mtime` char(10) NOT NULL,
  `mzan` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`mid`, `pid`, `uid`, `mcontent`, `mtime`, `mzan`) VALUES
(1, 1, 1, '法第四条规定翻跟斗风格和', '1965-02-21', 3),
(2, 1, 2, '的非官方施工方更好的风格和', '1997-02-21', -3),
(3, 1, 2, 'sfdfs', '2009-10-21', 0),
(4, 4, 8, '123', '2019-11-22', 1),
(5, 4, 8, '我带你', '2019-11-22', 0),
(6, 5, 8, '', '2019-11-25', 0),
(9, 4, 8, 'gun', '2019-11-26', 0),
(10, 5, 8, 'laad', '2019-11-27', 0),
(11, 45, 45, '4545', '2452', 0),
(12, 4, 8, '一边去', '2019-11-29', 0),
(13, 4, 8, 'kuaidian', '2019-11-29', 0),
(14, 4, 8, 'sadasd', '2019-11-29', 0),
(15, 4, 8, 'dsdfsdfds', '2019-11-29', 0),
(16, 4, 8, 'sdasda', '2019-11-29', 0),
(17, 4, 8, 'sdadasdasdfafd', '2019-11-29', 0),
(22, 4, 8, 'fdfs', '2019-11-29', 0),
(23, 4, 8, 'dfsdfsdf', '2019-11-29', 0),
(24, 4, 8, 'dfsfdsdf', '2019-11-29', 0),
(25, 4, 8, 'dsfsdfsdfsdf', '2019-11-29', 0),
(26, 4, 8, 'sdadsadgasjdfgsfgtiuywastfb iuauyt', '2019-11-29', 0),
(34, 4, 8, 'gdfsgfdsgfsgddfs', '2019-11-29', 0),
(35, 4, 8, 'fgdsgfdg', '2019-11-29', 0),
(36, 4, 8, 'dfsfsdfs', '2019-11-29', 0),
(37, 4, 8, 'sdasdad', '2019-11-29', 0),
(38, 4, 8, 'sdffsdfgrsdgdsf', '2019-11-29', 0),
(39, 4, 8, 'sdffsdfsdgdfs', '2019-11-29', 0),
(40, 4, 8, 'sdfgfgdghsdfhfgdhdfhdfgdfgdgdfj', '2019-11-29', 0),
(41, 14, 8, 'dassdadsafda', '2019-11-29', 1),
(42, 4, 8, 'vgdfgdf', '2019-11-29', 0);

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE `post` (
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ptitle` varchar(24) NOT NULL,
  `pcontent` varchar(3000) NOT NULL,
  `ptime` char(10) NOT NULL,
  `pzan` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`pid`, `sid`, `uid`, `ptitle`, `pcontent`, `ptime`, `pzan`) VALUES
(1, 1, 1, '发射点风格会很尴尬', '啊手动阀打发嘎嘎方法噶沙发大撒旦发个', '1997-11-22', -8),
(2, 2, 2, '地方官大使馆的风格', '的法国三国的鬼地方发电公司风格的', '2002-02-21', 3),
(3, 1, 1, '发射点风格会很尴尬', '啊手动阀打发嘎嘎方法噶沙发大撒旦发个', '1997-11-22', 4),
(4, 2, 2, '地方官大使馆的风格', '的法国三国的鬼地方发电公司风格的', '2002-02-21', 103),
(5, 1, 2, '豆腐干大锅饭', '地方官大使馆但是岁的法国嗲方式', '1998-02-22', 18),
(6, 1, 2, '豆腐干大锅饭', '地方官大使馆但是岁的法国嗲方式', '1998-02-22', 2),
(7, 2, 1, '豆腐干大锅饭', '儿童的发给对方g\'d', '2020-12-21', 3),
(9, 1, 2, 'fsdfs', 'fghdghshdfgh', '2019-11-20', 0),
(10, 1, 1, 'fgdgsdfg', 'dfgdfgdfg', '1902-12-20', 2),
(14, 2, 8, 'fsdfgdrfgfd', 'fgdgdfgfd', '2019-11-29', 0);

-- --------------------------------------------------------

--
-- 表的结构 `section`
--

CREATE TABLE `section` (
  `sid` int(11) NOT NULL,
  `sname` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `section`
--

INSERT INTO `section` (`sid`, `sname`) VALUES
(1, '前端大全'),
(2, '后端大全'),
(3, '框架大全'),
(4, '组件大全');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(12) DEFAULT NULL,
  `upwd` varchar(32) NOT NULL,
  `uemail` varchar(32) NOT NULL,
  `uhead` varchar(32) DEFAULT '1.jpg',
  `isAdmin` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upwd`, `uemail`, `uhead`, `isAdmin`) VALUES
(1, 'nan', 'a123456', '1540@qq.com', '1.jpg', '1'),
(2, 'tom', '123', '139@qq.com', '1.jpg', '0'),
(5, 'il', 'md5(ghfhfgh)', '1540@qq.com', '1.jpg', '0'),
(6, 'ildfg', '51ccbd1e2594c9ebee585043ae171546', '1540@qq.com', '1.jpg', '0'),
(7, 'jianan', '123456', '1540@qq.com', '1.jpg', '0'),
(8, 'jia1', 'e10adc3949ba59abbe56e057f20f883e', '112@qq.com', '1575014688949.jpg', '1'),
(9, '453123', '1312', '1540@qq.com', '1.jpg', '0'),
(10, '4453123', '1312', '1540@qq.com', '1.jpg', '0'),
(11, 'fsdf', 'dfsd', 'dfs@qq.com', '1.jpg', '0'),
(12, 'fsjkdf', 'dfsd', 'dfs@qq.com', '1.jpg', '0'),
(13, 'asdsu', 'ddfd', 'dfgg', '1.jpg', '0'),
(16, '154', '61aa251123372588f96122e431c771ea', '4546@qq.com', '1.jpg', '0'),
(17, 'dai1', 'e10adc3949ba59abbe56e057f20f883e', '156@qq.com', '1.jpg', '0'),
(18, 'nan1', 'e10adc3949ba59abbe56e057f20f883e', '1540@qq.com', '1.jpg', '0'),
(19, 'li1', 'e10adc3949ba59abbe56e057f20f883e', '13@qq.com', '1.jpg', '0'),
(20, 'lijiana', 'e10adc3949ba59abbe56e057f20f883e', '123@qq.com', '1.jpg', '0'),
(21, 'lijia', 'e10adc3949ba59abbe56e057f20f883e', '111@qq.com', '1.jpg', '0'),
(22, '1231', '717f3adf178f857f9ad97aaee5ebfa8f', '12@qq.com', '1.jpg', '0'),
(23, '4564', 'e44fea3bec53bcea3b7513ccef5857ac', '4124@qq.com', '1.jpg', '0'),
(24, '454', '35a322a37e6fb34b2aaea6f4ed30aa7f', '1231@qq.com', '1.jpg', '0'),
(25, '145', 'de2d3b18505f768bdf94162f550a2c38', '455@qq.com', '1574859301130.jpg', '0'),
(26, 'sdgahg', '912225405b7bb66a2ede35e283ba7465', '1254@qq.com', '1.jpg', '0');

-- --------------------------------------------------------

--
-- 表的结构 `zan`
--

CREATE TABLE `zan` (
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zan`
--

INSERT INTO `zan` (`pid`, `uid`, `mid`) VALUES
(1, 8, NULL),
(NULL, 1, 8),
(NULL, 8, 1),
(NULL, 8, 2),
(NULL, 8, 7),
(5, 8, NULL),
(10, 8, NULL),
(10, 8, NULL),
(4, 8, NULL),
(NULL, 8, 18),
(NULL, 8, 4),
(NULL, 8, 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `section`
--
ALTER TABLE `section`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
