import os
import csv
import json
import platform
import requests
import profile
import requests.packages.urllib3
requests.packages.urllib3.disable_warnings()
import sys
import time
from datetime import datetime
import base64
""" REV history: Adding chhnges for QCTENGBI - 20439: KPI NAmes as INPUTS"""
""" Ver History Harshitha Muddasani QCTENGBI-20369 10/10/2016: Adding Receiver Type(multiple inputs) field"""
""" Ver History Shashidharbabu D QCTENGBI-24123 13/02/2017:Adding New Column GOLDEN_FLAG """
""" Ver History Shashidharbabu D QCTENGBI-25814 10/05/2017:Adding New flow CONN_LA & ACQPDCCH """
""" Ver History Shashidharbabu D QCTENGBI-30928 06/12/2017:Adding New columns to CONN_LA"""
class Composite_data(object):
    
    def __init__(self,*args):
        self.count = 0# Count for writing headers to CSV
        KPI_inputs={}#Dict to replace QV input names with composite names
        self.compInput=[]
            
    def main(self,*args):
        __doc__ = """ this main method connects to webs service and reads JSON data"""
        self.scriptPath = os.path.realpath("")
        print "scriptPath", self.scriptPath
        global PROFILE_TYPE 
        PROFILE_TYPE = raw_input("Enter PROFILE_TYPE Values (mandatory):")
        if PROFILE_TYPE =='CONN_LA':
            appendstring="""'<getLteConnLa:XML xmlns:getLteConnLa="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnLa"><b>'"""
            endstring="'</b></getLteConnLa:XML>'"
            b_tag_append_string="<b>"
            b_tag_end_string="</b>"
            snrappendstring="""'<getLteConnLa:XML xmlns:getLteConnLa="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnLa">"""
            snrendstring="""</getLteConnLa:XML>'"""
            integerappendstring="""'<getLteConnLa:XML xmlns:getLteConnLa="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnLa"><b>"""
            integerendstring="""
            </b></getLteConnLa:XML>'"""
            NULL_string = """'<getLteConnLa:XML xmlns:getLteConnLa="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnLa"></getLteConnLa:XML>'"""
        elif PROFILE_TYPE =='CONN_FS':
            appendstring="""'<getLteConnFS:XML xmlns:getLteConnFS="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnFS"><b>'"""
            endstring="'</b></getLteConnFS:XML>'"
            b_tag_append_string="<b>"
            b_tag_end_string="</b>"
            snrappendstring="""'<getLteConnFS:XML xmlns:getLteConnFS="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnFS">"""
            snrendstring="""</getLteConnFS:XML>'"""
            integerappendstring="""'<getLteConnFS:XML xmlns:getLteConnFS="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnFS"><b>"""
            integerendstring="""
            </b></getLteConnFS:XML>'"""
            NULL_string = """'<getLteConnFS:XML xmlns:getLteConnFS="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnFS"></getLteConnFS:XML>'"""
        else:
            appendstring="""'<getLteConnACQPDCCH:XML xmlns:getLteConnACQPDCCH="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnACQPDCCH"><b>'"""
            endstring="'</b></getLteConnACQPDCCH:XML>'"
            b_tag_append_string="<b>"
            b_tag_end_string="</b>"
            snrappendstring="""'<getLteConnACQPDCCH:XML xmlns:getLteConnACQPDCCH="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnACQPDCCH">"""
            snrendstring="""</getLteConnACQPDCCH:XML>'"""
            integerappendstring="""'<getLteConnACQPDCCH:XML xmlns:getLteConnACQPDCCH="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnACQPDCCH"><b>"""
            integerendstring="""
            </b></getLteConnACQPDCCH:XML>'"""
            NULL_string = """'<getLteConnACQPDCCH:XML xmlns:getLteConnACQPDCCH="/shared/BusinessUnits/QCT/Solutions/MODEM_PERF/Model/Procedures/getLteConnACQPDCCH"></getLteConnACQPDCCH:XML>'"""
        
        
        KPI_CSV = raw_input("Enter KPI Values (mandatory):")
        SNR_CSV = raw_input("Enter SNR Values:")
        #GOLDEN_FLAG = raw_input("Enter Golden Flag:")#Removing GOldern FLag as input
        FEATURE = raw_input("Enter Feature:")
        SERIAL_NUMBER = raw_input("Enter Serial Number:")
        TC_ID = raw_input("Enter TC ID:")
        PLATFORM = raw_input("Enter Platform:")
        SW_VERSION = raw_input("Enter SW Version:")
        MODEM_CHIPSET = raw_input("Enter Modem Chipset:")
        RF_CHIPSET = raw_input("Enter RF Chipset:")
        CARRIER_TYPE = raw_input("Enter Carrier Type:")
        TE_VERSION = raw_input("Enter TE Version:")
        BAND = raw_input("Enter Band:")
        MODEM_PL= raw_input("Enter Modem PL:")
        CH_BW= raw_input("Enter CH BW:")
        RECEIVER_TYPE = raw_input("Enter Receiver Type:")
        NTX = raw_input("Enter NTX:")
        NLAYER = raw_input("Enter NLAYER:")
        NRX = raw_input("Enter NRX:")
        MOD_SCHEME = raw_input("Enter MOD_SCHEME:")
        GOLDEN_FLAG = raw_input("Enter GOLDEN FLAG:")
        replaceQVDict={
        'MAC Level DL Norm TPUT (Mbps)': 'MAC_LEVEL_DL_NORM_TPUT_MBPS',
         'MAC Level DL Sched TPUT (Mbps)':'MAC_LEVEL_DL_SCHED_TPUT_MBPS',
         'MAC Level DL TPUT (Mbps)':'MAC_LEVEL_DL_TPUT_MBPS',
         'Mean CQI (Rank1)':'MEAN_CQI_RANK1',
         'Mean CQI (Rank2 Stream 0)':'MEAN_CQI_RANK2_STREAM_0',
         'Mean CQI (Rank2 Stream 1)':'MEAN_CQI_RANK2_STREAM_1',
         'Mean Rank':'MEAN_RANK',
         'First Tx PDSCH BLER (Rank1)':'FIRST_TX_PDSCH_BLER_RANK1',
         'First Tx PDSCH BLER (Rank2 Stream 0)':'FIRST_TX_PDSCH_BLER_RANK2_STREAM_0',
         'First Tx PDSCH BLER (Rank2 Stream 1)':'FIRST_TX_PDSCH_BLER_RANK2_STREAM_1',
         'Overall PDSCH BLER':'OVERALL_PDSCH_BLER',
         'Mean MCS (Rank1)':'MEAN_MCS_RANK1',
         'Mean MCS (Rank2 Stream 0)':'MEAN_MCS_RANK2_STREAM_0',
         'Mean MCS (Rank2 Stream 1)':'MEAN_MCS_RANK2_STREAM_1',
         'Mean CSI1_CQI (Rank1)':'MEAN_CSI1CQI_RANK1',
         'Mean CSI2_CQI (Rank1)':'MEAN_CSI2CQI_RANK1',
         'Mean CSI1_CQI (Rank2 Stream 0)':'MEAN_CSI1CQI_RANK2STRM0',
         'Mean CSI1_CQI (Rank2 Stream 1)':'MEAN_CSI1CQI_RANK2STRM1',
         'Mean CSI2_CQI (Rank2 Stream 0)':'MEAN_CSI2CQI_RANK2STRM0',
         'Mean CSI2_CQI (Rank2 Stream 1)':'MEAN_CSI2CQI_RANK2STRM1',
         'Mean CSI1_RANK':'MEAN_CSI1RANK',
         'Mean CSI2_RANK':'MEAN_CSI2RANK',
         'First Tx PDSCH BLER (Rank3 Stream 0)':'FIRST_TX_PDSCH_BLERR3S0',
         'First Tx PDSCH BLER (Rank3 Stream 1)':'FIRST_TX_PDSCH_BLERR3S1',
         'First Tx PDSCH BLER (Rank4 Stream 0)':'FIRST_TX_PDSCH_BLERR4S0',
         'First Tx PDSCH BLER (Rank4 Stream 1)':'FIRST_TX_PDSCH_BLERR4S1',
         'Mean CSI1_CQI (Rank3 Stream 0)':'MEAN_CQIR3S0',
         'Mean CSI1_CQI (Rank3 Stream 1)':'MEAN_CQIR3S1',
         'Mean CSI1_CQI (Rank4 Stream 0)':'MEAN_CQIR4S0',
         'Mean CSI1_CQI (Rank4 Stream 1)':  'MEAN_CQIR4S1',
         'Mean MCS (Rank3 Stream 0)':'MEAN_MCSR3S0',
         'Mean MCS (Rank3 Stream 1)':'MEAN_MCSR3S1',
         'Mean MCS (Rank4 Stream 0)':'MEAN_MCSR4S0',
         'Mean MCS (Rank4 Stream 1)':'MEAN_MCSR4S1',
         'MAC Level DL Peak TPUT (Mbps)':'MAC_LEVEL_DL_PEAK_TPUT_MBPS',
         'Probability of Detection':'PROBABILITY_OF_DETECTION',
         'False Alarm Rate':'FALSE_ALRM_RATE'
            }
        
        s = ""
        T_ID,F_ID,S_ID,P_ID,SW_ID,M_ID,TE_ID,B_ID,C_ID,M_ID,RF_ID,NTX,NL,NRX,M_SC,GF_ID="","","","","","","","","","","","","","","",""
        G_ID=""
        M_PL,C_BW="",""
        R_ID=""
        PROF_ID=""

               
        if SNR_CSV =='':
            SNR_CSV = NULL_string
        else:
            SNR_CSV_SPLIT = SNR_CSV.split(",")
            for row in SNR_CSV_SPLIT:
                s+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)


                SNR_CSV = snrappendstring+s+snrendstring
        KPI_inputs=KPI_CSV.strip().split(',')
        for input in KPI_inputs:
            input=input.strip()
            if input in replaceQVDict:
                input=replaceQVDict[input]
                self.compInput.append(input.strip())
            else:
                self.compInput=KPI_CSV
        if PROFILE_TYPE == 'CONN_LA':
            KPI_CSV=appendstring+'SNR,GOLDEN_FLAG,FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SW_VERSION,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,EXECUTION_DATE,CH_BW,MODEM_PL,RECEIVER_TYPE,NTX,NLAYER,NRX,MOD_SCHEME,DATE_CREATED,'+str(self.compInput).strip('[]').strip().replace("'","")+endstring
        elif PROFILE_TYPE == 'CONN_FS':
            KPI_CSV=appendstring+'SNR,GOLDEN_FLAG,FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SW_VERSION,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,EXECUTION_DATE,CH_BW,MODEM_PL,RECEIVER_TYPE,'+str(self.compInput).strip('[]').strip().replace("'","")+endstring
        else:
            KPI_CSV=appendstring+'SNR,GOLDEN_FLAG,FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SW_VERSION,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,EXECUTION_DATE,CH_BW,MODEM_PL,RECEIVER_TYPE,'+str(self.compInput).strip('[]').strip().replace("'","")+endstring
        
            
        if FEATURE =='':
            FEATURE = NULL_string
        else:
            #FEATURE = appendstring+FEATURE+endstring
            FEATURE_SPLIT=FEATURE.strip().split(',')
            for row in FEATURE_SPLIT:
                F_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                FEATURE=snrappendstring+F_ID+snrendstring
            #print "FEATURE", FEATURE
            
        if SERIAL_NUMBER =='':
            SERIAL_NUMBER = NULL_string
        else:
            SERIAL_NUMBER_SPLIT=SERIAL_NUMBER.strip().split(',')
            for row in SERIAL_NUMBER_SPLIT:
                S_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                SERIAL_NUMBER=snrappendstring+S_ID+snrendstring
            
            
        if TC_ID =='':
            TC_ID = NULL_string
        else:
            TC_ID_split=TC_ID.strip().split(",")
            for row in TC_ID_split:
                T_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                TC_ID = snrappendstring+T_ID+snrendstring
            
            
        if PLATFORM =='':
            PLATFORM = NULL_string
        else:
            PLATFORM_SPLIT=PLATFORM.strip().split(',')
            for row in PLATFORM_SPLIT:
                P_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                PLATFORM=snrappendstring+P_ID+snrendstring
                
                
        if SW_VERSION =='':
            SW_VERSION = NULL_string
        else:
            SW_VERSION_SPLIT=SW_VERSION.strip().split(',')
            for row in SW_VERSION_SPLIT:
                SW_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                SW_VERSION=snrappendstring+SW_ID+snrendstring
                
                
        if MODEM_CHIPSET =='':
            MODEM_CHIPSET = NULL_string
        else:
            MODEM_CHIPSET_SPLIT=MODEM_CHIPSET.strip().split(',')
            for row in MODEM_CHIPSET_SPLIT:
                M_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                MODEM_CHIPSET=snrappendstring+M_ID+snrendstring
                #print "MODEM_CHIPSET", MODEM_CHIPSET
                          #MODEM_CHIPSET=appendstring+MODEM_CHIPSET+endstring
        if RF_CHIPSET =='':
            RF_CHIPSET = NULL_string
        else:
            RF_CHIPSET_SPLIT=RF_CHIPSET.strip().split(',')
            for row in RF_CHIPSET_SPLIT:
                RF_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                RF_CHIPSET=snrappendstring+RF_ID+snrendstring
                #print "RF_CHIPSET", RF_CHIPSET
            #RF_CHIPSET=appendstring+RF_CHIPSET+endstring
                           
        if CARRIER_TYPE =='':
            CARRIER_TYPE = NULL_string
        else:
            CARRIER_TYPE_SPLIT=CARRIER_TYPE.strip().split(',')
            for row in CARRIER_TYPE_SPLIT:
                C_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                CARRIER_TYPE=snrappendstring+C_ID+snrendstring
                #print "  CARRIER_TYPE", CARRIER_TYPE                        
            #CARRIER_TYPE=appendstring+CARRIER_TYPE+endstring
                          
        if TE_VERSION =='':
            TE_VERSION = NULL_string
        else:
            TE_VERSION_SPLIT=TE_VERSION.strip().split(',')
            for row in TE_VERSION_SPLIT:
                TE_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                TE_VERSION=snrappendstring+TE_ID+snrendstring
                #print "TE_VERSION", TE_VERSION
            #TE_VERSION=appendstring+TE_VERSION+endstring
                
        if BAND =='':
            BAND = NULL_string
        else:
            BAND_SPLIT=BAND.strip().split(',')
            for row in BAND_SPLIT:
                B_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                BAND=snrappendstring+B_ID+snrendstring
                #print "BAND", BAND
            #BAND=appendstring+BAND+endstring

        if MODEM_PL =='':
            MODEM_PL = NULL_string
        else:
            MODEM_PL_SPLIT=MODEM_PL.strip().split(',')
            for row in MODEM_PL_SPLIT:
                M_PL+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                MODEM_PL=snrappendstring+M_PL+snrendstring
                

        if CH_BW =='':
            CH_BW = NULL_string
        else:
            CH_BW_SPLIT=CH_BW.strip().split(',')
            for row in CH_BW_SPLIT:
                C_BW+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                CH_BW=snrappendstring+C_BW+snrendstring

        # Adding RECEIVER_TYPE as input and output(multiple inputs field)
        if RECEIVER_TYPE =='':
            RECEIVER_TYPE = NULL_string
        else:
            RECEIVER_TYPE_SPLIT=RECEIVER_TYPE.strip().split(',')
            for row in RECEIVER_TYPE_SPLIT:
                R_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                RECEIVER_TYPE=snrappendstring+R_ID+snrendstring
        
        # Adding NTX as input and output(multiple inputs field)
        if NTX =='':
            NTX = NULL_string
        else:
            NTX_SPLIT=NTX.strip().split(',')
            for row in NTX_SPLIT:
                NTX+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                NTX=snrappendstring+NTX+snrendstring
        
        # Adding NLAYER as input and output(multiple inputs field)
        if NLAYER =='':
            NLAYER = NULL_string
        else:
            NLAYER_SPLIT=NLAYER.strip().split(',')
            for row in NLAYER_SPLIT:
                NL+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                NLAYER=snrappendstring+NL+snrendstring
                
        # Adding NRX as input and output(multiple inputs field)
        if NRX =='':
            NRX = NULL_string
        else:
            NRX_SPLIT=NRX.strip().split(',')
            for row in NRX_SPLIT:
                NRX+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                NRX=snrappendstring+NRX+snrendstring
                
        # Adding MOD_SCHEME as input and output(multiple inputs field)
        if MOD_SCHEME =='':
            MOD_SCHEME = NULL_string
        else:
            MOD_SCHEME_SPLIT=MOD_SCHEME.strip().split(',')
            for row in MOD_SCHEME_SPLIT:
                M_SC+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                MOD_SCHEME=snrappendstring+M_SC+snrendstring

        #Adding GOLDEN_FLAG as SINGLE INPUT FIELD
        if GOLDEN_FLAG =='':
            GOLDEN_FLAG = NULL_string
        else:
            #GOLDEN_FLAG = appendstring+GOLDEN_FLAG+endstring
            GOLDEN_FLAG_SPLIT=GOLDEN_FLAG.strip().split(',')
            for row in GOLDEN_FLAG_SPLIT:
                GF_ID+=str(b_tag_append_string+"""'"""+row.strip()+"""'"""+b_tag_end_string)
                GOLDEN_FLAG=snrappendstring+GF_ID+snrendstring
            #print "GOLDEN_FLAG", GOLDEN_FLAG

            #DATE_CREATED = appendstring+DATE_CREATED+endstring
        #DATE_CREATED = NULL_string
                
        if PROFILE_TYPE =='CONN_LA':
            json_url="https://cisdev.qualcomm.com:9402/json/BusinessUnits/QCT/Solutions/MODEM_PERF/ModemPerfWS/getLteConnLa?FEATURE=%s&SERIAL_NUMBER=%s&TC_ID=%s&PLATFORM=%s&SNR_CSV=%s&SW_VERSION=%s&KPI_CSV=%s&MODEM_CHIPSET=%s&RF_CHIPSET=%s&CARRIER_TYPE=%s&TE_VERSION=%s&BAND=%s&MODEM_PL=%s&CH_BW=%s&RECEIVER_TYPE=%s&NTX=%s&NLAYER=%s&NRX=%s&MOD_SCHEME=%s&GOLDEN_FLAG=%s" %(FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SNR_CSV,SW_VERSION,KPI_CSV,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,MODEM_PL,CH_BW,RECEIVER_TYPE,NTX,NLAYER,NRX,MOD_SCHEME,GOLDEN_FLAG)
        elif PROFILE_TYPE =='CONN_FS':
            json_url="https://cisdev.qualcomm.com:9402/json/BusinessUnits/QCT/Solutions/MODEM_PERF/ModemPerfWS/getLteConnFS?FEATURE=%s&SERIAL_NUMBER=%s&TC_ID=%s&PLATFORM=%s&SNR_CSV=%s&SW_VERSION=%s&KPI_CSV=%s&MODEM_CHIPSET=%s&RF_CHIPSET=%s&CARRIER_TYPE=%s&TE_VERSION=%s&BAND=%s&MODEM_PL=%s&CH_BW=%s&RECEIVER_TYPE=%s&GOLDEN_FLAG=%s" %(FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SNR_CSV,SW_VERSION,KPI_CSV,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,MODEM_PL,CH_BW,RECEIVER_TYPE,GOLDEN_FLAG)
        else:
            json_url="https://cisdev.qualcomm.com:9402/json/BusinessUnits/QCT/Solutions/MODEM_PERF/ModemPerfWS/getLteConnACQPDCCH?FEATURE=%s&SERIAL_NUMBER=%s&TC_ID=%s&PLATFORM=%s&SNR_CSV=%s&SW_VERSION=%s&KPI_CSV=%s&MODEM_CHIPSET=%s&RF_CHIPSET=%s&CARRIER_TYPE=%s&TE_VERSION=%s&BAND=%s&MODEM_PL=%s&CH_BW=%s&RECEIVER_TYPE=%s&GOLDEN_FLAG=%s" %(FEATURE,SERIAL_NUMBER,TC_ID,PLATFORM,SNR_CSV,SW_VERSION,KPI_CSV,MODEM_CHIPSET,RF_CHIPSET,CARRIER_TYPE,TE_VERSION,BAND,MODEM_PL,CH_BW,RECEIVER_TYPE,GOLDEN_FLAG)
        print json_url
        
        username="qlikview_cis@ldap"
        self.r = requests.get(json_url,auth=(username,base64.b64decode("QzFzNHByMGQ=")),verify=False)#Scraping data from JSON i
        #import pdb; pdb.set_trace()
        self.csvforjson()
    
        
    def csvforjson(self,*args):
        __doc__ = """ this csvforjson method writes JSON dataa from webservice to CSV file"""
        values = [] #Initializing list to store data
        header=[] #Initializing List to store headers
        err=[] #Intitializing Exception List
        replaceHeaderDict={
            "GOLDEN_FLAG":"Golden" ,
            "FEATURE":"Feature",
            "SERIAL_NUMBER":"Serial Number",
            "TC_ID":"Test Case ID",
            "PLATFORM":"Platform",
            "SW_VERSION":"Software Version",
            "MODEM_CHIPSET":"Modem Chipset",
            "RF_CHIPSET":"RF Chipset",
            "CARRIER_TYPE":"Carrier Type",
            "TE_VERSION":"TE Version",
            "BAND":"Band",
            "MAC_LEVEL_DL_TPUT_MBPS": "MAC Level DL TPUT (Mbps)",
            "MAC_LEVEL_DL_NORM_TPUT_MBPS":"MAC Level DL Norm TPUT (Mbps)",
            "MAC_LEVEL_DL_SCHED_TPUT_MBPS":"MAC Level DL Sched TPUT (Mbps)",
            "MEAN_RANK":"Mean Rank",
            "MEAN_CQI_RANK1":"Mean CQI (Rank1)",
            "MEAN_CQI_RANK2_STREAM_0":"Mean CQI (Rank2 Stream 0)",
            "MEAN_CQI_RANK2_STREAM_1":"Mean CQI (Rank2 Stream 1)",
            "FIRST_TX_PDSCH_BLER_RANK1":"First Tx PDSCH BLER (Rank1)",
            "FIRST_TX_PDSCH_BLER_RANK2_STREAM_0":"First Tx PDSCH BLER (Rank2 Stream 0)",
            "FIRST_TX_PDSCH_BLER_RANK2_STREAM_1":"First Tx PDSCH BLER (Rank2 Stream 1)",
            "OVERALL_PDSCH_BLER":"Overall PDSCH BLER",
            "MEAN_MCS_RANK1":"Mean MCS (Rank1)",
            "MEAN_MCS_RANK2_STREAM_0":"Mean MCS (Rank2 Stream 0)",
            "MEAN_MCS_RANK2_STREAM_1":"Mean MCS (Rank2 Stream 1)",
            "AVG_CURRENT":"Avg Current (mA)",
            "KB_MA":"Kbps/mA",
            "MEAN_CSI1CQI_RANK2STRM0":"Mean CSI1_CQI (Rank2 Stream 0)",
            "MEAN_CSI1CQI_RANK2STRM1":"Mean CSI1_CQI (Rank2 Stream 1)",
            "MEAN_CSI2CQI_RANK2STRM0":"Mean CSI2_CQI (Rank2 Stream 0)",
            "MEAN_CSI2CQI_RANK2STRM1":"Mean CSI2_CQI (Rank2 Stream 1)",
            "MEAN_CSI1CQI_RANK1":"Mean CSI1_CQI (Rank1)",
            "MEAN_CSI2CQI_RANK1":"Mean CSI2_CQI (Rank1)",
            "MEAN_CSI1RANK":"Mean CSI1_RANK",
            "MEAN_CSI2RANK":"Mean CSI2_RANK",
            #"MEAN_CQIR3S0": "Mean CQI (Rank3 Stream 0)",
            "MEAN_CQIR3S0":"Mean CSI1_CQI (Rank3 Stream 0)",
            "EXECUTION_DATE" : "Date",
            #"MEAN_CQIR3S1":"Mean CQI (Rank3 Stream 1)",
            "MEAN_CQIR3S1":"Mean CSI1_CQI (Rank3 Stream 1)",
            "MEAN_CQIR4S0":"Mean CSI1_CQI (Rank4 Stream 0)",
            "MEAN_CQIR4S1":"Mean CSI1_CQI (Rank4 Stream 1)",
            "FIRST_TX_PDSCH_BLERR3S0":"First Tx PDSCH BLER (Rank3 Stream 0)",
            "FIRST_TX_PDSCH_BLERR3S1":"First Tx PDSCH BLER (Rank3 Stream 1)",
            "MEAN_MCSR3S0": "Mean MCS (Rank3 Stream 0)",
            "MEAN_MCSR3S1":"Mean MCS (Rank3 Stream 1)",
            #"MEAN_CQIR4S0":"Mean CQI (Rank4 Stream 0)",
            #"MEAN_CQIR4S1":"Mean CQI (Rank4 Stream 1)",
            "FIRST_TX_PDSCH_BLERR4S0":"First Tx PDSCH BLER (Rank4 Stream 0)",
            "FIRST_TX_PDSCH_BLERR4S1":"First Tx PDSCH BLER (Rank4 Stream 1)",
            "MEAN_MCSR4S0": "Mean MCS (Rank4 Stream 0)",
            "MEAN_MCSR4S1":"Mean MCS (Rank4 Stream 1)",
            "MODEM_PL" : "ModemPL",
            "CH_BW": "Ch BW",
            "RECEIVER_TYPE":"Receiver Type",
            "NTX":"NTX",
            "NLAYER":"NLAYER",
            "NRX":"NRX",
            "MOD_SCHEME":"MOD_SCHEME",
            "DATE_CREATED":"CREATED_DATE",
            "MAC_LEVEL_DL_PEAK_TPUT_MBPS":"MAC Level DL Peak TPUT (Mbps)"
            }
        
        
        def fn(k):
            __doc__ = """ After SNR is parsed as first column,this method checks and returns keys that are not SNR."""
            if k != "SNR":
             return k
            else:
                pass
        #import pdb; pdb.set_trace()
        data_parsed = json.loads(self.r.content) # Reading JSON contents
        #import pdb; pdb.set_trace()
        filePath=self.scriptPath + "/" + "getLteConnLa_ModemPerf.csv"
        try:
          if PROFILE_TYPE =='CONN_LA':
              s=data_parsed['getLteConnLaResponse']['getLteConnLaOutput']['results']['result']# trimming tags to Access JSON keys and values after ['result']
          elif PROFILE_TYPE =='CONN_FS':
              s=data_parsed['getLteConnFSResponse']['getLteConnFSOutput']['results']['result']# trimming tags to Access JSON keys and values after ['result']
          else:
              s=data_parsed['getLteConnACQPDCCHResponse']['getLteConnACQPDCCHOutput']['results']['result']# trimming tags to Access JSON keys and values after ['result']
              
          if self.scriptPath:
              with open(filePath,'wb') as csvfile: # Open file for writing
                swriter=csv.writer(csvfile, delimiter=',')
                if type(s) is list:
                 for row in s:
                   header.append("SNR") #Writes "SNR" to header list
                   values.append(row['SNR']) #Writes SNR values to "values" list
                   for key,value in row.items():
                       z=fn(key)
                       if z:
                           if z!= "EXECUTION_DATE" :
                               values.append(row[z]) #Appends values for all other keys
                           elif z!= "DATE_CREATED":
                               values.append(row[z]) #Appends values for all other keys
                           else:
                              
                               #value= row[z].replace('T',' ')
                               values.append(row[z].replace('T',' '))
                           if z in replaceHeaderDict:
                               header.append(replaceHeaderDict[z]) #Replaces header with replaceHeaderDict
                           else:
                               header.append(z)
                            
                   if self.count == 0:
                       #header.append('CREATED_DATE')
                       swriter.writerow(header)
                   self.count= self.count+1
                   #timestamp11 = datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%M-%D %H:%M:%S')
                   #values.append(timestamp11)
                   swriter.writerow(values) #Writes values to CSV file
                   values =[]
                else: #type(s) is not list (i.e JSON  has only one record)
                    header.append("SNR")
                    values.append(s['SNR'])
                    for key,value in s.items():
                        z=fn(key)
                        if z:
                            if z != 'EXECUTION_DATE':
                                values.append(s[z])
                                #print "values", s[z]
                            elif z != 'DATE_CREATED':
                                values.append(s[z])
                            else:
                                values.append((s[z]).replace('T',' '))
                        
                            if z in replaceHeaderDict:
                                   header.append(replaceHeaderDict[z]) #Replaces header with replaceHeaderDict
                            else:
                                   header.append(z)
                    swriter.writerow(header)
                    swriter.writerow(values)
        except:
            with open(filePath,'wb') as csvfile: #Open file to write Exception when no data found for query
                swriter=csv.writer(csvfile, delimiter=',')
                err=["No Data for this query"]
                swriter.writerow(err)
        

                
if __name__ == "__main__":     
     sys.exit(Composite_data().main())
     
     
