# Virtual Vault Database Project

---

## Business Idea

Welcome to Virtual Vault, your ultimate destination for all things gaming! At Virtual Vault, we specialize in providing a vast selection of video games to cater to every gamer's taste and preference. Whether you're a fan of action-packed adventures, thrilling sports simulations, immersive role-playing games, or mind-bending puzzles, we have something for everyone.

Our extensive collection of video games is meticulously curated to ensure that you have access to the latest releases as well as timeless classics. From blockbuster titles developed by renowned studios to indie gems created by up-and-coming developers, Virtual Vault offers a diverse range of gaming experiences to suit every budget and platform.

## Database Overview

This folder contains the implementation of a relational database system for a virtual video game store called Virtual Vault. The database schema consists of various tables to manage different aspects of the video game store, including inventory, customers, transactions, employees, and more.

![ERD](Databases/Semester3-Midterm.jpeg)

## Tables

### Defaults: Stores default settings such as the GST percentage.

- `gst`: Stores the default GST (Goods and Services Tax) percentage.

### Address: Contains addresses for stores and customers.

- `addressID`: Primary key for the address table.
- `street`: Street address.
- `city`: City name.
- `province`: Province name.
- `postalCode`: Postal code.

### Stores: Stores information about the physical stores, including name, address, phone, and email.

- `storeID`: Primary key for the stores table.
- `storeName`: Name of the store.
- `addressID`: Foreign key referencing the addressID in the Address table.
- `phone`: Store phone number.
- `email`: Store email address.

### Positions: Records different positions within the organization.

- `positionID`: Primary key for the positions table.
- `positionName`: Name of the position.
- `storeID`: Foreign key referencing the storeID in the Stores table.

### Difficulty: Stores difficulty levels for games.

- `difficultyID`: Primary key for the difficulty table.
- `difficultyLevel`: Difficulty level description.

### Customers: Stores information about customers, including name, address, email, and phone.

- `customerID`: Primary key for the customers table.
- `firstName`: Customer's first name.
- `lastName`: Customer's last name.
- `addressID`: Foreign key referencing the addressID in the Address table.
- `email`: Customer's email address.
- `phone`: Customer's phone number.

### Consoles: Contains information about gaming consoles.

- `consoleID`: Primary key for the consoles table.
- `consoleName`: Name of the game console.
- `manufacturer`: Manufacturer of the game console.
- `releaseDate`: Release date of the game console.

### Games: Stores details about video games, including title, description, release date, price, and difficulty.

- `gameID`: Primary key for the games table.
- `gameTitle`: Title of the game.
- `description`: Description of the game.
- `releaseDate`: Release date of the game.
- `price`: Price of the game.
- `difficultyID`: Foreign key referencing the difficultyID in the Difficulty table.

### Inventory: Tracks the inventory of games in each store, including quantity, purchase price, sale price, and date added.

- `inventoryID`: Primary key for the inventory table.
- `gameconsoleID`: Foreign key referencing the consoleID in the Consoles table.
- `quantity`: Quantity of the game in inventory.
- `purchasePrice`: Purchase price of the game.
- `salePrice`: Sale price of the game.
- `dateAdded`: Date when the game was added to inventory.
- `storeID`: Foreign key referencing the storeID in the Stores table.

### Transactions: Records details of transactions made by customers, including transaction date and payment amount.

- `transactionID`: Primary key for the transactions table.
- `customerID`: Foreign key referencing the customerID in the Customers table.
- `transactionDate`: Date of the transaction.
- `paymentAmount`: Amount paid in the transaction.

### TransactionDetails: Provides a detailed breakdown of transactions, including the game inventory sold, units purchased, and subtotal amount.

- `transactiondetailsID`: Primary key for the transactiondetails table.
- `transactionID`: Foreign key referencing the transactionID in the Transactions table.
- `inventoryID`: Foreign key referencing the inventoryID in the Inventory table.
- `units`: Number of units purchased.
- `subtotalAmount`: Subtotal amount for the transaction details.

### Genres: Stores different genres of video games.

- `genreID`: Primary key for the genres table.
- `genreName`: Name of the game genre.

### GamesGenres: Represents a many-to-many relationship between games and genres.

- `genreID`: Foreign key referencing the genreID in the Genres table.
- `gameID`: Foreign key referencing the gameID in the Games table.

### GamesConsoles: Represents a many-to-many relationship between games and consoles.

- `gameID`: Foreign key referencing the gameID in the Games table.
- `consoleID`: Foreign key referencing the consoleID in the Consoles table.

### Employees: Stores information about employees, including name, position, address, email, phone, and store assignment.

- `employeeID`: Primary key for the employees table.
- `firstName`: Employee's first name.
- `lastName`: Employee's last name.
- `positionID`: Foreign key referencing the positionID in the Positions table.
- `addressID`: Foreign key referencing the addressID in the Address table.
- `email`: Employee's email address.
- `phone`: Employee's phone number.
- `SIN`: Employee's Social Insurance Number.
- `storeID`: Foreign key referencing the storeID in the Stores table.

## Usage

1. **Database Setup**: Use the provided SQL scripts to set up and populate the database with initial data.
2. **Database Management**: Utilize the database management scripts to perform various operations such as querying, updating, and managing data.
3. **Integration**: Integrate the database with your application to store and retrieve relevant information for the video game store.

## Contributors

- [Vanessa Rice](https://github.com/infuriated-mink)
- [Evan Harte](https://github.com/evanharte)
- [Dillon Regular](https://github.com/vapidsoup)
- [Jacob Jesso](https://github.com/JeeecobTheAlien)

## License

This project is licensed under the [MIT License](LICENSE).
