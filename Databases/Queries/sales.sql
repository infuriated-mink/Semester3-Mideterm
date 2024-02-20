-- sales that took place on 2023-02-25
SELECT t.transactionID, c.firstName, c.lastName, t.transactionDate, t.paymentAmount, s.storeName
FROM Transactions t
JOIN Customers c ON t.customerID = c.customerID
JOIN TransactionDetails td ON t.transactionID = td.transactionID
JOIN Inventory i ON td.inventoryID = i.inventoryID
JOIN Stores s ON i.storeID = s.storeID
WHERE t.transactionDate = '2023-02-25';