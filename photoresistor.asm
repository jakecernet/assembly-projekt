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
                ldi r16, (1 << REFS0) ;   Nastavimo ADMUX na 0   ;
                sts ADMUX, r16

                ;   Vrnemo se nazaj   ;
                ret

ReadLDR:
                ;   Začnemo branje   ;
                ldi r16, (1 << ADEN) | (1 << ADSC) ;   Nastavimo ADSC in ADEN   ;
                sts ADCSRA, r16

                ;   Počakamo na rezultat   ;
                ldi r16, (1 << ADIF) ;   Nastavimo ADIF   ;
                cpi r16, 0 ;   Preverimo, če je ADIF 0   ;
                breq ReadLDR ;   Če je 0, ponovno poženemo branje   ;

                ;   Preberemo rezultat   ;
                lds r16, ADCL ;   Preberemo ADCL   ;
                lds r17, ADCH ;   Preberemo ADCH   ;

                ;   Shranimo rezultat deljen z 10 v r16, funkcija div ne obstaja   ;
                ldi r18, 10 ;   Delimo z 10   ;
                mov r19, r17 ;   Shranimo ADCH v r19   ;
                mov r20, r16 ;   Shranimo ADCL v r20   ;
                rcall div ;   Delimo   ;
                mov r16, r22 ;   Shranimo rezultat v r16   ;

                ;   Vrnemo se nazaj   ;
                ret

;   Podprogram za deljenje   ;
;   ; Delimo r19:r20 z r18   ;
;   Rezultat shranimo v r22   ;

div:
                ;   Pripravimo registre   ;
                clr r22 ;   Počistimo r22   ;
                clr r23 ;   Počistimo r23   ;
                clr r24 ;   Počistimo r24   ;
                clr r25 ;   Počistimo r25   ;

                ;   Preverimo, če je r19 >= r18   ;
                cpi r19, 0 ;   Preverimo, če je r19 0   ;
                breq divEnd ;   Če je 0, preskočimo   ;
                cp r19, r18 ;   Preverimo, če je r19 >= r18   ;
                brge divLoop ;   Če je >=, preskočimo   ;

                ;   Preverimo, če je r19 < r18   ;
                cp r19, r18 ;   Preverimo, če je r19 < r18   ;
                brlt divEnd ;   Če je <, preskočimo   ;

divLoop:
                ;   Odštejemo r18 od r19   ;
                sub r19, r18 ;   Odštejemo r18 od r19   ;
                inc r22 ;   Povečamo r22 za 1   ;

                ;   Preverimo, če je r19 >= r18   ;
                cp r19, r18 ;   Preverimo, če je r19 >= r18   ;
                brge divLoop ;   Če je >=, preskočimo   ;

divEnd:
                ;   Vrnemo se nazaj   ;
                ret