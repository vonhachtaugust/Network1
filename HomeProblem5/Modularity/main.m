% Spectral method:
% Compute the leading eigenvector of the modularity matrix and divide the
% vertices into two groups according to the signs of the elements in this
% vector.
clear all
clc
format long
A = data();
%G = graph(A);
%plot(G);
%% First split:
for i = 1:size(A,1)
    group_list(i,1:2) = [0 i];
end
m = 0.5*sum(diag(A^2));
k = diag(A^2);
B = B(A,m,k);
[Evecs,Evals] = eig(B);
[~,I] = max(max(Evals));
s = divideGroups(Evecs(:,I),group_list); %  0.xxx372.
Q = (1/(4*m))*s(:,1)'*B*s(:,1)
%% Need to keep track of s relate to B.
group_list = zeros(length(s),2);
for i = 1:length(s)
    group_list(i,1:2) = [s(i) i];
end
%% Second split group 1: +1s
% get the sub group to examine and remember how s reslates to all nodes:
subG1 = getSubGroup(1,s);
% find corresonding A and B
ng = size(subG1); A_sub = zeros(ng); B_sub = zeros(ng);
for i = 1:ng
    for j = 1:ng
        A_sub(i,j) = A(subG1(i,2),subG1(j,2));
        B_sub(i,j) = B(subG1(i,2),subG1(j,2));
    end
end
k_sub = diag((A_sub)^2); d_g = sum(k_sub); deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(i)*(d_g/(2*m));
end
B_g = B_sub - deltaB; [Evecs, Evals] = eig(B_g); [~,t] = max(max(Evals));
s1 = divideGroups(Evecs(:,t),subG1);
deltaQ1 = (1/(4*m))*s1(:,1)'*B_g*s1(:,1)

%% Second split group 1: -1s
% get the sub group to examine and remember how s reslates to all nodes:
subG2 = getSubGroup(-1,group_list);
% find corresonding A and B
ng = size(subG2); A_sub = zeros(ng); B_sub = zeros(ng);
for i = 1:ng
    for j = 1:ng
        A_sub(i,j) = A(subG2(i,2),subG2(j,2));
        B_sub(i,j) = B(subG2(i,2),subG2(j,2));
    end
end
k_sub = diag((A_sub)^2); d_g = sum(k_sub); deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(i)*(d_g/(2*m));
end
B_g = B_sub - deltaB; [Evecs, Evals] = eig(B_g); [~,t] = max(max(Evals));
s2 = divideGroups(Evecs(:,t),subG2);
deltaQ2 = (1/(4*m))*s2(:,1)'*B_g*s2(:,1)
% GIVES NEGATIVE VALUES NOT CONSIDERED!

%% Third split of first second split: +1s
% get the sub group to examine and remember how s reslates to all nodes:
subG3 = getSubGroup(1,s1);
% find corresonding A and B
ng = size(subG3); A_sub = zeros(ng); B_sub = zeros(ng);
for i = 1:ng
    for j = 1:ng
        A_sub(i,j) = A(subG3(i,2),subG3(j,2));
        B_sub(i,j) = B(subG3(i,2),subG3(j,2));
    end
end
k_sub = diag((A_sub)^2); d_g = sum(k_sub); deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(i)*(d_g/(2*m));
end
B_g = B_sub - deltaB; [Evecs, Evals] = eig(B_g); [~,t] = max(max(Evals));
s3 = divideGroups(Evecs(:,t),subG3);
deltaQ3 = (1/(4*m))*s3(:,1)'*B_g*s3(:,1)

%% Third split of first second split: -1s
% get the sub group to examine and remember how s reslates to all nodes:
subG4 = getSubGroup(-1,s1);
% find corresonding A and B
ng = size(subG4); A_sub = zeros(ng); B_sub = zeros(ng);
for i = 1:ng
    for j = 1:ng
        A_sub(i,j) = A(subG4(i,2),subG4(j,2));
        B_sub(i,j) = B(subG4(i,2),subG4(j,2));
    end
end
k_sub = diag((A_sub)^2); d_g = sum(k_sub); deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(i)*(d_g/(2*m));
end
B_g = B_sub - deltaB; [Evecs, Evals] = eig(B_g); [~,t] = max(max(Evals));
s4 = divideGroups(Evecs(:,t),subG4);
deltaQ4 = (1/(4*m))*s4(:,1)'*B_g*s4(:,1)

%% Fourth split of first second split: +1s
% get the sub group to examine and remember how s reslates to all nodes:
subG5 = getSubGroup(1,s3);
% find corresonding A and B
ng = size(subG5); A_sub = zeros(ng); B_sub = zeros(ng);
for i = 1:ng
    for j = 1:ng
        A_sub(i,j) = A(subG5(i,2),subG5(j,2));
        B_sub(i,j) = B(subG5(i,2),subG5(j,2));
    end
end
k_sub = diag((A_sub)^2); d_g = sum(k_sub); deltaB = zeros(ng);
for i = 1:ng
    deltaB(i,i) = k_sub(i) - k(i)*(d_g/(2*m));
end
B_g = B_sub - deltaB; [Evecs, Evals] = eig(B_g); [~,t] = max(max(Evals));
s5 = divideGroups(Evecs(:,t),subG5);
deltaQ5 = (1/(4*m))*s5(:,1)'*B_g*s5(:,1);