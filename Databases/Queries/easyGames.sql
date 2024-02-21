-- Purpose: Selects all games with a difficulty level of 1 and their prices.
SELECT g.gametitle, g.price, d.difficultylevel
FROM games g
JOIN difficulty d ON g.difficultyid = d.difficultyid
WHERE g.difficultyid = 1;