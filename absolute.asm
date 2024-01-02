.ORIG x3000

LD R2, NEGASCII
IN
ADD R1, R2, R0
IN
ADD R2, R2, R0

NOT R2, R2
ADD R2, R2, #1

ADD R1, R1, R2 ; R1 = R1 - R2
BRzp NEXT

NOT R1, R1
ADD R1, R1, #1

NEXT

LD R0, ASCII
ADD R0, R0, R1
OUT

HALT

ASCII .FILL #48
NEGASCII .FILL #-48
MINUS .FILL #45

.END