--init mqtt client with keepalive timer 0 - means not stop
m = mqtt.Client("anil1",0,Q_ID,Q_KEY)
m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

-- on publish message receive event
m:on("message", function(client, topic, data) 
  			print(topic .. ":" ) 
  				if data ~= nil then
    					print(data)
					
    					if data == "M_PON" then 
    					--switch in the relay	
					gpio.write(P_RLY,gpio.LOW)
					--publish the message back to mqtt broker
					m:publish(Q_PSTATUS,"M_PON",0,0,function print("published the M_PON message") end )
						
    					elseif data == "M_POFF" then
						--switch off the Relay
    						gpio.write(P_RLY,gpio.HIGH)
                                        	--publish the message back to the broker
						m:publish(Q_PSTATUS,"M_POFF",0,0,function print("published the M_PON message") end )

    					elseif data == "RPSTATUS" then
						local pStatus = gpio.read(p_RLY)
						if pStatus == 0 then
							pStatus == M_PON
						elseif pStatus == 1 then
							pStatus == M-POFF
						end
					
    						print("sent the Status"..pStatus)
    					elseif data == "RALL" then
						dofile("readSensorData.lua")
						
					end
 				 end
end)


-- for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect(Q_HST,Q_PRT, Q_ARC, function(client) 
					print("connected")
					--once connected subscribe to topic
					-- subscribe topic with qos = 0
					m:subscribe(Q_FED,Q_QOS, function(client) print("subscribe success") end)
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


