.data
x0: .word 1
x1: .word 1
x2: .word 0
x3: .word 1
    
y0: .word 0
y1: .word 0
y2: .word 1
y3: .word 1
    
subtracao: .word 1 
    
.text
.globl begin

begin:

    lw $t0, subtracao # carrega o valor do sinal para somar ou subtrair
    
    add $s6, $zero, $zero # cria um auxiliar (vai um)
    add $t7, $zero, 2 # auxiliar para o cálculo do vai um
    
    beqz $t0, add
    j sub

add:
    # OPERAÇÃO X0 E Y0 - Menos SIGNIFICATIVO
     
    lw $a0, x0 
    lw $a1, y0 
    move $a2, $s6 
    
    jal op_add
    
    move $s0, $v0 
    move $s6, $v1    
    
    # OPERAÇÃO X1 E Y1
    
    lw $a0, x1 
    lw $a1, y1 
    move $a2, $s6 
    
    jal op_add
    
    move $s1, $v0 
    move $s6, $v1 
    
    # OPERAÇÃO X2 E Y2
    
    lw $a0, x2 
    lw $a1, y2 
    move $a2, $s6 
    
    jal op_add
    
    move $s2, $v0 
    move $s6, $v1   
      
    # OPERAÇÃO X3 E Y3 - Mais SIGNIFICATIVO
    
    lw $a0, x3 
    lw $a1, y3 
    move $a2, $s6 
    
    jal op_add
    
    move $s3, $v0 
    move $s6, $v1   
    
    j resultado

op_add: #função responsável realizar a adição binária e calcular o vai um

    add $t1, $a0, $a1 # soma -> x + y 
    add $a0, $t1, $a2 # soma -> x + y + vai um
    beq $a0, 0, nao_muda
    beq $a0, 1, nao_muda
    beq $a0, 2, igual_2
    beq $a0, 3, igual_3
    
nao_muda: # se o valor da soma for 0 ou 1:
   
    move $v0, $a0
    li $v1, 0
    jr $ra

igual_2: # se o valor da soma for 2:
    
    li $v0, 0 #o bit então receberá 0
    li $v1, 1 #e o vai 1 receberá 1
    jr $ra  

igual_3: # se o valor da soma for 3 (x + y + vai um):
    
    li $v0, 1
    li $v1, 1
    jr $ra   
   
sub:

     # OPERAÇÃO X0 E Y0 - Menos SIGNIFICATIVO
     
    lw $a0, x0 
    lw $a1, y0 
    move $a2, $s6 
    
    jal op_sub
    
    move $s0, $v0 
    move $s6, $v1    
    
    # OPERAÇÃO X1 E Y1
    
    lw $a0, x1 
    lw $a1, y1 
    move $a2, $s6 
    
    jal op_sub
    
    move $s1, $v0 
    move $s6, $v1 
    
    # OPERAÇÃO X2 E Y2
    
    lw $a0, x2 
    lw $a1, y2 
    move $a2, $s6 
    
    jal op_sub
    
    move $s2, $v0 
    move $s6, $v1   
      
    # OPERAÇÃO X3 E Y3 - Mais SIGNIFICATIVO
    
    lw $a0, x3 
    lw $a1, y3 
    move $a2, $s6 
    
    jal op_sub
    
    move $s3, $v0 
    move $s6, $v1   
    
    j resultado

op_sub:

    sub $t1, $a0, $a1 # soma -> x + y 
    sub $a0, $t1, $a2 # soma -> x + y + vai um
    beq $a0, -1, nao_muda_sub
    beq $a0, 0, igual_0
    beq $a0, 1, igual_1
    

nao_muda_sub: # se o valor da subtração for -1
   
    move $v0, $a1
    li $v1, 1
    jr $ra

igual_0: # se o valor da soma for 0:
    
    li $v0, 0 #o bit então receberá 0
    li $v1, 0 #e o vai 1 receberá 1
    jr $ra  

igual_1: # se o valor da soma for 3 (x + y + vai um):
    
    li $v0, 1
    li $v1, 0
    jr $ra   

resultado:
    # impressão do resutado 
    move $a0, $s3
    li $v0, 1
    syscall
    
    move $a0, $s2
    li $v0, 1
    syscall
    
    move $a0, $s1
    li $v0, 1
    syscall
    
    move $a0, $s0
    li $v0, 1
    syscall

    
