void main() {
    unsigned int i;
    TRISB = 0x00; // Set PORTB as Output
    PORTB = 0x00; // Reset PORTB

    while(1) {
        // --- CLOCKWISE ROTATION ---
        for(i = 0; i < 100; i++) {
            PORTB = 0b00001001; Delay_ms(100); // Step 1
            PORTB = 0b00001100; Delay_ms(100); // Step 2
            PORTB = 0b00000110; Delay_ms(100); // Step 3
            PORTB = 0b00000011; Delay_ms(100); // Step 4
        }

        PORTB = 0x00;      // Turn off coils to prevent overheating
        Delay_ms(3000);    // 3 Second Pause

        // --- COUNTER-CLOCKWISE ROTATION ---
        // We run the exact same steps in reverse order
        for(i = 0; i < 100; i++) {
            PORTB = 0b00000011; Delay_ms(100); // Step 4
            PORTB = 0b00000110; Delay_ms(100); // Step 3
            PORTB = 0b00001100; Delay_ms(100); // Step 2
            PORTB = 0b00001001; Delay_ms(100); // Step 1
        }

        PORTB = 0x00;      // Turn off coils
        Delay_ms(3000);    // 3 Second Pause
    }
}