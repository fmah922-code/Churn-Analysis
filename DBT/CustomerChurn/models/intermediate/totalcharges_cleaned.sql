{{ config(tags=["transformation"], schema = 'clean') }}

select * from {{ ref('TotalCharges') }}

