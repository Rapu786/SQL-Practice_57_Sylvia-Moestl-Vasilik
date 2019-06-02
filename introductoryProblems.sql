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
where EmployeeID = 5;



