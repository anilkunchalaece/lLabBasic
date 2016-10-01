--[[
Author : Kunchala Anil,A.Mohan
Date : 30/9/2016
Email : anilkunchalaece@gmail.com

Padma Ver 2 Configuration File
This is the Configuratin file which sets all the Defalut Configutation details from Manifacturer
step1: if config.json exist read and initialize config data as table  devConfig
step2 : else initialize default data table devConfig
step 

-------INITIAL CONFIGURATION------
--DEVICE PARAMETERS--
Device ID     -  D_ID -0
Version       -  D_VER - 2.0
Longitude     -  D_LON - 0.0
Latitude      -  D_LAT - 0.0
Date-Time     - D_CDT - 300920162009 || DDMMYYYYHHMM
Session Id    - D_SID - 0
Up time       - D_SUP - 0

--SENSOR IDs/PARAMETERS--
Acquisition Interval  - S_ATI (in Min) - 10 
Temperature Sensor           - S_TMP - 0DT
Humidity Sensor           - S_HUM - 0DH
Soil Moisure Sensor      - S_SMS - 0DS
Light Intensity Sensor - S_LUM - ODL

--WIFI PARAMETERS--
ssid       - D_SSD - KSRMINNOVATION
password   - D_PWD - DG-HR3420
max_trails - D_MXT - 5

]]






--initialize the Pins
P_LDR = 0 -- LDR
P_SMS = 1 -- Soil Moisture Sensor
P_DTH = 2 -- for humidity and Temp
P_RLY = 3 -- To Control the Water supply Motor
P_SLED_R = 4 -- Status Led Red pin
P_SLED_G = 5 -- Status Led Green
P_SLED_B = 6 -- Status Led Blue

--Sensor Parameters as const
S_ATI = "10"
S_TMP = "0DT"
S_HUM = "0DH"
S_SMS = "0DS"
S_LUM = "0DL"

--led status code
E_NORMAL = "010" --Green
E_CONF = "100" -- Red
E_WIFI = "001" -- Blue
E_SENSOR = "101" -- Red + Blue
E_UPLOAD = "011" -- Green + Blue 
E_OFF = "000" -- OFF

--pin configuration
--DTH is not defined here since it uses one wire communication with DTH Library
--since both ldr and soil moisture sensor are analog sensors P_LDR and P_SMS are 
--used to read two analog sensors with single analog pin on NodeMCU
--[[ 
    the connection diagram for two analog sensors are
                                            D1
    d0 --> +5v Moisture Sensor Aout---> P diode N -->|
                                                     |-- A0 pin
    d1 --> +5v  LDR  Aout ------------> P diode N -->|
                                           D2
               
    D1 and D2 are used to Isolate the sensors while the other sensors reading is taken
    we can replce those with analog mux for next Ver
    
    The Program Flow is 
    send the 5v via output pin i.e apply power to the Sensor and Take the Reading and Remove the power for Sensor
    
  ]]
  

gpio.mode(P_LDR,gpio.OUTPUT)
gpio.mode(P_SMS,gpio.OUTPUT)
gpio.mode(P_RLY,gpio.OUTPUT)
gpio.mode(P_SLED_R,gpio.OUTPUT)
gpio.mode(P_SLED_G,gpio.OUTPUT)
gpio.mode(P_SLED_B,gpio.OUTPUT)

function setLedStatus(status)
gpio.write(P_SLED_R,tonumber(status:sub(1,1)))
gpio.write(P_SLED_G,tonumber(status:sub(2,2)))
gpio.write(P_SLED_B,tonumber(status:sub(3,3)))
      
end


function loadSourceConfigFile()
  
     
   jsonString = ''
 print("loading "..sourceFile.." File")--for Debug
file.open(sourceFile,'r')
  _line = file.readline()

  repeat
     jsonString = jsonString.._line
    _line = file.readline()
  until(not _line)
  
  file.close()
  
  --load the json data to the tabel
  devConfigTable = cjson.decode(jsonString)
   

 --Device Parameters
D_ID = node.chipid(); -- chip Id 

if not devConfigTable['D_VER'] then
  D_VER = devConfigTable['D_VER']
else
  D_VER = "NA"
end

if not devConfigTable['D_LON'] then
  D_LON = devConfigTable['D_LON']
  
else
  D_LON = "0"
end

if not devConfigTable['D_LAT'] then
  D_LAT = devConfigTable['D_LAT']
else
  D_LAT = "0"
end

if not devConfigTable['D_CDT'] then
  D_CDT = devConfigTable['D_CDT']
else
  D_CDT = "300920162009" --DDMMYYYYHHMM
end

if not devConfigTable['D_SID'] then
  D_SID = devConfigTable['D_SID']
else
  D_SID = "KSRMINNOVATION"
end

if not devConfigTable['D_PWD'] then
  D_PWD = devConfigTable['D_PWD']
else
  D_PWD = "DG-HR3420"
end

if not devConfigTable['D_MXT'] then
  D_MXT = devConfigTable['D_MXT']
else
  D_MXT = "5"
end

setLedStatus(E_NORMAL)
print('Configuration Suceesful')
end

setLedStatus(E_OFF)
sourceFile = nil
--To read the file and Print its Contents
if file.exists('currentConfig.json') then
     sourceFile = 'currentConfig.json'
  elseif file.exists('config.json') then
     sourceFile = 'config.json'
else 
setLedStatus(E_CONF)
end

if sourceFile then 
loadSourceConfigFile()
end -- for if sourceFile condition