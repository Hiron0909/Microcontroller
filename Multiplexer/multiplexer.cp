#line 1 "C:/Users/faisa/Desktop/Microcontroller/Multiplexer/multiplexer.c"
char array[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

int count = 0;
int tens, ones;
int i;

void main() {
 TRISB = 0x00;
 TRISC = 0x00;
 PORTC = 0x00;

 while(1) {

 tens = count / 10;
 ones = count % 10;


 for(i = 0; i < 25; i++) {


 PORTB = array[tens];
 PORTC.F0 = 1;
 delay_ms(10);
 PORTC.F0 = 0;


 PORTB = array[ones];
 PORTC.F1 = 1;
 delay_ms(10);
 PORTC.F1 = 0;
 }


 count++;
 if(count > 99) count = 0;
 }
}
