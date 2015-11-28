/*
 * File:   main.c
 *
 * Created on August 16, 2010, 12:09 PM
 */


#include <htc.h>

#if defined(WDTE_OFF)
__CONFIG(WDTE_OFF & LVP_OFF);
#elif defined (WDTDIS)
__CONFIG(WDTDIS & LVPDIS);
#endif

void delay() {
    int counter = 0;
    for (counter = 0; counter<10000; counter++) {
        ;
    }
}

int main(void) {
    //TRISB = 0;
    TRISD = 0;
    
    while (1) {
        //PORTB = 0x0F;
        PORTD = 0x0f;
        
        delay();

        //PORTB = 0x00;
        PORTD = 0;

        delay();
    }
    return 0;
}
