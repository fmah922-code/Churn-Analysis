{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
Contract FROM dbo.raw_ChurnData