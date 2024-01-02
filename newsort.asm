.ORIG x3000


SORT
AND R5, R5, #0 		; INIT SORT CHECKER, IF R5 = 0, STOP SORT
LD R6, SORT_COUNTER
LD R2, INIT		; INIT R2 = x3120 : 1ST VALUE POINTER
ADD R3, R2, #1 		; INIT R3 = x3121 : 2ND VALUE POINTER
SORT_LOOP
LD R5, SORT_CHECKER

;CHECK STH FOR ODD/EVEN SEPARATION
LDR R0, R2, #0		; LOAD 1ST VALUE TO R0  
LDR R1, R3, #0		; LOAD 2ND VALUE TO R1

NOT R7, R1
ADD R7, R7, #1		; R7 = -R1 (NEG 2ND VALUE)
ADD R7, R7, R0		; R7 = R0 - R1
BRzp SWAP
BR UPDATE

SWAP
STR R0, R3, #0
STR R1, R2, #0
ADD R5, R5, #1

UPDATE
ADD R2, R2, #1
ADD R3, R3, #1
ST R5, SORT_CHECKER
ADD R6, R6, #-1		; DECREMENT SORT COUNTER
BRz CHECK_SORT
BR SORT_LOOP

CHECK_SORT
ADD R5, R5, #0
BRp SORT		; IF NO MORE SORTING SOLUTION END (R5 = 0)

LD R6, COUNTER 		; INIT ARRAY INDEX COUNTER TO 10
LD R2, INIT 		; R2 POINTER
AGAIN 
LD R7, ODD_NUM		; R7 COUNTS THE NUMBER OF ODDS FOR LATER USE
LDR R3, R2, #0 		; R3 HOLDS CONTENT POINTED BY R2
ADD R2, R2, #1 		; INCREMENT POINTER

LD R4, MASK
AND R5, R4, R3 		; IF R5 = 1 <=> (ODD), IF R5 = 0 <=> (EVEN)
BRz EVEN
BR ESCAPE0 		; KEEP R4 = 1 IF ODD VALUE

EVEN
AND R4, R4, #0 		; IF AN EVEN VALUE, R4 = 0

ESCAPE0
AND R5, R5, #0
ADD R7, R7, #1		; R7 += 1 WHEN AN ODD VALUE IS FOUND
ST R7, ODD_NUM

ADD R4, R4, #0
BRz UPPER 		; EVEN VALUE STORE IN HIGHER LOCATION

LD R0, ARRAY
LD R5, SPL 		; INITIALY SPL = 0
ADD R0, R0, R5 		; INC STORAGE POINTER AMOUNT OF SPL
STR R3, R0, #0
ADD R5, R5, #1 		; SPL = SPL + 1
ST R5, SPL
BR ESCAPE1

UPPER
LD R0, ARRAY
LD R5, SPH 		; INITIALY SPH = 9
ADD R0, R0, R5 		; DECREMENT STORAGE POINTER AMOUNT OF SPH
STR R3, R0, #0
ADD R5, R5, #-1 	; SPH = SPH - 1
ST R5, SPH 

ESCAPE1
ADD R6, R6, #-1
BRz DONE 		; RESTART AGAIN IF COUNTER != 0
BR AGAIN

DONE
HALT

SPL .FILL #0
SPH .FILL #9
SORT_COUNTER .FILL #9
COUNTER .FILL #10
INIT .FILL x3100
ARRAY .FILL x3120
MASK .FILL x0001
SORT_CHECKER .FILL #0
ODD_NUM .FILL #0

.END
