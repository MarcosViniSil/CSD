A = [1, 2, 3, 4; 5, 6, 7 ,8; 9, 10, 11, 12; 14, 83, 23 ,0];

%c = A(2,3) % válido
%c = A[1 2 3] % inválido
%c = A([ 1 2 3],4) % válido
%c = A([ 1 2 3],4) % válido
%c = A([1:4],2) % válido
%c = A(2,:) % válido
%c = A(:,:) % válido
%c = A(2:4,[1 3 4])% válido

disp(c)
