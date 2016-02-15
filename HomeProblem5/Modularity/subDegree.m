function dg = subDegree(A,node_list)
n = size(node_list,1);
dg = 0;
for i = 1:n
    dg = dg + sum(A(node_list(i,2),:));
end

