/*************************
 * File Name: init.js
 * Purpose: The routines to initialize the app
 * 
 * Commands:
myapp init --all      creates the folder structure and config file
myapp init --mk       creates the folder structure
myapp init --cat      creates the config file with default settings
 *
 * Created Date: 09 Jan 2022
 * Authors:
 * PJR - Peter Rawsthorne
 * Revisions:
 * Date, Author, Description
 * 09 Jan 2022, PJR, File created
 * 12 Feb 2022, PJR, added createFiles() for init, config, and token views
 * 13 Oct 2022, PJR, re-hydrated project from the spring
 *************************/

const fs = require("fs");
const path = require('path');
const fsPromises = require('fs').promises;
const {folders, configjson, tokenjson} = require('./templates.js');


function createFolders() {  // myapp init --mk           create all the application folders   


    if(DEBUG) console.log('init.createFolders()');
    let mkcount = 0;
    folders.forEach(element => {
        if(DEBUG) console.log(element);
        try {
            if(!fs.existsSync(path.join(__dirname, element))) {
                fsPromises.mkdir(path.join(__dirname, element));
                mkcount++;
            }
        } catch (err) {
            console.log(err);
        }
    });
    if(mkcount === 0) { 
        console.log('All folders already exist.');
    } else if (mkcount <= folders.length) {
        console.log(mkcount + ' of ' + folders.length + ' folders were created.');
    } else {
       console.log('All folders successfully created.');
    }
};


function createFiles() {
    if(DEBUG) console.log('init.createFiles()');
    try {
        let configdata = JSON.stringify(configjson, null, 2);
        if(!fs.existsSync(path.join(__dirname, './json/config.json'))) {
            fs.writeFile('./json/config.json', configdata, (err) => {
                if(err) {
                    console.log(err)
                }
                else {
                    console.log('Data written to config file');
                }
            });
        } else {
            console.log('Config file already exists');

        }

        let tokendata = JSON.stringify(tokenjson, null, 2);
      if(!fs.existsSync(path.join(__dirname, './json/token.json'))) {
        fs.writeFile('./json/token.json', tokendata, (err) => {
          if(err) {
            console.log(err)
          } else {
            console.log('Data written to token file.');
          }
        }
        );
    } else {
      console.log('token file already exists.');
    }
     
  } catch(err) {
      console.log(err);
  }
};


const myArgs = process.argv.slice(2);

function initializeApp() {
    if(DEBUG) console.log('initializeApp()');

    switch (myArgs[1]) {
    case '--all':
        if(DEBUG) console.log('--all createFolders() & createFiles()');
        createFolders(); // add function to create folders
        createFiles(); // add function to create config file
        break;

    case '--cat':
        if(DEBUG) console.log('--cat createFiles()');
        createFiles(); // add function to create config file
        break;

    case '--mk':
        if(DEBUG) console.log('--mk createFolders()');
        createFolders(); // add function to create folders
        break;

    case '--help':
    case '--h':
    default:
        fs.readFile(__dirname + "/usage.txt", (error, data) => {
            if(error) throw error;              
            console.log(data.toString());
        });
    }
}

module.exports = {
    initializeApp,
  }