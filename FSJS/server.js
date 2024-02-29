const express = require("express");
const bodyParser = require("body-parser");
const { newToken, tokenCount } = require("./userToken");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware to parse request bodies
app.use(bodyParser.urlencoded({ extended: true }));

// Set EJS as the view engine
app.set("view engine", "ejs");

// Serve static files from the 'views' directory
app.use(express.static("views"));

// Logging middleware
app.use((req, res, next) => {
  const logMessage = `${new Date().toISOString()} - ${req.method} ${req.url}\n`;

  // Log to console
  console.log(logMessage);

  // Log to file
  fs.appendFile(path.join(__dirname, "logs/access.log"), logMessage, (err) => {
    if (err) {
      console.error("Error appending to access log:", err);
    }
  });

  next();
});

// Route handler for GET requests to "/new"
app.get("/new", (req, res) => {
  res.sendFile(__dirname + "/views/newusertoken.html");
});

// Route handler for POST requests to "/new"
app.post("/new", (req, res) => {
  const username = req.body.username;
  newToken(username, (error, theToken) => {
    if (error) {
      console.error("Error generating token:", error);
      res.status(500).send("Error generating token");
    } else {
      res.send(`${username} token is ${theToken}`);
    }
  });
});

// Route handler for GET requests to "/count"
app.get("/count", async (req, res) => {
  try {
    const theCount = await tokenCount();
    res.render("count", { tokenCount: theCount }); 
  } catch (error) {
    console.error("Error fetching token count:", error);
    res.status(500).send("Error fetching token count");
  }
});

// Route handler for GET requests to "/"
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/views/index.html");
});

// Error handling for sending files
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
