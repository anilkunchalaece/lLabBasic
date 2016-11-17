
--[[
Author : Kunchala Anil
Email : anilkunchalaece
Date : 14 Nov 2016

Init file for nodemcu
]]


function gotoServerMode()
print("pushButton Pressed")
setLedStatus(E_SERVER) -- set LED status as AP Mode
tmr.delay(1000000*0.25)
print('delay added to remove Debouncing Effect')

dofile("serverMode.lua")
end

function() checkForServerConfig()
 gpio.trig(P_SPB, "high", gotoServerMode)
end


function addSchedulars()
  --check the wifi connectivity for every One Min
tmr.alarm(0, 1*60*1000, tmr.ALARM_AUTO, function()
                                            print("checking wifiConnectivity")
                                            dofile("wifiConnectivity.lua")
                                            end)

tmr.alarm(1,D_DPI*60*1000,tmr.ALARM_AUTO,function()
                                          print("sending the data to the Sever")
                                          dofile("postData.lua")
                                        end)
  end


function addFunctionality()
dofile("wifiConnectivity.lua")
dofile("postData.lua")
dofile("mqttControl.lua")
end

-----------------------------------------
-- Code execution Starts from here
---------------------------------------
--dofile("genCompiledFiles.lua")
dofile("deviceConfig.lua")
checkForServerConfig()
addFunctionality()
addSchedulars()
