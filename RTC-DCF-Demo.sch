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
LIBS:special
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
LIBS:Clock-Components
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
L R R?
U 1 1 55241A5F
P 3300 1950
F 0 "R?" V 3380 1950 50  0000 C CNN
F 1 "10k" V 3300 1950 50  0000 C CNN
F 2 "" V 3230 1950 30  0000 C CNN
F 3 "" H 3300 1950 30  0000 C CNN
	1    3300 1950
	1    0    0    -1  
$EndComp
Text GLabel 3050 1600 0    60   Input ~ 0
Vcc
$Comp
L CONN_01X04 P?
U 1 1 55241ACB
P 6550 1800
F 0 "P?" H 6550 2050 50  0000 C CNN
F 1 "I2C High" V 6650 1800 50  0000 C CNN
F 2 "" H 6550 1800 60  0000 C CNN
F 3 "" H 6550 1800 60  0000 C CNN
	1    6550 1800
	1    0    0    -1  
$EndComp
Text GLabel 6150 1650 0    60   Input ~ 0
Vcc
$Comp
L GND #PWR?
U 1 1 55241DD9
P 5750 2050
F 0 "#PWR?" H 5750 1800 50  0001 C CNN
F 1 "GND" H 5750 1900 50  0000 C CNN
F 2 "" H 5750 2050 60  0000 C CNN
F 3 "" H 5750 2050 60  0000 C CNN
	1    5750 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55241EFB
P 4700 5300
F 0 "#PWR?" H 4700 5050 50  0001 C CNN
F 1 "GND" H 4700 5150 50  0000 C CNN
F 2 "" H 4700 5300 60  0000 C CNN
F 3 "" H 4700 5300 60  0000 C CNN
	1    4700 5300
	1    0    0    -1  
$EndComp
Text GLabel 6150 3600 2    60   BiDi ~ 0
SDA
Text GLabel 6150 3700 2    60   BiDi ~ 0
SCL
Text GLabel 6150 1850 0    60   BiDi ~ 0
SDA
Text GLabel 6150 1950 0    60   BiDi ~ 0
SCL
Text Label 5850 4300 2    60   ~ 0
S0
Text Label 5850 4000 2    60   ~ 0
S1
Text Label 5850 4100 2    60   ~ 0
S2
Text Label 5850 4200 2    60   ~ 0
S3
$Comp
L CONN_02X03 P?
U 1 1 553D2A2D
P 8000 3100
F 0 "P?" H 8000 3300 50  0000 C CNN
F 1 "CONN_02X03" H 8000 2900 50  0000 C CNN
F 2 "" H 8000 1900 60  0000 C CNN
F 3 "" H 8000 1900 60  0000 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
Text GLabel 6150 2800 2    60   Input ~ 0
MOSI
Text GLabel 6150 2900 2    60   Input ~ 0
MISO
Text GLabel 6150 3000 2    60   Input ~ 0
SCK
Text GLabel 7500 3000 0    60   Input ~ 0
MISO
Wire Wire Line
	3050 1600 4700 1600
Wire Wire Line
	4700 1600 4700 2200
Wire Wire Line
	3150 2500 3800 2500
Wire Wire Line
	6150 1650 6350 1650
Wire Wire Line
	6350 1750 5750 1750
Wire Wire Line
	5750 1750 5750 2050
Wire Wire Line
	4700 5100 4700 5300
Wire Wire Line
	5700 3600 6150 3600
Wire Wire Line
	5700 3700 6150 3700
Wire Wire Line
	6150 1850 6350 1850
Wire Wire Line
	6150 1950 6350 1950
Wire Wire Line
	5700 2900 6150 2900
Wire Wire Line
	5700 3000 6150 3000
Wire Wire Line
	5700 2800 6150 2800
Wire Wire Line
	7750 3000 7500 3000
Wire Wire Line
	7750 3100 7500 3100
Wire Wire Line
	7750 3200 7500 3200
Wire Wire Line
	8250 3000 8500 3000
Wire Wire Line
	8250 3100 8500 3100
Wire Wire Line
	8250 3200 8500 3200
Text GLabel 7500 3100 0    60   Input ~ 0
SCK
Text GLabel 7500 3200 0    60   Input ~ 0
Reset
Text GLabel 8500 3000 2    60   Input ~ 0
Vcc
Text GLabel 8500 3100 2    60   Input ~ 0
MOSI
Wire Wire Line
	8500 3200 8500 3450
$Comp
L GND #PWR?
U 1 1 553D2C77
P 8500 3450
F 0 "#PWR?" H 8500 3200 50  0001 C CNN
F 1 "GND" H 8500 3300 50  0000 C CNN
F 2 "" H 8500 3450 60  0000 C CNN
F 3 "" H 8500 3450 60  0000 C CNN
	1    8500 3450
	1    0    0    -1  
$EndComp
Text GLabel 3150 2500 0    60   Input ~ 0
Reset
Text Label 5750 4400 0    60   ~ 0
D0
Text Label 5750 4500 0    60   ~ 0
D1
Text Label 5750 4600 0    60   ~ 0
D2
NoConn ~ 3800 2700
NoConn ~ 3800 2800
NoConn ~ 3800 2900
NoConn ~ 3800 3200
NoConn ~ 3800 3400
NoConn ~ 5700 2500
NoConn ~ 5700 2600
NoConn ~ 5700 2700
NoConn ~ 5700 3200
NoConn ~ 5700 3300
NoConn ~ 5700 3400
NoConn ~ 5700 3500
$Comp
L CONN_01X03 P?
U 1 1 553D3655
P 6350 4500
F 0 "P?" H 6500 4500 50  0000 C CNN
F 1 "74LS138" H 6600 4400 50  0000 C CNN
F 2 "" H 6350 4500 60  0000 C CNN
F 3 "" H 6350 4500 60  0000 C CNN
	1    6350 4500
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 553D3753
P 6350 4050
F 0 "P?" H 6500 4100 50  0000 C CNN
F 1 "74HC4511 A" H 6650 4000 50  0000 C CNN
F 2 "" H 6350 4050 60  0000 C CNN
F 3 "" H 6350 4050 60  0000 C CNN
	1    6350 4050
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 553D3903
P 6600 4250
F 0 "P?" H 6750 4300 50  0000 C CNN
F 1 "74HC4511 B" H 6900 4200 50  0000 C CNN
F 2 "" H 6600 4250 60  0000 C CNN
F 3 "" H 6600 4250 60  0000 C CNN
	1    6600 4250
	1    0    0    1   
$EndComp
$Comp
L My-ATMEGA8-P IC?
U 1 1 553D3BD0
P 4700 3600
F 0 "IC?" H 3950 4900 40  0000 L BNN
F 1 "My-ATMEGA8-P" H 5200 2150 40  0000 L BNN
F 2 "DIL28" H 4700 3600 30  0000 C CIN
F 3 "" H 4700 3600 60  0000 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4000 6150 4000
Wire Wire Line
	5700 4100 6150 4100
Wire Wire Line
	5700 4200 6400 4200
Wire Wire Line
	5700 4300 6400 4300
Wire Wire Line
	5700 4400 6150 4400
Wire Wire Line
	5700 4500 6150 4500
Wire Wire Line
	5700 4600 6150 4600
$Comp
L C C?
U 1 1 553D3F70
P 4100 1850
F 0 "C?" H 4125 1950 50  0000 L CNN
F 1 "100nF" H 4125 1750 50  0000 L CNN
F 2 "" H 4138 1700 30  0000 C CNN
F 3 "" H 4100 1850 60  0000 C CNN
	1    4100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1600 4100 1700
Connection ~ 4100 1600
$Comp
L GND #PWR?
U 1 1 553D4048
P 4100 2050
F 0 "#PWR?" H 4100 1800 50  0001 C CNN
F 1 "GND" H 4100 1900 50  0000 C CNN
F 2 "" H 4100 2050 60  0000 C CNN
F 3 "" H 4100 2050 60  0000 C CNN
	1    4100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2000 4100 2050
$Comp
L CONN_01X06 ST5
U 1 1 55431A7F
P 8600 4450
F 0 "ST5" H 8600 4800 50  0000 C CNN
F 1 "RTC-DCF" H 8850 4150 50  0000 C CNN
F 2 "" H 8600 4450 60  0000 C CNN
F 3 "" H 8600 4450 60  0000 C CNN
	1    8600 4450
	1    0    0    -1  
$EndComp
Text GLabel 8150 4200 0    60   Input ~ 0
Vbb
Wire Wire Line
	8150 4200 8400 4200
Text GLabel 8150 4300 0    60   Input ~ 0
SDA
Text GLabel 8150 4400 0    60   Input ~ 0
SCL
$Comp
L GND #PWR?
U 1 1 55431B94
P 7900 4850
F 0 "#PWR?" H 7900 4600 50  0001 C CNN
F 1 "GND" H 7900 4700 50  0000 C CNN
F 2 "" H 7900 4850 60  0000 C CNN
F 3 "" H 7900 4850 60  0000 C CNN
	1    7900 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4850 7900 4700
Wire Wire Line
	7900 4700 8400 4700
Wire Wire Line
	8150 4300 8400 4300
Wire Wire Line
	8150 4400 8400 4400
$Comp
L CONN_01X01 P?
U 1 1 55431ED8
P 6600 4700
F 0 "P?" H 6600 4800 50  0000 C CNN
F 1 "Punkt" H 6900 4700 50  0000 C CNN
F 2 "" H 6600 4700 60  0000 C CNN
F 3 "" H 6600 4700 60  0000 C CNN
	1    6600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4700 6400 4700
Wire Wire Line
	3300 1600 3300 1700
Connection ~ 3300 1600
Wire Wire Line
	3300 2200 3300 2500
Connection ~ 3300 2500
$EndSCHEMATC
