clear all
clc
format long
A = data();
m = 0.5*sum(diag(A^2));
k = diag(A^2);
s0 = zeros(size(A,1),2); s0(:,2) = linspace(1,size(A,1),size(A,1));
B = Binit(A,m,k);
[Evecs,Evals] = eig(B);
[~,I] = max(max(Evals));
s0 = divideGroups(Evecs(:,I),s0);
next = struct('list',s0);

Q = (1/(4*m))*s0(:,1)'*B*s0(:,1); %  0.xxx372.
disp(Q)
runs = 2;
lista = [];
for i = 1:runs
    g = getSubGraph(next);
    lista = [lista g];
    next = [];
    for j = 1:size(g,2)
       node_list = g(j).list;
       ng = size(node_list,1);
       
       k_sub = getDegree(A,node_list);
       dg = subDegree(A,node_list);
       deltaB = getDeltaB(k_sub,k,dg,m,ng,node_list);
       B_sub = getSubB(B,node_list);
       B_g = B_sub - deltaB;
        
       [Evecs, Evals] = eig(B_g); 
       [~,t] = max(max(Evals));
       
       subGraph = getEigSigns(Evecs(:,t),node_list);
       deltaQ = (1/(4*m))*subGraph(:,1)'*B_g*subGraph(:,1);
       disp(deltaQ);
       
       if (deltaQ > 0)
           next = [next struct('list',subGraph)];
           Q = Q + deltaQ;
       end
    end 
    
end
Q
%%

G = graph(A);
p = plot(G);

xs = p.XData;
ys = p.YData;

figure(1)
hold on

P = lista(2).list;
plot(xs(P(:,2)),ys(P(:,2)),'sg','MarkerSize',7,'MarkerFaceColor','g');

P = lista(3).list;
plot(xs(P(:,2)),ys(P(:,2)),'sr','MarkerSize',7,'MarkerFaceColor','r');

P = lista(4).list;
plot(xs(P(:,2)),ys(P(:,2)),'sb','MarkerSize',7,'MarkerFaceColor','b');

















