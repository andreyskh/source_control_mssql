CREATE TABLE [dbo].[orders] (
  [order_id] [int] NOT NULL,
  [order_date] [date] NULL,
  [total_amount] [decimal](10, 2) NULL,
  [city] [varchar](50) NULL,
  PRIMARY KEY CLUSTERED ([order_id])
)
ON [PRIMARY]
GO