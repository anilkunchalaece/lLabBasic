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
--Pin 3 not yet Used
P_SLED_R = 4 -- Status Led Red pin
P_SLED_G = 5 -- Status Led Green
P_SLED_B = 6 -- Status Led Blue
P_RLY = 7  -- To Control the Water supply Motor
P_SPB = 8 -- To Change into STATION to AP Mode

--Sensor Parameters as const
S_ATI = "10"
S_TMP = "0DT"
S_HUM = "0DH"
S_SMS = "0DS"
S_LUM = "0DL"

--led status code
E_NORMAL = "010" --Green --Everything OK
E_CONF = "100" -- Red -- configuration Error
E_WIFI = "001" -- Blue -- Wifi Error
E_SENSOR = "101" -- Red + Blue -- Error in reading sensor Data
E_UPLOAD = "011" -- Green + Blue  -- Error in Upload
E_SERVER = "111" -- White Device in Server mode
E_OFF = "000" -- OFF

--MQTT commands received from web
M_TEMP = "RTEMP" -- Read temp used to get instantaneous temp value
M_HUM = "RHUM" -- read instantaneous humidity
M_SMS = "RSMS" -- read instantaneous soil moisture sensor
M_LUM = "RLUM" -- read instantaneous Ldr value
M_ALL = "RALL" -- read all sensor values
M_PON = "CPON" -- power on relay
M_POFF = "CPOFF" -- power off relay
M_PSTATUS = "RPSTATUS" -- read the relay status

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
gpio.mode(P_SPB,gpio.INT)

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


if not devConfigTable['Q_HST'] then
  Q_HST = devConfigTable['Q_HST']
else
  Q_HST = "io.adafruit.com"
end

if not devConfigTable['Q_KEY'] then
  Q_KEY = devConfigTable['Q_KEY']
else
  Q_KEY = "e996656b9fe54f9fa298816e1fb9398f"
end

if not devConfigTable['Q_ID'] then
  Q_ID = devConfigTable['Q_ID']
else
  Q_ID = "anilkunchalaece"
end

if not devConfigTable['Q_PRT'] then
  Q_PRT = devConfigTable['Q_PRT']
else
  Q_PRT = "1883"
end

if not devConfigTable['Q_ARC'] then
  Q_ARC = devConfigTable['Q_ARC']
else
  Q_ARC = 0
end

if not devConfigTable['Q_PFD'] then
  Q_PFD = devConfigTable['Q_PFD']
else
  Q_PFD = "anilkunchalaece/feeds/data"
end

if not devConfigTable['Q_SFD'] then
  Q_SFD = devConfigTable['Q_SFD']
else
  Q_SFD = 'anilkunchalaece/feeds/command'
end

if not devConfigTable['Q_QOS'] then
  Q_QOS = devConfigTable['Q_QOS']
else
  Q_QOS = 1
end

if not devConfigTable['P_INT'] then
  P_INT = devConfigTable['P_INT']
else
  P_INT = 10 --Default interval to post sensorData in Min
end

setLedStatus(E_NORMAL)
print('Configuration Suceesful')

end --end of sourceConfigFile() function


------------------------------------------
--Code execution starts from Here
-----------------------------------------
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
