
_main:

;DC_Motor.c,1 :: 		void main() {
;DC_Motor.c,3 :: 		TRISB.F0 = 0; // RB0 as Output (connected to L293D IN1)
	BCF        TRISB+0, 0
;DC_Motor.c,4 :: 		TRISB.F1 = 0; // RB1 as Output (connected to L293D IN2)
	BCF        TRISB+0, 1
;DC_Motor.c,5 :: 		TRISB.F2 = 0; // RB2 as Output (connected to L293D EN1)
	BCF        TRISB+0, 2
;DC_Motor.c,6 :: 		TRISD.F0 = 1; // RD0 as Input  (connected to Button)
	BSF        TRISD+0, 0
;DC_Motor.c,8 :: 		PORTB.F0 = 1; // IN1 = High
	BSF        PORTB+0, 0
;DC_Motor.c,9 :: 		PORTB.F1 = 0; // IN2 = Low
	BCF        PORTB+0, 1
;DC_Motor.c,11 :: 		PORTB.F2 = 0; // EN1 = Low
	BCF        PORTB+0, 2
;DC_Motor.c,12 :: 		while(1) {
L_main0:
;DC_Motor.c,14 :: 		if (PORTD.F0 == 1) {
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;DC_Motor.c,15 :: 		PORTB.F2 = 1; // Motor ON (Enable High)
	BSF        PORTB+0, 2
;DC_Motor.c,16 :: 		}
	GOTO       L_main3
L_main2:
;DC_Motor.c,18 :: 		PORTB.F2 = 0; // Motor OFF (Enable Low)
	BCF        PORTB+0, 2
;DC_Motor.c,19 :: 		}
L_main3:
;DC_Motor.c,20 :: 		}
	GOTO       L_main0
;DC_Motor.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
