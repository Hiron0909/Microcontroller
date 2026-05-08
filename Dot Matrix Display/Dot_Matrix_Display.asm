
_MSDelay:

;Dot_Matrix_Display.c,1 :: 		void MSDelay(unsigned char time)
;Dot_Matrix_Display.c,4 :: 		for(y = 0 ; y < time; y++)
	CLRF       R1+0
L_MSDelay0:
	MOVF       FARG_MSDelay_time+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_MSDelay1
;Dot_Matrix_Display.c,5 :: 		for(z = 0 ; z < 10; z++);
	CLRF       R2+0
L_MSDelay3:
	MOVLW      10
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_MSDelay4
	INCF       R2+0, 1
	GOTO       L_MSDelay3
L_MSDelay4:
;Dot_Matrix_Display.c,4 :: 		for(y = 0 ; y < time; y++)
	INCF       R1+0, 1
;Dot_Matrix_Display.c,5 :: 		for(z = 0 ; z < 10; z++);
	GOTO       L_MSDelay0
L_MSDelay1:
;Dot_Matrix_Display.c,6 :: 		}
L_end_MSDelay:
	RETURN
; end of _MSDelay

_main:

;Dot_Matrix_Display.c,8 :: 		void main() {
;Dot_Matrix_Display.c,9 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Dot_Matrix_Display.c,10 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Dot_Matrix_Display.c,12 :: 		while(1)
L_main6:
;Dot_Matrix_Display.c,14 :: 		PORTD = 0b10000000; PORTC = 0b00000000; MSDelay(10);
	MOVLW      128
	MOVWF      PORTD+0
	CLRF       PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,15 :: 		PORTD = 0b01000000; PORTC = 0b11111111; MSDelay(10);
	MOVLW      64
	MOVWF      PORTD+0
	MOVLW      255
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,16 :: 		PORTD = 0b00100000; PORTC = 0b11111111; MSDelay(10);
	MOVLW      32
	MOVWF      PORTD+0
	MOVLW      255
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,17 :: 		PORTD = 0b00010000; PORTC = 0b00011000; MSDelay(10);
	MOVLW      16
	MOVWF      PORTD+0
	MOVLW      24
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,18 :: 		PORTD = 0b00001000; PORTC = 0b00100100; MSDelay(10);
	MOVLW      8
	MOVWF      PORTD+0
	MOVLW      36
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,19 :: 		PORTD = 0b00000100; PORTC = 0b01000010; MSDelay(10);
	MOVLW      4
	MOVWF      PORTD+0
	MOVLW      66
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,20 :: 		PORTD = 0b00000010; PORTC = 0b10000001; MSDelay(10);
	MOVLW      2
	MOVWF      PORTD+0
	MOVLW      129
	MOVWF      PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,21 :: 		PORTD = 0b00000001; PORTC = 0b00000000; MSDelay(10);
	MOVLW      1
	MOVWF      PORTD+0
	CLRF       PORTC+0
	MOVLW      10
	MOVWF      FARG_MSDelay_time+0
	CALL       _MSDelay+0
;Dot_Matrix_Display.c,22 :: 		}
	GOTO       L_main6
;Dot_Matrix_Display.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
