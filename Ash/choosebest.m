function highestAtt = choosebest(examples, attributes, bin_targ) 


p=0;
n=0;

for i=1:size(bin_targ,1)
    if bin_targ(i,1)== 1
        p=p+1;
    end
end
     

n = size(examples,1) - p;


%highestAtt=attributes(1);
highest=gain(examples(:,1), bin_targ, p,n);

    for i = 1:size(attributes, 2)
        
        if(gain(examples(:,i), bin_targ, p,n)>=highest)
            highest = gain(examples(:,i), bin_targ, p,n);
            highestAtt = attributes(i);
        end
    end
end