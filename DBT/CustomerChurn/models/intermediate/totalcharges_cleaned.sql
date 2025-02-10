{{ config(tags=["transformation"], schema = 'clean', materialized='ephemeral') }}

SELECT 
    CustomerId,
	CASE WHEN( 
		CAST(CASE WHEN	
			DATALENGTH(LTRIM(RTRIM(TotalCharges))) = 0
			THEN NULL ELSE TotalCharges END AS Float)) IS NULL
			THEN '{{var("mean")}}'
			ELSE CAST(CASE WHEN	
			DATALENGTH(LTRIM(RTRIM(TotalCharges))) = 0
			THEN NULL ELSE TotalCharges END AS Float)
			END
	AS TotalCharges
FROM  {{ ref('TotalCharges') }}
