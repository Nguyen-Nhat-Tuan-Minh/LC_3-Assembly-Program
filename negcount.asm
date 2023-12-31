.ORIG x3000

LD R2, INIT
LD R4, ARRAY
AND R1, R1, #0

MAIN
LDR R3, R2, #0
LD R5, MASK		; R5 = 1000 0000 0000 0000

AND R5, R5, R3		; MASK TO CHECK FOR NEGATIVE NUMBER
BRzp UPDATE		; IF POSITIVE NUMBER OVERLOOK NEGATIVE VALUE INCREMENT

ADD R1, R1, R3		; NEGATIVE NUMBER SUM

UPDATE 
ADD R2, R2, #1		; MOVE R2 TO NEXT ADDRESS
ADD R4, R4, #-1		; DECREMENT MAIN LOOP COUNTER
BRz NEXT		; IF ALL 32 ADDRESSES ARE CHECKED MOVE TO STORE VALUE
BR MAIN

NEXT
STI R1, STORE

HALT

INIT .FILL x5000
ARRAY .FILL #32
MASK  .FILL x8000
STORE .FILL x4FFF

.END