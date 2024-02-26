# FullStack JavaScript Project

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Project Overview

Welcome to our FullStack JavaScript project! This project is designed to showcase the integration of JavaScript technologies across the backend to build a fully functional application for managing user tokens.

## Technologies Used

### Backend

- **Node.js**: The backend runtime environment for executing JavaScript code.
- **Express.js**: A web application framework for Node.js, used for routing and handling HTTP requests.
- **fs (File System)**: Node.js module for reading from and writing to files.
- **EventEmitter**: Node.js class for handling custom events.
- **date-fns**: A JavaScript date utility library for parsing and formatting dates.
- **crc32**: A JavaScript library for calculating CRC32 checksums.

## Project Structure

The project consists of the following main components:

1. **Backend**:
   - `server.js`: Node.js script for setting up the Express server and defining API routes.
   - `userToken.js`: Module containing functions to manage user tokens, including token generation, updating, fetching, and counting.
   - `tokens.json`: JSON file for storing token records.

## Getting Started

To run the project locally, follow these steps:

1. Clone the repository to your local machine.

2. Install Node.js if you haven't already.

3. Navigate to the project directory in your terminal.

```
cd FSJS
```

4. Install project dependencies by running:

```
npm install
```

5. Start the server by running:

```
node server.js
```

6. Access the application in your API testing tool or browser.

## Usage

Once the application is running, you can perform the following actions:

- Generate a new token for a user.
- View the list of all tokens.
- Count the total number of tokens in the system.
- Update an existing token record.
- Fetch a token record for a specific user.
- Search for tokens based on username, email, or phone number.

## Contributors

- [Vanessa Rice](https://github.com/infuriated-mink)
- [Dillon Regular](https://github.com/vapidsoup)
- [Evan Harte](https://github.com/evanharte)
- [Jacob Jesso](https://github.com/JeeecobTheAlien)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
