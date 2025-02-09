{{ config(tags=["transformation"], schema = 'clean') }}

SELECT *
FROM {{source('TotalCharges')}}
