{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerId,
    CASE WHEN 
        OnlineBackup = 'No' THEN 1
        ELSE 0
        END AS OnlineBackup
FROM  {{ ref('OnlineBackup') }}