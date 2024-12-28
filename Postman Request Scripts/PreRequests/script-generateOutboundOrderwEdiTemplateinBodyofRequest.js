// Order Information
function generateOrderNumber() {
    const prefix = "TSTORD__";
    const randomNumber = Math.floor(100000 + Math.random() * 900000);
    return prefix + randomNumber;
}
const orderNumber = generateOrderNumber() ;
pm.variables.set("orderNumber", orderNumber);


const orderType = "MPO VAS"; 
pm.variables.set("orderType", orderType);// e.g., "SO" for Sales Order
const serviceLevel = "LTL"; 
pm.variables.set("serviceLevel", serviceLevel);// e.g., "STD"
const carrierCode = "AVRT"
pm.variables.set("carrierCode", carrierCode);
// Line Item 1 Information
const itemNumber01 = "60.98697 W 8.5";
pm.variables.set("itemNumber01", itemNumber01);
const ordQty01 = "2";
pm.variables.set("ordQty01", ordQty01);
const itemEAN01 = "7630419100928";
pm.variables.set("itemEAN01", itemEAN01);

const lineNum1 = '0' + Math.floor(10000000 + Math.random() * 90000000);
pm.variables.set("lineNum1", lineNum1);


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

const cpoDte = getFrmTimestampPlusHours('yyyyMMddHHmmss', 6);
pm.variables.set("cpoDte", cpoDte); // Changed to pm.variables.set

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
pm.variables.set("earlyShipDate", earlyShipDate); // Changed to pm.variables.set

const earlyDlvDate = getFrmTimestampPlusDays('yyyyMMddHHmmss', 2);
pm.variables.set("earlyDlvDate", earlyDlvDate); // Changed to pm.variables.set

const lateShipDate = getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4);
pm.variables.set("lateShipDate", lateShipDate); // Changed to pm.variables.set

const lateDlvDate = getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4);
pm.variables.set("lateDlvDate", lateDlvDate);  // Changed to pm.variables.set 


pm.sendRequest