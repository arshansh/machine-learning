%returns the classification result of x for Tree given
function prediction=walkTree(Tree,x)

 if ( ~isnan(Tree.class))
        prediction = Tree.class; 
    elseif (x(Tree.op)==1)
        prediction = walkTree(Tree.kids{2},x);
    else 
        prediction = walkTree(Tree.kids{1}, x); 
    end 
    
 end