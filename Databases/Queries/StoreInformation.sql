-- Purpose: Get information about all stores, including the store name, address, phone number, and the name of the manager (if there is one).
SELECT s.storeName, a.street || ', ' || a.city || ', ' || a.province || ', ' || a.postalCode AS address, s.phone,
    CASE
        WHEN p.positionName = 'Manager' THEN CONCAT(e.firstName, ' ', e.lastName)
        ELSE 'No manager'
    END AS manager
FROM Stores s
JOIN Address a ON s.addressID = a.addressID
LEFT JOIN Employees e ON s.storeID = e.storeID
LEFT JOIN Positions p ON e.positionID = p.positionID AND p.positionName = 'Manager';
