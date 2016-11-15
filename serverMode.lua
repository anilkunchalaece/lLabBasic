--[[
Author : Kunchala Anil
Email : anilkunchalaece@gmail.com

This script is used to send the nodemcu to server mode to configure padma2
ip address for nodemcu is 192.168.4.1
]]
print("device is in server mode")

wifi.setmode(wifi.SOFTAP)

-- 30s time out for a inactive client
sv = net.createServer(net.TCP, 30)
-- server listens on 80, if data received, print data to console and send "hello world" back to caller
sv:listen(80, function(c)
  c:on("receive", function(c, pl) 
    print(pl)
  end)
  c:send("hello world")
end)