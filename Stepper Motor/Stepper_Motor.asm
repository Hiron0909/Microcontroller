
_main:

;Stepper_Motor.c,1 :: 		void main(){
;Stepper_Motor.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Stepper_Motor.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Stepper_Motor.c,4 :: 		while(1)
L_main0:
;Stepper_Motor.c,6 :: 		PORTB = 0b00000011;
	MOVLW      3
	MOVWF      PORTB+0
;Stepper_Motor.c,7 :: 		Delay_ms(500);  // STOP FOR 0.5 SECOND
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Stepper_Motor.c,8 :: 		PORTB = 0b00000110;
	MOVLW      6
	MOVWF      PORTB+0
;Stepper_Motor.c,9 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Stepper_Motor.c,10 :: 		PORTB = 0b00001100;
	MOVLW      12
	MOVWF      PORTB+0
;Stepper_Motor.c,11 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Stepper_Motor.c,12 :: 		PORTB = 0b00001001;
	MOVLW      9
	MOVWF      PORTB+0
;Stepper_Motor.c,13 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Stepper_Motor.c,14 :: 		}
	GOTO       L_main0
;Stepper_Motor.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
