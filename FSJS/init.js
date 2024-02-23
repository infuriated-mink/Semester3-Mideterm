const fs = require("fs");
const path = require("path");
const { promisify } = require("util");
const yargs = require("yargs");
const express = require("express");
const app = express();
const port = 3000;

// Define templates
const templates = {
  folders: ["folder1", "folder2", "folder3"], // Replace with actual folder names
  configjson: {},
  tokenjson: {},
  inittxt: "",
  usagetxt: "",
  configtxt: "",
  tokentxt: "",
};

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
const createFolders = async () => {
  let foldersCreatedCount = 0;

  for (const folder of templates.folders) {
    const folderPath = path.join(__dirname, folder);

    if (!fs.existsSync(folderPath)) {
      await promisify(fs.mkdir)(folderPath);
      foldersCreatedCount++;
    }
  }

  if (foldersCreatedCount > 0) {
    log("INFO", `${foldersCreatedCount} folder(s) created.`);
  } else {
    log("INFO", "All folders already exist.");
  }
};

// Helper function to create files
const createFiles = async () => {
  const createFile = async (filePath, data) => {
    if (!fs.existsSync(filePath)) {
      await promisify(fs.writeFile)(filePath, data);
      log("INFO", `${filePath} created.`);
    } else {
      log("INFO", `${filePath} already exists.`);
    }
  };

  await createFile(
    path.join(__dirname, "./json/config.json"),
    JSON.stringify(templates.configjson, null, 2)
  );
  await createFile(
    path.join(__dirname, "./json/token.json"),
    JSON.stringify(templates.tokenjson, null, 2)
  );
  await createFile(
    path.join(__dirname, "./views/usage.json"),
    templates.usagetxt
  );
  await createFile(
    path.join(__dirname, "./views/init.json"),
    templates.inittxt
  );
  await createFile(
    path.join(__dirname, "./views/config.json"),
    templates.configtxt
  );
  await createFile(
    path.join(__dirname, "./views/token.json"),
    templates.tokentxt
  );
};

// Initialize application
const initializeApp = async () => {
  if (args.all) {
    await createFolders();
    await createFiles();
  } else if (args.mk) {
    await createFolders();
  } else if (args.cat) {
    await createFiles();
  } else {
    console.log(
      fs.readFileSync(path.join(__dirname, "./views/init.txt"), "utf-8")
    );
  }

  // Setup Express routes and start server
  app.get("/", (req, res) => {
    // Serve index.html from the views directory
    res.sendFile(path.join(__dirname, "views", "index.html"));
  });

  app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
  });
};

// Run the application
initializeApp().catch((error) => {
  console.error("An error occurred:", error.message);
});
