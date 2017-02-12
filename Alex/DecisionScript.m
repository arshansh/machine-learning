clear all 

load('cleandata_students.mat');

pruning_example(x,y); 



attributes = cell(1,45);
for i=1:45
attributes(1,i) = {i}; 
end 



for i=1:6

end


confused = zeros(6,6,10);
notwrong = zeros(10,1); 
wrong = zeros(10,1); 
predictions = zeros(100,6,10); 

for i=1:10
    
    test_x = x(1+(i-1)*100:i*100,:); 
    test_y(:,i) = y(1+(i-1)*100:i*100); 
    
    train_x = x;
    train_x(1+(i-1)*100:i*100,:)=[]; 
    
    train_y = y;
    train_y(1+(i-1)*100:i*100)=[]; 
    
    for j=1:6
        y_emotion(j,:) = (train_y==j); 
        trees(j,:) = DECISIONTREELEARNING(train_x,attributes,y_emotion(j,:));
    end 
    
    predictions(:,:,i) = testTrees(trees,test_x); 
    

    prob = zeros(1,6); 
    
    for l=1:length(test_y(:,i))
     
        if (~any(predictions(l,:,i))) 
             predictions(l,1+round(rand*5),i)=1;   %even probability
%           for j=1:6
%          prob(j) = sum(y_emotion(j,:))/length(y_emotion(j,:)); 
%           end
%           dist_rand = sum(rand >= cumsum([0, prob]));
%          predictions(l,dist_rand,i)=1;   % probability given by the training data

        elseif (length(find(predictions(l,:,i)==1))>1)
            
            indices = find(predictions(l,:,i)==1); 
            
            total = 0; 
            for m=1:length(indices)
                total = total + sum(y_emotion(m,:)); 
            end
            for m=1:length(indices)
            prob2(m) = sum(y_emotion(m,:))/total; 
            end
            split=round(1+rand(size(indices)-1));  %even prob    
%             split = sum(rand >= cumsum([0, prob2])); 
            indices(split) = [];         
            predictions(l,indices,i) = 0; 
        end 
            
        if(predictions(l,test_y(l,i),i))
            notwrong(i) = notwrong(i) +1; 
            confused(test_y(l,i),test_y(l,i),i) = confused(test_y(l,i),test_y(l,i)) +1; 
            
        else
            wrong(i) = wrong(i) +1; 
            confused(find(predictions(l,:,i)==1),test_y(l,i),i) = confused(find(predictions(l,:,i)==1),test_y(l,i),i)+1;  
        end 
        
    end 
    
     
end 

A=zeros(6,6);
for i = 1:10 
    A = A + confused(:,:,i); 
end 

for j= 1:6
    
    Rc(j)= A(j,j)/(sum(A(j,:)));
    Pr(j)= A(j,j)/(sum(A(:,j)));
    F1(j)=2*(Pr(j)*Rc(j))/(Pr(j)+Rc(j)); 
    
end 

targets = zeros(1000,6);
for i=1:10
    
    
    for j = 1:100
    output(j+(i-1)*100,:) = predictions(j,:,i)==1; 
    targets(j+(i-1)*100,test_y(j,i)) = 1; 
    
    end
end 
 plotconfusion(transpose(targets),transpose(output)); 
 figure
 plotroc(transpose(targets),transpose(output)); 
%  
% load('noisydata_students.mat');
% figure
% pruning_example(x,y); 

