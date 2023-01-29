;branching

.global _start
_start:
	
	MOV R0, #1
	MOV R1, #2
	
	CMP R1, R0      ;compare r1 to r2
	
	BGT greater     ;if the previous comparison is GREATER THAN, branch to the greater label
                    ;ALSO BGE (brach if >=), BLT (branch if <), BLE (branch if <=) BEQ (branch if ==), BNE (branch if /=)
	BAL default     ;branch all which reach here to default label
	
greater:
	MOV R2, #1
	
default:
	MOV R2, #2