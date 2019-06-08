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

