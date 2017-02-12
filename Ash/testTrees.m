function predictions=testTrees(T,x2)

predictions = zeros(length(x2),length(T)); 

%for each example
for i=1:length(x2)
    
    %going through all the trees
    for j=1:length(T)

    %if (T(j).class)
    %   predictions(i,j) = T(j).class; 
    %elseif (x2(i,T(j).op))
    %    predictions(i,j) = walkTree(T(j).kids{2},x2(i,:));
    %else 
    %    predictions(i,j) = walkTree(T(j).kids{1}, x2(i,:));
    %end 
    
    
    predictions(i,j)= walkTree (T(j),x2(i,:));
    
    
    end

end

end 



