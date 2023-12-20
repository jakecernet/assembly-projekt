;   Podprogram za prikaz števil na 7 segmentnem zaslonu   ;

;   Nastavitve za 7 segmentni zaslon   ;

SetupDisplay:
                ;   Vrednost iz fotoresistorja dobimo v r16   ;
                
                ;   Nastavimo pine za 7 segmentni zaslon   ;
                ldi r16, 0b11111111
                out DDRC, r16
                
                  
