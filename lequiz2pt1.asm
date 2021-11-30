#
# quiz2.asm
#
# Rushma Basnet Thapa
# 11-27-2021
# Make an assembly program for converting single-precision temperatures from Fahrenheit to Celsius 
# 
	.data
prmpt:	.asciiz "Enter a Farenheit Degree\n"
val1:	.float 32.0
val2:	.float 5.0
val3:	.float 9.0


	.text
	.globl main

main:	li	$v0, 4
	la	$a0, prmpt
	syscall

	li	$v0, 6	#Get the integer
	syscall
	
	l.s	$f1, val1	#get the floating value 
	l.s	$f2, val2
	l.s	$f3, val3
	
	sub.s	$f1, $f0, $f1	# (Fahrenheit-32.0)
	mul.s	$f1, $f1, $f2	# (Fahrenheit-32.0) ×5.0
	div.s	$f1, $f1, $f3	#  (Fahrenheit-32.0) ×5.0 / 9.0
	
	mov.s	$f12, $f1	#
	li	$v0, 2
	syscall

	li	$v0, 10
	syscall
#End the program