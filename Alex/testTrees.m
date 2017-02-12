function predictions_enumerated=testTrees(T,x2)

predictions = zeros(length(x2),length(T)); 
predictions_enumerated = zeros(length(x2),1);
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

for i=1:length(x2)

if (~any(predictions(i,:))) 
%              predictions(l,1+round(rand*5),i)=1;   %even probability
          for j=1:6
         prob(j) = sum(predictions(:,j))/sum(sum(predictions(:,:))); 
          end
          dist_rand = sum(rand >= cumsum([0, prob]));
         predictions(i,dist_rand)=1;   % probability given by the training data

        elseif (length(find(predictions(i,:)==1))>1)
            
            indices = find(predictions(i,:)==1); 
            
            total = 0; 
            for m=1:length(indices)
                total = total + sum(predictions(:,m)); 
            end
            for m=1:length(indices)
            prob2(m) = sum(predictions(:,m))/total; 
            end
%             split=round(1+rand(size(indices)-1));  %even prob    
            split = sum(rand >= cumsum([0, prob2])); 
            indices(split) = [];         
            predictions(i,indices) = 0; 
    end 



 predictions_enumerated(i)= find(predictions(i,:)==1); 
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

