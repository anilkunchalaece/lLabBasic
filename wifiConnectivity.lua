--[[
Author : Kunchala Anil
Date : oct 3 2016
Email : anilkunchalaece@gmail.com

this is is used to Check the wifi connectivity if it will try for D_MXT trails

--WIFI PARAMETERS from deviceConfig file
D_SSD , D_PWD , D_MXT
]]

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
    setLedStatus(E_OFF)
		wifi.sta.autoconnect(1)
		return true
	end --end elseif Statements
return false
end -- end the connectToWifi() Function

----------------------------------------------------
--Code Starts from here
----------------------------------------------------
if not wifi.sta.getip() then
  print("Setting Wifi into Station Mode") --debug
	wifi.setmode(wifi.STATION)
while(not connectToWifi(D_SSD,D_PWD)) do
	print("Trying to connect to Local Wifi") --debug
  D_MXT = D_MXT -1
  if D_MXT ==0 then
    setLedStatus(E_WIFI)
    break
    end
	end
else
  setLedStatus(E_OFF)
	print("connected to wifi with Ip"..wifi.sta.getip())
end
