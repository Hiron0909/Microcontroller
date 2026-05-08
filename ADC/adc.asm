
_main:

;adc.c,5 :: 		void main()
;adc.c,8 :: 		ADCON1 = 0x80;      // RA0 ?? ???????? ??? ???? ?????????? ?????? ??? ???
	MOVLW      128
	MOVWF      ADCON1+0
;adc.c,9 :: 		TRISA0_bit = 1;     // RA0 ????? ????? ?????? ??? ???
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;adc.c,12 :: 		UART1_Init(9600);   // ???? ?? ???? UART ???? ???
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;adc.c,13 :: 		ADC_Init();         // ADC ????? ???? ???
	CALL       _ADC_Init+0
;adc.c,15 :: 		Delay_ms(100);      // ????????????? ???? ??????? ??? ???????
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;adc.c,17 :: 		while(1)
L_main1:
;adc.c,20 :: 		valADC = ADC_Read(0);        // RA0 (Channel 0) ???? ?????? ????
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valADC+0
	MOVF       R0+1, 0
	MOVWF      _valADC+1
;adc.c,23 :: 		IntToStr(valADC, x);         // ?????????? ????????? ????????
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;adc.c,26 :: 		UART1_Write_Text("Analog value = ");
	MOVLW      ?lstr1_adc+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;adc.c,27 :: 		UART1_Write_Text(Ltrim(x));  // Ltrim ???????? ???????? ????? ????? ???
	MOVLW      _x+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;adc.c,30 :: 		UART1_Write(13);             // Carriage Return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc.c,31 :: 		UART1_Write(10);             // Line Feed
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc.c,34 :: 		Delay_ms(1000);              // ????? ? ??????? ???? ???? ????? ???
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;adc.c,35 :: 		}
	GOTO       L_main1
;adc.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
