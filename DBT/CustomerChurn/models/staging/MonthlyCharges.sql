{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
MonthlyCharges FROM dbo.raw_ChurnData