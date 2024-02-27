const express = require("express");
const bodyParser = require("body-parser");
const { newToken, tokenCount } = require("./userToken");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware to parse request bodies
app.use(bodyParser.urlencoded({ extended: true }));

// Serve static files from the 'views' directory
app.use(express.static("views"));

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
      res.send(__dirname + "/views/newusertoken.html");
    }
  });
});

app.get("/count", (req, res) => {
  res.sendFile(__dirname + "/views/count.html");
});

// Route handler for GET requests to "/count"
app.get("/count", async (req, res) => {
  const theCount = await tokenCount();
  res.sendFile(__dirname + "/views/count.html");
});

// Route handler for GET requests to "/"
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/views/index.html");
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
