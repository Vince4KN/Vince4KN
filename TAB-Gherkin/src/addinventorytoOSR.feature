# Define variables
    Given list of variables
      | Variable                       | Value                       |
      | Item01                         | TAITEM28                    |
      | ExpectedQty                    | 2                           |
      | Qty01                          | 2                           |
      | InboundShipment                | ${generateStrID('SHP', 9)}  |
      | InboundOrder                   | ${InboundShipment}          |
      | LPN                            | ${generateStrID('LPN', 10)} |
      | carrier                        | JHLG                        |
      | dec_st                         | DEC104                      |
      | coo01                          | VN                          |
      | Sts01                          | A                           |
      | LoadUnitCode00                 | ${generateIntID(5)}         |
      | LoadUnitCode01                 | ${LoadUnitCode00}1          |
      | LoadUnitCode                   | ${LoadUnitCode00}5          |
      | orderNumber00                  | ${generateStrID('MOV-0',4)} |
      | orderNumber01                  | ${orderNumber00}1           |
      | sscc.generation.extensionDigit | 9                           |
      | sscc.generation.prefix         | 0000000145                  |

    And unique SSCC number is saved as "SSCC" variable

    And the following attachments of the issue "${Inbound_Repository}" are loaded
      | ISA_1C(Mono).xml               |
      | ReturnMessage_CS001_Dec.xml    |
      | ReturnMessage_D001_status0.xml |
      | ReturnMessage_DEC114.xml       |
      | ReturnMessage_DEC10_2ea.xml    |
      | ReturnMessage_OSR1_mov_2ea.xml |
      | ReturnMessage_OSR1-inv_2ea.xml |

# InboundShipmentAdvice message integration (WMS <- Client)
    When the user sends the EDI message successfully with the following data
      | MessageType    | InboundShipmentAdvice |
      | MessageVersion | 0210                  |
      | Template       | ISA_1C(Mono).xml      |

    # Check: Inbound Shipment and Order creation
    Then inbound shipment "${InboundShipment}" is created
    And planned inbound order "${InboundOrder}" for inbound shipment "${InboundShipment}" is created
    And planned inbound order line "001" is created for order "${InboundOrder}" from shipment "${InboundShipment}"

    # Transport Equipment creation/check-in
    Given receiving transport equipment with carrier code "${carrier}" is created
    And receiving transport equipment "${transportEquip.trailerName}" is attached to the inbound shipment "${InboundShipment}"
    And receiving transport equipment "${transportEquip.trailerName}" is checked in without appointment to the available door

    # Web-UI "Unload all" function
    And receiving transport equipment "${transportEquip.trailerName}" is unloaded at the staging lane and dispatched

# Receiving
# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS) CS001
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                     |
      | MessageType  | 3ReturnMessageGoodsInStandard             |
      | Template     | ReturnMessage_CS001_Dec.xml               |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}      |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)} |
      | ReplaceValue | {{Replace_LoadUnitCode}}:${LoadUnitCode}  |
      | ReplaceValue | {{Replace_SSCC}}:${SSCC01}                |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}             |

# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS) D001
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                     |
      | MessageType  | 3ReturnMessageGoodsInStandard             |
      | Template     | ReturnMessage_D001_status0.xml            |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}      |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)} |
      | ReplaceValue | {{Replace_LoadUnitCode}}:${LoadUnitCode}  |
      | ReplaceValue | {{Replace_SSCC}}:${SSCC01}                  |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}             |

# Decanting
# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS) DEC114
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                     |
      | MessageType  | 3ReturnMessageGoodsInStandard             |
      | Template     | ReturnMessage_DEC114.xml                  |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}      |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)} |
      | ReplaceValue | {{Replace_LoadUnitCode}}:${LoadUnitCode}  |
      | ReplaceValue | {{Replace_Item}}:${Item01}                |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}             |

# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS) DEC107
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                      |
      | MessageType  | 3ReturnMessageGoodsInStandard              |
      | Template     | ReturnMessage_DEC10_2ea.xml                |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}       |
      | ReplaceValue | {{Replace_orderNum}}:${orderNumber01}      |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)}  |
      | ReplaceValue | {{Replace_LoadUnitCode}}:${LoadUnitCode01} |
      | ReplaceValue | {{Replace_Item}}:${Item01}                 |
      | ReplaceValue | {{Replace_decst}}:${dec_st}                |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}              |

# Putaway to OSR
# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS)
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                      |
      | MessageType  | 3ReturnMessageGoodsInStandard              |
      | Template     | ReturnMessage_OSR1_mov_2ea.xml             |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)}  |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}       |
      | ReplaceValue | {{Replace_orderNum}}:${orderNumber01}      |
      | ReplaceValue | {{Replace_LoadUnitCode}}:${LoadUnitCode01} |
      | ReplaceValue | {{Replace_Item}}:${Item01}                 |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}              |

# 3ReturnMessageGoodsInStandard message integration (WMS <- WCS) OSR1
    When the user sends incoming MConductor message successfully with the following data
      | Connector    | KNAPP                                     |
      | MessageType  | 3ReturnMessageGoodsInStandard             |
      | Template     | ReturnMessage_OSR1-inv_2ea.xml            |
      | ReplaceValue | {{Replace_randomInt}}:${generateIntID(5)} |
      | ReplaceValue | {{Replace_order}}:${InboundShipment}      |
      | ReplaceValue | {{Replace_Item}}:${Item01}                |
      | ReplaceValue | {{Replace_sn}}:${SSCC.serial}             |