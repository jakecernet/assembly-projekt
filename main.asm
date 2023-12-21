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
    call ComputeDisplay ;   izračunamo vrednost za prikaz   ;
    jmp loop ;   skok na začetek programa   ;

ComputeDisplay:
    ; Check the brightness level and set the displayed number accordingly
    ; The threshold values are adjusted based on your example (0 for zero, 100 for nine)

    cpi r16, 0 ;   If r16 is equal to or less than 0, display 0   ;
    breq display0 ;   skočimo na displayZero   ;

    cpi r16, 10 ;   If r16 is less than 10, display 1   ;
    brlo display1 ;

    cpi r16, 20 ;   If r16 is less than 20, display 2   ;
    brlo display2 ;

    cpi r16, 30 ;   If r16 is less than 30, display 3   ;
    brlo display3 ;

    cpi r16, 40 ;   If r16 is less than 40, display 4   ;
    brlo display4 ;

    cpi r16, 50 ;   If r16 is less than 50, display 5   ;
    brlo display5 ;

    cpi r16, 60 ;   If r16 is less than 60, display 6   ;
    brlo display6 ;

    cpi r16, 70 ;   If r16 is less than 70, display 7   ;
    brlo display7 ;

    cpi r16, 80 ;   If r16 is less than 80, display 8   ;
    brlo display8 ;

    ; If r16 is greater than or equal to 80, display 9
    rjmp display9 ;

display0:
    call displayZero ;   prikažemo 0   ;
    ret ;   vrnemo se na loop   ;

display1:
    call displayOne ;   prikažemo 1   ;
    ret ;   vrnemo se na loop   ;

display2:
    call displayTwo ;   prikažemo 2   ;
    ret ;   vrnemo se na loop   ;

display3:
    call displayThree ;   prikažemo 3   ;
    ret ;   vrnemo se na loop   ;

display4:
    call displayFour ;   prikažemo 4   ;
    ret ;   vrnemo se na loop   ;

display5:
    call displayFive ;   prikažemo 5   ;
    ret ;   vrnemo se na loop   ;

display6:
    call displaySix ;   prikažemo 6   ;
    ret ;   vrnemo se na loop   ;

display7:
    call displaySeven ;   prikažemo 7   ;
    ret ;   vrnemo se na loop   ;

display8:
    call displayEight ;   prikažemo 8   ;
    ret ;   vrnemo se na loop   ;

display9:
    call displayNine ;   prikažemo 9   ;
    ret ;   vrnemo se na loop   ;
