.data
X: .word 7
Y: .word 2

.text
begin: 
 # carregar palavras
 # conferir sinais, se < 0, adicionar 1 a uma variavel
 # comparar a variavel, se for igual a 1-> enviar para o loop muda sinal
 # FAZER A MESMA COISA PARA OS DOIS VALORES X e Y
 # chamar o loop para subtra��o (Divis�o)
loop_sinal:
 # muda sinal fazendo um sub
 # se =! 0, resultado; se n�o, loop_sinal
loop_sub:
 # fazer sub
 # verificar se < 0, adicionando 1 para tx < 0
 # comparar, se for igual a 1 enviar para adc novamente
 # fazer adi��o para o resto, contador++ 
adc_novamente:
 # somar o resultado novmaente para >= 0
 # ir para resultado
resultado:
 # comparar sinais, se forem iguais (ex.: 0,0 ou 1,1) -> resultado; se n�o (ex.: 1,0 ou 0,1)-> mudar sinal, loop muda sinal
 # print resultado