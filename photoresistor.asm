;   Podprogram za branje vrednosti fotoretistorja   ;

;   Začetne nastavitve   ;
;   ; V r16 bomo shranjevali vrednost fotorezistorja   ;
;   Fotorezistor je priključen na pin A5 oz. PD3   ;

SetupPhotoresistor:
                ;   Pripravimo register za branje   ;
                clr r16 ;   Počistimo r16   ;

                ;   Nastavimo vhodni pin   ;
                cbi DDRC, 1 ;   Nastavimo PC1 kot vhod   ;

                ;   Nastavimo ADMUX za uporabo zunanjega referenčnega napetostnega vira (AREF) z referenčno napetostjo 5V   ;
                ldi r20, (1 << REFS0) ;   Nastavimo bit REFS0 na 1   ;
                sts ADMUX, r20 ;   Nastavimo ADMUX   ;

                ;   Nastavimo ADCSRA   ;
                ldi r20, 0x87 ;   Nastavimo ADEN, ADPS2, ADPS1, ADPS0   ;
                sts ADCSRA, r20

                ;   Vrnemo se nazaj   ;
                ret

ReadLDR:
                ;   Začnemo branje   ;
                ldi r20, 0xC7 ;   Nastavimo ADSC, ADEN, ADPS2, ADPS1, ADPS0   ;
                sts ADCSRA, r20

                ;   Počakamo na rezultat   ;
                lds r20, ADCSRA ;   Preberemo ADCSRA   ;
                sbrs r20, ADSC ;   Preverimo, če je ADSC 0   ;
                rjmp ReadLDR ;   Če je 1, ponovimo   ;

                ;   Preberemo rezultat   ;
                lds r16, ADCL ;   Preberemo ADCL   ;
                lds r17, ADCH ;   Preberemo ADCH   ;

                ;   Za prikaz številk potrebujemo samo spodnji bajt   ;

                ;   Vrnemo se nazaj   ;
                ret