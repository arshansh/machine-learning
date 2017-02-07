function [remainderOut] = remainder(attributeVect, bin_targ)
    
p0 = 0;
p1 = 0;
n0 = 0;
n1 = 0;
no_examples = size(bin_targ,1);
%for every vertical element i.e. for every example
    for iter = 1:no_examples
        
        if(attributeVect(iter,1) == 0)
            %if positive example
            if(bin_targ(iter,1) == 1)
                p0 = p0 + 1;
            else %if negative
                n0 = n0 + 1;
            end
        end
        if(attributeVect(iter,1) == 1)
            if(bin_targ(iter,1) == 1)
                p1 = p1 + 1;
            else
                n1 = n1 + 1;
            end
        end
    end
    

p0n0 = (p0+n0)/no_examples;
p1n1 = (p1+n1)/no_examples;
remainderOut = p0n0*entropy(p0,n0) + p1n1*entropy(p1,n1);


end