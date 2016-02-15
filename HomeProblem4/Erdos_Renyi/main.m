%Erdos-Renyi
clear all
clc
clf
n = 1500;
p = 0.1;
pos = generateCircularPos(n);
A = triu(rand(n) < p,1);
A = A + A';
%gplot(A,pos,'-*');
%
list = zeros(n,1);
A2 = A*A;
for i = 1:n
    list(i) = A2(i,i); 
end
toPlot = countOcc(list);
toPlot(:,2) = toPlot(:,2)/sum(toPlot(:,2));
plot(toPlot(:,1),toPlot(:,2),'.r');
hold on
x = TdgD(list,n,p);
plot(x(:,1),x(:,2),'-b');




        

