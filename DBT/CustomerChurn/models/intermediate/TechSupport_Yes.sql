{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN 
        TechSupport = 'Yes' THEN 1 ELSE 0
        END AS TechSupport
FROM  {{ ref('TechSupport') }} 