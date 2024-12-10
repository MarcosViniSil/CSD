coeficientes = [1,6,11,6];
[estavel, polos_lado_direito,matriz_resultado] = routh(coeficientes);
display("Sistema estável? ");
disp(estavel);
display("Polos semiplano direito: ");
disp(polos_lado_direito);
display("Matriz resultante: ");
disp(matriz_resultado)
