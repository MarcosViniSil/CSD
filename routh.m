function [estavel, polos_lado_direito,polos_lado_esquerdo, matriz_resultado] = routh(coeficientes)

    linhas = length(coeficientes);
    colunas = ceil(length(coeficientes) / 2);

    matriz = zeros(linhas, colunas);
    k = 1;


    for j = 1:colunas
        for i = 1:2
            if k > length(coeficientes)
                matriz(i, j) = 0;
            else
                matriz(i, j) = coeficientes(k);
                k = k + 1;
            end
        end
    end

    LINHA_A = 1;
    LINHA_D = 2;
    posicao_matriz = 3;


    for i = 3:linhas
        for j = 1:colunas - 1
            N = ((matriz(LINHA_D, 1) * matriz(LINHA_A, j + 1)) - ...
                (matriz(LINHA_A, 1) * matriz(LINHA_D, j + 1))) / (matriz(LINHA_D, 1));

            if N == 0
                matriz(posicao_matriz, j) = 1e-6;
            else
                matriz(posicao_matriz, j) = N;
            end
        end

        if posicao_matriz + 1 <= linhas
            posicao_matriz = posicao_matriz + 1;
        end

        if LINHA_D + 1 <= linhas
            LINHA_D = LINHA_D + 1;
        else
            break;
        end

        if LINHA_A + 1 <= linhas
            LINHA_A = LINHA_A + 1;
        else
            break;
        end
    end

    SISTEMAESTAVEL = 1;
    POLOS_LADO_DIREITO = 0;

    for i = 1:linhas - 1
        if matriz(i, 1) < 0
            SISTEMAESTAVEL = 0;
        end
        if (matriz(i, 1) < 0 && matriz(i + 1, 1) > 0) || ...
           (matriz(i, 1) > 0 && matriz(i + 1, 1) < 0)
            POLOS_LADO_DIREITO = POLOS_LADO_DIREITO + 1;
        end
    end

    estavel = SISTEMAESTAVEL;
    polos_lado_direito = POLOS_LADO_DIREITO;
    POLOS_LADO_ESQUERDO = (length(coeficientes) - 1) - POLOS_LADO_DIREITO ;
    polos_lado_esquerdo = POLOS_LADO_ESQUERDO;
    matriz_resultado = matriz;
end
