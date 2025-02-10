{{ config(tags=["transformation"], schema = 'final_dataset', materialized='table') }}


SELECT 
    CustomerID.CustomerID,
    Male,
    SeniorCitizen,
    CASE WHEN Partner = 'Yes' THEN 1 ELSE 0
    END AS Partner,
    CASE WHEN Dependents = 'Yes' THEN 1 ELSE 0
    END AS Dependents,
    Tenure,
    CASE WHEN PhoneService = 'Yes' THEN 1 ELSE 0
    END AS PhoneService,
    CASE WHEN PaperLessBilling = 'Yes' THEN 1 ELSE 0
    END AS PaperLessBilling,
    MonthlyCharges,
    TotalCharges,
    MultipleLines_NoPhoneService.[MultipleLines] AS 'MultipleLines_No phone service',
    MultipleLines_Yes.[MultipleLines] AS 'MultipleLines_Yes',
    InternetService_FiberOptic.[InternetService] AS 'InternetService_Fiber optic',
    OnlineSecurity_Yes.[OnlineSecurity] AS 'OnlineSecurity_Yes',
    OnlineBackup_Yes.[OnlineBackup] AS 'OnlineBackup_Yes',
    DeviceProtection_Yes.[DeviceProtection] AS 'DeviceProtection_Yes',
    TechSupport_Yes.[TechSupport] AS 'TechSupport_Yes',
    StreamingTV_Yes.[StreamingTV] AS 'StreamingTV_Yes',
    StreamingMovies_Yes.[StreamingMovies] AS 'StreamingMovies_Yes',
    Contract_One_year.[Contract] AS 'Contract_One year',
    Contract_Two_year.[Contract] AS 'Contract_Two year',
    PaymentMethod_Credit_Card_Automatic.[PaymentMethod] AS 'PaymentMethod_Credit card (automatic)',
    PaymentMethod_Electronic_Check.[PaymentMethod] AS 'PaymentMethod_Electronic check',
    PaymentMethod_Mailed_Check.[PaymentMethod] AS 'PaymentMethod_Mailed check',
    CASE WHEN Churn = 'Yes' THEN 1 ELSE 0
    END AS Churn
FROM {{ref("customer_id")}} CustomerID
LEFT JOIN {{ref("Male")}} Male ON Male.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("SeniorCitizen")}} SeniorCitizen ON SeniorCitizen.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("partner")}} partner ON partner.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("Dependents")}} Dependents ON Dependents.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("tenure")}} tenure ON tenure.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("PhoneService")}} PhoneService ON PhoneService.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("PaperlessBilling")}} PaperlessBilling ON PaperlessBilling.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("MonthlyCharges")}} MonthlyCharges ON MonthlyCharges.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("totalcharges_cleaned")}} TotalCharges ON TotalCharges.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("MultipleLines_NoPhoneService")}} MultipleLines_NoPhoneService ON MultipleLines_NoPhoneService.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("MultipleLines_Yes")}} MultipleLines_Yes ON MultipleLines_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("InternetService_FiberOptic")}} InternetService_FiberOptic ON InternetService_FiberOptic.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("OnlineSecurity_Yes")}} OnlineSecurity_Yes ON OnlineSecurity_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("OnlineBackup_Yes")}} OnlineBackup_Yes ON OnlineBackup_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("DeviceProtection_Yes")}} DeviceProtection_Yes ON DeviceProtection_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("TechSupport_Yes")}} TechSupport_Yes ON TechSupport_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("StreamingTV_Yes")}} StreamingTV_Yes ON StreamingTV_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("StreamingMovies_Yes")}} StreamingMovies_Yes ON StreamingMovies_Yes.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("Contract_One_year")}} Contract_One_year ON Contract_One_year.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("Contract_Two_year")}} Contract_Two_year ON Contract_Two_year.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("PaymentMethod_Credit_Card_Automatic")}} PaymentMethod_Credit_Card_Automatic ON PaymentMethod_Credit_Card_Automatic.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("PaymentMethod_Electronic_Check")}} PaymentMethod_Electronic_Check ON PaymentMethod_Electronic_Check.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("PaymentMethod_Mailed_Check")}} PaymentMethod_Mailed_Check ON PaymentMethod_Mailed_Check.CustomerID = CustomerID.CustomerID
LEFT JOIN {{ref("Churn")}} Churn ON Churn.CustomerID = CustomerID.CustomerId