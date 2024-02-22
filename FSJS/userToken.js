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

const logEvents = require("./logEvents");

const EventEmitter = require("events");
class MyEmitter extends EventEmitter {}

const MyEmitter = new MyEmitter();
MyEmitter.on("log", (event, level, msg) => logEvents(event, level, msg));

const fs = require("fs");
const path = require("path");

const crc32 = require("crc/crc32");
const { format } = require("date-fns");

const myArgs = process.argv.slice(2);

// Endpoint for handling form submission
app.post("/generateToken", (req, res) => {
  const username = req.body.username;
  const token = newToken(username); // Generate new token
  res.send(`Your token: ${token}`); // Respond with the generated token
});

// Route for displaying the form
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/views/form.html");
});

var tokenCount = function () {
  if (DEBUG) console.log("token.tokenCount()");
  return new Promise(function (resolve, reject) {
    fs.readFile(__dirname + "/json/tokens.json", "utf-8", (error, data) => {
      if (error) reject(error);
      else {
        let tokens = JSON.parse(data);
        let count = Object.keys(tokens).length;
        console.log(`Gamers with tokens; ${count}.`);
        myEmitter.emit(
          "log",
          "token.tokenCount()",
          "INFO",
          `Token count ${count}.`
        );
        resolve(count);
      }
    });
  });
};

// function to list all tokens
function tokenList() {
  if (DEBUG) console.log("token.tokenCount()");
  fs.readFile(__dirname + "/json/tokens.json", "utf-8", (error, data) => {
    if (error) throw error;
    let tokens = JSON.parse(data);
    console.log("** User List **");
    tokens.forEach((obj) => {
      console.log(" * " + obj.username + ": " + obj.token);
    });
    myEmitter.emit(
      "log",
      "token.tokenList()",
      "INFO",
      `Current token list was displayed.`
    );
  });
}

//function ot generate a new token for the web user

function newToken(username) {
  if (DEBUG) console.log("token.newToken()");

  let newToken = JSON.parse(`{
        "created": "1969-01-31 12:30:00",
        "username": "username",
        "email": "user@example.com",
        "phone": "5556597890",
        "token": "token",
        "expires": "1969-02-03 12:30:00",
        "confirmed": "tbd"
    }`);

  let now = new Date();
  let expires = addDays(now, 3);

  newToken.created = `${format(now, "yyyy-MM-dd HH:mm:ss")}`;
  newToken.username = username;
  newToken.token = crc32(username).toString(16);
  newToken.expires = `${format(expires, "yyyy-MM-dd HH:mm:ss")}`;
  fs.readFile(__dirname + "/json/tokens.json", "utf-8", (error, data) => {
    if (error) throw error;
    let tokens = JSON.parse(data);
    tokens.push(newToken);
    userTokens = JSON.stringify(tokens);

    fs.writeFile(__dirname + "/json/tokens.json", userTokens, (err) => {
      if (err) console.log(err);
      else {
        console.log(`New token ${newToken.token} was created for ${username}.`);
        myEmitter.emit(
          "log",
          "token.newToken()",
          "INFO",
          `New token ${newToken.token} was created for ${username}.`
        );
      }
    });
  });
  return newToken.token;
}

// function for user to update their token record
function updateToken(argv) {
  if (DEBUG) console.log("token.updateToken()");
  if (DEBUG) console.log(argv);
  fs.readFile(__dirname + "/json/tokens.json", "utf-8", (error, data) => {
    if (error) throw error;
    let tokens = JSON.parse(data);
    tokens.forEach((obj) => {
      if (obj.username === argv[3]) {
        if (DEBUG) console.log(obj);
        switch (argv[2]) {
          case "p":
          case "P":
            obj.phone = argv[4];
            break;
          case "e":
          case "E":
            obj.email = argv[4];
            break;
          default:
        }
        if (DEBUG) console.log(obj);
      }
    });

    userTokens = JSON.stringify(tokens);
    fs.writeFile(__dirname + "/json/tokens.json", userTokens, (err) => {
      if (err) console.log(err);
      else {
        console.log(`Token record for ${argv[3]} was updated with ${argv[4]}.`);
        myEmitter.emit(
          "log",
          "token.updateToken()",
          "INFO",
          `Token record for ${argv[3]} was updated with ${argv[4]}.`
        );
      }
    });
  });
}

// function to fetch a token record
var fetchRecord = function (username) {
  if (DEBUG) console.log("token.fetchRecord()");
  fs.readFile(__dirname + "/json/tokens.json", "utf-8", (error, data) => {
    if (error) console.log(error);
    else {
      let tokens = JSON.parse(data);
      tokens.forEach((obj) => {
        if (obj.username === username) {
          console.log(obj);
          myEmitter.emit(
            "log",
            "token.fetchRecord()",
            "INFO",
            `Token record for ${username} was displayed.`
          );
        }
      });
    }
  });
};

// function to search for a token
function searchToken() {
  if (DEBUG) console.log("token.searchToken()");
  myEmitter.emit(
    "log",
    "token.searchToken()",
    "INFO",
    `Token was found for xxx.`
  );
}

function addDays(date, days) {
  var result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
}

function tokenApp() {
  if (DEBUG) console.log("tokenApp()");
  myEmitter.emit(
    "log",
    "token.tokenApp()",
    "INFO",
    "token option was called by CLI"
  );

  switch (myArgs[1]) {
    case "--count":
      tokenCount();
      break;
    case "--list":
      tokenList();
      break;
    case "--new":
      newToken(myArgs[2]);
      break;
    case "--upd":
      updateToken(myArgs);
      break;
    case "--fetch":
      fetchRecord(myArgs[2]);
      break;
    case "--search":
      searchToken();
      break;
    case "--help":
    case "--h":
    default:
      fs.readFile(__dirname + "/views/token.txt", (error, data) => {
        if (error) throw error;
        console.log(data.toString());
      });
      myEmitter.emit(
        "log",
        "token.tokenApp()",
        "INFO",
        "invalid CLI option, usage displayed"
      );
  }
}

module.exports = {
  tokenApp,
  newToken,
  tokenCount,
  fetchRecord,
};
