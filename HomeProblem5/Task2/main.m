clear all; clc; clf; n = 100; m = 3;
[A,I,J] = initial(m,n); A = sparse(A); list_1 = initOcc(A);
A_g = getPrefGraph(A,list_1,n,m,I,J);

numAvg = 20;
dim = 40;
average = zeros(dim,1);
for derp = 1:numAvg;
    toPlot = [];
    disp(derp)
    for j = 1:dim;
        R = j*0.1;
        B = removeEdges(A_g,R);
        toPlot = [toPlot ; R getLargestClusterSize(B, n)/n];
    end
    average = average + toPlot(:,2);
end
average = average/numAvg;
figure(2)
plot(toPlot(:,1),average)