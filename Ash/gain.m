function [gainOut] = gain(attributeVect, bin_targ, p, n)
    gainOut = entropy(p,n) - remainder(attributeVect, bin_targ);
end