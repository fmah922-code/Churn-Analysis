{{ config(tags=["transformation"], schema = 'remove') }}


SELECT 
    InternetService_No.CustomerID,
    InternetService AS InternetService_No,
    OnlineSecurity AS [OnlineSecurity_No internet service],
    OnlineBackup AS [OnlineBackup_No internet service], 
    DeviceProtection AS [DeviceProtection_No internet service],
    TechSupport AS [TechSupport_No internet service],
    StreamingTV AS [StreamingTV_No internet service],
    StreamingMovies AS [StreamingMovies_No internet service]
FROM 
    {{ref('InternetService_No')}} InternetService_No
LEFT JOIN {{ref('OnlineSecurity_NoInternetService')}} OnlineSecurity_NoInternetService
    ON OnlineSecurity_NoInternetService.CustomerID = InternetService_No.CustomerID
LEFT JOIN {{ref('OnlineBackup_NoInternetService')}} OnlineBackup_NoInternetService
    ON OnlineBackup_NoInternetService.CustomerID = InternetService_No.CustomerID
LEFT JOIN {{ref('DeviceProtection_NoInternetService')}} DeviceProtection_NoInternetService
    ON DeviceProtection_NoInternetService.CustomerId = InternetService_No.CustomerID
LEFT JOIN {{ref('TechSupport_NoInternetService')}} TechSupport_NoInternetService
    ON TechSupport_NoInternetService.CustomerID = InternetService_no.CustomerID
LEFT JOIN {{ref('StreamingTV_NoInternetService')}} StreamingTV_NoInternetService
    ON StreamingTV_NoInternetService.CustomerID = InternetService_No.CustomerID
LEFT JOIN {{ref('StreamingMovies_NoInternetService')}} StreamingMovies_NoInternetService
    ON StreamingMovies_NoInternetService.CustomerID = InternetService_No.CustomerID