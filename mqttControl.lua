--[[
Author : Kunchala Anil
Email : anilkunchalaece@gmail.com
Date : 14 Nov 2016
This File is used to subscribe and publish mqtt messages from the adafruit IO
we need to subscribe to the mqtt topic : SFD -> Subscribe Feed data
            publish to the mqtt topic : PFD -> Publish feed data

The receivec data will be in the form
"deviceid":"123456","command":"RTEMP"
 this is the shorted version of json.. since adafruit IO giving me the error if the string is in Json format
 I need to add the starting and ending curly brackets to it

 to piublish data format is
 "deviceid":"123456",data:{"RTEMP":"30"}
]]

function checkDeviceId(dataId)
  if dataId["deviceid"] then
    print(dataId["deviceid"])
  end --end of deviceId if
end -- end of funtion

function checkCommand(dataCmd)
  if dataCmd["command"] then
    cmd = dataCmd["command"]
    print("Recvd Cmd is"..cmd)
  end
end


function processSensorReadingCommands()
  dofile("readSensorData.lua") -- run the file to get the Data
  if cmd == M_TEMP then
    pMessage = pMessage..'"'..M_TEMP..'":'..tempValue..'}'
    print(pMessage)
  elseif cmd == M_HUM then
    pMessage = pMessage..'"'..M_HUM..'":'..humiValue..'}'
  elseif cmd == M_SMS then
    pMessage = pMessage..'"'..M_SMS..'":'..moistureValue..'}'
  elseif cmd == M_LUM then
    pMessage = pMessage..'"'..M_LUM..'":'..ldrValue..'}'
  elseif cmd =="RALL" then
    pMessage = pMessage..'"'..M_TEMP..'":'..tempValue..','..'"'..M_SMS..'":'..moistureValue..','..'"'..M_LUM..'":'..ldrValue..','..'"'..M_HUM..'":'..humiValue..'}'
  end
end --end of function


function processPumpCommands()
  if D_POP == "1" then
    if cmd == M_PON then
      gpio.write(P_RLY,gpio.LOW)--switch on the relay
      pMessage = pMessage..'"RPSTATUS":"ON"'..'}'
    elseif cmd == M_POFF then
      gpio.write(P_RLY,gpio.HIGH)
      pMessage = pMessage..'"RPSTATUS":"OFF"'..'}'
    elseif cmd == M_PSTATUS then
      rState = gpio.read(P_RLY)
      if rState == 0 then
        pMessage = pMessage..'"RPSTATUS":"ON"'..'}'
      elseif rState == 1 then
        pMessage = pMessage..'"RPSTATUS":"OFF"'..'}'
      end
    end
  else
    pMessage = pMessage..'"RPSTATUS" : "NO PUMP"'..'}'
  end
  end --end of function



--function to process the receivedcommand.
function processCmdAndPublish(data)
  checkDeviceId(data)
  checkCommand(data)
    if cmd == M_TEMP or cmd == M_HUM or cmd == M_SMS or cmd == M_LUM or cmd == M_ALL then
      processSensorReadingCommands()
    elseif cmd == M_PON or cmd == M_POFF or cmd == M_PSTATUS then
        processPumpCommands()
  else
    print("received Invalid Command"..cmd)
    pMessage = pMessage..'}'--send the Null
  end
    m:publish(Q_PFD,pMessage,0,0, function(client) print("sent"..pMessage) end)
  end --end of function processCmdAndPublish


function getRandomClientId()
    return Q_UID..math.random(1,100)
end
--------------------------------------------------
--Code Starts from Here
--------------------------------------------------

--init mqtt client with keepalive timer 0 - means not stop
m = mqtt.Client(getRandomClientId(),0,Q_UID,Q_KEY)
m:on("connect", function(client) print ("connected") end)
m:on("offline", function(client) print ("offline") end)

-- on publish message receive event
m:on("message", function(client, topic, data)
    print(topic .. ":" )
    if data ~= nil then
      data = '{'..data..'}'
      print(data)
      pMessage = '"deviceid":'.. node.chipid()..',"data": {  ' --string initialization to publish the data to the cloud
      --data = cjson.decode(data)-- replaced with function to catch any errors
      --pcall is used for error handling
      if pcall(function()
          dataJson = cjson.decode(data)
        end) then
        print("processData commandis "..dataJson["command"])
        processCmdAndPublish(dataJson)
        print("response is sent")
      else
        print("Unable to decode the Json Command Received"..data)
      end -- end for pcall function
    else
      print("data is null")
    end
  end
)

--for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect(Q_HST,Q_PRT,0,Q_ARC, function(client)
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
