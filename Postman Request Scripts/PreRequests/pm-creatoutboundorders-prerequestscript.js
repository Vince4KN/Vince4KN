    var uuid = require('uuid');
    var request_id = uuid.v4();
    pm.environment.set("request_id", request_id);

// Generate a random customer name 
const firstNames = ["Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry", "Isabella", "Jack"];
const lastNames = ["Smith", "Jones", "Williams", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson"];

const randomFirstNameIndex = Math.floor(Math.random() * firstNames.length);
const randomLastNameIndex = Math.floor(Math.random() * lastNames.length);

const randomFirstName = firstNames[randomFirstNameIndex];
const randomLastName = lastNames[randomLastNameIndex];

const addressName = `${randomFirstName} ${randomLastName}`;
pm.environment.set("addressName", addressName);

const addresses = pm.globals.get('addressData').split('ONRUN');

const parsedAddresses = [];
for (let i = 1; i < addresses.length; i++) { // Start from 1 to skip the initial empty string
    const addressLines = addresses[i].trim().split('\n'); 

    // Check if we have enough lines for an address
    if (addressLines.length >= 5) { 
        const address = {
            id: 'ONRUN', // Since "ONRUN" is the separator
            name1: addressLines[0].trim(),
            name2: addressLines[1].trim(),
            street: addressLines[2].trim(),
            addressline1: addressLines[3].trim(), // Capture the address line
            cityStateZip: addressLines[4].trim(),
            code: addressLines[4].trim()  // Just use the cityStateZip as code
        };

        // Split city, state, and zip from cityStateZip
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
                    console.error(`Invalid state and zip format: ${cityStateZipParts[1]}`);
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
               
                console.error(`Could not parse cityStateZip: ${address.cityStateZip}`); 
            }
            address.city = city;
            address.state = state;
            address.zipCode = zipCode;
        }

        parsedAddresses.push(address); 
    } else {
        console.error(`Incomplete address data at index ${i}`);
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
const selectedAddress = JSON.parse(pm.environment.get('selectedAddress'));


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
const numLines = 1;
const items = ["60.98697 W 8.5"];
// Define the quantities for each item
const quantities = [1]; // 10 units for the first item, 2 for the second
function generateLineSegment(orderNumber, lineNum, lineItem, orderquantity, carrierCode, serviceLvl, earlyShipDate, earlyDlvDate, lateShipDate, lateDlvDate) {
    // ... (The function body remains the same, but use 'lineItem' in the <PRTNUM> tag) ...
}

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
<PRT_CLIENT_ID>ONRUN</PRT_CLIENT_ID>
<ORGCOD/>
<REVLVL/>
<LOTNUM/>
<SUP_LOTNUM/>
<INVSTS/>
<ORDQTY>${orderquantity}</ORDQTY>
<MARCOD/>
<PRCPRI/>
<OVAFLG/>
<OVPFLG/>
<OVPFLG/>
<RPQFLG>0</RPQFLG>
<OVRCOD/>
<OVRAMT>0</OVRAMT>
<STDFLG>0</STDFLG>
<PARFLG>1</PARFLG>
<BCKFLG>0</BCKFLG>
<CARCOD>${carrierCode}</CARCOD>
<CARGRP/>
<SRVLVL>${serviceLvl}</SRVLVL>
<FRTCOD/>
<COOINC/>
<COOLST/>
<ACCNUM/>
<PRJNUM/>
<CSTPRT/>
<MANFID/>
<DEPTNO/>
<UNTPAK/>
<UNTPAL/>
<UNTCAS/>
<EARLY_SHPDTE>${earlyShipDate}</EARLY_SHPDTE>
<EARLY_DLVDTE>${earlyDlvDate}</EARLY_DLVDTE>
<LATE_SHPDTE>${lateShipDate}</LATE_SHPDTE>
<LATE_DLVDTE>${lateDlvDate}</LATE_DLVDTE>
<SRC_HOST_ADR_ID/>
<RSVPRI/>
<RSVQTY/>
<PCKGR1/>
<PCKGR2/>
<PCKGR3/>
<PCKGR4/>
<DSTLOC/>
<XDKFLG/>
<PRT_DL_TYP>N</PRT_DL_TYP>
<ATOFLG/>
<HOST_ORDQTY>${orderquantity}</HOST_ORDQTY>
<HSTSTS/>
<SPLFLG>1</SPLFLG>
<INVSTS_PRG>A</INVSTS_PRG>
<FRSFLG/>
<MIN_SHELF_HRS/>
<ORDINV/>
<NON_ALC_FLG>0</NON_ALC_FLG>
<UNT_PRICE/>
<WAVE_SET/>
<CRNCY_NAME/>
<TOT_PLN_MISC_QTY/>
<TOT_PLN_MISC2_QTY/>
<SUPNUM/>
<CRNCY_CODE/>
<BTO_COMCOD/>
<BTO_DLV_SEQ/>
<BTO_STATION/>
<FTPCOD/>
<ABS_ORDINV_WIN/>
<ABS_ORDINV_CODE/>
<PAYTRM>PRE</PAYTRM>
<SED_EXPORT_TYP/>
<COONUM/>
<COOTYP/>
<ECCN/>
<EXPLICEXCPT/>
<EXPLICNUM/>
<IMPLICEXCPT/>
<IMPLICEXPDTE/>
<IMPLICNUM/>
<MARKSNUMBERS/>
<NAFTABEGDTE/>
<NAFTAENDDTE/>
<NAFTA_PREF_CRIT/>
<NAFTA_PRODUCER/>
<SEDFLG/>
<TRADEAGREETYP/>
<EXPORT_TYP/>
<RULE_NAM/>
<MANDTE/>
<EXPIRE_DTE/>
<MANDTE_FMT/>
<MANDTE_FMTVAL/>
<EXPIRE_DTE_FMT/>
<EXPIRE_DTE_FMTVAL/>
<DISTRO_ID/>
<SOURCE_WH/>
<SOURCE_DISTRO_ID/>
<SOURCE_WH_HOST_EXT_ID/>
<PROMO_COD/>
<INVNUM/>
<SUPNUM_DISTRO/>
<TRKNUM/>
<INVLIN/>
<INVSLN/>
<STO_ALC_FLG/>
<INV_ATTR_STR1/>
<INV_ATTR_STR2/>
<INV_ATTR_STR3/>
<INV_ATTR_STR4/>
<INV_ATTR_STR5/>
<INV_ATTR_STR6/>
<INV_ATTR_STR7/>
<INV_ATTR_STR8/>
<INV_ATTR_STR9/>
<INV_ATTR_STR10/>
<INV_ATTR_STR11/>
<INV_ATTR_STR12/>
<INV_ATTR_STR13/>
<INV_ATTR_STR14/>
<INV_ATTR_STR15/>
<INV_ATTR_STR16/>
<INV_ATTR_STR17/>
<INV_ATTR_STR18/>
<INV_ATTR_INT1/>
<INV_ATTR_INT2/>
<INV_ATTR_INT3/>
<INV_ATTR_INT4/>
<INV_ATTR_INT5/>
<INV_ATTR_FLT1/>
<INV_ATTR_FLT2/>
<INV_ATTR_FLT3/>
<INV_ATTR_DTE1/>
<INV_ATTR_DTE1_FMT/>
<INV_ATTR_DTE1_FMTVAL/>
<INV_ATTR_DTE2/>
<INV_ATTR_DTE2_FMT/>
<INV_ATTR_DTE2_FMTVAL/>
<ALLOW_OVRSHPFLG>0</ALLOW_OVRSHPFLG>
<ORDLIN_CHG_REACOD/>
<REACOD_CMNT/>
<ASSET_TYP/>
<LOAD_ATTR1_CFG/>
<LOAD_ATTR2_CFG/>
<LOAD_ATTR3_CFG/>
<LOAD_ATTR4_CFG/>
<LOAD_ATTR5_CFG/>
<CANCELLED_FLG/>
<TOT_PLN_CUBE/>
<TOT_PLN_WGT/>
<TOT_PLN_CAS_QTY/>
<TOT_PLN_PAL_QTY/>
<BLK_SLOT_ONLY_FLG/>
<coo>VN</coo>
<hs_code/>
</LC-ONRUN-ORDER-LINE-SEG>`;
}

//first half of LC-ONRUN-ORDER-INB-IFD

const xmlTemplate = `<?xml version="1.0" encoding="utf-8"?>
<LC-ONRUN-ORDER-INB-IFD xmlns:knlookup="de.kn.xslt.extensions.KnTableLookup">
<CTRL_SEG> 
<TRNNAM>ORDER_TRAN</TRNNAM>
<TRNVER>2020.1</TRNVER>
<WHSE_ID>${wh_id}</WHSE_ID> 
<ST_CUST_SEG>
<SEGNAM>ST_CUST_SEG</SEGNAM>
<CLIENT_ID>ONRUN</CLIENT_ID>
<HOST_EXT_ID>ST${orderNumber}</HOST_EXT_ID>
<ADRNAM>${addressName}</ADRNAM>
<ADRTYP>CST</ADRTYP>
<ADRLN1>${selectedAddress.addressline1}</ADRLN1> 
<ADRLN2/>
<ADRLN3/>
<ADRCTY>${selectedAddress.city}</ADRCTY> 
<ADRSTC>${selectedAddress.state}</ADRSTC> 
<ADRPSZ>${selectedAddress.zipCode}</ADRPSZ> 
<CTRY_NAME>USA</CTRY_NAME>
<RGNCOD/>
<PHNNUM>(312) 343-0584</PHNNUM>
<FAXNUM/>
<RSAFLG/>
<TEMP_FLG>1</TEMP_FLG>
<LAST_NAME/>
<FIRST_NAME/>
<HONORIFIC>B2C</HONORIFIC>
<ADR_DISTRICT/>
<WEB_ADR/>
<EMAIL_ADR>YourMomsEmail@gmail.com</EMAIL_ADR>
<PAGNUM/>
<LOCALE_ID>US_ENGLISH</LOCALE_ID>
<ATTN_NAME/>
<ATTN_TEL/>
<CONT_NAME/>
<CONT_TEL/>
<CONT_TITLE/>
<PO_BOX_FLG/>
<SHIP_PHNNUM>(312) 343-0584</SHIP_PHNNUM>
<SHIP_FAXNUM/>
<SHIP_WEB_ADR/>
<SHIP_EMAIL_ADR/>
<SHIP_CONT_NAME>${addressName}</SHIP_CONT_NAME>
<SHIP_CONT_TITLE/>
<SHIP_CONT_TEL>(312) 343-0584</SHIP_CONT_TEL>
<SHIP_ATTN_NAME/>
<SHIP_ATTN_PHNNUM/>
</ST_CUST_SEG>
<RT_CUST_SEG>
<SEGNAM>RT_CUST_SEG</SEGNAM>
<CLIENT_ID>ONRUN</CLIENT_ID>
<HOST_EXT_ID>RT${orderNumber}</HOST_EXT_ID>
<ADRNAM>${addressName}</ADRNAM>
<ADRTYP>CST</ADRTYP>
<ADRLN1>${selectedAddress.addressline1}</ADRLN1> 
<ADRLN2/>
<ADRLN3/>
<ADRCTY>${selectedAddress.city}</ADRCTY> 
<ADRSTC>${selectedAddress.state}</ADRSTC> 
<ADRPSZ>${selectedAddress.zipCode}</ADRPSZ> 
<CTRY_NAME>USA</CTRY_NAME>
<RGNCOD/>
<PHNNUM>(312) 343-0584</PHNNUM>
<FAXNUM/>
<RSAFLG/>
<TEMP_FLG>1</TEMP_FLG>
<LAST_NAME/>
<FIRST_NAME/>
<HONORIFIC>B2C</HONORIFIC>
<ADR_DISTRICT/>
<WEB_ADR/>
<EMAIL_ADR>YourMomsEmail@gmail.com</EMAIL_ADR>
<PAGNUM/>
<LOCALE_ID>US_ENGLISH</LOCALE_ID>
<ATTN_NAME/>
<ATTN_TEL/>
<CONT_NAME/>
<CONT_TEL/>
<CONT_TITLE/>
<PO_BOX_FLG/>
<SHIP_PHNNUM>(312) 343-0584</SHIP_PHNNUM>
<SHIP_FAXNUM/>
<SHIP_WEB_ADR/>
<SHIP_EMAIL_ADR/>
<SHIP_CONT_NAME>${addressName}</SHIP_CONT_NAME>
<SHIP_CONT_TITLE/>
<SHIP_CONT_TEL>(312) 343-0584</SHIP_CONT_TEL>
<SHIP_ATTN_NAME/>
<SHIP_ATTN_PHNNUM/>
</RT_CUST_SEG>
<BT_CUST_SEG>
<SEGNAM>BT_CUST_SEG</SEGNAM>
<CLIENT_ID>ONRUN</CLIENT_ID>
<HOST_EXT_ID>ON_FED_BT</HOST_EXT_ID>
<ADRNAM>KUEHNE+NAGEL,INC</ADRNAM>
<ADRTYP>CST</ADRTYP>
<ADRLN1>C/O ON INC</ADRLN1>
<ADRLN2>125 COLVIN DRIVE</ADRLN2>
<ADRLN3/>
<ADRCTY>LOCUST GROVE</ADRCTY>
<ADRSTC>GA</ADRSTC>
<ADRPSZ>30248</ADRPSZ>
<CTRY_NAME>USA</CTRY_NAME>
<RGNCOD/>
<PHNNUM>(312) 343-0584</PHNNUM>
<FAXNUM/>
<RSAFLG/>
<TEMP_FLG>1</TEMP_FLG>
<LAST_NAME/>
<FIRST_NAME/>
<HONORIFIC>B2C</HONORIFIC>
<ADR_DISTRICT/>
<WEB_ADR/>
<EMAIL_ADR/>
<PAGNUM/>
<LOCALE_ID>US_ENGLISH</LOCALE_ID>
<ATTN_NAME/>
<ATTN_TEL/>
<CONT_NAME/>
<CONT_TEL/>
<CONT_TITLE/>
<PO_BOX_FLG/>
<SHIP_PHNNUM>(312) 343-0584</SHIP_PHNNUM>
<SHIP_FAXNUM/>
<SHIP_WEB_ADR/>
<SHIP_EMAIL_ADR/>
<SHIP_CONT_NAME>KUEHNE+NAGEL,INC</SHIP_CONT_NAME>
<SHIP_CONT_TITLE/>
<SHIP_CONT_TEL>(312) 343-0584</SHIP_CONT_TEL>
<SHIP_ATTN_NAME/>
<SHIP_ATTN_PHNNUM/>
</BT_CUST_SEG>
<LC-ONRUN-ORDER-SEG>
<SEGNAM>LC-ONRUN-ORDER-SEG</SEGNAM>
<TRNTYP>A</TRNTYP>
<CLIENT_ID>ONRUN</CLIENT_ID>
<ORDNUM>${orderNumber}</ORDNUM>
<ORDTYP>${orderType}</ORDTYP>
<ENTDTE>${cpoDate}</ENTDTE>
<STCUST>ST${orderNumber}</STCUST>
<ST_HOST_ADR_ID>ST${orderNumber}</ST_HOST_ADR_ID>
<RTCUST>RT${orderNumber}</RTCUST>
<RT_HOST_ADR_ID>RT${orderNumber}</RT_HOST_ADR_ID>
<BTCUST>ON_FED_BT</BTCUST>
<BT_HOST_ADR_ID>ON_FED_BT</BT_HOST_ADR_ID>
<MFCUST/>
<CDCUST/>
<CPONUM>${cpoNum}</CPONUM>
<CPODTE>${cpoDate}</CPODTE>
<CPOTYP>B2C</CPOTYP>
<PAYTRM>PRE</PAYTRM>
<CARFLG>1</CARFLG>
<SHIPBY>ordnum</SHIPBY>
<RRLFLG/>
<WAVE_FLG/>
<REQUIR_TMS_FLG/>
<COD_FLG/>
<ORD_FRTRTE/>
<BCO_FLG>1</BCO_FLG>
<SIG_REQ_FLG/>
<BILL_FREIGHT_FLG/>
<COD_PAYMENT_TYPE/>
<PAYMENT_TYPE/>
<RMANUM>${cpoNum}</RMANUM>
<BRCUST/>
<BR_HOST_ADR_ID/>
<COD_IND_TYPE/>
<CUSTOMS_CLR_FLG/>
<SRV_TYPE>1</SRV_TYPE>
<CRNCY_CODE/>
<BTO_SEQNUM/>
<SLOT/>
<RUSH_FLG>0</RUSH_FLG>
<DEPTNO>${deptNo}</DEPTNO>
<DEST_NUM/>
<DUTY_PAYMENT_TYPE/>
<DUTY_PAYMENT_ACCT>${b2aNum}</DUTY_PAYMENT_ACCT>
<EXCISE_DTYCUST/>
<CSTMS_ORDTYP/>
<DFLT_ORDLIN_CHG_REACOD/>
<PLAN_SLOT_SEQ/>
<DLVSEQ/>
<DLVNUM>Re-Order</DLVNUM>
<BUS_GRP>B2C</BUS_GRP>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>1</NOTLIN>
<NOTTXT>${orderNumber}-Re-Order-01</NOTTXT>
<NOTTYP>EDI</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>2</NOTLIN>
<NOTTXT>${cpoNum}</NOTTXT>
<NOTTYP>ERP</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>3</NOTLIN>
<NOTTXT>en_US</NOTTXT>
<NOTTYP>LOC</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>4</NOTLIN>
<NOTTXT>DDP</NOTTXT>
<NOTTYP>PAY</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>5</NOTLIN>
<NOTTXT>${b2aNum}</NOTTXT>
<NOTTYP>B2A</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>6</NOTLIN>
<NOTTXT>eComm Order</NOTTXT>
<NOTTYP>OTD</NOTTYP>
</ORDER_NOTE_SEG>
<ORDER_NOTE_SEG>
<SEGNAM>ORDER_NOTE</SEGNAM>
<ORDNUM>${orderNumber}</ORDNUM>
<NOTLIN>7</NOTLIN>
<NOTTXT>N - No Dates sent,use +2 months</NOTTXT>
<NOTTYP>DWD</NOTTYP>
</ORDER_NOTE_SEG>`;




// Insert the generated line segments into the request body
const requestBody = xmlTemplate +
    "\n" + lineSegments +
    "\n</LC-ONRUN-ORDER-SEG>" +
    "\n</CTRL_SEG>" +
    "\n</LC-ONRUN-ORDER-INB-IFD>";

// Set the updated request body
pm.request.body.raw = requestBody;

// Optional: Log the updated request body to the console
console.log(requestBody);
    
