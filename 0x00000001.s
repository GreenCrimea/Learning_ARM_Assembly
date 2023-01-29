; Move values into registers and end program with syscall

.global _start
_start:
	
	MOV R0, #30		;move const 30 into r0
	
	MOV R7, #1		;move const 1 into r7 to define syscall
	SWI 0			;execute syscall