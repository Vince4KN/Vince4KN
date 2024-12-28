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

const waybill = generateWaybill();
pm.environment.set("wayBil", waybil);

// Generate a random origin reference (e.g., IA0200012345)
function generateOriginReference(){
const prefix = "IA02000";
const randomNumber = Math.floor(10000 + Math.random() * 90000); 
return prefix + randomNumber;
}

const originRef = generateOriginReference();
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
let adressName = pm.globals.get("addressName")
let orgRef = pm.environment.get("orgRef")
let itemNo = pm.environment.get("itemNo")
let totexpectedQty = pm.environment.get("totexpectedQty")
let generatedCaseIdentifiers = []; 




// Get the number of cases from a variable or input
const numCases = pm.environment.get("numCas") || 3; // Default to 3 if not provided

// Create an array to hold the case data
const cases = []; 

// Populate the cases array with the required number of cases
for (let i = 1; i <= numCases; i++) {
cases.push({ 
caseIdentifier: generateSubLPN(), 
// ... add other case-specific data if needed
});
}



// Build the asn:AdvancedShipmentNotice elements for each case
let asnXml = "";
for (const caseData of cases) {
const LPN = generateLPN(); // Generate a new LPN for each case
asnXml += `<asn:AdvancedShipmentNotice>
<UnitsPerCase>${unitsperCase}</UnitsPerCase>
<UnitsPerPack>${untPak}</UnitsPerPack>
<UnitQuantity>${csExpectedqty}</UnitQuantity>
<InventoryStatus>${Sts01}</InventoryStatus>
<Footprint/>
<FIFODate/>
<LPN>${LPN}</LPN>  
<CaseIdentifier>${caseData.caseIdentifier}</CaseIdentifier>  
<PieceIdentifier/>
<DestinationLocation>${inbShipment}</DestinationLocation>
<OriginCode>${coo01}</OriginCode>
<Revision/>
<LotNumber/>
<SupplierLotNumber/>
<AgingProfile/>
<ManufacturedDate/>
<ExpiryDate/>
<DistributionIdentifier/>
<HandlingUnitType/>
<InventoryAttributeDate1/>
<InventoryAttributeDate2/>
<InventoryAttributeText1/>
<InventoryAttributeText2/>
<InventoryAttributeText3/>
<InventoryAttributeText4/>
<InventoryAttributeText5/>
<InventoryAttributeText6/>
<InventoryAttributeText7/>
<InventoryAttributeText8/>
<InventoryAttributeText9/>
<InventoryAttributeText10/>
<InventoryAttributeText11/>
<InventoryAttributeText12/>
<InventoryAttributeText13/>
<InventoryAttributeText14/>
<InventoryAttributeText15/>
<InventoryAttributeText16/>
<InventoryAttributeText17/>
<InventoryAttributeText18/>
<CustomsConsignmentID/>
<UnderBond/>
<ExciseDutyStampTracked/>
<SSCCPrefixFlag/>
<CustomsType/>
</asn:AdvancedShipmentNotice>`;

generatedCaseIdentifiers.push(caseData.caseIdentifier); 

}

// Now, embed the generated asnXml into your main XML template
var xmlTemplate = `<?xml version="1.0" encoding="utf-8"?>
<ns1:InboundShipmentAdvice xmlns:nte="http://kn.swiftlog/note/0200" xmlns:rct="http://kn.swiftlog/Receipt/0200" xmlns:adr="http://kn.swiftlog/address/0200" xmlns:rou="http://kn.swiftlog/routing/0200" xmlns:ref="http://kn.swiftlog/reference/0200" xmlns:rln="http://kn.swiftlog/ReceiptLine/0200" xmlns:isaod="http://kn.swiftlog/ISAOrderDetail/0200" xmlns:isaio="http://kn.swiftlog/ISAInboundOrder/0200" xmlns:iis="http://kn.swiftlog/InboundShipment/0200" xmlns:isard="http://kn.swiftlog/ISAReceiptDetail/0200" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://kn.swiftlog/InboundShipmentAdvice/0200" xmlns:asn="http://kn.swiftlog/advancedshipmentnotice/0200" xmlns:sn="http://kn.swiftlog/serialnumber/0200" xmlns:n1="http://www.w3.org/2001/XMLSchema-instance">
<rou:Routing>
<rou:Uuid>${request_id}</rou:Uuid>
<rou:JMSCorrelationID>${request_id}</rou:JMSCorrelationID>
<rou:KNESB_Routing_Country>US</rou:KNESB_Routing_Country>
<rou:KNESB_Routing_Warehouse>${wh_id}</rou:KNESB_Routing_Warehouse>
<rou:KNESB_Routing_Client>ONRUN</rou:KNESB_Routing_Client>
<rou:KNESB_Routing_ReceiverId>SwiftLog</rou:KNESB_Routing_ReceiverId>
</rou:Routing>
<MessageType>InboundShipmentAdvice</MessageType>
<MessageVersion>0210</MessageVersion>
<ProcessMode>A</ProcessMode>
<iis:InboundShipment>
<Warehouse>${wh_id}</Warehouse>
<InboundShipment>${inbShipment}</InboundShipment>
<InboundShipmentReference>${inbShipment}</InboundShipmentReference>
<GrossWeight>10000</GrossWeight>
<NumberofPallets>1</NumberofPallets>
<FreightCost>
<Value>100</Value>
<Currency>USD</Currency>
</FreightCost>
<NumberofCases>${numCas}</NumberofCases>
<ExpectedDate>${expDte}</ExpectedDate>
<ShippedDate/>
<MasterBOL>${wayBil}</MasterBOL>
<DocumentNumberBOL>BOL-${wayBil}</DocumentNumberBOL>
<PRO/>
<rct:Receipt>
<adr:Address>
<AddressType>Supplier</AddressType>
<AddressName>${adressName}</AddressName>
<LocaleID>US_ENGLISH</LocaleID>
<TimeZone>America/New_York</TimeZone>
<AddressLine1>777 Forex Road</AddressLine1>
<AddressLine2/>
<AddressLine3/>
<City>Boca Raton</City>
<PostalCode>33431</PostalCode>
<Country>USA</Country>
<StateProvince/>
</adr:Address>
<Receipt>${inbOrder}</Receipt>
<Client>ONRUN</Client>
<isaod:ISAOrderDetail>
<isard:ISAReceiptDetail>
<InboundOrderType>P</InboundOrderType>
<ReceiptDate/>
<OriginatorReference>${orgRef}</OriginatorReference>
<SADNumber>${inbOrder}</SADNumber>
<WaybillBOL>${wayBil}</WaybillBOL>
<CustomsOrderType>F</CustomsOrderType>
<rln:ReceiptLine>
<ReceiptLine>001</ReceiptLine>
<ReceiptSubLine>001</ReceiptSubLine>
<ItemClient>ONRUN</ItemClient>
<Item>${itemNo}</Item>
<ExpectedQuantity>${totexpectedQty}</ExpectedQuantity>
<ReceiveStatus>${Sts01}</ReceiveStatus>
<ExpectedLotNumber/>
<ExpectedExpirationDate/>
<ExpectedManufacturedDate/>
<ExpectedInventoryAttributeDate1/>
<ExpectedInventoryAttributeDate2/>
<ExpectedInventoryAttributeText1/>
<ExpectedInventoryAttributeText2/>
<ExpectedInventoryAttributeText3/>
<ExpectedInventoryAttributeText4/>
<ExpectedInventoryAttributeText5/>
<ExpectedInventoryAttributeText6/>
<ExpectedInventoryAttributeText7/>
<ExpectedInventoryAttributeText8/>
<ExpectedInventoryAttributeText9/>
<ExpectedInventoryAttributeText10/>
<ExpectedInventoryAttributeText11/>
<ExpectedInventoryAttributeText12/>
<ExpectedInventoryAttributeText13/>
<ExpectedInventoryAttributeText14/>
<ExpectedInventoryAttributeText15/>
<ExpectedInventoryAttributeText16/>
<ExpectedInventoryAttributeText17/>
<ExpectedInventoryAttributeText18/>
<CustomsOrderType></CustomsOrderType>
<CommodityCode></CommodityCode>
<CustomsCost>
<Value>001.00</Value>
<Currency>USD</Currency>
</CustomsCost>
<CustomsVATCode>Z</CustomsVATCode>
<DutyStampTracked>1</DutyStampTracked>
<DefaultOriginCode>${coo01}</DefaultOriginCode>
${asnXml}  
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
