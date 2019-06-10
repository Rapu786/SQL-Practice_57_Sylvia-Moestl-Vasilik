--1.Cost Change for each product

SELECT 
ProductID,
COUNT(*) AS TotalPriceChanges
FROM ProductCostHistory
GROUP BY ProductID
ORDER BY ProductID;