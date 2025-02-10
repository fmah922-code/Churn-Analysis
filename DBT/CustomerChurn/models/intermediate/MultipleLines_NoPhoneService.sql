{{ config(tags=["transformation"], schema = 'clean') }}

SELECT  
    CustomerId,
    CASE WHEN 
        MultipleLines = 'No phone service' THEN 1
        ELSE 0
        END AS MultipleLines
FROM  {{ ref('MultipleLines') }}
