-- Purpose: This query is used to find the matching addresses between employees and customers.
SELECT emp.firstname, emp.lastname, emp.addressid, cust.firstname, cust.lastname, cust.addressid
FROM employees emp
JOIN customers cust  ON emp.addressid = cust.addressid
GROUP BY cust.addressid, emp.addressid, cust.customerid, emp.employeeid;
