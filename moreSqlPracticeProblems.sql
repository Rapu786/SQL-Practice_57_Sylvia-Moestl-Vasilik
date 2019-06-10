--1.Cost Change for each product

SELECT 
ProductID,
COUNT(*) AS TotalPriceChanges
FROM ProductCostHistory
GROUP BY ProductID
ORDER BY ProductID;

--2.Customers with total orders placed

SELECT 
CustomerID,
COUNT(*) AS TotalOrders
FROM SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalOrders DESC;
