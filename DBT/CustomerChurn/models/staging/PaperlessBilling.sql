{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
PaperlessBilling FROM dbo.raw_ChurnData