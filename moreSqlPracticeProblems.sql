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

--3.Products with first and last order date 

SELECT a.ProductID, MIN(CAST(b.OrderDate AS DATE)) AS FirstOrder , Max(CAST(b.OrderDate AS DATE)) AS LastOrder
FROM SalesOrderDetail a
Inner Join SalesOrderHeader b
ON a.SalesOrderID = b.SalesOrderID
GROUP BY a.ProductID
ORDER BY ProductID;

--4.Products with first and last order date, including name
SELECT a.ProductID, c.ProductName ,MIN(CAST(b.OrderDate AS DATE)) AS FirstOrder , Max(CAST(b.OrderDate AS DATE)) AS LastOrder
FROM SalesOrderDetail a
Inner Join SalesOrderHeader b
ON a.SalesOrderID = b.SalesOrderID
Inner Join Product c
On a.ProductID = c.ProductID
GROUP BY a.ProductID, c.ProductName
ORDER BY ProductID;

-- 5.Product cost on a specific date

SELECT ProductID, StandardCost
FROM ProductCostHistory
WHERE '2012-04-15' BETWEEN StartDate AND EndDate
ORDER BY ProductID;

SELECT ProductID,standardCost
FROM ProductCostHistory
WHERE StartDate <= '2012-04-15'
AND EndDate >='2012-04-15'
ORDER BY ProductID;

--6.Product Cost On A Specific Date, Part 2
-- It turns out that the answer to the above problem has a problem. Change the date to 2014-04-15. What are your results?
--If you use the SQL from the answer above, and just change the date, you won't get the results you want.
--Fix the SQL so it gives the correct results with the new date. Note that when the EndDate is null, that means that price is applicable into the future.

SELECT ProductID
,StandardCost
FROM ProductCostHistory
WHERE '2014-04-15' BETWEEN StartDate AND IsNull(EndDate, GETDATE())
GROUP BY ProductID,StandardCost
ORDER BY ProductID;