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