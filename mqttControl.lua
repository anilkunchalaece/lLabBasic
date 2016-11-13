--init mqtt client with keepalive timer 0 - means not stop
m = mqtt.Client("anil1",0,Q_ID,Q_KEY)
m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

pMessage = '{"deviceid": "761467","data": {  ' --string to publish the data to the cloud

-- on publish message receive event
m:on("message", function(client, topic, data) 
  			print(topic .. ":" ) 
  				if data ~= nil then
    					print(data)

					data = cjson.decode(data) --decode the json string
										
					if not data["deviceId"] then
						print(data["deviceId"])
					end --end of deviceId if
					
					if not data["command"] then
						cmd = command
						print("Recvd Cmd is"..cmd)
					end --end of command if
					
					if cmd == M_TEMP or cmd == M_HUM or cmd == M_SMS or cmd == M_LUM or cmd == M_ALL then
						dofile("readSensorData.lua") -- run the file to get the Data
						
						if cmd == M_TEMP then
							pMessage = pMessage..'"RTEMP":'..tempValue
						if cmd == M_HUM then
							pMessage = pMessage..'"RHUM":'..humiValue
						elseif cmd == M_SMS then
							pMessage = pMessage..'"RSMS":'..moistureValue
						elseif cmd == M_LUM then
							pMessage = pMessage..'"RLUM":'..ldrValue
						elseif cmd =="RALL" then
							pMessage = pMessage..'"RTEMP":'..tempValue..','..'"RTEMP":'..tempValue..','..'"RSMS":'..moistureValue..','..'"RLUM":'..ldrValue..','..'"RHUM":'..humiValue
						end
					elseif cmd == M_PON or cmd == M_POFF or cmd == M_PSTATUS then
						if cmd == M_PON then
							gpio.write(P_RLY,gpio.LOW)--switch on the relay
							pMessage = pMessage..','..'"RPSTATUS":"ON"'..'}}'
						elseif cmd == M_POFF then
							gpio.write(P_RLY,gpio.HIGH)
							pMessage = pMessage..'.'..'"RPSTATUS":"OFF"'..'}}'
						elseif cmd == M_PSTAYUS then
							rState = gpio.read(P_RLY)
							if rState == 0 then
								 pMessage = pMessage..','..'"RPSTATUS":"ON"'..'}}'
							elseif rState == 1 then
								 pMessage = pMessage..'.'..'"RPSTATUS":"OFF"'..'}}'
							end
						end
					end
			       end
		end)


-- for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect(Q_HST,Q_PRT, Q_ARC, function(client) 
					print("connected")
					--once connected subscribe to topic
					-- subscribe topic <Q_SFD> with qos = 0
					m:subscribe(Q_SFD,Q_QOS, function(client) print("subscribe success") end)
 					end, 
 
                             function(client, reason) 
					print("failed reason: "..reason) 
					end)

-- Calling subscribe/publish only makes sense once the connection
-- was successfully established. In a real-world application you want
-- move those into the 'connect' callback or make otherwise sure the 
-- connection was established.

-- subscribe topic with qos = 0
--m:subscribe(Q_FED,Q_QOS, function(client) print("subscribe success") end)

-- publish a message with data = hello, QoS = 0, retain = 0
--m:publish("/topic","hello",0,0, function(client) print("sent") end)

--m:close();


