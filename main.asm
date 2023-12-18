;   Display svetlosti na 7 segmentnem zaslonu   ;

include "display.asm" ;   program za prikaz na 7 segmentnem zaslonu   ;
include "photoresistor.asm" ;   program za branje vrednosti fotorezistorja   ;

org 0x0000 ;   začetek programa   ;

setup:
            call SetupDisplay ;   nastavitev 7 segmentnega zaslona   ;
            call SetupPhotoresistor ;   nastavitev fotorezistorja   ;
            rjmp loop ;   skočimo na loop   ;

loop:
            call ReadLDR ;   branje vrednosti fotorezistorja   ;
            call Display ;   prikaz vrednosti na 7 segmentnem zaslonu   ;
            jmp loop ;   skok na začetek programa   ;