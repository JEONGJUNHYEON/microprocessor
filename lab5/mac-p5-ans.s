@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@ sum = -1;
@
@ int main()
@ {
@     sum = A[0] * B[0] + A[1] * B[1] + A[2] * B[2] + A[3] * B[3];
@     return 0;
@ }
@
.global _start
_start:

@ Your codes for part5 (vector multiplication using auto-update address)

@ -------------------------------------------------------

	mov r1, #0						@ Reset r1, which will serve as a storage of sum, to 0

	ldr r2, =vectorA                @ Use a LDR pseudo instruction to set r2 to vectorA address
	ldr r3, =vectorB                @ Use a LDR pseudo instruction to set r3 to vectorB address

	ldm r2!, {r4, r5, r6, r7}		@ Use a LDM instruction to load the first 4 elements of vector A
									@ to r4, r5, r6, r7 (with an auto increment r2 by 16)
				
	ldm r3!, {r8, r9, r10, r11}		@ Use a LDM instruction to load the first 4 elements of vector B
									@ to r8, r9, r10, r11 (with an auto increment r3 by 16)

	mla r1, r4, r8, r1				@ Use a MLA instruction to multiply r4 and r8 and accumulate the result to r1
	mla r1, r5, r9, r1				@ Use a MLA instruction to multiply r5 and r9 and accumulate the result to r1
	mla r1, r6, r10, r1				@ Use a MLA instruction to multiply r6 and r10 and accumulate the result to r1
	mla r1, r7, r11, r1				@ Use a MLA instruction to multiply r7 and r11 and accumulate the result to r1

	ldr r0, =sum                    @ Use a LDR pseudo instruction to set r0 to sum address
	str r1, [r0]                    @ Use a STR instruction to store the result in r1 to sum

@ -------------------------------------------------------

@ Codes for initialize data in memory
.data
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
sum:
	.word	-1			@ Sum = -1