%% Random graph 
clear all; clc; n = 10; p = 0.3; %f = 0.1;

%% remove random
clear all; clc; n = 100; p = 0.1;
average = zeros(n-1,1);

for i = 1:40
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
average = average/40;
figure(2)
plot(toPlot(:,1),average)
hold on

%% remove highest degree 
clear all; clc; n = 100; p = 0.1;
average = zeros(n-1,1);
for i = 1:40
    toPlot = [];
    disp(i)
    for f = 1:n-1;
        
        A = triu(rand(n) < p,1); A = A + A'; fraction = f/n;
        A_g = removeDegree(A,fraction);
        toPlot = [toPlot ; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/40;
figure(2)
plot(toPlot(:,1),average)


%% Pref graph

%% random remove
clear all; clc; n = 100; m = 3;

average = zeros(n-1,1);
for i = 1:40
    toPlot = [];
    disp(i)
    for f = 1:n-1;
        
        [A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
        A_g = getPrefGraph(A,list_1,n,m,I,J);

        fraction = f/n;
        A_g = removeRandom(A_g,fraction);
        toPlot = [toPlot ; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/40;
plot(toPlot(:,1),average)
hold on



%% degree remove

clear all; clc; n = 100; m = 3;
average = zeros(n-1,1);
for i = 1:40
    toPlot = [];
    disp(i)
    for f = 1:n-1;
        
        [A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
        A_g = getPrefGraph(A,list_1,n,m,I,J);

        fraction = f/n;
        A_g = removeDegree(A_g,fraction);
        toPlot = [toPlot ; fraction getLargestClusterSize(A_g, size(A_g,1))];
    end
    average = average + toPlot(:,2);
end
average = average/40;
plot(toPlot(:,1),average)
hold on




