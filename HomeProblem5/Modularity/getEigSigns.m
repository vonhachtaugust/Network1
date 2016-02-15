function subGraph = getEigSigns(eigVec, node_list)
n = length(eigVec);
subGraph = zeros(n,2);
for i = 1:n
   if (eigVec(i) > 0)
       subGraph(i,1:2) = [1 node_list(i,2)];
   elseif (eigVec(i) < 0)
       subGraph(i,1:2) = [-1 node_list(i,2)];
   else 
       r = rand;
       if ( r < 0.5 )
           subGraph(i,1:2) = [1 node_list(i,2)];
       else
           subGraph(i,1:2) = [-1 node_list(i,2)];
       end
   end
end