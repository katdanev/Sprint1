// Node.js common core global modules
const fs = require('fs');
const path = require('path');

const crc32 = require('crc/crc32');
const { format } = require('date-fns');

const myArgs = process.argv.slice(2);

function tokenList() { // list all tokens
  if(DEBUG) console.log('token.tokenCount()');
  fs.readFile(__dirname + '/json/token.json', 'utf-8', (error, data) => {
      if(error) throw error; 
      let tokens = JSON.parse(data);
      console.log('** User List **')
      tokens.forEach(obj => {
          console.log(' * ' + obj.username + ': ' + obj.token);
      });
   });
};

function newToken(username) { // create a new token
  if(DEBUG) console.log('token.newToken()');
  let newToken = JSON.parse(`{ 
      "created": "1969-01-31 12:30:00",
      "username": "username",
      "email": "user@example.com",
      "phone": "5556597890",
      "token": "token",
      "expires": "1969-02-03 12:30:00",
      "confirmed": "tbd"
  }`);

  let now = new Date(); // current date and time
  let expires = addDays(now, 3); // add 3 days to the current date and time

  newToken.created = `${format(now, 'yyyy-MM-dd HH:mm:ss')}`; // format the date and time
  newToken.username = username; // set the username
  newToken.token = crc32(username).toString(16); // create a token from the username
  newToken.expires = `${format(expires, 'yyyy-MM-dd HH:mm:ss')}`; // format the date and time

  fs.readFile(__dirname + '/json/token.json', 'utf-8', (error, data) => { // read the token.json file
      if(error) throw error; 
      let tokens = JSON.parse(data);
      tokens.push(newToken); // add the new token to the tokens array
      userTokens = JSON.stringify(tokens); // convert the tokens array to a JSON string
  
      fs.writeFile(__dirname + '/json/token.json', userTokens, (err) => { // write the tokens array to the token.json file
          if (err) console.log(err);
          else { 
              console.log(`New token ${newToken.token} was created for ${username}.`); // display the new token
          }
      })
      
  });
  return newToken.token; 
}

function addDays(date, days) {
  var result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
}

function tokenApp() {
  if(DEBUG) console.log('tokenApp()');

  switch (myArgs[1]) {
  case '--count':
    if(DEBUG) console.log('--count');
 //     tokenCount();
      break;
  case '--list':
    if(DEBUG) console.log('--list');
      tokenList();
      break; 
  case '--new':
      if (myArgs.length < 3) {
          console.log('invalid syntax. node myapp token --new [username]')
      } else {
        if(DEBUG) console.log('--new');
        newToken(myArgs[2]);
      }
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
  tokenApp,
}