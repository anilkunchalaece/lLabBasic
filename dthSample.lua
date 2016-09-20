
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
		wifi.sta.autoconnect(1)
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
moistureValue = adc.read(0)
print("Moisture Value: "..moistureValue)
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
ldrValue = adc.read(0)
print("ldr Reading: "..ldrValue)
gpio.write(ldrEnable,gpio.LOW)

data = 'mois='..moistureValue..'&temp='..temp..'&humi='..humi.."&ldr="..ldrValue
print(data)

http.request("http://pamda1ver2.16mb.com/sensorData.php", "POST", "Content-Type: application/x-www-form-urlencoded\r\n",data, 
  function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)

--disconnect the Wifi
--wifi.sta.disconnect()
