-- POSTGRESQL
-- 1. Select the name of the products sold by all employees
select 
  e.employeeid as id,
  e.firstname as Nombre,
  e.lastname as Apellido,
  string_agg(distinct p.productname, ', ' order by p.productname) as Productos
from employees e
left join orders o on e.employeeid = o.employeeid
left join orderdetails od on o.orderid = od.orderid
left join products p on p.productid = od.productid
group by e.employeeid, e.firstname, e.lastname;

-- 2. Select the name of the customers who purchased only products with a price less than 50
select 
  distinct c.contactname as Nombre
  --,p.productname as Producto,
  --p.unitprice as "Precio Unitario"
from customers c
inner join orders o on o.customerid = c.customerid
inner join orderdetails od on od.orderid = o.orderid
inner join products p on p.productid = od.productid
where p.unitprice < 50;

-- 3. Select the title and name of the employees who have sold at least one of the 'Gravad Lax' or 'Mishi Kobe' products.
 select e.title as "Título", 
 (e.firstname || ' ' || e.lastname) as Nombre
from employees e
where exists (
  select 1
  from orders o
  join orderdetails od on o.orderid = od.orderid
  join products p on p.productid = od.productid
  where o.employeeid = e.employeeid
    and (p.productname like '%Gravad Lax%' or p.productname like '%Mishi Kobe%')
);

-- Select the employee name and customer name for orders sent by Speedy Express to customers living in Brussels
select
    (e.firstname || ' ' || e.lastname) as "Nombre de empleado"
from employees e 
where exists(
    select 1 from orders o 
    inner join shippers s on o.shipvia = s.shipperid
    inner join customers c on c.customerid = o.customerid
    where 
        o.employeeid = e.employeeid
        and s.companyname like '%Speedy Express%'
        and c.city like '%Brussels%' -- Vacia porque brussels no existe, si se camia por bruxells salen 2 pero la consulta es brussels
);

-- Select the name, address, city and region of the employees who have placed orders for elivery in Belgium
select distinct
  (e.firstname || ' ' || e.lastname) as "Nombre completo",
  e.address as Dirección,
  e.city as Ciudad,
  e.region as Region
from employees e
join orders o on e.employeeid = o.employeeid
where o.shipcountry = 'Belgium';
-- o tambien
-- where o.shipcountry like '%Belgium%';