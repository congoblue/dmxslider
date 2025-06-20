/**
 * ----------------------------------------------------------------------------
 * DMX slider unit
 * ----------------------------------------------------------------------------
 */

#include <Arduino.h>
#include <EEPROM.h>
#include "global.h"
#include "dmx.h"
#include "main.h"



// ----------------------------------------------------------------------------
// globals
// ----------------------------------------------------------------------------


uint8_t TxBuf[512]={0};
uint8_t AvBuf[64]={0};
uint32_t AvPtr=0;



// ----------------------------------------------------------------------------
// Initialization
// ----------------------------------------------------------------------------

void setup() {
    char buf[32];
    int es;

    Serial.begin(115200);

    pinMode(18, OUTPUT); //red/green led 
    pinMode(34, ANALOG);

    DMX::Initialize();
    DMX::SetDirection(output);

    delay(1000);

    for (uint32_t i=0; i<5; i++)
    {
        digitalWrite(18,0);
        delay(100);
        digitalWrite(18,1);
        delay(100);
    }

    TxBuf[2]=35; //sets output to warm white
    TxBuf[3]=255; //sets shutter to open

}

// ----------------------------------------------------------------------------
// Main control loop
// ----------------------------------------------------------------------------

void loop() {
    uint32_t i=0, av=0,v; 
    #define AVERAGE 32

    v=(analogRead(34)/16); //adc is 12 bit
    AvBuf[AvPtr]=v; //write into the average buffer
    AvPtr++; if (AvPtr>=AVERAGE) AvPtr=0; //move the average buffer pointer on
    av=0; for (i=0; i<AVERAGE; i++) av+=AvBuf[i];
    av=av/AVERAGE; //work out the average reading
    TxBuf[1]=av;  //set to the dimmer channel
    DMX::WriteAll(&TxBuf[1],1,512);  //update the DMX output
    //Serial.print(av);Serial.println(" ");
    delay(20);

}