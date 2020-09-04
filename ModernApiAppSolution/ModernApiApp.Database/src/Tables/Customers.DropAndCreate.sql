USE [ModernApiDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[Customers];


GO
CREATE TABLE [dbo].[Customers] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Address]     NVARCHAR (MAX) NULL,
    [CompanyName] NVARCHAR (MAX) NULL,
    [Name]        NVARCHAR (MAX) NULL
);