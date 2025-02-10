{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerID,
    CASE WHEN OnlineSecurity = 'No internet service' THEN 1 ELSE 0
    END AS OnlineSecurity
FROM  {{ ref('OnlineSecurity') }}
