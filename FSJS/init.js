// init.js

// Import required modules
const fs = require('fs');
const psth = require('path');
const {promisify} = require('util');
const chalk = require('chalk');
const yargs = require('yargs');

// Define templates
const templates = {
    folders: [...],
    configjson: {},
    tokenjson: {},
    inittxt: '',
    usagetxt: '',
    configtxt: '',
    tokentxt: '',
};

// Initialize the command line arguments parser
const args = yargs
    .usage('Usage: node $0 --[option]')
    .option('all', {
        alias: 'a',
        describe: 'Create folder structure and config file',
        type: 'boolean',
    })
    .option('mk', {
        alias: 'm',
        describe: 'Create folder structure and config file',
        type: 'boolean',
    })
    .option('cat', {
        alias: 'c',
        describe: 'Create config file with default settings',
        type: 'boolean',
    }).argv

    // Helper function to log messages with different levels
    const log = (level, message) => {
        const date = new Date();
        console.log(`[${chalk.gray(date.toISOString())}] [${chalk.bold(level)}] ${message}`);
    };

    // Helper function to create folders
    const create folders = async () => {
        let foldersCreatedCount = 0;

        for (const folder of templates.folders) {
            const folderPath = path.join(_dirname, folder);

            if (!fs.existsSync(folderPath)) {
                await promisify(fs.mkdir)(folderPath);
                foldersCreatedCount++;
            }
        }

        if (foldersCreatedCount > 0) {
            log('INFO', `${foldersCreatedCount} folder(s) created.`);
        }   else {
            log('INFO', 'All folders already exist.');
        }
    };

    // Helper function to create files
    const createFiles = async () => {
        const createFile = async (filePath, data => {
            if (!fs.existsSync (filePath)) {
                await promisify(fs.writeFile)(filePath, data);
                log('INFO', `${filePath} created.`);
            }   else {
                log('INFO', `${filePath} already exists.`);
            }
        });

        await createFile(path.join(__dirname, './json/config.json'), JSON.stringify(templates.configjson, null, 2));
        await createFile(path.join(__dirname, './json/token.json'), JSON.stringify(templates.tokenjson, null, 2));
        await createFile(path.join(__dirname, './views/usage.json'), templates.usagetxt);
        await createFile(path.join(__dirname, './views/init.json'), templates.inittxt);
        await createFile(path.join(__dirname, './views/config.json'), templates.configtxt);
        await createFile(path.join(__dirname, './views/token.json'), templates.tokentxt);
    };

    // Onitialize application
    const InitializeApp = async () => {
        if(args.all) {
            await createFolders();
            await createFiles();
        } else if (args.mk) {
            await createFolders();
        } else if (args.cat) {
            await createFiles();
        } else {
            console.log(fs.readFileSync(path.join(__dirname, './views/init.txt'), 'utf-8'));
        }
    };

    // Run the application
    initializeApp().catch((error) => {
        console.error('An error occured:', error.message);
    });