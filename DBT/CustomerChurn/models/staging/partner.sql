{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
Partner FROM dbo.raw_ChurnData