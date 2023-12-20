;   Display svetlosti na 7 segmentnem zaslonu   ;

.org 0x0034 ;   vključimo zaslon   ;

.include "display.asm" ;   program za prikaz na 7 segmentnem zaslonu   ;
.include "photoresistor.asm" ;   program za branje vrednosti fotorezistorja   ;

.org 0x0000 ;   začetek programa   ;

setup:
            call SetupPhotoresistor ;   nastavitev fotorezistorja   ;
            call SetupDisplay ;   nastavitev 7 segmentnega zaslona   ;
            rjmp loop ;   skočimo na loop   ;

loop:
            jmp loop ;   skok na začetek programa   ;