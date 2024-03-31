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
@	  for (int i=0; i<4; i++)
@         sum += A[i] * B[i];
@     return 0;
@ }
@
.global _start
_start:

@ Your codes for part6 (vector multiplication using auto-update address)

@ -------------------------------------------------------

			@ Reset r1, which will serve as a storage of sum, to 0

			@ Use a LDR pseudo instruction to set r2 to vectorA address
			@ Use a LDR pseudo instruction to set r3 to vectorB address

			@ Reset r0, which will serve as an index, to 0
			@ (this is the initialization part of the for loop, int i=0)

loop_label:
			@ Compare r0 with 4
			@ (this is the comparison part of the for loop)

			@ Branch to done_label, if the comparison fails (i >= 4)

			@ Calculate A's element address by adding r0*4 to r2, save it to r4
			@ Calculate B's element address by adding r0*4 to r3, save it to r5

			@ Load A's element to r6
			@ Load B's element to r7

			@ Use Multiply-accumulate instruction to update r1 with r6*r7

			@ Increment r0 by 1
			@ (this is the increment part of the for loop, i++)

			@ Branch back to loop_label

done_label:
			@ Use a LDR pseudo instruction to set r0 to sum address
			@ Use a STR instruction to store r1 to sum address

@ -------------------------------------------------------

@ Codes for initialize data in memory
.data
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
sum:
	.word	-1			@ Sum = -1