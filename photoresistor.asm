
;   Podprogram za branje vrednosti fotoretistorja   ;

;   Začetne nastavitve   ;
;   ; V r16 bomo shranjevali vrednost fotorezistorja   ;
;   Fotorezistor je priključen na pin A5 oz. PD3   ;

.include "knjiznica.asm"

SetupPhotoresistor:
				 call setupUART ; Initialize UART communication

                ;   Pripravimo register za branje   ;
                clr r16 ;   Počistimo r16   ;

                ;   Nastavimo vhodni pin   ;
                sbi DDRC, 5 ;   Nastavimo PC5 (analog pin A5) kot vhod   ;

                ;   Nastavimo ADMUX za uporabo zunanjega referenčnega napetostnega vira (AREF) z referenčno napetostjo 5V   ;
                ldi r20, 0x60 ;   Nastavimo REFS1, REFS0   ;
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


wait_for_conversion:
    ;   Počakamo na rezultat   ;
    lds r21, ADCSRA ;   Preberemo ADCSRA   ;
    sbrs r21, ADSC ;   Preverimo, če je ADSC 0   ;
    rjmp wait_for_conversion ;   Če je 1, ponovimo   ;

	ldi r17, 0xD7
	sts ADCSRA, r17

    ;   Preberemo rezultat   ;
    lds r17, ADCL ;   Preberemo ADCL   ;
    lds r16, ADCH ;   Preberemo ADCH   ;

    ; Convert ADC result to ASCII and send over UART
    push r16
    call send_hex
    pop r16   

    ; Send newline characters for better formatting (optional)
    ldi r16, 0x0D
    call send_char
    ldi r16, 0x0A
    call send_char

    ;   Vrnemo se nazaj   ;
    ret