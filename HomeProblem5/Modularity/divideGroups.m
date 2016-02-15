function s = divideGroups(eigenvector,list)
n = length(eigenvector);
s = zeros(n,1);
for i = 1:n
   if (eigenvector(i) > 0)
       s(i,1:2) = [1 list(i,2)];
   elseif (eigenvector(i) < 0)
       s(i,1:2) = [-1 list(i,2)];
   else 
       r = rand;
       if ( r < 0.5 )
           s(i,1:2) = [1 list(i,2)];
       else
           s(i,1:2) = [-1 list(i,2)];
       end
   end
end

