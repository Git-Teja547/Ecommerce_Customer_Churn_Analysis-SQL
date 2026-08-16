📊 E-Commerce Customer Churn Analysis Using SQL

📌 Project Overview

This project analyzes customer churn in an e-commerce dataset using MySQL.

The objective is to identify patterns associated with customer churn, understand customer behavior across different segments, and classify customers into High, Medium, and Low Risk categories.

A total of 25 SQL analyses were performed using aggregation, conditional logic, segmentation, and multi-dimensional analysis.



🎯 Objectives

Analyze overall customer churn patterns.

Identify customer segments with higher churn rates.

Analyze the relationship between customer behavior and churn.

Compare churn across tenure groups, city tiers, satisfaction levels, payment methods, device usage, and other factors.

Develop a customer-risk classification using SQL.

Generate business recommendations for customer retention.



🛠️ Tools \& Technologies

Database: MySQL

SQL Environment: MySQL Workbench

Language: SQL

Dataset: E-Commerce Customer Churn Dataset


🔍 Analysis Performed

The project includes 25 SQL analyses covering:

1. Customer login/device behavior
2. Preferred payment methods
3. Satisfaction score
4. Customer complaints
5. Tenure and tenure groups
6. City Tier
7. Distance from warehouse
8. Gender
9. Hours spent on app
10. Number of registered devices
11. Marital status
12. Number of addresses
13. Multi-factor customer segmentation
14. Customer risk classification
15. Risk level by City Tier
16. Risk level by Satisfaction Score
17. Final customer-risk profiling



🚨 Customer Risk Classification

A SQL CASE statement was used to classify customers into three risk levels based on:

1. Churn status
2. Satisfaction Score
3. Complaint status
4. Final Risk Summary
5. Risk Level
6. Customers
7. Churned Customers
8. Churn Rate


💡 Key Insights

🔴 High-Risk Customers

High-risk customers showed a 100% churn rate. They also had very low average satisfaction and very short average tenure.


🟠 Medium-Risk Customers

The medium-risk group was the largest risk segment, containing 3,044 customers with a 27.20% churn rate.


🟢 Low-Risk Customers

The low-risk segment contained 2,466 customers and recorded 0% churn in the analyzed data.



📍 City Tier

Medium-risk customers in City Tier 2 showed a higher churn rate than medium-risk customers in City Tier 1.

😊 Satisfaction

Customers with lower satisfaction scores were strongly represented among the risk segments, while the low-risk group had a considerably higher average satisfaction score.


📈 Business Recommendations

Based on the analysis:

1. Prioritize high-risk customers for immediate retention initiatives.
2. Address customer complaints and low satisfaction proactively.
3. Focus retention efforts on the large medium-risk segment.
4. Pay particular attention to new customers, especially early-tenure groups.
5. Monitor customer segments where multiple risk factors occur together.
6. Use customer-risk classification to support targeted retention strategies.



🧠 SQL Skills Demonstrated

This project demonstrates practical use of:

SELECT

COUNT()

SUM()

AVG()

ROUND()

GROUP BY

ORDER BY

CASE WHEN

Subqueries

Conditional Aggregation

Multi-column Grouping

Data Segmentation

Churn Rate Calculation

Customer Risk Classification

Business Analysis


