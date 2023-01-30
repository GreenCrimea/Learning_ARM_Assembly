@function for converting string to uppercase

.global toupper

toupper:

    PUSH    {R4-R5}         @save register values from outside scope to stack
    MOV     R4, R1          @mov outstr pointer to r4

loop:

    LDRB    R5, [R0], #1    @same as previous make_upper program

    CMP     R5, #'z'
    BGT     cont

    CMP     R5, #'a'
    BLT     cont

    SUBS    R5, #('a'-'A')

cont:

    STRB     R5, [R1], #1    @same as previous make_upper program
    CMP     R5, #0

    BNE     loop

    SUB     R0, R1, R4      @calculate string len and store in r0 for return to main.s

    POP     {R4-R5}         @restore registers from outer scope
    BX      LR              @return to address in LR and exit function