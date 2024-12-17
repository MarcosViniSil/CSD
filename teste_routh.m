coeficientes = [1,6,11,6,200] % SISTEMA INSTAVEL
%coeficientes = [1,6,11,6] % SISTEMA ESTAVEL
[estavel, polos_lado_direito,polos_lado_esquerdo,matriz_resultado] = routh(coeficientes);
display("Sistema estável? (1) -> true, (0) -> false");

disp(estavel);

display("Polos semiplano direito: ");
disp(polos_lado_direito);

display("Polos semiplano esquerdo: ");
disp(polos_lado_esquerdo);

display("Matriz resultante: ");
disp(matriz_resultado)
