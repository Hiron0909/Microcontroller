
_main:

;Servo_Motor.c,2 :: 		void main(){
;Servo_Motor.c,3 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Servo_Motor.c,4 :: 		PORTB = 0;
	CLRF       PORTB+0
;Servo_Motor.c,7 :: 		while(1){
L_main0:
;Servo_Motor.c,8 :: 		for(i = 0 ; i < 50; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      50
	SUBWF      _i+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Servo_Motor.c,10 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;Servo_Motor.c,11 :: 		delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Servo_Motor.c,12 :: 		PORTB = 0;
	CLRF       PORTB+0
;Servo_Motor.c,13 :: 		delay_ms(19);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;Servo_Motor.c,8 :: 		for(i = 0 ; i < 50; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Servo_Motor.c,14 :: 		}
	GOTO       L_main2
L_main3:
;Servo_Motor.c,15 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Servo_Motor.c,17 :: 		for(i = 0 ; i < 50; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      50
	SUBWF      _i+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Servo_Motor.c,19 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;Servo_Motor.c,20 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
;Servo_Motor.c,21 :: 		PORTB = 0;
	CLRF       PORTB+0
;Servo_Motor.c,22 :: 		delay_ms(18);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;Servo_Motor.c,17 :: 		for(i = 0 ; i < 50; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Servo_Motor.c,23 :: 		}
	GOTO       L_main8
L_main9:
;Servo_Motor.c,24 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Servo_Motor.c,25 :: 		for(i = 0 ; i < 50; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main14:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      50
	SUBWF      _i+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;Servo_Motor.c,27 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;Servo_Motor.c,28 :: 		delay_us(2000);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
;Servo_Motor.c,29 :: 		PORTB = 0;
	CLRF       PORTB+0
;Servo_Motor.c,30 :: 		delay_ms(18);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;Servo_Motor.c,25 :: 		for(i = 0 ; i < 50; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Servo_Motor.c,31 :: 		}
	GOTO       L_main14
L_main15:
;Servo_Motor.c,32 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;Servo_Motor.c,34 :: 		for(i = 0 ; i < 50; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main20:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      50
	SUBWF      _i+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;Servo_Motor.c,36 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;Servo_Motor.c,37 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
;Servo_Motor.c,38 :: 		PORTB = 0;
	CLRF       PORTB+0
;Servo_Motor.c,39 :: 		delay_ms(18);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
	NOP
;Servo_Motor.c,34 :: 		for(i = 0 ; i < 50; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Servo_Motor.c,40 :: 		}
	GOTO       L_main20
L_main21:
;Servo_Motor.c,41 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;Servo_Motor.c,42 :: 		}
	GOTO       L_main0
;Servo_Motor.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
