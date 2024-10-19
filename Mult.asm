// Multiplies R0 and R1 and stores the result in R2.
// Initialize R2 to 0 (this will store the result)
@R2
M=0         // R2 = 0

// Initialize the loop counter (R1 will act as the counter)
@R1
D=M         // D = R1 (counter)
@END
D;JEQ       // If R1 == 0, jump to END (no need to multiply)

// Loop start
(LOOP)
    @R0
    D=M     // D = R0 (the value to add)
    @R2
    M=M+D   // R2 = R2 + R0 (add R0 to the result)

    @R1
    M=M-1   // R1 = R1 - 1 (decrement counter)
    D=M
    @LOOP
    D;JGT   // If R1 > 0, repeat the loop

// End of the program
(END)
    @END
    0;JMP   // Infinite loop to end the program
