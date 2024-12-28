// --- Generate LC-ONRUN-ORDER-LINE-SEG segments ---
const numLines = 1; //number of lines must match number of items; update accordingly
const items = ["60.98697 W 8.5"];
// Define the quantities for each item
const quantities = [2]; 
function generateLineSegment(orderNumber, lineNum, lineItem, orderquantity, carrierCode, serviceLvl, earlyShipDate, earlyDlvDate, lateShipDate, lateDlvDate) {
    // ... (The function body remains the same, but use 'lineItem' in the <PRTNUM> tag) ...
}


// linesegments creation base on numLines set above
let lineSegments = "";
for (let i = 0; i < numLines; i++) {
    let lineNum = '0' + Math.floor(10000000 + Math.random() * 90000000);

    let lineItem = items[i % items.length];

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
    return `//input xmlTemplate here`}