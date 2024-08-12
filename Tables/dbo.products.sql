CREATE TABLE [dbo].[products] (
  [product_id] [int] NOT NULL,
  [product_name] [varchar](100) NULL,
  [category] [varchar](50) NULL,
  [price] [decimal](10, 2) NULL,
  PRIMARY KEY CLUSTERED ([product_id])
)
ON [PRIMARY]
GO