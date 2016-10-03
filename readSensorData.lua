--[[
Author : Kunchala Anil
Date : Oct 3 2016
Email : anilkunchalaece@gmail.com

This script is used to read the sensor data and send the same to the Webpage via Post Request
if the wifi not connected or post request unsuccesful it will save the same in local file
-- Pins initialization from deviceConfig.lua
P_LDR = 0 -- LDR
P_SMS = 1 -- Soil Moisture Sensor
P_DTH = 2 -- for humidity and Temp
P_RLY = 3 -- To Control the Water supply Motor
P_SLED_R = 4 -- Status Led Red pin
P_SLED_G = 5 -- Status Led Green
P_SLED_B = 6 -- Status Led Blue
]]

--read the Moisture Sensor Value
--First send the supply to the Sensor Via GPIO output
gpio.write(P_SMS,gpio.HIGH) --enable Moisture sensor
moistureValue = adc.read(0) -- read the moisture
print("Moisture Value: "..moistureValue) --for Debug
gpio.write(P_SMS,gpio.LOW) --disable the moisture sensor

status, tempValue, humiValue, temp_dec, humi_dec = dht.read(P_DTH)
if status == dht.OK then
    -- Float firmware using this example
    print("DHT Temperature:"..tempValue..";".."Humidity:"..humiValue)

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT timed out." )
end

--read the LDR value
--First send the supply to the Sensor Via GPIO output
gpio.write(P_LDR,gpio.HIGH)  --enable ldr
ldrValue = adc.read(0)
print("ldr Reading: "..ldrValue)
gpio.write(P_LDR,gpio.LOW)

