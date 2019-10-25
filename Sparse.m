function [ output ] = Sparse( index, b, x )

n=size(b,3);
%This is the size of b in the third dimension
k=size(index,2);
%This is the size of the index
for i=1:k-1
    if index(i)>index(i+1)
       error('Please ensure that the index is in order')
    end
end
%This for loop test to check that each component of the index is in order.

for i=1:k
    if index(i)<0
        error('Please ensure all values in the index are greater than or equal to zero')
    end
end

for i=1:k
    if index(i)~= floor(index(i))
        error('Please ensure that the index values are integers')
    end
end
%This ensures that the index values are integers as this is required for
%polynimials 

%This loop tests to ensuer that each value in the index as polynomials have
%to have positive exponents.
if n~=k
    error ('Please ensure that the size of the third dimension of the multidimensional array is the same as the size of the index')
    %This ensures that there is an error if the index and the size of the
    %third dimension of the muntidimensional array are not the same.
elseif size(x,1)~=size(x,2)
    error ('Please enter x as a square matrix')
    %Ensures x is square
elseif size(b,1)~=size(x,2)
    error ('Please ensure matrix b and x are compatible.')
    %Checks for compatibility
elseif n < 2
    output = myexp(x,index(1))*(b(:,:,1));
    %This is the case where we don't need a loop becuase the calculation is
    %simple.
else
    working = 0;
    for m = 0:k-2
        working = myexp(x,(index(k-m)-index(k-m-1)))*(b(:,:,k-m)+ working);
        %This calls myexp (another function) and calculates the value when
        %m = 0 to m = k, adding the previous value for working each time.
       
        output=myexp(x,index(1))*(b(:,:,1)+working);
        %This is required as we don't wish to find the difference in
        %indexes for the last exponent.
    end
    
end
end


