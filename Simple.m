function [ output ] = Simple( a,x )
%Simple takes a multidimensional array (a) and a compatible matrix (x) and
%uses horners rule to evaluate a polynomial without using the built in
%matlab exponent function.

n=size(a,3);
%We need n know how long the for loop should carry on for, in this case it
%nees to continue until n-2 as we then need to add the first level of the
%array (a).
if size(x,1)~=size(x,2)
    error ('Please enter a square matrix for x')
    %This ensures that x is a square matrix
elseif size(a,1)~=size(x,2)
    error ('Please ensure matrix b and x are compatible.')
    %checks for matrix compatibility
elseif n > 1
    p=x*a(:,:,n);
    %This sets up p by multiplying the matrix x by the correct array. Note
    %the order as this is important.
    for k = 1:(n-2)
        p=x*(a(:,:,(n-k))+p);
    end
    output = a(:,:,1)+p;
    %We need to finally add the last level of the array without multiplying
    %by x, hence a new line is required.
else 
    output = a(:,:,1);
    %This is the case that a consists only of one level.
end
end