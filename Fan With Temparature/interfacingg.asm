
_main:

;interfacingg.c,25 :: 		void main()
;interfacingg.c,28 :: 		TRISA = 0x01;   // RA0 input (LM35)
	MOVLW      1
	MOVWF      TRISA+0
;interfacingg.c,29 :: 		TRISB = 0x00;   // LCD output
	CLRF       TRISB+0
;interfacingg.c,30 :: 		TRISC = 0x00;   // Relay output
	CLRF       TRISC+0
;interfacingg.c,31 :: 		TRISD = 0x07;   // Buttons input (RD0,RD1,RD2)
	MOVLW      7
	MOVWF      TRISD+0
;interfacingg.c,33 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;interfacingg.c,34 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;interfacingg.c,37 :: 		ADCON1 = 0x80;   // AN0 analog, Vref = VDD
	MOVLW      128
	MOVWF      ADCON1+0
;interfacingg.c,39 :: 		ADC_Init();
	CALL       _ADC_Init+0
;interfacingg.c,42 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;interfacingg.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;interfacingg.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;interfacingg.c,47 :: 		Lcd_Out(1,1,"Temperature");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_interfacingg+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,48 :: 		Lcd_Out(2,1,"Monitoring");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_interfacingg+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,50 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;interfacingg.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;interfacingg.c,54 :: 		while(1)
L_main1:
;interfacingg.c,57 :: 		adc_raw = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_raw+0
	MOVF       R0+1, 0
	MOVWF      _adc_raw+1
;interfacingg.c,60 :: 		voltage = adc_raw * 4.88;
	CALL       _word2double+0
	MOVLW      246
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltage+0
	MOVF       R0+1, 0
	MOVWF      _voltage+1
	MOVF       R0+2, 0
	MOVWF      _voltage+2
	MOVF       R0+3, 0
	MOVWF      _voltage+3
;interfacingg.c,63 :: 		temp_c = voltage / 10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp_c+0
	MOVF       R0+1, 0
	MOVWF      _temp_c+1
	MOVF       R0+2, 0
	MOVWF      _temp_c+2
	MOVF       R0+3, 0
	MOVWF      _temp_c+3
;interfacingg.c,66 :: 		Lcd_Out(1,1,"Temp = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_interfacingg+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,68 :: 		FloatToStr(temp_c, txt);
	MOVF       _temp_c+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _temp_c+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _temp_c+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _temp_c+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;interfacingg.c,70 :: 		Lcd_Out(1,8,txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,73 :: 		Lcd_Chr(1,14,223);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;interfacingg.c,74 :: 		Lcd_Chr_CP('C');
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;interfacingg.c,77 :: 		if(temp_c >= 30)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	MOVF       _temp_c+2, 0
	MOVWF      R0+2
	MOVF       _temp_c+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;interfacingg.c,79 :: 		Relay_Pin = 1;   // FAN ON
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;interfacingg.c,80 :: 		Lcd_Out(2,1,"FAN : ON ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_interfacingg+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,81 :: 		}
	GOTO       L_main4
L_main3:
;interfacingg.c,84 :: 		Relay_Pin = 0;   // FAN OFF
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;interfacingg.c,85 :: 		Lcd_Out(2,1,"FAN : OFF");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_interfacingg+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;interfacingg.c,86 :: 		}
L_main4:
;interfacingg.c,88 :: 		Delay_ms(500);
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
;interfacingg.c,89 :: 		}
	GOTO       L_main1
;interfacingg.c,90 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
