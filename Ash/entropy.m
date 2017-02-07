function [entropyOut] = entropy(p, n)


ppn = p/(p+n+eps);
npn = n/(p+n+eps);
    entropyOut = -( ppn*log2(ppn+eps) + npn*log2(npn+eps) );
end