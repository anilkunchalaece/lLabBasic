
data = 'device_id='..node.chipid()..'&data_time='.. 40 .. '&soil_moisture='.. moistureValue ..'&temperature='.. tempValue ..'&humidity='.. humiValue ..'&luminance='..ldrValue
print(data)

--http.request("http://pamda1ver2.16mb.com/sensorData.php", "POST", "Content-Type: application/x-www-form-urlencoded\r\n",data, 
http.request("http://ic.ksrmced.in/addData.php", "POST", "Content-Type: application/x-www-form-urlencoded\r\n",data, 
  function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)
  
