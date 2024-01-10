;------------------------------------------------------------;
;   Glavni program za prikaz vrednosti fotorezistorja na 7   ;
;                   segmentnem zaslonu.                      ;
;------------------------------------------------------------;

;   Program je napisan v jeziku Assembler za mikrokrmilnik   ;
;   ATmega328P. Program je napisan za delovanje na 16MHz     ;

;------------------------------------------------------------;
;               Avtor:   Jaka Černetič                       ;
;------------------------------------------------------------;

.org 0x0134 ;   začetek programa   ;

.include "display.asm" ;   Program za prikaz številk na 7 segmentnem zaslonu   ;
.include "photoresistor.asm" ;   Program za branje vrednosti fotorezistorja   ;
.include "computer.asm" ;   Program za izračun vrednosti za prikaz   ;
.include "LCD.asm" ;   Program za prikaz na LCD zaslonu   ;

.org 0x0000 ;   začetek programa   ;

;------------------------------------------------------------;
;   Nastavitev vseh potrebnih zadev za delovanje programa.   ;
;------------------------------------------------------------;
setup:
    call SetupDisplay ;   Nastavitev 7 segmentnega zaslona   ;
	call SetupPhotoresistor ;   Nastavitev fotorezistorja in ADC   ;
    call LCD_write ;   Nastavitev LCD zaslona   ;
	call displayBrightness
    rjmp loop ;   Skočimo na loop   ;

;------------------------------------------------------------;
;                   Glavna zanka programa.                   ;
;------------------------------------------------------------;
loop:
    call ReadLDR ;   Preberemo vrednost fotorezistorja z uporabo ADC    ;
    rjmp ComputeDisplay ;   Izračunamo vrednost za prikaz številke na 7 segmentnem zaslonu   ;
    rjmp loop ;   Skočimo na začetek programa   ;