#line 1 "C:/Users/faisa/Desktop/Microcontroller/Stepper Motor/Stepper_Motor.c"
void main() {
 unsigned int i;
 TRISB = 0x00;
 PORTB = 0x00;

 while(1) {

 for(i = 0; i < 100; i++) {
 PORTB = 0b00001001; Delay_ms(100);
 PORTB = 0b00001100; Delay_ms(100);
 PORTB = 0b00000110; Delay_ms(100);
 PORTB = 0b00000011; Delay_ms(100);
 }

 PORTB = 0x00;
 Delay_ms(3000);



 for(i = 0; i < 100; i++) {
 PORTB = 0b00000011; Delay_ms(100);
 PORTB = 0b00000110; Delay_ms(100);
 PORTB = 0b00001100; Delay_ms(100);
 PORTB = 0b00001001; Delay_ms(100);
 }

 PORTB = 0x00;
 Delay_ms(3000);
 }
}
