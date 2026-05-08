
_main:

;multiplexer.c,7 :: 		void main() {
;multiplexer.c,8 :: 		TRISB = 0x00;    // Data lines (Segments A-G)
	CLRF       TRISB+0
;multiplexer.c,9 :: 		TRISC = 0x00;    // Control lines (R0(And RC1 for Digit 1 and 2)
	CLRF       TRISC+0
;multiplexer.c,10 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;multiplexer.c,12 :: 		while(1) {
L_main0:
;multiplexer.c,14 :: 		tens = count / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _tens+0
	MOVF       R0+1, 0
	MOVWF      _tens+1
;multiplexer.c,15 :: 		ones = count % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _ones+0
	MOVF       R0+1, 0
	MOVWF      _ones+1
;multiplexer.c,18 :: 		for(i = 0; i < 25; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      25
	SUBWF      _i+0, 0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;multiplexer.c,21 :: 		PORTB = array[tens]; // Load pattern
	MOVF       _tens+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;multiplexer.c,22 :: 		PORTC.F0 = 1;        // Turn on Digit 1 (Right or Left depending on wiring)
	BSF        PORTC+0, 0
;multiplexer.c,23 :: 		delay_ms(10);        // Wait 10ms
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;multiplexer.c,24 :: 		PORTC.F0 = 0;        // Turn off Digit 1
	BCF        PORTC+0, 0
;multiplexer.c,27 :: 		PORTB = array[ones]; // Load pattern
	MOVF       _ones+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;multiplexer.c,28 :: 		PORTC.F1 = 1;        // Turn on Digit 2
	BSF        PORTC+0, 1
;multiplexer.c,29 :: 		delay_ms(10);        // Wait 10ms
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;multiplexer.c,30 :: 		PORTC.F1 = 0;        // Turn off Digit 2
	BCF        PORTC+0, 1
;multiplexer.c,18 :: 		for(i = 0; i < 25; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;multiplexer.c,31 :: 		}
	GOTO       L_main2
L_main3:
;multiplexer.c,34 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;multiplexer.c,35 :: 		if(count > 99) count = 0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       _count+0, 0
	SUBLW      99
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	CLRF       _count+0
	CLRF       _count+1
L_main7:
;multiplexer.c,36 :: 		}
	GOTO       L_main0
;multiplexer.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
