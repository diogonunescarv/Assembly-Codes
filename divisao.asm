#   Trabalho Prático - Arquitetura de Computadores I
# 		Algoritmo de Divisão
# 			X/Y

# Nomes: Marcos Carvalho Ferreira
# 	 Diogo Nunes Carvalho
# 	 Rian Pinas de Freitas
# 	 Gabriel Alves Ribeiro Pavanetti

.data
    msg1: .asciiz "Quociente:"
    msg2: .asciiz "    Resto:"

.text

comeco: 
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
 	add $t0, $s0, $zero
 	add $t2, $zero, $zero
 	j loop_sub
 	
	troca_sinal_X:
 		nor $s5, $s0, $zero
 		addi $s0, $s5, 1
 		j volta_x
 	
	troca_sinal_Y:
 		nor $s6, $s1, $zero
 		addi $s1, $s6, 1
 		j volta_y
 	
 	# auxiliar -> t0
 	# resto -> t1
 	# quociente -> t2
 	# t4 -> 1
 	
 	# loop de subtração (Divisão)
 	loop_sub:
 		add $t1, $t0, $zero
 		sub $t0, $t0, $s1
 		slt $t3, $t0, $zero
 		beq $t3, $t4, resultado
 		addi $t2, $t2, 1
 		j loop_sub
 	
 	resultado:
 		# comparar sinais, se forem iguais (ex.: 0,0 ou 1,1) -> resultado; se não (ex.: 1,0 ou 0,1)-> resultado negativo
 		beq $s4, $t4, resultado_negativo
 	
 		# quociente -> s5
 		add $s5, $t2, $zero
 		# resto -> s6
		add $s6, $t1, $zero
 		j end
 
	resultado_negativo:
 		# quociente -> s5
 		nor $s5, $t2, $zero
 		addi $s5, $s5, 1
 		# resto -> s6
 		nor $s6, $t1, $zero
 		addi $s6, $s6, 1

	end:
 		# print do resultado
 		li $v0, 4
 		la $a0, msg1
 		syscall
 		move $a0, $s5
 		li $v0, 1
 		syscall
 
 		li $v0, 4
 		la $a0, msg2
 		syscall
 		move $a0, $s6
 		li $v0, 1
 		syscall
  
