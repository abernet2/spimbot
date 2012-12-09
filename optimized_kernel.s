# ---------------------------------------------------------
# THE KERNEL
# USED REGISTERS
# $t0 = exec tempory
# $t1 = cause register
# $t2
# $k1 == $at DO NOT USE
# $ra for functions
# TO BE REMOVED
# a0 for debug
# v0 for debug
# ---------------------------------------------------------

.ktext 0x80000180
interrupt_handler:
.set noat
      	move	$k1, $at               		# Save $at                               
.set at
      	la     	$k0, chunkIH                	# $k0 is the kernel pointer
	sw 	$t0, 0($k0)			# saving register $t0
	sw 	$t1, 4($k0)			# saving register $t1
	sw 	$t2, 8($k0)			# saving register $t2
	sw 	$ra, 12($k0)			# saving register $ra
	sw 	$a0, 16($k0)			# saving register $a0
	sw 	$v0, 20($k0)			# saving register $v0


      	mfc0    $t1, $13                 	# Get Cause register                       
      	srl     $t0, $t1, 2                
      	and     $t0, $t0, 0xf            	# ExcCode field                            
      	bne     $t0, $zero, non_intrpt         

interrupt_dispatch:                    		# Interrupt:                             
      	mfc0    $t1, $13                 	# Get Cause register, again                 
      	beq     $t1, $zero, done         	# handled all outstanding interrupts    

      				       		# add dispatch for other interrupt types here.
  
      	and     $t0, $t1, 0x1000         	# is there a bonk interrupt?                
      	bne     $t0, 0, bonk_interrupt   

      	and     $t0, $t1, 0x2000	       	# is there a scanner interrupt?
      	bne     $t0, 0, scanner_interrupt

     	and     $t0, $t1, 0x8000         	# is there a timer interrupt?
      	bne     $t0, 0, timer_interrupt


      	li      $v0, 4                   	# Unhandled interrupt types $t1 = v0
      	la      $a0, unhandled_str
     	syscall 

      	j       done

bonk_interrupt:
      	sw      $t0, 0xffff0060($zero)   	# acknowledge interrupt

      	li      $v0, 4
      	la      $a0, bonk_intrpt_str
      	syscall			       		# print interrupt handler     

      	jal     bounce	       			# Bounce

	la	$t1, state			# make state equal 30
	li	$t0, 30
	sw	$t0, 0($t1)

      	j       interrupt_dispatch       	# see if other interrupts are waiting

timer_interrupt:
      	sw      $t0, 0xffff006c($zero)  	# acknowledge interrupt

      	li      $v0, 4
      	la      $a0, timer_intrpt_str
      	syscall			       		# print interrupt handler

                                       		# REQUEST TIMER INTERRUPT
     	# lw     	$v0, 0xffff001c($0)     # read current time
     	# add    	$v0, $v0, 1000000	# add 100 to current time
     	# sw     	$v0, 0xffff001c($0)   	# request timer interrupt in 100000 cycles

	# la	$v0, state
	# li	$t0, 32
	# sw	$t0, state

	j      	interrupt_dispatch		# see if other interrupts are waiting

scanner_interrupt:
      	sw      $a1, 0xffff0064($zero)   	# acknowledge interrupt
      
      	li      $v0, 4
      	la      $a0, scanner_intrpt_str
      	syscall			       		# print interrupt handler 

	la	$t0, state			# make state == 32
	li	$t1, 32
	sw	$t1, 0($t0)

      	j	interrupt_dispatch
non_intrpt:                            		# was some non-interrupt

      	li      $v0, 4
      	la      $a0, non_intrpt_str
      	syscall                         	# print out an error message
      	
	# fall through to done
done:
      	la     	$k0, chunkIH                	# $k0 is the kernel pointer
	lw 	$t0, 0($k0)	# loading register $t0
	lw 	$t1, 4($k0)	# loading register $t1
	lw 	$t2, 8($k0)	# loading register $t2
	lw 	$ra, 12($k0)	# loading register $ra
	lw 	$a0, 16($k0)	# loading register $a0
	lw 	$v0, 20($k0)	# loading register $v0

     	mfc0    $k0, $14                 # Exception Program Counter (PC)
.set noat
      	move    $at, $k1                 # Restore $at
.set at 
      	rfe   
      	jr      $k0
      	nop

print_output:
	sw	$ra, 24($k0)

	la 	$t0, output
	lw 	$t3, 0($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 4($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 8($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 12($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 16($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 20($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 24($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 28($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 32($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 36($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 40($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 44($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 48($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 52($t0)
	jal 	print_register_t3
	la 	$t0, output
	lw 	$t3, 56($t0)
	jal 	print_register_t3
	
	lw	$ra, 24($k0)
	jr	$ra

bounce:	
	lw	$t0, 0xffff0014($zero)
	addi	$t0, $t0, 90
	sw     	$t0, 0xffff0014($zero)  #set angle to new_angle
	
	li     	$t0, 0 
	sw     	$t0, 0xffff0018($zero)	#set orientation control = 1 (absolute)

	li     	$t0, 10	
	sw     	$t0, 0xffff0010($zero)	#set velocity to 10
	
	jr      $ra


