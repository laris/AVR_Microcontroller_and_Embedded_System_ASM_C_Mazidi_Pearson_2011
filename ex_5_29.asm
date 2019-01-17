;*************************************************************************
; Example 5-29
; Page: 185 / PDF Page: 199
; Chapter: 5.4 rotate / shift instructions and data serialization
; KEYWORD: serialization input; ROR; ROL; SBIC; SBIS; SEC; CLC
; ROR Rd ; rotate Rd right through carry
; ROL Rd
; Question:
; Write a program to bring in a byte of data serially via pin PC7
; and save it in R20 register. The byte comes in with the LSB first.
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"
      CBI   DDRC, 7     ; bit 7 of Port C is input
      LDI   R16, 8      ; R16 = 8
      LDI   R20, 0      ; R20 = 0
AGAIN:
      SBIC  PINC, 7     ; skip the next line if bit 7 of Port C is 0
      SEC               ; set carry flag to one
      SBIS  PINC, 7     ; skip the next line if bit 7 of Port C is 1
      CLC               ; clear carry flag
      ROR   R20         ; rotate right R20, move C flag to MSB of R21
      DEC   R16         ; decrement R16
      BRNE  AGAIN       ; if R16 is not zero then go to AGAIN

HERE:
      JMP   HERE        ; stop here
