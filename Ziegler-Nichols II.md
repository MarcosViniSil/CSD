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
