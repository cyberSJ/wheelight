#include <pic14/pic16f887.h>
#include <stdint.h> // for uint16_t

//__CONFIG (_WDT_ON);
//#pragma config WRT = OFF

// this works! Copied from the sdcc manual pdf from the sdcc main website.
static __code uint16_t __at (_CONFIG1) configword1 = _WDT_ON; 

void main(void)
{
    // Set ANSEL ANSELH to 0 to allow digital I/O
    ANSEL = 0x00;
    ANSELH = 0x00;

    TRISD = 0x0;
    TRISD0 = 0x0;
    TRISD1 = 0x0;
    TRISD2 = 0x0;
    TRISD3 = 0x0;
    TRISD4 = 0x0;
    TRISD5 = 0x0;
    TRISD6 = 0x0;
    TRISD7 = 0x0;

    while (1)
    {
        PORTD = 0xFF;
        RD0 = 1;
        RD1 = 1;
        RD2 = 1;
        RD3 = 1;
        RD4 = 1;
        RD5 = 1;
        RD6 = 1;
        RD7 = 1;
    }
}
