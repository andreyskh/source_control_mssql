CREATE TABLE [HumanResources].[EmployeePromotionAudit] (
  [EmployeeID] [int] NULL,
  [OldJobTitle] [nvarchar](50) NULL,
  [NewJobTitle] [nvarchar](50) NULL,
  [PromotionDate] [datetime] NULL
)
ON [PRIMARY]
GO