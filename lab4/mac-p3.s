@ Copyright (c) 2024 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@ int sum = -1;
@
@ int main()
@ {
@     sum = A[0] * B[0] + A[1] * B[1] + A[2] * B[2] + A[3] * B[3];
@     return 0;
@ }
@
@ Your codes for vector multiplication
.global _start
_start:
				@ Reset r1, which will serve as a storage of sum, to 0

				@ Use a LDR pseudo instruction to set r2 to vectorA address
				@ Use a LDR pseudo instruction to set r3 to vectorB address

				@ Use a LDR normal instruction to load the first element of vector A to r4
				@ Use a LDR normal instruction to load the first element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1
				
				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the second element of vector A to r4
				@ Use a LDR normal instruction to load the second element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the third element of vector A to r4
				@ Use a LDR normal instruction to load the third element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the third element of vector A to r4
				@ Use a LDR normal instruction to load the third element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

				@ Use a LDR pseudo instruction to set r6 to sum address
				@ Use a STR normal instruction to store the sum in r1

@ Codes for initialize data in memory
.data
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
sum:
	.word	-1		@ Sum = -1
