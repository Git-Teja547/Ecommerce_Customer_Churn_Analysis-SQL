CREATE DATABASE ecommerce_churn;
USE ecommerce_churn;

CREATE TABLE ecommerce_customers (
    CustomerID INT PRIMARY KEY,
    Churn INT,
    Tenure INT,
    PreferredLoginDevice VARCHAR(50),
    CityTier INT,
    WarehouseToHome INT,
    PreferredPaymentMode VARCHAR(50),
    Gender VARCHAR(20),
    HourSpendOnApp DECIMAL(5,2),
    NumberOfDeviceRegistered INT,
    PreferedOrderCat VARCHAR(50),
    SatisfactionScore INT,
    MaritalStatus VARCHAR(30),
    NumberOfAddress INT,
    Complain INT,
    OrderAmountHikeFromlastYear DECIMAL(6,2),
    CouponUsed INT,
    OrderCount INT,
    DaySinceLastOrder INT,
    CashbackAmount DECIMAL(10,2)
);


SELECT *
FROM ecommerce_churn
LIMIT 10;

SELECT Churn, COUNT(*) AS customer_count
FROM ecommerce_churn
GROUP BY Churn;

#1. Check total Customers
SELECT COUNT(*) AS total_customers
FROM ecommerce_churn;

#2. Check Duplicate ID's
SELECT ï»¿CustomerID, COUNT(*) AS count
FROM ecommerce_churn
GROUP BY ï»¿CustomerID
HAVING COUNT(*) > 1;

#3. Check NULL Values
SELECT
    SUM(ï»¿CustomerID IS NULL) AS customer_id_nulls,
    SUM(Churn IS NULL) AS churn_nulls,
    SUM(Tenure IS NULL) AS tenure_nulls,
    SUM(PreferredLoginDevice IS NULL) AS login_device_nulls,
    SUM(SatisfactionScore IS NULL) AS satisfaction_nulls,
    SUM(OrderCount IS NULL) AS order_count_nulls,
    SUM(DaySinceLastOrder IS NULL) AS last_order_nulls
FROM ecommerce_churn;


#4. Check important numeric ranges
SELECT
    MIN(Tenure) AS min_tenure,
    MAX(Tenure) AS max_tenure,
    MIN(SatisfactionScore) AS min_satisfaction,
    MAX(SatisfactionScore) AS max_satisfaction,
    MIN(OrderCount) AS min_orders,
    MAX(OrderCount) AS max_orders,
    MIN(DaySinceLastOrder) AS min_days,
    MAX(DaySinceLastOrder) AS max_days
FROM ecommerce_churn;

#5. Calculate Overall Churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn;

#6. Check Churn Values
SELECT
    Churn,
    COUNT(*) AS customers
FROM ecommerce_churn
GROUP BY Churn;


# Churn Analysis

#1. Highest Customer churn rate
SELECT
    PreferedOrderCat,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY PreferedOrderCat
ORDER BY churn_rate DESC;

#2. Login device
SELECT
    PreferredLoginDevice,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY PreferredLoginDevice
ORDER BY churn_rate DESC;

#3. Payment mode
SELECT
    PreferredPaymentMode,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY PreferredPaymentMode
ORDER BY churn_rate DESC;

#4. Satisfaction score
SELECT
    SatisfactionScore,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY SatisfactionScore
ORDER BY SatisfactionScore;

#5. Customers who complained churn more
SELECT
    Complain,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY Complain
ORDER BY churn_rate DESC;


#6. Tenure
SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY Tenure
ORDER BY Tenure;

#7. Tenure groups
SELECT
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;


#8. City Tier vs Churn
SELECT
    CityTier,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY CityTier
ORDER BY churn_rate DESC;


#9. Warehouse distance
SELECT
    CASE
        WHEN WarehouseToHome <= 5 THEN '0-5 km'
        WHEN WarehouseToHome <= 10 THEN '6-10 km'
        WHEN WarehouseToHome <= 20 THEN '11-20 km'
        WHEN WarehouseToHome <= 30 THEN '21-30 km'
        ELSE '31+ km'
    END AS distance_group,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY distance_group
ORDER BY churn_rate DESC;

#10. Gender vs Churn
SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY Gender
ORDER BY churn_rate DESC;

#11. Hours spent on app vs churn
SELECT
    HourSpendOnApp,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY HourSpendOnApp
ORDER BY HourSpendOnApp;


#12. Number of devices registered vs churn
SELECT
    NumberOfDeviceRegistered,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY NumberOfDeviceRegistered
ORDER BY NumberOfDeviceRegistered;

#13. Marital Status vs Churn
SELECT
    MaritalStatus,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY MaritalStatus
ORDER BY churn_rate DESC;

#14. Number of Addresses vs Churn
SELECT
    NumberOfAddress,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY NumberOfAddress
ORDER BY NumberOfAddress;

#15. City Tier + Satisfaction Score vs Churn
SELECT
    CityTier,
    SatisfactionScore,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY CityTier, SatisfactionScore
ORDER BY churn_rate DESC;

#16. Tenure Group + Satisfaction Score vs Churn
SELECT
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    SatisfactionScore,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY tenure_group, SatisfactionScore
ORDER BY churn_rate DESC;


#17. Number of Devices + Tenure Group vs Churn
SELECT
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    NumberOfDeviceRegistered,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY tenure_group, NumberOfDeviceRegistered
ORDER BY churn_rate DESC;

#18. City Tier + Tenure Group + Satisfaction Score vs Churn
SELECT
    CityTier,
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    SatisfactionScore,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY CityTier, tenure_group, SatisfactionScore
ORDER BY churn_rate DESC;


#19. Warehouse Distance + Tenure Group vs Churn
SELECT
    CASE
        WHEN WarehouseToHome <= 5 THEN '0-5 km'
        WHEN WarehouseToHome <= 10 THEN '6-10 km'
        WHEN WarehouseToHome <= 20 THEN '11-20 km'
        WHEN WarehouseToHome <= 30 THEN '21-30 km'
        ELSE '31+ km'
    END AS distance_group,
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY distance_group, tenure_group
ORDER BY churn_rate DESC;


#20. Payment Mode + Tenure Group vs Churn
SELECT
    PreferredPaymentMode,
    CASE
        WHEN Tenure <= 3 THEN '0-3 Months'
        WHEN Tenure <= 6 THEN '4-6 Months'
        WHEN Tenure <= 12 THEN '7-12 Months'
        WHEN Tenure <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM ecommerce_churn
GROUP BY PreferredPaymentMode, tenure_group
ORDER BY churn_rate DESC;


#21. Customer Risk Segmentation
SELECT
    ï»¿CustomerID,
    Tenure,
    SatisfactionScore,
    Complain,
    HourSpendOnApp,
    NumberOfDeviceRegistered,
    Churn,
    CASE
        WHEN Churn = 1
             AND SatisfactionScore <= 2
             AND Complain = 1
        THEN 'High Risk'
        WHEN Churn = 1
             OR SatisfactionScore <= 2
             OR Complain = 1
        THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM ecommerce_churn
ORDER BY
    CASE
        WHEN Churn = 1
             AND SatisfactionScore <= 2
             AND Complain = 1 THEN 1
        WHEN Churn = 1
             OR SatisfactionScore <= 2
             OR Complain = 1 THEN 2
        ELSE 3
    END;
    
    
#22. Risk Level Summary
SELECT
    risk_level,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM
(
    SELECT
        Churn,
        CASE
            WHEN Churn = 1
                 AND SatisfactionScore <= 2
                 AND Complain = 1
                THEN 'High Risk'
            WHEN Churn = 1
                 OR SatisfactionScore <= 2
                 OR Complain = 1
                THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS risk_level
    FROM ecommerce_churn
) AS customer_risk
GROUP BY risk_level
ORDER BY churn_rate DESC;


#23. Risk Level by City Tier
SELECT
    CityTier,
    risk_level,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM
(
    SELECT
        CityTier,
        Churn,
        CASE
            WHEN Churn = 1
                 AND SatisfactionScore <= 2
                 AND Complain = 1
                THEN 'High Risk'
            WHEN Churn = 1
                 OR SatisfactionScore <= 2
                 OR Complain = 1
                THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS risk_level
    FROM ecommerce_churn
) AS customer_risk
GROUP BY CityTier, risk_level
ORDER BY CityTier, churn_rate DESC;


#24. Risk Level vs Satisfaction Score
SELECT
    SatisfactionScore,
    risk_level,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM
(
    SELECT
        SatisfactionScore,
        Churn,
        CASE
            WHEN Churn = 1
                 AND SatisfactionScore <= 2
                 AND Complain = 1
                THEN 'High Risk'
            WHEN Churn = 1
                 OR SatisfactionScore <= 2
                 OR Complain = 1
                THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS risk_level
    FROM ecommerce_churn
) AS customer_risk
GROUP BY SatisfactionScore, risk_level
ORDER BY SatisfactionScore, churn_rate DESC;


#25. Final Customer Risk Summary
SELECT
    CASE
        WHEN Churn = 1
             AND SatisfactionScore <= 2
             AND Complain = 1
            THEN 'High Risk'
        WHEN Churn = 1
             OR SatisfactionScore <= 2
             OR Complain = 1
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS churn_rate,
    ROUND(AVG(Tenure), 2) AS avg_tenure,
    ROUND(AVG(SatisfactionScore), 2) AS avg_satisfaction,
    ROUND(AVG(HourSpendOnApp), 2) AS avg_hours_on_app,
    ROUND(AVG(NumberOfDeviceRegistered), 2) AS avg_devices
FROM ecommerce_churn
GROUP BY risk_level
ORDER BY churn_rate DESC;