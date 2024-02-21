-- Purpose: Get the total revenue for each store.
SELECT s.storeName, SUM(t.paymentAmount) AS totalRevenue
FROM Stores s
JOIN Inventory i ON s.storeID = i.storeID
JOIN TransactionDetails td ON i.inventoryID = td.inventoryID
JOIN Transactions t ON td.transactionID = t.transactionID
GROUP BY s.storeName;