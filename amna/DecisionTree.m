function [Tree] = DecisionTree(x,attributes,binaryvec); 

sort (binaryvec,'ascend'); 
subtrees=cell(1,2); 
    
if all (binaryvec == binaryvec (1));
    leaf_node = binaryvec(1);
    Tree = struct('op',[],'kids',[],'class',leaf_node); 

elseif isempty(attributes) == 1;
    leaf_node = majorityval (binaryvec);
    Tree = struct('op',[],'kids',[],'class',leaf_node);

else
    bestattribute=BestDecision(x,binaryvec,attributes);
    Tree = struct('op',bestattribute,'kids',subtrees(1,2),'class',[]); 
    for q = 1:2
        Tree(q) = struct('op',bestattribute,'kids',subtrees(1,2),'class',[]); 
        indices = x(:,bestattribute) == q-1;
        x = x(indices,:); 
        binaryvec = binaryvec(indices,:); 
        if isempty(x) ==1; 
            leaf_node = majorityval (binaryvec);
            Tree = struct('op',[],'kids',[],'class',leaf_node);
        
        else
            attributes(bestattribute) = []; 
            subtrees{q} = DecisionTree (x,attributes,binaryvec);
        end 

    end
    
end

end
