// LCD module connections
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
// End LCD module connections

char txt1[] = "Button 1";
char txt2[] = "Motor Forward";
char txt3[] = "button 2";
char txt4[] = "mtor back";
char txt5[] = "button 3";
char txt6[] = "stopped";



void main(){

  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
//  Lcd_Out(1,6,txt3);

     TRISC = 0x00;
    PORTC.F0 = 1;
    PORTC.F1 = 0;
    PORTC.F2 = 0;
    delay_ms(400);

    TRISD = 0xFF;
    PORTD.F0 = 0;
    PORTD.F1 = 0;
    PORTD.F2 = 0;


  while(1) {                         // Endless loop

        if(portd.f0 == 1)
        {
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Cmd(_LCD_CURSOR_OFF);
            PORTC.F0 = 1;
            PORTC.F1 = 0;
            PORTC.F2 = 1;
            Lcd_Out(1,4,txt1);
            Lcd_Out(2,4,txt2);
        }

        else if(portd.f1 == 1)
        {   Lcd_Cmd(_LCD_CLEAR);
            Lcd_Cmd(_LCD_CURSOR_OFF);
            PORTC.F0 = 0;
            PORTC.F1 = 1;
            PORTC.F2 = 1;
            Lcd_Out(1,4,txt3);
            Lcd_Out(2,4,txt4);
        }

        else if(portd.f2 == 1)
        {
           Lcd_Cmd(_LCD_CLEAR);
            Lcd_Cmd(_LCD_CURSOR_OFF);
           PORTC.F2 = 0;
           Lcd_Out(1,4,txt5);
           Lcd_Out(2,4,txt6);
        }

  }
}