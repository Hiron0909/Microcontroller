#line 1 "C:/Users/faisa/Desktop/Microcontroller/Servo Motor/Servo_Motor.c"
int i;
void main(){
 TRISB = 0x00;
 PORTB = 0;


 while(1){
 for(i = 0 ; i < 50; i++)
 {
 PORTB = 1;
 delay_us(1000);
 PORTB = 0;
 delay_ms(19);
 }
 delay_ms(1000);

 for(i = 0 ; i < 50; i++)
 {
 PORTB = 1;
 delay_us(1500);
 PORTB = 0;
 delay_ms(18);
 }
 delay_ms(1000);
 for(i = 0 ; i < 50; i++)
 {
 PORTB = 1;
 delay_us(2000);
 PORTB = 0;
 delay_ms(18);
 }
 delay_ms(1000);

 for(i = 0 ; i < 50; i++)
 {
 PORTB = 1;
 delay_us(1500);
 PORTB = 0;
 delay_ms(18);
 }
 delay_ms(1000);
 }
}
