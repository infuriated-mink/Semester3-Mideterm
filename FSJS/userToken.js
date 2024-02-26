/*********
 * Created by Dillon Regular on 2024-02-21.
 * Purpose of this module is to provide a set of functions to manage user tokens.
 * The module will provide the following functions:
 * - tokenApp() - a function to manage the CLI options for the token module
 * - newToken(username) - a function to generate a new token for a user
 * - tokenCount() - a function to count the number of tokens in the system
 * - fetchRecord(username) - a function to fetch a token record for a user
 * - searchToken() - a function to search for a token
 * - updateToken(argv) - a function to update a token record for a user
 * - tokenList() - a function to list all tokens
 * commands:
 * - node myapp.js token --count
 * - node myapp.js token --list
 * - node myapp.js token --new username
 * - node myapp.js token --upd p <username> <phone>
 * - node myapp.js token --upd e <username> <email>
 * - node myapp.js token --fetch username
 * - myapp token --search u <username>
 * - myapp token --search e <email>
 * - myapp token --search p <phone>
 * -
 */
const fs = require("fs");
const path = require("path");
const { format } = require("date-fns");
const crc32 = require("crc/crc32");

const TOKENS_FILE_PATH = path.join(__dirname, "json", "tokens.json");

// Function to generate a new token for a user
function newToken(username, callback) {
  const newToken = {
    created: format(new Date(), "yyyy-MM-dd HH:mm:ss"),
    username: username,
    email: "user@example.com",
    phone: "5556597890",
    token: crc32(username).toString(16),
    expires: format(new Date(), "yyyy-MM-dd HH:mm:ss"),
    confirmed: "tbd",
  };

  // Read existing tokens from file
  fs.readFile(TOKENS_FILE_PATH, "utf-8", (error, data) => {
    if (error && error.code !== "ENOENT") {
      console.error("Error reading tokens:", error);
      return callback(error);
    }

    let tokens = [];
    if (data) {
      try {
        tokens = JSON.parse(data);
      } catch (parseError) {
        console.error("Error parsing tokens JSON:", parseError);
        return callback(parseError);
      }
    }

    // Add new token
    tokens.push(newToken);

    // Write updated tokens back to file
    fs.writeFile(TOKENS_FILE_PATH, JSON.stringify(tokens, null, 2), (err) => {
      if (err) {
        console.error("Error writing tokens:", err);
        return callback(err);
      }
      
      console.log(`New token ${newToken.token} generated for ${username}`);
      callback(null, newToken.token);
    });
  });
}

module.exports = {
  newToken
};
