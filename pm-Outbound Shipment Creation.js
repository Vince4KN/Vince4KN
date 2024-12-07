var uuid = require('uuid');
var request_id = uuid.v4();
pm.environment.set("request_id", request_id);




const firstNames = ["Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry", "Isabella", "Jack"];

// Define an array of possible last names
const lastNames = ["Smith", "Jones", "Williams", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson"];

// Generate random indices for first and last names
const randomFirstNameIndex = Math.floor(Math.random() * firstNames.length);
const randomLastNameIndex = Math.floor(Math.random() * lastNames.length);   


// Get the random first and last names from the arrays
const randomFirstName = firstNames[randomFirstNameIndex];
const randomLastName = lastNames[randomLastNameIndex];

// Combine the names to create a full name
const addressName = `${randomFirstName} ${randomLastName}`;

// Set the full name as a Postman environment variable
pm.environment.set("addressName", addressName);



function generateOrderNumber() {
  const prefix = "TSTORD__";
  const randomNumber = Math.floor(100000 + Math.random() * 900000); 
  return prefix + randomNumber;
}

const orderNumber = generateOrderNumber(); 
pm.environment.set("orderNumber", orderNumber);

function getFrmTimestampPlusHours(format, hoursToAdd) {
  const now = new Date();
  now.setHours(now.getHours() + hoursToAdd); 

  const year = now.getFullYear().toString();
  const month = (now.getMonth() + 1).toString().padStart(2, '0');
  const day = now.getDate().toString().padStart(2, '0');
  const hours = now.getHours().toString().padStart(2, '0');
  const minutes = now.getMinutes().toString().padStart(2, '0');
  const seconds = now.getSeconds().toString().padStart(2, '0');

  const formattedTimestamp = format
    .replace('yyyy', year)
    .replace('MM', month)
    .replace('dd', day)
    .replace('HH', hours)
    .replace('mm', minutes)
    .replace('ss', seconds);

  return formattedTimestamp;  
}

const cpoDate = getFrmTimestampPlusHours('yyyyMMddHHmmss', 6); 
pm.environment.set("cpoDate", cpoDate); 

function getFrmTimestampPlusDays(format, daysToAdd) {
  const now = new Date();
  now.setDate(now.getDate() + daysToAdd); 

  const year = now.getFullYear().toString();
  const month = (now.getMonth() + 1).toString().padStart(2, '0');
  const day = now.getDate().toString().padStart(2, '0');
  const hours = now.getHours().toString().padStart(2, '0');
  const minutes = now.getMinutes().toString().padStart(2, '0');
  const seconds = now.getSeconds().toString().padStart(2, '0');

  const formattedTimestamp = format
    .replace('yyyy', year)
    .replace('MM', month)
    .replace('dd', day)
    .replace('HH', hours)
    .replace('mm', minutes)
    .replace('ss', seconds);

  return formattedTimestamp;
}

function getFrmTimestampPlusMonths(format, monthsToAdd) {
  const now = new Date();
  now.setMonth(now.getMonth() + monthsToAdd); 

  const year = now.getFullYear().toString();
  const month = (now.getMonth() + 1).toString().padStart(2, '0');
  const day = now.getDate().toString().padStart(2, '0');
  const hours = now.getHours().toString().padStart(2, '0');
  const minutes = now.getMinutes().toString().padStart(2, '0');
  const seconds = now.getSeconds().toString().padStart(2, '0');

  const formattedTimestamp = format
    .replace('yyyy', year)
    .replace('MM', month)
    .replace('dd', day)
    .replace('HH', hours)
    .replace('mm', minutes)
    .replace('ss', seconds);

  return formattedTimestamp;
}

const earlyShipDate = getFrmTimestampPlusDays('yyyyMMddHHmmss', 1);
pm.environment.set("earlyShipDate", earlyShipDate);

const earlyDlvDate = getFrmTimestampPlusDays('yyyyMMddHHmmss', 2);
pm.environment.set("earlyDlvDate", earlyDlvDate);

const lateShipDate = getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4);
pm.environment.set("lateShipDate", lateShipDate);

const lateDlvDate = getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4);
pm.environment.set("lateDlvDate", lateDlvDate);


function generateLineNum1() {
  const prefix = "0";
  const randomNumber = Math.floor(10000000 + Math.random() * 90000000); 
  return prefix + randomNumber;
}

const lineNum1 = generateLineNum1();
pm.environment.set("lineNum1", lineNum1);


function generateCpoNum() {
  const prefix = "R";
  const randomNumber = Math.floor(100000000 + Math.random() * 900000000); 
  return prefix + randomNumber;
}

const cpoNum = generateCpoNum();
pm.environment.set("cpoNum", cpoNum);   
