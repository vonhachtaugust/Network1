function A = randomAddEdges(A, p)
n = size(A,1);
for i = 1:n
    for j = 1:n
        r = rand;
        if ( A(i,j) == 1 && r < p )
            x = 1 + floor(n*rand);
            y = 1 + floor(n*rand);
            A(x,y) = 1;
            A(y,x) = 1;
        end
    end
end
