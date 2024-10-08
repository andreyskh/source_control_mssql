﻿CREATE TABLE [Person].[Address] (
  [AddressID] [int] IDENTITY NOT FOR REPLICATION,
  [AddressLine1] [nvarchar](60) NOT NULL,
  [AddressLine2] [nvarchar](60) NULL,
  [City] [nvarchar](30) NOT NULL,
  [StateProvinceID] [int] NOT NULL,
  [PostalCode] [nvarchar](15) NOT NULL,
  [SpatialLocation] [geography] NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED ([AddressID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Address_rowguid]
  ON [Person].[Address] ([rowguid])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode]
  ON [Person].[Address] ([AddressLine1], [AddressLine2], [City], [StateProvinceID], [PostalCode])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Address_StateProvinceID]
  ON [Person].[Address] ([StateProvinceID])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- Create the trigger on the Address table
CREATE TRIGGER [Person].[trgLogCityChanges]
ON [Person].[Address]
AFTER UPDATE
AS
BEGIN
    -- Insert records into Audit table for updates to City
    INSERT INTO AddressAudit (AddressID, OldCity, NewCity, ChangeDate)
    SELECT 
        d.AddressID,
        d.City AS OldCity,
        i.City AS NewCity,
        GETDATE() AS ChangeDate
    FROM 
        inserted i
    INNER JOIN 
        deleted d ON i.AddressID = d.AddressID
    WHERE 
        i.City <> d.City;
END;
GO

ALTER TABLE [Person].[Address]
  ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing StateProvince.StateProvinceID.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'FK_Address_StateProvince_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Street address information for customers, employees, and vendors.', 'SCHEMA', N'Person', 'TABLE', N'Address'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Address records.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'First street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine1'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Second street address line.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'AddressLine2'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the city.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'City'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique identification number for the state or province. Foreign key to StateProvince table.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Postal code for the street address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Latitude and longitude of this address.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'SpatialLocation'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'AK_Address_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'IX_Address_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Address', 'INDEX', N'PK_Address_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'PK_Address_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Address', 'CONSTRAINT', N'DF_Address_rowguid'
GO