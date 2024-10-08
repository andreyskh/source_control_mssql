﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TestProcForConvertExec] 
  (
  @col1 BIGINT,
  @col2 BINARY,
  @col3 BIT,
  @col4 CHAR,
  @col5 CHAR(50),
  @col6 DATE,
  @col7 DATETIME,
  @col8 DATETIME2,
  @col9 DATETIMEOFFSET,
  @col10 DECIMAL,
  @col11 FLOAT,
  @col12 GEOGRAPHY,
  @col13 GEOMETRY,
  @col14 HIERARCHYID,
  @col16 INT,
  @col17 MONEY,
  @col18 NCHAR,
  @col20 NUMERIC,
  @col21 NVARCHAR,
  @col22 NVARCHAR(MAX),
  @col23 REAL,
  @col24 SMALLDATETIME,
  @col25 SMALLINT,
  @col26 SMALLMONEY,
  @col27 SQL_VARIANT,
  @col28 SYSNAME,
  @col30 TIME,
  @col31 TINYINT,
  @col32 UNIQUEIDENTIFIER,
  @col33 VARBINARY,
  @col34 VARBINARY(MAX),
  @col35 VARCHAR,
  @col36 VARCHAR(MAX),
  @col37 XML,
  @col38 BINARY VARYING,
  @col39 CHAR VARYING,
  @col40 CHARACTER ,
  @col41 DEC,
  @col42 DOUBLE PRECISION,
  @col43 INTEGER,
  @col44 NATIONAL CHAR,
  @col45 NATIONAL CHAR VARYING,
  @col46 NATIONAL CHARACTER ,
  @col47 NATIONAL CHARACTER VARYING,
  @col49 ROWVERSION
  )
  WITH EXECUTE AS CALLER
  AS
  BEGIN
      SET @col16 = 10;
    SELECT @col16;
  END
GO