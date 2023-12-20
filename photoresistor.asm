;   Podprogram za branje vrednosti fotoretistorja   ;

;   Začetne nastavitve   ;
;   ; V r16 bomo shranjevali vrednost fotorezistorja   ;
;   Fotorezistor je priključen na pin A5 oz. PD3   ;

SetupPhotoresistor:
                ;   Pripravimo register za branje   ;
                clr r16 ;   Počistimo r16   ;

                ;   Nastavimo vhodni pin   ;
                sbi DDRD, PD3 ;   Nastavimo pin PD3 kot vhod   ;

                ;   Nastavimo ADC   ;
                sts ADMUX, r16 ;   Nastavimo ADMUX na 0   ;


                ;   Vrnemo se nazaj   ;
                ret

ReadLDR:
                ;   Začnemo branje   ;
                sbi ADCSRA, ADSC ;   Začnemo branje   ;

                ;   Preberemo rezultat   ;
                in r16, ADCH / 10 ;   Preberemo rezultat in ga delimo z 10   ;   

                ;   Vrnemo se nazaj   ;
                ret