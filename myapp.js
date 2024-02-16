global.DEBUG = true;

const fs = require("fs");


const myArgs = process.argv.slice(2); // get 2 arguments from the command line


if(DEBUG) if(myArgs.length >= 1) console.log('the myapp.args: ', myArgs);