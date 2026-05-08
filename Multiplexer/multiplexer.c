char array[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

int count = 0;      // The n°&Ar you want to display
int tens, ones;
int i;

void main() {
    TRISB = 0x00;    // Data lines (Segments A-G)
    TRISC = 0x00;    // Control lines (R0(And RC1 for Digit 1 and 2)
    PORTC = 0x00;

    while(1) {
        // 1. Calculate Digits
        tens = count / 10;
        ones = count % 10;

        // 2. Refresh Loop (Displað&Ae same number for about 500ms)
        for(i = 0; i < 25; i++) {

            // Display Tens Digit
            PORTB = array[tens]; // Load pattern
            PORTC.F0 = 1;        // Turn on Digit 1 (Right or Left depending on wiring)
            delay_ms(10);        // Wait 10ms
            PORTC.F0 = 0;        // Turn off Digit 1

            // Display Ones Digit
            PORTB = array[ones]; // Load pattern
            PORTC.F1 = 1;        // Turn on Digit 2
            delay_ms(10);        // Wait 10ms
            PORTC.F1 = 0;        // Turn off Digit 2
        }

        // 3. Increment counter
        count++;
        if(count > 99) count = 0;
    }
}
