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
LIBS:kicadlib
LIBS:bubble_ver-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "12 jun 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MKL02ZXVFG4 U?
U 1 1 539905F5
P 4500 3000
F 0 "U?" H 4050 2400 60  0000 C CNN
F 1 "MKL02ZXVFG4" H 5200 2400 60  0000 C CNN
F 2 "~" H 4500 3000 60  0000 C CNN
F 3 "~" H 4500 3000 60  0000 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
$Comp
L SI7020 U?
U 1 1 53990604
P 7300 3000
F 0 "U?" H 7300 2700 60  0000 C CNN
F 1 "SI7020" H 7300 3300 60  0000 C CNN
F 2 "~" H 7300 2900 60  0000 C CNN
F 3 "~" H 7300 2900 60  0000 C CNN
	1    7300 3000
	1    0    0    -1  
$EndComp
$Comp
L QDSP-6040 D?
U 1 1 5399119B
P 8950 3300
F 0 "D?" H 9850 4050 60  0000 C CNN
F 1 "QDSP-6040" V 8800 4050 60  0000 C CNN
F 2 "" H 9750 3800 60  0000 C CNN
F 3 "" H 9750 3800 60  0000 C CNN
	1    8950 3300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5399E115
P 6600 2500
F 0 "R?" V 6680 2500 40  0000 C CNN
F 1 "10K" V 6607 2501 40  0000 C CNN
F 2 "~" V 6530 2500 30  0000 C CNN
F 3 "~" H 6600 2500 30  0000 C CNN
	1    6600 2500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5399E127
P 8000 2500
F 0 "R?" V 8080 2500 40  0000 C CNN
F 1 "10K" V 8007 2501 40  0000 C CNN
F 2 "~" V 7930 2500 30  0000 C CNN
F 3 "~" H 8000 2500 30  0000 C CNN
	1    8000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2250 6600 2050
Wire Wire Line
	8000 2250 8000 2050
Text Label 8000 2050 0    60   ~ 0
VCC
Text Label 6600 2050 0    60   ~ 0
VCC
Wire Wire Line
	8000 2750 8000 2850
Wire Wire Line
	7900 2850 8100 2850
Wire Wire Line
	6500 2850 6700 2850
Wire Wire Line
	6600 2850 6600 2750
NoConn ~ 7900 3150
NoConn ~ 6700 3150
Connection ~ 8000 2850
Connection ~ 6600 2850
Text Label 8100 2850 0    60   ~ 0
SCL
Text Label 6500 2850 2    60   ~ 0
SDA
Text Label 3650 3000 2    60   ~ 0
SDA
Text Label 3650 3150 2    60   ~ 0
SCL
Wire Wire Line
	3750 3000 3650 3000
Wire Wire Line
	3650 3150 3750 3150
Text Label 3650 2700 2    60   ~ 0
VCC
Wire Wire Line
	3650 2700 3750 2700
$Comp
L GND #PWR?
U 1 1 5399E2DF
P 3650 2850
F 0 "#PWR?" H 3650 2850 30  0001 C CNN
F 1 "GND" H 3650 2780 30  0001 C CNN
F 2 "" H 3650 2850 60  0000 C CNN
F 3 "" H 3650 2850 60  0000 C CNN
	1    3650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2850 3750 2850
Text Label 4350 2000 1    60   ~ 0
SWDIO
Text Label 4500 2000 1    60   ~ 0
NRST
Text Label 4650 2000 1    60   ~ 0
SWD_CLK
Wire Wire Line
	4350 2000 4350 2100
Wire Wire Line
	4500 2000 4500 2100
Wire Wire Line
	4650 2000 4650 2100
Text Label 8000 3000 0    60   ~ 0
VCC
Wire Wire Line
	8000 3000 7900 3000
$EndSCHEMATC
