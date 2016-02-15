function A_g = removeDegree(A,f)
n = size(A,1);
degree_list = [diag(A^2)' ; 1:n]';
[r,c] = sort(degree_list,'descend');
for i = 1:n*f
        A(c(i),:) = 0;
        A(:,c(i)) = 0;
end
A_g = A;