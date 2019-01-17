;*************************************************************************
; Example: 5-32
; Page: 187 / PDF Page: 201
; Chapter: 5.4
; KEYWORD: LSL; LSR; ASR
; Question: Assume that R20 has the number 48.
; Show how we can use ROR to divide the R20 by 8.
;*************************************************************************
; Solution
                  ; to divide a number by 8 we can shift it 3 bits to the right.
                  ; without LSR we have to ROR 3 times
                  ; and clear carry flag before rotation
LDI   R20, 0x30   ; R20 = 0011 0000 (48)
CLC               ; clear carry flag
ROR   R20         ; R20 = 0001 1000 (24)
CLC               ; clear carry flag
ROR   R20         ; R20 = 0000 1100 (12)
CLC               ; clear carry flag
ROR   R20         ; R20 = 0000 0110 (6)
                  ; 48 divided by 8 is 6 and the answer is correct
;*************************************************************************
#INCLUDE "M328PDEF.INC"
