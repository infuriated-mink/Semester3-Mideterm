-- Purpose: To get the monthly revenue for the last 12 months.
SELECT DATE_TRUNC('month', t.transactionDate) AS month, SUM(t.paymentAmount) AS monthlyRevenue
FROM Transactions t
GROUP BY DATE_TRUNC('month', t.transactionDate)
ORDER BY month;
