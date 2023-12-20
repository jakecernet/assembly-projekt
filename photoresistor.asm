;   Podprogram za branje vrednosti fotoretistorja   ;

;   Začetne nastavitve   ;
;   ; V r16 bomo shranjevali vrednost fotorezistorja   ;

import "knjiznica.asm"

cal setupUART
print "Začetek branja fotorezistorja"

SetupPhotoresistor:
                ;   Pripravimo register za branje   ;
                clr r16 ;   Počistimo r16   ;

                ;   Nastavimo vhodni pin   ;
                cbi DDRD, 3 ;   PD3 je vhod   ;

                ;   Nastavimo pull-up upore   ;
                sbi PORTD, 3 ;   PD3 je pull-up   ;

                ;   Nastavimo ADC   ;
                sbi ADCSRA, ADEN ;   Omogočimo ADC   ;

                ;   Vrnemo se nazaj   ;
                ret


ReadLDR:
                ;   Začnemo branje   ;
                sbi ADCSRA, ADSC ;   Začnemo branje   ;

                ;   Preberemo rezultat   ;
                in r16, ADCH / 10 ;   Preberemo rezultat in ga delimo z 10   ;   

                ;   Začasno sprintamo vrednost na serijski port   ;
                print "Vrednost fotorezistorja: "
                print r16

                ;   Vrnemo se nazaj   ;
                ret