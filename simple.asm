.ORIG x3000

MAIN
LD R0, NEWLINE
OUT
LD R1, NEGASCII

GETC
OUT 
GETC
OUT
ADD R1, R1, R0
AND R2, R1, #1
BRz EVEN

LD R0, NEWLINE
OUT
LD R0, ODD
OUT
BR MAIN

EVEN
LD R0, NEWLINE
OUT
LD R0, ASCII
OUT
BR MAIN

HALT

NEGASCII .FILL #-48
ASCII .FILL #48
NEWLINE .FILL #10
ODD .FILL #49

.END 