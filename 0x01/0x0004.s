;bitwise operations

.global _start
_start:
	
	MOV R0, #0xFF
	MOV R1, #0x16
	
	AND R2, R0, R1      ;bitwise and
	
	ORR R3, R0, R1      ;bitwise or
	
	EOR R4, R0, R1      ;bitwise xor
	
	MVN R5, R0          ;put the NOT of r5 into r0
	
	LDR R6, =const      ;load the address of const
	LDR R6, [R6]        ;load the data for const into r6
	
	AND R5, R5, R6      ;bitwise and
	
.data
const:
	.word 0x0000FFFF