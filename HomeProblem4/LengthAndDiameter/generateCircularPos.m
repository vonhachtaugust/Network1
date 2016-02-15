function pos = generateCircularPos(n)
for i = 1:n
    pos(i,1:2) = [cos((i-1)*2*pi/n),sin((i-1)*2*pi/n)];
end


