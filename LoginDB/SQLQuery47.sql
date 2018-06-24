USE [LoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 6/21/2018 10:09:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Mathew
-- Create date: 12 June 2018
-- Description:	To store login data
-- =============================================
ALTER PROCEDURE [dbo].[ValidateUser]
@username VARCHAR (50),
@password VARCHAR (50)
AS
BEGIN
select * from [dbo].[LoginData] where Username = @username and Password = @password 
END

