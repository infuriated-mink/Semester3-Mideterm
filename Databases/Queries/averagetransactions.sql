-- Average Transaction amount for each customer
SELECT t.customerID, c.firstName, c.lastName, ROUND(AVG(t.paymentAmount::numeric), 2) AS avgTransactionAmount
FROM Transactions t
JOIN  Customers c ON t.customerID = c.customerID
GROUP BY t.customerID, c.firstName, c.lastName;
