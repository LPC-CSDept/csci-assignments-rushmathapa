# #
# Finalproject.asm
#
# Rushma Basnet Thapa
# 05-16-2021
# Finalproject

.kdata     #   kernel data     
s1:     .word 10     
s2:     .word 11    
new_line: .asciiz     "\n"     
		.text  
		.globl main 
        main:   mfc0 	$a0, $12    # it will read from status register
                ori     $a0,   0xff11   #it will enable all the interrupts
                mtc0    $a0, $12        #write back to the register
                lui     $t0, 0xFFFF     # $t0=0xffff
                ori     $a0, $0, 2      # enable keyboard interrupts
                sw     	$a0, 0($t0)     #it will write back to0xffff0000

                here:   j here
                li 	$v0, 10             #exit 
                syscall
                