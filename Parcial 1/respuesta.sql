SELECT p.ProductName
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT o.EmployeeID) = (SELECT COUNT(DISTINCT EmployeeID) FROM Orders);

SELECT c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CompanyName
HAVING MAX(p.UnitPrice) < 50;

SELECT DISTINCT e.Title, e.FirstName, e.LastName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName IN ('Gravad lax', 'Mishi Kobe Niku');

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS NombreEmpleado, c.CompanyName AS NombreCliente
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express' AND c.City = 'Bruxelles';
  
SELECT DISTINCT e.FirstName, e.LastName, e.Address, e.City, e.Region
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.ShipCountry = 'Belgium';