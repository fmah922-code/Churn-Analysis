{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN PaymentMethod = 'Bank transfer (automatic)' THEN 1 ELSE 0
    END AS PaymentMethod
FROM  {{ ref('PaymentMethod') }}
