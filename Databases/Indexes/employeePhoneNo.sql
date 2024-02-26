-- Purpose: Create a composite index on the phone, firstName, lastName, positionID, storeID, and employeeID columns of the Employees table.
CREATE INDEX idx_employee_phone_info ON Employees (phone, firstName, lastName, positionID, storeID, employeeID);
