-- Purpose: To get the first name, last name, and position name of all employees at a specific store.
SELECT e.firstName, e.lastName, p.positionName
FROM Employees e
JOIN Positions p ON e.positionID = p.positionID
WHERE e.storeID = 25;