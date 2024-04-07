@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@ sum = 0;
@
@ int main()
@ {
@     for (int i=0; i<15, i+=4)
@         sum += A[i] * B[i] + A[i+1] * B[i+1] + A[i+2] * B[i+2] + A[i+3] * B[i+3];
@     return 0;
@ }
@
.global _start
_start:

@ Your codes for part7 (vector multiplication using auto-update address)

@ -------------------------------------------------------

	mov r1, #0					@ Reset r1, which will serve as a storage of sum, to 0

	ldr r2, =vectorA            @ Use a LDR pseudo instruction to set r2 to vectorA address
	ldr r3, =vectorB            @ Use a LDR pseudo instruction to set r3 to vectorB address

								@ Part 1: Intialize i to 0 before entering the loop
	mov r0, #0

loop_label:
								@ Part 2: Loop comparison
	cmp r0, #16			      	@ in this part, you need to compare i with 16.
	bge done_label		        @ if the test fails, you need to branch to done_label

								@ Part 3: Memory load using LDM
	ldm r2!, {r4, r5, r6, r7}	@ in this part you need to load 4 elements of A and B, each, to 8 registers
	ldm r3!, {r8, r9, r10, r11}

								
								@ Part 4: Multiply-accumulate
	mla r1, r4, r8, r1			@ in this part, you will use 4 MLA instructions to do the vector multiplication
	mla r1, r5, r9, r1
	mla r1, r6, r10, r1
	mla r1, r7, r11, r1

								@ Part 5: Index update
	add r0, #4					@ in this part, you need to update i and branch back to the loop_label
	b loop_label

done_label:
	ldr r0,  =sum			@ Use a LDR pseudo instruction to set r0 to sum address
	str r1, [r0]			@ Use a STR instruction to store r1 to sum address

@ -------------------------------------------------------

@ Codes for initialize data in memory
.data
vectorA:
	.word	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 
	@ Vector A = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}
vectorB:
	.word	2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32
	@ Vector B = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32}
sum:
	.word	0			@ Sum = 0