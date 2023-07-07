.data
X: .word 7
Y: .word 2

.text
begin: 
 # carregar palavras
 # conferir sinais, se < 0, adicionar 1 a uma variavel
 # comparar a variavel, se for igual a 1-> enviar para o loop muda sinal
 # FAZER A MESMA COISA PARA OS DOIS VALORES X e Y
 # chamar o loop para adição (Multiplicação)
loop_sinal:
 # muda sinal fazendo um sub
 # se =! 0, resultado; se não, loop_sinal
loop_add:
 
resultado:
 # comparar sinais, se forem iguais (ex.: 0,0 ou 1,1) -> resultado; se não (ex.: 1,0 ou 0,1)-> mudar sinal, loop muda sinal
 # print resultado