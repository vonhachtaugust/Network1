function Size = getLargestClusterSize(A_g, n)
numNodes = size(A_g,1); numNeighbors = zeros(n,1);
for i = 1:numNodes
    neighbor_list = 1:n; neighbor_list(i) = [];
    for l = 1:n
        mat = A_g^l; rm = [];
        for j = 1:length(neighbor_list);
            if ( mat(i,neighbor_list(j)) ~= 0 )
                rm = [rm j];
            end
        end
        tmp = length(neighbor_list); neighbor_list(rm(:)) = [];
        if (length(neighbor_list) == tmp)
            break
        end
    end
    numNeighbors(i) = n - length(neighbor_list);
end
Size = max(numNeighbors);
