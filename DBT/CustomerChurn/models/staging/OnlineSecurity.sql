{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
OnlineSecurity FROM dbo.raw_ChurnData