#include <pic14/pic16f887.h>
#include <stdint.h> // for uint16_t

//__CONFIG (_WDT_ON);
//#pragma config WRT = OFF

// this works! Copied from the sdcc manual pdf from the sdcc main website.
//static __code uint16_t __at (_CONFIG1) configword1 = 0x2FF4; 
//static __code uint16_t __at (_CONFIG2) configword2 = 0x3FFF; 

//static __code uint16_t __at (_CONFIG1) configword1 = 0x20E4; 
static __code uint16_t __at (_CONFIG1) configword1 = 
    _INTRC_OSC_NOCLKOUT & 
    _WDT_OFF & 
    _PWRTE_OFF & 
    _MCLRE_OFF & 
    _CP_OFF & 
    _BOR_OFF & 
    _IESO_OFF & 
    _FCMEN_OFF; 

//static __code uint16_t __at (_CONFIG2) configword2 = 0x2FFF; 
    
int i;

void main(void)
{
    // Set ANSEL ANSELH to 0 to allow digital I/O
    //ANSEL = 0x00;
    //ANSELH = 0x00;

    TRISD = 0x0;
    while (1)
    {
        PORTD = 0xff;
    }
}
