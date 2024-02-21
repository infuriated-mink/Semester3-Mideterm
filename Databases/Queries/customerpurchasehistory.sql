-- Purpose: This query is used to retrieve the purchase history of a customer.
SELECT c.customerID, c.firstName, c.lastName, g.gameTitle, t.transactionDate, td.subtotalAmount
FROM Customers c
JOIN Transactions t ON c.customerID = t.customerID
JOIN TransactionDetails td ON t.transactionID = td.transactionID
JOIN Inventory i ON td.inventoryID = i.inventoryID
JOIN GamesConsoles gc ON i.gameconsoleID = gc.gameID 
JOIN Games g ON gc.gameID = g.gameID;