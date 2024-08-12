SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_add_kitchen] @dept_id INT, @kitchen_count INT
AS
begin
UPDATE dbo.Address 
SET
  AddressID = 0 -- AddressID - int
 ,AddressLine1 = N'' -- AddressLine1 - nvarchar(50)
 ,AddressLine2 = N'' -- AddressLine2 - nvarchar(255)
 ,City = N'' -- City - nvarchar(50)
 ,StateProvinceID = 0 -- StateProvinceID - int
 ,PostalCode = 0 -- PostalCode - int
 ,SpatialLocation = N'' -- SpatialLocation - nvarchar(100)
 ,rowguid = N'' -- rowguid - nvarchar(50)
 ,ModifiedDate = SYSDATETIME() -- 'YYYY-MM-DD hh:mm:ss[.nnnnnnn]'-- ModifiedDate - datetime2
WHERE
AddressID = @dept_id
END;
GO