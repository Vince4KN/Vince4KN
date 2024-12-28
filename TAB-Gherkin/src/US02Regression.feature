@CLISTUS-1615 @CLISTUS-1604
	Scenario: RF Receiving & Put-away - 1 Line
		#**  Pre receiving
		    Given the following attachments of the issue "${Inbound_Repository}" are loaded
		      | ISHP_1line.xml                            |
		      | LC-ONRUN-MASTER-RCPT-COMPLETE(4Cases).xml |
		
		#** Define variables
		    And list of variables
		      | Variable        | Value                                            |
		      | InboundOrder    | ${generateStrID('INORD', 10)}                    |
		      | InboundShipment | IB${InboundOrder}                                |
		      | invTyp          | P                                                |
		      | wayBil          | 350856361824                                     |
		      | orgRef          | IA0200012987                                     |
		      | shpId           | IA0200012987                                     |
		      | hostExtId       | IA0200012987                                     |
		      | docNum          | B2B                                              |
		      | expDte          | ${getFrmTimestampPlusHours('yyyyMMddHHmmss', 6)} |
		      | invDte          | ${expDte}                                        |
		      | supNum          | ON00000001                                       |
		      | Item01          | TAITEM42                                         |
		      | expQty01        | 40                                               |
		      | rcvSts01        | A                                                |
		      | attrStr01-01    | 7630240424009                                    |
		      | attrStr01-02    | a0Z2o00000X8BUD                                  |
		
		#** Inbound Shipment Creation, LC-ONRUN-RCPT-INB-IFD message integration (WMS <- Client)
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-RCPT-INB-IFD |
		      | MessageVersion | 2020.1                |
		      | Template       | ISHP_1line.xml        |
		
		    And the user waits for 10 seconds
		
		#** Check: Inbound Shipment and Planned Inbound Order creation
		    Then inbound shipment "${InboundShipment}" is created
		    And planned inbound order "${InboundOrder}" for inbound shipment "${InboundShipment}" is created
		    And planned inbound order line "1" is created for order "${InboundOrder}" from shipment "${InboundShipment}"
		    
		## Transport Equipment creation/check-in
		    Given receiving transport equipment is created
		    And receiving transport equipment "${transportEquip.trailerName}" is attached to the inbound shipment "${InboundShipment}"
		
		    And receiving transport equipment "${transportEquip.trailerName}" is checked in without appointment to the available door
		    And receiving transport equipment "${transportEquip.trailerName}" is unloaded at the staging lane and dispatched
		    
		## Labels and RcptConf tracking 
		Given the user started tracking of outgoing EDI messages for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE"
		
		#Given the user started tracking of labels for the label format "lc_onrun_lpn_label"
		
		
		#/**/ Receiving /**/#
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "31"
		    And screen with "Receive Product" header is shown
		    And the user enters "${InboundShipment}" into "Receive ID" field
		    And unique number for "LPN" is saved as "lpn01" variable
		    And the user enters "${lpn01}" into "Inventory Identifier" field
		    And the user enters "${Item01}" into "Item Number" field
		    And the user enters "${expQty01}" into "Receive Quantity" field
		    And the user presses key "Enter" for "UOM" field
		    And the user enters "A" into "Inventory Status" field
		    And the user presses key "F6"
		    And screen with "Receive Product" header is shown
		    And unique number for "subLPN" is saved as "sub01" variable
		    And the user enters "${sub01}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub02" variable
		    And the user enters "${sub02}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub03" variable
		    And the user enters "${sub03}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub04" variable
		    And the user enters "${sub04}" into "Sub-LPN" field
		    And the pop up window with text "Any More To Receive?" is shown
		    And the user presses key "N" for the pop up
		    And screen with "Product Putaway" header is shown
		    And the user presses key "1"
		    
		#Then "2" labels for the label format "lc_onrun_lpn_label" are generated
		
		And screen with "MRG Product Deposit" header is shown
		    And value "${gv.client}" is shown in "Item Client ID" field
		    And value "${lpn01}" is shown in "LPN" field
		    And value from "Location" field (row "7") is saved as "location01" variable
		    
		## Get Location verification code
		    And the user executes SQL statement
		    """
		    [select locvrc,
		            stoloc
		       from locmst
		      where stoloc = '${location01}']
		    """
		    And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		    
		    And the user presses key "Enter" for "LPN" field
		    And the user enters "${locvrc01}" into "Location" field
		
		    And the user returns to undirected menu
		    And the user logs out from the device
		    
		
		#   And the user validated that "1" inventory exist with the following criteria
		#      | Location      | Item      | Quantity    |
		#      | ${location01} | ${Item01} | ${expQty01} |
		      
		     
		
		#    When the user closes inbound shipment "${InboundShipment}"
		#    Then inbound shipment "${InboundShipment}" is closed
		    
		    And outgoing EDI message for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE" is generated successfully
		    Then generated outgoing EDI message is validated against the template "LC-ONRUN-MASTER-RCPT-COMPLETE(4Cases).xml" successfully
		    
		    Given all inventory is removed from "${location01}" location with reason code "CRT"	

	
	@CLISTUS-1863 @CLISTUS-1604
	Scenario: RF Receiving & Put-away - Unknown Item
		#  Pre receiving
		    Given the following attachments of the issue "${Inbound_Repository}" are loaded
		      | ISHP_1line.xml                                 |
		      | LC-ONRUN-MASTER-REC-COMPLETE(unknownitem).xml  |
		
		# Define variables
		    And list of variables
		      | Variable        | Value                                            |
		      | InboundOrder    | ${generateStrID('INORD', 10)}                    |
		      | InboundShipment | IB${InboundOrder}                                |
		      | invTyp          | P                                                |
		      | wayBil          | 350856361824                                     |
		      | orgRef          | IA0200012987                                     |
		      | shpId           | IA0200012987                                     |
		      | hostExtId       | IA0200012987                                     |
		      | docNum          | B2B                                              |
		      | expDte          | ${getFrmTimestampPlusHours('yyyyMMddHHmmss', 6)} |
		      | invDte          | ${expDte}                                        |
		      | supNum          | ON00000001                                       |
		      | Item01          | 59.98919 M 13.5                                  |
		      | expQty01        | 40                                               |
		      | rcvSts01        | A                                                |
		      | attrStr01-01    | 7630440669497                                    |
		      | attrStr01-02    | a0Z2o00000X8BUD                                  |
		
		# Inbound Shipment Creation, LC-ONRUN-RCPT-INB-IFD message integration (WMS <- Client)
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-RCPT-INB-IFD |
		      | MessageVersion | 2020.1                |
		      | Template       | ISHP_1line.xml        |
		
		    And the user waits for 10 seconds
		
		# Check: Inbound Shipment and Planned Inbound Order creation
		    Then inbound shipment "${InboundShipment}" is created
		    And planned inbound order "${InboundOrder}" for inbound shipment "${InboundShipment}" is created
		    And planned inbound order line "1" is created for order "${InboundOrder}" from shipment "${InboundShipment}"
		    
		# Transport Equipment creation/check-in
		    Given receiving transport equipment is created
		    And receiving transport equipment "${transportEquip.trailerName}" is attached to the inbound shipment "${InboundShipment}"
		
		    And receiving transport equipment "${transportEquip.trailerName}" is checked in without appointment to the available door
		    And receiving transport equipment "${transportEquip.trailerName}" is unloaded at the staging lane and dispatched
		
		# Receiving
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "31"
		    And screen with "Receive Product" header is shown
		    And the user enters "${InboundShipment}" into "Receive ID" field
		    And unique number for "LPN" is saved as "lpn01" variable
		    And the user enters "${lpn01}" into "Inventory Identifier" field
		    And the user enters "${Item01}" into "Item Number" field
		    And the pop up window with text "Item is not receivable!" is shown
		    And the user presses key "Enter"
		    And the user returns to undirected menu
		    And the user logs out from the device
		
		# Check: LC-ONRUN-MASTER-RCPT-COMPLETE-OUB-IFD
		    Given the user started tracking of outgoing EDI messages for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE"  
		
		    And the user closes inbound shipment "${InboundShipment}"
		    Then inbound shipment "${InboundShipment}" is closed
		    
		    And outgoing EDI message for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE" is generated successfully
		    Then generated outgoing EDI message is validated against the template "LC-ONRUN-MASTER-REC-COMPLETE(unknownitem).xml" successfully	

	
	@CLISTUS-1861 @CLISTUS-1604
	Scenario: RF Receiving & Put-away - Underreceipt 
		#  Pre receiving
		    Given the following attachments of the issue "${Inbound_Repository}" are loaded
		      | ISHP_1line.xml                                |
		      | LC-ONRUN-MASTER-RCPT-COMPLETE(38-40).xml |
		
		# Define variables
		    And list of variables
		      | Variable        | Value                                            |
		      | InboundOrder    | ${generateStrID('INORD', 10)}                    |
		      | InboundShipment | IB${InboundOrder}                                |
		      | invTyp          | P                                                |
		      | wayBil          | 350856361824                                     |
		      | orgRef          | IA0200012987                                     |
		      | shpId           | IA0200012987                                     |
		      | hostExtId       | IA0200012987                                     |
		      | docNum          | B2B                                              |
		      | expDte          | ${getFrmTimestampPlusHours('yyyyMMddHHmmss', 6)} |
		      | invDte          | ${expDte}                                        |
		      | supNum          | ON00000001                                       |
		      | Item01          | TAITEM41                                         |
		      | expQty01        | 40                                               |
		      | expQty02        | 38                                               |     
		      | rcvSts01        | A                                                |
		      | attrStr01-01    | 7630262271449                                    |
		      | attrStr01-02    | a0Z2o00000X8BUD                                  |
		
		#** Inbound Shipment Creation, LC-ONRUN-RCPT-INB-IFD message integration (WMS <- Client)
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-RCPT-INB-IFD |
		      | MessageVersion | 2020.1                |
		      | Template       | ISHP_1line.xml        |
		
		    And the user waits for 10 seconds
		
		#** Check: Inbound Shipment and Planned Inbound Order creation
		    Then inbound shipment "${InboundShipment}" is created
		    And planned inbound order "${InboundOrder}" for inbound shipment "${InboundShipment}" is created
		    And planned inbound order line "1" is created for order "${InboundOrder}" from shipment "${InboundShipment}"
		    
		## Transport Equipment creation/check-in
		    Given receiving transport equipment is created
		    And receiving transport equipment "${transportEquip.trailerName}" is attached to the inbound shipment "${InboundShipment}"
		
		    And receiving transport equipment "${transportEquip.trailerName}" is checked in without appointment to the available door
		    And receiving transport equipment "${transportEquip.trailerName}" is unloaded at the staging lane and dispatched
		    
		       Given the user started tracking of outgoing EDI messages for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE"
		
		#/**/ Receiving /**/#
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "31"
		    And screen with "Receive Product" header is shown
		    And the user enters "${InboundShipment}" into "Receive ID" field
		    And unique number for "LPN" is saved as "lpn01" variable
		    And the user enters "${lpn01}" into "Inventory Identifier" field
		    And the user enters "${Item01}" into "Item Number" field
		    And the user enters "${expQty02}" into "Receive Quantity" field
		    And the user presses key "Enter" for "UOM" field
		    And the user enters "A" into "Inventory Status" field
		    And the user presses key "F6"
		    And screen with "Receive Product" header is shown
		    And unique number for "subLPN" is saved as "sub01" variable
		    And the user enters "${sub01}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub02" variable
		    And the user enters "${sub02}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub03" variable
		    And the user enters "${sub03}" into "Sub-LPN" field
		    And unique number for "subLPN" is saved as "sub04" variable
		    And the user enters "${sub04}" into "Sub-LPN" field
		    And the user presses key "F6"
		#    And the pop up window with text "Any More To Receive?" is shown
		#    And the user presses key "N" for the pop up
		    And screen with "Product Putaway" header is shown
		    And the user presses key "1"
		    
		    And screen with "Inbound Pallet Build" header is shown
		    And the user presses key "Enter" for "Location" field
		    And the user presses key "Enter" for "Inventory Identifier" field
		    And the user presses key "Enter" for "Item Number" field
		    And the user presses key "Enter" for "Pallet Position:" field
		     
		    And unique number for "LPN" is saved as "pallet_lpn" variable
		    And the user enters "${pallet_lpn}" into "LPN" field
		
		And the user returns to undirected menu
		
		
		    And the user goes to menu "3003"
		    And screen with "Complete Pallet" header is shown
		    And the user enters "${pallet_lpn}" into "LPN" field
		    And the user presses key "F6"
		    And the pop up window with text "Pallet Complete." is shown
		    And the user presses key "Enter" for the pop up
		
		#/**/ Putaway /**/#    
		    And the user returns to undirected menu
		    And the user goes to menu "206"
		    And screen with "Putaway" header is shown
		    And the user enters "${pallet_lpn}" into "Inventory Identifier" field
		And screen with "MRG Product Deposit" header is shown
		    And value "${gv.client}" is shown in "Item Client ID" field
		    And value "${pallet_lpn}" is shown in "LPN" field
		    And value from "Location" field (row "7") is saved as "location01" variable
		    
		## Get Location verification code
		    And the user executes SQL statement
		    """
		    [select locvrc,
		            stoloc
		       from locmst
		      where stoloc = '${location01}']
		    """
		    And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		    
		    And the user presses key "Enter" for "LPN" field
		    And the user enters "${locvrc01}" into "Location" field
		
		    And the user returns to undirected menu
		    And the user logs out from the device
		    And the user waits for 5 seconds
		
		#    And the user validated that "1" inventory exist with the following criteria
		#      | Location      | Item      | Quantity    |
		#      | ${location01} | ${Item01} | ${expQty02} |
		      
		   
		    
		Given silent error tolerance for the next 5 steps
		
		    When the user closes inbound shipment "${InboundShipment}"
		    Then inbound shipment "${InboundShipment}" is closed
		    
		    And outgoing EDI message for event_id "LC-ONRUN-MASTER-RCPT-COMPLETE" is generated successfully
		    Then generated outgoing EDI message is validated against the template "LC-ONRUN-MASTER-RCPT-COMPLETE(38-40).xml" successfully
		    
		    Given all inventory is removed from "${location01}" location with reason code "CRT"	

	#{color:#403294}*Scenario:*{color}
	@CLISTUS-1915
	Scenario: ON-DOM-B2C[E2E][HF]
		#/***/
		Given the following attachments of the issue "${Outbound_Repository}" are loaded
		   | PFP14WB__SFP14WH(B2CPFED2).xml     |
		   | manifest_request_template_B2C.txt |
		   | labels_request_template(MPOCARTON2).txt   |
		     
		     
		## List the Variables
		And list of variables
		 | Variable       | Value                                             |
		 | orderNumber    | ${generateStrID('TST0RD__', 6)}                   |
		 | orderType      | ON-DOM-B2C                                        |
		 | customerPONum  | ${generateIntID(7)}                               |
		 | rmaNum         | ${generateStrID('S0O', 8)}                        |
		 | customerPOdate | ${getTimestamp()}                                 |
		 | customerPOtype | B2C                                               |
		 | b2aNum         | 572820920                                         |
		 | lnNum1         | ${generateStrID('0', 9)}                          |
		 | carrierCode    | FED2                                              |
		 | serviceLevel   | 02                                                |
		 | earlshpdte     | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 1)}   |
		 | earldlvdte     | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 2)}   |
		 | lateshpdte     | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | latedlvdte     | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | orderQtyitem01 | 1                                                 |
		 | item01         | TAITEM41                                          |
		 | altItem1       | 7630262271449                                     |
		 | movetoLoc1     | R54-271-0-60                                      |
		 | pickingLpn     | ${generateStrID('PCKLPN', 9)}                     |
		 | palLpn         | ${generateStrID('PACLPN', 9)}                     |
		 | location_stg   | SHP-STG-103                                       |
		 
		
		## Prepare Inventory for Order
		## Clear locations        
		        Given all inventory is removed from "${movetoLoc1}" location 
		        
		        
		## Create inventory in location        
		        And specified inventory is prepared
		        | Location      | Item      | Status |  Quantity   | Footprint | Client |           LPN               |        sub-LPN                 |
		        | ${movetoLoc1} | ${item01} |   A    |     5       | 1-10-120  | ONRUN  | ${generateIDForType('lpn')} | ${generateIDForType('sublpn')} |
		       
		        
		        Then the user resets the following locations
		        | ${movetoLoc1} |
		   
		        
		    
		## Create Outbound Order via sending EDI message
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-ORDER-INB-IFD             |
		      | MessageVersion | 2020.1                             |
		      | Template       | PFP14WB__SFP14WH(B2CPFED2).xml |
		      
		## Check: Outbound Order creation
		    Then outbound order "${orderNumber}" is created
		    And outbound order line "${lnNum1}" is created for outbound order "${orderNumber}"
		    
		## Set carrier/order type weight breaks immediately with job in console 
		#    And the user triggers job "LC_ONRUN_SET_ORDTYP_CAR_2"
		    
		    
		##/**/ Wave and Allocate the order /**/
		
		 Given variable "outWave.allocation.waitForWaveRelease" = "false"
		    And variable "outWave.allocation.immediateRelease.UOMs" = "PR,CA,PL"
		    And variable "outWave.plan.destinationZone" = "Outbound Staging Domestic Parcel Non-Automation"
		    And variable "outWave.plan.stagingLane" = "${location_stg}"
		    And variable "outWave.allocation.destinationZone" = "Outbound Staging Domestic Parcel Non-Automation"
		    And variable "outWave.allocation.stagingLane" = "${location_stg}"
		         
		    When the user plans wave for outbound order "${orderNumber}"
		     Then outbound shipment is created for outbound order "${orderNumber}"
		    And the user allocates the wave "${outWave.waveName}"
		    Then the user waits for "60" seconds
		    
		##/**/ Check: Order/Pick Released /**/
		    Then outbound wave for the order "${orderNumber}" is released
		    
		    Given variable "edi.outgoing.username" = "${gv.username}"
		    
		    And all pick works from wave "${outWave.waveName}" assigned to the user
		
		    
		##/**/ Pick task check /**/
		    When the user executes SQL statement
		"""
		[select *
		   from WRKQUE
		  where OPRCOD = 'LPCK'
		  and schbat = '${outWave.waveName}']
		"""
		    Then SQL result set has "1" rows
		    Then in SQL execution result row "1" column "list_id" not NULL value is shown
		    And value of the column "list_id" from SQL result row "1" is saved as "lstID" variable
		    
		#/**/ Directory change for shplbl /**/#
		 Given variable "documents.label.files.directory" = "/apps/jda/swiftapp/les/reports/"
		 Given the user started tracking of labels for the label format "PmPackageLabel"
		    
		##/**/ Picking /**/
		##Work Assignment Entry
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "16"
		    And screen with "Work Assignment" header is shown
		    And the user enters "${lstID}" into "Work Asgnmt:" field
		    And the user presses key "Enter"
		    And the user enters "${pickingLpn}" into "To ID" field
		    And the user presses key "Enter"
		    And the user presses key "F6"
		    
		##/**/ First pick /**/
		    And screen with "Order Pick L *" header is shown
		    And value from "Location" field (row "1") is saved as "location01" variable
		    And value from "Item Number" field is saved as "RFItem1" variable
		    And the user executes SQL statement
		"""
		  [select subnum,
		          prtnum
		     from inventory_view
		    where wh_id = 'USLCZ01'
		    and stoloc = '${location01}']
		"""
		  
		#    Then SQL result set has "1" rows
		    And value of the column "subnum" from SQL result row "1" is saved as "pickNo1" variable
		    And the user enters "${pickNo1}" into "Inventory Identifier" field
		    And the user enters "${RFItem1}" into "Item Number" field
		    And the user presses key "Enter" for "Quantity" field
		    And the user presses key "Enter" for "UOM" field
		    
		
		    And the pop up window with text "List Pick Completed" is shown
		    And the user presses key "Enter" for the pop up
		
		##/**/ Deposit to Packing Area /**/
		    And screen with "MRG Product Deposit" header is shown
		    And the user presses key "Enter" for "LPN" field
		    And value "OB-MANPACK - PCKSTN-WZ" is shown in "8" row
		    And value "${gv.client}" is shown in "Item Client ID" field
		    And value from "Location" field (row "7") is saved as "drop_loc" variable
		   
		 
		    And the user executes SQL statement
		    """
				    [select locvrc,
				            stoloc
				       from locmst
				      where stoloc = '${drop_loc}']
			"""
		    And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		    And the user enters "MANPACK_DROP" into "Location" field
		    And the user presses key "Enter"
		    
		    And the user returns to undirected menu
		    And the user logs out from the device
		    
		#   /**/Packing and Staging - Parcel Flow/**/
		    
		#   Packing
		    
		    Given the user has defined LPN "${pickingLpn}" and workstation "MANPACK01" for packing
		#   Given variable "outPack.cartonLength" = "0.25"
		#   Given variable "outPack.cartonWidth" = "0.3"
		#   Given variable "outPack.cartonHeight" = "0.25"
		
		
		##PARCEL AUDIT RECORD check setup
		  Then the user executes SQL statement
		"""
		[select distinct pckwrk_dtl.ship_ctnnum, ord.cstms_ordtyp,ord.ordnum,ord.client_id
		       from invlod
		       join invsub
		         on invlod.lodnum = invsub.lodnum
		       join invdtl
		         on invsub.subnum = invdtl.subnum
		       join shipment_line
		         on shipment_line.ship_line_id = invdtl.ship_line_id
		       join ord_line
		         on shipment_line.wh_id = ord_line.wh_id
		        and shipment_line.ordnum = ord_line.ordnum
		        and shipment_line.client_id = ord_line.client_id
		        and shipment_line.ordlin = ord_line.ordlin
		        and shipment_line.ordsln = ord_line.ordsln
		       join ord
		         on ord_line.client_id = ord.client_id
		        and ord_line.ordnum = ord.ordnum
		        and ord_line.wh_id = ord.wh_id
		       join pckwrk_dtl
		         on pckwrk_dtl.wrkref_dtl = invdtl.wrkref_dtl
		      where invlod.wh_id = 'USLCZ01'
		        and invlod.stoloc = 'MANPACK01'
		        and invlod.lodnum = '${pickingLpn}'
		        and 1 = 1
		      order by ship_ctnnum]
		"""
		
		    And value of the column "ship_ctnnum" from SQL result row "1" is saved as "outpack.shippingcarton" variable
		    
		    Given the user started tracking of parcel audit entry records for parcel "${outpack.shippingcarton}" and operation type "MANIFEST"
		    Given the user started tracking of parcel audit entry records for parcel "${outpack.shippingcarton}" and operation type "LABELS"
		
		    
		     Given the user has packed and consolidated all items from the LPN into single shipping carton with carton code "MPOCARTON2"
		    | Location    | LPN       | Position |
		    | OB-PLTBLD01 | ${palLpn} | 1        |
		  
		Then the user executes SQL statement
		"""
		    [SELECT MAX(msg_id) AS last_msg
		       FROM pclhndlr_auditlog
		      WHERE oprcod = 'LABELS'
		        AND parcel_id = '${outpack.shippingcarton}']
		   
		"""
		 And value of the column "last_msg" from SQL result row "1" is saved as "parcel_audit_msg_lab" variable
		 
		Then the user executes SQL statement
		"""
		    [SELECT MAX(msg_id) AS last_msg
		       FROM pclhndlr_auditlog
		      WHERE oprcod = 'MANIFEST'
		        AND parcel_id = '${outpack.shippingcarton}']
		   
		"""
		 And value of the column "last_msg" from SQL result row "1" is saved as "parcel_audit_msg_manf" variable
		 
		##/**/ Parcel Label capture /**/##   
		 Then "1" labels for the label format "PmPackageLabel" are generated
		 
		
		#   Check Centiro Manifest and Label events
		Given silent error tolerance for the next 2 steps
		 Then request from the parcel audit entry record for message id "${parcel_audit_msg_lab}" is validated against the template "labels_request_template(MPOCARTON2).txt"
		 Then request from the parcel audit entry record for message id "${parcel_audit_msg_manf}" is validated against the template "manifest_request_template_B2C.txt"
		 
		
		##/**/ Stage Shipment /**/
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "22"
		    And screen with "Full Inventory Move" header is shown
		    And the user enters "${outpack.shippingcarton}" into "Source ID" field
		    And screen with "MRG Product Deposit" header is shown  
		    And the user presses key "Enter" for "LPN" field
		    
		## Check that Staging Location matches current Carrier Configuration
		    Then value "${location_stg}" is shown in "Location" field (row "7")
		    And value "OB-STAGING - OB-DOCK" is shown in "8" row
		    And the user enters "${location_stg}" into "Location" field
		    And the user logs out from the device	

	#{color:#403294}*Scenario: User triggers Cycle Count by Location using WebUI interface.* {color}
	#
	#{color:#403294}*User is able to complete count using RF gun cycle count function.* {color}
	#
	# 
	@CLISTUS-2091
	Scenario: Cycle Count by Location
		#Define VAriables
		Given list of variables
		      | Variable    | Value                          |
		      | loc01       | R29-276-B-02                   |
		      | Item01      | 2UD10010666                    |
		      | status      | A                              |
		      | Qty01a      | 10                             |
		      | newsublpn01 | ${generateStrID('S000001', 3)} |
		      | newlpn01    | ${generateStrID('LPN', 10)}    |
		    
		    
		 Then all inventory is removed from "${loc01}" location with reason code "CR"
		
		# Inventory creation
		    And specified inventory is prepared
		      | Location | Item      | Status    | Quantity  | SubLPN         | LPN         | Client       | Origin |
		      | ${loc01} | ${Item01} | ${status} | ${Qty01a} | ${newsublpn01} | ${newlpn01} | ${gv.client} | VN     |
		    
		    
		 # Login into the WebUI
		    Given the user is logged into the WebUI
		    
		    
		# Select workstation
		    And the user selects workstation "PAR-PAK-25" in the WebUI
		
		# Navigation to the Inventory Counts page
		    Given the user navigates to the "#wm.inventory/wm.inventory.counts////" web page
		    And the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Templates']" is visible
		
		# Schedule the count from the inventory screen w/ popup
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Actions']"
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Schedule Count']"
		    And the user enters text "Location" to the element located by xpath "//input[contains(@name, 'requestCountBy')]" and presses enter
		    And the user enters text "${loc01}" to the element located by xpath "//input[contains(@name, 'Location')]"
		    And the web element located by xpath "//div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//a//span[text()='Find Locations']" is visible
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//a//span[text()='Find Locations']"
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Next']"
		    And the user enters text "Cycle Count" to the element located by xpath "//input[contains(@name, 'countType')]" and presses enter
		    And the user enters text "User Generated" to the element located by xpath "//input[contains(@name, 'requestType')]" and presses enter
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Save and Release']"
		    
		 # Log out
		    Then the user navigates to the "#wm.inventory/wm.inventory.counts////" web page
		    And the user logs out from the WebUI
		 
		 #Assign the count to the user 
		    Given all works with operation code "CNT" and source location "${loc01}" assigned to the user
		
		#Change Equipment and log in to Directed Work 
		    Given variable "mobile.equipment" = "LG-HAND"
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "9"
		    And screen with "Cycle Count At" header is shown
		    And the user presses key "Enter"
		    And screen with "Cycle Count" header is shown
		#   And the value in "Count Location" field is "${loc01}"
		#
		#    And the user executes SQL statement
		#   """
		#   [select locvrc,
		#           stoloc
		#      from locmst
		#     where stoloc = '${loc01}']
		#   """
		#   And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		#   And the user enters "${locvrc01}" into  "Verify Location:" field
		    And the user enters "${loc01}" into "Verify Location:" field
		    And the user enters "${Item01}" into "Item Number" field
		    And the user presses key "Enter" for "Item Client ID" field
		    And screen with "Quantity Capture" header is shown
		    And the user presses key "Enter" for "Quantity" field
		    And the user presses key "Enter" for "Quantity" field
		    And the user enters "${Qty01a}" into "Quantity" field
		    And the user presses key "F6"
		    And screen with "Cycle Count" header is shown
		    And the user presses key "Enter"
		    And the pop up window with text "OK To Complete Cycle Count?" is shown 
		    And the user presses key "Y" for the pop up
		    And the user returns to undirected menu
		    And the user logs out from the device	

	#{color:#403294}*Scenario: User triggers Cycle Count for all pieces of an Item in USCLZ02 using WebUI interface.* {color}
	#
	#{color:#403294}*User is able to complete count using RF gun cycle count function.* {color}
	#
	#{color:#403294}Choose an Item with 1 location. {color}
	@CLISTUS-2108
	Scenario: Cycle Count by Item
		#Define VAriables
		Given list of variables
		      | Variable    | Value                          |
		      | loc01       | R29-276-B-02                   |
		      | Item01      | 2UE10610553                    |
		      | status      | A                              |
		      | Qty01a      | 10                             |
		      | newsublpn01 | ${generateStrID('S000001', 3)} |
		      | newlpn01    | ${generateStrID('LPN', 10)}    |
		    
		    
		 Then all inventory is removed from "${loc01}" location with reason code "CR"
		
		# Inventory creation
		    And specified inventory is prepared
		      | Location | Item      | Status    | Quantity  | SubLPN         | LPN         | Client       | Origin |
		      | ${loc01} | ${Item01} | ${status} | ${Qty01a} | ${newsublpn01} | ${newlpn01} | ${gv.client} | VN     |
		    
		    
		 # Login into the WebUI
		    Given the user is logged into the WebUI
		    
		    
		# Select workstation
		    And the user selects workstation "PAR-PAK-25" in the WebUI
		
		# Navigation to the Inventory Counts page
		    Given the user navigates to the "#wm.inventory/wm.inventory.counts////" web page
		    And the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Templates']" is visible
		
		# Schedule the count from the inventory screen w/ popup
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Actions']"
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Schedule Count']"
		    And the user enters text "Item" to the element located by xpath "//input[contains(@name, 'requestCountBy')]" and presses enter
		    And the user enters text "${Item01}" to the element located by xpath "//input[contains(@name, 'itemNumber')]"
		    And the web element located by xpath "//div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//a//span[text()='Find Locations']" is visible
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//a//span[text()='Find Locations']"
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Next']"
		    And the user enters text "Cycle Count" to the element located by xpath "//input[contains(@name, 'countType')]" and presses enter
		    And the user enters text "User Generated" to the element located by xpath "//input[contains(@name, 'requestType')]" and presses enter
		    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='Save and Release']"
		    
		 # Log out
		    Then the user navigates to the "#wm.inventory/wm.inventory.counts////" web page
		    And the user logs out from the WebUI
		 
		 #Assign the count to the user 
		    Given all works with operation code "CNT" and source location "${loc01}" assigned to the user
		
		#Change Equipment and log in to Directed Work 
		    Given variable "mobile.equipment" = "LG-HAND"
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "9"
		    And screen with "Cycle Count At" header is shown
		    And the user presses key "Enter"
		    And screen with "Cycle Count" header is shown
		#   And the value in "Count Location" field is "${loc01}"
		#
		#    And the user executes SQL statement
		#   """
		#   [select locvrc,
		#           stoloc
		#      from locmst
		#     where stoloc = '${loc01}']
		#   """
		#   And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		#   And the user enters "${locvrc01}" into  "Verify Location:" field
		    And the user enters "${loc01}" into "Verify Location:" field
		    And the user enters "${Item01}" into "Item Number" field
		    And the user presses key "Enter" for "Item Client ID" field
		    And screen with "Quantity Capture" header is shown
		    And the user presses key "Enter" for "Quantity" field
		    And the user presses key "Enter" for "Quantity" field
		    And the user enters "${Qty01a}" into "Quantity" field
		    And the user presses key "F6"
		    And screen with "Cycle Count" header is shown
		    And the user presses key "Enter"
		    And the pop up window with text "OK To Complete Cycle Count?" is shown 
		    And the user presses key "Y" for the pop up
		    And the user returns to undirected menu
		    And the user logs out from the device	

	#{color:#403294}*Scenario: User performs Full Inventory Move using RDT device.* {color}
	#
	# 
	@CLISTUS-2242
	Scenario: Full Inventory Move (RDT)
		#Variables
		    And list of variables
		    | Variable   | Value                       | 
		    | movetoLoc  | R22-175-0-30                |
		    | item01     | TAITEM41                    |
		    | itemQty    | 10                          |
		    
		    
		# Clear location        
		        Given all inventory is removed from "R22-175-0-01" location with reason code "CRT"
		         And all inventory is removed from "R22-175-0-30" location with reason code "CRT"
		        
		# Create inventory in location        
		        Given specified inventory is prepared
		            |  Location        |  Item      |Status|    Quantity      |  Footprint   |  Client   |  LPN                        | sub-LPN                        | Detail LPN                     |
		            |  R22-175-0-01    | ${item01}  |  A   |   ${itemQty}     |   1-10-120   |  ONRUN    | ${generateIDForType('lpn')} | ${generateIDForType('sublpn')} | ${generateIDForType('dtllpn')} |
		            |  R22-175-0-01    | ${item01}  |  A   |   ${itemQty}     |   1-10-120   |  ONRUN    | ${preparedLPN_1}            | ${generateIDForType('sublpn')} | ${generateIDForType('dtllpn')} |
		
		# Login to RF
			Given the user is logged into the mobile device and located in the undirected menu
			And screen with "Undirected Menu" header is shown
			And the user goes to menu "22"
			
		#  Given the user started tracking of outgoing EDI messages for event_id "LC-ONRUN-INV-ATTR-ADJUST"
		#   Given the user started tracking of events for the event_id "LC-ONRUN-INV-ATTR-ADJUST"
		   
		   
		# Full Inventory Move
		    And screen with "Full Inventory Move" header is shown
		    And the user enters "${preparedLPN_1}" into "Source ID" field
		    And the user presses key "F6"
		    And screen with "MRG Product Deposit" header is shown
		    And the user presses key "Enter" for "LPN" field
		   
		
		# Get Location verification code
		    And the user executes SQL statement
		    """
		    [select locvrc,
		            stoloc
		       from locmst
		      where stoloc = '${movetoLoc}']
		    """
		    And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		    And the user enters "${locvrc01}" into "Location" field
		    And the user presses key "F6"
		
		    And the user returns to undirected menu
		    And the user logs out from the device
		    
		#    And the user validated that "1" inventory exist with the following criteria
		#      | Location      |   Item    |   Quantity   |
		#      | ${movetoLoc}  | ${item01} |      20      |
		
		    
		#     And outgoing EDI message for event_id "LC-ONRUN-INV-ATTR-ADJUST"  is generated successfully
		#     Then generated outgoing EDI message is validated against the template "LC-ONRUN-INV-ATTR-ADJUST(USLCZ01).xml" successfully
		    
		    Given all inventory is removed from "${movetoLoc}" location with reason code "CRT"	

	#{color:#403294}*Scenario:*{color}
	@CLISTUS-1919
	Scenario: B2B-PAR (Multi-Line)[E2E][HF]
		#/***/
		Given the following attachments of the issue "${Outbound_Repository}" are loaded
		   | PFP10EW__SFP10FC(B2BPNORDUPSG)WIP.xml     |
		   | manifest_request_template(MPOCARTON2).txt |
		   | labels_request_template(MPOCARTON2).txt   |
		     
		     
		## List the Variables
		And list of variables
		 | Variable       | Value                                             |
		 | orderNumber    | ${generateStrID('TST0RD__', 6)}                   |
		 | orderType      | ON-DOM-B2B-K                                      |
		 | customerPONum  | ${generateIntID(7)}                               |
		 | rmaNum         | ${generateStrID('S0O', 8)}                        |
		 | customerPOdate | ${getTimestamp()}                                 |
		 | customerPOtype | B2B                                               |
		 | b2aNum         | A42V71                                            |
		 | labelFormat    | lc_UCC128NORDLBL                                  |
		 | lnNum1         | ${generateStrID('0', 9)}                          |
		 | lnNum2         | ${generateStrID('0', 9)}                          |
		 | carrierCode    | UPSG                                              |
		 | serviceLevel   | 06                                                |
		 | earlshpdte     | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 1)}   |
		 | earldlvdte     | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 2)}   |
		 | lateshpdte     | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | latedlvdte     | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | orderQtyitem01 | 1                                                 |
		 | item01         | TAITEM41                                          |
		 | altItem1       | 7630262271449                                     |
		 | orderQtyitem02 | 2                                                 |
		 | item02         | TAITEM42                                          |
		 | altItem2       | 7630240424009                                     |
		 | movetoLoc1     | R54-271-0-60                                      |
		 | movetoLoc2     | R27-178-0-30                                      |
		 | location_stg   | SHP-STG-103                                       |
		 
		
		## Prepare Inventory for Order
		## Clear locations        
		        Given all inventory is removed from "${movetoLoc1}" location with reason code "CRT"
		        And all inventory is removed from "${movetoLoc2}" location with reason code "CRT"
		        
		## Create inventory in location        
		        And specified inventory is prepared
		        | Location      | Item      | Status |  Quantity   | Footprint | Client |           LPN               |
		        | ${movetoLoc1} | ${item01} |   A    |     5       | 1-10-120  | ONRUN  | ${generateIDForType('lpn')} | 
		        | ${movetoLoc2} | ${item02} |   A    |     5       | 1-10-120  | ONRUN  | ${generateIDForType('lpn')} | 
		        
		        Then the user resets the following locations
		        | ${movetoLoc1} |
		        | ${movetoLoc2} |
		        
		    
		## Create Outbound Order via sending EDI message
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-ORDER-INB-IFD             |
		      | MessageVersion | 2020.1                             |
		      | Template       | PFP10EW__SFP10FC(B2BPNORDUPSG)WIP.xml |
		      
		## Check: Outbound Order creation
		    Then outbound order "${orderNumber}" is created
		    And outbound order line "${lnNum1}" is created for outbound order "${orderNumber}"
		    
		## Set carrier/order type weight breaks immediately with job in console 
		#    And the user triggers job "LC_ONRUN_SET_ORDTYP_CAR_2"
		    
		    
		##/**/ Wave and Allocate the order /**/
		
		 Given variable "outWave.allocation.waitForWaveRelease" = "false"
		    And variable "outWave.allocation.immediateRelease.UOMs" = "PR,CA,PL"
		    And variable "outWave.plan.destinationZone" = "Outbound Staging Domestic Parcel Non-Automation"
		    And variable "outWave.plan.stagingLane" = "${location_stg}"
		    And variable "outWave.allocation.destinationZone" = "Outbound Staging Domestic Parcel Non-Automation"
		    And variable "outWave.allocation.stagingLane" = "${location_stg}"
		         
		    When the user plans wave for outbound order "${orderNumber}"
		     Then outbound shipment is created for outbound order "${orderNumber}"
		    And the user allocates the wave "${outWave.waveName}"
		    Then the user waits for "60" seconds
		    
		##/**/ Check: Order/Pick Released /**/
		    Then outbound wave for the order "${orderNumber}" is released
		    
		    Given variable "edi.outgoing.username" = "${gv.username}"
		    
		    And all pick works from wave "${outWave.waveName}" assigned to the user
		
		    
		##/**/ Pick task check /**/
		    When the user executes SQL statement
		"""
		[select *
		   from WRKQUE
		  where OPRCOD = 'LPCK'
		  and schbat = '${outWave.waveName}']
		"""
		    Then SQL result set has "1" rows
		    Then in SQL execution result row "1" column "list_id" not NULL value is shown
		    And value of the column "list_id" from SQL result row "1" is saved as "lstID" variable
		    
		 Given the user started tracking of labels for the label format "${labelFormat}"
		 Given the user started tracking of labels for the label format "pallbl"
		 Given the user started tracking of labels for the label format "lc_onrunContentsLbl"
		 
		#/**/ Directory change for shplbl /**/#
		 Given variable "documents.label.files.directory" = "/apps/jda/swiftapp/les/reports/"
		 Given the user started tracking of labels for the label format "PmPackageLabel"
		    
		##/**/ Picking /**/
		##Work Assignment Entry
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "16"
		    And screen with "Work Assignment" header is shown
		    And the user enters "${lstID}" into "Work Asgnmt:" field
		    And the user presses key "Enter"
		    And unique number for "LPN" is saved as "picking_lpn" variable
		    And the user enters "${picking_lpn}" into "To ID" field
		    And the user presses key "Enter"
		    And the user presses key "F6"
		    
		##/**/ First pick /**/
		    And screen with "Order Pick L *" header is shown
		    And value from "Location" field (row "1") is saved as "location01" variable
		    And value from "Item Number" field is saved as "RFItem1" variable
		    And the user executes SQL statement
		"""
		  [select subnum,
		          prtnum
		     from inventory_view
		    where wh_id = 'USLCZ01'
		    and stoloc = '${location01}']
		"""
		  
		#    Then SQL result set has "1" rows
		    And value of the column "subnum" from SQL result row "1" is saved as "pickNo1" variable
		    And the user enters "${pickNo1}" into "Inventory Identifier" field
		    And the user enters "${RFItem1}" into "Item Number" field
		    And the user presses key "Enter" for "Quantity" field
		    And the user presses key "Enter" for "UOM" field
		    
		
		##/**/ Second pick /**/
		    And screen with "Order Pick L *" header is shown
		    And value from "Location" field (row "1") is saved as "location02" variable
		    And value from "Item Number" field is saved as "RFItem2" variable
		    And the user executes SQL statement
		    
		"""
		  [select subnum,
		          prtnum
		     from inventory_view
		    where wh_id = 'USLCZ01'
		    and stoloc = '${location02}']
		"""
		  
		#    Then SQL result set has "1" rows
		
		    And value of the column "subnum" from SQL result row "1" is saved as "pickNo2" variable
		    And the user enters "${pickNo2}" into "Inventory Identifier" field
		    And the user enters "${RFItem2}" into "Item Number" field
		    And the user presses key "Enter" for "Quantity" field
		    And the user presses key "Enter" for "UOM" field
		    
		    And the pop up window with text "List Pick Completed" is shown
		    And the user presses key "Enter" for the pop up
		
		##/**/ Deposit to Packing Area /**/
		    And screen with "MRG Product Deposit" header is shown
		    And the user presses key "Enter" for "LPN" field
		    And value "OB-MANPACK - PCKSTN-WZ" is shown in "8" row
		    And value "${gv.client}" is shown in "Item Client ID" field
		    And value from "Location" field (row "7") is saved as "drop_loc" variable
		   
		 
		    And the user executes SQL statement
		    """
				    [select locvrc,
				            stoloc
				       from locmst
				      where stoloc = '${drop_loc}']
			"""
		    And value of the column "locvrc" from SQL result row "1" is saved as "locvrc01" variable
		    And the user enters "MANPACK_DROP" into "Location" field
		    And the user presses key "Enter"
		    
		    And the user returns to undirected menu
		    And the user logs out from the device
		    
		#   /**/Packing and Staging - Parcel Flow/**/
		    
		#   Packing
		    
		    Given the user has defined LPN "${picking_lpn}" and workstation "MANPACK01" for packing
		#   Given variable "outPack.cartonLength" = "0.25"
		#   Given variable "outPack.cartonWidth" = "0.3"
		#   Given variable "outPack.cartonHeight" = "0.25"
		
		
		##PARCEL AUDIT RECORD check setup
		  Then the user executes SQL statement
		"""
		[select distinct pckwrk_dtl.ship_ctnnum, ord.cstms_ordtyp,ord.ordnum,ord.client_id
		       from invlod
		       join invsub
		         on invlod.lodnum = invsub.lodnum
		       join invdtl
		         on invsub.subnum = invdtl.subnum
		       join shipment_line
		         on shipment_line.ship_line_id = invdtl.ship_line_id
		       join ord_line
		         on shipment_line.wh_id = ord_line.wh_id
		        and shipment_line.ordnum = ord_line.ordnum
		        and shipment_line.client_id = ord_line.client_id
		        and shipment_line.ordlin = ord_line.ordlin
		        and shipment_line.ordsln = ord_line.ordsln
		       join ord
		         on ord_line.client_id = ord.client_id
		        and ord_line.ordnum = ord.ordnum
		        and ord_line.wh_id = ord.wh_id
		       join pckwrk_dtl
		         on pckwrk_dtl.wrkref_dtl = invdtl.wrkref_dtl
		      where invlod.wh_id = 'USLCZ01'
		        and invlod.stoloc = 'MANPACK01'
		        and invlod.lodnum = '${picking_lpn}'
		        and 1 = 1
		      order by ship_ctnnum]
		"""
		
		    And value of the column "ship_ctnnum" from SQL result row "1" is saved as "outpack.shippingcarton" variable
		    
		    Given the user started tracking of parcel audit entry records for parcel "${outpack.shippingcarton}" and operation type "MANIFEST"
		    Given the user started tracking of parcel audit entry records for parcel "${outpack.shippingcarton}" and operation type "LABELS"
		
		    And unique number for "LPN" is saved as "packing_lpn" variable
		    Given the user has packed and consolidated all items from the LPN into single shipping carton with carton code "MPOCARTON2"
		    | Location    |      LPN       | Position |
		    | OB-PLTBLD01 | ${packing_lpn} | 1        |
		    
		Then the user executes SQL statement
		"""
		    [SELECT MAX(msg_id) AS last_msg
		       FROM pclhndlr_auditlog
		      WHERE oprcod = 'LABELS'
		        AND parcel_id = '${outpack.shippingcarton}']
		   
		"""
		 And value of the column "last_msg" from SQL result row "1" is saved as "parcel_audit_msg_lab" variable
		 
		Then the user executes SQL statement
		"""
		    [SELECT MAX(msg_id) AS last_msg
		       FROM pclhndlr_auditlog
		      WHERE oprcod = 'MANIFEST'
		        AND parcel_id = '${outpack.shippingcarton}']
		   
		"""
		 And value of the column "last_msg" from SQL result row "1" is saved as "parcel_audit_msg_manf" variable
		 
		##/**/ Parcel Label capture /**/##   
		 Then "1" labels for the label format "PmPackageLabel" are generated
		 
		#/**/ Directory change back to original dir for remaining labels /**/#
		Given variable "documents.label.files.directory" = "/apps/jda/swiftapp/les/labels/"
		 Then "1" labels for the label format "${labelFormat}" are generated
		# Then "1" labels for the label format "lc_onrunContentsLbl" are generated
		 
		#/**/ B2B Packlist verification /**/# 
		 Then report "LC-ONRUN-BILLOFDELIVERY" with following parameters is generated
		    | Parameter | Value                     |
		    | wh_id     | USLCZ01                   | 
		    | ordnum    | ${orderNumber}            |
		
		#   Check Centiro Manifest and Label events
		Given silent error tolerance for the next 2 steps
		 Then request from the parcel audit entry record for message id "${parcel_audit_msg_lab}" is validated against the template "labels_request_template(MPOCARTON2).txt"
		 Then request from the parcel audit entry record for message id "${parcel_audit_msg_manf}" is validated against the template "manifest_request_template(MPOCARTON2).txt"
		 
		##/**/ Stage Shipment /**/
		    Given the user is logged into the mobile device and located in the undirected menu
		    And the user goes to menu "22"
		    And screen with "Full Inventory Move" header is shown
		    And the user enters "${outpack.shippingcarton}" into "Source ID" field
		    And screen with "MRG Product Deposit" header is shown  
		    And the user presses key "Enter" for "LPN" field
		    
		## Check that Staging Location matches current Carrier Configuration
		    Then value "${location_stg}" is shown in "Location" field (row "7")
		    And value "OB-STAGING - OB-DOCK" is shown in "8" row
		    And the user enters "${location_stg}" into "Location" field
		    And the user logs out from the device
		
		
		#/**/ Pallet Label Capture /**/#  
		#    Then "1" labels for the label format "pallbl" are generated	

	#{color:#403294}*Scenario:*{color}
	@CLISTUS-2562
	Scenario: B2B-Packlist Printing Verification
		Given the following attachments of the issue "${Outbound_Repository}" are loaded
		   | PFP10EW__SFP10FC(B2BPNORDUPSG).xml |
		     
		     
		 # List the Variables
		And list of variables
		 | Variable   | Value                                             |
		 | ordNum     | ${generateStrID('TST0RD__', 6)}                   |
		 | ordTyp     | ON-DOM-B2B-K                                      |
		 | cpoNum     | ${generateIntID(7)}                               |
		 | rmaNum     | ${generateStrID('S0O', 8)}                        |
		 | cpoDte     | ${getTimestamp()}                                 |
		 | b2aNum     | 572820920                                         |
		 | lblFormat  | lc_UCC128NORDLBL                                  |
		 | lnNum1     | ${generateStrID('IO0', 9)}                        |
		 | lnNum2     | ${generateStrID('IO0', 9)}                        |
		 | srvlvl     | 06                                                |
		 | carCod     | UPSG                                              |
		 | earlshpdte | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 1)}   |
		 | earldlvdte | ${getFrmTimestampPlusDays('yyyyMMddHHmmss', 2)}   |
		 | lateshpdte | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | latedlvdte | ${getFrmTimestampPlusMonths('yyyyMMddHHmmss', 4)} |
		 | ordQty01   | 6                                                 |
		 | item01     | 3WD10540108 W 6                                   |
		 | altItem1   | 7615537155180                                     |
		 | ordQty02   | 6                                                 |
		 | item02     | 41.99003 W 11                                     |
		 | altItem2   | 7630867836264                                     |
		
		
		 # Create Outbound Order via sending EDI message
		    When the user sends the EDI message successfully with the following data
		      | MessageType    | LC-ONRUN-ORDER-INB-IFD |
		      | MessageVersion | 2020.1                 |
		      | Template       | PFP10EW__SFP10FC(B2BPNORDUPSG).xml          |
		      
		      # Check: Outbound Order creation
		    Then outbound order "${ordNum}" is created
