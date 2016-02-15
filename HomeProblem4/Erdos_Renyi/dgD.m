function list = dgD(G);
% Degree distribution
n = size(G,1);
for i = 1:n
    sum = 0;
    for j = 1:n 
        if G(i,j) == 1
            sum = sum + 1;
        end
    end
    list(i) = sum;        
end

