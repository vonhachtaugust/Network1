% Albert_Barabasi
%% Initialisation:
clear all
clc
clf

n0 = 1000;
m = 3;
pos = generateCircularPos(n0);
%plot(pos(:,1),pos(:,2),'ko')
%hold on
[A,I,J] = initial(m,n0);
A = sparse(A);
list = initOcc(A);
%gplot(A,pos,'b-*')

k = cumsum(list)/sum(list);
a = I;
b = J;

%pause(1)

for t = 1:n0-m
    I = a + t;
    tmp = list(I);
    list(I) = 0;
    k = cumsum(list)./sum(list);
    for j = 1:m
        r = rand;
        for i = 1:length(k)
            if( k(i) > r )
                J = i;
                break
            end
        end
        A(J, I) = 1;
        A(I, J) = 1;
        list(J) = list(J) + 1;
        list(I) = list(I) + 1;
    end
    list(I) = list(I) + tmp;
    %gplot(A,pos,'b-*')
    %pause(1)
end

%% Power-law 
list = countEdges(A);
toPlot = countOcc(list, m);
toPlot = toPlot./sum(toPlot);
%toPlot = sort(list,'descend')./sum(list);
loglog(toPlot,'ko')
hold on
% Theory;
iter = 110;
f = zeros(iter,1);
% uniform pick -> allow for connect multiple times to same node i.e.
% benefints hubs and therefore steeper curve.
g = zeros(iter,1);
for i = 1:iter
    f(i) = Tpd(i,m);
    g(i) = Tpd2(i,m);
end
loglog(f(:,1))
hold on
loglog(g(:,1))





















