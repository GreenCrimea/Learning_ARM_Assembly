;basic arithmetic operations

.global _start
_start:
	
	MOV R0, #5
	MOV R1, #7
	ADD R2, R0, R1          ;add r1 to r0 and store in r2
	
	SUB R3, R1, R0          ;subtract r0 from r1 and store in r3
	
	MUL R4, R0, R1          ;multiply r0 by r1 and store in r4
	
	SUBS R5, R0, R1         ;subtract r0 from r1 and store in r5 - also set the CPSR flag if number is negative
	
	MOV R0, #0xFFFFFFFF
	MOV R1, #10
	
	ADDS R2, R0, R1         ;add r1 to r0 and store in r2 - also set the CPSR carry flag if the number is higher then 0xffffffff