EESchema Schematic File Version 4
EELAYER 30 0
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
Text Label 8350 5800 1    50   ~ 0
DRCLK
Text Label 8450 5800 1    50   ~ 0
DCLK
Text Label 8550 5800 1    50   ~ 0
DSER
Text Label 8650 5800 1    50   ~ 0
SER
Text Label 8750 5800 1    50   ~ 0
SRCLK
Text Label 8850 5800 1    50   ~ 0
SRCLR
Text Label 8950 5800 1    50   ~ 0
RCLK
$Comp
L power:+5V #PWR014
U 1 1 5FADE256
P 9050 5800
F 0 "#PWR014" H 9050 5650 50  0001 C CNN
F 1 "+5V" H 9065 5973 50  0000 C CNN
F 2 "" H 9050 5800 50  0001 C CNN
F 3 "" H 9050 5800 50  0001 C CNN
	1    9050 5800
	1    0    0    -1  
$EndComp
$Comp
L power:HT #PWR015
U 1 1 5FADF097
P 9150 5550
F 0 "#PWR015" H 9150 5670 50  0001 C CNN
F 1 "HT" H 9170 5693 50  0000 C CNN
F 2 "" H 9150 5550 50  0001 C CNN
F 3 "" H 9150 5550 50  0001 C CNN
	1    9150 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5550 9150 5850
Wire Wire Line
	9050 5850 9050 5800
Wire Wire Line
	8950 5800 8950 5850
Wire Wire Line
	8850 5850 8850 5800
Wire Wire Line
	8750 5800 8750 5850
Wire Wire Line
	8650 5850 8650 5800
Wire Wire Line
	8550 5800 8550 5850
Wire Wire Line
	8450 5850 8450 5800
Wire Wire Line
	8350 5800 8350 5850
$Comp
L power:GND #PWR017
U 1 1 5FAE0AD5
P 9550 5850
F 0 "#PWR017" H 9550 5600 50  0001 C CNN
F 1 "GND" H 9555 5677 50  0000 C CNN
F 2 "" H 9550 5850 50  0001 C CNN
F 3 "" H 9550 5850 50  0001 C CNN
	1    9550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5850 9250 5650
Wire Wire Line
	9250 5650 9550 5650
Wire Wire Line
	9550 5650 9550 5850
$Comp
L Connector:Conn_01x10_Female J2
U 1 1 5FAE62CA
P 8750 6050
F 0 "J2" V 8823 5980 50  0000 C CNN
F 1 "Conn_01x10_Female" V 8914 5980 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 8750 6050 50  0001 C CNN
F 3 "~" H 8750 6050 50  0001 C CNN
	1    8750 6050
	0    -1   1    0   
$EndComp
$Comp
L RTC:DS3234S T1
U 1 1 5FAED5AF
P 10100 3700
F 0 "T1" H 10100 4565 50  0000 C CNN
F 1 "DS3234S" H 10100 4474 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 10000 4100 50  0001 C CNN
F 3 "" H 10000 4100 50  0001 C CNN
	1    10100 3700
	1    0    0    -1  
$EndComp
Text Label 10650 3400 0    50   ~ 0
SCLK
Wire Wire Line
	10500 3400 10550 3400
Wire Wire Line
	10500 3100 10550 3100
Wire Wire Line
	10550 3100 10550 3400
Wire Wire Line
	10650 3400 10550 3400
Connection ~ 10550 3400
Text Label 10650 3250 0    50   ~ 0
MISO
Wire Wire Line
	10650 3250 10500 3250
Text Label 10650 3550 0    50   ~ 0
MOSI
Wire Wire Line
	10650 3550 10500 3550
$Comp
L power:GND #PWR019
U 1 1 5FAEF7E1
P 9650 4550
F 0 "#PWR019" H 9650 4300 50  0001 C CNN
F 1 "GND" H 9655 4377 50  0000 C CNN
F 2 "" H 9650 4550 50  0001 C CNN
F 3 "" H 9650 4550 50  0001 C CNN
	1    9650 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4550 9650 4450
Wire Wire Line
	9650 3250 9700 3250
Wire Wire Line
	9700 4000 9650 4000
Connection ~ 9650 4000
Wire Wire Line
	9650 4000 9650 3250
Wire Wire Line
	9700 4150 9650 4150
Connection ~ 9650 4150
Wire Wire Line
	9650 4150 9650 4000
Wire Wire Line
	9700 4300 9650 4300
Connection ~ 9650 4300
Wire Wire Line
	9650 4300 9650 4150
Wire Wire Line
	9700 4450 9650 4450
Connection ~ 9650 4450
Wire Wire Line
	9650 4450 9650 4300
$Comp
L power:GND #PWR021
U 1 1 5FAF18AB
P 10550 4550
F 0 "#PWR021" H 10550 4300 50  0001 C CNN
F 1 "GND" H 10555 4377 50  0000 C CNN
F 2 "" H 10550 4550 50  0001 C CNN
F 3 "" H 10550 4550 50  0001 C CNN
	1    10550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 4550 10550 4450
Wire Wire Line
	10550 3850 10500 3850
Wire Wire Line
	10500 4000 10550 4000
Connection ~ 10550 4000
Wire Wire Line
	10550 4000 10550 3850
Wire Wire Line
	10500 4150 10550 4150
Connection ~ 10550 4150
Wire Wire Line
	10550 4150 10550 4000
Wire Wire Line
	10500 4300 10550 4300
Connection ~ 10550 4300
Wire Wire Line
	10550 4300 10550 4150
Wire Wire Line
	10500 4450 10550 4450
Connection ~ 10550 4450
Wire Wire Line
	10550 4450 10550 4300
$Comp
L power:+3.3V #PWR013
U 1 1 5FAF3EC1
P 8950 3500
F 0 "#PWR013" H 8950 3350 50  0001 C CNN
F 1 "+3.3V" H 8965 3673 50  0000 C CNN
F 2 "" H 8950 3500 50  0001 C CNN
F 3 "" H 8950 3500 50  0001 C CNN
	1    8950 3500
	1    0    0    -1  
$EndComp
Text Label 9500 3100 2    50   ~ 0
SS
Wire Wire Line
	9500 3100 9700 3100
Text Label 9600 3700 2    50   ~ 0
~INT
$Comp
L Device:CP C9
U 1 1 5FB05D25
P 11000 4150
F 0 "C9" H 11118 4196 50  0000 L CNN
F 1 "CP" H 11118 4105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D14.0mm_P5.00mm" H 11038 4000 50  0001 C CNN
F 3 "~" H 11000 4150 50  0001 C CNN
	1    11000 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 5FB0891A
P 11000 3450
F 0 "#PWR025" H 11000 3300 50  0001 C CNN
F 1 "+3.3V" H 11015 3623 50  0000 C CNN
F 2 "" H 11000 3450 50  0001 C CNN
F 3 "" H 11000 3450 50  0001 C CNN
	1    11000 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5FB09C49
P 11000 3600
F 0 "R15" V 10900 3600 50  0000 C CNN
F 1 "33" V 11000 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 11000 3600 50  0001 C CNN
F 3 "~" H 11000 3600 50  0001 C CNN
	1    11000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 3450 11000 3500
Wire Wire Line
	10550 4450 11000 4450
Wire Wire Line
	11000 4300 11000 4450
Wire Wire Line
	11000 4000 11000 3700
Wire Wire Line
	10500 3700 11000 3700
Connection ~ 11000 3700
$Comp
L Connector:Barrel_Jack J3
U 1 1 5FB1EE3B
P 9150 2400
F 0 "J3" H 9150 2600 50  0000 C CNN
F 1 "Barrel_Jack" H 9150 2200 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 9200 2360 50  0001 C CNN
F 3 "~" H 9200 2360 50  0001 C CNN
	1    9150 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5FB1FB7D
P 9650 2650
F 0 "#PWR018" H 9650 2400 50  0001 C CNN
F 1 "GND" H 9655 2477 50  0000 C CNN
F 2 "" H 9650 2650 50  0001 C CNN
F 3 "" H 9650 2650 50  0001 C CNN
	1    9650 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR016
U 1 1 5FB23C01
P 9550 2300
F 0 "#PWR016" H 9550 2150 50  0001 C CNN
F 1 "+12V" H 9565 2473 50  0000 C CNN
F 2 "" H 9550 2300 50  0001 C CNN
F 3 "" H 9550 2300 50  0001 C CNN
	1    9550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2300 9450 2300
$Comp
L Regulator_Linear:L78L05_TO92 U2
U 1 1 5FB2C264
P 10100 2300
F 0 "U2" H 10100 2542 50  0000 C CNN
F 1 "L78L05_TO92" H 10100 2451 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 10100 2525 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 10100 2250 50  0001 C CNN
	1    10100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 5FB31688
P 9650 2450
F 0 "C5" V 9550 2350 50  0000 L CNN
F 1 "47uF" V 9750 2350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 9650 2450 50  0001 C CNN
F 3 "~" H 9650 2450 50  0001 C CNN
	1    9650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2550 9650 2650
Wire Wire Line
	9650 2650 10100 2650
Wire Wire Line
	10100 2650 10100 2600
Wire Wire Line
	9650 2350 9650 2300
Wire Wire Line
	9650 2300 9800 2300
Wire Wire Line
	9450 2500 9450 2650
Connection ~ 9650 2650
$Comp
L Device:CP_Small C6
U 1 1 5FB38FDB
P 10550 2450
F 0 "C6" V 10450 2350 50  0000 L CNN
F 1 "47uF" V 10650 2350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 10550 2450 50  0001 C CNN
F 3 "~" H 10550 2450 50  0001 C CNN
	1    10550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 2300 10550 2350
Wire Wire Line
	10550 2550 10550 2650
Wire Wire Line
	10550 2650 10100 2650
Connection ~ 10100 2650
$Comp
L Device:C_Small C7
U 1 1 5FB3D611
P 10850 2450
F 0 "C7" V 10750 2350 50  0000 L CNN
F 1 "0.1uF" V 10950 2350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10850 2450 50  0001 C CNN
F 3 "~" H 10850 2450 50  0001 C CNN
	1    10850 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 2300 10850 2300
Wire Wire Line
	10850 2300 10850 2350
Connection ~ 10550 2300
Wire Wire Line
	10850 2550 10850 2650
Wire Wire Line
	10850 2650 10550 2650
Connection ~ 10550 2650
Wire Wire Line
	9550 2300 9650 2300
Connection ~ 9550 2300
Connection ~ 9650 2300
Wire Wire Line
	9450 2650 9650 2650
$Comp
L power:+5V #PWR023
U 1 1 5FB5BC49
P 10850 2300
F 0 "#PWR023" H 10850 2150 50  0001 C CNN
F 1 "+5V" H 10865 2473 50  0000 C CNN
F 2 "" H 10850 2300 50  0001 C CNN
F 3 "" H 10850 2300 50  0001 C CNN
	1    10850 2300
	1    0    0    -1  
$EndComp
Connection ~ 10850 2300
$Comp
L power:+5V #PWR05
U 1 1 5FB5C7BF
P 5650 2700
F 0 "#PWR05" H 5650 2550 50  0001 C CNN
F 1 "+5V" H 5665 2873 50  0000 C CNN
F 2 "" H 5650 2700 50  0001 C CNN
F 3 "" H 5650 2700 50  0001 C CNN
	1    5650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2750 6050 2750
Wire Wire Line
	5650 2700 5650 2750
$Comp
L power:+3.3V #PWR04
U 1 1 5FB69D57
P 5650 900
F 0 "#PWR04" H 5650 750 50  0001 C CNN
F 1 "+3.3V" H 5665 1073 50  0000 C CNN
F 2 "" H 5650 900 50  0001 C CNN
F 3 "" H 5650 900 50  0001 C CNN
	1    5650 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 900  5650 950 
NoConn ~ 6050 1150
NoConn ~ 6050 1250
Text Label 7100 1750 0    50   ~ 0
SCLK
Text Label 7100 1650 0    50   ~ 0
MISO
Text Label 7100 1050 0    50   ~ 0
MOSI
Text Label 7100 1850 0    50   ~ 0
SS
Wire Wire Line
	7100 1850 7050 1850
Wire Wire Line
	7050 1750 7100 1750
Wire Wire Line
	7050 1650 7100 1650
Wire Wire Line
	7050 1050 7100 1050
NoConn ~ 7050 1250
NoConn ~ 7050 1350
$Comp
L power:GND #PWR06
U 1 1 5FB7DB6C
P 7550 3000
F 0 "#PWR06" H 7550 2750 50  0001 C CNN
F 1 "GND" H 7555 2827 50  0000 C CNN
F 2 "" H 7550 3000 50  0001 C CNN
F 3 "" H 7550 3000 50  0001 C CNN
	1    7550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 950  7550 950 
Wire Wire Line
	7550 950  7550 1550
Wire Wire Line
	7050 1550 7550 1550
Connection ~ 7550 1550
Wire Wire Line
	7550 1550 7550 3000
NoConn ~ 7050 2750
$Comp
L power:GND #PWR03
U 1 1 5FB865A5
P 5450 2950
F 0 "#PWR03" H 5450 2700 50  0001 C CNN
F 1 "GND" H 5455 2777 50  0000 C CNN
F 2 "" H 5450 2950 50  0001 C CNN
F 3 "" H 5450 2950 50  0001 C CNN
	1    5450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2950 5450 2250
Wire Wire Line
	5450 2250 6050 2250
$Comp
L Switch:SW_Push_45deg SW3
U 1 1 5FB89952
P 10050 5650
F 0 "SW3" H 10050 5750 50  0000 C CNN
F 1 "SW" H 10000 5600 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 10050 5650 50  0001 C CNN
F 3 "~" H 10050 5650 50  0001 C CNN
	1    10050 5650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW4
U 1 1 5FB8A626
P 10300 5650
F 0 "SW4" H 10300 5750 50  0000 C CNN
F 1 "SW" H 10250 5600 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 10300 5650 50  0001 C CNN
F 3 "~" H 10300 5650 50  0001 C CNN
	1    10300 5650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW5
U 1 1 5FB8B009
P 10550 5650
F 0 "SW5" H 10550 5750 50  0000 C CNN
F 1 "SW" H 10500 5600 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 10550 5650 50  0001 C CNN
F 3 "~" H 10550 5650 50  0001 C CNN
	1    10550 5650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW6
U 1 1 5FB8B4FA
P 10800 5650
F 0 "SW6" H 10800 5750 50  0000 C CNN
F 1 "SW" H 10750 5600 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 10800 5650 50  0001 C CNN
F 3 "~" H 10800 5650 50  0001 C CNN
	1    10800 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 5FB8C7D6
P 10350 5500
F 0 "#PWR020" H 10350 5350 50  0001 C CNN
F 1 "+3.3V" H 10365 5673 50  0000 C CNN
F 2 "" H 10350 5500 50  0001 C CNN
F 3 "" H 10350 5500 50  0001 C CNN
	1    10350 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 5500 10700 5550
Wire Wire Line
	10450 5550 10450 5500
Connection ~ 10450 5500
Wire Wire Line
	10450 5500 10700 5500
Wire Wire Line
	10200 5550 10200 5500
Connection ~ 10200 5500
Wire Wire Line
	10200 5500 10350 5500
Wire Wire Line
	9950 5550 9950 5500
Wire Wire Line
	9950 5500 10200 5500
Connection ~ 10350 5500
Wire Wire Line
	10350 5500 10450 5500
$Comp
L Device:R_Small R7
U 1 1 5FB97A3A
P 10150 6000
F 0 "R7" V 10250 6000 50  0000 C CNN
F 1 "10k" V 10150 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 6000 50  0001 C CNN
F 3 "~" H 10150 6000 50  0001 C CNN
	1    10150 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5FB9963A
P 10400 6000
F 0 "R10" V 10500 6000 50  0000 C CNN
F 1 "10k" V 10400 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10400 6000 50  0001 C CNN
F 3 "~" H 10400 6000 50  0001 C CNN
	1    10400 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5FB99CE5
P 10650 6000
F 0 "R13" V 10750 6000 50  0000 C CNN
F 1 "10k" V 10650 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10650 6000 50  0001 C CNN
F 3 "~" H 10650 6000 50  0001 C CNN
	1    10650 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5FB9A17B
P 10900 6000
F 0 "R14" V 11000 6000 50  0000 C CNN
F 1 "10k" V 10900 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10900 6000 50  0001 C CNN
F 3 "~" H 10900 6000 50  0001 C CNN
	1    10900 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	10900 5900 10900 5750
Wire Wire Line
	10650 5750 10650 5900
Wire Wire Line
	10400 5900 10400 5750
Wire Wire Line
	10150 5750 10150 5900
$Comp
L power:GND #PWR022
U 1 1 5FBA5847
P 10550 6150
F 0 "#PWR022" H 10550 5900 50  0001 C CNN
F 1 "GND" H 10555 5977 50  0000 C CNN
F 2 "" H 10550 6150 50  0001 C CNN
F 3 "" H 10550 6150 50  0001 C CNN
	1    10550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 6100 10150 6150
Wire Wire Line
	10150 6150 10400 6150
Wire Wire Line
	10400 6100 10400 6150
Connection ~ 10400 6150
Wire Wire Line
	10900 6150 10900 6100
Wire Wire Line
	10650 6100 10650 6150
Connection ~ 10650 6150
Wire Wire Line
	10650 6150 10900 6150
Connection ~ 10550 6150
Wire Wire Line
	10550 6150 10650 6150
Wire Wire Line
	10400 6150 10550 6150
Text Label 10150 5900 2    50   ~ 0
SW_ACCEPT
Text Label 10400 5850 2    50   ~ 0
SW_BACK
Text Label 10650 5900 0    50   ~ 0
SW_P
Text Label 10900 5850 0    50   ~ 0
SW_N
$Comp
L Switch:SW_Push SW2
U 1 1 5FBC4B27
P 8500 3900
F 0 "SW2" V 8546 3852 50  0000 R CNN
F 1 "SW_Push" V 8450 3850 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 8500 4100 50  0001 C CNN
F 3 "~" H 8500 4100 50  0001 C CNN
	1    8500 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5FBC8167
P 9250 3700
F 0 "C3" V 9350 3650 50  0000 L CNN
F 1 "0.1uF" V 9150 3550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 3700 50  0001 C CNN
F 3 "~" H 9250 3700 50  0001 C CNN
	1    9250 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 3700 8200 3600
Wire Wire Line
	8200 3600 8500 3600
Wire Wire Line
	8500 3600 8500 3550
Wire Wire Line
	8500 3700 8500 3600
Connection ~ 8500 3600
Wire Wire Line
	8200 4150 8500 4150
Wire Wire Line
	8500 4150 8500 4100
$Comp
L power:GND #PWR011
U 1 1 5FBD41C5
P 8500 4250
F 0 "#PWR011" H 8500 4000 50  0001 C CNN
F 1 "GND" H 8505 4077 50  0000 C CNN
F 2 "" H 8500 4250 50  0001 C CNN
F 3 "" H 8500 4250 50  0001 C CNN
	1    8500 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4250 8500 4150
Connection ~ 8500 4150
Text Label 8550 3600 0    50   ~ 0
RTC_~RST
Wire Wire Line
	8550 3600 8500 3600
Text Label 9600 3850 2    50   ~ 0
RTC_~RST
$Comp
L Device:R_Small R2
U 1 1 5FBC7530
P 8500 3450
F 0 "R2" V 8600 3450 50  0000 C CNN
F 1 "10k" V 8500 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8500 3450 50  0001 C CNN
F 3 "~" H 8500 3450 50  0001 C CNN
	1    8500 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 3900 8200 4150
$Comp
L power:+3.3V #PWR010
U 1 1 5FBEDCEA
P 8500 3300
F 0 "#PWR010" H 8500 3150 50  0001 C CNN
F 1 "+3.3V" H 8515 3473 50  0000 C CNN
F 2 "" H 8500 3300 50  0001 C CNN
F 3 "" H 8500 3300 50  0001 C CNN
	1    8500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3300 8500 3350
$Comp
L Switch:SW_Push SW1
U 1 1 5FC003D5
P 5150 1550
F 0 "SW1" V 5196 1502 50  0000 R CNN
F 1 "SW_Push" V 5100 1500 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 5150 1750 50  0001 C CNN
F 3 "~" H 5150 1750 50  0001 C CNN
	1    5150 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 1350 5150 1250
$Comp
L power:GND #PWR02
U 1 1 5FC003E8
P 5150 1900
F 0 "#PWR02" H 5150 1650 50  0001 C CNN
F 1 "GND" H 5155 1727 50  0000 C CNN
F 2 "" H 5150 1900 50  0001 C CNN
F 3 "" H 5150 1900 50  0001 C CNN
	1    5150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1250 5150 1250
Text Label 5200 1250 0    50   ~ 0
EN
Text Label 6000 1050 2    50   ~ 0
EN
Wire Wire Line
	6000 1050 6050 1050
$Comp
L Device:L_Small L1
U 1 1 5FC20B75
P 9100 3550
F 0 "L1" V 9150 3550 50  0000 C CNN
F 1 "10u" V 9050 3550 50  0000 C CNN
F 2 "Inductor_SMD:L_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9100 3550 50  0001 C CNN
F 3 "~" H 9100 3550 50  0001 C CNN
	1    9100 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 3550 9250 3550
Wire Wire Line
	9250 3600 9250 3550
Wire Wire Line
	9250 3800 9250 4000
$Comp
L Device:C_Small C2
U 1 1 5FC3C882
P 8200 3800
F 0 "C2" V 8100 3700 50  0000 L CNN
F 1 "0.1uF" V 8300 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 3800 50  0001 C CNN
F 3 "~" H 8200 3800 50  0001 C CNN
	1    8200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 3850 9700 3850
Wire Wire Line
	9600 3700 9700 3700
Wire Wire Line
	9250 3550 9700 3550
Connection ~ 9250 3550
Wire Wire Line
	9250 4000 9650 4000
Wire Wire Line
	8950 3500 8950 3550
Wire Wire Line
	8950 3550 9000 3550
$Comp
L Device:R_Small R4
U 1 1 5FCB4DB3
P 8650 1000
F 0 "R4" V 8600 850 50  0000 C CNN
F 1 "680" V 8650 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8650 1000 50  0001 C CNN
F 3 "~" H 8650 1000 50  0001 C CNN
	1    8650 1000
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR09
U 1 1 5FCB6BAA
P 8350 750
F 0 "#PWR09" H 8350 600 50  0001 C CNN
F 1 "+12V" H 8365 923 50  0000 C CNN
F 2 "" H 8350 750 50  0001 C CNN
F 3 "" H 8350 750 50  0001 C CNN
	1    8350 750 
	1    0    0    -1  
$EndComp
$Comp
L dcdc:NJM2360A_2 D1
U 1 1 5FCD5350
P 9050 1200
F 0 "D1" H 8900 1500 50  0000 C CNN
F 1 "NJM2360A_2" H 9050 900 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9000 1000 50  0001 C CNN
F 3 "" H 9000 1000 50  0001 C CNN
	1    9050 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5FCD79E0
P 8550 1000
F 0 "R3" V 8500 850 50  0000 C CNN
F 1 "100" V 8550 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8550 1000 50  0001 C CNN
F 3 "~" H 8550 1000 50  0001 C CNN
	1    8550 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5FCD8380
P 8700 1750
F 0 "R5" V 8800 1750 50  0000 C CNN
F 1 "220" V 8700 1750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8700 1750 50  0001 C CNN
F 3 "~" H 8700 1750 50  0001 C CNN
	1    8700 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8650 1100 8650 1250
Wire Wire Line
	8650 1250 8750 1250
Wire Wire Line
	8700 1350 8750 1350
$Comp
L power:GND #PWR012
U 1 1 5FCF1CB8
P 8700 1900
F 0 "#PWR012" H 8700 1650 50  0001 C CNN
F 1 "GND" H 8705 1727 50  0000 C CNN
F 2 "" H 8700 1900 50  0001 C CNN
F 3 "" H 8700 1900 50  0001 C CNN
	1    8700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1350 9400 1350
$Comp
L Device:R_Small R6
U 1 1 5FD006FF
P 9050 800
F 0 "R6" V 9150 800 50  0000 C CNN
F 1 "0.1" V 9050 800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" H 9050 800 50  0001 C CNN
F 3 "~" H 9050 800 50  0001 C CNN
	1    9050 800 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 800  8650 900 
Connection ~ 8650 800 
Wire Wire Line
	8650 800  8750 800 
Wire Wire Line
	8750 1050 8750 800 
Connection ~ 8750 800 
Wire Wire Line
	8750 800  8950 800 
Wire Wire Line
	9450 1050 9400 1050
$Comp
L Device:Q_NJFET_GDS Q1
U 1 1 5FD32783
P 9700 1600
F 0 "Q1" V 9650 1400 50  0000 L CNN
F 1 "2sk3234" V 9900 1450 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 9900 1700 50  0001 C CNN
F 3 "~" H 9700 1600 50  0001 C CNN
	1    9700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1350 8700 1600
Wire Wire Line
	8700 1900 8700 1850
Wire Wire Line
	9450 1350 9450 1900
Wire Wire Line
	9450 1900 8700 1900
Connection ~ 8700 1900
Connection ~ 9450 1900
$Comp
L Device:C_Small C4
U 1 1 5FD66B21
P 9600 1400
F 0 "C4" V 9650 1450 50  0000 L CNN
F 1 "100p" V 9500 1300 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 9600 1400 50  0001 C CNN
F 3 "~" H 9600 1400 50  0001 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1300 9600 1250
Wire Wire Line
	9600 1250 9400 1250
Wire Wire Line
	9600 1500 9600 1900
Wire Wire Line
	9600 1900 9450 1900
Wire Wire Line
	9500 1600 8700 1600
Connection ~ 8700 1600
Wire Wire Line
	8700 1600 8700 1650
Wire Wire Line
	9800 1400 9800 800 
Wire Wire Line
	9800 800  9900 800 
Wire Wire Line
	9800 1800 9800 1900
Wire Wire Line
	9800 1900 9600 1900
Connection ~ 9600 1900
$Comp
L Device:R_Small R8
U 1 1 5FD92B5D
P 10300 1050
F 0 "R8" V 10400 1050 50  0000 C CNN
F 1 "470k" V 10200 1050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10300 1050 50  0001 C CNN
F 3 "~" H 10300 1050 50  0001 C CNN
	1    10300 1050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5FD95F10
P 10300 1300
F 0 "RV1" H 10230 1254 50  0000 R CNN
F 1 "5k" H 10200 1350 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Vishay_T73YP_Vertical" H 10300 1300 50  0001 C CNN
F 3 "~" H 10300 1300 50  0001 C CNN
	1    10300 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5FDA1713
P 10300 1600
F 0 "R9" V 10400 1600 50  0000 C CNN
F 1 "2.2k" V 10200 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10300 1600 50  0001 C CNN
F 3 "~" H 10300 1600 50  0001 C CNN
	1    10300 1600
	-1   0    0    1   
$EndComp
Connection ~ 9800 1900
$Comp
L Device:D_Schottky D2
U 1 1 5FDBB903
P 10050 800
F 0 "D2" H 10050 583 50  0000 C CNN
F 1 "SCS206AGC" H 10050 674 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-2_Horizontal_TabDown" H 10050 800 50  0001 C CNN
F 3 "~" H 10050 800 50  0001 C CNN
	1    10050 800 
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C8
U 1 1 5FDBD5B0
P 11000 1350
F 0 "C8" V 10950 1200 50  0000 L CNN
F 1 "4.7uF/250-350V" V 11150 1000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 11038 1200 50  0001 C CNN
F 3 "~" H 11000 1350 50  0001 C CNN
	1    11000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 1500 11000 1900
Wire Wire Line
	10200 800  10300 800 
Wire Wire Line
	9800 1900 10300 1900
Wire Wire Line
	10300 950  10300 800 
Connection ~ 10300 800 
Wire Wire Line
	10300 1700 10300 1900
Connection ~ 10300 1900
Wire Wire Line
	10300 1500 10300 1450
Wire Wire Line
	10150 1300 9950 1300
Wire Wire Line
	9950 1300 9950 1150
Wire Wire Line
	9950 1150 9400 1150
$Comp
L power:HT #PWR024
U 1 1 5FDFDDFE
P 11000 750
F 0 "#PWR024" H 11000 870 50  0001 C CNN
F 1 "HT" H 11020 893 50  0000 C CNN
F 2 "" H 11000 750 50  0001 C CNN
F 3 "" H 11000 750 50  0001 C CNN
	1    11000 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 750  8350 800 
Wire Wire Line
	8350 800  8550 800 
Wire Wire Line
	8550 900  8550 800 
Connection ~ 8550 800 
Wire Wire Line
	8550 800  8650 800 
Wire Wire Line
	8550 1100 8550 1150
Wire Wire Line
	8550 1150 8750 1150
Text Notes 10650 800  0    50   ~ 0
67-216\n
Text Label 6000 1350 2    50   ~ 0
DRCLK
Text Label 6000 1450 2    50   ~ 0
DCLK
Text Label 6000 1550 2    50   ~ 0
DSER
Text Label 6000 1650 2    50   ~ 0
SER
Text Label 6000 1750 2    50   ~ 0
SRCLK
Text Label 6000 1850 2    50   ~ 0
SRCLR
Text Label 6000 1950 2    50   ~ 0
RCLK
Wire Wire Line
	6000 1350 6050 1350
Wire Wire Line
	6050 1450 6000 1450
Wire Wire Line
	6000 1550 6050 1550
Wire Wire Line
	6050 1650 6000 1650
Wire Wire Line
	6000 1750 6050 1750
Wire Wire Line
	6000 1850 6050 1850
Wire Wire Line
	6050 1950 6000 1950
Wire Wire Line
	11000 750  11000 800 
Wire Wire Line
	10300 800  10450 800 
Connection ~ 11000 800 
Wire Wire Line
	11000 800  11000 1200
Wire Wire Line
	10300 1900 10650 1900
Text Label 6000 2050 2    50   ~ 0
DCDC_Vol
Wire Wire Line
	6000 2050 6050 2050
Text Label 10850 1300 1    50   ~ 0
DCDC_Vol
$Comp
L Device:R_Small R12
U 1 1 5FF42643
P 10650 1600
F 0 "R12" V 10750 1600 50  0000 C CNN
F 1 "7k" V 10550 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10650 1600 50  0001 C CNN
F 3 "~" H 10650 1600 50  0001 C CNN
	1    10650 1600
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5FF42C36
P 10650 1050
F 0 "R11" V 10750 1050 50  0000 C CNN
F 1 "470k" V 10550 1050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10650 1050 50  0001 C CNN
F 3 "~" H 10650 1050 50  0001 C CNN
	1    10650 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	10650 1150 10650 1300
Wire Wire Line
	10650 1700 10650 1900
Connection ~ 10650 1900
Wire Wire Line
	10650 1900 11000 1900
Wire Wire Line
	10650 950  10650 800 
Connection ~ 10650 800 
Wire Wire Line
	10650 800  11000 800 
Wire Wire Line
	10850 1300 10650 1300
Connection ~ 10650 1300
Wire Wire Line
	10650 1300 10650 1500
NoConn ~ 6050 2450
NoConn ~ 6050 2550
NoConn ~ 6050 2650
NoConn ~ 7050 2650
NoConn ~ 7050 2550
$Comp
L Device:L_Small L2
U 1 1 5FFFD8E1
P 9650 800
F 0 "L2" V 9700 800 50  0000 C CNN
F 1 "220uH/2A" V 9800 850 50  0000 C CNN
F 2 "Inductor_THT:L_Toroid_Vertical_L16.0mm_W8.0mm_P7.62mm" H 9650 800 50  0001 C CNN
F 3 "~" H 9650 800 50  0001 C CNN
	1    9650 800 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9750 800  9800 800 
Connection ~ 9800 800 
Wire Wire Line
	9550 800  9450 800 
Wire Wire Line
	9450 1050 9450 800 
Connection ~ 9450 800 
Wire Wire Line
	9450 800  9150 800 
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6001D7C9
P 10450 800
F 0 "#FLG01" H 10450 875 50  0001 C CNN
F 1 "PWR_FLAG" H 10450 973 50  0000 C CNN
F 2 "" H 10450 800 50  0001 C CNN
F 3 "~" H 10450 800 50  0001 C CNN
	1    10450 800 
	1    0    0    -1  
$EndComp
Connection ~ 10450 800 
Wire Wire Line
	10450 800  10650 800 
$Comp
L Connector:Conn_01x05_Female J1
U 1 1 6001E7F3
P 8250 1900
F 0 "J1" V 8400 1850 50  0000 L CNN
F 1 "GPS" V 8300 1850 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8250 1900 50  0001 C CNN
F 3 "~" H 8250 1900 50  0001 C CNN
	1    8250 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 600350F9
P 8000 1650
F 0 "#PWR08" H 8000 1500 50  0001 C CNN
F 1 "+5V" H 8015 1823 50  0000 C CNN
F 2 "" H 8000 1650 50  0001 C CNN
F 3 "" H 8000 1650 50  0001 C CNN
	1    8000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1650 8000 1700
Wire Wire Line
	8000 1700 8050 1700
Text Label 7100 1950 0    50   ~ 0
TX
Text Label 7100 2050 0    50   ~ 0
RX
Text Label 8000 1900 2    50   ~ 0
TX
Text Label 8000 2000 2    50   ~ 0
RX
Wire Wire Line
	8000 1900 8050 1900
Wire Wire Line
	8050 2000 8000 2000
$Comp
L power:GND #PWR07
U 1 1 60084792
P 7900 2150
F 0 "#PWR07" H 7900 1900 50  0001 C CNN
F 1 "GND" H 7905 1977 50  0000 C CNN
F 2 "" H 7900 2150 50  0001 C CNN
F 3 "" H 7900 2150 50  0001 C CNN
	1    7900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2150 7900 1800
Wire Wire Line
	7900 1800 8050 1800
Text Label 8000 2100 2    50   ~ 0
1PPS
Wire Wire Line
	8000 2100 8050 2100
Text Label 7100 1150 0    50   ~ 0
1PPS
Wire Wire Line
	7100 1150 7050 1150
Wire Wire Line
	7100 1950 7050 1950
Wire Wire Line
	7050 2050 7100 2050
$Comp
L components:ESP32-DEVKITC-32D U1
U 1 1 5FAD8057
P 6550 1850
F 0 "U1" H 6550 2975 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 6550 2884 50  0000 C CNN
F 2 "nixieLogicV2:espWroom32devKit-C" H 6850 1700 50  0001 C CNN
F 3 "" H 6850 1700 50  0001 C CNN
	1    6550 1850
	1    0    0    -1  
$EndComp
Text Label 6000 2150 2    50   ~ 0
SW_ACCEPT
Text Label 6000 2350 2    50   ~ 0
SW_BACK
Wire Wire Line
	6000 2350 6050 2350
Wire Wire Line
	6050 2150 6000 2150
Text Label 7100 1450 0    50   ~ 0
SW_P
Wire Wire Line
	7100 1450 7050 1450
Text Label 7100 2450 0    50   ~ 0
SW_N
Wire Wire Line
	7100 2450 7050 2450
NoConn ~ 7050 2350
NoConn ~ 7050 2250
NoConn ~ 7050 2150
Wire Wire Line
	5650 950  6050 950 
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 6012257F
P 9650 2300
F 0 "#FLG0101" H 9650 2375 50  0001 C CNN
F 1 "PWR_FLAG" H 9650 2473 50  0000 C CNN
F 2 "" H 9650 2300 50  0001 C CNN
F 3 "~" H 9650 2300 50  0001 C CNN
	1    9650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2300 10550 2300
$Comp
L power:GNDPWR #PWR0101
U 1 1 60124CEA
P 10550 2650
F 0 "#PWR0101" H 10550 2450 50  0001 C CNN
F 1 "GNDPWR" H 10554 2496 50  0000 C CNN
F 2 "" H 10550 2600 50  0001 C CNN
F 3 "" H 10550 2600 50  0001 C CNN
	1    10550 2650
	1    0    0    -1  
$EndComp
NoConn ~ 9700 3700
NoConn ~ 9700 3400
NoConn ~ 8500 2700
Wire Wire Line
	5150 1750 5150 1900
$EndSCHEMATC
