@macros to help with file i/o

.include "unistd.s"

.equ O_RDONLY,  0
.equ O_WRONLY,  1
.equ O_CREAT,   0100
.equ S_RDWR,    0600

.macro
    openFile    fileName, flags

    LDR         R0, =\fileName
    MOV         R1, #\flags
    MOV         R2, #S_RDWR
    MOV         R7, #sys_open
    SVC         0
.endm

.macro
    readFile    fd, buffer, length
    MOV         R0, \fd
    LDR         R1, =\buffer
    MOV         R2, #\length
    MOV         R7, #sys_read
    SVC         0
.endm

.macro
    writeFile   fd, buffer, length
    MOV         R0, \fd
    LDR         R1, =\buffer
    MOV         R2, \length
    MOV         R7, #sys_write
    SVC         0
.endm

.macro 
    flushClose  fd
    MOV         R0, \fd
    MOV         R7, #sys_fsync
    SVC         0

    MOV         R0, \fd
    MOV         R7, #sys_close
    SVC         0
.endm

