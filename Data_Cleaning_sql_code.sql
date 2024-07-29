CREATE DATABASE db_churn;

SELECT * FROM stg_churn;

SELECT Gender, COUNT(Gender) AS 'Count', 
       CONCAT(COUNT(Gender) / (SELECT COUNT(*) FROM stg_churn) * 100, '%') AS PERCENTAGE
FROM stg_churn 
GROUP BY Gender;

SELECT Contract, COUNT(Contract) AS 'Count', 
       CONCAT(COUNT(Contract) / (SELECT COUNT(*) FROM stg_churn) * 100, '%') AS PERCENTAGE
FROM stg_churn 
GROUP BY Contract;

CREATE TABLE prod_churn
LIKE stg_churn;

-- Data Cleaning

SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_Churn;

INSERT prod_churn
SELECT * 
FROM stg_churn;

SELECT * FROM prod_churn;

SELECT DISTINCT Gender
FROM prod_churn;

SELECT DISTINCT Married
FROM prod_churn;

SELECT DISTINCT State
FROM prod_churn
ORDER BY State;

SELECT DISTINCT Value_Deal
FROM prod_churn;

UPDATE prod_churn
SET Value_Deal = 'None'
WHERE Value_Deal = '';

SELECT DISTINCT Phone_Service
FROM prod_churn;

SELECT DISTINCT Multiple_Lines
FROM prod_churn;

UPDATE prod_churn
SET Multiple_Lines = 'No'
WHERE Multiple_Lines = '';

SELECT DISTINCT Internet_Type
FROM prod_churn;

UPDATE prod_churn 
SET Internet_Type = 'None'
WHERE Internet_Type = '';

SELECT DISTINCT Online_Security
FROM prod_churn;

UPDATE prod_churn
SET Online_Security = 'No'
WHERE Online_Security = '';

SELECT DISTINCT Online_Backup
FROM prod_churn;

UPDATE prod_churn
SET Online_Backup = 'No'
WHERE Online_Backup = '';

SELECT DISTINCT Device_Protection_Plan
FROM prod_churn;

UPDATE prod_churn
SET Device_Protection_Plan = 'No'
WHERE Device_Protection_Plan = '';

SELECT DISTINCT Premium_Support
FROM prod_churn;

UPDATE prod_churn
SET Premium_Support = 'No'
WHERE Premium_Support = '';

SELECT DISTINCT Streaming_TV
FROM prod_churn;

UPDATE prod_churn
SET Streaming_TV = 'No'
WHERE Streaming_TV = '';

SELECT DISTINCT Streaming_Movies
FROM prod_churn;

UPDATE prod_churn
SET Streaming_Movies = 'No'
WHERE Streaming_Movies = '';

SELECT DISTINCT Streaming_Music
FROM prod_churn;

UPDATE prod_churn
SET Streaming_Music = 'No'
WHERE Streaming_Music = '';

SELECT DISTINCT Unlimited_Data
FROM prod_churn;

UPDATE prod_churn
SET Unlimited_Data = 'No'
WHERE Unlimited_Data = '';

SELECT DISTINCT Contract
FROM prod_churn;

SELECT DISTINCT Paperless_Billing
FROM prod_churn;

SELECT DISTINCT Payment_Method
FROM prod_churn;

SELECT DISTINCT Customer_Status
FROM prod_churn;

SELECT DISTINCT Churn_Category
FROM prod_churn;

UPDATE prod_churn 
SET Churn_Category = 'Others'
WHERE Churn_Category = '';

SELECT DISTINCT Churn_Reason
FROM prod_churn;

UPDATE prod_churn 
SET Churn_Reason = 'Others'
WHERE Churn_Reason = '';

SELECT * FROM prod_churn;

UPDATE prod_churn
SET Customer_ID = TRIM(Customer_ID);

ALTER TABLE prod_churn
ADD PRIMARY KEY (Customer_ID);