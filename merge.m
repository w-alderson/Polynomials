function output = merge(first,last)
% first is a sorted row vector
% last is a sorted row vector 
% output is a vector which is sorted and is a merrge of the two

n = length(first); 
m = length(last); 
output = zeros(1,n+m);
x = 1; % The index of the next first-value to select.
y = 1; % The index of the next last-value to select.
for z=1:(n+m)
%This is the value in the output
    if x > n
    % All first-values have been sorted. Select the next last-value.
        output(z) = last(y);
        y = y+1;
    elseif y>m
    % All last-values have been sorted. Select the next first-value
        output(z) = first(x);
        x = x + 1;
    elseif first(x) <= last(y)
    % The next x-value is less than or equal to the next y-value
        output(z) = first(x); 
        x = x + 1;
    else
    % The next y-value is less than the next x-value
        output(z) = last(y); 
        y = y + 1;
    end
end
end

%Reference: Inspiration taken from JHD's myMsort
