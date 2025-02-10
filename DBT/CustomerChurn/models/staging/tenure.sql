{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerID,
tenure 
FROM dbo.raw_ChurnData