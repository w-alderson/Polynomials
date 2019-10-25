function [ output ] = Unsorted( index,c,x )

sindex = Msort(index);
%This sorts the index so that i1 <i2 < i3 <... as in Sparse

r = size(c,3);

if size(index,2) ~= r
    error('Please ensure the length of the index matches the multidimensional array')
end
a=cat(3); %This is a variable which will store the corresponding coefficients. It
%will be another multidimensional array with the same dimensions as c.
r = size(c,3);
for n= 1:r
    for p=1:r
        if index(p)== sindex(n)
            a(:,:,n)=c(:,:,p);
        end
        %The nested for loop looks at every value in the original index, if
        %the sorted index matches then the new value of the array a is changed to match.
        %The second loop moves on to the next value in the sorted array and
        %the loop is carried out again.
    end
end
output = Sparse(sindex,a,x);

%This calls on sparse to evaluate the new polynomial. Since sparce already
%has error messages included thet are not needed in this code (with the
%exception of the length of the index and array as the code would fail
%otherwise)

end



