SELECT p.Productname
FROM products p
JOIN OrderDetails o On p.ProductID = o.ProductID
JOIN Orders od On o.OrderId = od.OrderID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT od.EmployeeID) = (SELECT COUNT(*) FROM employees);

SELECT c.CompanyName
FROM Customers c
JOIN Orders o On c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p on od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CompanyName
HAVING MAX(p.Unitprice) < 50 
AND NOT EXISTS (
SELECT 1
FROM Orders o2
JOIN OrderDetails od2 ON o2.OrderID = od2.OrderID
JOIN Products p2 ON od2.ProductID = p2.ProductID
WHERE o2.CustomerID = c.CustomerID
And p2.UnitPrice >= 50
);

SELECT e.Title, e.FirstName, e.LastName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName IN ('Gravad lax', 'Mishi kobe Niku')
GROUP BY e.EmployeeID, e.Title, e.FirstName;

SELECT e.FirstName, e.LastName, c.ContactName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.OrderID = s.OrderID
WHERE s.ShipName = 'Speedy Express'
AND s.ShipCity = 'Brussels';



