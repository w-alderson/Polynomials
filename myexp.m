function [output] = myexp(a , n)
%meexp recursively finds the value of a to the power of n, with inputs a
%and n.
if n==0
    output=1;
    %This is the trivial case
else
    output=a*myexp(a,n-1);
    %This is the recursive line which works with every other case.
end
end
