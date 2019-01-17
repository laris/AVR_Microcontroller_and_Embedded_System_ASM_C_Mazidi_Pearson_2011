;*************************************************************************
; Example: 5-31
; Page: 187 / PDF Page: 201
; Chapter: 5.4
; KEYWORD: LSL; LSR; ASR
; LSL/R Rd  ; logical shift left/right; multiply/divide by 2
; ASR   Rd  ; arithmetic shift right; divide signed number by 2
; Question: Assume that R20 has the number -6.
; Show that LSR cannot be used to divide the content of R20 by 2. Why?
;*************************************************************************
; Solution
  LDI   R20, 0xFA   ; R20 = 1111 1010 (-6)
  LSR   R20         ; R20 = 0111 1101 (+125)
                    ; -6 divided by 2 is not +125 and the answer is not correct
; Because LSR shifts the sign bit it changes the sign of the number
; and therefore cannot be used for signed numbers.
;*************************************************************************
#INCLUDE "M328PDEF.INC"
