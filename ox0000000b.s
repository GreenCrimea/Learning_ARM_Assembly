;interacting with hardware devices

.equ SWITCH, 0xFF200040     ;constants storing the location to interact with switch and led devices
.equ LED, 0xff200000

.global _start
_start:
	
	LDR R0, =SWITCH         ;load the address of switch into r0
	LDR R1, [R0]            ;load the value from switch device into r1
	
	LDR R0, =LED            ;load the address of led into r0
	STR R1, [R0]            ;store the value in r1 in the address associated with the switch device