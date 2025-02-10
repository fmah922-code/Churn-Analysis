{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerID,
    CASE WHEN 
        Contract = 'Two year' THEN 1 ELSE 0
        END AS Contract
FROM  {{ ref('Contract') }}
