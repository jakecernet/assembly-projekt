;   Podprogram za branje vrednosti fotoretistorja   ;

;   Začetne nastavitve   ;
;   ; V r16 bomo shranjevali vrednost fotorezistorja   ;
;   Fotorezistor je priključen na pin A5 oz. PD3   ;

SetupPhotoresistor:
                ;   Pripravimo register za branje   ;
                clr r16 ;   Počistimo r16   ;

                ;   Nastavimo vhodni pin   ;
                sbi DDRC, 0 ;   Nastavimo PC0 na izhod   ;

                ldi r20, 0xC0
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

                ;   Delimo z 10
                ldi r18, 10 ;   Nastavimo r18 na 10   ;
                call div ;   Delimo r19:r20 z r18   ;

                ;   Vrnemo se nazaj   ;
                ret

;   Podprogram za deljenje   ;
;   ; Delimo r19:r20 z r18   ;
;   Rezultat shranimo v r16  ;

div:
            

