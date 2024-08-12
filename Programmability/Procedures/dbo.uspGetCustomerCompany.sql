SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[uspGetCustomerCompany]
(    
    @LastName nvarchar(50) = NULL,
    @FirstName nvarchar(50) = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT FirstName, LastName
       FROM Customer
       WHERE FirstName = @FirstName AND LastName = @LastName;
END
GO