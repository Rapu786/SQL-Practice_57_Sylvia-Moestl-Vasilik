-- 32. High-value customers

SELECT a.CustomerID, a.CompanyName, c.OrderID,SUM(b.UnitPrice * b.Quantity) AS TotalOrderAmount
FROM Customers a
Inner JOIN Orders c
ON a.CustomerID = c.CustomerID
INNER JOIN OrderDetails b
ON b.OrderID = c.OrderID
Where YEAR(c.OrderDate) = 2016
GROUP BY a.CustomerID, a.CompanyName, c.OrderID
HAVING SUM(Quantity * UnitPrice) > 10000
ORDER BY TotalOrderAmount DESC;