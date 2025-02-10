{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT
    CustomerID,
    CASE WHEN gender = 'Male' THEN 1 ELSE 0 END AS Male
FROM {{ref('gender')}}