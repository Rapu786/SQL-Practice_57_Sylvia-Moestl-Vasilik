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

--23.Prodcuts that need reordering,continued
--Now incorporate these fields -  UnitsInStock, ReoroderLevel,UnitsOnOrder,Discounted into calculation
-- We define products that need reodering as
-- UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel
-- AND the discontinued flag is false(0).

SELECT ProductID, ProductName,UnitsInStock,ReorderLevel,UnitsOnOrder,Discontinued
FROM Products
WHERE (UnitsInStock+UnitsOnOrder) <= ReorderLevel
AND Discontinued=0;

--24.Customer list by region
--List of all customer sorter by region
--Customers with no region(null) to be at the end,instaed of the top
--Within the same region, companies shoub be sorted by customerID

SELECT 
CustomerID, 
CompanyName, 
Region,
CASE WHEN Region is NULL THEN 1 ELSE 0 END AS isNULL
FROM Customers
ORDER BY isNull,Region;

--25. High Freight charges
--Return the three ship countries with highest average freight overall,
--in descending over by average freight

SELECT 
AVG(Freight) AS AverageFreight, 
ShipCountry 
FROM Orders
GROUP BY ShipCountry
ORDER BY AVG(Freight)desc 
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;



