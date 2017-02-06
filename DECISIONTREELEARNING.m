function tree = DECISIONTREELEARNING(examples,attributes,binary_targets)

tree = struct('op',[],'kids',[],'class',[]);

if (range(binary_targets) == 0)
    
    tree.class = binary_targets(1);   
    tree.op = []; 
    tree.kids = []; 
    return
 
    
elseif(isempty(attributes))
    
    tree.class =  mode(binary_targets); % MajorityValue(binary_targets);
    tree.op = [];
    tree.kids = []; 
    return
    


else 
    
    [best_attribute,best_attributeIndex] = ChooseBestDecisionAttribute(examples,attributes, binary_targets);
    
    
    
    for i=0:1:1
        
        indices = find(examples(:,best_attribute) == i); 
        
        examples_i = zeros(numel(indices),size(examples,2));
        binary_targets_i = zeros(1,numel(indices));

       
        examples_i = examples(indices,:); 
        binary_targets_i = binary_targets(indices); 
        
        
     
        if (isempty(examples_i))
            
            tree.class =  mode(binary_targets); % MajorityValue(binary_targets); 
            tree.kids = []; 
            tree.op = [];
            return; 


        else 
            
           new_attributes = attributes; 
           new_attributes(best_attributeIndex) = []; 
           
           tree.class = []; 
           tree.op = best_attribute;
           tree.kids{1,i+1}= DECISIONTREELEARNING(examples_i,new_attributes, binary_targets_i);
            
        end 
        
    end 
   
end 

end 