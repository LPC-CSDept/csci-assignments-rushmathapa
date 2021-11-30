#
# quiz2.asm
#
# Rushma Basnet Thapa
# 11-27-2021
# calculate ax2+bx+c

	.data
pr_x:	.asciiz "\nEnter the x value"
pr_a:	.asciiz "\nEnter the a value"
pr_b:	.asciiz "\nEnter the b value"
pr_c:	.asciiz "\nEnter the c value"
result:	.asciiz "\n Result is:"
	
	.text
	.globl main

main:	li	$v0, 4
	la	$a0, pr_x	# print the prompt
	syscall
	li	$v0, 5
	syscall			#ask user input 
	move	$t0, $v0	# save the user input at $t0
	li	$v0, 1
	move 	$a0, $t0
	syscall
	

	li	$v0, 4
	la	$a0, pr_a	#print the prompt
	syscall
	li	$v0, 5
	syscall			#ask user input 
	move	$t1, $v0	# save the user input at $t1
	li	$v0, 1
	move 	$a0, $t1
	syscall
	
	

	li	$v0, 4
	la	$a0, pr_b	#print the prompt
	syscall
	li	$v0, 5
	syscall			#ask user input 
	move	$t2, $v0	# save the user input at $t2
	li	$v0, 1
	move 	$a0, $t2
	syscall

	
	
	
	li	$v0, 4
	la	$a0, pr_c	#print the prompt
	syscall
	li	$v0, 5
	syscall			#ask user input 
	move	$t3, $v0	# save the user input at $t3
	li	$v0, 1
	move 	$a0, $t3
	syscall
	
	
	mul	$t4, $t0, $t0	# mult X*X=x^2
	nop
	mul	$t1, $t1, $t4	#ax^2
	nop
	mul	$t5, $t2, $t0	# BX

	add	$t0, $t1, $t5	#ax^2+bx
	add	$t1, $t0, $t3	#ax^2+bx+c

	li	$v0, 4
	la	$a0, result # print the prompt result
	syscall

	li	$v0, 1
	move 	$a0, $t1
	syscall
#end