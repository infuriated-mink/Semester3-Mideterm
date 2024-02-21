-- Purpose: Query to find the most popular genres of games sold in the store.
SELECT g.genreName, SUM(td.units) AS totalUnitsSold
FROM Genres g
JOIN GamesGenres gg ON g.genreID = gg.genreID
JOIN Inventory i ON gg.gameID = i.gameconsoleID
JOIN TransactionDetails td ON i.inventoryID = td.inventoryID
GROUP BY g.genreName
ORDER BY totalUnitsSold DESC;
