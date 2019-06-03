Use Northwind_SPP;
GO

-- 20.Categories, and the total products in each category
-- For this probem, we'd like to see the total number of products in each category
-- Sort the results by the total numbers of products, in descending order

SELECT a.CategoryName, Count(b.CategoryID) AS TotalProducts
FROM Categories a
Inner JOIN Products b
ON a.CategoryID = b.CategoryID
GROUP BY a.CategoryName
ORDER BY TotalProducts DESC;

--21.Total Customers per country/city

SELECT Country, City, Count(CustomerID) AS TotalCustomers
FROM Customers
Group BY Country,City
Order By TotalCustomers DESC;

--22.Prodcuts that need reordering 
-- Use fields UnitsInStock and ReoroderLevel, where UnitsInStock is less than or equal to the ReorderLevel
-- Sort by ProductID

SELECT ProductID, ProductName,UnitsInStock,ReorderLevel
FROM Products
WHERE UnitsInStock <= ReorderLevel
Order BY ProductID;


