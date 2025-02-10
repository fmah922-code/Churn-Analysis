{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
OnlineBackup FROM dbo.raw_ChurnData