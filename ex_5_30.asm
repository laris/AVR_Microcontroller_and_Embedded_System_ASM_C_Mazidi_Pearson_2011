;*************************************************************************
; Example 5-30
; Page: 185 / PDF Page: 199
; Chapter: 5.4 rotate / shift instructions and data serialization
; KEYWORD: ROR; ROL; BRCC; counting
; Question: Write a program that finds the number of 1s in a given byte.
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"

      LDI   R20, 0x97   ; input, target byte for counting
      LDI   R30, 0      ; output, result number of 1s, initial result = 0
      LDI   R16, 8      ; number of bits in a byte

AGAIN:
      ROR   R20         ; rotate right R20 and move LSB to C flag
      BRCC  NEXT        ; if C = 0 then go to NEXT
      INC   R30         ; increment R30 for counting result
NEXT:
      DEC   R16         ; decrement R16
      BRNE  AGAIN       ; if R16 is not zero then go to AGAIN
      ROR   R20         ; one more time to leave R20 unchanged

HERE:
      JMP   HERE        ; stop here
