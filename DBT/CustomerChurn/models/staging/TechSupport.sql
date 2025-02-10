{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT 
CustomerID,
TechSupport FROM dbo.raw_ChurnData