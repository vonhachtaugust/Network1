function occ = countOcc(list, m)
n = max(list);
for i = m:n
    sum = 0;
    for j = 1:length(list)
        if ( list(j) == i )
            sum = sum + 1;
        end
    end
    occ(i) = sum;
end