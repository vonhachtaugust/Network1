function subgroup_list = getSubGroup(s,group_list)
subgroup_list = [];
for i = 1:length(group_list)
    if (group_list(i,1) == s)
        subgroup_list = cat(1,subgroup_list,group_list(i,:));
    end
end
        
