
--Author : Kunchala Anil
--Email : anilkunchalaece@gmail.com
-- After Saving this file in NodeMcu using Esplorer run the file using dofile('dthSample.lua')
-- https://nodemcu.readthedocs.io/en/master/en/modules/dht/
--http://www.barissanli.com/electronics/nodemcu.php

--pins used for sensors 
ldrEnable = 0
moistureSensorEnable = 1
dthPin = 2

--pin Used for relay
relayPin = 3 

--ssid and password
ssid = "KSRMINNOVATION"
pswd = "DG-HR3420"

function connectToWifi(_ssid,_pswd)
	
	wifi.sta.config(_ssid,_pswd)
	wifi.sta.connect()
	status = wifi.sta.status()
	
	if status == 0 then 
		print("STA_IDLE")
		
	elseif status == 1 then
		print("STA_CONNECTING")
	elseif status == 2 then
		print("STA_WRONG PASSWORD")
	elseif status == 3 then
		print("STA_AP NOT FOUND")
	elseif status == 4 then
		print("STA_FAIL")
	elseif status == 5 then
		print("STA_GOTIP")
		print(wifi.sta.getip())
		wifi.sta.autoconnect(1) -- we need to disable auto connect Idont why.. But it is not working without it
		return true
	end --end elseif Statements
return false
end -- end the connectToWifi() Function
	
if not wifi.sta.getip() then
	print("Setting Wifi into Station Mode")
	wifi.setmode(wifi.STATION)
while(not connectToWifi(ssid,pswd)) do
	print("Trying to connect to Local Wifi")
	end
	
end 


--read the Moisture Sensor Value
--First send the supply to the Sensor Via GPIO output
gpio.mode(moistureSensorEnable,gpio.OUTPUT)
gpio.write(moistureSensorEnable,gpio.HIGH)
print("Moisture Value: "..adc.read(0))
gpio.write(moistureSensorEnable,gpio.LOW)

--read the Atmosphere Humidy and Temp
status, temp, humi, temp_dec, humi_dec = dht.read(dthPin)
if status == dht.OK then
    -- Float firmware using this example
    print("DHT Temperature:"..temp..";".."Humidity:"..humi)

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT timed out." )
end

--read the LDR value
--First send the supply to the Sensor Via GPIO output
gpio.mode(ldrEnable,gpio.OUTPUT)
gpio.write(ldrEnable,gpio.HIGH)
print("ldr Reading: "..adc.read(0))
gpio.write(ldrEnable,gpio.LOW)

--disconnect the Wifi
--wifi.sta.disconnect()
