# Polynomials

This is a package for evaluating polynomials given either two or three inputs(explained in more detail later). 

The package consists of three top level functions:

## Simple: 

This takes inputs of a and x (a being a multidimensional array and x being a square matrix) and evaluates a polynomial with coefficients corresponding to the differnet levels of a in accordance to Horner's rule,  meaning the matlab '^' function is not used.

## Sparse: 

This takes inpits of index, b and y to evaluate polynomials. This calls on another function myexp.m to recursively calculate the different powers of the matrix x in accordance to Horner's sparce method. It is assumed that the index is increasing in value, however there is a test to ensure that this is the case.

## Unsorted: 

Esentually the same as Sparse, however the index is not sorted. It calls upon Msort.m to sort the index values, however, this leaves the coefficients in the wrong order. Nested if statements ensure that they are in the correct order. It then calls upon Sparse.m to complete the evaluation.

All three of these functions include at least one test to ensure that incorrect input is followed by an explanation of what should be done to  correctly evaluate the polynomial.

The three subfunctions are:

## merge.m: 

This calls the two sorted lists from Msort and merges them  together to form one output. This is called upon for Msort.m.

## Msort.m 

Splits the index into two groups, first and last, and then calls  on merge.m to sort them.

## myexp.m 

Takes two inputs, a and n. The function recursively calculates a to the power of n and outputs this as a single output. It is used in Sparse.m.
