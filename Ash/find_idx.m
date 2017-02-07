function [ index ] = find_idx( att,best_att )
%FIND_INDEX Summary of this function goes here
%   Detailed explanation goes here

index=1; %if best_att does not exist in the array
x_val=size(att,2);

for i=1:x_val
    if( att(1,i) == best_att )
        index=i;
        return
    end
end

end

