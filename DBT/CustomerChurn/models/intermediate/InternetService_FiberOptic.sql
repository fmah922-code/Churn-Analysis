{{ config(tags=["transformation"], schema = 'clean') }}


SELECT 
    CustomerID,
    CASE WHEN 
        InternetService = 'Fiber optic' THEN 1 ELSE 0
        END AS InternetService
FROM  {{ ref('InternetService') }} 