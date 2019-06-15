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

--7. Product List Price : how many price changes ?

SELECT 
Format(StartDate,'yyyy/MM') AS ProdutListPriceMonth,
COUNT(*) AS TotalRows
FROM ProductListPriceHistory
GROUP BY Format(StartDate,'yyyy/MM')
ORDER BY ProdutListPriceMonth;

--8. Product List Price: months with no price changes?

SELECT 
Format(CAST(a.CalendarMonth AS DATE),'yyyy/MM') AS CalenderMonth,
COUNT(*) AS TotalRows
FROM Calendar a
Left Join ProductListPriceHistory b
ON a.CalendarMonth = b.StartDate
GROUP BY Format(CAST(a.CalendarMonth AS DATE),'yyyy/MM')
ORDER BY TotalRows;


--9. Current list price of every product

SELECT a.ProductID, b.ListPrice
FROM Product a
Inner Join ProductListPriceHistory b
On a.ProductID = b.ProductID
WHERE b.EndDate IS NULL
GROUP BY a.ProductID,b.ListPrice
ORDER BY a.ProductID;

--10. Products without a list price history

SELECT ProductID, 
ProductName
FROM Product
WHERE ProductID NOT IN 
(SELECT 
 ProductID FROM ProductListPriceHistory)
 ORDER BY ProductID;

	--Using left join

SELECT a.ProductID, a.ProductName
FROM Product a
Left Join ProductListPriceHistory b
ON a.ProductID = b.ProductID
WHERE b.ProductID IS NULL
ORDER BY a.ProductID;

