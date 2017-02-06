function predictions=testTrees(T,x2)

predictions = zeros(length(x2),length(T)); 
for i=1:length(x2)
        
    for j=1:length(T)

    if (T(j).class)
        predictions(i,j) = T(j).class; 
    elseif (x2(i,T(j).op))
        predictions(i,j) = walkTree(T(j).kids{2},x2(i,:));
    else 
        predictions(i,j) = walkTree(T(j).kids{1}, x2(i,:));
    end 
    
    end

end

end 


function prediction=walkTree(Tree,x)

 if (~isempty(Tree.class))
        prediction = Tree.class; 
    elseif (x(Tree.op))
        prediction = walkTree(Tree.kids{2},x);
    else 
        prediction = walkTree(Tree.kids{1}, x); 
    end 
    
 end

