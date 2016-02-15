clear all; clc;

%% Random vaccination: random graph
clear all; clc; n = 100; p = 0.1; average = zeros(n-1,1);
for i = 1:20
    toPlot = [];
    disp(i)
    A = triu(rand(n) < p,1); A = A + A'; 
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeRandom(A,fraction);
        toPlot = [toPlot ; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(3); plot(toPlot(:,1),average,'g'); hold on

%% Highest degree vaccination: random graph
clear all; clc; n = 100; p = 0.1; average = zeros(n-1,1);
for i = 1:20
    toPlot = []; disp(i);
    A = triu(rand(n) < p,1); A = A + A';
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeDegree(A,fraction);
        toPlot = [toPlot; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(3); plot(toPlot(:,1),average,'r'); hold on;

%% Neighbor vaccination random graph:
clear all; clc; n = 100; p = 0.1; average = zeros(n-1,1);
for i = 1:20
    toPlot = []; disp(i);
    A = triu(rand(n) < p,1); A = A + A';
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeNeighbor(A,fraction);
        toPlot = [toPlot;fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(3); plot(toPlot(:,1),average,'b'); hold on;

%% Random vaccination: pref graph
clear all; clc; n = 100; m = 3; average = zeros(n-1,1);
for i = 1:20
    toPlot = [];
    disp(i)
    [A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
        A = getPrefGraph(A,list_1,n,m,I,J);
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeRandom(A,fraction);
        toPlot = [toPlot ; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(2); plot(toPlot(:,1),average,'g'); hold on

%% Highest degree vaccination: pref graph
clear all; clc; n = 100; m = 3; average = zeros(n-1,1);
for i = 1:20
    toPlot = []; disp(i);
    [A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
        A = getPrefGraph(A,list_1,n,m,I,J);
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeDegree(A,fraction);
        toPlot = [toPlot; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(2); plot(toPlot(:,1),average,'r'); hold on;

%% Neighbor vaccination pref graph:
clear all; clc; n = 100; m = 3; average = zeros(n-1,1);
for i = 1:20
    toPlot = []; disp(i);
    [A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
        A = getPrefGraph(A,list_1,n,m,I,J);
    for f = 1:n-1;
        fraction = f/n;
        A_g = removeNeighbor(A,fraction);
        toPlot = [toPlot;fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/20; figure(2); plot(toPlot(:,1),average,'b'); hold on;

%% Degree distribution random graph:
clear all
clc
figure(1)
clf
figure(2)
clf

n = 100;
%p = 0.1;
m = 3;

%A = triu(rand(n) < p,1);
%A = A + A';
[A,I,J] = initial(m,n); list_1 = initOcc(A);
A = getPrefGraph(A,list_1,n,m,I,J);

dD = diag(A^2);
k_min = min(dD); k_max = max(dD); 
figure(1)
occ = countOcc(dD);
hist(dD,30);
hold on
Sum = sum(occ(:,2));
k_e = 0;
for i = 1:size(occ,1)
    k_e = k_e + dD(i)*occ(i,2)./Sum;
end

for i = 1:length(dD)-1
    edD(i) = (dD(i)+1)*dD(i+1)/k_e;
end

edD = edD';
figure(2)
hist(edD,30);
hold on




%%

l_e = size(dD,1) - 1;
edD = zeros(l_e,1);
for i = 1:l_e
    edD(i) = dD(i+1)*(i+1)/k_e;
end
hist(edD,size(dD,1)-1)
hold on


