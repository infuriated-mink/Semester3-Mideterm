-- List all games and their genres
SELECT g.gameTitle, g.description, g.releaseDate, g.price, gr.genreName, gg.gameID
FROM Games g
JOIN GamesGenres gg ON g.gameID = gg.gameID
JOIN Genres gr ON gg.genreID = gr.genreID
GROUP BY g.gameTitle, g.description, g.releaseDate, g.price, gr.genreName, gg.gameID;