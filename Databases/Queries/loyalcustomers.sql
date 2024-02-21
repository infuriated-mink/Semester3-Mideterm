-- Purpose: This query will return the top 10 customers who have spent the most money at the store.
SELECT c.customerID, c.firstName, c.lastName, SUM(t.paymentAmount) AS totalSpent
FROM Customers c
JOIN Transactions t ON c.customerID = t.customerID
GROUP BY c.customerID, c.firstName, c.lastName
ORDER BY totalSpent DESC
LIMIT 10;
