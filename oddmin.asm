.ORIG x3010

LD R2, INIT
LD R5, ODDSTO
LD R3, COUNTER
AND R6, R6, #0

JSR ODDCHECK

LD R2, ODDSTO
AND R4, R4, #0

JSR ODDMIN

LD R3, ASCII
AND R4, R4, #0
LOOPOUT
ADD R4, R4, #1
ADD R1, R1, #-10
BRzp LOOPOUT

ADD R1, R1, #10
ADD R4, R4, #-1

ADD R0, R3, R4
OUT
ADD R0, R3, R1
OUT

DONE
HALT

INIT .FILL x3000
ODDSTO .FILL x3200
COUNTER .FILL #16
MINUS .FILL #45
ASCII .FILL #48

ODDCHECK
LDR R1, R2, #0
AND R4, R1, #1
BRz UPDATE

STR R1, R5, #0
ADD R5, R5, #1
ADD R6, R6, #1

UPDATE
ADD R2, R2, #1
ADD R3, R3, #-1
BRp ODDCHECK
RET

ODDMIN

LDR R1, R2, #0

MINLOOP
LDR R0, R2, #0
NOT R5, R1
ADD R5, R5, #1
ADD R5, R5, R0
BRzp NEXT

ADD R1, R0, #0
BR UP

NEXT
ADD R1, R1, #0

UP
ADD R2, R2, #1
ADD R6, R6, #-1
BRp MINLOOP
RET 

.END