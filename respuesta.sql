-- ejercicio 1
SELECT DISTINCT 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, e.Address, e.City, e.Region
FROM Northwind.Employees e
JOIN Northwind.Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.ShipCountry = 'Belgium';

--  ejercicio 2
SELECT DISTINCT
  CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, c.CompanyName AS CustomerName, o.OrderID
FROM Northwind.Orders o
JOIN Northwind.Employees e ON o.EmployeeID = e.EmployeeID
JOIN Northwind.Customers c ON o.CustomerID = c.CustomerID
JOIN Northwind.Shippers s ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express'
  AND o.ShipCity = 'Bruxelles'
ORDER BY o.OrderID;

-- ejercicio 3
SELECT DISTINCT e.Title, e.FirstName, e.LastName
FROM Northwind.Employees e
JOIN Northwind.Orders o ON e.EmployeeID = o.EmployeeID
JOIN Northwind.OrderDetails od ON o.OrderID = od.OrderID
JOIN Northwind.Products p ON od.ProductID = p.ProductID
WHERE p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');

-- jercicio 4
SELECT c.CompanyName
FROM Northwind.Customers c
JOIN Northwind.Orders o ON c.CustomerID = o.CustomerID
JOIN Northwind.OrderDetails od ON o.OrderID = od.OrderID
JOIN Northwind.Products p ON od.ProductID = p.ProductID
GROUP BY c.CompanyName
HAVING MAX(p.UnitPrice) < 50;

-- ejercicio 5 ;
SELECT p.ProductName
FROM Northwind.Products p
JOIN Northwind.OrderDetails od ON p.ProductID = od.ProductID
JOIN Northwind.Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.EmployeeID) = (SELECT COUNT(*) FROM Northwind.Employees);