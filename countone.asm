; LC-3 Assembly Program: Count number of bit-1 with User Input from 0-9
; Author: Minh Nguyen Nhat Tuan
; Date: 02/01/2023

; Description:
; This LC-3 assembly program demonstrates the counting of bit-1 from User Input in true binary number.
; The program converts ASCII input to binary output number
; Counting algorithm: Shift right and check if negative number (leading 1).

; How to Use:
; 1. Run the program on an LC-3 simulator.
; 2. When prompted, enter from keyboard between 0-9.
; 3. The results will be displayed on the monitor.

.ORIG x3000

MAIN
LD R1, NEGASCII
IN
ADD R1, R1, R0

JSR COUNT_ONE ; bit-1 counting subroutine
JSR OUTPUT ; result display subroutine
BR MAIN

HALT

NEGASCII .FILL #-48
ASCII .FILL #48
SAVER7 .FILL #0
COUNTER .FILL #16
MASK .FILL x8000

COUNT_ONE
ST R7, SAVER7
LD R2, COUNTER
LD R0, MASK
AND R4, R4, #0

COUNT_LOOP
AND R3, R0, R1
BRz NO_ONE
ADD R4, R4, #1

NO_ONE
ADD R1, R1, R1
ADD R2, R2, #-1
BRp COUNT_LOOP

LD R7, SAVER7
RET

OUTPUT
ST R7, SAVER7

LD R1, ASCII
ADD R0, R4, R1
OUT

LD R7, SAVER7
RET

.END
