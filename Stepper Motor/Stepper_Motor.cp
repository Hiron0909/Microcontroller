#line 1 "C:/Users/faisa/Desktop/Microcontroller/Stepper Motor/Stepper_Motor.c"
void main(){
 TRISB = 0x00;
 PORTB = 0x00;
 while(1)
 {
 PORTB = 0b00000011;
 Delay_ms(500);
 PORTB = 0b00000110;
 Delay_ms(500);
 PORTB = 0b00001100;
 Delay_ms(500);
 PORTB = 0b00001001;
 Delay_ms(500);
 }
}
