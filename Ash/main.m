%N is 1004 i.e we have 1004 pictures
ange_targ=labelling('ange',y);
ange_tree=decision_tree(x,att,ange_targ);

happ_targ=labelling('happ',y);
happ_tree=decision_tree(x,att,happ_targ);

sadn_targ=labelling('sadn',y);
sadn_tree=decision_tree(x,att,sadn_targ);

disg_targ=labelling('disg',y);
disg_tree=decision_tree(x,att,disg_targ);

fear_targ=labelling('fear',y);
fear_tree=decision_tree(x,att,fear_targ);

surp_targ=labelling('surp',y);
surp_tree=decision_tree(x,att,surp_targ);

Trees=[ange_tree,happ_tree,sadn_tree,disg_tree,fear_tree,surp_tree];


pred=testTrees(Trees,x);

    