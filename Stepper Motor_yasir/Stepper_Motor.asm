
_main:

;Stepper_Motor.c,1 :: 		void main() {
;Stepper_Motor.c,3 :: 		TRISB = 0x00; // Set PORTB as Output
	CLRF       TRISB+0
;Stepper_Motor.c,4 :: 		PORTB = 0x00; // Reset PORTB
	CLRF       PORTB+0
;Stepper_Motor.c,6 :: 		while(1) {
L_main0:
;Stepper_Motor.c,8 :: 		for(i = 0; i < 100; i++) {
	CLRF       R1+0
	CLRF       R1+1
L_main2:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      100
	SUBWF      R1+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Stepper_Motor.c,9 :: 		PORTB = 0b00001001; Delay_ms(100); // Step 1
	MOVLW      9
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Stepper_Motor.c,10 :: 		PORTB = 0b00001100; Delay_ms(100); // Step 2
	MOVLW      12
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Stepper_Motor.c,11 :: 		PORTB = 0b00000110; Delay_ms(100); // Step 3
	MOVLW      6
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;Stepper_Motor.c,12 :: 		PORTB = 0b00000011; Delay_ms(100); // Step 4
	MOVLW      3
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;Stepper_Motor.c,8 :: 		for(i = 0; i < 100; i++) {
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Stepper_Motor.c,13 :: 		}
	GOTO       L_main2
L_main3:
;Stepper_Motor.c,15 :: 		PORTB = 0x00;      // Turn off coils to prevent overheating
	CLRF       PORTB+0
;Stepper_Motor.c,16 :: 		Delay_ms(3000);    // 3 Second Pause
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;Stepper_Motor.c,20 :: 		for(i = 0; i < 100; i++) {
	CLRF       R1+0
	CLRF       R1+1
L_main10:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      100
	SUBWF      R1+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;Stepper_Motor.c,21 :: 		PORTB = 0b00000011; Delay_ms(100); // Step 4
	MOVLW      3
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;Stepper_Motor.c,22 :: 		PORTB = 0b00000110; Delay_ms(100); // Step 3
	MOVLW      6
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;Stepper_Motor.c,23 :: 		PORTB = 0b00001100; Delay_ms(100); // Step 2
	MOVLW      12
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;Stepper_Motor.c,24 :: 		PORTB = 0b00001001; Delay_ms(100); // Step 1
	MOVLW      9
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;Stepper_Motor.c,20 :: 		for(i = 0; i < 100; i++) {
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Stepper_Motor.c,25 :: 		}
	GOTO       L_main10
L_main11:
;Stepper_Motor.c,27 :: 		PORTB = 0x00;      // Turn off coils
	CLRF       PORTB+0
;Stepper_Motor.c,28 :: 		Delay_ms(3000);    // 3 Second Pause
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;Stepper_Motor.c,29 :: 		}
	GOTO       L_main0
;Stepper_Motor.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
