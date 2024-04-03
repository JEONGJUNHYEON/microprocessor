@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
@ int B[] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32};
@ sum = -1;
@
@ int main()
@ {
@     for (int i=0; i<16, i+=4)
@         sum = A[i] * B[i] + A[i+1] * B[i+1] + A[i+2] * B[i+2] + A[i+3] * B[i+3];
@     return 0;
@ }
@
.global _start
_start:

@ Your codes for part7 (vector multiplication using auto-update address)

@ -------------------------------------------------------

			@ Reset r1, which will serve as a storage of sum, to 0

	        	@ Use a LDR pseudo instruction to set r2 to vectorA address
	        	@ Use a LDR pseudo instruction to set r3 to vectorB address

			@ Part 1: Intialize i to 0 before entering the loop
	
loop_label:
			@ Part 2: Loop comparison
	      		@ in this part, you need to compare i with 16.
	        	@ if the test fails, you need to branch to done_label

			@ Part 3: Memory load using LDM
			@ in this part you need to load 4 elements of A and B, each, to 8 registers

								
			@ Part 4: Multiply-accumulate
			@ in this part, you will use 4 MLA instructions to do the vector multiplication

			@ Part 5: Index update
			@ in this part, you need to update i and branch back to the loop_label

done_label:
			@ Use a LDR pseudo instruction to set r0 to sum address
			@ Use a STR instruction to store r1 to sum address

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
	.word	-1			
 	@ Sum = -1
