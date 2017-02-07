function [kids_examples] = find_ex( best_att,possible_att_val,ex,bin_targ)
%FIND Summary of this function goes here
%   Detailed explanation goes here

no_y=size(ex,1);
result_counter=1;
kids_examples=[];

idx=find_idx(ex,best_att);

for i=1:no_y
    if ex(i,idx)== possible_att_val
                 
        temp_ex=ex;
        temp_ex(:, idx )=[];
        
        kids_examples(result_counter,:)=temp_ex(i,:);
        %kids_bin_targ(result_counter,1)=bin_targ(i,1);
        result_counter=result_counter+1;
        
    end
end

end

