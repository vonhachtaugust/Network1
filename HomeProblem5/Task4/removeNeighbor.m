function A = removeNeighbor(A,f)
n = size(A,1);
checked = [];
disp(f)
t = 0;
while length(checked)/n < f
    index = getNeighbor(A,ceil(rand*n));
    if isempty(find(checked == index))
        if (index > -1)
            checked = [checked index];
            A(:,index) = 0;
            A(index,:) = 0;
        end
    end
    t = t + 1;
    if t > 200
        break
    end
end