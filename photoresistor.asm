;---------------------------------------------------;
;   Podprogram za branje vrednosti fotoretistorja   ;
;---------------------------------------------------;

;----------------------------------------------------;
;   V r16 bomo shranjevali vrednost fotorezistorja   ;
;    Fotorezistor je priključen na pin A5 oz. PC5    ;
;----------------------------------------------------;

.include "knjiznica.asm"    ;   Vključimo knjižnico za izpisovanje po UART-u na serijski vmesnik  ;

;-----------------------------------------------;
;   Pripravimo UART, ADC in pin za branje   ;
;-----------------------------------------------;
SetupPhotoresistor:
				call setupUART ;  Pripravimo UART z uporabo funkcije setupUART iz knjižnice  ;

                clr r16 ;   Počistimo r16 za branje vrednosti fotorezistorja   ;

                sbi DDRC, 0 ;   Nastavimo pin PC0 kot vhod   ;

                ;   Nastavimo ADMUX (ADC Multiplexer Selection Register)   ;
                ldi r20, 0x60 ;   Nastavimo REFS1, REFS0   ;
                sts ADMUX, r20 ;   Nastavimo ADMUX   ;

                ;   Nastavimo ADCSRA (ADC Control and Status Register A)   ;
                ldi r20, 0x87 ;   Nastavimo ADEN, ADPS2, ADPS1, ADPS0   ;
                sts ADCSRA, r20

                ret

;---------------------------------------------------;
;   Podprogram za branje vrednosti fotorezistorja   ;
;---------------------------------------------------;
ReadLDR:
                ldi r20, 0xC7 ;   Nastavimo ADSC, ADEN, ADPS2, ADPS1, ADPS0   ;
                sts ADCSRA, r20 ;   Nastavimo ADCSRA   ;

            wait_for_conversion:    ;   Počakamo na rezultat pretvorbe   ;
                lds r21, ADCSRA ;   Preberemo ADCSRA   ;
                sbrs r21, ADSC ;   Preverimo, če je ADSC 0   ;
                rjmp wait_for_conversion ;   Če je 1, ponovimo   ;

	            ldi r17, 0xD7   ;   Nastavimo ADIF, ADPS2, ADPS1, ADPS0   ;
	            sts ADCSRA, r17 ;   Nastavimo ADCSRA   ;

                ;   Preberemo rezultat   ;
                lds r17, ADCL ;   Preberemo ADCL (Nizki bajt ADC rezultata)   ;
                lds r16, ADCH ;   Preberemo ADCH (Visoki bajt ADC rezultata)   ;

                ;   Za prikazovanje številke na zaslonu potrebujemo samo visoki bajt   ;

                ;-----------------------------------------------;
                ;   Ta del kode je namenjen samo za debugganje  ;
                ;   in v primeru, da želimo vedeti, kakšno      ;
                ;   vrednost ima fotorezistor                   ;
                ;-----------------------------------------------;

                ;   Pošljemo vrednost fotorezistorja po UART-u   ;
                push r16    ;   Shranimo r16 na sklad   ;
                call send_hex   ;   Pošljemo vrednost fotorezistorja po UART-u   ;

                ;   Pošljemo ASCII znak za novo vrstico   ;
                ldi r16, 0x0D
                call send_char
                ldi r16, 0x0A
                call send_char

                pop r16     ;   Vrnemo r16 iz sklada   ;

                ;   Vrnemo se nazaj   ;
                ret