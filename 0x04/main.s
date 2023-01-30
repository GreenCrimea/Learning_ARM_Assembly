@

.include "fileio.s"

.equ    BUFFERLEN, 250

.global _start


_start:

    openFile    inFile, O_RDONLY

    MOVS        R8, R0           
    BPL         nxtfil              
    MOV         R1, #1  
    LDR         R2, =inpErrsz
    LDR         R2, [R2]

    writeFile   R1, inpErr, R2

    B           exit


nxtfil:

    openFile    outFile, O_CREAT+O_WRONLY
    MOVS        R9, R0
    BPL         loop
    MOV         R1, #1
    LDR         R2, =outErrsz
    LDR         R2, [R2]

    writeFile   R1, outErr, R2

    B           exit


loop:

    readFile    R8, buffer, BUFFERLEN
    MOV         R10, R0
    MOV         R1, #0
    LDR         R0, =buffer
    STRB        R1, [R0, R10]
    LDR         R1, =outBuf
    BL          toupper

    writeFile   R9, outBuf, R10

    CMP         R10, #BUFFERLEN
    BEQ         loop

    flushClose  R8
    flushClose  R9


exit:

    MOV         R0, #0
    MOV         R7, #1
    SVC         0


.data

    inFile:     .asciz  "main.s"
    outFile:    .asciz  "upper.txt"
    buffer:     .fill   BUFFERLEN + 1, 1, 0
    outBuf:     .fill   BUFFERLEN + 1, 1, 0
    inpErr:     .asciz  "Failed to open input file.\n"
    inpErrsz:   .word   .-inpErr
    outErr:     .asciz  "Failed to open output file.\n"
    outErrsz:   .word   .-outErr 