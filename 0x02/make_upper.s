@Convert a string from lowercase to uppercase

.global     _start

_start:

    LDR     R4, =instr          @load the pointer to instr into r4
    LDR     R3, =outstr         @load the ponter to outstr into r3

loop:

    LDRB    R5, [R4], #1        @load the first byte from where r4 is pointing into r5

    CMP     R5, #'z'            @compare r5 to the value of ascii 'z'
    BGT     cont                @if the byte in r5 is above the range of lowercase letters, branch to cont

    CMP     R5, #'a'            @compare r5 to the value of ascii 'a'
    BLT     cont                @if the byte in r5 is lower than the range of lowercase letters, branch to cont

    SUB     R5, #('a'-'A')      @subtract from r5 the value that represents the difference between lower and upper letter values

cont:

    STRB    R5, [R3], #1        @store in the address of r3 the byte in r5

    CMP     R5, #0              @compare r5 to zero
    BNE     loop                @if r5 is not 0, repeat loop

    MOV     R0, #1              @print outstring syscall
    LDR     R1, =outstr
    SUB     R2, R3, R1          @find len of the string by subtracting the pointer to the start of outstr from the pointer to the end
    MOV     R7, #4
    SVC     0

    MOV     R0, #0              @exit syscall
    MOV     R7, #1
    SVC     0



.data
    instr:  .asciz  "string to convert to uppercase\n"
    outstr: .fill   255, 1, 0