Use Northwind_SPP;
Go

--1.Which shippers do we have ?

SELECT * FROM shippers;

--2. Certain fields  from categories 

SELECT categoryName, Description FROM categories; 

--3.Sales Representatives 

SELECT FirstName, LastName, HireDate 
FROM Employees
WHERE Title = 'Sales Representative'; 

--4.Sales Representatives in the United States

SELECT FirstName, LastName, HireDate 
FROM Employees
WHERE Title = 'Sales Representative'
AND  COUNTRY = 'USA';

--5. Orders placed by specific Employee ID
SELECT OrderID, OrderDate 
FROM Orders
WHERE EmployeeID = 5;

--6.Suppliers and ContactTitles
SELECT SupplierID,ContactName,ContactTitle
FROM Suppliers
WHERE ContactTitle  
NOT IN 
(SELECT ContactTitle FROM Suppliers
Where ContactTitle ='Marketing Manager');

SELECT SupplierID,ContactName,ContactTitle
FROM Suppliers
WHERE ContactTitle <> 'Marketing Manager';

SELECT SupplierID,ContactName,ContactTitle
FROM Suppliers
WHERE ContactTitle != 'Marketing Manager';

-- 7.Products with "queso" in ProductName

SELECT ProductID,ProductName 
FROM Products
WHERE ProductName LIKE '%Queso%'; 


