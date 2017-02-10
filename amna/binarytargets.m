function [binaryvec] = binarytargets(y)
%BINARYTARGETS for a given target emotion, this takes the label vector y
%and makes all the entries 1 for that emotion and 0 for everything else 

%need to find a way to maybe automate this to create six arrays for all six
%using a random number generator maybe?

binaryvec = zeros (size(y)); 

for i = 1:length(y)
    if y(i) == 4; %this number changes with target emotion 
        binaryvec(i) = 1;
    else 
        binaryvec(i) = 0;
    end
end 
        
end

