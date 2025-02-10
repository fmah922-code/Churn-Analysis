{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
PhoneService FROM dbo.raw_ChurnData