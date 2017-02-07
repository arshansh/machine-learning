function [tree] = decision_tree(ex,att,bin_targ)
%DECISION_TREE Summary of this function goes here
%   Detailed explanation goes here

if(all_same_binary(bin_targ)==1)
    tree=tree_node(NaN,{},bin_targ(1,1));
    return;
elseif ( isempty(att)==1 )
    tree=tree_node(NaN,{},mode(bin_targ));
    return;
else
    best_att=choosebest(ex,att,bin_targ);
    %best_att=att(1);
    
    tree=tree_node(best_att,{},NaN);
    possible_att_val=[0 1];
    for i=1:length(possible_att_val)
      %adding a branch to the tree for each ui
      kids_examples=find_ex(best_att,possible_att_val(i),ex);
      kids_bin_targ=find_targ(best_att,possible_att_val(i),ex,bin_targ);
      
      if( isempty(kids_examples) )
          tree=tree_node(NaN,{},mode(bin_targ));
          return;
      else
          kids_att=att;
          kids_att( find_idx(att,best_att)  )=[];
          
          kids_tree=decision_tree(kids_examples,kids_att,kids_bin_targ);

      end 
      tree.kids{end+1}=kids_tree;
      tree.op=best_att;
      tree.class=NaN;
    end
    
    return
end
  
end

