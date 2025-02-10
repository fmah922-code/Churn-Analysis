{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
SeniorCitizen FROM dbo.raw_ChurnData