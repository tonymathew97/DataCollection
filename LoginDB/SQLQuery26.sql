USE [LoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[CreateCampaign]    Script Date: 6/20/2018 4:06:24 PM ******/
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
--@CampaignID int,
@Subject nvarchar(100),
@Description nvarchar(500),
--@CampaignStatus nvarchar(100)
@CreatedBy nvarchar(100),
@UpdatedBy nvarchar(100)
)
As
Begin
	INSERT INTO Campaign (CSubject,CDescription,CStatus,CCreatedBy,CUpdatedBy) VALUES(@Subject,@Description,'ACTIVE',@CreatedBy,@UpdatedBy)
End




