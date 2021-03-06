CREATE TABLE "HT_REGRESSION_QA"."BASE_PRICE" 
   (	"OID" NUMBER NOT NULL ENABLE, 
	"CREATED_DATE" DATE NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"MODIFIED_DATE" DATE, 
	"GUI_MODIFIED_DATE" DATE, 
	"MODIFIED_BY" VARCHAR2(80 CHAR), 
	"OBSOLETE_FLAG" NUMBER NOT NULL ENABLE, 
	"PART_OID" NUMBER NOT NULL ENABLE, 
	"PRICE" NUMBER(38,6), 
	"EFFECTIVE_DATE" DATE, 
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
	 CONSTRAINT "BASE_PRICE_PK" PRIMARY KEY ("OID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE, 
	 CONSTRAINT "BASE_PRICE_UK1" UNIQUE ("PART_OID", "EFFECTIVE_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MN_DATA1";
