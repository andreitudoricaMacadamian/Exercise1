﻿/*
Deployment script for exercise1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "exercise1"
:setvar DefaultFilePrefix "exercise1"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[Search]...';


GO
ALTER FUNCTION [dbo].[Search]
(
	@searchWord nvarchar(50)
)
RETURNS @returntable TABLE
(
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Email nvarchar(50),
	[Role] nvarchar(50),
	Phone nvarchar(50),
	DateOfBirth date,
	Gender nvarchar(50)
)
AS
BEGIN
	INSERT @returntable
	SELECT FirstName,LastName,Email,[Name],PhoneNumber,DateOfBirth,Gender From ViewAllData
		Where CONCAT(FirstName,LastName,Email,[Name],PhoneNumber,DateOfBirth,Gender)like '%'+@searchWord+'%'
	RETURN
END
GO
PRINT N'Update complete.';


GO
