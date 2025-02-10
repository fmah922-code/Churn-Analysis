{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}


SELECT 
    CustomerID,
    CASE WHEN 
        DeviceProtection = 'Yes' THEN 1 ELSE 0
        END AS DeviceProtection
FROM  {{ ref('DeviceProtection') }}
