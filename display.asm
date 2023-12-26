;-----------------------------------------------------------------------------------------------------------------------;
;   Podprogram za prikaz števil na 7 segmentnem zaslonu   ;
;-----------------------------------------------------------------------------------------------------------------------;

;   Nastavitve za 7 segmentni zaslon   ;
SetupDisplay:
                ;   Vrednost iz fotoresistorja dobimo v r16   ;
                ;   Pini za 7 segmentni zaslon so 8, 7, 6, 5, 4, 3, 2   ;
                
                ;   Nastavimo pine za 7 segmentni zaslon na izhod   ;
                ldi r17, 0xFF
                out DDRD, r17

                out DDRB, r17

                ;   Nastavimo vse pine za zaslon na on da preverimo ali deluje   ;
                call displayZero

                ret


;-----------------------------------------------------------------------------------------------------------------------;
;   Tukaj se začnejo podprogrami za prikaz posameznih števil   ;
;-----------------------------------------------------------------------------------------------------------------------;

;   Prikaz števila 0   ;
displayZero:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 0   ;
                ldi r17, 0b01111100
                out PORTD, r17

                ldi r17, 0x01
                out PORTB, r17

                ret

;   Prikaz števila 1   ;
displayOne:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 1   ;
                ldi r17, 0b00001101
                out PORTD, r17

                ldi r17, 0x00
                out PORTB, r17

                ret

;   Prikaz števila 2   ;
displayTwo:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 2   ;
                ldi r17, 0b10111011
                out PORTD, r17

                ldi r17, 0x03
                out PORTB, r17

                ret

;   Prikaz števila 3   ;
displayThree:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 3   ;
                ldi r17, 0b10111100
                out PORTD, r17

                ldi r17, 0x00
                out PORTB, r17

                ret

;   Prikaz števila 4   ;
displayFour:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 4   ;
                ldi r17, 0b11001100
                out PORTD, r17

                ldi r17, 0x00
                out PORTB, r17

                ret

;   Prikaz števila 5   ;
displayFive:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 5   ;
                ldi r17, 0b11110100
                out PORTD, r17

                ldi r17, 0x02
                out PORTB, r17

                ret

;   Prikaz števila 6   ;
displaySix:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 6   ;
                ldi r17, 0b11110100
                out PORTD, r17

                ldi r17, 0x03
                out PORTB, r17

                ret

;   Prikaz števila 7   ;
displaySeven:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 7   ;
                ldi r17, 0b00011101
                out PORTD, r17

                ldi r17, 0x00
                out PORTB, r17

                ret

;   Prikaz števila 8   ;
displayEight:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0x00
                out PORTD, r17

                out PORTB, r17

                ;   Nastavimo pine za prikaz števila 8   ;
                ldi r17, 0b11111100
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
                ldi r17, 0b11111100
                out PORTD, r17

                ldi r17, 0x00
                out PORTB, r17

                ret