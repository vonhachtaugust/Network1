function occ = initOcc(A)
n = size(A,1);
occ = zeros(1,n);
for i = 1:n
    sum = 0;
    for j = 1:n
        if ( A(i,j) == 1 )
            sum = sum + 1;
        end
    end
    occ(1,i) = sum;
end