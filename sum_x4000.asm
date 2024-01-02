.ORIG x3000

MAIN
AND R4, R4, #0
AND R5, R5, #0
LD R1, NEGASCII
LD R2, START
LD R3, HASH

INPUT_LOOP
IN 
ADD R4, R0, R3
BRz SUM
ADD R0, R0, R1 ; RETURN CORRECT BINARY
STR R0, R2, #0
ADD R2, R2, #1
BR INPUT_LOOP

SUM
STR R0, R2, #0 ; STORE # TO END ADDRESS
LD R2, START
AND R4, R4, #0 ; R4 = ARRAY SUM

SUM_LOOP
LD R1, HASH
LDR R0, R2, #0
ADD R1, R1, R0
BRz DISPLAY ; IF REACHED #, GET DISPLAY
ADD R4, R4, R0
ADD R2, R2, #1
BR SUM_LOOP

DISPLAY
LD R1, NEGHUN
LD R0, ASCII

HUN_LOOP
ADD R0, R0, #1
ADD R4, R4, R1 
BRzp HUN_LOOP

LD R1, HUN
ADD R4, R4, R1
ADD R0, R0, #-1

OUT ; OUT HUNDREDS DECIMAL

LD R0, ASCII
TEN_LOOP
ADD R0, R0, #1
ADD R4, R4, #-10 
BRzp TEN_LOOP

ADD R4, R4, #10
ADD R0, R0, #-1

OUT ; OUT TENS DECIMAL

LD R0, ASCII
ADD R0, R0, R4
OUT ; OUT UNITS DECIMAL

BR MAIN

HALT

START .FILL x4000
HASH .FILL #-35
NEGASCII .FILL #-48
ASCII .FILL #48
NEGHUN .FILL #-100
HUN .FILL #100

.END