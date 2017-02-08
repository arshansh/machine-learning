function [best,bestIndex] = ChooseBestDecisionAttribute(examples,attributes,binary_targets)

p = sum(binary_targets==1); 
n = sum(binary_targets==0); 

 
   for i=1:numel(attributes)
                  
        indices = (examples(:,attributes{i}) == 1); 
        p1 = sum(binary_targets(indices)); 
        n1 = numel(indices) - p1;
        
        indices = examples(:,attributes{i}) == 0; 
        p0 = sum(binary_targets(indices)); 
        n0 = numel(indices)-p0; 
        
       Remainder = (p0+n0)*Inp(p0,n0)/(p+n)+(p1+n1)*Inp(p1,n1)/(p+n); 
       Gain = Inp(n,p) - Remainder; 
       if ~exist('previous_gain','var')
           previous_gain=Gain; 
           best = attributes{i}; 
           bestIndex = i; 
       elseif Gain>previous_gain
           previous_gain = Gain; 
           best = attributes{i}; 
           bestIndex = i; 
       end  
        
       
   end 
       


end 


function Irk = Inp(n,p)

 Irk = - p*log2(p/(p+n))/(p+n) - n*log2(n/(p+n))/(p+n); 


end 