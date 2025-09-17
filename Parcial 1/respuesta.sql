SELECT p.ProductName
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY p.ProductName
HAVING COUNT(DISTINCT e.EmployeeID) = (SELECT COUNT(*) FROM Employees);

SELECT c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CompanyName
HAVING MAX(p.UnitPrice) < 50;

SELECT DISTINCT e.Title, e.FirstName, e.LastName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');

SELECT e.FirstName 'Nombre Empleado', c.ContactName 'Nombre Cliente'
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express'  AND c.City = 'Bruxelles';


SELECT DISTINCT e.FirstName nombre,
       e.Address direccion, e.City ciudad, e.Region
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.ShipCountry = 'Belgium';



