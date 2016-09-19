
--Example from NodeMcu Docs
-- After Saving this file in NodeMcu using Esplorer run the file using dofile('dthSample.lua')
-- https://nodemcu.readthedocs.io/en/master/en/modules/dht/
--http://www.barissanli.com/electronics/nodemcu.php

--pins used for sensors 
ldrEnable = 0
moistureSensorEnable = 1
dthPin = 2

--pin Used for relay
relayPin = 3 

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
