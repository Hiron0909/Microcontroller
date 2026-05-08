void main() {
    // Configure Pin Directions
    TRISB.F0 = 0; // RB0 as Output (connected to L293D IN1)
    TRISB.F1 = 0; // RB1 as Output (connected to L293D IN2)
    TRISB.F2 = 0; // RB2 as Output (connected to L293D EN1)
    TRISD.F0 = 1; // RD0 as Input  (connected to Button)
    // Set Motor Direction (Forward)
    PORTB.F0 = 1; // IN1 = High
    PORTB.F1 = 0; // IN2 = Low
    // Initial State: Motor OFF
    PORTB.F2 = 0; // EN1 = Low
    while(1) {
        // Check if button is pressed (RD0 goes High/1)
        if (PORTD.F0 == 1) {
            PORTB.F2 = 1; // Motor ON (Enable High)
        }
        else {
            PORTB.F2 = 0; // Motor OFF (Enable Low)
        }
    }
}
