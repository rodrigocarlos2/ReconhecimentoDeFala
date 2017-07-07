
clear; clc;close all;

% Dados de entrada e o desejado, criando o gráfico inicial.

diretorio = 'xyz.wav';

[E, fs] = audioread(diretorio);

frequencias = abs(fft(E));

namostra = 100;

qtd = numel(frequencias) - namostra;

n = floor(qtd/namostra) + 1;

X = zeros(n,1);

for i=1:namostra:qtd
    
    X = [X; mean(frequencias(i:(i+namostra)))];
    
end

% Entrada
Entrada = X;

% Saída
Desejado = 1;

disp (Entrada)
disp (Desejado)

%Quantidades de neur?nios na camada de Entrada In
In = 3889;

%Quantidade de neur?nios na camada Escondida H
H =4;

%Quantidade de neur?nios na camada de Saida Out
Out = 1;

%Definindo a taxa de aprendizagem - Valor Eta.
eta = 0.000095;

%Quantidade de Épocas
Epocas = 12900;

%Se a fun??o de ativa??o ? linear, ent?o Defini-se o valor da constante k.
k = 1; 

% Matriz que imprime o gr?fico do erro quadr?tico m?dio
grafico_erro = [];

% Algoritmo

% Iniciando os Pesos - Primeiro Teste - logo apps a primeira inicializa??o,
% comentar c?digo.
    
  %  Whi = rand(H,In) - 0.5;
  %  Woh = rand(Out,H) - 0.5;
   % load pesos1 Woh Whi
%load pesos27 Woh Whi

load pesos1 Woh Whi

for In=0:Epocas
    
    %Calculo da entrada da camada escondida.
    net_h = Whi*Entrada;
     
    %Calculo da sa?da da camada escondida - aplicar fun??oo de ativa??o.
    Output_h = logsig(net_h);
             
    %Calculo da entrada da camada de sa?da. 
    net_o = Woh*Output_h;
  
    %Calcular a sa?da da camada de sa?da (Sa?da da RNA).
    
    %calculo do valor da sa?da:
    Output = k*net_o;
         
    %Calcular o erro da sa?da.
    Erro = Desejado - Output;

            %Backpropagation para recalcular os pesos, calculando a varia??o 
            %dos pesos entre Woh.
           
            %C?lculo da derivada.
            df = k*ones(size(net_o));
                             
            %C?lculo do delta Woh, valor da varia??o.
            delta_Woh = eta*(Erro.*df)*Output_h';

            %C?lculo do erro retropopagado.
            Erro_r = Woh'*(Erro.*df);
        
            %C?lculo da varia??o dos pesos Whi.
            %C?lculo da Derivada.
            df = logsig(net_h)-(logsig(net_h).^2);
            
            %C?lculo do delta Whi.
            delta_Whi = eta*(Erro_r.*df)*Entrada';
    
            %C?lculo dos novos pesos.
            Whi = Whi+delta_Whi;
            Woh = Woh+delta_Woh;
        
            %C?lculo do Erro Quadr?tico M?dio.
            emq = sqrt(sum(Erro.^2))/size(Erro,2);
            grafico_erro = [grafico_erro emq];
        
end

%Imprime o gr?fico referente ao Erro Quadr?tico M?dio.
figure(1);
plot(grafico_erro, 'r');
hold on;
grid on;
disp(In);
xlabel('Épocas');
ylabel('Erro (EQM)');
legend('Erro Quadrático Médio');

%Grava os pesos atuais para posteriores opera??es.
save pesos32 Woh Whi

%Grava pesos para serem utilizados no teste de generaliza??o
save pesoteste Woh Whi