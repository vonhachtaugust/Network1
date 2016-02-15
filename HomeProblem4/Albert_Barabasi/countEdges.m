function list = countEdges(A)
n = size(A,1);
list = size(1,n);
for i = 1:n
    list(i) = sum(A(i,:));        
end

