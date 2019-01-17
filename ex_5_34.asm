;*************************************************************************
; Example: 5-34
; Page: 191 / PDF Page: 205
; Chapter: 5.5 BCD and ASCII Conversion
; KEYWORD: BCD; ASCII; ANDI; ORI; SWAP
; Question: Assume that R20 has packed BCD. Write a program to convert
;           the packed BCD to two ASCII numbers and place them in R21 and R22.
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"

      LDI   R20, 0x29   ; the packed BCD to be converted is 29
      MOV   R21, R20    ; R21 = R20 = 29H
      ANDI  R21, 0x0F   ; mask the upper nibble (R21 = 09H)
      ORI   R21, 0x30   ; make it ASCII (R21 = 39H)

      MOV   R22, R20    ; R22 = R20 = 29H
      SWAP  R22         ; swap nibbles (R22 = 92H)
      ANDI  R22, 0x0F   ; mask the upper nibble (R22 = 02)
      ORI   R22, 0x30   ; make it ASCII (R22 = 32H)

HERE: JMP   HERE
