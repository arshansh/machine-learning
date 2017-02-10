function [IG] = IG (p,n) 

IG = -p/(p+n)*log2(p/p+n) - n/(p+n)*log2(n/p+n); 

end 
