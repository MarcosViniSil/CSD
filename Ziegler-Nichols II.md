# CSD-Método de Ziegler-Nichols II 
## 1.1 - Função de transferência de malha fechada
<div align="center">
  
   $`G(s)=\frac{1}{s^3+6s^2+5s+2}`$
   
</div>

## 1.2 - Resposta ao degrau unitário de malha fechada
### 1.2.1 - Código
```matlab
pkg load control

numerador = [1];
denominador = [1 6 5 2]
funcao = tf(numerador,denominador)
step(funcao)
```
### 1.2.2 - Gráfico
<div align="center">
  
  ![image](https://github.com/user-attachments/assets/b6f7fcfc-0dbf-4139-af4b-68284efdba02)

</div>

## 2.a - Variar o ganho K até o sistema se tornar marginalmente estável
### 2.a.1 - Código
```matlab
pkg load control
pkg load signal

numerador = [1];
denominador = [1 6 5 1];
G = tf(numerador, denominador); % Função de malha aberta

K_cr = 0;
step_size = 0.1; % Passo a cada iteração
max_K = 100;
found = false; 

while K_cr < max_K
    K_cr = K_cr + step_size; % Atualiza o K_cr a cada iteração até o sistema estabilizar
    T = feedback(K_cr * G, 1); % Fecha a malha considerando o valor de K_cr
    [y, t] = step(T); % Calcula o degrau da função de malha fechada consierando K_cr
    [pks, locs] = findpeaks(y); % findpeaks encontra os picos do sistema
    if length(pks) >= 3 % se o sistema tiver mais do que 3 picos(vem do método) sinal que estabilizou
        found = true;
        break;
    end
end

if found
    disp(['Ganho crítico K_cr: ', num2str(K_cr)]);
else
    disp('Não foi possível encontrar um K_cr que gerasse oscilação sustentada.');
end
```
### 2.a.1 - Resposta
```
Ganho crítico K_cr: 3.2
```

