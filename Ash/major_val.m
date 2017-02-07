function [ mode ] = major_val( bin_targ )
%MAJOR_VAL Summary of this function goes here
%   Detailed explanation goes here
zero_count=0;
one_count=0;

no_y=size(bin_targ,1);

for i=1:no_y
    if bin_targ(i,1)==1
        one_count=one_count+1;
    else
        zero_count=zero_count+1;
    end
end

if zero_count>=one_count
    mode=0;
else
    mode=1;
end

%if the number of 0 and 1 are the same mode is zero
end

