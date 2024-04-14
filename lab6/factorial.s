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
	                        @ r0 is the register to store the first argument for a function call, init with 10
	                        @ invokes factorial with r0 as its argument : factorial(10)

    @ Section2: factorial result is stored in r0, store it to the address of f_result
                            @ load the address of f_result into r1
	                        @ store the result of factorial to the address of f_result 
    
    @ Section3: return 0
	                        @ this is the return value (0) of this main function

    @ Section4: factorial function (Can use only r0, r4, lr, pc and sp)
factorial:
    @ ---- factorial function starts ----




    @ ---- factorial function ends ----

@ Codes for memory initialization
.data
f_result: 
    .word 0
