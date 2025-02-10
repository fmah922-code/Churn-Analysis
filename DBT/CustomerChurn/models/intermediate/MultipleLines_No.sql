{{ config(tags=["transformation"], schema = 'clean') }}

SELECT  
    CustomerId,
    CASE WHEN 
        MultipleLines = 'No' THEN 1
        ELSE 0
        END AS MultipleLines
FROM  {{ ref('MultipleLines') }}
