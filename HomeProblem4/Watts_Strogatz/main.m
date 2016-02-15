% Watts-Strogatz small world model
%% Pre-rewire
clear all
clc
clf

n = 20;
p = 0.2;
c = 5;

pos = generateCircularPos(n);
plot(pos(:,1),pos(:,2),'.b')
hold on;
A = wireNearestNeighbor(pos,c);
A = sparse(A);

gplot(A,pos,'b-*')

%% Rewire:
% For each edge in original path, pick to random nodes and add an edge
% between these with probability p, or replace if edge already there.

A = randomAddEdges(A,p);
gplot(A,pos,'b-x')