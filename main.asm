.org 0x0134 ;   vključimo zaslon   ;

.include "display.asm" ;   program za prikaz na 7 segmentnem zaslonu   ;
.include "photoresistor.asm" ;   program za branje vrednosti fotorezistorja   ;

.org 0x0000 ;   začetek programa   ;

setup:
    call SetupPhotoresistor ;   nastavitev fotorezistorja   ;
    call SetupDisplay ;   nastavitev 7 segmentnega zaslona   ;
    rjmp loop ;   skočimo na loop   ;

loop:
    call ReadLDR ;   preberemo vrednost fotorezistorja   ;
    rjmp ComputeDisplay ;   izračunamo vrednost za prikaz   ;
    rjmp loop ;   skok na začetek programa   ;

ComputeDisplay:
    ;   r16 = vrednost fotorezistorja   ;
    ;   r16 primerjamo z vrednostmi od 0x20 do 0xFF   ;
    ;   in glede na to prikažemo na zaslonu   ;
    ;   ustrezno številko   ;

    cpi r16, 0x20 ;   If r16 is lower than 32 or equal to 32, display 0   ;
    brlo display0 ;

    cpi r16, 0x38 ;   If r16 is lower than 60 or equal to 60, display 1   ;
    brlo display1 ;

    cpi r16, 0x50 ;   If r16 is lower than 88 or equal to 88, display 2   ;
    brlo display2 ;

    cpi r16, 0x68 ;   If r16 is lower than 116 or equal to 116, display 3   ;
    brlo display3 ;

    cpi r16, 0x80 ;   If r16 is lower than 144 or equal to 144, display 4   ;
    brlo display4 ;

    cpi r16, 0x98 ;   If r16 is lower than 172 or equal to 172, display 5   ;
    brlo display5 ;

    cpi r16, 0xB0 ;   If r16 is lower than 200 or equal to 200, display 6   ;
    brlo display6 ;

    cpi r16, 0xC8 ;   If r16 is lower than 228 or equal to 228, display 7   ;
    brlo display7 ;

    cpi r16, 0xE0 ;   If r16 is lower than 256 or equal to 256, display 8   ;
    brlo display8 ;

    ; If r16 is greater than or equal to 80, display 9
    rjmp display9 ;

    ;   Skočimo na začetek programa   ;
    rjmp loop ;

display0:
    call displayZero ;   prikažemo 0   ;
    rjmp loop ;   skočimo na loop   ;

display1:
    call displayOne ;   prikažemo 1   ;
    rjmp loop ;   skočimo na loop   ;

display2:
    call displayTwo ;   prikažemo 2   ;
    rjmp loop ;   skočimo na loop   ;

display3:
    call displayThree ;   prikažemo 3   ;
    rjmp loop ;   skočimo na loop   ;

display4:
    call displayFour ;   prikažemo 4   ;
    rjmp loop ;   skočimo na loop   ;

display5:
    call displayFive ;   prikažemo 5   ;
    rjmp loop ;   skočimo na loop   ;

display6:
    call displaySix ;   prikažemo 6   ;
    rjmp loop ;   skočimo na loop   ;

display7:
    call displaySeven ;   prikažemo 7   ;
    rjmp loop ;   skočimo na loop   ;

display8:
    call displayEight ;   prikažemo 8   ;
    rjmp loop ;   skočimo na loop   ;

display9:
    call displayNine ;   prikažemo 9   ;
    rjmp loop ;   skočimo na loop   ;