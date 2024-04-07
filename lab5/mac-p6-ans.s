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
@	  for (int i=0; i<4; i++)
@         sum += A[i] * B[i];
@     return 0;
@ }
@
.global _start
_start:

@ Your codes for part6 (vector multiplication using auto-update address)

@ -------------------------------------------------------

	mov r1, #0				@ Reset r1, which will serve as a storage of sum, to 0

	ldr r2, =vectorA		@ Use a LDR pseudo instruction to set r2 to vectorA address
	ldr r3, =vectorB		@ Use a LDR pseudo instruction to set r3 to vectorB address

	mov r0, #0				@ Reset r0, which will serve as an index, to 0
							@ (this is the initialization part of the for loop, int i=0)

loop_label:
	cmp r0, #4				@ Compare r0 with 4
							@ (this is the comparison part of the for loop)

	bge done_label			@ Branch to done_label, if the comparison fails (i >= 4)

	add r4, r2, r0, LSL #2 	@ Calculate A's element address by adding r0*4 to r2, save it to r4
	add r5, r3, r0, LSL #2	@ Calculate B's element address by adding r0*4 to r3, save it to r5

	ldr r6, [r4]			@ Load A's element to r6
	ldr r7, [r5] 			@ Load B's element to r7

	mla r1, r6, r7, r1		@ Use Multiply-accumulate instruction to update r1 with r6*r7

	add r0, #1				@ Increment r0 by 1
							@ (this is the increment part of the for loop, i++)

	b loop_label			@ Branch back to loop_label

done_label:
	ldr r0,  =sum			@ Use a LDR pseudo instruction to set r0 to sum address
	str r1, [r0]			@ Use a STR instruction to store r1 to sum address

@ -------------------------------------------------------

@ Codes for initialize data in memory
.data
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
sum:
	.word	0			@ Sum = 0