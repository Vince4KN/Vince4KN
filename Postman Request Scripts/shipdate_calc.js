const moment = require('moment');
​
var EARLY_SHPDTE = moment();
var EARLY_DLVDTE = moment();
​
var transitDays = 1;
​
var dateFormat = 'YYYYMMDD150000'; //being lazy here and hard coding the time to 15:00
EARLY_SHPDTE = moment().add(1, 'days'); //if you need sameday shipping, make it a 0 or delete the line
​
/*
here I am checking if the ship date would be on the current week's sunday (0), coming saturday (6) or coming sunday (7) and if so, add a day to it until it is a working day, see https://momentjscom.readthedocs.io/en/latest/moment/02-get-set/06-day/ for more details
*/
​
while(EARLY_SHPDTE.day() == 0 || EARLY_SHPDTE.day() == 6 || EARLY_SHPDTE.day() == 7){
    EARLY_SHPDTE.add(1, 'days'); 
}
​
/* 
next step is to assign the ship date to the delivery date and add the expected transit days to it
*/
​
EARLY_DLVDTE = EARLY_SHPDTE.clone(); 
EARLY_DLVDTE.add(transitDays, 'days'); 
​
/* 
Assuming that most carriers don't deliver on the weekend, I am doing the same check as above and shift the delivery date until it is a working day.
*/
​
while(EARLY_DLVDTE.day() == 0 || EARLY_DLVDTE.day() == 6 || EARLY_DLVDTE.day() == 7){
    EARLY_DLVDTE.add(1, 'days'); 
}
​
/*
Finally I am mapping the final date to the variable so I can use it in the actual message body with 
    {{EARLY_SHPDTE}}
    {{EARLY_DLVDTE}}
*/
​
pm.globals.set("EARLY_SHPDTE", EARLY_SHPDTE.format(dateFormat));
pm.globals.set("EARLY_DLVDTE", EARLY_DLVDTE.format(dateFormat));
​
console.log('EARLY_SHPDTE: ' + EARLY_SHPDTE.format(dateFormat));
console.log('EARLY_DLVDTE: ' + EARLY_DLVDTE.format(dateFormat));
