{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
StreamingTV FROM dbo.raw_ChurnData