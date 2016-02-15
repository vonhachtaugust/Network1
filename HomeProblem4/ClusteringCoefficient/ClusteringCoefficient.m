function f = ClusteringCoefficient(A)
f = sum(diag(A^3))/(sum(diag(A^2).*(diag(A^2)-1)));
