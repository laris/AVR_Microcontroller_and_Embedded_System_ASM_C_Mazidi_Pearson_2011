;*************************************************************************
; Example: 3_20
; Page: 135 / PDF Page: 149
; Write a program to toggle all the bits of I/O register PORTB every 1s.
; Assume that the crystal frequency is 16 MHz and the system ATmega328P
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"

	LDI R16, HIGH(RAMEND)
	OUT SPH, R16
	LDI R16, LOW(RAMEND)
	OUT SPL, R16

	LDI R17, 0xFF				
	OUT DDRB, R17				; initial PORTB as output
	LDI R16, 0x55				; load R16 with 0x55

BACK:
	COM R16							; complement PORTB
	OUT PORTB, R16			; send it to port B
	CALL DELAY_1S				; time delay
	RJMP	BACK					; keep doing this indefinitely

DELAY_1S:
	LDI R20,64
L1:
	LDI R21,200
L2:
	LDI R22,250
L3:
	NOP
	NOP
	DEC R22
	BRNE L3
	
	DEC R21
	BRNE L2

	DEC R20
	BRNE L1
	RET
