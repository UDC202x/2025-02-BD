#ejercicio 5
select distinct firstname,address,city,region
from employees e inner join orders o
on e.employeeid = o.employeeid
where o.shipcountry = 'Belgium';

#ejercicio 4
select e.firstName,c.companyName
from orders o
inner join customers c 
on o.customerid = c.customerid
inner join employees e 
on o.employeeid = e.employeeid
inner join shippers s 
on o.shipvia = s.shipperid
where s.companyname = 'Speedy Express'
  and c.city = 'Bruxelles';

#ejercicio 1
select p.productname
from products p
inner join Orderdetails od on p.ProductID = od.Productid
inner join orders o on od.orderid = o.orderid
inner join employees e on o.employeeid = e.employeeid
group by p.productid, p.productName
having count(distinct e.employeeid) = (select count(*) from employees);

#ejercicio 2
SELECT c.CompanyName
FROM Customers c
inner join Orders o on c.Customerid = o.Customerid
inner join orderdetails od on o.Orderid = od.Orderid
inner join Products p on od.Productid = p.Productid
group by c.Customerid, c.CompanyName
having max(p.UnitPrice) < 50;
