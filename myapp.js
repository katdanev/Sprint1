global.DEBUG = true;

const fs = require("fs");
const { initializeApp } = require('./init.js'); // import the init.js module and initialize the app
const { configApp } = require('./config.js'); // import the config.js module and configure the app
const { tokenApp } = require('./token.js'); // import the token.js module and generate a user token

const myArgs = process.argv.slice(2);


if(DEBUG) if(myArgs.length >= 1) console.log('the myapp.args: ', myArgs);

switch (myArgs[0]) {
  case 'init':
  case 'i':
      if(DEBUG) console.log(myArgs[0], ' - initialize the app.');
      initializeApp();
    
      break;
  case 'config':
  case 'c':
      if(DEBUG) console.log(myArgs[0], ' - display the configuration file');
      configApp(); 
      break;
  case 'token':
  case 't':
      if(DEBUG) console.log(myArgs[0], ' - generate a user token');
       tokenApp(); 
      break;  

  case '--help':
  case '--h':
  default:
      fs.readFile(__dirname + "/usage.txt", (error, data) => {
          if(error) throw error;
          console.log(data.toString());
      });
}
