/* 
 * File:   main.c
 * Author: npendlet
 *
 * Created on August 6, 2012, 4:11 PM
 */

//#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

// PIC16LF1827 Configuration Bit Settings

__CONFIG(FOSC_INTOSC & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_ON & CLKOUTEN_OFF & IESO_ON & FCMEN_ON);
__CONFIG(WRT_OFF & PLLEN_ON & STVREN_ON & BORV_LO & LVP_OFF);


#define DIGIT_1_CTL LATAbits.LATA1
#define DIGIT_2_CTL LATAbits.LATA7
#define LED_A_CTL   LATBbits.LATB1
#define LED_B_CTL   LATBbits.LATB3
#define LED_C_CTL   LATAbits.LATA6
#define LED_D_CTL   LATBbits.LATB5
#define LED_E_CTL   LATAbits.LATA4
#define LED_F_CTL   LATBbits.LATB2
#define LED_G_CTL   LATBbits.LATB0
#define LED_H_CTL   LATAbits.LATA2
#define LED_I_CTL   LATAbits.LATA0
#define LED_J_CTL   LATAbits.LATA3

#define DIGIT_1_ON      (DIGIT_1_CTL = 1)
#define DIGIT_1_OFF     (DIGIT_1_CTL = 0)
#define DIGIT_2_ON      (DIGIT_2_CTL = 1)
#define DIGIT_2_OFF     (DIGIT_2_CTL = 0)

#define DIGIT_3_ONE_ON  (LED_H_CTL = 1, LED_J_CTL = 1)
#define DIGIT_3_ONE_OFF (LED_H_CTL = 0, LED_J_CTL = 0)
#define DIGIT_3_NEG_ON  (LED_I_CTL = 1)
#define DIGIT_3_NEG_OFF  (LED_I_CTL = 0)

//config port pins
void config_port(void)
{
    //initialize ports
    PORTA = 0;
    LATA = 0;
    ANSELA = 0;
    TRISA = 0b00100000;     // A0, A1, A2, A3, A4, A6, A7, output

    PORTB = 0;
    LATB = 0;
    TRISB = 0b11010000;     // B0, B1, B2, B3, B4, B5, output
    ANSELBbits.ANSB4 = 1;   // B4 is analog input
}

//config clock
void config_clock(void)
{
    OSCCONbits.IRCF = 0b1111;   //HF internal osc @ 16MHz
    
}

//config adc
void config_adc(unsigned long *adcCal)
{
    unsigned int measureFvr;
    unsigned long microV_Count = 2095104000;  //2.048*1023*1000000

    //initialize ADC
    ADCON0bits.ADON = 0;    //disable adc
    FVRCONbits.ADFVR = 0b10;    //fvr @ 2.048V
    FVRCONbits.FVREN = 1;   //enable the peripheral, don't need to wait for it


    ADCON1bits.ADNREF = 0;  //Vref- is gnd
    ADCON1bits.ADPREF = 0b00;   //Vref+ is Vdd
    ADCON1bits.ADCS = 0b101;    //conversion clock is Fosc/16 for Fosc=16MHz
    ADCON1bits.ADFM = 1;    //result is right-justified

    ADCON0bits.CHS = 0b11111;   //select FVR channel
    ADCON0bits.ADON = 1;    //enable adc

    // small delay for channel switch
    for(measureFvr=0;measureFvr<20;measureFvr++){
    }

    ADCON0bits.GO = 1;      //start conversion, GO/DONE = 1
    while (ADCON0bits.GO);  //wait for conversion
    measureFvr = ((ADRESH << 8 ) + ADRESL);

    // calculate micro-volts per adc count
    microV_Count = microV_Count / measureFvr;
    //multiply by 10-bits of adc range to get full range microvolts
    microV_Count = microV_Count;

    *adcCal = microV_Count;

    ADCON0bits.CHS = 0b01000;   //select channel AN8, on pin B4
    // small delay for channel switch
    for(measureFvr=0;measureFvr<20;measureFvr++){
    }
}


//read ADC
unsigned int ADCRead(void)
{
    ADCON0bits.GO = 1;      //start conversion, GO/DONE = 1
    while (ADCON0bits.GO);  //wait for conversion
    return ((ADRESH << 8 ) + ADRESL);
}

//set the seven-segment control pins to a particular decimal digit, 0-9
void set_sevenseg(unsigned char digit)
{
    // check parameter
    if(digit > 9){
        return;
    }

    switch(digit){
        default:
            LED_A_CTL = 0;
            LED_B_CTL = 0;
            LED_C_CTL = 0;
            LED_D_CTL = 0;
            LED_E_CTL = 0;
            LED_F_CTL = 0;
            LED_G_CTL = 0;
            break;
        case 0:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 1;
            LED_F_CTL = 1;
            LED_G_CTL = 0;
            break;
        case 1:
            LED_A_CTL = 0;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 0;
            LED_E_CTL = 0;
            LED_F_CTL = 0;
            LED_G_CTL = 0;
            break;
        case 2:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 0;
            LED_D_CTL = 1;
            LED_E_CTL = 1;
            LED_F_CTL = 0;
            LED_G_CTL = 1;
            break;
        case 3:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 0;
            LED_F_CTL = 0;
            LED_G_CTL = 1;
            break;
        case 4:
            LED_A_CTL = 0;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 0;
            LED_E_CTL = 0;
            LED_F_CTL = 1;
            LED_G_CTL = 1;
            break;
        case 5:
            LED_A_CTL = 1;
            LED_B_CTL = 0;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 0;
            LED_F_CTL = 1;
            LED_G_CTL = 1;
            break;
        case 6:
            LED_A_CTL = 1;
            LED_B_CTL = 0;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 1;
            LED_F_CTL = 1;
            LED_G_CTL = 1;
            break;
        case 7:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 0;
            LED_E_CTL = 0;
            LED_F_CTL = 0;
            LED_G_CTL = 0;
            break;
        case 8:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 1;
            LED_F_CTL = 1;
            LED_G_CTL = 1;
            break;
        case 9:
            LED_A_CTL = 1;
            LED_B_CTL = 1;
            LED_C_CTL = 1;
            LED_D_CTL = 1;
            LED_E_CTL = 0;
            LED_F_CTL = 1;
            LED_G_CTL = 1;
            break;
    }

}

void delaysome(void)
{
    unsigned int delayawhile;
    for(delayawhile=0;delayawhile < 200;){
        delayawhile++;
    }
}

#define ADC_BUFFER 16

typedef struct adc_s {
    unsigned char in;
    unsigned long sum;
    unsigned int data[ADC_BUFFER];
    unsigned int avg;
    unsigned long cal;
}adc_t;

/*
 * 
 */
int main(int argc, char** argv) {
    adc_t adc = {
        0,
        0
    };

    unsigned char readyToDisplay = 0;
    unsigned char digit1=0, digit2=0, digit3=0;
    unsigned int updateadc = 0;
    unsigned long microVolts;
    unsigned long temperature;

    // init
    config_clock();
    config_port();
    config_adc(&adc.cal);

    // wait a bit for temperature sensor to stabilize
    for(updateadc=0;updateadc<200;){
        updateadc++;
    }

    //use a single read of the adc to initialize the data array
    adc.avg = ADCRead();
    adc.sum = adc.avg * ADC_BUFFER;
    for(updateadc=0;updateadc<ADC_BUFFER;updateadc++){
        adc.data[updateadc] = adc.avg;
    }

    while(1){
        if(!readyToDisplay){
            if(updateadc-- == 0){
                updateadc = 5;

                //re-cal adc every time, as Vdd may have changed now that it's
                //loaded
                config_adc(&adc.cal);

                adc.sum -= adc.data[adc.in];
                adc.data[adc.in] = ADCRead();
                adc.sum  += adc.data[adc.in];
                adc.avg = adc.sum / ADC_BUFFER;
                adc.in++;
                adc.in %= ADC_BUFFER;

                if(adc.in == 0){
                    readyToDisplay = 1;
                }

                microVolts = (adc.cal * adc.avg);
                microVolts /= 1023;
            }
        }

        // from TMP20 datasheet, for range -40 to +85 °C,
        // Vout = -11.67mv/°C*T+1.8583V
        temperature = 1858300 - microVolts;
        temperature /= 1167;    //tenths of C
        temperature = (temperature * 9L + 1600L);
        if((temperature % 5) > 2){
            temperature += 2;
        }
        temperature /= 5L;


        // set display
        digit1 = (temperature / 100) % 10;
        digit2 = (temperature / 10) % 10;
        digit3 = temperature / 1000;

        if(readyToDisplay){
            set_sevenseg(digit1);
            DIGIT_1_ON;
            if(digit3){
                DIGIT_3_ONE_ON;
            }
            delaysome();

            DIGIT_1_OFF;
            DIGIT_3_ONE_OFF;
            set_sevenseg(digit2);
            DIGIT_2_ON;
            delaysome();
            DIGIT_2_OFF;
            delaysome();
            delaysome();
        }
    }

    return (EXIT_SUCCESS);
}
