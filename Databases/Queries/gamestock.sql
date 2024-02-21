-- checks if a game exists in the inventory
SELECT
    CASE
        WHEN EXISTS (SELECT 5 FROM Inventory WHERE gameconsoleID = 1) THEN 'Game exists in inventory'
        ELSE 'Game does not exist in inventory'
    END AS inventory_status;
