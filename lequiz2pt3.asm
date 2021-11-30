#
# quiz2.asm
#
# Rushma Basnet Thapa
# 11-27-2021
# Make an assembly program to calculate Newton’s method

	.data
n:	.float 1.0 
prmpt:	.asciiz "\nEnter the n value"
x:	.float 1.0
val1:	.float 1.0
val2:	.float 2.0
limit:	.float 1.0e-5
result:	.asciiz "\nsquare root of n "

	.text
	.globl main

main:	li	$v0, 4
	la	$a0, prmpt		#print the prompt
	syscall
	li	$v0, 5
	syscall
	move	$t0, $v0	# save the user input at $f0
	li	$v0, 1
	move 	$a0, $t0
	syscall
	
	mtc1    $t0, $f0    	#move integer 
	cvt.s.w	$f1, $f0
	s.s	$f1, n
	nop

	
	l.s	$f0, n	# get the value n 
	l.s	$f1, x
	l.s	$f2, val1
	l.s	$f3, val2
	l.s	$f10, limit	#accuracy limit
loop:
	mov.s	$f4, $f0	#x'=n
	div.s	$f4, $f4, $f1	#x'=n/x
	add.s	$f6, $f1, $f4	#x'=x+n/x
	div.s	$f1, $f6, $f3	#(1/2)(x+n/x)
	
	mul.s	$f5, $f1, $f1	#x^2
	div.s	$f5, $f0, $f5	#n/x^2
	sub.s	$f5, $f5, $f2	#n/x^2-1
	abs.s	$f5, $f5	#|x^2-1|
	c.lt.s	$f5, $f10	#|x^2-1|<limit?
	bc1t	done
	nop
	j	loop
	nop

	
done:
	la	$a0, result	#square root on n
	li	$v0, 4
	syscall
	mov.s	$f12, $f1
	li	$v0, 2
	syscall
	
	li	$v0, 10
	syscall
	nop

#end

	

	

	



