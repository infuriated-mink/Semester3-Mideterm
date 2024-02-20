-- Finds employees at store 25
SELECT e.firstName, e.lastName, p.positionName
FROM Employees e
JOIN Positions p ON e.positionID = p.positionID
WHERE e.storeID = 25;