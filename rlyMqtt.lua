do
-- init mqtt client with keepalive timer 120sec
m = mqtt.Client("anil", 30*60, "anilkunchalaece", "APIKEY")

m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

-- on publish message receive event
m:on("message", function(client, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
  end
end)

-- for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect("io.adafruit.com", 1883, 0, function(client) print("connected") end, 
                                     function(client, reason) print("failed reason: "..reason) end)

-- Calling subscribe/publish only makes sense once the connection
-- was successfully established. In a real-world application you want
-- move those into the 'connect' callback or make otherwise sure the 
-- connection was established.

-- subscribe topic with qos = 0
m:subscribe("anilkunchalaece/feeds/rly",0, function(client) print("subscribe success") end)
-- publish a message with data = hello, QoS = 0, retain = 0
--m:publish("/topic","hello",0,0, function(client) print("sent") end)

--m:close();
end
