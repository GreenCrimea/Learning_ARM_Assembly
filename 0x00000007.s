;looping

.global _start

.equ endlist, 0xaaaaaaaa            ;set a const

_start:
	LDR R0, =list                   ;load the address of the first value into r0
	LDR R3, =endlist                ;load the endlist const into r3
	LDR R1, [R0]                    ;load the value at the adress at r0 into r1
	ADD R2, R2, R1                  ;add r2 to r1 and store it in r2, initialising the accumulator
	
loop:
	LDR R1, [R0,#4]!                ;pre-increment then load the value at the adress at r0 into r1
	CMP R1, R3                      ;compare r1 to r3
	BEQ exit                        ; if equal, goto exit label
	ADD R2, R2, R1                  ; else add r2 to r1 and store in r2
	BAL loop                        ; branch always back to loop label
	
exit:
	
	
.data
list:
	.word 1,2,3,4,5,6,7,8,9,10  ;add a list to the stack