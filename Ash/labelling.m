function [y_mapped] = labelling(label,y)
%LABELLING Summary of this function goes here
%   Detailed explanation goes here
number_label=str2emolab(label);
no_y=size(y,1);
for i=1:no_y
    if y(i,1)~=number_label
        y_mapped(i,1)=0;
    else
        y_mapped(i,1)=1;
        
    end    
end

