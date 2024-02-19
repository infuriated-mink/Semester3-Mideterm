const { program } = require('commander');
const fs = require('fs-extra');
const Handlebars = require('handlebars');

program
    .version('0.1.0')
    .option('-n, --name <name>', 'Project name')
    .parse(process.argv);

const projectName = program.name;

if (!projectName) {
    console.error('Please provide a project name using the -name or --name option');
    process.exit(1);
}

const templateDir = './templates';
const targetDir = './${projectName';

fs.ensureDirSync(targetDir);

fs.readdirSync(templateDir).forEach(file => {
    const templateContent = fs.readFileSync(`${templateDir}/${file}`, 'utf-8');
    const compiledTemplate = Handlebars.compile(templateContent);
    const targetFileContent = compiledTemplate({ projectName });

    fs.writeFileSync(`${targetDir}/${file}`, targetFileContent);
});

console.log(`Project ${projectName} has been initialized successfully`);