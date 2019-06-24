CREATE TABLE "HT_REGRESSION_QA"."MPP" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"PRO_USER_OID" NUMBER NOT NULL ENABLE, 
	"DISTRIBUTOR_OID" NUMBER NOT NULL ENABLE, 
	"START_DATE" DATE, 
	"EXPIRATION_DATE" DATE, 
	"EXTENSION_DATE" DATE, 
	"PO_NUMBER" VARCHAR2(80 CHAR), 
	"STATUS" VARCHAR2(20 CHAR), 
	"QUANTITY_OPEN" NUMBER NOT NULL ENABLE, 
	"QUANTITY_TOTAL" NUMBER NOT NULL ENABLE, 
	"DOLLARS_OPEN" NUMBER(38,6) NOT NULL ENABLE, 
	"DOLLARS_TOTAL" NUMBER(38,6) NOT NULL ENABLE, 
	"FIRST_PART_OID" NUMBER NOT NULL ENABLE, 
	"CAN_ROTATE" NUMBER NOT NULL ENABLE, 
	"PRICE_PROTECT_DISTI" NUMBER NOT NULL ENABLE, 
	"CAN_DEBIT" NUMBER NOT NULL ENABLE, 
	"CURRENCY_INFO_OID" NUMBER NOT NULL ENABLE, 
	"EXCHANGE_RATE" NUMBER(38,15) NOT NULL ENABLE, 
	"IS_HEDGED" NUMBER NOT NULL ENABLE, 
	"ORDER_ONLY_QTY" NUMBER NOT NULL ENABLE, 
	"USAGE_TOTAL" NUMBER NOT NULL ENABLE, 
	"START_DEFAULT" DATE, 
	"EXPIRATION_DEFAULT" DATE, 
	"ITEMS" NUMBER NOT NULL ENABLE, 
	"PRICE_MODIFIED_DATE" DATE, 
	"CUSTOM_FIELD1" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD2" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD3" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD4" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD5" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD6" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD7" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD8" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD9" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD10" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD11" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD12" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD13" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD14" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD15" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD16" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD17" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD18" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD19" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD20" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD21" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD22" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD23" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD24" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD25" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD26" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD27" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD28" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD29" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD30" VARCHAR2(1024 CHAR), 
	 CONSTRAINT "MPP_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."MPP_ITEM" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"MPP_OID" NUMBER NOT NULL ENABLE, 
	"ITEM_NUM" NUMBER NOT NULL ENABLE, 
	"PART_OID" NUMBER NOT NULL ENABLE, 
	"PRICE_REQUESTED" NUMBER(38,6) NOT NULL ENABLE, 
	"PRICE_APPROVED" NUMBER(38,6) NOT NULL ENABLE, 
	"NEW_PRICE_REQUESTED" NUMBER(38,6) NOT NULL ENABLE, 
	"QUANTITY_REQUESTED" NUMBER NOT NULL ENABLE, 
	"QUANTITY_APPROVED" NUMBER NOT NULL ENABLE, 
	"ADDITIONAL_QUANTITY" NUMBER NOT NULL ENABLE, 
	"QUANTITY_OPEN" NUMBER NOT NULL ENABLE, 
	"QUANTITY_SHIPPED" NUMBER NOT NULL ENABLE, 
	"COMMENTS" VARCHAR2(1024 CHAR), 
	"CURRENCY_INFO_OID" NUMBER NOT NULL ENABLE, 
	"EXCHANGE_RATE" NUMBER(38,15) NOT NULL ENABLE, 
	"ALERT_FLAG" NUMBER NOT NULL ENABLE, 
	"ORDER_ONLY_QTY" NUMBER NOT NULL ENABLE, 
	"CURRENT_USAGE" NUMBER NOT NULL ENABLE, 
	"START_DATE" DATE, 
	"EXPIRATION_DATE" DATE, 
	"STATUS" VARCHAR2(80 CHAR), 
	"SUB_ITEM_NUM" NUMBER NOT NULL ENABLE, 
	"PART_TYPE" NUMBER NOT NULL ENABLE, 
	"PARENT_KIT_OID" NUMBER NOT NULL ENABLE, 
	"KIT_COMPONENT_QTY" NUMBER NOT NULL ENABLE, 
	"PRICE_MODIFIED_DATE" DATE, 
	"CUSTOM_FIELD1" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD2" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD3" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD4" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD5" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD6" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD7" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD8" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD9" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD10" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD11" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD12" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD13" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD14" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD15" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD16" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD17" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD18" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD19" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD20" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD21" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD22" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD23" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD24" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD25" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD26" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD27" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD28" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD29" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD30" VARCHAR2(1024 CHAR), 
	 CONSTRAINT "MPP_ITEM_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."MPP_PF_ALERT" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"MPP_OID" NUMBER NOT NULL ENABLE, 
	"PRODUCT_FAMILY_OID" NUMBER NOT NULL ENABLE, 
	"ALERT_FLAG" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "MPP_PF_ALERT_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE, 
	 CONSTRAINT "MPP_PF_ALERT_UK1" UNIQUE ("MPP_OID", "PRODUCT_FAMILY_OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."MPP_TC" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"TEXT" VARCHAR2(1024 CHAR), 
	 CONSTRAINT "MPP_TC_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORDER_ITEM" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"PRO_ORDER_OID" NUMBER NOT NULL ENABLE, 
	"ITEM_NUM" NUMBER NOT NULL ENABLE, 
	"PART_OID" NUMBER NOT NULL ENABLE, 
	"QUANTITY" NUMBER NOT NULL ENABLE, 
	"UOM_OID" NUMBER NOT NULL ENABLE, 
	"PRICE" NUMBER(38,6), 
	"ADDERS_COST" NUMBER(38,6) NOT NULL ENABLE, 
	"PO_NUM" VARCHAR2(80 CHAR), 
	"MONTHS" NUMBER NOT NULL ENABLE, 
	"MONTHS_UNITS" VARCHAR2(80 CHAR), 
	"ORDER_STATUS" VARCHAR2(80 CHAR), 
	"COMMENTS" VARCHAR2(256 CHAR), 
	"ORDER_SCHEDULE_CHECKED" NUMBER NOT NULL ENABLE, 
	"MPP_OID" NUMBER NOT NULL ENABLE, 
	"CUST_PART_MAPPING_OID" NUMBER NOT NULL ENABLE, 
	"CREDIT_HOLD" NUMBER NOT NULL ENABLE, 
	"SHIP_TO_ADDRESS_OID" NUMBER NOT NULL ENABLE, 
	"PART_EXT" VARCHAR2(80 CHAR), 
	"LAST_ERP_DATE" DATE, 
	"CONTRACT_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"PRICE_PROTECT" NUMBER NOT NULL ENABLE, 
	"COMMISSION_RATE" NUMBER(38,6), 
	"DESIGN_PART_MAPPING_OID" NUMBER NOT NULL ENABLE, 
	"CURRENCY_INFO_OID" NUMBER NOT NULL ENABLE, 
	"EXCHANGE_RATE" NUMBER(38,15) NOT NULL ENABLE, 
	"SEGMENT_OID" NUMBER NOT NULL ENABLE, 
	"IS_SEGMENT_OVERRIDE" NUMBER NOT NULL ENABLE, 
	"ALERT_FLAG" NUMBER NOT NULL ENABLE, 
	"IS_STEP_CONTRACT" NUMBER NOT NULL ENABLE, 
	"QUANTITY_REQ" NUMBER NOT NULL ENABLE, 
	"QUANTITY_SHP" NUMBER NOT NULL ENABLE, 
	"END_CUSTOMER_OID" NUMBER NOT NULL ENABLE, 
	"PROGRAM_OID" NUMBER NOT NULL ENABLE, 
	"ASSEMBLY_OID" NUMBER NOT NULL ENABLE, 
	"QUOTE_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"OEM_PRICE_DEF_OID" NUMBER NOT NULL ENABLE, 
	"DBC_PRICE_DEF_OID" NUMBER NOT NULL ENABLE, 
	"MANUFACTURER_COST" NUMBER(38,6), 
	"IS_DEBITABLE" NUMBER, 
	"CAN_ROTATE" NUMBER, 
	"NCNR" NUMBER, 
	"IS_SCRAP" NUMBER, 
	"DEFERRED_REVENUE_FLAG" NUMBER, 
	"QUOTE_ITEM_PARENT_KIT_OID" NUMBER NOT NULL ENABLE, 
	"APPLY_BUCKET_RULE" NUMBER, 
	"BUNDLE_OID" NUMBER NOT NULL ENABLE, 
	"BUNDLE_QUANTITY" NUMBER, 
	"CUSTOM_FIELD1" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD2" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD3" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD4" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD5" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD6" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD7" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD8" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD9" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD10" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD11" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD12" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD13" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD14" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD15" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD16" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD17" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD18" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD19" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD20" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD21" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD22" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD23" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD24" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD25" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD26" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD27" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD28" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD29" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD30" VARCHAR2(1024 CHAR), 
	 CONSTRAINT "ORDER_ITEM_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORDER_ITEM_ADDER_MAPPING" 
   (	"ORDER_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"ADDER_OID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ORDER_ITEM_ADDER_MAPPING_UK1" UNIQUE ("ORDER_ITEM_OID", "ADDER_OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORDER_ITEM_SPLIT" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"ORDER_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"TYPE" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"SPLIT_PERCENT" NUMBER(38,6) NOT NULL ENABLE, 
	"ORG_OID" NUMBER NOT NULL ENABLE, 
	"REP_RATE_PERCENT" NUMBER(38,6), 
	 CONSTRAINT "ORDER_ITEM_SPLIT_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORDER_REBATE_DATA" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"ORDER_SCHEDULE_OID" NUMBER NOT NULL ENABLE, 
	"PRO_ORDER_OID" NUMBER NOT NULL ENABLE, 
	"DISTRIBUTOR_OID" NUMBER NOT NULL ENABLE, 
	"SHIP_DATE" DATE, 
	"CUSTOMER_OID" NUMBER NOT NULL ENABLE, 
	"END_CUSTOMER_OID" NUMBER NOT NULL ENABLE, 
	"PART_OID" NUMBER NOT NULL ENABLE, 
	"QUANTITY" NUMBER NOT NULL ENABLE, 
	"PRICE" NUMBER(38,6) NOT NULL ENABLE, 
	"IS_EXPORTED" NUMBER NOT NULL ENABLE, 
	"QUOTE_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"ORDER_TXN_GROUP_ID" NUMBER NOT NULL ENABLE, 
	"INVOICE_NUM" VARCHAR2(80 CHAR), 
	"STATUS" VARCHAR2(80 CHAR), 
	"ORDER_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"CUSTOM_FIELD1" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD2" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD3" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD4" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD5" VARCHAR2(1024 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORDER_SCHEDULE" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"ORDER_ITEM_OID" NUMBER NOT NULL ENABLE, 
	"QUANTITY" NUMBER NOT NULL ENABLE, 
	"SCHED_DATE" DATE, 
	"SCHEDULE_STATUS" NUMBER NOT NULL ENABLE, 
	"RELEASE_NUM" NUMBER NOT NULL ENABLE, 
	"SHIPMENT_METHOD_OID" NUMBER NOT NULL ENABLE, 
	"WAYBILL_NUM" VARCHAR2(80 CHAR), 
	"INVOICE_NUM" VARCHAR2(80 CHAR), 
	"SHIP_TO_ADDRESS_OID" NUMBER NOT NULL ENABLE, 
	"INVENTORY_COMMITTED_OID" NUMBER NOT NULL ENABLE, 
	"PRICE" NUMBER(38,6), 
	"LAST_ERP_DATE" DATE, 
	"SHIPMENT_NUM" NUMBER NOT NULL ENABLE, 
	"CURRENCY_INFO_OID" NUMBER NOT NULL ENABLE, 
	"EXCHANGE_RATE" NUMBER(38,15) NOT NULL ENABLE, 
	"PART_OID" NUMBER NOT NULL ENABLE, 
	"AVAILABLE_DATE" DATE, 
	"TAX_RATE" NUMBER(38,15), 
	"SHIP_FROM" VARCHAR2(80 CHAR), 
	"SHIP_TO" VARCHAR2(80 CHAR), 
	"CUSTOM_FIELD1" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD2" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD3" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD4" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD5" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD6" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD7" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD8" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD9" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD10" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD11" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD12" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD13" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD14" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD15" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD16" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD17" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD18" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD19" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD20" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD21" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD22" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD23" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD24" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD25" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD26" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD27" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD28" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD29" VARCHAR2(1024 CHAR), 
	"CUSTOM_FIELD30" VARCHAR2(1024 CHAR), 
	 CONSTRAINT "ORDER_SCHEDULE_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORG" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(80 CHAR), 
	"PARENT_ORG_OID" NUMBER NOT NULL ENABLE, 
	"DISTRIBUTOR_OID" NUMBER NOT NULL ENABLE, 
	"ORG_TYPE" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"IS_ORG_CUST_MAP" NUMBER NOT NULL ENABLE, 
	"IS_DISTI_COMPANY" NUMBER NOT NULL ENABLE, 
	"IS_DISTI_BRANCH" NUMBER NOT NULL ENABLE, 
	"CODE" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"STATUS" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"TERMINATION_START_DATE" DATE, 
	"ORG_LEVEL" NUMBER NOT NULL ENABLE, 
	"TERMINATION_END_DATE" DATE, 
	"SFDC_ID" VARCHAR2(80 CHAR), 
	 CONSTRAINT "ORG_UK2" UNIQUE ("SFDC_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE, 
	 CONSTRAINT "ORG_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE, 
	 CONSTRAINT "ORG_UK1" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORG_CUST_MAPPING" 
   (	"ORG_OID" NUMBER NOT NULL ENABLE, 
	"CUSTOMER_OID" NUMBER NOT NULL ENABLE, 
	"IS_PRIMARY" NUMBER NOT NULL ENABLE, 
	"IS_REP_TERMINATED" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ORG_CUST_MAPPING_UK1" UNIQUE ("ORG_OID", "CUSTOMER_OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORG_PF_MAPPING" 
   (	"ORG_OID" NUMBER NOT NULL ENABLE, 
	"PRODUCT_FAMILY_OID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ORG_PF_MAPPING_UK1" UNIQUE ("ORG_OID", "PRODUCT_FAMILY_OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";

CREATE TABLE "HT_REGRESSION_QA"."ORG_ZIP_MAPPING" 
   (	"ORG_OID" NUMBER NOT NULL ENABLE, 
	"ZIP" VARCHAR2(80 CHAR), 
	"COUNTRY" VARCHAR2(80 CHAR), 
	"STATE" VARCHAR2(80 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";