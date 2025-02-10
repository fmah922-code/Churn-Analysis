{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN StreamingMovies = 'No internet service' THEN 1 ELSE 0
    END AS StreamingMovies
FROM  {{ ref('StreamingMovies') }}
