function B_sub = getSubB(B,node_list)
n = size(node_list,1);
B_sub = zeros(n);
for i = 1:n
    for j = 1:n
        B_sub(i,j) = B(node_list(i,2),node_list(j,2));
    end
end

