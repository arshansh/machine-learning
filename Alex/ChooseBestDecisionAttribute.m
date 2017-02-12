function [best,bestIndex] = ChooseBestDecisionAttribute(examples,attributes,binary_targets)

p = sum(binary_targets==1); 
n = sum(binary_targets==0); 

 
   for i=1:length(attributes)
                  
        indices = find(examples(:,attributes{i}) == 1); 
        p1 = sum(binary_targets(indices)); 
        n1 = length(indices) - p1;
        
        indices2 = find(examples(:,attributes{i}) == 0); 
        p0 = sum(binary_targets(indices2)); 
        n0 = length(indices2)-p0; 
       
        p0n0 = (p0+n0)/(p+n);
        p1n1 = (p1+n1)/(p+n);
        
       Remainder = p0n0*Inp(p0,n0)+p1n1*Inp(p1,n1); 
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

ppn = p/(p+n);
npn = n/(p+n);

 Irk = -( ppn*log2(ppn) + npn*log2(npn) );


end 