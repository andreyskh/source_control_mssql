CREATE TABLE [Sales].[SalesOrder] (
  [SalesOrderID] [int] NOT NULL,
  [CustomerID] [int] NULL,
  [OrderDate] [datetime] NULL,
  [Status] [nvarchar](50) NULL,
  [ShipmentStatus] [nvarchar](50) NULL,
  PRIMARY KEY CLUSTERED ([SalesOrderID])
)
ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [Sales].[trgUpdateShipmentStatus]
ON [Sales].[SalesOrder]
AFTER UPDATE
AS
BEGIN
    UPDATE Sales.SalesOrder
    SET ShipmentStatus = 'Shipped'
    WHERE SalesOrderID IN (
        SELECT SalesOrderID
        FROM inserted
        WHERE Status = 'Completed'
    );
END;
GO