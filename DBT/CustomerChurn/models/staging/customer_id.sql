{{ config(tags=["independent"], materialized='ephemeral') }}


SELECT customerID FROM dbo.raw_ChurnData