void main(){
  TRISB = 0x00;
  PORTB = 0x00;
    while(1)
    {
      PORTB = 0b00000011;
      Delay_ms(500);  // STOP FOR 0.5 SECOND
      PORTB = 0b00000110;
      Delay_ms(500);
      PORTB = 0b00001100;
      Delay_ms(500);
      PORTB = 0b00001001;
      Delay_ms(500);
    }
}