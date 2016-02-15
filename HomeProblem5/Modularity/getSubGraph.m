function k = getSubGraph(s)
k = [];
for i = 1:size(s,2)
    list = s(i).list;
    [left,right] = getGroup(list);
    left = struct('list',left);
    right = struct('list',right);
    k = [k left right];
end