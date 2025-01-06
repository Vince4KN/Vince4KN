    var uuid = require('uuid');
    var request_id = uuid.v4();
    pm.environment.set("request_id", request_id);

// Generate a random customer name 
const firstNames = ["Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry", "Isabella", "Jack"];
const lastNames = ["Smith", "Jones", "Williams", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson"];
//Grab a .random name from the list 
const randomFirstNameIndex = Math.floor(Math.random() * firstNames.length); 
const randomLastNameIndex = Math.floor(Math.random() * lastNames.length);

const randomFirstName = firstNames[randomFirstNameIndex];
const randomLastName = lastNames[randomLastNameIndex];

const addressName = `${randomFirstName} ${randomLastName}`;
pm.environment.set("addressName", addressName);

// 'addressData' must be saved as a global variable in this instance
const addresses = pm.globals.get('addressData').split('ONRUN');
//loop through address data organized in a .txt file and pasted into the gloabl variable. 
//this allows you to update the 'addressData' variable easily. 

const parsedAddresses = []; // create the array to be accessed later and split into variables 

for (let i = 1; i < addresses.length; i++) { // Start from 1 to skip the initial empty string
    const addressLines = addresses[i].trim().split('\n'); 

    // Check if we have enough lines for an address
    if (addressLines.length >= 5) { 
        const address = {
            id: 'ONRUN', // Since "ONRUN" is the separator for my data; but it could be anything, even a blank space or dot character
            //this parsing is organized for my data but could be altered for however the data you have is organized just be sure to update the fieldnames and parsing params
            name1: addressLines[0].trim(),
            name2: addressLines[1].trim(),
            street: addressLines[2].trim(),
            addressline1: addressLines[3].trim(), // Capture the address line
            cityStateZip: addressLines[4].trim(),
            code: addressLines[4].trim()  // Just use the cityStateZip as code
        };

        // Split city, state, and zip from cityStateZip
    // this was created to further parse the address data
    // city state and zip code appear on the same line in my dataset but all occupy their own fields in the EDI template, this means they must be split. 
    //this splits them into my variables (city, state, zipCode) and stores them in the environment to be accessed in my ORDER-LINE-SEGMENT creation later
        let city, state, zipCode;
        const cityStateZipParts = address.cityStateZip.split(', ');
        if (cityStateZipParts.length === 2) {
            address.city = cityStateZipParts[0].trim();
            const stateZipParts = cityStateZipParts[1].trim().split(' ');
            if (stateZipParts.length === 2) {
                address.state = stateZipParts[0].trim();
                address.zipCode = stateZipParts[1].trim();
            } else {
                // Handle cases where state and zip are not separated by a space
                const parts = cityStateZipParts[1].trim().match(/([A-Z]{2})\s*(\d{5})/);
                if (parts) {
                    address.state = parts[1].trim();
                    address.zipCode = parts[2].trim();
                } else {
                    console.error(`Invalid state and zip format: ${cityStateZipParts[1]}`); // error checks thorughout because data was inconsistent. in theory we would structure the data better before using but this dataset was rather large
                }
            }
        } else {
            // Handle cases without a comma
            const parts = address.cityStateZip.match(/(.+?)\s*([A-Z]{2})\s*(\d{5})/);
            if (parts) {
                city = parts[1].trim();
                state = parts[2].trim();
                zipCode = parts[3].trim();
            } else {
               
                console.error(`Could not parse cityStateZip: ${address.cityStateZip}`); // error check again and log it to the consoe so i can see and correct my dataset as I test the request
            }
            address.city = city;
            address.state = state;
            address.zipCode = zipCode;
        }

        parsedAddresses.push(address); 
    } else {
        console.error(`Incomplete address data at index ${i}`); // error check again 
    }
}


// Get the dynamic index (default to 0 if not set)
 const maxIndex = parsedAddresses.length - 1; 
        const addressIndex = Math.floor(Math.random() * (maxIndex + 1)); // Simplified random index

// Validate the index
if (addressIndex >= 0 && addressIndex < parsedAddresses.length) {
    const selectedAddress = parsedAddresses[addressIndex]; 
    console.log(`Selected Address [Index ${addressIndex}]:\n${JSON.stringify(selectedAddress, null, 2)}`); // Log the selected address object
    pm.environment.set('selectedAddress', JSON.stringify(selectedAddress)); // Save the selected address object as a string
} else {
    console.error(`Invalid address index: ${addressIndex}. Total addresses: ${parsedAddresses.length}`);
}
const selectedAddress = JSON.parse(pm.environment.get('selectedAddress')); //set the variable to be accessed along with its parts in the array


// Generate a random order number
function generateOrderNumber() {
    const prefix = "TSTORD__";
    const randomNumber = Math.floor(100000 + Math.random() * 900000);
    return prefix + randomNumber;
}
const orderNumber = pm.environment.get("orderNumber") ;
pm.environment.set("orderNumber", orderNumber);

// Generate timestamps (formatted)
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


// Generate a CPO number
function generateCpoNum() {
    const prefix = "R";
    const randomNumber = Math.floor(100000000 + Math.random() * 900000000);
    return prefix + randomNumber;
}
const cpoNum = generateCpoNum();
pm.environment.set("cpoNum", cpoNum);

// Get environment variables (with defaults if not found)
let wh_id = pm.environment.get("wh_id") || "USLCZ01";
let orderType = pm.environment.get("orderType") || "";
let deptNo = pm.environment.get("deptNo");
let b2aNum = pm.environment.get("b2aNum");

// --- Generate LC-ONRUN-ORDER-LINE-SEG segments ---
// created to dynamically populate orderline segments based on a few parameters to be set by the test runner. 
// number of lines, the 'items' to be includes in the line segments, and their respective 'quantities'
const numLines = 1;
const items = ["60.98697 W 8.5"];
// Define the quantities for each item
const quantities = [1]; // ex : 10 units for the first item, 2 for the second would be written [10,2]


function generateLineSegment(orderNumber, lineNum, lineItem, orderquantity, carrierCode, serviceLvl, earlyShipDate, earlyDlvDate, lateShipDate, lateDlvDate) {
    // ... (The function body remains the same, but use 'lineItem' in the <PRTNUM> tag) ...
}

// loop for line segments to read dataset from above.
let lineSegments = "";
for (let i = 0; i < numLines; i++) {
    let lineNum = '0' + Math.floor(10000000 + Math.random() * 90000000);
    let lineItem = items[i % items.length];
    pm.environment.set("lineItem", JSON.stringify(lineItem));//setting env variable to be logged in post

    let orderquantity = quantities[i % quantities.length]; 

    let carrierCode = pm.environment.get("carrierCode");
    let serviceLvl = pm.environment.get("serviceLvl");
    let earlyShipDate = pm.environment.get("earlyShipDate");
    let earlyDlvDate = pm.environment.get("earlyDlvDate");
    let lateShipDate = pm.environment.get("lateShipDate");
    let lateDlvDate = pm.environment.get("lateDlvDate");

    lineSegments += generateLineSegment(orderNumber, lineNum, lineItem, orderquantity, carrierCode, serviceLvl, earlyShipDate, earlyDlvDate, lateShipDate, lateDlvDate);
}


function generateLineSegment(orderNumber, lineNum, lineItem, orderquantity, carrierCode, serviceLvl, earlyShipDate, earlyDlvDate, lateShipDate, lateDlvDate) {
    return `<LC-ONRUN-ORDER-LINE-SEG>
<SEGNAM>LC-ONRUN-ORDER-LINE-SEG</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<ORDLIN>${lineNum}</ORDLIN>
<ORDSLN>IO</ORDSLN>
<SALES_ORDNUM>${orderNumber}</SALES_ORDNUM>
<SALES_ORDLIN>IO${lineNum}</SALES_ORDLIN>
<ENTDTE>${cpoDate}</ENTDTE>
<PRTNUM>${lineItem}</PRTNUM>
<ORDQTY>${orderquantity}</ORDQTY>
<RPQFLG>0</RPQFLG>
<OVRCOD/>
<OVRAMT>0</OVRAMT>
<STDFLG>0</STDFLG>
<PARFLG>1</PARFLG>
<BCKFLG>0</BCKFLG>
<CARCOD>${carrierCode}</CARCOD>
<CARGRP/>
<SRVLVL>${serviceLvl}</SRVLVL>
<EARLY_SHPDTE>${earlyShipDate}</EARLY_SHPDTE>
<EARLY_DLVDTE>${earlyDlvDate}</EARLY_DLVDTE>
<LATE_SHPDTE>${lateShipDate}</LATE_SHPDTE>
<LATE_DLVDTE>${lateDlvDate}</LATE_DLVDTE>
    {...edi fields...}
</LC-ONRUN-ORDER-LINE-SEG>`;
}

//first half of LC-ONRUN-ORDER-INB-IFD

const xmlTemplate = `<?xml version="1.0" encoding="utf-8"?>
<LC-ONRUN-ORDER-INB-IFD xmlns:knlookup="de.kn.xslt.extensions.KnTableLookup">
<CTRL_SEG> 
<TRNNAM>ORDER_TRAN</TRNNAM>
{...edi fields...}
<HOST_EXT_ID>ST${orderNumber}</HOST_EXT_ID>
<ADRNAM>${addressName}</ADRNAM>
<ADRTYP>CST</ADRTYP>
<ADRLN1>${selectedAddress.addressline1}</ADRLN1> 
<ADRLN2/>
<ADRLN3/>
<ADRCTY>${selectedAddress.city}</ADRCTY> 
<ADRSTC>${selectedAddress.state}</ADRSTC> 
<ADRPSZ>${selectedAddress.zipCode}</ADRPSZ> 
{...edi fields...}
        `;




// Insert the generated line segments into the request body
          // use \n for 'new line' this insures none of the new lines are concatenated incorrectly causing the edi transmission to fail
          
const requestBody = xmlTemplate +
    "\n" + lineSegments +
    "\n</LC-ONRUN-ORDER-SEG>" +
    "\n</CTRL_SEG>" +
    "\n</LC-ONRUN-ORDER-INB-IFD>";

// Set the updated request body
pm.request.body.raw = requestBody;

// Optional: Log the updated request body to the console
console.log(requestBody);
    
