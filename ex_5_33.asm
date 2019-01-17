;*************************************************************************
; Example:5-33
; Page: 188 / PDF Page: 202
; Chapter: 5.4
; KEYWORD: SWAP
; Question:
;*************************************************************************
; Solution
a) Find the contents of the R20 register in the following code
    LDI   R20, 0x72 ; R20 = 0x72
    SWAP  R20       ; R20 = 0x27
b) In the absence of a SWAP instruction, how would you exchange the nibbles?
   Write a simple program to show the process.
    LDI R20, 0x72
    LDI R16, 4
    LDI R21, 0
BEGIN:
    CLC
    ROL R20
    ROL R21
    DEC R16
    BRNE BEGIN
    OR  R20, R21
HERE: JMP HERE
;*************************************************************************
#INCLUDE "M328PDEF.INC"
