#line 1 "C:/Users/faisa/Desktop/Microcontroller/Dot Matrix Display/Dot_Matrix_Display.c"
void MSDelay(unsigned char time)
{
 unsigned char y, z;
 for(y = 0 ; y < time; y++)
 for(z = 0 ; z < 10; z++);
}

void main() {
 TRISC = 0x00;
 TRISD = 0x00;

 while(1)
 {
 PORTD = 0b10000000; PORTC = 0b00000000; MSDelay(10);
 PORTD = 0b01000000; PORTC = 0b11111111; MSDelay(10);
 PORTD = 0b00100000; PORTC = 0b11111111; MSDelay(10);
 PORTD = 0b00010000; PORTC = 0b00011000; MSDelay(10);
 PORTD = 0b00001000; PORTC = 0b00100100; MSDelay(10);
 PORTD = 0b00000100; PORTC = 0b01000010; MSDelay(10);
 PORTD = 0b00000010; PORTC = 0b10000001; MSDelay(10);
 PORTD = 0b00000001; PORTC = 0b00000000; MSDelay(10);
 }
}
