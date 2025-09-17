SELECT p.ProductName FROM Products p JOIN OrderDetails od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName HAVING COUNT(DISTINCT o.EmployeeID) = (SELECT COUNT(*) FROM Employees);
SELECT c.CustomerID, c.CompanyName,c.ContactName FROM Customers c JOIN Orders o ON o.CustomerID = c.CustomerID JOIN OrderDetails od ON od.OrderID= o.OrderID 
JOIN Products p ON p.ProductID = od.ProductID GROUP BY c.CustomerID, c.CompanyName HAVING MAX(p.UnitPrice) <= 50;
SELECT DISTINCT e.Title, e.FirstName, e.LastName FROM Employees e JOIN Orders o ON o.EmployeeID = e.EmployeeID 
JOIN OrderDetails od ON od.OrderID =o.OrderID JOIN Products p ON p.ProductID  = od.ProductID WHERE p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');
SELECT DISTINCT e.LastName, e.FirstName, c.ContactName FROM Employees e JOIN Orders o ON o.EmployeeID = e.EmployeeID JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID WHERE s.CompanyName ='Speedy Express' AND c.City = 'Bruxelles';
SELECT DISTINCT e.FirstName,e.LastName,e.Address,e.City,e.Region FROM Employees e JOIN Orders o ON o.EmployeeID = e.EmployeeID WHERE o.ShipCountry = 'Belgium';

