# Template files to use :
#'LC-ONRUN-ORDER-INB-IFD(NON-VAS1Line)WIP.xml'
#'LC-ONRUN-ORDER-INB-IFD(NON-VAS2Line)WIP.xml'
#'LC-ONRUN-ORDER-INB-IFD(NON-VAS6Line)WIP.xml'(In Progress)
#'LC-ONRUN-ORDER-INB-IFD(NON-VAS10Line)WIP.xml'(In Progress)

Given the following attachments of the issue "${Orders_Repository}" are loaded
| LC-ONRUN-ORDER-INB-IFD(NON-VAS1Line)WIP.xml |


# List the Variables
And list of variables
| Variable  | Value                     |
#Enter order number here
| ordNum    | TST0100000408             |
| adrNam    | Anybody Anywhere          |
| adrLn1    | 4876 Northford Place West |
| adrCty    | Jacksonville              |
| adrSts    | FL                        |
| adrPoscod | 32257                     |
# Change Order TYPE; 'MPO NON-VAS', 'SPO NON-VAS'
| ordTyp | MPO NON-VAS |
# Dept = 'B2B' or 'B2C' 
| deptNo | B2C                      |
| cpoNum | ${generateStrID('R', 9)} |
| cpoDte | ${getTimestamp()}        |
# Carriers and Service Levels to use:
#carCod = 'FED-NE', Srvlvl = 'GROUND' or 'HOME DELIV'
#carCod = 'FED-EX', Srvlvl = '2DAY' or 'SAMEDAY'
#carCod = 'UPS-NE', Srvlvl = 'GROUND'
| carCod  | FED-NE                     |
| srvlvl  | GROUND                     |
| invNum  | TST01                      |
| PckGr3  | ${cpoNum}                  |
| lnNum1  | ${generateStrID('IO0', 9)} |
| lnNum2  | ${generateStrID('IO0', 9)} |
| lnNum3  | ${generateStrID('IO0', 9)} |
| lnNum4  | ${generateStrID('IO0', 9)} |
| lnNum5  | ${generateStrID('IO0', 9)} |
| lnNum6  | ${generateStrID('IO0', 9)} |
| lnNum7  | ${generateStrID('IO0', 9)} |
| lnNum8  | ${generateStrID('IO0', 9)} |
| lnNum9  | ${generateStrID('IO0', 9)} |
| lnNum10 | ${generateStrID('IO0', 9)} |
#FedEx Acct Num. = 572820920 ; UPS Acct. Num = A42V71 
| b2aNum     | 572820920                                         |
| expDte     | ${getTimestamp()}                                 |
| earlshpdte | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 1)}   |
| earldlvdte | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 2)}   |
| lateshpdte | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
| latedlvdte | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
| ordQty01   | 2                                                 |
| item01     | 3WD10540108 W 5.5                                 |
| ordQty02   | 3                                                 |
| item02     | 3WD10540108 W 6                                   |
| ordQty03   | 3                                                 |
| item03     | 71.98668 W 8.5                                    |
| ordQty04   | 3                                                 |
| item04     | 71.98668 W 10                                     |
| ordQty05   | 3                                                 |
| item05     | 41.99003 W 11                                     |
| ordQty06   | 3                                                 |
| item06     | 46.98077 W 10                                     |
| ordQty07   | 3                                                 |
| item07     | 42.98711 M 12                                     |
| ordQty08   | 3                                                 |
| item08     | 105.4600 M M                                      |
| ordQty09   | 3                                                 |
| item09     | 230.01072 W L                                     |
| ordQty10   | 3                                                 |
| item10     | 548.01657 M M                                     |


# Create Outbound Order via sending EDI message
When the user sends the EDI message successfully with the following data
| MessageType    | LC-ONRUN-ORDER-INB-IFD                      |
| MessageVersion | 2020.1                                      |
| Template       | LC-ONRUN-ORDER-INB-IFD(NON-VAS1Line)WIP.xml | 

# Check: Outbound Order creation
Then outbound order "${ordNum}" is created