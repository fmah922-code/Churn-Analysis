{{ config(tags=["independent"], materialized='ephemeral') }}

SELECT CustomerID,
StreamingMovies FROM dbo.raw_ChurnData