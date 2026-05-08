
_display:

;seven_segment_four_display.c,5 :: 		void display(unsigned int num) {
;seven_segment_four_display.c,9 :: 		digit = num / 1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
;seven_segment_four_display.c,10 :: 		PORTA = 0x01;              // Enable Digit 1 (RA0)
	MOVLW      1
	MOVWF      PORTA+0
;seven_segment_four_display.c,11 :: 		PORTB = segment_code[digit];
	MOVF       R0+0, 0
	ADDLW      _segment_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_four_display.c,12 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display0:
	DECFSZ     R13+0, 1
	GOTO       L_display0
	DECFSZ     R12+0, 1
	GOTO       L_display0
	NOP
	NOP
;seven_segment_four_display.c,15 :: 		digit = (num / 100) % 10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;seven_segment_four_display.c,16 :: 		PORTA = 0x02;              // Enable Digit 2 (RA1)
	MOVLW      2
	MOVWF      PORTA+0
;seven_segment_four_display.c,17 :: 		PORTB = segment_code[digit];
	MOVF       R0+0, 0
	ADDLW      _segment_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_four_display.c,18 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display1:
	DECFSZ     R13+0, 1
	GOTO       L_display1
	DECFSZ     R12+0, 1
	GOTO       L_display1
	NOP
	NOP
;seven_segment_four_display.c,21 :: 		digit = (num / 10) % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;seven_segment_four_display.c,22 :: 		PORTA = 0x04;              // Enable Digit 3 (RA2)
	MOVLW      4
	MOVWF      PORTA+0
;seven_segment_four_display.c,23 :: 		PORTB = segment_code[digit];
	MOVF       R0+0, 0
	ADDLW      _segment_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_four_display.c,24 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display2:
	DECFSZ     R13+0, 1
	GOTO       L_display2
	DECFSZ     R12+0, 1
	GOTO       L_display2
	NOP
	NOP
;seven_segment_four_display.c,27 :: 		digit = num % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;seven_segment_four_display.c,28 :: 		PORTA = 0x08;              // Enable Digit 4 (RA3)
	MOVLW      8
	MOVWF      PORTA+0
;seven_segment_four_display.c,29 :: 		PORTB = segment_code[digit];
	MOVF       R0+0, 0
	ADDLW      _segment_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment_four_display.c,30 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display3:
	DECFSZ     R13+0, 1
	GOTO       L_display3
	DECFSZ     R12+0, 1
	GOTO       L_display3
	NOP
	NOP
;seven_segment_four_display.c,31 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;seven_segment_four_display.c,33 :: 		void main() {
;seven_segment_four_display.c,34 :: 		ADCON1 = 0x07;             // Configure PORTA as digital
	MOVLW      7
	MOVWF      ADCON1+0
;seven_segment_four_display.c,35 :: 		TRISB = 0x00;              // PORTB as output (Segments)
	CLRF       TRISB+0
;seven_segment_four_display.c,36 :: 		TRISA = 0x00;              // PORTA as output (Digit Selectors)
	CLRF       TRISA+0
;seven_segment_four_display.c,38 :: 		while(1) {
L_main4:
;seven_segment_four_display.c,39 :: 		display(display_value); // Keep refreshing the display
	MOVF       _display_value+0, 0
	MOVWF      FARG_display_num+0
	MOVF       _display_value+1, 0
	MOVWF      FARG_display_num+1
	CALL       _display+0
;seven_segment_four_display.c,40 :: 		}
	GOTO       L_main4
;seven_segment_four_display.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
