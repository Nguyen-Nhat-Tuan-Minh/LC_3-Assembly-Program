; LC-3 Assembly Program: Division with User Input
; Author: Minh Nguyen Nhat Tuan
; Date: 02/01/2024

; Description:
; This LC-3 assembly program demonstrates a simple division operation where the user
; is prompted to input a 5-digit number

; How to Use:
; 1. Run the program on an LC-3 simulator.
; 2. When prompted, enter 5 digits, then the input terminate.

.ORIG x3000

LD R2, INIT
LD R1, COUNT
LD R3, NEGASCII

LOOP_INPUT
GETC
OUT
ADD R0, R0, R3
STR R0, R2, 0
ADD R2, R2, #1
ADD R1, R1, #-1
BRp LOOP_INPUT

LD R2, INIT
AND R0, R0, #0
LDR R3, R2, #0
ADD R2, R2, #1
LD R1, LTHOUSANDS

LOOP1
ADD R0, R0, R3
ADD R1, R1, #-1
BRp LOOP1

STI R0, SAVE1
;LDR R0, R2, #0
LDR R3, R2, #0
ADD R2, R2, #1 
LD R1, THOUSANDS

LOOP2
ADD R0, R0, R3
ADD R1, R1, #-1
BRp LOOP2

STI R0, SAVE2
;LDR R0, R2, #0
LDR R3, R2, #0
ADD R2, R2, #1 
LD R1, HUNDREDS

LOOP3
ADD R0, R0, R3
ADD R1, R1, #-1
BRp LOOP3

STI R0, SAVE3
;LDR R0, R2, #0
LDR R3, R2, #0
ADD R2, R2, #1 
LD R1, TENS

LOOP4
ADD R0, R0, R3
ADD R1, R1, #-1
BRp LOOP4

STI R0, SAVE4
;LDR R0, R2, #0
LDR R3, R2, #0
ADD R2, R2, #1 

ADD R0, R0, R3
STI R0, SAVE5

HALT

NEGASCII .FILL #-48
INIT .FILL x4000
FINIT .FILL x4004
COUNT .FILL #5
TENS .FILL #10
HUNDREDS .FILL #100
THOUSANDS .FILL #1000
LTHOUSANDS .FILL #10000
SAVE1 .FILL x4005
SAVE2 .FILL x4006
SAVE3 .FILL x4007
SAVE4 .FILL x4008
SAVE5 .FILL x4009

.END
