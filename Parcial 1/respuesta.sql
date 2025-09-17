
SELECT p.ProductName
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT e.EmployeeID) = (SELECT COUNT(*) FROM Employees);


SELECT c.CompanyName
FROM Customers c
JOIN Orders o       ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p      ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CompanyName
HAVING MAX(p.UnitPrice) < 50;



SELECT e.Title, e.FirstName, e.LastName
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p      ON od.ProductID = p.ProductID
    WHERE o.EmployeeID = e.EmployeeID
      AND p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku')
);


SELECT e.FirstName, e.LastName, c.CompanyName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'Bruxelles'
  AND o.ShipVia IN (
      SELECT s.ShipperID
      FROM Shippers s
      WHERE s.CompanyName = 'Speedy Express'
  );

  
SELECT e.FirstName, e.LastName, e.Address, e.City, e.Region
FROM Employees e
WHERE e.EmployeeID IN (
    SELECT o.EmployeeID
    FROM Orders o
    WHERE o.ShipCountry = 'Belgium'
);