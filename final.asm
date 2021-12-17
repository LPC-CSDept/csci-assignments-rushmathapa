# 
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

                .ktext  0x80000180 
            
                sw     	$v0, s1 
                sw      $a0, s2
            mfc0 	$k0, $13    #cause register
            srl     $a0, $k0, 2     #extract excode field
            andi    $a0, $a0, 0x1f 
            bne     $a0, $zero, kdone   #exception code is I/O
            lui     $v0, 0xffff  
            lw      $a0, 4($v0)     #getting input key
            li      $t8, 'q'  
            beq     $a0, $t8, done
            li 	$v0,1     		#   print it here.      
		   syscall 
            li $v0,4     			#   print the new line     
		    la $a0,   new_line
		    syscall 
            kdone:  lw     	$v0, s1     
                    lw     	$a0, s2 
                    mtc0 	$0, 13 #clear the register
                    mfc0 	$k0, $12  #set register status
                    andi    $k0, 0xfffd
                    ori     $k0,  0x11
                    mtc0 	$k0, $12     	#   write back to status     
		            eret    			 	# return
                    
done: li $v0 10
syscall


                    