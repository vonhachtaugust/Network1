% Task 6
clear all
clc
%% Adjacency matrix

A = network3();
n = 1458;
A = sparse(A(:,1),A(:,2),1,n,n);

%% Degree distribution

listD = zeros(n,1);
A2 = A*A;
for i = 1:n
    listD(i) = A2(i,i); 
end
toPlot = countOcc(listD);
toPlot(1,:) = [];
toPlot(:,2) = toPlot(:,2)./sum(toPlot(:,2));
plot(toPlot(:,1),toPlot(:,2),'or');
hold on
plot(toPlot(:,1),toPlot(:,2),'-r');


%% Clustering Coefficient
C = sum(diag(A^3))/(sum(diag(A^2).*(diag(A^2)-1)));
disp(C);
%% Length
list = [];
for i = 1:n
    disp(i)
    tmp = zeros(n - i,2);
    for j = i+1:n
            tmp(j-i,1:2) = [i j] ;
    end
    list = cat(1,list,tmp);
end
toSaved = list;
%%
l = 1; lengthMatrix = zeros(n);

while any(list)
    disp(size(list,1));
    disp('l=');
    disp(l);
    mat = A^l;
    mat = full(mat);
    r = zeros(1,size(list,1));
    start = 1;
    for i = 1:size(list,1);
        if (mat(list(i,1),list(i,2) ~= 0))
            lengthMatrix(list(i,1),list(i,2)) = l;
            r(start) = i;
            start = start + 1;
        end
    end
    disp('to remove =')
    disp(start-1)
    pause(1)
    list(r(1:start-1),:) = [];
    l = l + 1;
end
Sum = 2*sum(sum(lengthMatrix(:,:)))/(n*(n-1));
disp('Sum =')
disp(Sum)

%%
A = full(A);
list = [];
for i = 1:n
    disp(i)
    tmp = zeros(n - i,2);
    for j = i+1:n
            tmp(j-i,1:2) = [i j] ;
    end
    list = cat(1,list,tmp);
end
l = 1; lengthMatrix = zeros(n);
while any(list)
    disp(length(list));
    mat = A^l; r = [];
    for i = 1:size(list,1);
        if (mat(list(i,1),list(i,2)) ~= 0)
            lengthMatrix(list(i,1),list(i,2)) = l;
            r = [r i];
        end
    end
    list(r(:),:) = [];
    l = l + 1;
end
Sum = 2*sum(sum(lengthMatrix(:,:)))/(n*(n-1));
Max = max(max(lengthMatrix));
disp('Sum =')
disp(Sum)


%% Diameter
Max = max(max(lengthMatrix));
disp('Max =')
disp(Max)

%% Network 1

% clustering coefficient = 0.103153224528601
% apl = 14.937625437654198
% diameter = 27


%% Network 2

% clustering coefficients = 0.166269083969466
% APL = 3.606032017315423
% diameter = 8


%% Network 3

% clustering coefficienty = 0.079369651086241
% average path length = 6.812366015065626
% diameter = 19