function A_g = removeRandom(A,f)
node_list = 1:size(A,1);
rm = [];
for i = 1:f*size(A,1)
    r = ceil(rand*length(node_list));
    rm = [rm ;node_list(r)];
    node_list(r) = [];
end
rm = sort(rm,'descend');
for i = 1:length(rm)
        A(rm(i),:) = 0;
        A(:,rm(i)) = 0;
end
A_g = A;