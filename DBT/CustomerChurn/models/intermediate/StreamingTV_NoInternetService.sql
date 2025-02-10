{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerID,
    CASE WHEN 
        StreamingTV = 'No internet service' THEN 1 ELSE 0
        END AS StreamingTV
FROM  {{ ref('StreamingTV') }} 