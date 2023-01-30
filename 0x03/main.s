@same as make_upper but functionalised and made modular

.global _start

_start:

    LDR     R0, =instr
    LDR     R1, =outstr

    BL      toupper         @call function from upper.s

    MOV     R2, R0          @upper.s will return the length into r0, mov into r2 for syscall

    MOV     R0, #1          @write syscall
    LDR     R1, =outstr
    MOV     R7, #4
    SVC     0   

    MOV     R0, #0          @exit syscall
    MOV     R7, #1
    SVC     0

.data
    instr:  .asciz  "string to convert to uppercase\n"
    outstr: .fill   255, 1, 0