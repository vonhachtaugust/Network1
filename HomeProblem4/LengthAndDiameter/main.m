clear all;clc;
list = [];
A = data();
n = size(A,1);

%%
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
Max = max(max(lengthMatrix));
disp('Max =')
disp(Max)

%%
%for i = 1:n
%    for j = 1:n
%        if (j > i)
%            list = [list;[i j]];
%        end
%    end
%end

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
disp('Max =')
disp(Max)


