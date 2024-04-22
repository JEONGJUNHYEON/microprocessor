@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ int f_result = 0;
@ 
@ int main()
@ {
@     f_result = factorial(10);
@     return 0;
@ }
@ 
@ int factorial(int n)
@ {
@     if (n==1)
@     {
@         return n;
@     }
@     else
@     {
@         return n * factorial(n-1);
@     }
@ }

@ Codes for Main function
.global _start
_start:
    @ Section1: call factorial function with 10 as an argument
	MOV	    r0, #10		    @ r0 is the register to store the first argument for a function call, init with 10
	BL 	    factorial	    @ invokes factorial with r0 as its argument : factorial(10)

    @ Section2: factorial result is stored in r0, store it to the address of f_result
    LDR     r1, =f_result   @ load the address of f_result into r1
	STR     r0, [r1]        @ store the result of factorial to the address of f_result 
    
    @ Section3: return 0
	MOV	    r0, #0		    @ this is the return value (0) of this main function
    B       end             @ return to the OS

    @ Section4: factorial function
factorial:
@ ---- Your codes for factorial starts ----
    PUSH    {r4, lr}        @ save r4 and lr, which will be used in the function
    MOV     r4, r0          @ save the r0 to r4, which will be used in the function
    CMP     r4, #1          @ compare r4 with 1, and set the flags
    BNE     else            @ if r4 is not equal to 1, jump to else
if:
    MOVS    r0, #1          @ if r4 is equal to 1, return 1
ret:
    POP     {r4, pc}        @ restore r4 and lr, which were saved in the beginning 
else:
    SUBS    r0, r4, #1      @ r0 = r4 - 1
    BL      factorial       @ call factorial with r0 as an argument
    MUL     r0, r4, r0      @ r0 = r4 * r0
    B       ret             @ return
@ ---- Your codes for factorial ends ----
end:

@ Codes for memory initialization
.data
f_result: 
    .word 0
