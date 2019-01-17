;*************************************************************************
; Example 5-28
; Page: 184 / PDF Page: 198
; Chapter: 5.4 rotate / shift instructions and data serialization
; KEYWORD: serialization output; ROR; ROL
; ROR Rd ; rotate Rd right through carry
; ROL Rd
; Question:
; Write a program to transfer the value 41H serially
; (one bit at a time) via pin PB1.
; Put one high at the start and end of the data.
; Send the LSB first.
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"
      SBI   DDRB, 1     ; bit 1 of Port B is output
      LDI   R20, 0x41   ; R20 = the value to be sent
      CLC               ; clear carry flag
      LDI   R16, 8      ; R16 = 8
      SBI   PORTB, 1    ; bit 1 of PORTB is 1
AGAIN:
      ROR   R20         ; rotate right R20 (send LSB to C flag)
      BRCS  ONE         ; if C = 1 then go to ONE
      CBI   PORTB, 1    ; bit 1 of PORTB is cleared to zero
      JMP   NEXT        ; go to NEXT
ONE:
      SBI   PORTB, 1    ; bit 1 of PORTB is set to one
NEXT:
      DEC   R16         ; decrement R16
      BRNE  AGAIN       ; if R16 is not zero then go to AGAIN
      SBI   PORTB, 1    ; bit 1 of PORTB is set to one
HERE:
      JMP   HERE        ; RB1 = high
