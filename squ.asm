; LC-3 Assembly Program: Square with value from User Input
; Author: Minh Nguyen Nhat Tuan
; Date: 01/02/2024

; Description:
; This LC-3 assembly program demonstrates a square operation where the user
; input the number from 0-9 and the program outputs the results to the monitor.

; How to Use:
; 1. Run the program on an LC-3 simulator.
; 2. Input value from 0-9 on keyboard.
; 3. The results will be displayed on the monitor.

.ORIG x3000

MAIN
LD R1, NEGASCII
IN
ADD R1, R1, R0
ADD R2, R1, #0
AND R4, R4, #0

SQUARELOOP
NOT R3, R1
ADD R3, R3, #1 ; R3 = -R1
ADD R4, R4, R1
ADD R2, R2, #-1
BRzp SQUARELOOP

ADD R2, R2, #1
ADD R4, R4, R3

LD R3, ASCII

OUTLOOP
ADD R2, R2, #1
ADD R4, R4, #-10
BRzp OUTLOOP

ADD R2, R2, #-1
ADD R4, R4, #10

ADD R0, R3, R2
OUT

ADD R0, R3, R4
OUT

BR MAIN

HALT

ASCII .FILL #48
NEGASCII .FILL #-48

.END
