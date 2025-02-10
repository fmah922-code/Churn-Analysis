{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN PaymentMethod = 'Mailed check' THEN 1 ELSE 0
    END AS PaymentMethod
FROM  {{ ref('PaymentMethod') }}
