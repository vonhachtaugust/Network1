function P = TdgD(list,n,p)
k = max(list(:,1));
for i = 1:k+1
    y = (nchoosek(n-1,i)) * (p^(i)) * ((1-p)^(n-1-i));
    P(i,1:2) = [i-1, y];
end
P(:,2) = P(:,2);



