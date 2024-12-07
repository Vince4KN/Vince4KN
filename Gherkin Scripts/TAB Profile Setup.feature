
#Master data
gv.username=
gv.password=
gv.warehouse=
gv.client=
Inbound_Repository=
Outbound_Repository=

#Environment data
gv.environment=******
wcs.endpoint.tail=****8/edi/wcs/execute
config.mconductor.mconductor.incoming.sending.mode = direct
appointment.duration = 5

#API endpoints


config.timeouts.timeout.wave.release = 120

#Items Replenishment 

#Carrier matrix
#1. Parcel Carrier
Carrier_1=*****
ServiceLevel_1=****
CarrierString_1=*****
AddressID_1=****

City_1=Amsterdam
PostalCode_1=1011

#2.LTL/FTL
.....



#RF Device
mobile.device=***
mobile.port=8059
mobile.equipment=
mobile.startLocation = 000

#Timeouts
config.timeouts.timeout.mobile.action = 100
config.timeouts.timeout.mobile.loading=60
config.timeouts.timeout.edi.event.status = 60
config.timeouts.timeout.api.edi.message.status = 200
config.timeouts.timeout.api.edi.message.generation = 60
config.timeouts.timeout.mconductor.message.trigger = 60
config.timeouts.timeout.label.generation=50

#WebUI

#Mono-SKU - QC process
New_SKU.QC.page=#New-SKU-opTKcJz9Q8uqobY_njnCHQ/lc-NewSkuQCAppPage////
Insert.label.input=//input[contains(@class, 'x-form-field x-form-text') and not(contains(@class, 'x-form-empty-field')) and contains(@placeholder, 'Insert Routing Label Number')]
Next.button=//div[contains(@id, 'lc-newskuqcprocess-view-NewSkuQcStation')]//a//span[text()='Next']
Add.quality.form=//span[contains(@id, 'wm-qualityissuewindow') and text()='Add Quality Issue']
Supplier.issue.field=//input[contains(@class, 'x-form-field x-form-text') and @name='supplierIssues'] 
Supplier.quantity.field=//input[contains(@class, 'x-form-field x-form-text') and @name='supplierQuantity']
Supplier.issue.list=//div[contains(@class, 'x-boundlist-default') and not(contains (@style, 'display: none'))]//li[contains(@class, 'x-boundlist-item') and text()='QC OK'] 
Supplier.issue.list.damaged=//div[contains(@class, 'x-boundlist-default') and not(contains (@style, 'display: none'))]//li[contains(@class, 'x-boundlist-item') and text()='Damaged']
Save.button=//div[contains(@class, 'docked-bottom')]//a[not(contains(@class, 'disabled'))]//span[text()='Save']/following-sibling::span
Success.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Success']
OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Success']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='OK']/following-sibling::span
New_SKU.QC.page.visibility=//span[contains(@class, 'x-header-text -text -text-default') and text()='New Sku/QC Station']
SupplierIssue.popup=//div[text()='Supplier issue or carrier issue is required.']
Yes.button=//span[text()='Yes']
OK.button1=//div[contains(@class, 'x-window') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@id, 'messagebox')]//span[text()='OK']
#Multi-SKU - QC process 
MultiSKU.pagetitle=//span[text()='MULTI SKU SUB-LPN']
WebUI-Item01.row=//div[contains(@class, 'x-grid-cell-inner') and text()='${WebUI-Item01}']
Insert.Item.input=//input[contains(@class, 'x-form-field x-form-text') and not(contains(@class, 'x-form-empty-field')) and contains(@placeholder, 'Insert Item Number or Select a Row')]
Insert.ItemorRow.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Item Number or Select a Row')]
MultiSKU.Next.button=//div[contains(@id, 'lc-newskuqcprocess-view-MultiSkuQcStationForm')]//span[text()='Next']
WebUI-Item01.row.check=//td//div[contains(@class, 'x-grid-cell-inner') and text()='${WebUI-Item01}']
MultiSKU.Back.button=//div[contains(@id, 'lc-newskuqcprocess-view-MultiSkuQcStationForm')]//span[text()='Back']

#New SKU
ScanProduct.button=//span[text()='Scan' and 'Product']
Length.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimLength']
Width.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimWidth']
Height.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimHeight']
Weight.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimWeight']
Foldable.field=//input[contains(@class, 'x-form-field x-form-text') and @name='foldable']
SPOBoxable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='SPO Boxable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
Totable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='Totable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
Conveyable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='Conveyable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
NewSKU.OK.button=//div[contains(@id, 'lc-newskuqcprocess-view-OversizeProduct')]//span[text()='OK']
NewSKU.Confirm.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']
NewSKU.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']/following-sibling::span
QCrequired.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']
QCrequired.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']/following-sibling::span
NewSKU.button=//div[contains(@class, 'x-panel') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'btnInnerEl') and text()='NEW SKU']
Error.NotValidLabel=//label[contains(@id, 'displayfield') and text()='Not a Valid Routing Label Number']
Insert.secondlabel.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Routing Label Number')]
OversizedProduct.button=//div[contains(@class, 'toolbar')]//span[contains(@id, 'button')]//span[text()='Oversized' and 'Product']
OversizedProduct.Back.button=//div[contains(@id, 'lc-newskuqcprocess-view-OversizeProduct')]//span[text()='Back']
Changed.OK.button=//div[contains(@class, 'x-window') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'button') and text()='OK']
#New SKU - Multi-SKU
NewSKU+QC.required.check=//tr/td/div[text()='${WebUI-Item01}']//ancestor::tr/td/div[text()='New SKU + QC']
QC.required.check=//tr/td/div[text()='${WebUI-Item02}']//ancestor::tr/td/div[text()='QC']
NewSKU.Item01.required.check=//tr/td/div[text()='${WebUI-Item01}']//ancestor::tr/td/div[text()='New SKU']
NewSKU.Item02.required.check=//tr/td/div[text()='${WebUI-Item02}']//ancestor::tr/td/div[text()='New SKU']

#Downgrading 
Downgrading.page=#RETURNS-DOWNGRADE-wc2bV_lxQqijKG6QjSw2wg/lc-SortDowngradeReturnsAppPage////
Downgrading.InsertLPN.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert/Scan LPN')]
Downgrading.Next.button=//div[contains(@id, 'lc-sortdowngradereturns-view-MainView')]//a//span[text()='Next']
LPN.SubLPN.Contents=//span[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsLeftGrid') and text()='LPN/Sub LPN Contents']
Item.LeftGrid.check=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsLeftGrid')]//td[contains(@class, 'x-grid-cell x-grid-td')]/div[contains(@class, 'x-grid-cell-inner')]
Downgrading.Insert.ItemID.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert/Scan Item ID')]
Downgrading.Process.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Process']
DummyItem.RightGrid.check=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsRightGrid')]//td[contains(@class, 'x-grid-cell x-grid-td')]/div[contains(@class, 'x-grid-cell-inner ')]
Downgrading.Save.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Save']
Error.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Error']
Error.message.popup=//div[contains(@id, 'messagebox')]/b
Error.OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div/b[text()='Item B75822_4 does not have a valid Dummy Code']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='OK' and (@style and string-length(@style)!=0)]/following-sibling::span
Downgrading.Close.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Close'] 

#Adidas Workstation Configuration Screen
WorkstationDashboardscreen.page=#lc-WorkstationDashboard/Workstation-Configuration-Screen-qJuy7BC8Qq-FLG971mV1Nw////
Filter.input=//input[contains(@id, 'rpFilterComboBox')]
Box.button=//tr[contains(@data-recordid, 'V01*!CHUTE_PB_01')]//td[@class = 'x-grid-cell x-grid-td x-grid-cell-headerId-gridcolumn-1160 x-grid-cell-first x-grid-cell-special x-grid-cell-row-checker']
Action.button=//a[contains(@class, 'x-btn rp-menu-btn x-unselectable rp-btn-shadow x-btn-default-small x-noicon x-btn-noicon x-btn-default-small-noicon')]
Edit.button=//a[contains(@id, 'menuitem-1090-itemEl')]
WorkstationEnable.button=//table[contains(@class, 'x-field x-table-plain x-form-item x-form-type-checkbox x-field-default x-autocontainer-form-item')]//input[contains(@id, 'checkbox-1068-inputEl')]
Apply.button=//div[contains(@class, 'x-toolbar rp-remote-action-footer x-docked x-toolbar-default x-docked-bottom x-toolbar-docked-bottom x-toolbar-default-docked-bottom x-box-layout-ct')]//a[contains(@class, 'x-btn x-unselectable rp-important-btn rp-btn-shadow x-btn-toolbar x-box-item x-toolbar-item x-btn-default-toolbar-small x-noicon x-btn-noicon x-btn-default-toolbar-small-noicon')]

#Packing
Packing.page=#wm.packing/wm.packing.main////
scanIdentifierInput=//input[@name = 'identifier']
invalidContainerIdLabel=//div[@id = 'wm-packing-packing-body']//label[text() = 'Device not configured for this zone.']
notAllContainer=//div[@id = 'wm-packing-packing-body']//label[text() = 'Picking container does not contain all inventory for shipping carton: move container to Putwall until other inventory arrives.']
allItemsCheckbox=(//div[@id = 'wm-packing-packing-body']//div[contains(@class, 'checkbox')]//span[contains(@id, 'gridcolumn')])[2]
checkedAllItemsCheckbox=//div[contains (@class, 'x-grid-hd-checker-on') and contains(@class, 'checkbox')]//span[contains(@id, 'gridcolumn')]
processButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Process']
unpackButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Unpack']
markAllDamagedButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Mark All Damaged']
cancelPickingContainerButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Cancel Picking Container']
errorPickingContainerButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Error Picking Container']
completeButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Complete']
itemInput=//input[@name = 'itemNumber']
quantityInput=//input[@name = 'Quantity']
shippingContainerInput=//input[@name = 'shippingCartonNumber']
typeInput=//input[@name = 'cartonType']
typeExpandButton=//table[contains(@class, 'wm-packing-carton-type')]//div[contains(@class, 'x-form-arrow-trigger')]
typeDropdownTemplate=//body[contains(@id, 'ext-gen')]//div[contains(@id, 'boundlist')]//li[@class = 'x-boundlist-item' and text() = '${cartonType}']
itemRowPacked=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[@class = 'packed' and text() = ' PACKED '])[1]
itemRowNotPacked=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[contains(@class, 'x-grid-cell-inner') and not (contains(text(), 'PACKED'))])[1]
itemRowDamaged=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[@class = 'damaged' and text() = ' DAMAGED '])[1]
itemRowInvalid=//div[@class = 'error-message' and text() = 'Invalid Inventory']
logErrorPopUp=//div[contains(@id, 'wm-packing-packing-logerrorwindow')]//span[contains(@class, 'window-header-text') and text() = 'Log Error']
logErrorPopUpReasonInput=//input[@name = 'reasonCode']
logErrorPopUpReasonDropDown=//div[@id = 'wm-packing-packing']/ancestor::body//div[contains(@id, 'packing-logerrorwindow') and not(contains(@style,'display: none'))]/following-sibling::div[contains(@class,'x-boundlist-floating')]//li[text()='${reasonCode}']
logErrorPopUpLocationInput=(//input[contains(@name, 'textfield')])[1]
logErrorPopUpLogErrorButton=//span[contains(@id, 'button') and text() = 'Log Error']/following-sibling::span
containerTypeChangePopUp=//div[contains(@id, 'messagebox')]//span[contains(@class, 'window-header-text') and text() = 'Confirm Container Type Change']/ancestor::div[contains(@id, 'messagebox')]//div[text() = 'Are you sure you want to resize the shipping container?']
containerTypeChangePopUpYesButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'Yes']/following-sibling::span
confirmInventoryPopUp=//div[contains(@id, 'messagebox')]//span[contains(@class, 'window-header-text') and text() = 'Confirm Inventory']/ancestor::div[contains(@id, 'messagebox')]//div[text() = 'Is there inventory left in the picking container?']
confirmInventoryPopUpYesButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'Yes']/following-sibling::span
confirmInventoryPopUpNoButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'No']/following-sibling::span
itemRowOverage=//div[text() = '${Item01}']/ancestor::td/following-sibling::td//div[@class = 'damaged' and text() = ' OVERAGE']
updateQuantityButton=//span[contains(@id, 'button') and text() = 'Update Quantity']/following-sibling::span
updateQuantityProcessButton=//div[contains(@id, 'wm-packing-packing-changeqty-window')]//span[contains(@id, 'button') and text() = 'Process']/following-sibling::span

updateQuantityInput=//input[contains(@id, 'numberfield') and contains(@class, 'form-focus')]
logErrorPopUp.Location.Input=//td/label[contains(text(), 'Location')]/ancestor::td/following-sibling::td/input[contains(@class, 'x-form-field x-form-required-field x-form-text')]

#Door activity
DoorActivity.page=#wm.shipping/wm.dooractivity////
filterInput=//div[@id='wm-doorActivity-doorActivity']//span[@id='wm-doorActivity-doorActivity_header_hd-textEl' and text()='Door Activity']/ancestor::body//div[contains(@id, 'wm-doorandyardactivity-doorsgrid-')]//div[contains(@id, 'rpuxMainCriteriaEntryView-')]//table//input[contains(@id, 'rpuxFilterComboBox')]
transportEquipmentLabel=//div[contains(@id, 'wm-doorandyardactivity-doorsgrid-') and contains(@id, 'body')]//table//div[@class = 'trailer-progress']/div[@class = 'wm-click-target']
actionsButton=//div[contains(@class, 'wm-loaddetails')]//span[contains(@id, 'button') and text() = 'Actions']/following-sibling::span
closeEquipmentOption=//div[contains(@class, 'wm-loaddetails')]/following-sibling::div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Close Equipment']
dispatchEquipmentCheckbox=//label[contains(@id, 'checkbox') and text() = 'Dispatch Equipment']/parent::div/input
saveButton=//div[@id = 'wm-shipping-closeequipment-body']//span[contains(@id, 'button') and text() = 'Save']/following-sibling::span[not(contains(@class, 'x-btn-glyph'))]
splitShipmentPopUp=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//span[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and text() = 'Split Shipment']
shipmentToSplitLabel=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//span[contains(text(), '${outShip.shipmentName} (Loading)')]/ancestor::div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview')]/div[contains(@id, 'component') and text() = 'Not all shipments are loaded']
notSelectedSplitShipmentToggle=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//table[contains(@class, 'type-checkbox')]//div[@class = 'toggle_value' and text() = 'No']
selectedSplitShipmentToggle=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//table[contains(@class, 'type-checkbox')]//div[@class = 'toggle_value' and text() = 'Yes']
leaveInTheCurrentStagingLaneRadioButton=//label[contains(@id, 'radiofield') and text() = 'Leave in the current staging lane']/parent::div/input[@role = 'radio']
splitShipmentPopUpSaveButton=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview')]//span[contains(@id, 'button') and text() = 'Save']/following-sibling::span
confirmationPopUp=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//span[contains(@id, 'messagebox') and text() = 'Confirmation']
confirmationPopUpBodyText=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//div[@role = 'textbox' and text() = 'Shipping transport equipment ${transportequip.trailername} was dispatched successfully. Shipments were also split successfully.']
confirmationPopUpOkButton=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//span[contains(@id, 'button') and text() = 'OK']/following-sibling::span

 
#VAS Activities
VAS.Station.page=#VAS-0yQrd8N1TPuqPlLmV4V0KQ/lc-VasStationAppPage////
Insert.Carton.input=//input[contains(@placeholder, 'Insert Carton /Tote Number')]
Complete.LPN.button=//a//span[text()='Complete LPN']
Complete.VAS.button=//a//span[text()='Complete VAS']
Clear.LPN.button=//a//span[text()='Clear LPN']
Complete.VAS.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete VAS selected order line?']
Complete.VAS.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete VAS selected order line?']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
Progress.range=//div[contains(@class, 'wm-progress-lblcontainer')]//span[text()='100%']
Complete.LPN.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete LPN?']
Complete.LPN.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete LPN?']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
VAS.Completed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='All VAS Process completed.']
NotallVAS.Completed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Not all VAS activities have been completed.']
VAS.Completed.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='All VAS Process completed.']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
Confirm.label.printed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Confirm if labels printed ok? ']
Confirm.label.printed.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Confirm if labels printed ok? ']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
General.row.checker=//div[contains(@class, 'x-column-header-checkbox') and contains(@class, 'x-column-header-last')]
Insert.Item.input=//input[contains(@placeholder, 'Scan/Insert Item')]
#Error Packing - VAS
VAS.Required.error.popup=//div/label[(text()='Switch to VAS Screen. Perform the VAS activities before packing')]
LogErrorforPick.popup=//div[contains(@id, 'wm-packing-packing-logerrorwindow')]//span[contains(@class, 'window-header-text') and text() = 'Log Error For Picking Container']
Pass.checkbox=//label[contains(@id, 'checkbox') and text()='Pass']
All.VAS.button=//div[contains(@id, 'form') and not(contains(@class, 'x-hide-offsets'))]//div[contains(@style, 'padding')]
 

#Return Order
Inventory.page=#wm.returns/wm.returns.processing////
ReturnOrderNumberInput=//div[contains(@class, 'wm-returns-container')]//table[contains(@class, 'wm-returns-main-textfield')]//input[contains(@role, 'textbox')]
StartReturnButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Start Return']
ScanItemInput=//div[contains(@class, 'wm-returns-container')]//table[contains(@class, 'wm-returns-main-textfield')]//input[contains(@role, 'combobox')] 
 
#DE-SHAS
DE-SHAS.page=#DE-SHAS-nYyCPsheS_2WVSNHRECarw/lc-deshasProcessAppPage////
DE-SHAS.LPN.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Scan LPN') and not (contains(@style, 'visibility: hidden'))]
DE_SHAS.area=//div[contains(@class, 'x-panel-body')]//div[contains(@class, 'x-fit-item')]
DE_SHAS.Confirm.LPN.button=//div[contains(@id, 'toolbar')]//a//span[text()='Confirm LPN']
DE_SHAS.Insert.LPN.input=//input[@name='new_lpn']

#Load Unit Fast Check
LoadUnitFastCheck.page=#lc-LoadUnitFastCheck/lc-LoadUnitFastCheckAppPage////
Insert.Label.Carton.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Routing Label / Carton Number')]
Repack.button=//div[contains(@class, 'toolbar')]//span[contains(@id, 'button')]//span[text()='Repack']
LoadUnit.Confim.popup=//div[contains(@class, 'headerCenterText') and text()='Confirm Repack for carton?']
Repack.Passed.popup=//span[contains(@class, 'x-header-text') and text()='Repack Passed']
Repack.Passed.OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and not(contains (@style, 'display: none')) and text()='Repack Passed']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a[not(contains(@style, 'display: none'))]//span[contains(@class, 'x-btn-inner x-btn-inner-center') and not(contains(@style, 'display: none')) and text()='OK']/following-sibling::span

#TMS
WaveSet.page=#Adidas-TMS-A6SnYaJYS6i0py1iDJH_tg/LC-Adidas-Wave-Set-91MCkQXjSdufFt6ku1ZEYw////
WaveSet.filter=//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
Accept.Option=//div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Accept']

#Wave planning
Adidas.WavesandPicks.page=#wm.outboundplanner/lc-WavesandPicksAppPage////
Wave.Action.button=//a[contains(@class, 'x-btn more-actions-button rp-menu-btn x-unselectable x-btn-default-small x-noicon x-btn-noicon x-btn-default-small-noicon') and not(contains(@style,'display: none'))]/span/span/span[text() = 'Actions']
PlanWave.Option=//div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Plan Wave']
Search.button=//span[text() = 'Search']
WavesandPicks.filter=//div[contains(@class, 'x-panel x-box-item x-panel-default x-grid')]//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
PlanWave.button=//div[contains(@class, 'x-toolbar wm-bottombar x-docked x-toolbar-default x-docked-bottom x-toolbar-docked-bottom x-toolbar-default-docked-bottom x-box-layout-ct')]//span[text() = 'Plan Wave']
WaveName.input=//input[contains(@id, 'textfield') and contains(@placeholder, 'System Generated If Blank')]
WavesandPicks.OK.button=//div[contains(@id, 'toolbar')]//a//span[text()='OK']

#Export 

Confirm.checkbox=//div[contains(@id, 'container') and not(contains(@class, 'x-hide-offsets'))]//div[contains(@class, 'wrap-inner')]//input[contains(@type, 'button')]
ConfirmExport=#Adidas-Operational-0jl3IhzmRjinUJH4Ye7Ycg/LC-Dispatch-Confirmation-for-Export-kWtgqE2iRB-UVJqlkSLr1Q////

Export.filter=//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
Edit.label=//div[contains(@id, 'menu') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'menuitem') and text() = 'Edit']

#WCS Internal Transfer Order

WCSInternal =#Adidas-Operational-0jl3IhzmRjinUJH4Ye7Ycg/lc-wcsinternaltrforderapppage////
Tote.input=//div[contains(@id, 'lc-wcsinternaltrforder')]//tr[contains(@id, 'textfield')]//input[contains(@placeholder, 'Insert/Scan Tote ID')]
Target.Station.input=//div[contains(@id, 'lc-wcsinternaltrforder')]//tr[contains(@id, 'combobox')]//input[contains(@placeholder, 'Select Target Station')]
Send.Button=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Send']
WCSInternal.Confirm.popup=//div[contains(@class, 'component ') and not(contains(@class, 'x-hide-offsets'))]//span[contains(@id, 'messagebox') and text()='Confirm']
 
#OrderManagerExtended
OrderManagerExtended.page=#Adidas-Dashboards--9vs5mcbR1yNhTIlaNg0lw/Order-Manager-Extended-90uKZZFnTeGRVAA3XynSDw////
Update.filter=//div[contains(@class, 'x-container x-box-item x-container-default x-box-layout-ct')]//div[contains(@id,'toolbar')]//table[contains(@role,'presentation')]//span[contains(@style, 'JDAIconsFamily-Regular')]/ancestor::tr[contains(@role, 'presentation')]//input[contains(@id, 'rpFilterComboBox')]
Order.check=//td/div[text()='${OutboundOrder}']//ancestor::tr/td/div/div[contains(@class, 'x-grid-row-checker')]
OrderAction.buttom=(//div[contains(@class, 'rp-fancy-header-bottom-bar-default')]/preceding::div[contains(@id, 'toolbar') and not (text()='DETAILS')]//span[contains(@id, 'button') and text() = 'Actions'])[1]
data.field=//label[text() = 'Cutoff Datetime' and not(contains(text(), 'New PGI date')) and not(contains(text(), 'New delivery date'))]/parent::div/following-sibling::div//input[contains(@name, 'datefield')]
time.field=//label[text() = 'Cutoff Datetime' and not(contains(text(), 'New PGI date')) and not(contains(text(), 'New delivery date'))]/parent::div/following-sibling::div//input[contains(@name, 'timefield')]
prio.field=//label[text() = 'Priority']/parent::div/following-sibling::table//input

#Items
#Conveyable
Item_6673=DSOS_2424_01
Item_6675_01=RLI_952287
Item_6675_02=RLI_041887
Item_6675_03=RLI_128443
Item_7500=VL2427334
Item_6796=RLI_646639
Item_6807_01=DSOS_6807_01
Item_6807_02=DSOS_6807_02
Item_6864=RLI_254465

#Oversized
Item_6676_01=RLI_051303
Item_6676_02=RLI_118383

#Non-Conveyable
Item_6674_01=NCVN0001
Item_6674_02=RNCV0010
Item_6674_03=RNCV0020
Item_6868=RLI_818478

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
report.captureWebSteps=true
report.captureRFSteps=true

#user data
gv.username=OLEXIY.BOYKO
gv.password=Welcome1

#master data
gv.warehouse=KN-NLAMS
gv.client=KN
#carrierCode=DHL

#environment data
gv.environment=seu99t1
mobile.device=MOBILE-TEST
mobile.port=8059
mobile.startLocation=HC-G1
mobile.equipment=EJE
#mobile.workArea=WASTORE
config.mobile.mobile.titles.undir_menu=Main Menu

prefix.outShip=BOOS
prefixDigits.outShip=8
prefix.outWave=BOW
prefixDigits.outWave=8
prefix.lpn=BOLPN
prefixDigits.lpn=7
prefix.inbShip=BOIS-
prefixDigits.inbShip=8

atlas.main=#ATLAS-Main-Menu-RndUB1O3TtSC3irBeqbHbA/Known-Shipments-wLl8BzdbTq6Qn03sCF8iVw////
atlas.main.outb=#ATLAS-Main-Menu-RndUB1O3TtSC3irBeqbHbA/Shipments-in-Warehouse-YWDvgVWERyKUdiazCa-8qQ/buildingId=KN-NLAMS-1///
atlas.outb.deliv=#ATLAS-Main-Menu-RndUB1O3TtSC3irBeqbHbA/Outbound-Delivery-MstGljZqQCWJ1d2OFUOYHg/buildingId=KN-NLAMS-1///
shp.search=//a[contains(@class,'rp-filter-menu')]//span[contains(@class,'x-btn-inner-center')]/ancestor::td[contains(@class,'x-table-layout-cell')]/preceding-sibling::td[contains(@class,'x-table-layout-cell')]//input[contains(@id,'rpFilterComboBox')]
inb.check=//tr[contains(@id, '${inbOrdName}')]//div[@class='x-grid-row-checker']
outb.check=//tr[contains(@id, '${an_number}')]//div[@class='x-grid-row-checker']
outb.deliv.check=//tr[contains(@id, '${trlr_num}')]//div[@class='x-grid-row-checker']
action.inbButton=//div[contains(@class, 'rp-fancy-header-bottom-bar-left')]//span[contains(@class, 'x-btn-arrow')]
addInb.deliv=//a[contains(@class, 'x-menu-item-link')]//span[text()='Add To New Inbound Delivery']
addOutb.deliv=//a[contains(@class, 'x-menu-item-link')]//span[text()='Add to New Outbound Delivery']
outb.release=//a[contains(@class, 'x-menu-item-link')]//span[text()='Release']
transp.company=//label[text()='Transport Company']/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
inbLic.plateNum=//label[text()='License Plate No.']/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
inb.driverName=//label[contains(text(), 's Name')]/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.driverName=//label[contains(text(), 'Driver Name')]/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.driverMob=//label[contains(text(), 's Mobile')]/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.dest=//label[text()='Destination']/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.LPTruck=//label[text()='License Plate Truck']/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.LPTrailer=//label[contains(text(), 'License Plate Trailer')]/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
trans.reference=//label[text()='Transport Reference']/parent::div/following-sibling::input[contains(@class, 'x-form-required-field')]
outb.dgr=//label[text()='DGR?']/parent::div/following-sibling::table//input[contains(@class, 'x-form-required-field')]
outb.VT=//label[text()='Vehicle Type']/parent::div/following-sibling::table//input[contains(@class, 'x-form-required-field')]
outb.release.field=//label[text()='Release To']/parent::div/following-sibling::table//input[contains(@class, 'x-form-required-field')]
inbExec.button=//a[contains(@class, 'rp-important-btn')]//span[text()='Execute']


--------------------------------------------------------------------------------------
#CLISTIT-1999
#Master data
gv.username=DARIA.SOSKOVA
gv.password=Soskova1
gv.warehouse=ITMAN01
gv.client=ADIDAS
Inbound_Repository=CLISTIT-730
Outbound_Repository=CLISTIT-1388

#Environment data
gv.environment=sit03i1
wcs.endpoint.tail=kisoft/edi/wcs/execute
config.mconductor.mconductor.incoming.sending.mode = direct

gv.workstation=B2BVAS_01

#API endpoints
EndPoint_ReturnOrderAdvice=AdidasReturnOrderAdvice
EndPoint_OutboundOrderRequest=AdidasOutboundOrderRequest
EndPoint_ItemMasterAdvice=AdidasItemMasterAdvice
EndPoint_WaalosPriceMessage=AdidasWaalosPriceMessage
EndPoint_EMEAInboundShipmentAdvice=Generic
EndPoint_WaalosItemMasterAdvice=Generic

#Items Replenishment 

Item_6834_01=DSOS_6834_01
Item_6834_02=DSOS_6834_02
Item_6834_03=DSOS_6834
Item_6677_01=DSOS_6677
Item_6801_01=DSOS_6801_01
Item_7331_01=DSOS_7331
Item_7510_01=DSOS_ITEM_7510
Item_7814_01=DSOS_7814_01
Item_7814_02=DSOS_7814_02
Item_7814_03=DSOS_7814_03
Item_7766_01=DS_ITEM_7766_04
Item_7766_02=DS_ITEM_7766_05
Item_7766_03=DS_ITEM_7766_06
Item_8559_01=DS_8559_01
Item_8559_02=DS_8559_02
Item_8559_03=DS_8559_03

#Yard Management
appointment.duration = 5

#RF Device
mobile.device=MOBILE_DS
mobile.port=8059
mobile.equipment=FORK
mobile.startLocation = 000

config.timeouts.timeout.mobile.action = 100
config.timeouts.timeout.mobile.loading=100
config.timeouts.timeout.edi.event.status = 60

config.timeouts.timeout.edi.event.status = 30

config.timeouts.timeout.wave.release = 40

= 100

config.timeouts.timeout.mconductor.message.trigger=60

config.timeouts.timeout.label.generation=90
timeout.mconductor.message.integration = 60
timeout.edi.event.trigger = 60
timeout.mconductor.message.trigger=60
timeout.validation.default = 60

#WebUI

#Mono-SKU - QC process
New_SKU.QC.page=#New-SKU-opTKcJz9Q8uqobY_njnCHQ/lc-NewSkuQCAppPage////
Insert.label.input=//input[contains(@class, 'x-form-field x-form-text') and not(contains(@class, 'x-form-empty-field')) and contains(@placeholder, 'Insert Routing Label Number')]
Next.button=//div[contains(@id, 'lc-newskuqcprocess-view-NewSkuQcStation')]//a//span[text()='Next']
Add.quality.form=//span[contains(@id, 'wm-qualityissuewindow') and text()='Add Quality Issue']
Supplier.issue.field=//input[contains(@class, 'x-form-field x-form-text') and @name='supplierIssues'] 
Supplier.quantity.field=//input[contains(@class, 'x-form-field x-form-text') and @name='supplierQuantity']
Supplier.issue.list=//div[contains(@class, 'x-boundlist-default') and not(contains (@style, 'display: none'))]//li[contains(@class, 'x-boundlist-item') and text()='QC OK'] 
Supplier.issue.list.damaged=//div[contains(@class, 'x-boundlist-default') and not(contains (@style, 'display: none'))]//li[contains(@class, 'x-boundlist-item') and text()='Damaged']
Save.button=//div[contains(@class, 'docked-bottom')]//a[not(contains(@class, 'disabled'))]//span[text()='Save']/following-sibling::span
Success.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Success']
OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Success']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='OK']/following-sibling::span
New_SKU.QC.page.visibility=//span[contains(@class, 'x-header-text -text -text-default') and text()='New Sku/QC Station']
SupplierIssue.popup=//div[text()='Supplier issue or carrier issue is required.']
Yes.button=//span[text()='Yes']
OK.button1=//div[contains(@class, 'x-window') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@id, 'messagebox')]//span[text()='OK']
#Multi-SKU - QC process 
MultiSKU.pagetitle=//span[text()='MULTI SKU SUB-LPN']
WebUI-Item01.row=//div[contains(@class, 'x-grid-cell-inner') and text()='${WebUI-Item01}']
Insert.Item.input=//input[contains(@class, 'x-form-field x-form-text') and not(contains(@class, 'x-form-empty-field')) and contains(@placeholder, 'Insert Item Number or Select a Row')]
Insert.ItemorRow.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Item Number or Select a Row')]
MultiSKU.Next.button=//div[contains(@id, 'lc-newskuqcprocess-view-MultiSkuQcStationForm')]//span[text()='Next']
WebUI-Item01.row.check=//td//div[contains(@class, 'x-grid-cell-inner') and text()='${WebUI-Item01}']
MultiSKU.Back.button=//div[contains(@id, 'lc-newskuqcprocess-view-MultiSkuQcStationForm')]//span[text()='Back']

#New SKU
ScanProduct.button=//span[text()='Scan' and 'Product']
Length.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimLength']
Width.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimWidth']
Height.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimHeight']
Weight.field=//input[contains(@class, 'x-form-field x-form-required-field x-form-text') and @name='dimWeight']
Foldable.field=//input[contains(@class, 'x-form-field x-form-text') and @name='foldable']
SPOBoxable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='SPO Boxable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
Totable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='Totable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
Conveyable.toggle=//tr[contains(@class, 'x-form-item-input-row')]/td/label[text()='Conveyable:']//ancestor::tr/td/div/div[contains(@class, 'toggle_value')]
NewSKU.OK.button=//div[contains(@id, 'lc-newskuqcprocess-view-OversizeProduct')]//span[text()='OK']
NewSKU.Confirm.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']
NewSKU.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']/following-sibling::span
QCrequired.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']
QCrequired.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Confirm']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']/following-sibling::span
NewSKU.button=//div[contains(@class, 'x-panel') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'btnInnerEl') and text()='NEW SKU']
Error.NotValidLabel=//label[contains(@id, 'displayfield') and text()='Not a Valid Routing Label Number']
Insert.secondlabel.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Routing Label Number')]
OversizedProduct.button=//div[contains(@class, 'toolbar')]//span[contains(@id, 'button')]//span[text()='Oversized' and 'Product']
OversizedProduct.Back.button=//div[contains(@id, 'lc-newskuqcprocess-view-OversizeProduct')]//span[text()='Back']
Changed.OK.button=//div[contains(@class, 'x-window') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'button') and text()='OK']
#New SKU - Multi-SKU
NewSKU+QC.required.check=//tr/td/div[text()='${WebUI-Item01}']//ancestor::tr/td/div[text()='New SKU + QC']
QC.required.check=//tr/td/div[text()='${WebUI-Item02}']//ancestor::tr/td/div[text()='QC']
NewSKU.Item01.required.check=//tr/td/div[text()='${WebUI-Item01}']//ancestor::tr/td/div[text()='New SKU']
NewSKU.Item02.required.check=//tr/td/div[text()='${WebUI-Item02}']//ancestor::tr/td/div[text()='New SKU']

#Downgrading 
Downgrading.page=#RETURNS-DOWNGRADE-wc2bV_lxQqijKG6QjSw2wg/lc-SortDowngradeReturnsAppPage////
Downgrading.InsertLPN.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert/Scan LPN')]
Downgrading.Next.button=//div[contains(@id, 'lc-sortdowngradereturns-view-MainView')]//a//span[text()='Next']
LPN.SubLPN.Contents=//span[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsLeftGrid') and text()='LPN/Sub LPN Contents']
Item.LeftGrid.check=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsLeftGrid')]//td[contains(@class, 'x-grid-cell x-grid-td')]/div[contains(@class, 'x-grid-cell-inner')]
Downgrading.Insert.ItemID.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert/Scan Item ID')]
Downgrading.Process.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Process']
DummyItem.RightGrid.check=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsRightGrid')]//td[contains(@class, 'x-grid-cell x-grid-td')]/div[contains(@class, 'x-grid-cell-inner ')]
Downgrading.Save.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Save']
Error.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and text()='Error']
Error.message.popup=//div[contains(@id, 'messagebox')]/b
Error.OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div/b[text()='Item B75822_4 does not have a valid Dummy Code']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='OK' and (@style and string-length(@style)!=0)]/following-sibling::span
Downgrading.Close.button=//div[contains(@id, 'lc-sortdowngradereturns-view-DowngradeReturnsProcess')]//span[text()='Close'] 

#Adidas Workstation Configuration Screen
WorkstationDashboardscreen.page=#lc-WorkstationDashboard/Workstation-Configuration-Screen-qJuy7BC8Qq-FLG971mV1Nw////
Filter.input=//input[contains(@id, 'rpFilterComboBox')]
Box.button=//tr[contains(@data-recordid, 'V01*!CHUTE_PB_01')]//td[@class = 'x-grid-cell x-grid-td x-grid-cell-headerId-gridcolumn-1160 x-grid-cell-first x-grid-cell-special x-grid-cell-row-checker']
Action.button=//a[contains(@class, 'x-btn rp-menu-btn x-unselectable rp-btn-shadow x-btn-default-small x-noicon x-btn-noicon x-btn-default-small-noicon')]
Edit.button=//a[contains(@id, 'menuitem-1090-itemEl')]
WorkstationEnable.button=//table[contains(@class, 'x-field x-table-plain x-form-item x-form-type-checkbox x-field-default x-autocontainer-form-item')]//input[contains(@id, 'checkbox-1068-inputEl')]
Apply.button=//div[contains(@class, 'x-toolbar rp-remote-action-footer x-docked x-toolbar-default x-docked-bottom x-toolbar-docked-bottom x-toolbar-default-docked-bottom x-box-layout-ct')]//a[contains(@class, 'x-btn x-unselectable rp-important-btn rp-btn-shadow x-btn-toolbar x-box-item x-toolbar-item x-btn-default-toolbar-small x-noicon x-btn-noicon x-btn-default-toolbar-small-noicon')]

#Packing
Packing.page=#wm.packing/wm.packing.main////
scanIdentifierInput=//input[@name = 'identifier']
invalidContainerIdLabel=//div[@id = 'wm-packing-packing-body']//label[text() = 'Device not configured for this zone.']
notAllContainer=//div[@id = 'wm-packing-packing-body']//label[text() = 'Picking container does not contain all inventory for shipping carton: move container to Putwall until other inventory arrives.']
allItemsCheckbox=(//div[@id = 'wm-packing-packing-body']//div[contains(@class, 'checkbox')]//span[contains(@id, 'gridcolumn')])[2]
checkedAllItemsCheckbox=//div[contains (@class, 'x-grid-hd-checker-on') and contains(@class, 'checkbox')]//span[contains(@id, 'gridcolumn')]
processButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Process']
unpackButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Unpack']
markAllDamagedButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Mark All Damaged']
cancelPickingContainerButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Cancel Picking Container']
errorPickingContainerButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Error Picking Container']
completeButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Complete']
itemInput=//input[@name = 'itemNumber']
quantityInput=//input[@name = 'Quantity']
shippingContainerInput=//input[@name = 'shippingCartonNumber']
typeInput=//input[@name = 'cartonType']
typeExpandButton=//table[contains(@class, 'wm-packing-carton-type')]//div[contains(@class, 'x-form-arrow-trigger')]
typeDropdownTemplate=//body[contains(@id, 'ext-gen')]//div[contains(@id, 'boundlist')]//li[@class = 'x-boundlist-item' and text() = '${cartonType}']
itemRowPacked=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[@class = 'packed' and text() = ' PACKED '])[1]
itemRowNotPacked=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[contains(@class, 'x-grid-cell-inner') and not (contains(text(), 'PACKED'))])[1]
itemRowDamaged=(//div[text() = '${Item01}']/ancestor::td/following-sibling::td[contains(@class, 'x-grid-cell-last')]//div[@class = 'damaged' and text() = ' DAMAGED '])[1]
itemRowInvalid=//div[@class = 'error-message' and text() = 'Invalid Inventory']
logErrorPopUp=//div[contains(@id, 'wm-packing-packing-logerrorwindow')]//span[contains(@class, 'window-header-text') and text() = 'Log Error']
logErrorPopUpReasonInput=//input[@name = 'reasonCode']
logErrorPopUpReasonDropDown=//div[@id = 'wm-packing-packing']/ancestor::body//div[contains(@id, 'packing-logerrorwindow') and not(contains(@style,'display: none'))]/following-sibling::div[contains(@class,'x-boundlist-floating')]//li[text()='${reasonCode}']
logErrorPopUpLocationInput=(//input[contains(@name, 'textfield')])[1]
logErrorPopUpLogErrorButton=//span[contains(@id, 'button') and text() = 'Log Error']/following-sibling::span
containerTypeChangePopUp=//div[contains(@id, 'messagebox')]//span[contains(@class, 'window-header-text') and text() = 'Confirm Container Type Change']/ancestor::div[contains(@id, 'messagebox')]//div[text() = 'Are you sure you want to resize the shipping container?']
containerTypeChangePopUpYesButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'Yes']/following-sibling::span
confirmInventoryPopUp=//div[contains(@id, 'messagebox')]//span[contains(@class, 'window-header-text') and text() = 'Confirm Inventory']/ancestor::div[contains(@id, 'messagebox')]//div[text() = 'Is there inventory left in the picking container?']
confirmInventoryPopUpYesButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'Yes']/following-sibling::span
confirmInventoryPopUpNoButton=//div[contains(@id, 'messagebox')]//span[contains(@id, 'button') and text() = 'No']/following-sibling::span
itemRowOverage=//div[text() = '${Item01}']/ancestor::td/following-sibling::td//div[@class = 'damaged' and text() = ' OVERAGE']
updateQuantityButton=//span[contains(@id, 'button') and text() = 'Update Quantity']/following-sibling::span
updateQuantityProcessButton=//div[contains(@id, 'wm-packing-packing-changeqty-window')]//span[contains(@id, 'button') and text() = 'Process']/following-sibling::span

updateQuantityInput=//input[contains(@id, 'numberfield') and contains(@class, 'form-focus')]
logErrorPopUp.Location.Input=//td/label[contains(text(), 'Location')]/ancestor::td/following-sibling::td/input[contains(@class, 'x-form-field x-form-required-field x-form-text')]

#Door activity
DoorActivity.page=#wm.shipping/wm.dooractivity////
filterInput=//div[@id='wm-doorActivity-doorActivity']//span[@id='wm-doorActivity-doorActivity_header_hd-textEl' and text()='Door Activity']/ancestor::body//div[contains(@id, 'wm-doorandyardactivity-doorsgrid-')]//div[contains(@id, 'rpuxMainCriteriaEntryView-')]//table//input[contains(@id, 'rpuxFilterComboBox')]
transportEquipmentLabel=//div[contains(@id, 'wm-doorandyardactivity-doorsgrid-') and contains(@id, 'body')]//table//div[@class = 'trailer-progress']/div[@class = 'wm-click-target']
actionsButton=//div[contains(@class, 'wm-loaddetails')]//span[contains(@id, 'button') and text() = 'Actions']/following-sibling::span
closeEquipmentOption=//div[contains(@class, 'wm-loaddetails')]/following-sibling::div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Close Equipment']
dispatchEquipmentCheckbox=//label[contains(@id, 'checkbox') and text() = 'Dispatch Equipment']/parent::div/input
saveButton=//div[@id = 'wm-shipping-closeequipment-body']//span[contains(@id, 'button') and text() = 'Save']/following-sibling::span[not(contains(@class, 'x-btn-glyph'))]
splitShipmentPopUp=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//span[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and text() = 'Split Shipment']
shipmentToSplitLabel=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//span[contains(text(), '${outShip.shipmentName} (Loading)')]/ancestor::div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview')]/div[contains(@id, 'component') and text() = 'Not all shipments are loaded']
notSelectedSplitShipmentToggle=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//table[contains(@class, 'type-checkbox')]//div[@class = 'toggle_value' and text() = 'No']
selectedSplitShipmentToggle=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview') and not(contains(@style, 'display:none'))]//table[contains(@class, 'type-checkbox')]//div[@class = 'toggle_value' and text() = 'Yes']
leaveInTheCurrentStagingLaneRadioButton=//label[contains(@id, 'radiofield') and text() = 'Leave in the current staging lane']/parent::div/input[@role = 'radio']
splitShipmentPopUpSaveButton=//div[contains(@id, 'wm-shipping-closeequipment-splitshipmentview')]//span[contains(@id, 'button') and text() = 'Save']/following-sibling::span
confirmationPopUp=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//span[contains(@id, 'messagebox') and text() = 'Confirmation']
confirmationPopUpBodyText=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//div[@role = 'textbox' and text() = 'Shipping transport equipment ${transportequip.trailername} was dispatched successfully. Shipments were also split successfully.']
confirmationPopUpOkButton=//div[contains(@id, 'messagebox') and not(contains(@style, 'display:none'))]//span[contains(@id, 'button') and text() = 'OK']/following-sibling::span

 
#VAS Activities
VAS.Station.page=#VAS-0yQrd8N1TPuqPlLmV4V0KQ/lc-VasStationAppPage////
Insert.Carton.input=//input[contains(@placeholder, 'Insert Carton /Tote Number')]
Complete.LPN.button=//a//span[text()='Complete LPN']
Complete.VAS.button=//a//span[text()='Complete VAS']
Clear.LPN.button=//a//span[text()='Clear LPN']
Complete.VAS.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete VAS selected order line?']
Complete.VAS.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete VAS selected order line?']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
Progress.range=//div[contains(@class, 'wm-progress-lblcontainer')]//span[text()='100%']
Complete.LPN.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete LPN?']
Complete.LPN.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()=' Are you sure want to complete LPN?']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
VAS.Completed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='All VAS Process completed.']
NotallVAS.Completed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Not all VAS activities have been completed.']
VAS.Completed.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='All VAS Process completed.']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
Confirm.label.printed.popup=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Confirm if labels printed ok? ']
Confirm.label.printed.Yes.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//div[contains(@class, 'headerCenterText') and text()='Confirm if labels printed ok? ']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a//span[text()='Yes']
General.row.checker=//div[contains(@class, 'x-column-header-checkbox') and contains(@class, 'x-column-header-last')]
Insert.Item.input=//input[contains(@placeholder, 'Scan/Insert Item')]
#Error Packing - VAS
VAS.Required.error.popup=//div/label[(text()='Switch to VAS Screen. Perform the VAS activities before packing')]
LogErrorforPick.popup=//div[contains(@id, 'wm-packing-packing-logerrorwindow')]//span[contains(@class, 'window-header-text') and text() = 'Log Error For Picking Container']
Pass.checkbox=//label[contains(@id, 'checkbox') and text()='Pass']
All.VAS.button=//div[contains(@id, 'form') and not(contains(@class, 'x-hide-offsets'))]//div[contains(@style, 'padding')]
 

#Return Order
Inventory.page=#wm.returns/wm.returns.processing////
ReturnOrderNumberInput=//div[contains(@class, 'wm-returns-container')]//table[contains(@class, 'wm-returns-main-textfield')]//input[contains(@role, 'textbox')]
StartReturnButton=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Start Return']
ScanItemInput=//div[contains(@class, 'wm-returns-container')]//table[contains(@class, 'wm-returns-main-textfield')]//input[contains(@role, 'combobox')] 
 
#DE-SHAS
DE-SHAS.page=#DE-SHAS-nYyCPsheS_2WVSNHRECarw/lc-deshasProcessAppPage////
DE-SHAS.LPN.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Scan LPN') and not (contains(@style, 'visibility: hidden'))]
DE_SHAS.area=//div[contains(@class, 'x-panel-body')]//div[contains(@class, 'x-fit-item')]
DE_SHAS.Confirm.LPN.button=//div[contains(@id, 'toolbar')]//a//span[text()='Confirm LPN']
DE_SHAS.Insert.LPN.input=//input[@name='new_lpn']

#Load Unit Fast Check
LoadUnitFastCheck.page=#lc-LoadUnitFastCheck/lc-LoadUnitFastCheckAppPage////
Insert.Label.Carton.input=//input[contains(@class, 'x-form-field x-form-text') and contains(@placeholder, 'Insert Routing Label / Carton Number')]
Repack.button=//div[contains(@class, 'toolbar')]//span[contains(@id, 'button')]//span[text()='Repack']
LoadUnit.Confim.popup=//div[contains(@class, 'headerCenterText') and text()='Confirm Repack for carton?']
Repack.Passed.popup=//span[contains(@class, 'x-header-text') and text()='Repack Passed']
Repack.Passed.OK.button=//div[contains(@class, 'x-layer') and not(contains(@class, 'x-hide-offsets')) and contains(@class, 'x-message-box')]//span[contains(@class, 'x-header-text') and not(contains (@style, 'display: none')) and text()='Repack Passed']/ancestor::div/following-sibling::div[contains(@class, 'footer ')]//a[not(contains(@style, 'display: none'))]//span[contains(@class, 'x-btn-inner x-btn-inner-center') and not(contains(@style, 'display: none')) and text()='OK']/following-sibling::span

#TMS
WaveSet.page=#Adidas-TMS-A6SnYaJYS6i0py1iDJH_tg/LC-Adidas-Wave-Set-91MCkQXjSdufFt6ku1ZEYw////
WaveSet.filter=//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
Accept.Option=//div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Accept']

#Wave planning
Adidas.WavesandPicks.page=#wm.outboundplanner/lc-WavesandPicksAppPage////
Wave.Action.button=//a[contains(@class, 'x-btn more-actions-button rp-menu-btn x-unselectable x-btn-default-small x-noicon x-btn-noicon x-btn-default-small-noicon') and not(contains(@style,'display: none'))]/span/span/span[text() = 'Actions']
PlanWave.Option=//div[contains(@id, 'menu')]//a[not(contains(@class, 'rp-icon-collapsed'))]//span[contains(@id, 'menuitem') and text() = 'Plan Wave']
Search.button=//span[text() = 'Search']
WavesandPicks.filter=//div[contains(@class, 'x-panel x-box-item x-panel-default x-grid')]//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
PlanWave.button=//div[contains(@class, 'x-toolbar wm-bottombar x-docked x-toolbar-default x-docked-bottom x-toolbar-docked-bottom x-toolbar-default-docked-bottom x-box-layout-ct')]//span[text() = 'Plan Wave']
WaveName.input=//input[contains(@id, 'textfield') and contains(@placeholder, 'System Generated If Blank')]
WavesandPicks.OK.button=//div[contains(@id, 'toolbar')]//a//span[text()='OK']

#Export 

Confirm.checkbox=//div[contains(@id, 'container') and not(contains(@class, 'x-hide-offsets'))]//div[contains(@class, 'wrap-inner')]//input[contains(@type, 'button')]
ConfirmExport=#Adidas-Operational-0jl3IhzmRjinUJH4Ye7Ycg/LC-Dispatch-Confirmation-for-Export-kWtgqE2iRB-UVJqlkSLr1Q////
Export.filter=//div[contains(@class,'x-panel-header rp-fancy-header rp-filter-header x-docked x-panel-header-default x-docked-top x-panel-header-docked-top x-panel-header-default-docked-top x-column-layout-ct')]//td[contains(@id, 'rpFilterComboBox-')]/input[contains(@id, 'rpFilterComboBox-')]
Edit.label=//div[contains(@id, 'menu') and not (contains(@style, 'visibility: hidden'))]//span[contains(@id, 'menuitem') and text() = 'Edit']
#WCS Internal Transfer Order

WCSInternal =#Adidas-Operational-0jl3IhzmRjinUJH4Ye7Ycg/lc-wcsinternaltrforderapppage////
Tote.input=//div[contains(@id, 'lc-wcsinternaltrforder')]//tr[contains(@id, 'textfield')]//input[contains(@placeholder, 'Insert/Scan Tote ID')]
Target.Station.input=//div[contains(@id, 'lc-wcsinternaltrforder')]//tr[contains(@id, 'combobox')]//input[contains(@placeholder, 'Select Target Station')]
Send.Button=//a[not(contains(@class, 'x-item-disabled'))]//span[contains(@id, 'button') and text() = 'Send']
WCSInternal.Confirm.popup=//div[contains(@class, 'component ') and not(contains(@class, 'x-hide-offsets'))]//span[contains(@id, 'messagebox') and text()='Confirm']
 
#OrderManagerExtended
OrderManagerExtended.page=#Adidas-Dashboards--9vs5mcbR1yNhTIlaNg0lw/Order-Manager-Extended-90uKZZFnTeGRVAA3XynSDw////
Update.filter=//div[contains(@class, 'x-container x-box-item x-container-default x-box-layout-ct')]//div[contains(@id,'toolbar')]//table[contains(@role,'presentation')]//span[contains(@style, 'JDAIconsFamily-Regular')]/ancestor::tr[contains(@role, 'presentation')]//input[contains(@id, 'rpFilterComboBox')]
Order.check=//td/div[text()='${OutboundOrder}']//ancestor::tr/td/div/div[contains(@class, 'x-grid-row-checker')]
OrderAction.buttom=(//div[contains(@class, 'rp-fancy-header-bottom-bar-default')]/preceding::div[contains(@id, 'toolbar') and not (text()='DETAILS')]//span[contains(@id, 'button') and text() = 'Actions'])[1]
data.field=//label[text() = 'Cutoff Datetime' and not(contains(text(), 'New PGI date')) and not(contains(text(), 'New delivery date'))]/parent::div/following-sibling::div//input[contains(@name, 'datefield')]
time.field=//label[text() = 'Cutoff Datetime' and not(contains(text(), 'New PGI date')) and not(contains(text(), 'New delivery date'))]/parent::div/following-sibling::div//input[contains(@name, 'timefield')]
prio.field=//label[text() = 'Priority']/parent::div/following-sibling::table//input

---------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
    actions.Button=//div[contains(@id, 'targetEl')]//span[text()='Actions']
    schedulecounts.Button=//div[contains(@id, 'targetEl')]//span[text()='Schedule Count']
    requestCountBy.field=//input[contains(@name, 'requestCountBy')]
    location.field=//input[contains(@name, 'requestCountBy')]
    findLocations.Button=//div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//a//span[text()='Find Locations']
    nextButton.inv=//div[contains(@id, 'targetEl')]//span[text()='Next']
    counttype.field=//input[contains(@name, 'countType')]
    counttypeReq.field=//input[contains(@name, 'requestType')]
    savenrelease.button=//div[contains(@id, 'targetEl')]//span[text()='Save and Release']


    counttype.field=//input[@name, 'countType']
    counttypeReq.field=//input[contains(@name, 'requestType')]


    And the user clicks on the web element located by xpath "//div[contains(@id, 'targetEl')]//span[text()='&nbsp;']"
    //div[contains(@id, 'targetEl') and contains(@class, 'x-box-target')]//div[contains(@class, 'x-column-header x-column-header-checkbox x-column-header-align-left x-box-item x-column-header-default x-unselectable x-column-menu-disabled x-column-header-first')]//span[contains(@id, 'textEL') and contains (text()='&nbsp;')]
