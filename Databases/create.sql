CREATE TABLE Defaults (
  gst INT
);

CREATE TABLE Address (
  addressID SERIAL PRIMARY KEY,
  street VARCHAR,
  city VARCHAR,
  province VARCHAR,
  postalCode VARCHAR
);

CREATE TABLE Stores (
  storeID SERIAL PRIMARY KEY,
  storeName VARCHAR,
  addressID INT REFERENCES Address (addressID),
  phone VARCHAR,
  email VARCHAR
);

CREATE TABLE Positions (
  positionID SERIAL PRIMARY KEY,
  positionName VARCHAR,
  storeID INT REFERENCES Stores (storeID)
);

CREATE TABLE Difficulty (
  difficultyID SERIAL PRIMARY KEY,
  difficultyLevel VARCHAR
);

CREATE TABLE Customers (
  customerID SERIAL PRIMARY KEY,
  firstName VARCHAR,
  lastName VARCHAR,
  addressID INT REFERENCES Address (addressID),
  email VARCHAR,
  phone VARCHAR
);

CREATE TABLE Consoles (
  consoleID SERIAL PRIMARY KEY,
  consoleName VARCHAR,
  manufacturer VARCHAR,
  releaseDate DATE
);

CREATE TABLE Games (
  gameID SERIAL PRIMARY KEY,
  gameTitle VARCHAR,
  description VARCHAR,
  releaseDate DATE,
  price MONEY,
  difficultyID INT REFERENCES Difficulty (difficultyID)
);

CREATE TABLE Inventory (
  inventoryID SERIAL PRIMARY KEY,
  gameconsoleID INT REFERENCES Consoles (consoleID),
  quantity INT,
  purchasePrice MONEY,
  salePrice MONEY,
  dateAdded DATE,
  storeID INT REFERENCES Stores (storeID)
);

CREATE TABLE Transactions (
  transactionID SERIAL PRIMARY KEY,
  customerID INT REFERENCES Customers (customerID),
  transactionDate DATE,
  paymentAmount MONEY
);

CREATE TABLE TransactionDetails (
  transactiondetailsID SERIAL PRIMARY KEY,
  transactionID INT REFERENCES Transactions (transactionID),
  inventoryID INT REFERENCES Inventory (inventoryID),
  units INT,
  subtotalAmount MONEY
);

CREATE TABLE Genres (
  genreID SERIAL PRIMARY KEY,
  genreName VARCHAR
);

CREATE TABLE GamesGenres (
  genreID INT REFERENCES Genres (genreID),
  gameID INT REFERENCES Games (gameID),
  PRIMARY KEY (genreID, gameID)
);

CREATE TABLE GamesConsoles (
  gameID INT REFERENCES Games (gameID),
  consoleID INT REFERENCES Consoles (consoleID),
  PRIMARY KEY (gameID, consoleID)
);

CREATE TABLE Employees (
  employeeID SERIAL PRIMARY KEY,
  firstName VARCHAR,
  lastName VARCHAR,
  positionID INT REFERENCES Positions (positionID),
  addressID INT REFERENCES Address (addressID),
  email VARCHAR,
  phone VARCHAR,
  SIN VARCHAR,
  storeID INT REFERENCES Stores (storeID)
);
