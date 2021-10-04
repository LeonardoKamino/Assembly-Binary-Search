.globl binary_search
binary_search:
    MOV r3, #0 // startIndex = 0
    SUB r4, r2,#1 //endIndex = length - 1
    MOV r5, r4, LSR#1 //middleIndex = endIndex/2
    SUB r6, r3, #1 //keyIndex = -1
    MOV r7, #1 //numIters = 1
loop:
    CMP r6, #-1
    BNE done
    CMP r3, r4
    BGT done
    LDR r8, [r0, r5, LSL#2]
    CMP r8, r1
    BEQ elif1
    CMP r8, r1
    BGT elif2
    ADD r3, r5, #1
    //after else
    RSB r9, r7, #0
    STR r9,[r0,r5,LSL#2]
    SUB r10, r4, r3
    MOV r10, r10, LSR#1
    ADD r5, r3, r10
    ADD r7, r7, #1
    B loop
elif1: 
    MOV r6, r5
    RSB r9, r7, #0
    STR r9,[r0,r5,LSL#2]
    SUB r10, r4, r3
    MOV r10, r10, LSR#1
    ADD r5, r3, r10
    ADD r7, r7, #1
    B loop
elif2: 
    SUB r4, r5, #1
    RSB r9, r7, #0
    STR r9,[r0,r5,LSL#2]
    SUB r10, r4, r3
    MOV r10, r10, LSR#1
    ADD r5, r3, r10
    ADD r7, r7, #1
    B loop
done:
    MOV r0, r6
    MOV PC, LR
