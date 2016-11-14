--[[
Author : Kunchala Anil
Email : anilkunchalaece
Date : 14 Nov 2016

Init file for nodemcu
]]

--dofile("genCompiledFiles.lua")
dofile("deviceConfig.lua")
dofile("wifiConnectivity.lua")
dofile("postData.lua")
dofile("mqttControl.lua")

--check the wifi connectivity for every One Min
tmr.alarm(0, 1*60*1000, tmr.ALARM_AUTO, function()
                                            print("checking wifiConnectivity")
                                            dofile("wifiConnectivity.lua")
                                            end)

tmr.alarm(1,P_INT*60*1000,tmr.ALARM_AUTO,function()
                                          print("sending the data to the Sever")
                                          dofile("postData.lua")
                                        end)
