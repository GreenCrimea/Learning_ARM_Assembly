;add a list to the stack then load that list into registers

.global _start
_start:
	LDR R0, =list       ;load into r0 the address of the first entry in 'list'
	LDR R1, [R0]        ;load into r1 the value at the address in r0
	LDR R2, [R0,#4]     ;load into r2 the value at the address of r0 with an offset of +4
	
	LDR R2, [R0,#4]!    ;pre-increment r0 to the next memory address and then load the value at that address into r2
	
	LDR R3, [R0],#4     ;load into r3 the value at the address of r0 and then increment r0 to the next address

	LDR R4, [R0],#4     ;load into r4 the value at the address of r0 and then increment r0 to the next address
	

.data
list:
	.word 100, 200, 300, -2, 923, -57       ;add 6 values to the stack under the label 'list'