function [A,I,J] = initial(m,n)
A = zeros(n,n);
a = 1;
b = a + 1;
A(a,b) = 1;
for i = 2:m
    I = a + i - 1;
    J = b + i - 1;
    if (J > n )
        if (i - 1 > n - (b - a))
            I = I - (n - (b-a) + (i - 1 - (n - (b-a))));
            J = J - (n - (b-a) + (i - 1 - (n - (b-a))));
        else
            I = I - (n - (b-a));
            J = J - (n - (b-a));
        end
    end
    A(I, J) = 1;
end
A = triu(A);
A = A+A';