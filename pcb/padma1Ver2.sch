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
L NodeMCU_Amica_R2 U?
U 1 1 582C3605
P 4650 3500
F 0 "U?" H 4650 4300 50  0000 C CNN
F 1 "NodeMCU_Amica_R2" H 4650 2650 50  0000 C CNN
F 2 "" H 4900 3500 50  0000 C CNN
F 3 "" H 4900 3500 50  0000 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 582C3672
P 9050 3300
F 0 "R?" V 9130 3300 50  0000 C CNN
F 1 "R" V 9050 3300 50  0000 C CNN
F 2 "" V 8980 3300 50  0000 C CNN
F 3 "" H 9050 3300 50  0000 C CNN
	1    9050 3300
	1    0    0    -1  
$EndComp
$Comp
L R 10k
U 1 1 582C36F9
P 5450 3100
F 0 "10k" V 5530 3100 50  0000 C CNN
F 1 "R" V 5450 3100 50  0000 C CNN
F 2 "" V 5380 3100 50  0000 C CNN
F 3 "" H 5450 3100 50  0000 C CNN
	1    5450 3100
	0    1    1    0   
$EndComp
$Comp
L D D?
U 1 1 582C376F
P 3650 2900
F 0 "D?" H 3650 3000 50  0000 C CNN
F 1 "D" H 3650 2800 50  0000 C CNN
F 2 "" H 3650 2900 50  0000 C CNN
F 3 "" H 3650 2900 50  0000 C CNN
	1    3650 2900
	-1   0    0    1   
$EndComp
$Comp
L Q_PNP_BCE Q?
U 1 1 582C37C4
P 5950 3100
F 0 "Q?" H 6250 3150 50  0000 R CNN
F 1 "Q_PNP_BCE" H 6550 3050 50  0000 R CNN
F 2 "" H 6150 3200 50  0000 C CNN
F 3 "" H 5950 3100 50  0000 C CNN
	1    5950 3100
	1    0    0    -1  
$EndComp
$Comp
L SPST SW?
U 1 1 582C382D
P 3050 4150
F 0 "SW?" H 3050 4250 50  0000 C CNN
F 1 "SPST" H 3050 4050 50  0000 C CNN
F 2 "" H 3050 4150 50  0000 C CNN
F 3 "" H 3050 4150 50  0000 C CNN
	1    3050 4150
	1    0    0    -1  
$EndComp
$Comp
L LED_RCBG D?
U 1 1 582C388A
P 8800 4300
F 0 "D?" H 8800 4650 50  0000 C CNN
F 1 "LED_RCBG" H 8800 3950 50  0000 C CNN
F 2 "" H 8800 4250 50  0000 C CNN
F 3 "" H 8800 4250 50  0000 C CNN
	1    8800 4300
	1    0    0    -1  
$EndComp
$Comp
L D D?
U 1 1 582C3A72
P 3650 2600
F 0 "D?" H 3650 2700 50  0000 C CNN
F 1 "D" H 3650 2500 50  0000 C CNN
F 2 "" H 3650 2600 50  0000 C CNN
F 3 "" H 3650 2600 50  0000 C CNN
	1    3650 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 2600 3800 2900
Wire Wire Line
	4200 2800 3800 2800
Connection ~ 3800 2800
$Comp
L CONN_01X04 LDR
U 1 1 582C3F02
P 4600 2050
F 0 "LDR" H 4600 2300 50  0000 C CNN
F 1 "CONN_01X04" V 4700 2050 50  0001 C CNN
F 2 "" H 4600 2050 50  0000 C CNN
F 3 "" H 4600 2050 50  0000 C CNN
	1    4600 2050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 MOIS
U 1 1 582C3F9A
P 4600 1500
F 0 "MOIS" H 4600 1750 50  0000 C CNN
F 1 "CONN_01X04" V 4700 1500 50  0001 C CNN
F 2 "" H 4600 1500 50  0000 C CNN
F 3 "" H 4600 1500 50  0000 C CNN
	1    4600 1500
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 DTH11
U 1 1 582C4013
P 6800 2600
F 0 "DTH11" H 6800 2850 50  0000 C CNN
F 1 "CONN_01X04" V 6900 2600 50  0001 C CNN
F 2 "" H 6800 2600 50  0000 C CNN
F 3 "" H 6800 2600 50  0000 C CNN
	1    6800 2600
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 Grovr
U 1 1 582C406C
P 6600 3550
F 0 "Grovr" H 6600 3800 50  0001 C CNN
F 1 "RLY" H 6700 3550 50  0000 C CNN
F 2 "" H 6600 3550 50  0000 C CNN
F 3 "" H 6600 3550 50  0000 C CNN
	1    6600 3550
	1    0    0    -1  
$EndComp
Text Label 3600 2500 0    60   ~ 0
DLDR
Text Label 3600 3100 0    60   ~ 0
DMOIS
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
NoConn ~ 4550 2250
NoConn ~ 4550 1700
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
$Comp
L Earth #PWR?
U 1 1 582C4AC2
P 4750 2250
F 0 "#PWR?" H 4750 2000 50  0001 C CNN
F 1 "Earth" H 4750 2100 50  0001 C CNN
F 2 "" H 4750 2250 50  0000 C CNN
F 3 "" H 4750 2250 50  0000 C CNN
	1    4750 2250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 582C4E32
P 6600 2750
F 0 "#PWR?" H 6600 2500 50  0001 C CNN
F 1 "Earth" H 6600 2600 50  0001 C CNN
F 2 "" H 6600 2750 50  0000 C CNN
F 3 "" H 6600 2750 50  0000 C CNN
	1    6600 2750
	1    0    0    -1  
$EndComp
NoConn ~ 6600 2550
$Comp
L +3.3V #PWR?
U 1 1 582C4FDC
P 6250 2650
F 0 "#PWR?" H 6250 2500 50  0001 C CNN
F 1 "+3.3V" H 6250 2790 50  0000 C CNN
F 2 "" H 6250 2650 50  0000 C CNN
F 3 "" H 6250 2650 50  0000 C CNN
	1    6250 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2650 6250 2650
Wire Wire Line
	5100 3000 5700 3000
Wire Wire Line
	5700 3000 5700 2450
Wire Wire Line
	5700 2450 6600 2450
Wire Wire Line
	5100 3100 5300 3100
Wire Wire Line
	5600 3100 5750 3100
$Comp
L +3.3V #PWR?
U 1 1 582C5C13
P 6050 2900
F 0 "#PWR?" H 6050 2750 50  0001 C CNN
F 1 "+3.3V" H 6050 3040 50  0000 C CNN
F 2 "" H 6050 2900 50  0000 C CNN
F 3 "" H 6050 2900 50  0000 C CNN
	1    6050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3300 6050 3400
Wire Wire Line
	6050 3400 6400 3400
Wire Wire Line
	4650 1700 4650 1850
Wire Wire Line
	4650 1850 5400 1850
Wire Wire Line
	5400 1850 5400 2900
$Comp
L Earth #PWR?
U 1 1 582C693C
P 4750 1700
F 0 "#PWR?" H 4750 1450 50  0001 C CNN
F 1 "Earth" H 4750 1550 50  0001 C CNN
F 2 "" H 4750 1700 50  0000 C CNN
F 3 "" H 4750 1700 50  0000 C CNN
	1    4750 1700
	1    0    0    -1  
$EndComp
NoConn ~ 6400 3500
$Comp
L +3.3V #PWR?
U 1 1 582C6CAC
P 5950 3500
F 0 "#PWR?" H 5950 3350 50  0001 C CNN
F 1 "+3.3V" H 5950 3640 50  0000 C CNN
F 2 "" H 5950 3500 50  0000 C CNN
F 3 "" H 5950 3500 50  0000 C CNN
	1    5950 3500
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 582C6D84
P 6400 3800
F 0 "#PWR?" H 6400 3550 50  0001 C CNN
F 1 "Earth" H 6400 3650 50  0001 C CNN
F 2 "" H 6400 3800 50  0000 C CNN
F 3 "" H 6400 3800 50  0000 C CNN
	1    6400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3700 6400 3800
Wire Wire Line
	5950 3600 6400 3600
Wire Wire Line
	5950 3500 5950 3600
$EndSCHEMATC
