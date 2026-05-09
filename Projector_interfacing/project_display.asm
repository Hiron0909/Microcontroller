
_main:

;project_display.c,26 :: 		void main(){
;project_display.c,28 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;project_display.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,33 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;project_display.c,34 :: 		PORTC.F0 = 1;
	BSF        PORTC+0, 0
;project_display.c,35 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;project_display.c,36 :: 		PORTC.F2 = 0;
	BCF        PORTC+0, 2
;project_display.c,37 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;project_display.c,39 :: 		TRISD = 0xFF;
	MOVLW      255
	MOVWF      TRISD+0
;project_display.c,40 :: 		PORTD.F0 = 0;
	BCF        PORTD+0, 0
;project_display.c,41 :: 		PORTD.F1 = 0;
	BCF        PORTD+0, 1
;project_display.c,42 :: 		PORTD.F2 = 0;
	BCF        PORTD+0, 2
;project_display.c,45 :: 		while(1) {                         // Endless loop
L_main1:
;project_display.c,47 :: 		if(portd.f0 == 1)
	BTFSS      PORTD+0, 0
	GOTO       L_main3
;project_display.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,51 :: 		PORTC.F0 = 1;
	BSF        PORTC+0, 0
;project_display.c,52 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;project_display.c,53 :: 		PORTC.F2 = 1;
	BSF        PORTC+0, 2
;project_display.c,54 :: 		Lcd_Out(1,4,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,55 :: 		Lcd_Out(2,4,txt2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,56 :: 		}
	GOTO       L_main4
L_main3:
;project_display.c,58 :: 		else if(portd.f1 == 1)
	BTFSS      PORTD+0, 1
	GOTO       L_main5
;project_display.c,59 :: 		{   Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,60 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,61 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;project_display.c,62 :: 		PORTC.F1 = 1;
	BSF        PORTC+0, 1
;project_display.c,63 :: 		PORTC.F2 = 1;
	BSF        PORTC+0, 2
;project_display.c,64 :: 		Lcd_Out(1,4,txt3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,65 :: 		Lcd_Out(2,4,txt4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,66 :: 		}
	GOTO       L_main6
L_main5:
;project_display.c,68 :: 		else if(portd.f2 == 1)
	BTFSS      PORTD+0, 2
	GOTO       L_main7
;project_display.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,71 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project_display.c,72 :: 		PORTC.F2 = 0;
	BCF        PORTC+0, 2
;project_display.c,73 :: 		Lcd_Out(1,4,txt5);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,74 :: 		Lcd_Out(2,4,txt6);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project_display.c,75 :: 		}
L_main7:
L_main6:
L_main4:
;project_display.c,77 :: 		}
	GOTO       L_main1
;project_display.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
