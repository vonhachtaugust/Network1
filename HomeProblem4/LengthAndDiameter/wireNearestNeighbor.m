function A = wireNearestNeighbor(pos,c)
n = size(pos,1);
A = zeros(n,n);
for i = 1:n
    for j = 1:n
        if ( abs(i - j) < c && i - j ~= 0 )
            A(i,j) = 1;
        else
            A(i,j) = 0;
        end
    end
end

for i = 1:c-1
    for j = 0:c-i-1
        A(i,n-j) = 1;
        A(n-j,i) = 1;
    end
end
    


