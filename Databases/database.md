# Virtual Vault Database Project
---

## Business Idea

Welcome to Virtual Vault, your ultimate destination for all things gaming! At Virtual Vault, we specialize in providing a vast selection of video games to cater to every gamer's taste and preference. Whether you're a fan of action-packed adventures, thrilling sports simulations, immersive role-playing games, or mind-bending puzzles, we have something for everyone.

Our extensive collection of video games is meticulously curated to ensure that you have access to the latest releases as well as timeless classics. From blockbuster titles developed by renowned studios to indie gems created by up-and-coming developers, Virtual Vault offers a diverse range of gaming experiences to suit every budget and platform.

## Database Overview

This folder contains the implementation of a relational database system for a virtual video game store called Virtual Vault. The database schema consists of various tables to manage different aspects of the video game store, including inventory, customers, transactions, employees, and more.

## Tables
**Defaults**: Stores default settings such as the GST percentage.
- **Address**: Contains addresses for stores and customers.
- **Stores**: Stores information about the physical stores, including name, address, phone, and email.
- **Positions**: Records different positions within the organization.
- **Difficulty**: Stores difficulty levels for games.
- **Customers**: Stores information about customers, including name, address, email, and phone.
- **Consoles**: Contains information about gaming consoles.
- **Games**: Stores details about video games, including title, description, release date, price, and difficulty.
- **Inventory**: Tracks the inventory of games in each store, including quantity, purchase price, sale price, and date added.
- **Transactions**: Records details of transactions made by customers, including transaction date and payment amount.
- **TransactionDetails**: Provides a detailed breakdown of transactions, including the game inventory sold, units purchased, and subtotal amount.
- **Genres**: Stores different genres of video games.
- **GamesGenres**: Represents a many-to-many relationship between games and genres.
- **GamesConsoles**: Represents a many-to-many relationship between games and consoles.
- **Employees**: Stores information about employees, including name, position, address, email, phone, and store assignment.
### Defaults
- `gst`: Stores the default GST (Goods and Services Tax) percentage.

### Address
- `addressID`: Primary key for the address table.
- `street`: Street address.
- `city`: City name.
- `province`: Province name.
- `postalCode`: Postal code.

### Stores
- `storeID`: Primary key for the stores table.
- `storeName`: Name of the store.
- `addressID`: Foreign key referencing the addressID in the Address table.
- `phone`: Store phone number.
- `email`: Store email address.

### Positions
- `positionID`: Primary key for the positions table.
- `positionName`: Name of the position.
- `storeID`: Foreign key referencing the storeID in the Stores table.

### Difficulty
- `difficultyID`: Primary key for the difficulty table.
- `difficultyLevel`: Difficulty level description.

### Customers
- `customerID`: Primary key for the customers table.
- `firstName`: Customer's first name.
- `lastName`: Customer's last name.
- `addressID`: Foreign key referencing the addressID in the Address table.
- `email`: Customer's email address.
- `phone`: Customer's phone number.

### Consoles
- `consoleID`: Primary key for the consoles table.
- `consoleName`: Name of the game console.
- `manufacturer`: Manufacturer of the game console.
- `releaseDate`: Release date of the game console.

### Games
- `gameID`: Primary key for the games table.
- `gameTitle`: Title of the game.
- `description`: Description of the game.
- `releaseDate`: Release date of the game.
- `price`: Price of the game.
- `difficultyID`: Foreign key referencing the difficultyID in the Difficulty table.

### Inventory
- `inventoryID`: Primary key for the inventory table.
- `gameconsoleID`: Foreign key referencing the consoleID in the Consoles table.
- `quantity`: Quantity of the game in inventory.
- `purchasePrice`: Purchase price of the game.
- `salePrice`: Sale price of the game.
- `dateAdded`: Date when the game was added to inventory.
- `storeID`: Foreign key referencing the storeID in the Stores table.

### Transactions
- `transactionID`: Primary key for the transactions table.
- `customerID`: Foreign key referencing the customerID in the Customers table.
- `transactionDate`: Date of the transaction.
- `paymentAmount`: Amount paid in the transaction.

### TransactionDetails
- `transactiondetailsID`: Primary key for the transactiondetails table.
- `transactionID`: Foreign key referencing the transactionID in the Transactions table.
- `inventoryID`: Foreign key referencing the inventoryID in the Inventory table.
- `units`: Number of units purchased.
- `subtotalAmount`: Subtotal amount for the transaction details.

### Genres
- `genreID`: Primary key for the genres table.
- `genreName`: Name of the game genre.

### GamesGenres
- `genreID`: Foreign key referencing the genreID in the Genres table.
- `gameID`: Foreign key referencing the gameID in the Games table.

### GamesConsoles
- `gameID`: Foreign key referencing the gameID in the Games table.
- `consoleID`: Foreign key referencing the consoleID in the Consoles table.

### Employees
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
