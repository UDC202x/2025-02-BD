select distinct productname
from products p 
inner join orderdetails o on o.productid = p.productid 
inner join orders on o.orderid = orders.orderid
inner join employees e on e.employeeid=orders.employeeid;

select distinct companyName
from customers c
 join orders o on c.customerid = o.customerid
 join orderdetails as od on o.orderid = od.orderid
 join products p on od.ProductID = p.ProductID
where p.UnitPrice <50;