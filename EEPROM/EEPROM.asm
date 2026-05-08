
_main:

;EEPROM.c,3 :: 		void main() {
;EEPROM.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;EEPROM.c,5 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;EEPROM.c,7 :: 		i = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _i+0
	CLRF       _i+1
;EEPROM.c,8 :: 		if(i > 9 || i < 0) i = 0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _i+0, 0
	SUBLW      9
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L__main9
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      _i+0, 0
L__main12:
	BTFSS      STATUS+0, 0
	GOTO       L__main9
	GOTO       L_main2
L__main9:
	CLRF       _i+0
	CLRF       _i+1
L_main2:
;EEPROM.c,10 :: 		while(1)
L_main3:
;EEPROM.c,12 :: 		for(; i < 10; i++)
L_main5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      10
	SUBWF      _i+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;EEPROM.c,14 :: 		PORTB = arr[i];
	MOVF       _i+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;EEPROM.c,15 :: 		EEPROM_Write(0x00, i);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,16 :: 		delay_ms(100);
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
;EEPROM.c,12 :: 		for(; i < 10; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;EEPROM.c,17 :: 		}
	GOTO       L_main5
L_main6:
;EEPROM.c,18 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;EEPROM.c,19 :: 		}
	GOTO       L_main3
;EEPROM.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
