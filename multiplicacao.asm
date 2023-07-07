#    Trabalho Prático - Arquitetura de Computadores I
# 		Algoritmo de Multiplicação
# 			X * Y

# Nomes: Marcos Carvalho Ferreira
# 	 Diogo Nunes Carvalho
# 	 Rian Pinas de Freitas
# 	 Gabriel Alves Ribeiro Pavanetti

.data
    msg: .asciiz "Resultado:"

.text
begin: 
	# leitura de X
	li $v0, 5
	syscall
	move $s0, $v0 
  	
  	# leitura de Y
  	li $v0, 5
  	syscall
  	move $s1, $v0 
  	
  	# t4 -> 1
  	addi $t4, $zero, 1
  
	# conferir sinais, se < 0, atribuir 1 a uma variavel
 	slt $s2, $s0, $zero 
 	slt $s3, $s1, $zero
  	
  	# soma dos sinais se a soma resultar em 1 -> resultado deve ser negativo
 	add $s4, $s2, $s3
  	
	# comparar a variavel, se for igual a 1-> enviar para troca de sinal
 	beq $s2, $t4, troca_sinal_X
 	volta_x:
 	
 	# comparar a variavel, se for igual a 1-> enviar para troca de sinal
 	beq $s3, $t4, troca_sinal_Y
 	volta_y:
 	
 	# inicializando variavel para as contas
 	add $t2, $zero, $zero
 	j loop_add
 
	troca_sinal_X:
 	nor $s5, $s0, $zero
 	addi $s0, $s5, 1
 	j volta_x
 	
	troca_sinal_Y:
 	nor $s6, $s1, $zero
 	addi $s1, $s6, 1
 	j volta_y
	
 	# soma -> t7
 	# contador -> t2
 	
 	# loop de adiçaõ (Multiplicação)
	loop_add:
 		beq $t2, $s1, resultado
 		add $t7, $t7, $s0
 		addi $t2, $t2, 1
 		j loop_add
 
	resultado:
 		# comparar sinais, se forem iguais (ex.: 0,0 ou 1,1) -> resultado; se não (ex.: 1,0 ou 0,1)-> mudar sinal, loop muda sinal
		beq $s4, $t4, resultado_negativo
 		add $s3, $t7, $zero
 		j end
 
	resultado_negativo:
 		nor $s3, $t7, $zero
 		addi $s3, $s3, 1

	end:
 		# print resultado
 		li $v0, 4
 		la $a0, msg
 		syscall
 		move $a0, $s3
 		li $v0, 1
 		syscall
