;basic function implementation

.global _start
_start:
	
	MOV R0, #1
	MOV R1, #3
	
	BL add2         ;branch always, and store the location of the next instruction in the LR register
	
	MOV R3, #10
		
	
add2:
	ADD R2, R0, R1
	BX LR           ;return to the address in the LR register and continue execution