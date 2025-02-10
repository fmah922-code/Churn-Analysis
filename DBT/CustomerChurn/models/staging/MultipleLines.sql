{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerId,
MultipleLines FROM dbo.raw_ChurnData