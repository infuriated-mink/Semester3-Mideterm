-- Query to retrieve employee information based on phone number
SELECT firstName, lastName, positionID, phone, storeID
FROM Employees
WHERE phone = '957-987-9735';
