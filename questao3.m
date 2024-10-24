%load('variaveis.mat')
A = [1, 2, 3, 4; 5, 6, 7 ,8; 9, 10, 11, 12; 14, 83, 23 ,0]
B = [7.4,pi,0;-4.01,2,3;0.1,10,0]
%a
c = A(3,2)
%b
d = A(2,2)
%c
e = []
for i = 1:3
    e(i) = A(1,i)
end
%d
f = []
for i = 1:3
    f(i) = B(i,3)
end

%e
A = zeros(4, 4);
for i = 1:3
    A(1,i)= B(2,i)
end
%f
for i = 1:4
    A(4,i)= A(2,i)
end
%g
A = [1, 2, 3, 4; 5, 6, 7 ,8; 9, 10, 11, 12; 14, 83, 23 ,0]
c = zeros(2, 2)
d = []
for i = 1:2
  for j = 1 :2
    c(i,j) = A(i, j+1)
  end
end

for i = 1: 3
   d(i) = B(1,i)
end

disp(d)


