CREATE TABLE [dbo].[AddressAudit] (
  [AddressID] [int] NULL,
  [OldCity] [nvarchar](60) NULL,
  [NewCity] [nvarchar](60) NULL,
  [ChangeDate] [datetime] NULL
)
ON [PRIMARY]
GO