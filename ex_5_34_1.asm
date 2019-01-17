;*************************************************************************
; Example: 5-34
; Page: 191 / PDF Page: 205
; Chapter: 5.5 BCD and ASCII Conversion
; KEYWORD: BCD; ASCII; ANDI; ORI; SWAP
; Question: Conversion between [Unpacked BCD] [Packed BCD] [ASCII]
;*************************************************************************
; Solution
;*************************************************************************
#INCLUDE "M328PDEF.INC"

                        ; UPBCD -> PBCD, [R21]:[R20] -> [R21]
      LDI   R20, 0x9    ; lower nibble
      LDI   R21, 0x2    ; upper nibble
      SWAP  R21         ; swap nibbles of R21, to make upper nibble of PBCD
      OR    R21, R20    ; join R21 and R20 to make PBCD = R21 = 0x29H

                        ; PBCD -> UPBCD, [R20] -> [R21]:[R20]
      LDI   R20, 0x29   ; load PBCD
      MOV   R21, R20    ; R20 = R21 = 0x29H
      ANDI  R20, 0x0F   ; mask upper nibble of R20 = 0x09H
      SWAP  R21         ; swap nibbles of R21 = 0x92H
      ANDI  R21, 0x0F   ; mask lower nibble of R21 = 0x02H

                        ; PBCD -> ASCII, [R20] -> [R21]:[R22]
      LDI   R20, 0x29   ; the packed BCD to be converted is 29
      MOV   R21, R20    ; R21 = R20 = 0x29H
      ANDI  R21, 0x0F   ; mask the upper nibble (R21 = 0x09H)
      ORI   R21, 0x30   ; make it ASCII (R21 = 0x39H)
      MOV   R22, R20    ; R22 = R20 = 0x29H
      SWAP  R22         ; swap nibbles (R22 = 0x92H)
      ANDI  R22, 0x0F   ; mask the upper nibble (R22 = 0x02H)
      ORI   R22, 0x30   ; make it ASCII (R22 = 0x32H)


                        ; UPBCD -> ASCII, [ORI R20, 0x30]->[R20]
      LDI   R20, 0x2    ;
      ORI   R20, 0x30   ;

                        ; ASCII -> UPBCD, [ANDI R20, 0x30]->[R20]
      LDI   R20, '2'    ;
      ANDI  R20, 0x0F   ;

                        ; ASCII -> UPBCD -> PBCD, [R21]:[R20] -> [R21]
                        ; same with UPBCD -> PBCD + mask upper of lower nibble
      LDI   R20, '9'    ; load character '9' = 0x39H = R20, lower nibble PBCD
      LDI   R21, '2'    ; load character '2' = 0x32H = R21, upper nibble PBCD
      ANDI  R20, 0x0F   ; mask upper nibble, ASCII -> UPBCD, R20 = 0x09H
      ANDI  R21, 0x0F   ; mask upper nibble, ASCII -> UPBCD, R21 = 0x02H
      SWAP  R21         ; swap nibbles of R21 = 0x20H
      OR    R21, R20    ; join R21:R20 to make PBCD
