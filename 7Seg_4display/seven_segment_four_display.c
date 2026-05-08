// Segment patterns for Common Cathode (0-9)
unsigned char segment_code[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
unsigned int display_value = 1234; // The number to show

void display(unsigned int num) {
    unsigned char digit;

    // Digit 1 (Thousands)
    digit = num / 1000;
    PORTA = 0x01;              // Enable Digit 1 (RA0)
    PORTB = segment_code[digit];
    Delay_ms(5);

    // Digit 2 (Hundreds)
    digit = (num / 100) % 10;
    PORTA = 0x02;              // Enable Digit 2 (RA1)
    PORTB = segment_code[digit];
    Delay_ms(5);

    // Digit 3 (Tens)
    digit = (num / 10) % 10;
    PORTA = 0x04;              // Enable Digit 3 (RA2)
    PORTB = segment_code[digit];
    Delay_ms(5);

    // Digit 4 (Units)
    digit = num % 10;
    PORTA = 0x08;              // Enable Digit 4 (RA3)
    PORTB = segment_code[digit];
    Delay_ms(5);
}

void main() {
    ADCON1 = 0x07;             // Configure PORTA as digital
    TRISB = 0x00;              // PORTB as output (Segments)
    TRISA = 0x00;              // PORTA as output (Digit Selectors)

    while(1) {
        display(display_value); // Keep refreshing the display
    }
    
  }