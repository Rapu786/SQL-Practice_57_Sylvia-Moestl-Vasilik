-- 32. High-value customers

SELECT a.CustomerID, a.CompanyName, b.OrderID, SUM(C.UnitPrice * c.Quantity) AS TotalOrderAmount
FROM Customers a
Inner Join Orders b
ON b.CustomerID = a.CustomerID
Inner Join OrderDetails c
ON c.OrderID = b.OrderID
WHERE YEAR(b.OrderDate) = 2016
GROUP BY a.CustomerID,a.CompanyName, b.OrderID
HAVING SUM(c.UnitPrice * c.Quantity)>10000
ORDER BY TotalOrderAmount DESC;

--33.High-value customers- total orders

SELECT a.CustomerID, a.CompanyName, SUM(C.UnitPrice * c.Quantity) AS TotalOrderAmount
FROM Customers a
Inner Join Orders b
ON b.CustomerID = a.CustomerID
Inner Join OrderDetails c
ON c.OrderID = b.OrderID
WHERE YEAR(b.OrderDate) = 2016
GROUP BY a.CustomerID,a.CompanyName
HAVING SUM(c.UnitPrice * c.Quantity)>15000
ORDER BY TotalOrderAmount DESC;

--34.High-value customers-with discount
-- Change above query to use discount
--Discount column is in %

SELECT a.CustomerID, a.CompanyName,SUM(C.UnitPrice * c.Quantity) AS Totals_without_discount ,SUM(C.UnitPrice * c.Quantity *(1-c.Discount)) AS Totals_with_discount
FROM Customers a
Inner Join Orders b
ON b.CustomerID = a.CustomerID
Inner Join OrderDetails c
ON c.OrderID = b.OrderID
WHERE YEAR(b.OrderDate) = 2016
GROUP BY a.CustomerID,a.CompanyName
HAVING SUM(C.UnitPrice * c.Quantity *(1-c.Discount))>10000
ORDER BY Totals_with_discount DESC;


--35. Month-end orders


--Initial wrong quety would return any maximum date availble in the records rater than the exact last date.
SELECT employeeID, OrderID, Orderdate
FROM Orders
Where OrderDate IN (Select MAX(OrderDate) FROM Orders GROUP BY MONTH(OrderDate),YEAR(OrderDate))
ORDER BY EmployeeID,OrderDate;

SELECT employeeID, OrderID, Orderdate
FROM Orders
Where OrderDate = EOMONTH(OrderDate)
ORDER BY EmployeeID,OrderDate;

SELECT employeeID, OrderID, Orderdate
FROM Orders
Where OrderDate = Last_Day(OrderDate)
ORDER BY EmployeeID,OrderDate;

--36 Orders with many line items

SELECT TOP(10) OrderID, COUNT(ProductID) AS TotalOrderDetais
FROM OrderDetails
GROUP BY OrderID
ORDER BY COUNT(ProductID)  DESC;

--37.Orders-random assortment

SELECT TOP 2 percent OrderID 
FROM Orders
ORDER BY NewID();
--Since 2% of 803 rows is 17, you'll get the first 17 records of the table
	--MYSQL Version

SELECT OrderID
FROM Orders
Order By Rand()
Limit 10;

--38.Orders-accidental double-entry

SELECT 
OrderID, Quantity
FROM OrderDetails 
WHERE Quantity >=60
GROUP BY OrderID, Quantity
HAVING Count(*)>1
ORDER BY OrderID;





