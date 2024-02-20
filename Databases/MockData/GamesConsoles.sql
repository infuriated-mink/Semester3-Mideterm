INSERT INTO GamesConsoles (gameID, consoleID)
SELECT g.gameID, c.consoleID
FROM Games g
CROSS JOIN Consoles c;