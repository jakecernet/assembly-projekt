.org 0x0134 ;   vključimo zaslon   ;

.include "display.asm" ;   program za prikaz na 7 segmentnem zaslonu   ;
.include "photoresistor.asm" ;   program za branje vrednosti fotorezistorja   ;

.org 0x0000 ;   začetek programa   ;

setup:
    call SetupPhotoresistor ;   nastavitev fotorezistorja   ;
    call SetupDisplay ;   nastavitev 7 segmentnega zaslona   ;
    rjmp loop ;   skočimo na loop   ;

loop:
	call SetupPhotoresistor ;   nastavitev fotorezistorja   ;
    call ReadLDR ;   preberemo vrednost fotorezistorja   ;
    rjmp ComputeDisplay ;   izračunamo vrednost za prikaz   ;
    rjmp loop ;   skok na začetek programa   ;

ComputeDisplay:
    ;   r16 = vrednost fotorezistorja   ;
    ;   r16 primerjamo z vrednostmi od 0 do 100   ;
    ;   in glede na to prikažemo na zaslonu   ;
    ;   ustrezno številko   ;

    cpi r16, 0 ;   If r16 is equal to or less than 0, display 0   ;
    breq display0 ;   skočimo na displayZero   ;

    cpi r16, 1 ;   If r16 is less than 10, display 1   ;
    brlo display1 ;

    cpi r16, 2 ;   If r16 is less than 20, display 2   ;
    brlo display2 ;

    cpi r16, 3 ;   If r16 is less than 30, display 3   ;
    brlo display3 ;

    cpi r16, 4 ;   If r16 is less than 40, display 4   ;
    brlo display4 ;

    cpi r16, 5 ;   If r16 is less than 50, display 5   ;
    brlo display5 ;

    cpi r16, 6 ;   If r16 is less than 60, display 6   ;
    brlo display6 ;

    cpi r16, 7 ;   If r16 is less than 70, display 7   ;
    brlo display7 ;

    cpi r16, 8 ;   If r16 is less than 80, display 8   ;
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