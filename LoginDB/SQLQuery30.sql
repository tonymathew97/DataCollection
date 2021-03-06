USE [LoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[SaveResponse]    Script Date: 6/20/2018 4:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=====================================================
--    Author       :  Tony Mathew
--    Created date :  20th June 2018
--    Created For  :  To save campaign responses
--====================================================


ALTER PROCEDURE [dbo].[SaveResponse]( 

@ResponseID INT,
@Response NVARCHAR(MAX)
)

AS
BEGIN
	
	INSERT INTO CampaignResponse(CRID, CResponse) VALUES(@ResponseID, @Response)
END
