const express = require("express");
const fs = require("fs");
const { parse } = require("querystring");
const { newToken, tokenCount } = require("./userToken");

const app = express();

// Serve static files from the 'views' directory
app.use(express.static('views'));

// Handle POST requests to '/new'
app.post('/new', (req, res) => {
  collectRequestData(req, (result) => {
    newToken(result.username, (error, theToken) => {
      if (error) {
        console.error("Error generating token:", error);
        res.statusCode = 500;
        res.end("Error generating token");
      } else {
        res.end(`
          <!doctype html>
          <html>
          <body>
              ${result.username} token is ${theToken} <br />
              <a href="http://localhost:3000">[home]</a>
          </body>
          </html>
        `);
      }
    });
  });
});

// Handle GET requests to '/count'
app.get('/count', async (req, res) => {
  var theCount = await tokenCount();
  res.end(`
    <!doctype html>
    <html>
    <body>
        Token count is ${theCount} <br />
        <a href="http://localhost:3000">[home]</a>
    </body>
    </html>
  `);
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

function collectRequestData(request, callback) {
  const FORM_URLENCODED = "application/x-www-form-urlencoded";
  if (request.headers["content-type"] === FORM_URLENCODED) {
    let body = "";
    request.on("data", (chunk) => {
      body += chunk.toString();
    });
    request.on("end", () => {
      callback(parse(body));
    });
  } else {
    callback(null);
  }
}
