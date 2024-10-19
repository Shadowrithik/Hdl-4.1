// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e., writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@SCREEN         // Base address of the screen (0x4000)
D=M             // Load the value at the screen base address into D (initial state)

@KBD            // Base address of the keyboard (0x6000)
D=M             // Load keyboard input into D
@CHECK_KEY      // Jump to check key pressed
0;JMP           // Jump unconditionally

// Checks whether a key is pressed.
(CHECK_KEY)
@KBD            // Keyboard address (0x6000)
D=M             // Load keyboard input into D
@FILL_SCREEN    // If a key is pressed, jump to FILL_SCREEN
D;JNE           // Jump if D (keyboard input) is not zero (a key is pressed)
@CLEAR_SCREEN   // If no key is pressed, jump to CLEAR_SCREEN
0;JMP           // Jump unconditionally

// Fills the entire screen with black.
(FILL_SCREEN)
@SCREEN         // Set A to base address of the screen (0x4000)
D=A             // Store address in D
@END_FILL_LOOP  // Check if screen filling is complete
D=A             // Store address of end
@FILL_LOOP      // Start of fill loop
0;JMP

// Clear the screen (fill with white).
(CLEAR_SCREEN)
@SCREEN         // Set A to base address of the screen (0x4000)
