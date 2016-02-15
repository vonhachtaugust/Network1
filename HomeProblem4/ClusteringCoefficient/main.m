% Watts-Strogatz small world model
clear all;clc;n=100;c=4;pos=generateCircularPos(n);A=wireNearestNeighbor(pos,c);
gplot(A,pos,'-*');
disp('Theory:');
disp((3/4)*(((c*2-2)-2)/((c*2-2)-1)))
disp('result:');
% Algorithm:
format long
A = data();
disp( sum(diag(A^3))/(sum(diag(A^2).*(diag(A^2)-1))) );



