-- Identifies game with stock less than 10
SELECT g.gameTitle, i.quantity
FROM Games g
JOIN GamesConsoles gc ON g.gameID = gc.gameID
JOIN Inventory i ON gc.consoleID = i.gameconsoleID
WHERE i.quantity < 10;
