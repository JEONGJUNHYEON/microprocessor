@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@ int C[] = {-1, -1, -1, -1};
@
@ int main()
@ {
@     C[0] = A[0] * B[0];
@     return 0;
@ }
@ Your codes for single element multiplication
.global _start
_start:
				@ Use a LDR pseudo instruction to set r2 to vectorA address
				@ Use a LDR pseudo instruction to set r3 to vectorB address

				@ Use a LDR normal instruction to load the first element of vector A to r4
				@ Use a LDR normal instruction to load the first element of vector B to r5

				@ Use a MUL instruction to multiply r4 and r5 and save the result to r1

@ Codes for initialize vector data in memory
.data
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
vectorC:
	.word	-1, -1, -1, -1	@ Vector C = {-1, -1, -1, -1}
