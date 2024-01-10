;-----------------------------------------------------------------------------------------------------------------------;
;                               Podprogram za prikaz števil na 7 segmentnem zaslonu                                     ;  
;-----------------------------------------------------------------------------------------------------------------------;

;-----------------------------------------------------------------------------------------------------------------------;
;                                       Nastavitve za 7 segmentni zaslon                                                ;
;-----------------------------------------------------------------------------------------------------------------------;    
SetupDisplay:
                ;   Vrednost iz fotoresistorja dobimo v r16   ;
                
                ;   Nastavimo pine za 7 segmentni zaslon na izhod   ;
                ;   Pini so A5 - A1 ter D2 in D3   ;

                ;   Nastavimo pine na PORTC (A5 - A1) na izhod   ;
                ldi r17, 0b00111110
                out DDRC, r17       

                ;   Nastavimo pine na PORTD (Digitalni pini D2 in D3) na izhod   ;
                ldi r17, 0xFF
                out DDRD, r17

                ;   Nastavimo vse pine za zaslon na on da preverimo ali deluje   ;
                call displayEight

                ret


;-----------------------------------------------------------------------------------------------------------------------;
;                               Tukaj se začnejo podprogrami za prikaz posameznih števil                                ;
;-----------------------------------------------------------------------------------------------------------------------;

;   Reset 7 segmentnega zaslona   ;
ClearDisplay:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                ldi r17, 0b00000000
                out PORTC, r17
                out PORTD, r17

                ret

;   Prikaz števila 0   ;
displayZero:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 0   ;
                ldi r17, 0b00111011
                out PORTC, r17

                ldi r17, 0xFF
                out PORTD, r17

                ret

;   Prikaz števila 1   ;
displayOne:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 1   ;
                ldi r17, 0b00100001
                out PORTC, r17

                ldi r17, 0b0000000100
                out PORTD, r17

                ret

;   Prikaz števila 2   ;
displayTwo:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 2   ;
                ldi r17, 0b00110110
                out PORTC, r17

                ldi r17, 0b00001000
                out PORTD, r17

                ret

;   Prikaz števila 3   ;
displayThree:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 3   ;
                ldi r17, 0b00110100
                out PORTC, r17

                ldi r17, 0b00001111
                out PORTD, r17

                ret

;   Prikaz števila 4   ;
displayFour:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 4   ;
                ldi r17, 0b00101101
                out PORTC, r17

                ldi r17, 0b0000000100
                out PORTD, r17

                ret

;   Prikaz števila 5   ;
displayFive:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 5   ;
                ldi r17, 0b00011101
                out PORTC, r17

                ldi r17, 0b00001100
                out PORTD, r17

                ret

;   Prikaz števila 6   ;
displaySix:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 6   ;
                ldi r17, 0b00011111
                out PORTC, r17

                ldi r17, 0b00001111
                out PORTD, r17

                ret

;   Prikaz števila 7   ;
displaySeven:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 7   ;
                ldi r17, 0b00110001
                out PORTC, r17

                ldi r17, 0b0000000100
                out PORTD, r17

                ret

;   Prikaz števila 8   ;
displayEight:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 8   ;
                ldi r17, 0b00111111
                out PORTC, r17

                ldi r17, 0b00001111
                out PORTD, r17

                ret

;   Prikaz števila 9   ;
displayNine:
                ;   Nastavimo vse pine na 7 segmentnem zaslonu na off   ;
                call ClearDisplay

                ;   Nastavimo pine za prikaz števila 6   ;
                ldi r17, 0b00111101
                out PORTC, r17

                ldi r17, 0b00001111
                out PORTD, r17

                ret