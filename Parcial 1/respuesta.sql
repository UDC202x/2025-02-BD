
SELECT DISTINCT e.firstname, e.address, e.city, e.region
FROM employees AS e
JOIN orders AS o ON e.employeeid = o.employeeid
WHERE o.shipcountry LIKE 'Belgium';

SELECT DISTINCT e.firstname, c.contactname FROM orders AS o
JOIN employees AS e ON o.employeeid = e.employeeid
JOIN customers AS c ON o.customerid = c.customerid
JOIN shippers AS s ON o.shipvia = s.shipperid
WHERE s.companyname LIKE 'Speedy Express'
  AND c.city LIKE 'Bruxelles';


SELECT DISTINCT customers.contactname FROM customers
JOIN orders ON customers.customerid = orders.customerid
WHERE NOT EXISTS (
    SELECT 1
    FROM orderdetails
    WHERE orders.orderid = orderdetails.orderid
      AND orderdetails.unitprice >= 50
);

SELECT e.firstname, e.title FROM orders AS o
JOIN orderdetails AS od ON o.orderid = od.orderid
JOIN employees AS e ON e.employeeid = o.employeeid
JOIN products AS p ON od.orderid = p.productid
WHERE p.productname LIKE 'Gravad Lax' OR p.productname LIKE 'Mishi Kobe Niku';
