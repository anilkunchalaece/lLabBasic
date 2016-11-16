EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nodemcu
LIBS:w_relay
LIBS:padma1Ver2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R3
U 1 1 582C3672
P 5600 4650
F 0 "R3" V 5680 4650 50  0000 C CNN
F 1 "R" V 5600 4650 50  0000 C CNN
F 2 "" V 5530 4650 50  0001 C CNN
F 3 "" H 5600 4650 50  0000 C CNN
	1    5600 4650
	1    0    0    -1  
$EndComp
$Comp
L R 10k1
U 1 1 582C36F9
P 5450 3100
F 0 "10k1" V 5530 3100 50  0000 C CNN
F 1 "R" V 5450 3100 50  0000 C CNN
F 2 "" V 5380 3100 50  0001 C CNN
F 3 "" H 5450 3100 50  0000 C CNN
	1    5450 3100
	0    1    1    0   
$EndComp
$Comp
L D D2
U 1 1 582C376F
P 3650 2900
F 0 "D2" H 3650 3000 50  0000 C CNN
F 1 "D" H 3650 2800 50  0000 C CNN
F 2 "" H 3650 2900 50  0001 C CNN
F 3 "" H 3650 2900 50  0000 C CNN
	1    3650 2900
	-1   0    0    1   
$EndComp
$Comp
L Q_PNP_BCE 2n3906
U 1 1 582C37C4
P 5950 3100
F 0 "2n3906" H 6250 3150 50  0000 C CNN
F 1 "Q_PNP_BCE" H 6550 3050 50  0001 R CNN
F 2 "" H 6150 3200 50  0001 C CNN
F 3 "" H 5950 3100 50  0000 C CNN
	1    5950 3100
	1    0    0    -1  
$EndComp
$Comp
L SPST SW1
U 1 1 582C382D
P 6100 4350
F 0 "SW1" H 6100 4450 50  0000 C CNN
F 1 "SPST" H 6100 4250 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVPBF" H 6100 4350 50  0001 C CNN
F 3 "" H 6100 4350 50  0000 C CNN
	1    6100 4350
	-1   0    0    1   
$EndComp
$Comp
L D D1
U 1 1 582C3A72
P 3650 2600
F 0 "D1" H 3650 2700 50  0000 C CNN
F 1 "D" H 3650 2500 50  0000 C CNN
F 2 "" H 3650 2600 50  0001 C CNN
F 3 "" H 3650 2600 50  0000 C CNN
	1    3650 2600
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X04 LDR1
U 1 1 582C3F02
P 4600 2050
F 0 "LDR1" H 4600 2300 50  0000 C CNN
F 1 "CONN_01X04" V 4700 2050 50  0001 C CNN
F 2 "" H 4600 2050 50  0001 C CNN
F 3 "" H 4600 2050 50  0000 C CNN
	1    4600 2050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 MOIS1
U 1 1 582C3F9A
P 4600 1500
F 0 "MOIS1" H 4600 1750 50  0000 C CNN
F 1 "CONN_01X04" V 4700 1500 50  0001 C CNN
F 2 "" H 4600 1500 50  0001 C CNN
F 3 "" H 4600 1500 50  0000 C CNN
	1    4600 1500
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 DTH1
U 1 1 582C4013
P 5850 2050
F 0 "DTH1" H 5850 2300 50  0000 C CNN
F 1 "CONN_01X04" V 5950 2050 50  0001 C CNN
F 2 "" H 5850 2050 50  0001 C CNN
F 3 "" H 5850 2050 50  0000 C CNN
	1    5850 2050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 Grovr1
U 1 1 582C406C
P 6650 2950
F 0 "Grovr1" H 6650 3200 50  0001 C CNN
F 1 "RLY" H 6750 2950 50  0000 C CNN
F 2 "" H 6650 2950 50  0001 C CNN
F 3 "" H 6650 2950 50  0000 C CNN
	1    6650 2950
	0    -1   -1   0   
$EndComp
Text Label 3600 2500 0    60   ~ 0
DLDR
Text Label 3600 3100 0    60   ~ 0
DMOIS
NoConn ~ 4550 2250
NoConn ~ 4550 1700
$Comp
L Earth #PWR2
U 1 1 582C4AC2
P 4750 2250
F 0 "#PWR2" H 4750 2000 50  0001 C CNN
F 1 "Earth" H 4750 2100 50  0001 C CNN
F 2 "" H 4750 2250 50  0000 C CNN
F 3 "" H 4750 2250 50  0000 C CNN
	1    4750 2250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR8
U 1 1 582C5C13
P 6050 2900
F 0 "#PWR8" H 6050 2750 50  0001 C CNN
F 1 "+3.3V" H 6050 3040 50  0000 C CNN
F 2 "" H 6050 2900 50  0000 C CNN
F 3 "" H 6050 2900 50  0000 C CNN
	1    6050 2900
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR1
U 1 1 582C693C
P 4750 1700
F 0 "#PWR1" H 4750 1450 50  0001 C CNN
F 1 "Earth" H 4750 1550 50  0001 C CNN
F 2 "" H 4750 1700 50  0000 C CNN
F 3 "" H 4750 1700 50  0000 C CNN
	1    4750 1700
	1    0    0    -1  
$EndComp
NoConn ~ 5800 2250
$Comp
L +3.3V #PWR6
U 1 1 582C7499
P 5900 2400
F 0 "#PWR6" H 5900 2250 50  0001 C CNN
F 1 "+3.3V" H 5900 2540 50  0000 C CNN
F 2 "" H 5900 2400 50  0000 C CNN
F 3 "" H 5900 2400 50  0000 C CNN
	1    5900 2400
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR7
U 1 1 582C7550
P 6000 2300
F 0 "#PWR7" H 6000 2050 50  0001 C CNN
F 1 "Earth" H 6000 2150 50  0001 C CNN
F 2 "" H 6000 2300 50  0000 C CNN
F 3 "" H 6000 2300 50  0000 C CNN
	1    6000 2300
	1    0    0    -1  
$EndComp
NoConn ~ 6600 3150
$Comp
L +3.3V #PWR11
U 1 1 582C78ED
P 6700 3350
F 0 "#PWR11" H 6700 3200 50  0001 C CNN
F 1 "+3.3V" H 6700 3490 50  0000 C CNN
F 2 "" H 6700 3350 50  0000 C CNN
F 3 "" H 6700 3350 50  0000 C CNN
	1    6700 3350
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR12
U 1 1 582C79CF
P 6800 3250
F 0 "#PWR12" H 6800 3000 50  0001 C CNN
F 1 "Earth" H 6800 3100 50  0001 C CNN
F 2 "" H 6800 3250 50  0000 C CNN
F 3 "" H 6800 3250 50  0000 C CNN
	1    6800 3250
	1    0    0    -1  
$EndComp
$Comp
L LED_RCBG D3
U 1 1 582C388A
P 6050 3700
F 0 "D3" H 6050 4050 50  0000 C CNN
F 1 "LED_RCBG" H 6050 3350 50  0000 C CNN
F 2 "" H 6050 3650 50  0001 C CNN
F 3 "" H 6050 3650 50  0000 C CNN
	1    6050 3700
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 582C8339
P 5650 3350
F 0 "R4" V 5730 3350 50  0000 C CNN
F 1 "R" V 5650 3350 50  0000 C CNN
F 2 "" V 5580 3350 50  0001 C CNN
F 3 "" H 5650 3350 50  0000 C CNN
	1    5650 3350
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 582C866A
P 5500 3550
F 0 "R1" V 5580 3550 50  0000 C CNN
F 1 "R" V 5500 3550 50  0000 C CNN
F 2 "" V 5430 3550 50  0001 C CNN
F 3 "" H 5500 3550 50  0000 C CNN
	1    5500 3550
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 582C8997
P 5500 3900
F 0 "R2" V 5580 3900 50  0000 C CNN
F 1 "R" V 5500 3900 50  0000 C CNN
F 2 "" V 5430 3900 50  0001 C CNN
F 3 "" H 5500 3900 50  0000 C CNN
	1    5500 3900
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR9
U 1 1 582C8C6A
P 6350 3700
F 0 "#PWR9" H 6350 3450 50  0001 C CNN
F 1 "Earth" H 6350 3550 50  0001 C CNN
F 2 "" H 6350 3700 50  0000 C CNN
F 3 "" H 6350 3700 50  0000 C CNN
	1    6350 3700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR5
U 1 1 582C92CF
P 5600 5000
F 0 "#PWR5" H 5600 4750 50  0001 C CNN
F 1 "Earth" H 5600 4850 50  0001 C CNN
F 2 "" H 5600 5000 50  0000 C CNN
F 3 "" H 5600 5000 50  0000 C CNN
	1    5600 5000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR10
U 1 1 582C937E
P 6600 4350
F 0 "#PWR10" H 6600 4200 50  0001 C CNN
F 1 "+3.3V" H 6600 4490 50  0000 C CNN
F 2 "" H 6600 4350 50  0000 C CNN
F 3 "" H 6600 4350 50  0000 C CNN
	1    6600 4350
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG1
U 1 1 582CAB1D
P 6400 2200
F 0 "#FLG1" H 6400 2295 50  0001 C CNN
F 1 "PWR_FLAG" H 6400 2380 50  0000 C CNN
F 2 "" H 6400 2200 50  0000 C CNN
F 3 "" H 6400 2200 50  0000 C CNN
	1    6400 2200
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG2
U 1 1 582CAB85
P 6950 4400
F 0 "#FLG2" H 6950 4495 50  0001 C CNN
F 1 "PWR_FLAG" H 6950 4580 50  0000 C CNN
F 2 "" H 6950 4400 50  0000 C CNN
F 3 "" H 6950 4400 50  0000 C CNN
	1    6950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2600 3800 2900
Wire Wire Line
	4200 2800 3800 2800
Connection ~ 3800 2800
Wire Wire Line
	3500 2600 3500 2350
Wire Wire Line
	3300 2900 3500 2900
Wire Wire Line
	3300 1800 3300 2900
Wire Wire Line
	3300 1800 4450 1800
Wire Wire Line
	4450 1800 4450 1700
Wire Wire Line
	3500 2350 4450 2350
Wire Wire Line
	4450 2350 4450 2250
Wire Wire Line
	5100 2800 5300 2800
Wire Wire Line
	5300 2800 5300 2500
Wire Wire Line
	5300 2500 4650 2500
Wire Wire Line
	4650 2500 4650 2250
Wire Wire Line
	5100 2900 5400 2900
Wire Wire Line
	5100 3100 5300 3100
Wire Wire Line
	5600 3100 5750 3100
Wire Wire Line
	4650 1700 4650 1850
Wire Wire Line
	4650 1850 5400 1850
Wire Wire Line
	5400 1850 5400 2900
Wire Wire Line
	5100 3000 5700 3000
Wire Wire Line
	5700 3000 5700 2250
Wire Wire Line
	5900 2250 5900 2400
Wire Wire Line
	6000 2250 6000 2300
Wire Wire Line
	6050 3300 6500 3300
Wire Wire Line
	6500 3300 6500 3150
Wire Wire Line
	6700 3350 6700 3150
Wire Wire Line
	6800 3250 6800 3150
Wire Wire Line
	5100 3200 5650 3200
Wire Wire Line
	5650 3500 5750 3500
Wire Wire Line
	5100 3500 5300 3500
Wire Wire Line
	5300 3500 5300 3400
Wire Wire Line
	5300 3400 5500 3400
Wire Wire Line
	5500 3700 5750 3700
Wire Wire Line
	5650 3900 5750 3900
Wire Wire Line
	5100 3600 5300 3600
Wire Wire Line
	5300 3600 5300 3900
Wire Wire Line
	5300 3900 5350 3900
Wire Wire Line
	5600 4500 5600 4350
Wire Wire Line
	5100 3700 5200 3700
Wire Wire Line
	5200 3700 5200 4350
Wire Wire Line
	5200 4350 5600 4350
Wire Wire Line
	5600 5000 5600 4800
Wire Wire Line
	6400 2200 6400 2250
Wire Wire Line
	6400 2250 6000 2250
Wire Wire Line
	6600 4350 6950 4350
Wire Wire Line
	6950 4350 6950 4400
Text Label 6200 2250 0    60   ~ 0
GND
Text Label 5900 2300 0    60   ~ 0
PWR
NoConn ~ 4200 3100
NoConn ~ 4200 3200
NoConn ~ 4200 3300
NoConn ~ 4200 3400
NoConn ~ 4200 3500
NoConn ~ 4200 3600
NoConn ~ 4200 3700
NoConn ~ 4200 3800
NoConn ~ 4200 4200
NoConn ~ 5100 4000
NoConn ~ 5100 3400
NoConn ~ 4200 4100
NoConn ~ 4200 3900
$Comp
L NodeMCU_Amica_R2 nodemcu1
U 1 1 582C3605
P 4650 3500
F 0 "nodemcu1" H 4650 4300 50  0000 C CNN
F 1 "nodemcu" H 4650 2650 50  0000 C CNN
F 2 "" H 4900 3500 50  0001 C CNN
F 3 "" H 4900 3500 50  0000 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR4
U 1 1 582CBB12
P 5100 4200
F 0 "#PWR4" H 5100 4050 50  0001 C CNN
F 1 "+3.3V" H 5100 4340 50  0000 C CNN
F 2 "" H 5100 4200 50  0000 C CNN
F 3 "" H 5100 4200 50  0000 C CNN
	1    5100 4200
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR3
U 1 1 582CBC4D
P 5100 4100
F 0 "#PWR3" H 5100 3850 50  0001 C CNN
F 1 "Earth" H 5100 3950 50  0001 C CNN
F 2 "" H 5100 4100 50  0000 C CNN
F 3 "" H 5100 4100 50  0000 C CNN
	1    5100 4100
	0    -1   -1   0   
$EndComp
NoConn ~ 5100 3900
NoConn ~ 5100 3800
NoConn ~ 5100 3300
NoConn ~ 4200 4000
$EndSCHEMATC
