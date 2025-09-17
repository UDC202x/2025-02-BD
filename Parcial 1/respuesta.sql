use northwind;
-- pregunta 1
select f.ProductName as nombreProducto
from `OrderDetails` od
join Products f on od.ProductID = f.ProductID
join Orders p on od.OrderID = p.OrderID
group by f.ProductName, f.ProductID
having COUNT(distinct p.EmployeeID) = (
    select COUNT(*) from Employees
);
-- _______________________________________________

-- pregunta 3
select e.Title as titulo, e.FirstName as nombre
from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
join `OrderDetails` od on od.OrderID = o.OrderID
join Products p on p.ProductID = od.ProductID
where p.productName = 'Gravad Lax' 
   or p.productName = 'Mishi Kobe Niku'
group by e.Title, e.FirstName;

-- _______________________________________________
-- pregunta 4
select distinct p.contactName as nombreCliente, e.firstName, e.lastname 
from Employees e, Customers p, orders m where m.ShipCity = 
'Bruxelles' and m.shipVia =1 
and p.CustomerID = m.CustomerID
and e.EmployeeId = m.EmployeeID 
-- _______________________________________________
-- pregunta 5
select distinct o.city, o.region, o.Address, o.firstName,o.LastName 
from Employees o 
join orders p on o.EmployeeID=p.EmployeeID 
where ShipCountry = 'Belgium' 
-- _______________________________________________
