SELECT T1.ProductName
FROM Products AS T1
INNER JOIN OrderDetails AS T2
  ON T1.ProductID = T2.ProductID
INNER JOIN Orders AS T3
  ON T2.OrderID = T3.OrderID
GROUP BY
  T1.ProductName
HAVING
  COUNT(DISTINCT T3.EmployeeID) = (
    SELECT COUNT(*)
    FROM Employees
  );

SELECT T1.CompanyName
FROM Customers AS T1
INNER JOIN Orders AS T2
  ON T1.CustomerID = T2.CustomerID
INNER JOIN OrderDetails AS T3
  ON T2.OrderID = T3.OrderID
INNER JOIN Products AS T4
  ON T3.ProductID = T4.ProductID
GROUP BY
  T1.CustomerID,
  T1.CompanyName
HAVING
  MAX(T4.UnitPrice) < 50;
  
  SELECT DISTINCT T1.Title, T1.FirstName, T1.LastName
FROM Employees AS T1
INNER JOIN Orders AS T2
  ON T1.EmployeeID = T2.EmployeeID
INNER JOIN OrderDetails AS T3
  ON T2.OrderID = T3.OrderID
INNER JOIN Products AS T4
  ON T3.ProductID = T4.ProductID
WHERE
  T4.ProductName IN ('Gravad lax', 'Mishi Kobe Niku');
  
  SELECT DISTINCT T1.FirstName, T1.LastName, T2.CompanyName
FROM Employees AS T1
INNER JOIN Orders AS T3
  ON T1.EmployeeID = T3.EmployeeID
INNER JOIN Customers AS T2
  ON T3.CustomerID = T2.CustomerID
INNER JOIN Shippers AS T4
  ON T3.ShipVia = T4.ShipperID
WHERE
  T2.City = 'Bruxelles' AND T4.CompanyName = 'Speedy Express';
  
  SELECT DISTINCT T1.FirstName, T1.LastName, T1.Address, T1.City, T1.Region
FROM Employees AS T1
INNER JOIN Orders AS T2
  ON T1.EmployeeID = T2.EmployeeID
WHERE
  T2.ShipCountry = 'Belgium';