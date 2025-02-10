{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
InternetService FROM dbo.raw_ChurnData