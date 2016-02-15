function index = getNeighbor(A, index)
x = find(A(index,:) == 1);
if (isempty(x))
    index = -1;
else
    index = x(ceil(rand*length(x)));
end
