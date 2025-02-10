{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN 
        StreamingTV = 'Yes' THEN 1 ELSE 0
        END AS StreamingTV
FROM  {{ ref('StreamingTV') }} 