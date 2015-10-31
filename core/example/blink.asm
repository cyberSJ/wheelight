;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (Linux)
; This file was generated Sat Oct 31 12:21:51 2015
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"blink.c"
	list	p=16f887
	radix dec
	include "p16f887.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_SSPCON2bits
	extern	_MSKbits
	extern	_SSPMSKbits
	extern	_SSPSTATbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_VRCONbits
	extern	_TXSTAbits
	extern	_SPBRGbits
	extern	_SPBRGHbits
	extern	_PWM1CONbits
	extern	_ECCPASbits
	extern	_PSTRCONbits
	extern	_ADCON1bits
	extern	_WDTCONbits
	extern	_CM1CON0bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_SRCONbits
	extern	_BAUDCTLbits
	extern	_ANSELbits
	extern	_ANSELHbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_SSPCON2
	extern	_PR2
	extern	_MSK
	extern	_SSPADD
	extern	_SSPMSK
	extern	_SSPSTAT
	extern	_WPUB
	extern	_IOCB
	extern	_VRCON
	extern	_TXSTA
	extern	_SPBRG
	extern	_SPBRGH
	extern	_PWM1CON
	extern	_ECCPAS
	extern	_PSTRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_EEDAT
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_SRCON
	extern	_BAUDCTL
	extern	_ANSEL
	extern	_ANSELH
	extern	_EECON1
	extern	_EECON2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_ucharCount
	global	_uintDelayCount

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_blink_0	idata
_ucharCount
	db	0x00


ID_blink_1	idata
_uintDelayCount
	db	0x00, 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_blink	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	59; "blink.c"	TRISD = 0x00;
	BANKSEL	_TRISD
	CLRF	_TRISD
;	.line	61; "blink.c"	ucharCount = 0;
	BANKSEL	_ucharCount
	CLRF	_ucharCount
;	.line	62; "blink.c"	uintDelayCount = 0;
	BANKSEL	_uintDelayCount
	CLRF	_uintDelayCount
	CLRF	(_uintDelayCount + 1)
;	.line	65; "blink.c"	ANSEL = 0x00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	66; "blink.c"	ANSELH = 0x00;
	CLRF	_ANSELH
;;unsigned compare: left < lit(0x2710=10000), size=2
_00105_DS_
;	.line	72; "blink.c"	while ( uintDelayCount < 10000 )
	MOVLW	0x27
	BANKSEL	_uintDelayCount
	SUBWF	(_uintDelayCount + 1),W
	BTFSS	STATUS,2
	GOTO	_00119_DS_
	MOVLW	0x10
	SUBWF	_uintDelayCount,W
_00119_DS_
	BTFSC	STATUS,0
	GOTO	_00107_DS_
;;genSkipc:3247: created from rifx:0xffc014c4
;	.line	75; "blink.c"	uintDelayCount++;
	BANKSEL	_uintDelayCount
	INCF	_uintDelayCount,F
	BTFSC	STATUS,2
	INCF	(_uintDelayCount + 1),F
	GOTO	_00105_DS_
_00107_DS_
;	.line	79; "blink.c"	uintDelayCount = 0;
	BANKSEL	_uintDelayCount
	CLRF	_uintDelayCount
	CLRF	(_uintDelayCount + 1)
;	.line	82; "blink.c"	ucharCount++;
	BANKSEL	_ucharCount
	INCF	_ucharCount,F
;	.line	86; "blink.c"	PORTD = ucharCount;
	MOVF	_ucharCount,W
	BANKSEL	_PORTD
	MOVWF	_PORTD
	GOTO	_00105_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   25+    9 =    34 instructions (   86 byte)

	end
