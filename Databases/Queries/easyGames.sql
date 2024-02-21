-- A query that searches for games with a difficulty level of 1 (easy) and returns the game title, price, and difficulty level.
SELECT g.gametitle, g.price, d.difficultylevel
FROM games g
JOIN difficulty d ON g.difficultyid = d.difficultyid
WHERE g.difficultyid = 1;