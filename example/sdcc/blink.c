#include <pic14/pic16f887.h>
#include <stdint.h> // for uint16_t

/*
Wirtten on Thursday December 3rd, 2015.
Blinks the LEDs on the 44-pin demo board populated with PIC16F887.

Compile using:
sdcc --use-non-free -mpic14 -p16f887 blink.c

Source configuration before using pk2cmd:
source ../../config/environment.bashrc

Load to PIC:
pk2cmd -p pic16f887 -f blink.hex -m

Run the program in PIC:
pk2cmd -p pic16f887 -A3 -T

Or load and run at the same time:
pk2cmd -p pic16f887 -f blink.hex -m -A4 -T

To power down the MCU:
pk2cmd -p pic16f887 -R
*/

//It is not necessary to configure _CONFIG2. This line is not tested.
//static __code uint16_t __at (_CONFIG2) configword2 = 0x2FFF; 
    
// "static __code" is not necessary.
// sung use cmake
static __code uint16_t __at _CONFIG1 configword1 = 
    _BOR_OFF &              // needed: Brown-out Reset.Brown-out detection NOT used
    _INTRC_OSC_NOCLKOUT &   // needed
    _MCLRE_OFF;             // needed: Internal MCLR.  RA3 is digital input
    //_CP_OFF &             // not a must
    //_FCMEN_OFF &          // not a must: Fail-safe clock monitor disabled.
    //_IESO_OFF &           // not a must: Clock switchover disabled (locked on Internal clock).
    //_PWRTE_OFF &          // not a must: Enable power-up delay timer. Probably not necessary, but it can't hurt.
    //_WDT_OFF;             // not a must: Watchdog Timer disabled.

// It doesn't work with only these two configuration options.
//static __code uint16_t __at (_CONFIG1) configword1 = 
//    _WDTE_OFF &
//    _LVP_OFF;

void delay() 
{
    int counter = 0;
    for (counter = 0; counter<10000; counter++) 
    {
    }
}

void main(void)
{
    // One example say these bits are necessary:
    // http://electronics.stackexchange.com/questions/23712/need-help-with-16f887-and-microchips-44-pin-demo-board
    // but my application doesn't seem to require it:
    // Set ANSEL ANSELH to 0 to allow digital I/O
    //ANSEL = 0x00;
    //ANSELH = 0x00;

    TRISD = 0x0;
    while (1)
    {
        delay();
        PORTD = 0xf0;
        delay();
        PORTD = 0x00;
    }
}
