{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerID,
    CASE WHEN StreamingMovies = 'No internet service' THEN 1 ELSE 0
    END AS StreamingMovies
FROM  {{ ref('StreamingMovies') }}
