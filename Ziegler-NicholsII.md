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
### 2.a.2 - Resposta
```
Ganho crítico K_cr: 3.2
```

## 2.b - Determine o período crítico a partir desta resposta ao degrau oscilatória
### 2.b.1 - Código
```matlab
[pks, locs] = findpeaks(y); % findpeaks retorna a quantidade de picos do sistema e seu respectivo tempo (pks e locs)
Tc = mean(diff(t(locs))); % t(locs) retorna o tempo de cada pico. diff(t(locs)) calcula as diferenças
% entre tempos consecutivos dos picos (períodos das oscilações)
% mean(diff(t(locs))) tira a média dessas diferenças de tempo para obter uma estimativa do período crítico.

disp(["Período Crítico TC: ",num2str(Tc)])
```
### 2.b.2 - Resposta
```
Período Crítico TC: 7.8248
```
## 2.c	Calcule os ganhos do PI usando a tabela de Ziegler Nichols

### 2.c.1	Tabela

<div align="center">
  
| Tipo de Controlador | Kp    | Ti    | Td  |
| :---:               | :---: | :---: |:---:|
| PI                  | 1.44  | 6.52  | 0   |

   
   
</div>

## 2.d Escreva a FT do controlador

### 2.d.1 Definição

<div align="center">
  
   $`Gc(s)=K_p + \frac{K_p}{T_is}`$
   
</div>

### 2.d.1 Função calculada

<div align="center">
  
   $`Gc(s)=1.44 + \frac{1.44}{6.52s}`$
   
</div>

## 3 Controlador PID
### 3.1 - Tabela PID
<div align="center">
  
| Tipo de Controlador | Kp    | Ti      | Td       |
| :---:               | :---: | :---:   |:---:     |
| PID                 | 1.92  | 3.9124  | 0.9781   |

</div>

### 3.2 - Definição Função de transferência PID
<div align="center">
  
   $`Gc(s)=k_p + \frac{K_p}{t_is} + k_pT_ds`$
   
</div>

### 3.3 - Função de transferência PID
<div align="center">
  
   $`Gc(s)=1.92 + \frac{0.49}{s} + 1.878s`$
   
</div>

## 4 Simulação
### 4.1 Código
```matlab
pkg load control
pkg load signal

% Definição do sistema original (sem controle)
num_G = [1];
den_G = [1 6 5 1];
G = tf(num_G, den_G);
T_original = feedback(G, 1);
% Definição do sistema original (sem controle)

% Controlador PI
num_PI = [1.44 0.221];
den_PI = [1 0];
C_PI = tf(num_PI, den_PI);
T_PI = feedback(C_PI * G, 1);
% Controlador PI

% Controlador PID
num_PID = [1.878 1.92 0.49];
den_PID = [1 0];
C_PID = tf(num_PID, den_PID);
T_PID = feedback(C_PID * G, 1);
% Controlador PID

t = 0:0.1:50;

y1 = step(T_original, t);
y2 = step(T_PI, t);
y3 = step(T_PID, t);

figure;
hold on;
plot(t, y1, 'r', 'LineWidth', 1);
plot(t, y2, 'g', 'LineWidth', 1);
plot(t, y3, 'b', 'LineWidth', 1);

title("Comparação da Resposta ao Degrau: Sem Controle, PI e PID");
xlabel("Tempo (s)");
ylabel("Amplitude");
legend("Sem Controle", "Com PI", "Com PID"); 
grid on;
hold off;

```
### 4.1 Resultado
<div align="center">
  
![result](https://github.com/user-attachments/assets/93e95828-37ed-4297-81c3-0ba0fc744f78)


</div>


