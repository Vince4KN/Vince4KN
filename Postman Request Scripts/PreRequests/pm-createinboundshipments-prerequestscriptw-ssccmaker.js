var uuid = require('uuid');
var request_id = uuid.v4();
pm.environment.set("request_id", request_id);

// Import the sscc-maker package from your Postman Package Library
const ssccGenerator = pm.require('sscc-maker'); 

console.log(pm.require('sscc-maker')); // This should print the package contents

// Initialize SSCC parameters (extDigit, companyPrefix, startRange, increment)
ssccGenerator.setSSCCParms(9, 0000, 1, 1);  

// Generate a random inbound shipment number (e.g., INSHP12345678)
function generateInbShipmentNumber() {
const prefix = "INSHP";
const randomNumber = Math.floor(10000000 + Math.random() * 90000000); 
return prefix + randomNumber;
}

const inbShipment = generateInbShipmentNumber(); 
pm.environment.set("inbShipment", inbShipment);

// Generate a random inbound order number (e.g., INORD87654321)
function generateInbOrderNumber() {
const prefix = "INORD";
const randomNumber = Math.floor(10000000 + Math.random() * 90000000); 
return prefix + randomNumber;
}

const inbOrder = generateInbOrderNumber(); 
pm.environment.set("inbOrder", inbOrder);

// Generate a timestamp with a specified number of hours added
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
function generateLPN(){
const prefix = "LPN";
const randomNumber = Math.floor(100000000 + Math.random() * 900000000); 
return prefix + randomNumber;
}

// Generate a random SubLPN (e.g., 009123456789012345)
function generateSubLPN() {
const prefix = "009"; 
const randomNumber = Math.floor(1000000000000000 + Math.random() * 90000000000000000); 
return prefix + randomNumber;
}

// Generate a random waybill number (e.g., WB1234)
function generateWaybill(){
const prefix = "WB";
const randomNumber = Math.floor(1000 + Math.random() * 9000); 
return prefix + randomNumber;
}

const waybil = generateWaybill();
pm.environment.set("wayBil", waybil);

// Generate a random origin reference (e.g., IA0200012345)
function generateOriginReference(){
const prefix = "IA02000";
const randomNumber = Math.floor(10000 + Math.random() * 90000); 
return prefix + randomNumber;
}

const orgRef = generateOriginReference();
pm.environment.set("orgRef", orgRef);

// setting all necessary variables to be used in xmlTemplate (wh_id)

let wh_id = pm.environment.get("wh_id");
let csExpectedqty = pm.environment.get("csExpectedqty");
let unitsperCase = pm.environment.get("unitsperCase");
let untPak = pm.environment.get("untPak");
let expDte = pm.environment.get("expDte");
let wayBil = pm.environment.get("wayBil");
let Sts01 = pm.environment.get("Sts01");
let coo01 = pm.environment.get("coo01");
let numCas = pm.environment.get("numCas")
const addressName = pm.variables.replaceIn('{{$randomCompanyName}}');  //must use replaceIn because the xml iis already template literal 
console.log(addressName);
// let orgRef = pm.environment.get("orgRef")
let itemNo = pm.environment.get("itemNo");
let totexpectedQty = pm.environment.get("totexpectedQty");
let generatedCaseIdentifiers = [];  




// Get the number of cases from a variable or input
const numCases = pm.environment.get("numCas") || 3; // Default to 3 if not provided

// Create an array to hold the case data
const cases = []; 

// Populate the cases array with the required number of cases
for (let i = 1; i <= numCases; i++) {
    const newSSCC = ssccGenerator.createSSCC(); // Generate a new SSCC
    generatedCaseIdentifiers.push(newSSCC); // Store the SSCC
    cases.push({ 
        caseIdentifier: newSSCC, // Use the generated SSCC as the identifier
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
