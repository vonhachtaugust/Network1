function A_g = removeEdges(A_g,R)
n = size(A_g,1);
x = 1/R;
phi = 1/(1 + x);
for i = 1:n
    for j = i+1:n
        if ( A_g(i,j) ~= 0 )
            r = rand;
            if ( r < 1-phi )
                A_g(i,j) = 0;
                A_g(j,i) = 0;
            end
        end
    end
end