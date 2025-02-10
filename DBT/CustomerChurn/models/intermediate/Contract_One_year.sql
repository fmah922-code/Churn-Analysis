{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN 
        Contract = 'One year' THEN 1 ELSE 0
        END AS Contract
FROM  {{ ref('Contract') }}
