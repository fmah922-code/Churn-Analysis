{{ config(tags=["target"], materialized='ephemeral') }}

SELECT 
CustomerId,
Churn FROM dbo.raw_ChurnData