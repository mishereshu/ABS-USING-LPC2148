AREA  TEST,CODE,READONLY 
   
	LDR R1, =0x50000000   ; load source array address into R1
    LDR R2, [R1]          ; load size of source array into R2
    LDR R3, =0x70000000   ; load destination array address into R3
    ADD R1, R1, #4        ; increment R1 to point to first element of source array
    ADD R3, R3, #4        ; increment R3 to point to first element of destination array
    MOV R4, #0            ; initialize R4 to zero (used as a loop counter)

copy_loop:
    LDR R5, [R1, R4, LSL #2]  ; load element at R1 + R4 * 4 into R5
    STR R5, [R3, R4, LSL #2]  ; store element from R5 at R3 + R4 * 4
    ADD R4, R4, #1            ; increment R4
    CMP R4, R2                ; compare R4 to R2
    BLT copy_loop             ; if R4 < R2, branch to copy_loop
STOP B STOP