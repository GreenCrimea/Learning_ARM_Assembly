;shift and rotate bitwise

.global _start
_start:
	
	MOV R0, #10
	
	LSL R0, #1              ;shift bits left by 1
	LSR R0, #1              ;shift bits right by 1
	
	MOV R1, R0, LSL #1      ;move and shift
	
	MOV R2, #15
	ROR R3, R2, #1          ;rotate bits right by 1
	
	MOV R3, R2, ROR #2      ;move and rotate