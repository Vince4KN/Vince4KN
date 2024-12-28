// Generate a random order number
function generateOrderNumber() {
    const prefix = "TSTORD__";
    const randomNumber = Math.floor(100000 + Math.random() * 900000);
    return prefix + randomNumber;
}
const orderNumber = generateOrderNumber() ;
pm.environment.set("orderNumber", orderNumber);
//----------------------------------------------------------------------------------------------------//
// Generate a random order number
function generateOrderNumber() {
    const prefix = "TSTORD__";
    const randomNumber = Math.floor(100000 + Math.random() * 900000);
    return prefix + randomNumber;
}
const orderNumber = pm.environment.get("orderNumber") ;
pm.environment.set("orderNumber", orderNumber);
