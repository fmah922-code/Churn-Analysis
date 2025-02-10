{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
PaymentMethod FROM dbo.raw_ChurnData