#line 1 "C:/Users/faisa/Desktop/Microcontroller/Fan With Temparature/interfacingg.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;



sbit Relay_Pin at RC0_bit;


unsigned int adc_raw;
float voltage, temp_c;
char txt[16];

void main()
{

 TRISA = 0x01;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x07;

 PORTB = 0x00;
 PORTC = 0x00;


 ADCON1 = 0x80;

 ADC_Init();


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 Lcd_Out(1,1,"Temperature");
 Lcd_Out(2,1,"Monitoring");

 Delay_ms(2000);

 Lcd_Cmd(_LCD_CLEAR);

 while(1)
 {

 adc_raw = ADC_Read(0);


 voltage = adc_raw * 4.88;


 temp_c = voltage / 10.0;


 Lcd_Out(1,1,"Temp = ");

 FloatToStr(temp_c, txt);

 Lcd_Out(1,8,txt);


 Lcd_Chr(1,14,223);
 Lcd_Chr_CP('C');


 if(temp_c >= 30)
 {
 Relay_Pin = 1;
 Lcd_Out(2,1,"FAN : ON ");
 }
 else
 {
 Relay_Pin = 0;
 Lcd_Out(2,1,"FAN : OFF");
 }

 Delay_ms(500);
 }
}
