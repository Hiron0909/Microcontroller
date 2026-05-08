#line 1 "C:/Users/faisa/Desktop/Microcontroller/DC Motor/DC_Motor.c"
void main() {

 TRISB.F0 = 0;
 TRISB.F1 = 0;
 TRISB.F2 = 0;
 TRISD.F0 = 1;

 PORTB.F0 = 1;
 PORTB.F1 = 0;

 PORTB.F2 = 0;
 while(1) {

 if (PORTD.F0 == 1) {
 PORTB.F2 = 1;
 }
 else {
 PORTB.F2 = 0;
 }
 }
}
