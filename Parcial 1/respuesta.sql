SELECT p.ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT e.EmployeeID
    FROM Employees e
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        WHERE o.EmployeeID = e.EmployeeID
        AND od.ProductID = p.ProductID
    )
);

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
WHERE p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,c.CompanyName AS CustomerName 
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express'
  AND c.City = 'Bruxelles';

SELECT DISTINCT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, e.Address, e.City, e.Region 
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.ShipCountry = 'Belgium';