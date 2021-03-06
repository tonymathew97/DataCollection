USE [master]
GO
/****** Object:  Database [LoginDB]    Script Date: 18-Jun-18 11:08:30 AM ******/
CREATE DATABASE [LoginDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LoginDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoginDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LoginDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LoginDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LoginDB] SET  MULTI_USER 
GO
ALTER DATABASE [LoginDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LoginDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LoginDB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[UserType] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Manager] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeNo] [int] NULL,
	[UserType] [varchar](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
@username VARCHAR(50)
,@password VARCHAR(50)
,@FirstName VARCHAR(50)
,@LastName VARCHAR(50)
,@UserType INT
AS
BEGIN

DECLARE @id INT
select top 1 @id = id from Users order by id desc
insert into Users values(@id, @username, @password, @FirstName, @LastName, @UserType)

END

GO
/****** Object:  StoredProcedure [dbo].[RemoveUser]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveUser]

@username VARCHAR(50)
,@FirstName VARCHAR(50)
,@LastName VARCHAR(50)
AS
BEGIN

delete from Users where username = @username and FirstName = @FirstName and LastName = @LastName


END



GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
@OldLastName VARCHAR(50)
,@OldFirstName VARCHAR(50)
,@username VARCHAR(50)
,@password VARCHAR(50)
,@FirstName VARCHAR(50)
,@LastName VARCHAR(50)
,@UserType INT
AS
BEGIN

update Users 
set username = @username, [password] = @password, FirstName = @FirstName, LastName = @LastName, UserType = @UserType
where FirstName = @OldFirstName and LastName = @OldLastName


END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 18-Jun-18 11:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[ValidateUser] 'rohan','AdminOne'
CREATE PROCEDURE [dbo].[ValidateUser]
@username VARCHAR(50)
,@password VARCHAR(50)
AS
BEGIN

select 
	u.FirstName,
	u.LastName,
	ut.UserType 
from [dbo].[Users] u
	inner join [dbo].[UserType] ut on u.UserType = ut.[UserTypeNo]
where 
	username = @username 
	and [password] = @password

END


GO
USE [master]
GO
ALTER DATABASE [LoginDB] SET  READ_WRITE 
GO
