{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN 
        Contract = 'Month-to-month' THEN 1 ELSE 0
        END AS Contract
FROM  {{ ref('Contract') }}
