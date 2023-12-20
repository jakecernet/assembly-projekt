;   Podprogram za prikaz števil na 7 segmentnem zaslonu   ;

;   Nastavitve za 7 segmentni zaslon   ;

call SetupDisplay

call displayTwo

loop:
                rjmp loop

SetupDisplay:
                ;   Vrednost iz fotoresistorja dobimo v r16   ;
                ;   Pini za 7 segmentni zaslon so 8, 7, 6, 5, 4, 3, 2   ;
                
                ;   Nastavimo pine za 7 segmentni zaslon na izhod   ;
                ldi r17, 0xFF
                out DDRD, r17

                out DDRB, r17

                ;   Nastavimo vse pine za zaslon na on da preverimo ali deluje   ;
                ldi r17, 0xFF
                out PORTD, r17

                out PORTB, r17

                ret


;   Tukaj se začnejo podprogrami za prikaz posameznih števil   ;

;   Prikaz števila 0   ;
displayZero:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 0   ;
                ldi r17, 0b11011101
                out PORTD, r17

                ldi r17, 0x05
                out PORTB, r17

                ret

;   Prikaz števila 1   ;
displayOne:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 1   ;
                ldi r17, 0b00000101
                out PORTD, r17

                ldi r17, 0x05
                out PORTB, r17

                ret

;   Prikaz števila 2   ;
displayTwo:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 2   ;
                ldi r17, 0b11101100
                out PORTD, r17

                ldi r17, 0x02
                out PORTB, r17

                ret

;   Prikaz števila 8   ;
displayEight:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 8   ;
                ldi r17, 0xFF
                out PORTD, r17

                ldi r17, 0x05
                out PORTB, r17

                ret

;   Prikaz števila 9   ;
displayNine:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 0   ;
                ldi r17, 0x3F
                out PORTD, r17

                ldi r17, 0x01
                out PORTB, r17

                ret