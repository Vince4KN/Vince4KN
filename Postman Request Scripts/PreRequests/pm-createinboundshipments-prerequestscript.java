//Used to test API EDI order integration in Blue Yonder. 

var uuid = require('uuid');
var request_id = uuid.v4();
pm.environment.set("request_id", request_id);

// Generate a random inbound shipment number (e.g., INSHP12345678)
function generateInbShipmentNumber() {
const prefix = "INSHP";
const randomNumber = Math.floor(10000000 + Math.random() * 90000000); 
return prefix + randomNumber;
}

const inbShipment = generateInbShipmentNumber(); 
pm.environment.set("inbShipment", inbShipment);
//setting variables in environment scope allows me to easily access them later to fill the EDI template before the request is sent. 
//variables have to be defined in the scope where they will be used. This can be at Global, or Collection level also. But ive found environment is the easiest to keep in scope while writing scripts for Postman environment

// Generate a random inbound order number (e.g., INORD87654321)
function generateInbOrderNumber() {
const prefix = "INORD";
const randomNumber = Math.floor(10000000 + Math.random() * 90000000); 
return prefix + randomNumber;
}

const inbOrder = generateInbOrderNumber(); 
pm.environment.set("inbOrder", inbOrder);


// Generate a timestamp with a specified number of hours added
// could use 'moment.js' to do this but I was unable to import the package on my work computer due to admin privileges and the Postman environment being a sandbox; so I had to build it by hand.
function getFrmTimestampPlusHours(format, hoursToAdd) {
const now = new Date();
now.setHours(now.getHours() + hoursToAdd); 

const year = now.getFullYear().toString();
const month = (now.getMonth() + 1).toString().padStart(2, '0');
const day = now.getDate().toString().padStart(2,   
'0');
const hours = now.getHours().toString().padStart(2, '0');
const minutes = now.getMinutes().toString().padStart(2, '0');
const seconds = now.getSeconds().toString().padStart(2, '0');

const   
formattedTimestamp = format
.replace('yyyy', year)
.replace('MM', month)
.replace('dd', day)
.replace('HH', hours)
.replace('mm', minutes)
.replace('ss', seconds);

return formattedTimestamp;   

}

const timestampPlus6Hours = getFrmTimestampPlusHours('yyyyMMddHHmmss', 6); 
pm.environment.set("expDte", timestampPlus6Hours); 

// Generate a random LPN (e.g., LPN123456789)
// Each Case will likekly have its own seperate LPN to hold the Case as well
function generateLPN(){
const prefix = "LPN";
const randomNumber = Math.floor(100000000 + Math.random() * 900000000); 
return prefix + randomNumber;
}

// Generate a random SubLPN (e.g., 009123456789012345)
// The Case Number is here 
function generateSubLPN() {
const prefix = "009"; 
const randomNumber = Math.floor(1000000000000000 + Math.random() * 90000000000000000); 
return prefix + randomNumber;
}

// Generate a random waybill number (e.g., WB1234)
// EDI Field 
function generateWaybill(){
const prefix = "WB";
const randomNumber = Math.floor(1000 + Math.random() * 9000); 
return prefix + randomNumber;
}

const waybill = generateWaybill();
pm.environment.set("wayBil", waybil);

// Generate a random origin reference (e.g., IA0200012345)
// EDI Field 
function generateOriginReference(){
const prefix = "IA02000";
const randomNumber = Math.floor(10000 + Math.random() * 90000); 
return prefix + randomNumber;
}

const originRef = generateOriginReference();
pm.environment.set("orgRef", orgRef);

// setting all necessary variables to be used in xmlTemplate below; and where to access them. 
// environement scope is the easiest to access for console logging.
// this allows me to log my variables at certain point to debug if necessary. 
// Logging my Variables at different points of the script help me see how the script is generating the values and what potential changes I can take to mitigate the problem 
// Setting them in the request with 'const' or 'var' works too.

let wh_id = pm.environment.get("wh_id");
let csExpectedqty = pm.environment.get("csExpectedqty");
let unitsperCase = pm.environment.get("unitsperCase");
let untPak = pm.environment.get("untPak");
let expDte = pm.environment.get("expDte");
let wayBil = pm.environment.get("wayBil");
let Sts01 = pm.environment.get("Sts01");
let coo01 = pm.environment.get("coo01");
let numCas = pm.environment.get("numCas")
let adressName = pm.globals.get("addressName")
let orgRef = pm.environment.get("orgRef")
let itemNo = pm.environment.get("itemNo")
let totexpectedQty = pm.environment.get("totexpectedQty")
let generatedCaseIdentifiers = []; 


// Create an Array to hold the case numbers to be logged later
  // this helps me easily share or translate the data I have created within the WMS to the testing team.
  
let generatedCaseIdentifiers = []; 

// Get the number of cases from a variable or user input
// could use const numCases = '3'; or any number of cases to set it in the script

const numCases = pm.environment.get("numCas") || 3; // Default to 3 if not provided

// Create an array to hold the case data
const cases = []; 

// Populate the cases array with the required number of cases
for (let i = 1; i <= numCases; i++) { // basically if numCases is more than 1 then create and array and save it here
cases.push({ 
caseIdentifier: generateSubLPN(), //function called for the amount of cases here 
// ... add other case-specific data if needed
});
}



// Build the asn:AdvancedShipmentNotice elements for each case
// loop for number of generatedcaseIdentifiers.
let asnXml = "";
for (const caseData of cases) {
const LPN = generateLPN(); // Generate a new LPN for each case

//EDI segment per case gets constructed here 
// backticks for template literal ``
asnXml += `<asn:AdvancedShipmentNotice>
<UnitsPerCase>${unitsperCase}</UnitsPerCase>
<UnitsPerPack>${untPak}</UnitsPerPack>
<UnitQuantity>${csExpectedqty}</UnitQuantity>
<InventoryStatus>${Sts01}</InventoryStatus>
<LPN>${LPN}</LPN>  
<CaseIdentifier>${caseData.caseIdentifier}</CaseIdentifier>  
<PieceIdentifier/>
<DestinationLocation>${inbShipment}</DestinationLocation>
<OriginCode>${coo01}</OriginCode>
</asn:AdvancedShipmentNotice>`;

generatedCaseIdentifiers.push(caseData.caseIdentifier); 

} //end of loop for segment creation per case

// Now, embed the generated asnXml into your main XML template
// the main XML template holds the overall order data (supplier info, address name, routing info, etc..)
// establish the xmlTemplate as a template literal using backticks to make sure EDI structure remains consistent with every request.
var xmlTemplate = `<?xml version="1.0" encoding="utf-8"?>
 {.......EDI Elements and Attributes here using all assigned variables..........}
${asnXml}  // the asnXML segments are embedded here 
</rln:ReceiptLine>
</isard:ISAReceiptDetail>
</isaod:ISAOrderDetail>
</rct:Receipt>
</iis:InboundShipment>
</ns1:InboundShipmentAdvice>`;

pm.environment.set("generatedCaseIdentifiers", generatedCaseIdentifiers.join(", "));
console.log("Generated Case Identifiers:", generatedCaseIdentifiers);

console.log(xmlTemplate); 

pm.request.body.raw = xmlTemplate; 
