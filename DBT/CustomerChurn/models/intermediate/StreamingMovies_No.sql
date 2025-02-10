{{ config(tags=["transformation"], schema = 'clean') }}

SELECT 
    CustomerID,
    CASE WHEN StreamingMovies = 'No' THEN 1 ELSE 0
    END AS StreamingMovies
FROM  {{ ref('StreamingMovies') }}
