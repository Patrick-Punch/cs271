// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(START)
@8192 // Number of pixels on the screen
D=A
@pixel // Define remaining pixels to color
M=D
(LOOP)
@pixel
M=M-1
D=M
@START
D;JLT // Restart if you colored all the pixels
@KBD // Check keyboard memory address 24576 to see if a key is pressed
D=M
@CLEAR_SCREEN
D;JEQ // If no key is pressed - clear screen, else fill screen
@FILL_SCREEN
0;JMP
(FILL_SCREEN)           
@SCREEN // Load the screen address
D=A
@pixel
A=D+M
M=-1 // Set memory to -1 to color pixels
@LOOP
0;JMP
(CLEAR_SCREEN)
@SCREEN // Load the screen address
D=A
@pixel
A=D+M
M=0 // Set memory to 0 to clear pixels
@LOOP
0;JMP
