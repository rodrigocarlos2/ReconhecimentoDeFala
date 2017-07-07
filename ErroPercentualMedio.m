
%Cálculo da porcentagem do erro dos resultados que a RNA provem.

Ep = abs(DesejadoTeste - Output)./DesejadoTeste*100;
max(Ep)
if Ep <= 2
    fprintf('Falou direito\n');
else
    fprintf('Nao falou direito\n');
end
