;------------------------------------------------------------------------------------------;
;                             Podprogram za prikazovanje na LCD                            ;
;                                Večina tega programa je iz:                               ;
;   https://akuzechie.blogspot.com/2021/10/assembly-via-arduino-programming-lcd.html?m=1   ;
;------------------------------------------------------------------------------------------;

;     Začetno stanje LCD-ja    ;
LCD_write:
      LDI   R16, 0xFF
      OUT   DDRD, R16         ;set port D o/p for data
      OUT   DDRB, R16         ;set port B o/p for command
      CBI   PORTB, 0          ;EN = 0
      RCALL delay_ms          ;wait for LCD power on
      ;-----------------------------------------------------
      RCALL LCD_init          ;subroutine to initialize LCD
      ;-----------------------------------------------------
again:RCALL disp_message      ;subroutine to display message
      ;-----------------------------------------------------
      LDI   R16, 0x01         ;clear LCD
      RCALL command_wrt       ;send command code
      RCALL delay_ms
      ;-----------------------------------------------------
      LDI   R17, 4            ;wait 1 second
l1:   RCALL delay_seconds
      DEC   R17
      BRNE  l1
      ;-----------------------------------------------------
      ret           ;jump to again for another run
;================================================================
LCD_init:
      LDI   R16, 0x33         ;init LCD for 4-bit data
      RCALL command_wrt       ;send to command register
      RCALL delay_ms
      LDI   R16, 0x32         ;init LCD for 4-bit data
      RCALL command_wrt
      RCALL delay_ms
      LDI   R16, 0x28         ;LCD 2 lines, 5x7 matrix
      RCALL command_wrt
      RCALL delay_ms
      LDI   R16, 0x0C         ;disp ON, cursor OFF
      RCALL command_wrt
      LDI   R16, 0x01         ;clear LCD
      RCALL command_wrt
      RCALL delay_ms
      LDI   R16, 0x06         ;shift cursor right
      RCALL command_wrt
      RET  
;================================================================
command_wrt:
      MOV   R27, R16
      ANDI  R27, 0xF0         ;mask low nibble & keep high nibble
      OUT   PORTD, R27        ;o/p high nibble to port D
      CBI   PORTB, 1          ;RS = 0 for command
      SBI   PORTB, 0          ;EN = 1
      RCALL delay_short       ;widen EN pulse
      CBI   PORTB, 0          ;EN = 0 for H-to-L pulse
      RCALL delay_us          ;delay in micro seconds
      ;----------------------------------------------------
      MOV   R27, R16
      SWAP  R27               ;swap nibbles
      ANDI  R27, 0xF0         ;mask low nibble & keep high nibble
      OUT   PORTD, R27        ;o/p high nibble to port D
      SBI   PORTB, 0          ;EN = 1
      RCALL delay_short       ;widen EN pulse
      CBI   PORTB, 0          ;EN = 0 for H-to-L pulse
      RCALL delay_us          ;delay in micro seconds
      RET
;================================================================
data_wrt:
      MOV   R27, R16
      ANDI  R27, 0xF0         ;mask low nibble & keep high nibble
      OUT   PORTD, R27        ;o/p high nibble to port D
      SBI   PORTB, 1          ;RS = 1 for data
      SBI   PORTB, 0          ;EN = 1
      RCALL delay_short       ;make wide EN pulse
      CBI   PORTB, 0          ;EN = 0 for H-to-L pulse
      RCALL delay_us          ;delay in micro seconds
      ;----------------------------------------------------
      MOV   R27, R16
      SWAP  R27               ;swap nibbles
      ANDI  R27, 0xF0         ;mask low nibble & keep high nibble
      OUT   PORTD, R27        ;o/p high nibble to port D
      SBI   PORTB, 0          ;EN = 1
      RCALL delay_short       ;widen EN pulse
      CBI   PORTB, 0          ;EN = 0 for H-to-L pulse
      RCALL delay_us          ;delay in micro seconds
      RET
;================================================================
disp_message:
      LDI   R16, 'I'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'n'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'i'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 't'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'i'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'a'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'l'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'i'
      RCALL data_wrt
      rcall delay_seconds
      LDI   R16, 'z'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'i'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'n'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'g'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, ' '
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'L'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'C'
      RCALL data_wrt
      RCALL delay_seconds
      LDI   R16, 'D'
      RCALL data_wrt
      ;----------------
      LDI   R17, 12           ;wait 3 seconds
l2:   RCALL delay_seconds
      DEC   R17
      BRNE  l2
      RET
;================================================================
delay_short:
      NOP
      NOP
      RET
;------------------------
delay_us:
      LDI   R20, 90
l3:   RCALL delay_short
      DEC   R20
      BRNE  l3
      RET
;-----------------------
delay_ms:
      LDI   R21, 40
l4:   RCALL delay_us
      DEC   R21
      BRNE  l4
      RET
;================================================================
delay_seconds:        ;nested loop subroutine (max delay 3.11s)
    LDI   R20, 255    ;outer loop counter 
l5: LDI   R21, 255    ;mid loop counter
l6: LDI   R22, 20     ;inner loop counter to give 0.25s delay
l7: DEC   R22         ;decrement inner loop
    BRNE  l7          ;loop if not zero
    DEC   R21         ;decrement mid loop
    BRNE  l6          ;loop if not zero
    DEC   R20         ;decrement outer loop
    BRNE  l5          ;loop if not zero
    RET               ;return to caller
;----------------------------------------------------------------

displayBrightness:
    ldi ZL, low(banana*2)
    ldi ZH, high(banana*2)
    
render_loop:
    lpm r16, Z+
    call data_wrt
    tst r16
    brne render_loop
	ret
banana:
      .db " Brightness --> ", 0