
--function used for pcall to decode the received string
function decodeReceivedData()
  -- adafruit IO doesn't accepting Json string. so the received and published data doesnt have starting and closing brackets
  --to decode the received data we need to add those curly brackets at starting and ending of the code
  data = '{'..data..'}'
  data = cjson.decode(data) --decode the json string
end

--function to process the receivedcommand.
function processCmdAndPublish()
  if data["deviceid"] then
    print(data["deviceid"])
    end --end of deviceId if

    if data["command"] then
      cmd = data["command"]
      print("Recvd Cmd is"..cmd)
      end --end of command if

      if cmd == M_TEMP or cmd == M_HUM or cmd == M_SMS or cmd == M_LUM or cmd == M_ALL then
        dofile("readSensorData.lua") -- run the file to get the Data

        if cmd == M_TEMP then
          pMessage = pMessage..'"'..M_TEMP..'":'..tempValue..'}'
          print(pMessage)
        elseif cmd == M_HUM then
          pMessage = pMessage..'"'..M_HUM..'":'..humiValue..'}'
        elseif cmd == M_SMS then
          pMessage = pMessage..'"'..M_SMS..'":'..moistureValue'}'
        elseif cmd == M_LUM then
          pMessage = pMessage..'"'..M_LUM..'":'..ldrValue'}'
        elseif cmd =="RALL" then
          pMessage = pMessage..'"'..M_TEMP..'":'..tempValue..','..'"'..M_SMS'":'..moistureValue..','..'"'..M_LUM..'":'..ldrValue..','..'"'..M_HUM..'":'..humiValue..'}'
        end
      elseif cmd == M_PON or cmd == M_POFF or cmd == M_PSTATUS then
        if cmd == M_PON then
          gpio.write(P_RLY,gpio.LOW)--switch on the relay
          pMessage = pMessage..','..'"RPSTATUS":"ON"'..'}'
        elseif cmd == M_POFF then
          gpio.write(P_RLY,gpio.HIGH)
          pMessage = pMessage..'.'..'"RPSTATUS":"OFF"'..'}'
        elseif cmd == M_PSTAYUS then
          rState = gpio.read(P_RLY)
          if rState == 0 then
            pMessage = pMessage..','..'"RPSTATUS":"ON"'..'}'
          elseif rState == 1 then
            pMessage = pMessage..'.'..'"RPSTATUS":"OFF"'..'}'
          end
        end
      end
      m:publish(Q_PFD,pMessage,0,0, function(client) print("sent"..pMessage) end)
    end

  end --end of function processCmdAndPublish

--------------------------------------------------
--Code Starts from Here
--------------------------------------------------

--init mqtt client with keepalive timer 0 - means not stop
m = mqtt.Client("anil1",0,Q_ID,Q_KEY)
m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

-- on publish message receive event
m:on("message", function(client, topic, data)
print(topic .. ":" )
if data ~= nil then
  print(data)
  pMessage = '"deviceid":'.. node.chipid()..',"data": {  ' --string initialization to publish the data to the cloud
  --data = cjson.decode(data)-- replaced with function to catch any errors
  --pcall is used for error handling
  if pcall(decodeReceivedData) then
      processCmdAndPublish()
      else
      print("Unable to decode the Json Command Received"..data)
      end -- end for pcall function
      end)
--for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect(Q_HST,Q_PRT, Q_ARC, function(client)
                                print("connected")
                                --once connected subscribe to topic
                                -- subscribe topic <Q_SFD> with qos = 0
                                m:subscribe(Q_SFD,Q_QOS, function(client) print("subscribe success") end)
                              end,

                              function(client, reason)
                                print("failed reason: "..reason)
                                end)
-- subscribe topic with qos = 0
--m:subscribe(Q_FED,Q_QOS, function(client) print("subscribe success") end)
-- publish a message with data = hello, QoS = 0, retain = 0
--m:publish("/topic","hello",0,0, function(client) print("sent") end)
--m:close();
