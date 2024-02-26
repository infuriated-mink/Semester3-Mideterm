global.DEBUG = false;
const http = require("http");
const fs = require("fs");
const { parse } = require("querystring");
const { newToken, tokenCount } = require("./userToken");

const server = http.createServer(async (req, res) => {
  let path = "./views/";
  switch (req.url) {
    case "/":
      path += "index.html";
      res.statusCode = 200;
      fetchFile(path, res);
      break;
    case "/new":
      if (req.method === "POST") {
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
      } else {
        path += "newusertoken.html";
        res.statusCode = 200;
        fetchFile(path, res);
      }
      break;
    case "/count":
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
      break;
    default:
      res.statusCode = 404;
      res.end("Not Found");
  }
});

server.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});

function fetchFile(path, res) {
  fs.readFile(path, (err, data) => {
    if (err) {
      console.error("Error reading file:", err);
      res.statusCode = 500;
      res.end("Internal Server Error");
    } else {
      if (DEBUG) console.log("File was served.");
      res.writeHead(res.statusCode, { "Content-Type": "text/html" });
      res.write(data);
      res.end();
    }
  });
}

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
