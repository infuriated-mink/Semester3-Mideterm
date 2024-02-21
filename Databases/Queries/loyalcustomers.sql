-- Determines the top 10 customers who have made the most purchases
SELECT c.customerID, c.firstName, c.lastName, SUM(t.paymentAmount) AS totalSpent
FROM Customers c
JOIN Transactions t ON c.customerID = t.customerID
GROUP BY c.customerID, c.firstName, c.lastName
ORDER BY totalSpent DESC
LIMIT 10;
