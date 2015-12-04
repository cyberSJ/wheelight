#include <pic14/pic16f887.h>
#include <stdint.h> // for uint16_t

// compile using:
// sdcc --use-non-free -mpic14 -p16f887 blink.c
//
// Load to PIC:
// pk2cmd -p pic16f887 -f blink.hex -m
//
// Run the program in PIC:
// pk2cmd -p pic16f887 -A3 -T
//
// Or load and run at the same time:
// pk2cmd -p pic16f887 -f blink.hex -m -A4 -T

// It is not necessary to configure _CONFIG2. This line is not tested.
//static __code uint16_t __at (_CONFIG2) configword2 = 0x2FFF; 
    
// "static __code" is not necessary.
static __code uint16_t __at _CONFIG1 configword1 = 
    _INTRC_OSC_NOCLKOUT & 
    _WDT_OFF & 
    _PWRTE_OFF & 
    _MCLRE_OFF & 
    _CP_OFF & 
    _BOR_OFF & 
    _IESO_OFF & 
    _FCMEN_OFF; 

// It doesn't work with only these two configuration options.
//static __code uint16_t __at (_CONFIG1) configword1 = 
//    _WDTE_OFF &
//    _LVP_OFF;

int i;

void delay() 
{
    int counter = 0;
    for (counter = 0; counter<10000; counter++) 
    {
    }
}

void main(void)
{
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
