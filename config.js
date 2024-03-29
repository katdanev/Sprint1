const fs = require("fs");
const myArgs = process.argv.slice(2);
const { configjson } = require('./templates.js');

function displayConfig() { // display the configuration file in the console, use command line argument --show
    if(DEBUG) console.log('config.displayConfig()');
    fs.readFile(__dirname + "/json/config.json", (error, data) => {
        if(error) throw error;   
        console.log(JSON.parse(data));
    });
}

function resetConfig() { // reset the configuration file to its original state, use command line argument --reset
    if(DEBUG) console.log('config.resetConfig()');
    let configdata = JSON.stringify(configjson, null, 2);
    fs.writeFile(__dirname + '/json/config.json', configdata, (error) => {
        if(error) throw error;   
        if(DEBUG) console.log('Config file reset to original state');
    });
}


function setConfig() { // set a configuration setting, use command line argument --set
    if(DEBUG) console.log('config.setConfig()');
    if(DEBUG) console.log(myArgs);

    let match = false;
    fs.readFile(__dirname + "/json/config.json", (error, data) => {
        if(error) throw error;         
        if(DEBUG) console.log(JSON.parse(data));
        let cfg = JSON.parse(data);
        for(let key of Object.keys(cfg)){
            if(DEBUG) console.log(`KEY: ${key}`);
            if(key === myArgs[2]) {
                cfg[key] = myArgs[3];
                match = true;
            }
        }
        if(!match) {
            console.log(`invalid key: ${myArgs[2]}, try to9 find another.`)
       }
        if(DEBUG) console.log(cfg);
        data = JSON.stringify(cfg, null, 2);
        fs.writeFile(__dirname + '/json/config.json', data, (error) => {
            if (error) throw error;
            if(DEBUG) console.log('Config file successfully updated.');
        });
    });
}



function configApp() { // configure the app, use command line argument --config
  if(DEBUG) console.log('configApp()');

  switch (myArgs[1]) {
  case '--show':
      if(DEBUG) console.log('--show');
      displayConfig();
      break;
  case '--reset':
      if(DEBUG) console.log('--reset');
      resetConfig();
      break;
  case '--set':
      if(DEBUG) console.log('--set');
      setConfig();
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
  configApp,
}