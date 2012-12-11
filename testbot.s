.data
index:	.word 0
state: 	.word 0

space:	.asciiz "\n"

x_coords:
.word   15	108	250	91	67	
.word   42	180	220	96	270	
.word   140	201	32	150	180

y_coords:
.word   42	180	96	220	270	
.word   108	250	91	67	15	
.word   32	150	201	140	180

	.text
main:
	sw	$0,  0xffff0010($0)	#stop the bot
	
	li	$v0, 1

	li	$a0, 50

	li	$t0, 30		
	div	$a0, $t0	# divide x / 30
	mflo	$a0		# $a0 = x
	div	$a1, $t0	# divide y / 30
	mflo	$a1		# $a1 = y
	li	$t0, 20	
	mult	$a0, $t0	# x * 20
	mflo	$a0
	li	$t0, 200
	mult	$a1, $t0	# y * 200
	mflo	$a1

	#syscall

	li	$v0, 4
	la	$a0, space
	#syscall
	li	$v0, 1

	li	$a0, 212
	li	$t0, 30
	div	$a0, $t0
	mflo	$a0
	li	$t0, 200
	mult	$a0, $t0
	mflo	$a0
	#syscall

	li	$v0, 4
	la	$a0, space
	#syscall
	li	$v0, 1

	li	$a0, 123
	li	$t0, 30
	div	$a0, $t0
	mflo	$a0
	li	$t0, 200
	mult	$a0, $t0
	mflo	$a0
	#syscall

	li	$v0, 4
	la	$a0, space
	#syscall
	li	$v0, 1

	li	$a0, 1
	li	$t0, 30
	div	$a0, $t0
	mflo	$a0
	li	$t0, 200
	mult	$a0, $t0
	mflo	$a0
	#syscall

	li	$v0, 4
	la	$a0, space
	#syscall
	li	$v0, 1

	li	$a0, 299
	li	$t0, 30
	div	$a0, $t0
	mflo	$a0
	li	$t0, 200
	mult	$a0, $t0
	mflo	$a0
	#syscall




	jal	initialize	# call your initialization function
				# this should set up interrupt handling;
				# all of the actual steering, etc. should
				# be done by the interrupt handler

infinite:
	j	infinite	# loop forever (note that interrupts
				# will still be handled)

# ALL your code goes below this line.
#
# We will delete EVERYTHING above the line; DO NOT delete the line.
#
# ---------------------------------------------------------------------

initialize:
     li     $t4, 0x8000                # timer interrupt enable bit
     or     $t4, $t4, 0x1000           # bonk interrupt bit
     or     $t4, $t4, 1                # global interrupt enable
     mtc0   $t4, $12                   # set interrupt mask (Status register)
     
                                       # REQUEST TIMER INTERRUPT
     lw     $v0, 0xffff001c($0)        # read current time
     add    $v0, $v0, 1           # add 100000 to current time
     sw     $v0, 0xffff001c($0)        # request timer interrupt in 100000 cycles

	jr	$ra

.kdata                # interrupt handler data (separated just for readability)
chunkIH:.space 40      # space for two registers
non_intrpt_str:   .asciiz "Non-interrupt exception\n"
unhandled_str:    .asciiz "Unhandled interrupt type\n"


.ktext 0x80000180
interrupt_handler:
.set noat
      move      $k1, $at               # Save $at                               
.set at
      la      $k0, chunkIH                
      #sw      $a0, 0($k0)              # Get some free registers                  
      #sw      $a1, 4($k0)              # by storing them to a global variable    
      #sw      $v0, 8($k0)	       # 8($k0) = $v0
      #sw      $t0, 12($k0)	       # 12($k0) = $t0
      #sw      $t1, 16($k0)	       # 16($k0) = $t1
      #sw      $t2, 20($k0)
      #sw      $t3, 24($k0)
      #sw      $t4, 28($k0)
      #sw      $t5, 32($k0)
      #sw      $t6, 36($k0)      

      mfc0    $k0, $13                 # Get Cause register                       
      srl     $a0, $k0, 2                
      and     $a0, $a0, 0xf            # ExcCode field                            
      bne     $a0, 0, non_intrpt         

interrupt_dispatch:                    # Interrupt:                             
      mfc0    $k0, $13                 # Get Cause register, again                 
      beq     $k0, $zero, done         # handled all outstanding interrupts     
  
      and     $a0, $k0, 0x1000         # is there a bonk interrupt?                
      bne     $a0, 0, bonk_interrupt   

      and     $a0, $k0, 0x8000         # is there a timer interrupt?
      bne     $a0, 0, timer_interrupt

                         # add dispatch for other interrupt types here.

      li      $v0, 4                   # Unhandled interrupt types

      la      $a0, unhandled_str
      syscall 
      j       done

bonk_interrupt:
      sw      $a1, 0xffff0060($zero)   # acknowledge interrupt

      j       interrupt_dispatch       # see if other interrupts are waiting

timer_interrupt:
      sw      $a1, 0xffff006c($zero)   # acknowledge interrupt
timer_while_loop:
      lw      $t0, state		# t0 = state
      beq     $t0, $zero, state_is_zero
else_state_is_one:
      lw      $t0, index		# t0 = index
      lw      $t1, 0xffff0024($zero)	# t1 = current Y
      la      $t3, y_coords		# t2 = @y_coords
      add     $t3, $t3, $t0		# t3 = @y_coords + index
      lw      $t3, 0($t3)		# t3 = y_coords[index]
      sub     $t3, $t3, $t1		# t3 = y_coords[index] - current Y
abs_into_t3:
      move    $t4, $t3                  # copy t3 into t4
      bge     $t4, $zero, end_abs
      sub     $t4, $zero, $t4           
end_abs:				# t3 = diff, t4 = abs(diff)
      blt     $t4, 2, abs_diff_less_2	# abs < 2
      bgt     $t3, 0, diff_greater_zero  # diff > 0
      addi    $t5, $zero, 270		# t0 = 90
      j       break_loop
diff_greater_zero:
      addi    $t5, $zero, 90		# t0 = 90
      j	      break_loop
abs_diff_less_2:
      sw      $zero, state		# state = 0
      addi    $t0, $t0, 4;
      sw      $t0, index		# index = index + 1
      j       timer_while_loop
state_is_zero:
      lw      $t0, index		# t0 = index
      lw      $t1, 0xffff0020($zero)	# t1 = current x
      la      $t3, x_coords		# t3 = @x_coords
      add     $t3, $t3, $t0		# t3 = @x_coords + index
      lw      $t3, 0($t3)		# t3 = x_coords[index]
      sub     $t3, $t3, $t1		# t3 = x_coords[index] - current X         
      move    $t4, $t3 			# copy t3 into t4
      bge     $t4, $zero, end_abs2
      sub     $t4, $zero, $t4           
end_abs2:				# t3 = diff, t4 = abs(diff)
      blt     $t4, 2, Xabs_less_2	# abs < 2
      bgt     $t3, 0, diff_greater_zero2     # diff > 0
      addi    $t5, $zero, 180		# t0 = 90
      j       break_loop
diff_greater_zero2:
      addi    $t5, $zero, 0		# t0 = 90
      j	      break_loop
Xabs_less_2:
      addi    $t1, $zero, 1;
      sw      $t1, state		# state = 1
      j       timer_while_loop
break_loop:
      addi    $t1, $zero, 1		# t1 = 1
      sw      $t5, 0xffff0014($zero)    # value
      sw      $t1, 0xffff0018($zero)    # set orientation = 1
      addi    $t1, $zero, 10
      sw      $t1, 0xffff0010($zero)    # set velocity = 10
      addi    $t1, $zero, 400
      mult    $t1, $t3			# low = 400 * abs(diff)
      lw      $t0, 0xffff001c($0)       # read current time
      mflo    $t1			# t1 = low
      add     $t0, $t0, $t1
      sw      $t0, 0xffff001c($0)      # request timer interrupt
      j       interrupt_dispatch       # see if other interrupts are waiting

non_intrpt:                            # was some non-interrupt
      li      $v0, 4
      la      $a0, non_intrpt_str
      syscall                          # print out an error message

      # fall through to done

done:
      la      $k0, chunkIH
      #lw      $a0, 0($k0)              # Restore saved registers
      #lw      $a1, 4($k0)
      #lw      $v0, 8($k0)
      #lw      $t0, 12($k0)
      #lw      $t1, 16($k0)
      #lw      $t2, 20($k0)
      #lw      $t3, 24($k0)
      #lw      $t4, 28($k0)
      #lw      $t5, 32($k0)
      #lw      $t6, 36($k0)
      mfc0    $k0, $14                 # Exception Program Counter (PC)
.set noat
      move    $at, $k1                 # Restore $at
.set at 
      rfe   
      jr      $k0
      nop
