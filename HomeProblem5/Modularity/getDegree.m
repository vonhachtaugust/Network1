function degree = getDegree(A,node_list)
degree = [];
for i = 1:size(A,1)
    sum = 0;
    for j = 1:size(A,1)
        if (A(i,j) ~= 0 && any(node_list(:,2) == i) && any(node_list(:,2) == j))
            sum = sum + 1;
        end
    end
    if (sum ~= 0)
        degree=[degree ; sum];
    end
end