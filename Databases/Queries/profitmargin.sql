-- profit margin for each game
SELECT g.gameID, g.gameTitle, (SUM(td.subtotalAmount) - SUM(i.purchasePrice)) AS profitMargin
FROM Games g
JOIN GamesConsoles gc ON g.gameID = gc.gameID
JOIN Inventory i ON gc.consoleID = i.gameconsoleID
JOIN TransactionDetails td ON i.inventoryID = td.inventoryID
GROUP BY g.gameID, g.gameTitle;
