{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerId,
Dependents FROM dbo.raw_ChurnData