.org 0x0134 ;   začetek programa   ;

.include "display.asm" ;   Program za prikaz številk na 7 segmentnem zaslonu   ;
.include "photoresistor.asm" ;   Program za branje vrednosti fotorezistorja   ;
.include "computer.asm" ;   Program za izračun vrednosti za prikaz   ;

.org 0x0000 ;   začetek programa   ;

setup:
    call SetupPhotoresistor ;   Nastavitev fotorezistorja in ADC   ;
    call SetupDisplay ;   Nastavitev 7 segmentnega zaslona   ;
    rjmp loop ;   Skočimo na loop   ;

loop:
    call ReadLDR ;   Preberemo vrednost fotorezistorja z uporabo ADC    ;
    rjmp ComputeDisplay ;   Izračunamo vrednost za prikaz številke na 7 segmentnem zaslonu   ;
    rjmp loop ;   Skočimo na začetek programa   ;