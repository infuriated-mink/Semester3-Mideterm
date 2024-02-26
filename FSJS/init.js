const fs = require("fs");
const path = require("path");
const { promisify } = require("util");
const fsPromises = require("fs").promises;
const yargs = require("yargs");
const express = require("express");
const app = express();
const port = 3000;
const { folders, configjson, tokenjson } = require("./templates");
global.DEBUG = true;

// Define templates
// const templates = {
//   folders: ["Database Project", "FullStack JavaScript (FSJS) Project"],
//   configjson: {
//     // Example configuration JSON template
//     database: {
//       host: "localhost",
//       port: 3000,
//       username: "root",
//       password: "password",
//       database: "virtual_vault",
//     },
//     server: {
//       port: 3000,
//       logging: true,
//       environment: "development",
//     },
//   },
//   tokenjson: {
//     // Example token JSON template
//     tokens: [
//       {
//         username: "example_user",
//         token: "abcdef123456",
//         expires: "2024-12-31 23:59:59",
//         permissions: ["read", "write"],
//       },
//       {
//         username: "another_user",
//         token: "789ghi456jkl",
//         expires: "2024-12-31 23:59:59",
//         permissions: ["read"],
//       },
//     ],
//   },
// };

// Initialize the command line arguments parser
const args = yargs
  .usage("Usage: node $0 --[option]")
  .option("all", {
    alias: "a",
    describe: "Create folder structure and config file",
    type: "boolean",
  })
  .option("mk", {
    alias: "m",
    describe: "Create folder structure",
    type: "boolean",
  })
  .option("cat", {
    alias: "c",
    describe: "Create config file with default settings",
    type: "boolean",
  }).argv;

// Helper function to log messages with different levels
const log = (level, message) => {
  const date = new Date().toISOString();
  console.log(`[${date}] [${level}] ${message}`);
};

// Helper function to create folders
// const createFolders = async () => {
//   let foldersCreatedCount = 0;

//   for (const folder of templates.folders) {
//     const folderPath = path.join(__dirname, folder);

//     if (!fs.existsSync(folderPath)) {
//       await promisify(fs.mkdir)(folderPath);
//       foldersCreatedCount++;
//     }
//   }

//   if (foldersCreatedCount > 0) {
//     log("INFO", `${foldersCreatedCount} folder(s) created.`);
//   } else {
//     log("INFO", "All folders already exist.");
//   }
// };

// // Helper function to create files
// const createFiles = async () => {
//   const createFile = async (filePath, data) => {
//     if (!fs.existsSync(filePath)) {
//       await promisify(fs.writeFile)(filePath, data);
//       log("INFO", `${filePath} created.`);
//     } else {
//       log("INFO", `${filePath} already exists.`);
//     }
//   };

//   await createFile(
//     path.join(__dirname, "./json/config.json"),
//     JSON.stringify(templates.configjson, null, 2)
//   );
//   await createFile(
//     path.join(__dirname, "./json/token.json"),
//     JSON.stringify(templates.tokenjson, null, 2)
//   );
//   await createFile(
//     path.join(__dirname, "./views/usage.json"),
//     templates.usagetxt
//   );
//   await createFile(
//     path.join(__dirname, "./views/init.json"),
//     templates.inittxt
//   );
//   await createFile(
//     path.join(__dirname, "./views/config.json"),
//     templates.configtxt
//   );
//   await createFile(
//     path.join(__dirname, "./views/token.json"),
//     templates.tokentxt
//   );
// };

// ************************************************************

function createFolders() {
  if (DEBUG) console.log("init.createFolders()");
  let mkcount = 0;
  folders.forEach((element) => {
    if (DEBUG) console.log(element);
    try {
      if (!fs.existsSync(path.join(__dirname, element))) {
        fsPromises.mkdir(path.join(__dirname, element));
        mkcount++;
      }
    } catch (err) {
      console.log(err);
    }
  });
  if (mkcount === 0) {
    console.log("All folders already exist.");
  } else if (mkcount <= folders.length) {
    console.log(mkcount + " of " + folders.length + " folders were created.");
  } else {
    console.log("All folders successfully created.");
  }
}

function createFiles() {
  if (DEBUG) console.log("init.createFiles()");
  try {
    let configdata = JSON.stringify(configjson, null, 2);
    if (!fs.existsSync(path.join(__dirname, "./json/config.json"))) {
      fs.writeFile("./json/config.json", configdata, (err) => {
        if (err) {
          console.log("Error writing to config file:", err);
        } else {
          console.log("Data written to config file.");
        }
      });
    } else {
      console.log("config file already exists.");
    }
    let tokendata = JSON.stringify(tokenjson, null, 2);
    if (!fs.existsSync(path.join(__dirname, "./json/tokens.json"))) {
      fs.writeFile("./json/tokens.json", tokendata, (err) => {
        if (err) {
          console.log("Error writing to tokens file:", err);
        } else {
          console.log("Data written to tokens file.");
        }
      });
    } else {
      console.log("token file already exists.");
    }
  } catch {
    console.log("Error creating files.");
  }
}

const myArgs = process.argv.slice(2);

// Initialize application
// const initializeApp = () => {
//   if (myArgs[1] === "--all") {
//     createFolders();
//     createFiles();
//   } else if (myArgs[1] === "--mk") {
//     createFolders();
//   } else if (myArgs[1] === "--cat") {
//     createFiles();
//   } else {
//     console.log(
//       fs.readFileSync(path.join(__dirname, "./views/init.txt"), "utf-8")
//     );
//   }

function initializeApp() {
  if (DEBUG) console.log("initializeApp()");

  switch (myArgs[1]) {
    case "--all":
      if (DEBUG) console.log("--all createFolders() & createFiles()");
      createFolders();
      createFiles();
      break;
    case "--cat":
      if (DEBUG) console.log("--cat createFiles()");
      createFiles();
      break;
    case "--mk":
      if (DEBUG) console.log("--mk createFolders()");
      createFolders();
      break;
    case "--help":
    case "--h":
    default:
      fs.readFile(__dirname + "/usage.txt", (error, data) => {
        if (error) throw error;
        console.log(data.toString());
      });
  }

  // Setup Express routes and start server
  app.get("/", (req, res) => {
    // Serve index.html from the views directory
    res.sendFile(path.join(__dirname, "views", "index.html"));
  });

  app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
  });
}

// // Run the application
// try {
//   initializeApp();
// } catch (error) {
//   myEmitter.emit("log", "init.initializeApp()", "ERROR", error.message);
// }

module.exports = { initializeApp };
