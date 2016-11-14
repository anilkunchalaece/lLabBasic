--[[
Author : Kunchala Anil
Email : anilkunchalaece
Date : 14 Nov 2016

To generate the lua compile files
]]

print("\n")
print("ESP8266 Started")
local luaFile = {"deviceConfig.lua","readSensorData.lua","wifiConnectivity.lua","mqttControl.lua","postData.lua"}
for i, f in ipairs(luaFile) do
       if file.open(f) then
           file.close()
           print("Compile File:"..f)
           node.compile(f)
           print("Remove File:"..f)
           file.remove(f)
         end
 end
luaFile = nil
collectgarbage()
