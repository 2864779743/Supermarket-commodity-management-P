/*
Navicat SQL Server Data Transfer

Source Server         : KIDUO-PC
Source Server Version : 105000
Source Host           : KIDUO-PC:1433
Source Database       : db_chaoshi
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2017-06-07 10:19:53
*/


-- ----------------------------
-- Table structure for dtproperties
-- ----------------------------
DROP TABLE [dbo].[dtproperties]
GO
CREATE TABLE [dbo].[dtproperties] (
[id] int NOT NULL IDENTITY(1,1) ,
[objectid] int NULL ,
[property] varchar(64) NOT NULL ,
[value] varchar(255) NULL ,
[uvalue] nvarchar(255) NULL ,
[lvalue] image NULL ,
[version] int NOT NULL DEFAULT (0) 
)


GO

-- ----------------------------
-- Records of dtproperties
-- ----------------------------
SET IDENTITY_INSERT [dbo].[dtproperties] ON
GO
SET IDENTITY_INSERT [dbo].[dtproperties] OFF
GO

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE [dbo].[t_admin]
GO
CREATE TABLE [dbo].[t_admin] (
[userId] int NOT NULL IDENTITY(1,1) ,
[userName] varchar(50) NULL ,
[userPw] varchar(50) NULL 
)


GO

-- ----------------------------
-- Records of t_admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_admin] ON
GO
INSERT INTO [dbo].[t_admin] ([userId], [userName], [userPw]) VALUES (N'1', N'a', N'a')
GO
GO
SET IDENTITY_INSERT [dbo].[t_admin] OFF
GO

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
DROP TABLE [dbo].[t_catelog]
GO
CREATE TABLE [dbo].[t_catelog] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NULL ,
[jieshao] varchar(5000) NULL ,
[del] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_catelog]', RESEED, 7)
GO

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_catelog] ON
GO
INSERT INTO [dbo].[t_catelog] ([id], [name], [jieshao], [del]) VALUES (N'2', N'日用百货', N'日用百货', N'no')
GO
GO
INSERT INTO [dbo].[t_catelog] ([id], [name], [jieshao], [del]) VALUES (N'3', N'阳光美食', N'阳光美食', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_catelog] OFF
GO

-- ----------------------------
-- Table structure for t_chuku
-- ----------------------------
DROP TABLE [dbo].[t_chuku]
GO
CREATE TABLE [dbo].[t_chuku] (
[id] int NOT NULL IDENTITY(1,1) ,
[danjuhao] varchar(50) NULL ,
[shijian] varchar(50) NULL ,
[zongjiage] int NULL ,
[jingshouren] varchar(50) NULL ,
[beizhu] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_chuku]', RESEED, 2)
GO

-- ----------------------------
-- Records of t_chuku
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_chuku] ON
GO
INSERT INTO [dbo].[t_chuku] ([id], [danjuhao], [shijian], [zongjiage], [jingshouren], [beizhu], [del]) VALUES (N'2', N'C001', N'2012-07-24', N'500', N'刘三', N'无', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_chuku] OFF
GO

-- ----------------------------
-- Table structure for t_chukuMingxi
-- ----------------------------
DROP TABLE [dbo].[t_chukuMingxi]
GO
CREATE TABLE [dbo].[t_chukuMingxi] (
[id] int NOT NULL IDENTITY(1,1) ,
[chuku_id] int NULL ,
[goods_id] int NULL ,
[shuliang] int NULL ,
[beizhu] varchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_chukuMingxi]', RESEED, 2)
GO

-- ----------------------------
-- Records of t_chukuMingxi
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_chukuMingxi] ON
GO
INSERT INTO [dbo].[t_chukuMingxi] ([id], [chuku_id], [goods_id], [shuliang], [beizhu]) VALUES (N'1', N'2', N'5', N'10', N'无')
GO
GO
INSERT INTO [dbo].[t_chukuMingxi] ([id], [chuku_id], [goods_id], [shuliang], [beizhu]) VALUES (N'2', N'2', N'1', N'160', N'无')
GO
GO
SET IDENTITY_INSERT [dbo].[t_chukuMingxi] OFF
GO

-- ----------------------------
-- Table structure for t_gongyingshang
-- ----------------------------
DROP TABLE [dbo].[t_gongyingshang]
GO
CREATE TABLE [dbo].[t_gongyingshang] (
[id] int NOT NULL IDENTITY(1,1) ,
[mingcheng] varchar(50) NULL ,
[dizhi] varchar(50) NULL ,
[lianxiren] varchar(50) NULL ,
[dianhua] varchar(50) NULL ,
[youbian] varchar(50) NULL ,
[chuanzhen] varchar(50) NULL ,
[youxiang] varchar(50) NULL ,
[kahuhang] varchar(50) NULL ,
[zhanghao] varchar(50) NULL ,
[type] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_gongyingshang]', RESEED, 3)
GO

-- ----------------------------
-- Records of t_gongyingshang
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_gongyingshang] ON
GO
INSERT INTO [dbo].[t_gongyingshang] ([id], [mingcheng], [dizhi], [lianxiren], [dianhua], [youbian], [chuanzhen], [youxiang], [kahuhang], [zhanghao], [type], [del]) VALUES (N'3', N'北京大通物流', N'北京路22#', N'张总', N'13999999999', N'123456', N'010-45692133', N'zhangxong@yahoo.cn', N'', N'', N'gongyingshang', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_gongyingshang] OFF
GO

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE [dbo].[t_goods]
GO
CREATE TABLE [dbo].[t_goods] (
[id] int NOT NULL IDENTITY(1,1) ,
[catelog_id] int NULL ,
[name] varchar(50) NULL ,
[chandi] varchar(50) NULL ,
[danwei] varchar(50) NULL ,
[guige] varchar(50) NULL ,
[beizhu] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_goods]', RESEED, 7)
GO

-- ----------------------------
-- Records of t_goods
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_goods] ON
GO
INSERT INTO [dbo].[t_goods] ([id], [catelog_id], [name], [chandi], [danwei], [guige], [beizhu], [del]) VALUES (N'1', N'3', N'可口可乐瓶装', N'上海', N'瓶', N'--', N'--', N'no')
GO
GO
INSERT INTO [dbo].[t_goods] ([id], [catelog_id], [name], [chandi], [danwei], [guige], [beizhu], [del]) VALUES (N'5', N'2', N'高乐高豆奶粉', N'浙江', N'瓶', N'--', N'--', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_goods] OFF
GO

-- ----------------------------
-- Table structure for t_pancun
-- ----------------------------
DROP TABLE [dbo].[t_pancun]
GO
CREATE TABLE [dbo].[t_pancun] (
[id] varchar(50) NOT NULL ,
[shijian] varchar(50) NULL ,
[goods_id] int NULL ,
[shijishuliang] varchar(50) NULL ,
[xitongshuliang] varchar(50) NULL ,
[type1] varchar(50) NULL ,
[beizhu] varchar(50) NULL ,
[yuangong_id] int NULL ,
[del] varchar(50) NULL 
)


GO

-- ----------------------------
-- Records of t_pancun
-- ----------------------------
INSERT INTO [dbo].[t_pancun] ([id], [shijian], [goods_id], [shijishuliang], [xitongshuliang], [type1], [beizhu], [yuangong_id], [del]) VALUES (N'1343099098046', N'2012-07-24', N'5', N'150', N'160', N'盘盈', N'无', N'0', N'no')
GO
GO

-- ----------------------------
-- Table structure for t_ruku
-- ----------------------------
DROP TABLE [dbo].[t_ruku]
GO
CREATE TABLE [dbo].[t_ruku] (
[id] int NOT NULL IDENTITY(1,1) ,
[danjuhao] varchar(50) NULL ,
[shijian] varchar(50) NULL ,
[zongjiage] int NULL ,
[jingshouren] varchar(50) NULL ,
[beizhu] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_ruku]', RESEED, 5)
GO

-- ----------------------------
-- Records of t_ruku
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_ruku] ON
GO
INSERT INTO [dbo].[t_ruku] ([id], [danjuhao], [shijian], [zongjiage], [jingshouren], [beizhu], [del]) VALUES (N'5', N'R001', N'2012-07-24', N'10000', N'李三', N'无', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_ruku] OFF
GO

-- ----------------------------
-- Table structure for t_rukuMingxi
-- ----------------------------
DROP TABLE [dbo].[t_rukuMingxi]
GO
CREATE TABLE [dbo].[t_rukuMingxi] (
[id] int NOT NULL IDENTITY(1,1) ,
[ruku_id] int NULL ,
[goods_id] int NULL ,
[shuliang] int NULL ,
[beizhu] varchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_rukuMingxi]', RESEED, 9)
GO

-- ----------------------------
-- Records of t_rukuMingxi
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_rukuMingxi] ON
GO
INSERT INTO [dbo].[t_rukuMingxi] ([id], [ruku_id], [goods_id], [shuliang], [beizhu]) VALUES (N'8', N'5', N'5', N'200', N'无')
GO
GO
INSERT INTO [dbo].[t_rukuMingxi] ([id], [ruku_id], [goods_id], [shuliang], [beizhu]) VALUES (N'9', N'5', N'1', N'200', N'无')
GO
GO
SET IDENTITY_INSERT [dbo].[t_rukuMingxi] OFF
GO

-- ----------------------------
-- Table structure for t_xiaoshou
-- ----------------------------
DROP TABLE [dbo].[t_xiaoshou]
GO
CREATE TABLE [dbo].[t_xiaoshou] (
[id] varchar(50) NOT NULL ,
[goods_id] int NULL ,
[shijian] varchar(50) NULL ,
[zongjia] numeric(18,2) NULL ,
[zhifufangshi] varchar(50) NULL ,
[gukename] varchar(50) NOT NULL ,
[beizhu] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO

-- ----------------------------
-- Records of t_xiaoshou
-- ----------------------------
INSERT INTO [dbo].[t_xiaoshou] ([id], [goods_id], [shijian], [zongjia], [zhifufangshi], [gukename], [beizhu], [del]) VALUES (N'1343099223444', N'5', N'2012-07-24', N'2.50', N'现金', N'刘三', N'无', N'no')
GO
GO

-- ----------------------------
-- Table structure for t_yuangong
-- ----------------------------
DROP TABLE [dbo].[t_yuangong]
GO
CREATE TABLE [dbo].[t_yuangong] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NULL ,
[sex] varchar(50) NULL ,
[age] varchar(50) NULL ,
[tel] varchar(50) NULL ,
[address] varchar(50) NULL ,
[zhiwei] varchar(50) NULL ,
[quanxian] int NULL ,
[loginName] varchar(50) NULL ,
[loginPw] varchar(50) NULL ,
[del] varchar(50) NULL 
)


GO

-- ----------------------------
-- Records of t_yuangong
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_yuangong] ON
GO
INSERT INTO [dbo].[t_yuangong] ([id], [name], [sex], [age], [tel], [address], [zhiwei], [quanxian], [loginName], [loginPw], [del]) VALUES (N'1', N'刘光亮', N'男', N'25', N'13588888888', N'北京路', N'总经理', N'0', N'', N'', N'no')
GO
GO
SET IDENTITY_INSERT [dbo].[t_yuangong] OFF
GO

-- ----------------------------
-- Indexes structure for table dtproperties
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table dtproperties
-- ----------------------------
ALTER TABLE [dbo].[dtproperties] ADD PRIMARY KEY ([id], [property])
GO

-- ----------------------------
-- Indexes structure for table t_chuku
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_chuku
-- ----------------------------
ALTER TABLE [dbo].[t_chuku] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_chukuMingxi
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_chukuMingxi
-- ----------------------------
ALTER TABLE [dbo].[t_chukuMingxi] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_gongyingshang
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_gongyingshang
-- ----------------------------
ALTER TABLE [dbo].[t_gongyingshang] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_pancun
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_pancun
-- ----------------------------
ALTER TABLE [dbo].[t_pancun] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_ruku
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_ruku
-- ----------------------------
ALTER TABLE [dbo].[t_ruku] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_rukuMingxi
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_rukuMingxi
-- ----------------------------
ALTER TABLE [dbo].[t_rukuMingxi] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_yuangong
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_yuangong
-- ----------------------------
ALTER TABLE [dbo].[t_yuangong] ADD PRIMARY KEY ([id])
GO
