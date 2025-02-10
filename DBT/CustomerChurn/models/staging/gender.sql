{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
gender FROM dbo.raw_ChurnData