// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

@2
M=0 // Initialize M[2] to 0 
(LOOP)
@1
D=M
@IS_ZERO
D;JEQ // Jump to the end if M[1] has reached zero
@0
D=M
@2
M=D+M // Add M[0] to the total product
@1
M=M-1 // Decrement M[1]
@LOOP // Jump up to add again
(IS_ZERO)
0;JMP