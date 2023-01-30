;using linuc syscalls

.global _start
_start: 
        MOV R0, #1 
        LDR R1, =message
        LDR R2, =len
        MOV R7, #4           
        SWI 0           ;call the write system function which will take the info in r0, r1, r2, r7
        
        MOV R7, #1      ;call the exit function
        SWI 0

.data   
message:
        .asciz "hello world \n"
len = .-message
