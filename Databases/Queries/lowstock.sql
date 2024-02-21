-- Purpose: This query is used to find all games that have a quantity of less than 10 in the inventory.
SELECT g.gameTitle, i.quantity
FROM Games g
JOIN GamesConsoles gc ON g.gameID = gc.gameID
JOIN Inventory i ON gc.consoleID = i.gameconsoleID
WHERE i.quantity < 10;
