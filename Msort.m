function y = Msort(x)
% x is the index used in unsorted.

n = length(x);
if n==1
% y is the sorted index
    y = x;
%Trivial case
else
    m = floor(n/2);
% This splits the list in half and sorts both independently, before merging
% them together later.
    first = Msort(x(1:m)); % this is sorting the first half

    last = Msort(x(m+1:n)); % this sorts the remaining values

    y = merge(first,last); % this calls on another function, merge, to merge
%the two sorted arrays.
end
end

%Reference: Inspiration taken from JHD's Msort