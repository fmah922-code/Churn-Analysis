{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerID,
DeviceProtection FROM dbo.raw_ChurnData