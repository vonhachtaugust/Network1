function occ = countOcc(list)
n = max(list);
occ = zeros(n,2);
for i = 1:n
    sum = 0;
    for j = 1:length(list)
        if ( list(j) == i )
            sum = sum + 1;
        end
    end
    occ(i+1,1:2) = [i sum];
end