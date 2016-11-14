--[[
Author : Kunchala Amil
Email : anilkunchalaece@gmail.com
Date : Nov 14 2016
]]

dofile("readSensorData.lua") --run this file to read the sensor values

--data = 'device_id='..node.chipid()..'&data_time='.. 40 .. '&soil_moisture='.. moistureValue ..'&temperature='.. tempValue ..'&humidity='.. humiValue ..'&luminance='..ldrValue
pData = '&mois='.. moistureValue ..'&temp='.. tempValue ..'&humi='.. humiValue ..'&ldr='..ldrValue --for padma1ver2.16mb.com
print(pData)

http.request("http://pamda1ver2.16mb.com/sensorData.php", "POST", "Content-Type: application/x-www-form-urlencoded\r\n",pData,
--http.request("http://ic.ksrmced.in/addData.php", "POST", "Content-Type: application/x-www-form-urlencoded\r\n",data,
  function(code, rData)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, rData)
    end
  end)
