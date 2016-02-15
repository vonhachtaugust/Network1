function deltaB = getDeltaB(k_sub,k,dg,m,ng,node_list)
deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(node_list(i,2))*(dg/(2*m));
end
