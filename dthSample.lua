--Example from NodeMcu Docs
-- After Saving this file in NodeMcu using Esplorer run the file using dofile('dthSample.lua')
-- https://nodemcu.readthedocs.io/en/master/en/modules/dht/
--http://www.barissanli.com/electronics/nodemcu.php
pin = 5
status, temp, humi, temp_dec, humi_dec = dht.read(pin)
if status == dht.OK then
    -- Float firmware using this example
    print("DHT Temperature:"..temp..";".."Humidity:"..humi)
	--read the Moisture sensor Value
	print (adc.read(0))

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT timed out." )
end