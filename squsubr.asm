; LC-3 Assembly Program: Square with value at x3000
; Author: Minh Nguyen Nhat Tuan
; Date: 13/12/2023

; Description:
; This LC-3 assembly program demonstrates a square operation where the user
; load the original number in x3000. Subsequently, the program performs the square operation,
; and outputs the results to the monitor.

; How to Use:
; 1. Run the program on an LC-3 simulator.
; 2. Modify value at x3000 to the number for square.
; 3. The results will be displayed on the monitor.

.ORIG x3010

LD R2, NUM
LDR R1, R2, #0
AND R3, R3, #0
JSR SQUARE ; RESULT IN R3
JSR DISPLAY

HALT

ASCII .FILL #48
NEGTHOU .FILL #-1000
NEGHUN .FILL #-100
HUN .FILL #100
THOU .FILL #1000
NUM .FILL x3000
SAVER7 .FILL #0

SQUARE

NOT R2, R1
ADD R2, R2, #1
ADD R4, R1, #0

SQUARELOOP
ADD R3, R3, R1
ADD R4, R4, #-1
BRzp SQUARELOOP

ADD R3, R3, R2
RET

DISPLAY
ST R7, SAVER7
LD R1, ASCII
LD R2, NEGTHOU
AND R4, R4, #0

THOULOOP
ADD R4, R4, #1
ADD R3, R3, R2
BRzp THOULOOP

LD R2, THOU
ADD R3, R3, R2
ADD R4, R4, #-1

ADD R0, R1, R4
OUT

AND R4, R4, #0
LD R2, NEGHUN
HUNLOOP 
ADD R4, R4, #1
ADD R3, R3, R2
BRzp HUNLOOP

LD R2, HUN
ADD R3, R3, R2
ADD R4, R4, #-1

ADD R0, R1, R4
OUT

AND R4, R4, #0

TENLOOP
ADD R4, R4, #1
ADD R3, R3, #-10
BRzp TENLOOP

ADD R3, R3, #10
ADD R4, R4, #-1

ADD R0, R1, R4
OUT
ADD R0, R1, R3
OUT
LD R7, SAVER7
RET

.END
