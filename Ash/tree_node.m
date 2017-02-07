classdef tree_node
    %TREE Summary of this class goes here
    %   Detailed explanation goes here
    properties
        op=NaN; %attribute label=AUs
        kids={}; %1*2 array
        class=NaN; %binary leaf classification=0,1
        
        index,
        X;
        Y;
        
    end
    
    methods
        function node=tree_node(op_in,kids_in,class_in)
            node.op=op_in;
            node.kids=kids_in;
            node.class=class_in;
        end
    end
end

