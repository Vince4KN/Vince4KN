var extDigit = 1; // Changed to 1 for valid SSCC
var companyPrefix = '0000'; // Changed to string for proper concatenation
var startRange = 1;
var increment = 1;
var counter = 1;

function setSSCCParms(extDigit, companyPrefix, startRange, increment) {
    this.extDigit = extDigit;
    this.companyPrefix = companyPrefix;

    if (startRange == null) {
        this.startRange = pm.collectionVariables.get("MU_SSCC_COUNTER");
    } else {
        this.startRange = startRange;
    }

    if (increment == null) {
        increment = 1;
    }

    this.increment = increment;
    this.counter = this.startRange;
}

function createSSCC() {
    var applicationIdentifier = '00';
    var sscc = applicationIdentifier + String(this.extDigit) + String(this.companyPrefix); // had to stringify these to correct the padding length calc

    var lengthSSCC = sscc.length;
    var paddingLength = 17 - lengthSSCC; 
    var randomDigits = '';

    // Generate random digits instead of leading zeros
    for (let i = 0; i < paddingLength; i++) {
        randomDigits += Math.floor(Math.random() * 10); 
    }

    sscc = sscc + randomDigits; 

    
    var checkSum = 0; // Initialize checkSum here
    for (var i = 0; i < sscc.length; ++i) {
        if (i % 2 !== 0) { 
            checkSum = checkSum + (sscc[i] * 3);
        } else {
            checkSum = checkSum + (sscc[i] * 1);
        }
    }

    var checkDigit = (Math.ceil(checkSum / 10) * 10) - checkSum;

    sscc = sscc + checkDigit; 

    this.counter = parseInt(this.counter) + parseInt(this.increment);
    pm.collectionVariables.set("MU_SSCC_COUNTER", this.counter);
    return sscc;
}

module.exports = {
    setSSCCParms,
    createSSCC
};