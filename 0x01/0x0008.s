;conditional instructions

.global _start
_start:
	
	MOV R0, #4
	MOV R1, #2
	CMP R0, R1
	
	ADDLT R2, #1        ;if the result of previous comparison is less than, execute add instruction, else continue