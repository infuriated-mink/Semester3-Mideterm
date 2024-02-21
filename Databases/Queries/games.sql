-- Purpose: This file contains the SQL query to retrieve all the games from the database.
SELECT g.gameTitle, g.description, g.releaseDate, g.price, gr.genreName, gg.gameID
FROM Games g
JOIN GamesGenres gg ON g.gameID = gg.gameID
JOIN Genres gr ON gg.genreID = gr.genreID
GROUP BY g.gameTitle, g.description, g.releaseDate, g.price, gr.genreName, gg.gameID;