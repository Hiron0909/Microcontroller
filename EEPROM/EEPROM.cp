#line 1 "C:/Users/faisa/Desktop/Microcontroller/EEPROM/EEPROM.c"
char arr[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int i;
void main() {
 TRISB = 0x00;
 PORTB = 0xFF;

 i = EEPROM_Read(0x00);
 if(i > 9 || i < 0) i = 0;

 while(1)
 {
 for(; i < 10; i++)
 {
 PORTB = arr[i];
 EEPROM_Write(0x00, i);
 delay_ms(100);
 }
 i = 0;
 }
}
