;storing register state on the stack

.global _start
_start:
	
	MOV R0, #1
	MOV R1, #2
	PUSH {R0, R1}       ;push the state of r0, r1 onto the stack
	BL get_value
	POP {R0, R1}        ;after the get value subroutine r0, r1 are popped off the stack and place back into their registers
	BAL end
	
get_value:
	MOV R0, #5          ;r0 and r1 are reused in the local context of the get value subroutine
	MOV R1, #10
	ADD R2, R0, R1
	BX LR
	
end: