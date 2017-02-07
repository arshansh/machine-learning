function [same]= all_same_binary(y)
%ALL_SAME_BINARY Summary of this function goes here
%   Detailed explanation goes here
no_y=size(y,1);
first_y=y(1,1);

same=1;
for i=2:no_y
    if y(i,1)~=first_y
        same=0;
        break
    end
end

end

