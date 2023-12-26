;   Podprogram za izračun številke za prikaz na sedem segmentnem zaslonu   ;

ComputeDisplay:
    ;   Vrednost fotoresistorja je shranjena v r16  ;
    ;   Vrednost fotoresistorja primerjamo z vrednostmi, ki ustrezajo posameznim številkam   ;
    ;   Če je vrednost fotoresistorja manjša od vrednosti, ki ustreza posamezni številki, prikažemo to številko   ;
    ;   Če je vrednost fotoresistorja večja od vrednosti, ki ustreza številki, gremo na naslednjo številko   ;

    cpi r16, 0x20 ;   Če je r16 manjši od 32 ali enak 32, prikažemo 0   ;
    brlo display0 ;

    cpi r16, 0x38 ;   Če je r16 manjši od 56 ali enak 56, prikažemo 1 itd. itd.  ;
    brlo display1 ;

    cpi r16, 0x50 ;   
    brlo display2 ;

    cpi r16, 0x68 ;  
    brlo display3 ;

    cpi r16, 0x80 ;   
    brlo display4 ;

    cpi r16, 0x98 ;   
    brlo display5 ;

    cpi r16, 0xB0 ;   
    brlo display6 ;

    cpi r16, 0xC8 ;   
    brlo display7 ;

    cpi r16, 0xE0 ;   
    brlo display8 ;

    ;   Če je r16 večji od 224, prikažemo 9   ;
    rjmp display9 ;

    ;   Skočimo na začetek programa   ;
    rjmp loop ;

display0:
    call displayZero ;   Prikažemo 0   ;
    rjmp loop ;   skočimo na loop   ;

display1:
    call displayOne ;   Prikažemo 1   ;
    rjmp loop ;   skočimo na loop   ;

display2:
    call displayTwo ;   Prikažemo 2   ;
    rjmp loop ;   skočimo na loop   ;

display3:
    call displayThree ;   Prikažemo 3   ;
    rjmp loop ;   skočimo na loop   ;

display4:
    call displayFour ;   Prikažemo 4   ;
    rjmp loop ;   skočimo na loop   ;

display5:
    call displayFive ;   prikažemo 5   ;
    rjmp loop ;   skočimo na loop   ;

display6:
    call displaySix ;   prikažemo 6   ;
    rjmp loop ;   skočimo na loop   ;

display7:
    call displaySeven ;   prikažemo 7   ;
    rjmp loop ;   skočimo na loop   ;

display8:
    call displayEight ;   prikažemo 8   ;
    rjmp loop ;   skočimo na loop   ;

display9:
    call displayNine ;   prikažemo 9   ;
    rjmp loop ;   skočimo na loop   ;