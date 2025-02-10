{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerID,
    CASE WHEN 
        InternetService = 'No' THEN 1 ELSE 0
        END AS InternetService
FROM  {{ ref('InternetService') }} 