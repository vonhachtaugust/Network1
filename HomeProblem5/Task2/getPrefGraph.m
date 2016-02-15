function A = getPrefGraph(A,list,n0,m,I,J)
%k = cumsum(list)/sum(list);
a = I;
%b = J;

for t = 1:n0-m
    I = a + t;
    tmp = list(I);
    list(I) = 0;
    k = cumsum(list)./sum(list);
    for j = 1:m
        r = rand;
        for i = 1:length(k)
            if( k(i) > r )
                J = i;
                break
            end
        end
        A(J, I) = 1;
        A(I, J) = 1;
        list(J) = list(J) + 1;
        list(I) = list(I) + 1;
    end
    list(I) = list(I) + tmp;
end

