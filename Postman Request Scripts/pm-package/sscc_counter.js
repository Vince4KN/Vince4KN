var extDigit = 1;
var companyPrefix = 1;
var startRange = 1;
var increment = 1;
var counter = 1;

/*
I am calling this function once per script execution to define all the important
values for the SSCC
startRange and increment can be null and will be defaulted from the session variable respective set to 1
*/

function setSSCCParms(extDigit, companyPrefix, startRange, increment){
    this.extDigit = extDigit;
    this.companyPrefix = companyPrefix;

    if(startRange == null){
        this.startRange = pm.collectionVariables.get("MU_SSCC_COUNTER");
    } else {
        this.startRange = startRange;

    }

    if(increment == null){
        increment = 1;
    }
    
    this.increment = increment;
    this.counter = this.startRange;
}

/*
this function is called every time I need a new SSCC
it is important that you called setSSCCParms() at least once BEFORE in your script to set all the master values!
*/

function createSSCC(){
    var applicationIdentifier = '00';
    var sscc = applicationIdentifier + this.extDigit + this.companyPrefix;

    //now that I have AI, extDigit and company prefix, I need to know how many digits are left for the number range
    //that means: 20 - AI - extDigit - companyPrefix - checkDigit

    var lengthSSCC = sscc.length;
    var paddingLength = 20 - lengthSSCC - 1;
    var checkSum = 0;

    //I can now build the complete SSCC excluding the check digit at the end
    sscc = sscc + String(this.counter).padStart(paddingLength, '0');

    /*
    now I need to calculate the check digit. For that I have to iterate over every character of the SSCC and multiply it by 3 or 1
    see https://ref.gs1.org/standards/genspecs/ - chapter 7.9 Check digit/character calculations for more details on that calculation
    */

    for (var i = 0; i < sscc.length; ++i){
        if(i % 2 == 0){
            checkSum = checkSum + (sscc[i] * 3);
        } else {
            checkSum = checkSum + (sscc[i] * 1);
        }
    }

    var checkDigit = (Math.ceil(checkSum/10)*10)-checkSum;

    //now I can add the checkDigit to my SSCC
    sscc = sscc + checkDigit;

    //final step is to increment the counter by the specified value and update the collection variable with the new value for the next iteration
    this.counter = parseInt(this.counter) + parseInt(this.increment);
    pm.collectionVariables.set("MU_SSCC_COUNTER", this.counter);
    //console.log("sscc: " + sscc);
    return sscc;
}

module.exports = {
    setSSCCParms, // Add a comma here 
    createSSCC
}; // Add a semicolon here
