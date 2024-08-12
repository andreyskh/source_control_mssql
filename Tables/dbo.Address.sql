CREATE TABLE [dbo].[Address] (
  [AddressID] [int] NULL,
  [AddressLine1] [nvarchar](50) NULL,
  [AddressLine2] [nvarchar](255) NULL,
  [City] [nvarchar](50) NULL,
  [StateProvinceID] [int] NULL,
  [PostalCode] [int] NULL,
  [SpatialLocation] [nvarchar](100) NULL,
  [rowguid] [nvarchar](50) NULL,
  [ModifiedDate] [datetime2] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'тест описание', 'SCHEMA', N'dbo', 'TABLE', N'Address'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'тестовое описание', 'SCHEMA', N'dbo', 'TABLE', N'Address', 'COLUMN', N'AddressID'
GO