USE master
GO
-- Creating the simpleapidb
DECLARE @dbname sysname
SET @dbname = 'simpleapidb'

DECLARE @spid int
SELECT @spid = min(spid) from master.dbo.sysprocesses where dbid = db_id(@dbname)
WHILE @spid IS NOT NULL
BEGIN
EXECUTE ('KILL ' + @spid)
SELECT @spid = min(spid) from master.dbo.sysprocesses where dbid = db_id(@dbname) AND spid > @spid
END
GO

DROP DATABASE IF EXISTS simpleapidb
GO 

CREATE DATABASE simpleapidb
GO

USE [simpleapidb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Customers];


GO
CREATE TABLE [dbo].[Customers] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Address]     NVARCHAR (MAX) NULL,
    [CompanyName] NVARCHAR (MAX) NULL,
    [Name]        NVARCHAR (MAX) NULL
);

GO
-- Inserting test data
PRINT N'inserting the test data.'
USE [simpleapidb]
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT INTO [dbo].[Customers] ([Id], [Address], [CompanyName], [Name]) VALUES (1, N'100 main street', N'Microsoft', N'Joe Doe')
INSERT INTO [dbo].[Customers] ([Id], [Address], [CompanyName], [Name]) VALUES (2, N'200 main street', N'Microsoft', N'Jane Doe')
INSERT INTO [dbo].[Customers] ([Id], [Address], [CompanyName], [Name]) VALUES (3, N'300 main street', N'Microsoft', N'Jimmy Doe')
INSERT INTO [dbo].[Customers] ([Id], [Address], [CompanyName], [Name]) VALUES (4, N'400 main street', N'Microsoft', N'Jesse Doe')
INSERT INTO [dbo].[Customers] ([Id], [Address], [CompanyName], [Name]) VALUES (5, N'500 main street', N'Microsoft', N'Jaime Doe')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO