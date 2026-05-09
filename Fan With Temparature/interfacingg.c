//================ LCD CONNECTION =================
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
//=================================================

// Relay connected at RC0
sbit Relay_Pin at RC0_bit;

// Variables
unsigned int adc_raw;
float voltage, temp_c;
char txt[16];

void main()
{
    //=========== PORT CONFIGURATION ===========
    TRISA = 0x01;   // RA0 input (LM35)
    TRISB = 0x00;   // LCD output
    TRISC = 0x00;   // Relay output
    TRISD = 0x07;   // Buttons input (RD0,RD1,RD2)

    PORTB = 0x00;
    PORTC = 0x00;

    //=========== ADC CONFIGURATION ============
    ADCON1 = 0x80;   // AN0 analog, Vref = VDD

    ADC_Init();

    //=========== LCD INIT =====================
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    // Welcome message
    Lcd_Out(1,1,"Temperature");
    Lcd_Out(2,1,"Monitoring");

    Delay_ms(2000);

    Lcd_Cmd(_LCD_CLEAR);

    while(1)
    {
        //========== READ ADC ==================
        adc_raw = ADC_Read(0);

        //========== ADC TO VOLTAGE ============
        voltage = adc_raw * 4.88;

        //========== VOLTAGE TO TEMP ===========
        temp_c = voltage / 10.0;

        //========== DISPLAY ===================
        Lcd_Out(1,1,"Temp = ");

        FloatToStr(temp_c, txt);

        Lcd_Out(1,8,txt);

        // Degree symbol
        Lcd_Chr(1,14,223);
        Lcd_Chr_CP('C');

        //========== RELAY CONTROL =============
        if(temp_c >= 30)
        {
            Relay_Pin = 1;   // FAN ON
            Lcd_Out(2,1,"FAN : ON ");
        }
        else
        {
            Relay_Pin = 0;   // FAN OFF
            Lcd_Out(2,1,"FAN : OFF");
        }

        Delay_ms(500);
    }
}