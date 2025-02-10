{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
TotalCharges FROM dbo.raw_ChurnData