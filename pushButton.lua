do
gpio.mode(8,gpio.INT)
function pinDown()
--for i=5,0,-1 do
print("pushButton Pressed")
setLedStatus(E_SERVER) -- set LED status as AP Mode
tmr.delay(1000000*0.25)
print('after Delay')
--end
end
 gpio.trig(8, "high", pinDown)
end