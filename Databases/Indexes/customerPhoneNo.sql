-- Purpose: Create a composite index on the phone, firstName, lastName, and customerID columns of the Customers table.
CREATE INDEX idx_customer_phone_purchases ON Customers (phone, firstName, lastName, customerID);
