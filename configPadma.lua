--[[
Author : Kunchala Anil
Date : 30/9/2016
Email : anilkunchalaece@gmail.com

Padma Ver 2 Configuration File
This is the Configuratin file which sets all the Defalut Configutation details from Manifacturer

-------INITIAL CONFIGURATION------
--DEVICE PARAMETERS--
Device ID     -  D_ID -0
Version       -  D_VER - 2.0
Longitude     -  D_LON - 0.0
Latitude      -  D_LAT - 0.0
Date-Time     - D_CDT - 300920162009 || DDMMYYYYHHMM
Session Id    - D_SID - 0
Up time       - D_SUP - 0

--SENSOR PARAMETERS--
Acquisition Interval  - S_ATI (in Min) - 10 
Temp Sensor           - S_TMP - 0DT
Humi Sensor           - S_HUM - 0DH
Soil Mois Sensor      - S_SMS - 0DS
Light Intensity Sensor - S_LUM - ODL

--WIFI PARAMETERS--
ssid       - D_SSD -KSRMINNOVATION
password   - D_PWD -DG-HR3420
max_trails - D_MXT

]]

--tabel holding all the config Data
config = {
          --Device Parameters
          D_ID = "0";
          D_VER = "2.0";
          D_LON = "0.0";
          D_LAT = "0.0";
          D_CDT = "300920162009";
          D_SID = "0";
          D_SUP = "0";
          
          --Sensor Parameters
          S_ATI = "10";
          S_TMP = "0DT";
          S_HUM = "0DH";
          S_SMS = "0DS";
          S_LUM = "0DL";
          
          --wifi Parameters
          D_SSD = "KSRMINNOVATION";
          D_PWD = "DG-HR3420";
          D_MXT = "10"
        }

ok, jsonConfig = pcall(cjson.encode, config)

if ok then
  print("json String of Data is :")
  print(jsonConfig)
  
  file.open('config.json','w+')
  file.write(jsonConfig)
  file.flush()
  file.close()
  
else
  print("failed to encode!")
end
--[[
--To read the file and Print its Contents
file.open('config.json','r')
out = file.readline()
file.close()
print('The string written to the File is')
print(out)

print('type  is')
print(type(out))
]]
