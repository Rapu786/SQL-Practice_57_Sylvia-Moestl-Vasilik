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

