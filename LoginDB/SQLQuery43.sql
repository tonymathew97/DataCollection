USE [LoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[CreateCampaign]    Script Date: 6/21/2018 9:50:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=====================================================
--    Author       :  Tony Mathew
--    Created date :  20th June 2018
--    Created For  :  To create a campaign
--====================================================



ALTER PROCEDURE [dbo].[CreateCampaign](

@Subject NVARCHAR(100),
@Description NVARCHAR(500),
@CreatedBy NVARCHAR(100),
@UpdatedBy NVARCHAR(100)
)
As
Begin
	INSERT INTO Campaign (Subject,Description,Status,CreatedBy,UpdatedBy) VALUES(@Subject,@Description,'ACTIVE',@CreatedBy,@UpdatedBy)
End




