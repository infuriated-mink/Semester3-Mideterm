-- Index for the games table to improve the performance of the search query. 
CREATE INDEX idx_games_description_info ON games (gametitle, description, price);