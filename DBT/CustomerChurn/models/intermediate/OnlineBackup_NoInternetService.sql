{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerId,
    CASE WHEN 
        OnlineBackup = 'No internet service' THEN 1
        ELSE 0
        END AS OnlineBackup
FROM  {{ ref('OnlineBackup') }}