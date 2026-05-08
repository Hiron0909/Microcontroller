#line 1 "C:/Users/faisa/Desktop/Microcontroller/ADC/adc.c"

unsigned int valADC;
char x[7];

void main()
{

 ADCON1 = 0x80;
 TRISA0_bit = 1;


 UART1_Init(9600);
 ADC_Init();

 Delay_ms(100);

 while(1)
 {

 valADC = ADC_Read(0);


 IntToStr(valADC, x);


 UART1_Write_Text("Analog value = ");
 UART1_Write_Text(Ltrim(x));


 UART1_Write(13);
 UART1_Write(10);


 Delay_ms(1000);
 }
}
