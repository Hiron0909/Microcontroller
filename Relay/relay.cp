#line 1 "C:/Users/faisa/Desktop/Microcontroller/Relay/relay.c"
void main() {
 TRISB = 0x00;
 PORTB = 0x00;

 while(1) {
 PORTB.F0 = 1;
 delay_ms(1000);

 PORTB.F0 = 0;
 delay_ms(1000);
 }
}
