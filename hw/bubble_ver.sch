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
Text Label 3750 3300 2    60   ~ 0
SDA
Text Label 3750 3450 2    60   ~ 0
SCL
Text Label 3750 3000 2    60   ~ 0
VCC
$Comp
L GND #PWR?
U 1 1 5399E2DF
P 3650 3150
F 0 "#PWR?" H 3650 3150 30  0001 C CNN
F 1 "GND" H 3650 3080 30  0001 C CNN
F 2 "" H 3650 3150 60  0000 C CNN
F 3 "" H 3650 3150 60  0000 C CNN
	1    3650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3150 3750 3150
Text Label 4350 2100 1    60   ~ 0
SWDIO
Text Label 4500 2100 1    60   ~ 0
NRST
Text Label 4650 2100 1    60   ~ 0
SWD_CLK
Text Label 8000 3000 0    60   ~ 0
VCC
Wire Wire Line
	8000 3000 7900 3000
Text Label 8950 1700 1    60   ~ 0
LED_AA
Text Label 9100 1700 1    60   ~ 0
LED_AB
Text Label 9100 3400 3    60   ~ 0
LED_AE
Text Label 9250 3400 3    60   ~ 0
LED_AC
$Comp
L MKL02Z16VFK4 U?
U 1 1 5399EECC
P 4500 3150
F 0 "U?" H 4000 2450 60  0000 C CNN
F 1 "MKL02Z16VFK4" H 3850 4000 60  0000 C CNN
F 2 "" H 4500 3150 60  0000 C CNN
F 3 "" H 4500 3150 60  0000 C CNN
	1    4500 3150
	1    0    0    -1  
$EndComp
Text Label 9250 1700 1    60   ~ 0
LED_C2
Text Label 9400 1700 1    60   ~ 0
LED_AF
Text Label 9550 1700 1    60   ~ 0
LED_AD
Text Label 9700 1700 1    60   ~ 0
LED_AG
Text Label 8950 3400 3    60   ~ 0
LED_C1
Text Label 9400 3400 3    60   ~ 0
LED_C3
Text Label 9550 3400 3    60   ~ 0
LED_ADP
Text Label 9700 3400 3    60   ~ 0
LED_C4
Text Label 6050 6350 0    60   ~ 0
LED_AE
Text Label 6050 6500 0    60   ~ 0
LED_AC
Text Label 6050 6650 0    60   ~ 0
LED_ADP
Text Label 6050 5700 0    60   ~ 0
LED_AA
Text Label 6050 5550 0    60   ~ 0
LED_AB
Text Label 6050 5400 0    60   ~ 0
LED_AF
Text Label 6050 5250 0    60   ~ 0
LED_AD
Text Label 6050 6800 0    60   ~ 0
LED_AG
Text Label 5000 5700 2    60   ~ 0
LED_CNTRL_AA
Text Label 5000 5550 2    60   ~ 0
LED_CNTRL_AB
Text Label 5000 5400 2    60   ~ 0
LED_CNTRL_AF
Text Label 5000 5250 2    60   ~ 0
LED_CNTRL_AD
Text Label 5000 6800 2    60   ~ 0
LED_CNTRL_AG
Text Label 5000 6650 2    60   ~ 0
LED_CNTRL_ADP
Text Label 5000 6500 2    60   ~ 0
LED_CNTRL_AC
Text Label 5000 6350 2    60   ~ 0
LED_CNTRL_AE
$Comp
L RES_NET_4 RN?
U 1 1 5399F32C
P 5600 5550
F 0 "RN?" H 5500 5250 60  0000 C CNN
F 1 "RES_NET_4" H 5550 6000 60  0000 C CNN
F 2 "" H 5250 5450 60  0000 C CNN
F 3 "" H 5250 5450 60  0000 C CNN
	1    5600 5550
	1    0    0    -1  
$EndComp
$Comp
L RES_NET_4 RN?
U 1 1 5399F343
P 5600 6650
F 0 "RN?" H 5500 6350 60  0000 C CNN
F 1 "RES_NET_4" H 5550 7100 60  0000 C CNN
F 2 "" H 5250 6550 60  0000 C CNN
F 3 "" H 5250 6550 60  0000 C CNN
	1    5600 6650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
