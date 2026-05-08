#line 1 "C:/Users/faisa/Desktop/Microcontroller/7Seg_4display/seven_segment_four_display.c"

unsigned char segment_code[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
unsigned int display_value = 1234;

void display(unsigned int num) {
 unsigned char digit;


 digit = num / 1000;
 PORTA = 0x01;
 PORTB = segment_code[digit];
 Delay_ms(5);


 digit = (num / 100) % 10;
 PORTA = 0x02;
 PORTB = segment_code[digit];
 Delay_ms(5);


 digit = (num / 10) % 10;
 PORTA = 0x04;
 PORTB = segment_code[digit];
 Delay_ms(5);


 digit = num % 10;
 PORTA = 0x08;
 PORTB = segment_code[digit];
 Delay_ms(5);
}

void main() {
 ADCON1 = 0x07;
 TRISB = 0x00;
 TRISA = 0x00;

 while(1) {
 display(display_value);
 }

 }
