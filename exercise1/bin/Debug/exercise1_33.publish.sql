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
PRINT N'Creating [dbo].[AddTestData]...';


GO
CREATE PROCEDURE [dbo].[AddTestData]
AS
	INSERT INTO [UserInfo] (PhoneNumber,DateOfBirth,Gender) VALUES ('000000000', 1996-12-12,'Male');
	INSERT INTO [UserInfo] (PhoneNumber,DateOfBirth,Gender) VALUES ('111111111', 1991-11-11,'Male');
	INSERT INTO [UserInfo] (PhoneNumber,DateOfBirth,Gender) VALUES ('222222222', 1997-03-19,'Male');
	INSERT INTO [UserInfo] (PhoneNumber,DateOfBirth,Gender) VALUES ('333333333', 1900-10-10,'Female');
	INSERT INTO [UserInfo] (PhoneNumber,DateOfBirth,Gender) VALUES ('444444444', 1997-12-12,'Female');

	INSERT INTO [User] (Email, Username, [Password], FirstName, LastName, MoreInfo) VALUES ('matei@matei.com','mateimatei',HASHBYTES ('MD2','matei'),'matei','birle',1);
	INSERT INTO [User] (Email, Username, [Password], FirstName, LastName, MoreInfo) VALUES ('andrei@andrei.com','andreiandrei',HASHBYTES ('MD2','andrei'),'andrei','bora',2);
	INSERT INTO [User] (Email, Username, [Password], FirstName, LastName, MoreInfo) VALUES ('robi@robi.com','robirobi',HASHBYTES ('MD2','robi'),'robi','laszlo',3);
	INSERT INTO [User] (Email, Username, [Password], FirstName, LastName, MoreInfo) VALUES ('ana@ana.com','anaana',HASHBYTES ('MD2','ana'),'ana','a lu ion',4);
	INSERT INTO [User] (Email, Username, [Password], FirstName, LastName, MoreInfo) VALUES ('imola@imola.com','imolaimola',HASHBYTES ('MD2','imola'),'imola','imola',5);

	INSERT INTO [ROLE] ([Name],Permission1,Permission2,Permission3) VALUES ('Admin',1,1,1);
	INSERT INTO [ROLE] ([Name],Permission1,Permission2,Permission3) VALUES ('Student',1,1,0);
	INSERT INTO [ROLE] ([Name],Permission1,Permission2,Permission3) VALUES ('Guest',1,0,0);
	INSERT INTO [ROLE] ([Name],Permission1,Permission2,Permission3) VALUES ('Freyer',0,0,0);

	Insert INTO [UserHasRole] (UserID,RoleID) Values (12,4);
	Insert INTO [UserHasRole] (UserID,RoleID) Values (13,3);
	Insert INTO [UserHasRole] (UserID,RoleID) Values (14,2);
	Insert INTO [UserHasRole] (UserID,RoleID) Values (15,1);
	Insert INTO [UserHasRole] (UserID,RoleID) Values (10,1);


RETURN 0
GO
PRINT N'Update complete.';


GO
