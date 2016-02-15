function [left,right] = getGroup(list)
n = size(list,1);
left = [];
right = [];
for i = 1:n
   if (list(i,1) > 0)
       left = [left; 1 list(i,2)];
   elseif (list(i,1) < 0)
       right = [right; -1 list(i,2)];
   else 
       r = rand;
       if ( r < 0.5 )
           left = [left; 1 list(i,2)];
       else
           right = [right; -1 list(i,2)];
       end
   end
end
