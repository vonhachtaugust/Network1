function pos = generateCircularPos(n)
r = 1;
theta = 2*pi/n;
pos = zeros(n,2);
for i = 1:n
    pos(i,1:2) = [r*cos((i-1)*theta),r*sin((i-1)*theta)];
end


