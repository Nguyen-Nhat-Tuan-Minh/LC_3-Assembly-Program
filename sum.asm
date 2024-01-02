.ORIG x300A

LD R1, NEGASCII
IN
ADD R0, R0, R1
STI R0, TEMP0
IN 
ADD R2, R0, R1
STI R2, TEMP1
IN 
ADD R1, R1, R0
STI R1, TEMP2

NOT R3, R2
ADD R3, R3, #1 ; R3 = -R2
ADD R3, R3, R1 ; R3 = 3RD_NUM - 2ND_NUM
BRzp TEMPMAX
BR NEXT

TEMPMAX
STI R2, TEMP1
ADD R2, R1, #0
NEXT
NOT R3, R2
ADD R3, R3, #1
LDI R1, TEMP0
ADD R3, R3, R1 ; 1ST_NUM - 2ND_NUM
BRn CONT

STI R2, TEMP2
ADD R2, R1, #0 ; REPLACE 2ND_NUM WITH 1ST_NUM

CONT
STI R2, MAX
LDI R1, TEMP1
LDI R2, TEMP2
NOT R3, R2
ADD R3, R3, #1
ADD R3, R3, R1
BRzp PASS

STI R1, MIN
BR SUM

PASS
STI R2, MIN

SUM
AND R3, R3, #0
JSR SUM_ROU
STI R3, S

HALT

TEMP0 .FILL x3202
TEMP1 .FILL x3203
TEMP2 .FILL x3204
S .FILL x3060
MIN .FILL x3200
MAX .FILL x3201
NEGASCII .FILL #-48
ASCII .FILL #48
SAVER7 .FILL #0

SUM_ROU
ST R7, SAVER7

LDI R1, MAX
LDI R2, MIN
NOT R0, R2
ADD R0, R0, #1 ; - MIN
ADD R0, R0, R1 ; MAX - MIN

SUMLOOP
ADD R3, R3, R0
ADD R0, R0, #-1
BRzp SUMLOOP

LD R7, SAVER7
RET

.END
