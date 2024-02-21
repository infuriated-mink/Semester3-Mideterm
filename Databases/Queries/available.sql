-- Purpose: This query is used to find the available stock of a game for a specific console in all stores.
SELECT g.gameTitle, g.description, c.consoleName, gc.consoleID, i.quantity, s.storeName, a.street, a.city, a.province, a.postalCode
FROM Games g
JOIN GamesConsoles gc ON g.gameID = gc.gameID
JOIN Consoles c ON gc.consoleID = c.consoleID
JOIN Inventory i ON gc.consoleID = i.gameconsoleID
JOIN Stores s ON i.storeID = s.storeID
JOIN Address a ON s.addressID = a.addressID
WHERE g.gameTitle = 'Dark Souls' AND c.consoleName = 'Xbox One';