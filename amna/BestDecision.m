function [bestattribute] = BestDecision(x,binaryvec,attributes) 

p = nnz(binaryvec); % number of positive examples in binary vector 
n = length(binaryvec) - p; % number of negative examples (0) in binary vector 
gain = zeros(size(attributes)); 
IGwhole = IG (p,n);
[binaryvec,sortindices] = sort(binaryvec,'ascend'); 
x = x(sortindices,:); 


for a=1:45

    N1 = nnz(x(1:n,a)); %negative examples for which the value of the attribute is 1
    N0 = length(x(1:n,a)) - nnz(x(1:n,a)) ; %negative examples for which value of attribute is 0
    P1 = nnz(x((n+1):end,a)); % number of positive examples for which value of attribute is 1
    P0 = length(x((n+1):end,a)) - nnz(x((n+1):end,a));% number of negative examples for which value of attribute is 0
    
    gain (a) = IGwhole - (P0+N0)/(p+n) * IG (P0,N0) + (P1+N1)/(p+n) * IG(P1,N1);

end 

[maxgain,bestattribute] = min (gain); 
    
    %possibly in the loop redefine binaryvec , but i feel like the larger
    %code does this anyway 
    
    
    
    
    
    
    
