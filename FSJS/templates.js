const folders = ['models', 'views', 'routes', 'logs', 'json'];

const configjson = { 
  name: 'Midterm Project',
  version: '1.0.0',
  description: 'A Working CLI in JS',
  main: 'myapp.js',
  superuser: 'postgres',
  database: 'midtermdb'
};

const tokenjson = [{
  created: '1969-01-31 12:30:00',
  username: 'username',
  email: 'user@example.com',
  phone: '5556597890',
  token: 'token',
  expires: '1969-02-03 12:30:00',
  confirmed: 'tbd'
}];

module.exports = {
  folders,
  configjson,
  tokenjson,
};