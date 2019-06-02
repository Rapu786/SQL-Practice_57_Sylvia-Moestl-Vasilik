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

--8.Orders shipping to France or Belguim

SELECT OrderID,CustomerID,ShipCountry
FROM Orders
WHERE ShipCountry='France' or ShipCountry='Belgium';

SELECT OrderID,CustomerID,ShipCountry
FROM Orders
WHERE ShipCountry In ('France','Belgium');

-- 9.Orders shipping to any country in Latin America
SELECT OrderID,CustomerID,ShipCountry
FROM Orders
WHERE ShipCountry In ('Brazil','Mexico','Argentina','Venezuela');

--10.Employees, in order of age
SELECT FirstName,LastName,Title,BirthDate
FROM Employees
Order BY BirthDate ASC ;

--11.Showing only the Date with a DateTimeField
-- Same as above, but the birthdate column shouldn't have time only date
-- Convert a datetime column to a date column

SELECT FirstName,LastName,Title,CAST(BirthDate AS DATE) AS BirthDate
FROM Employees
Order BY BirthDate ASC ;

SELECT FirstName,LastName,Title,CONVERT(DATE,BirthDate) AS BirthDate
FROM Employees
Order BY BirthDate ASC ;

--12.Employees full Name
SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Employees;

--13.OrderDetails amount per line item
--In the orderDetails table, we havefileds UnitePrice and Quantity. 
--Create a new field, TotalPrice, that multiple these two together.
--In addition, show the orderID,ProductID, UnitPrice, and Quantity, order by OrderID and ProductID

SELECT OrderID, ProductID, UnitPrice,Quantity, (UnitPrice*Quantity) AS TotalPrice
FROM OrderDetails
Order BY OrderID,ProductID;

--14.How many customers ?
--Do not rely on getting the entire records i.e *

SELECT count(customerID) as TotalCustomers from Customers;

--15.When was the first order ?

SELECT Min(OrderDate) AS FirstOrder
FROM Orders;

--16.Countries where there are customers

SELECT Country from Customers
Group BY Country;

--17.Contact titles for customers

SELECT ContactTitle, Count(ContactTitle) AS TotalContacttitle
FROM Customers
GROUP BY ContactTitle
Order By TotalContacttitle Desc;

--18.Products with associated supplier names

SELECT a.ProductID, a.ProductName,b.CompanyName
FROM Products a
Inner Join Suppliers b
on a.SupplierId = b.SupplierId
ORDER BY a.ProductID;



