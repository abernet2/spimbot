.data
index:	.word 0
state: 	.word 0
scan_data: .space 16384

.text
main:
	sw	$zero,  0xffff0010($0)	#stop the bot

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
     li     $t4, 0xb001                # Or(timer, bonk, scan, global)

     mtc0   $t4, $12                   # set interrupt mask (Status register)
     
                                       # REQUEST TIMER INTERRUPT
     lw     $v0, 0xffff001c($0)        # read current time
     add    $v0, $v0, 100	       # add 100 to current time
     sw     $v0, 0xffff001c($0)        # request timer interrupt in 100000 cycles

      li      $t0, 0x96		       # this is performing a scan
      sw      $t0, 0xffff0050($zero)
      sw      $t0, 0xffff0054($zero)
      li      $t0, 0xd4
      sw      $t0, 0xffff0058($zero)
      la      $t0, scan_data
      sw      $t0, 0xffff005c($zero)  


	jr	$ra

.kdata                # interrupt handler data (separated just for readability)
chunkIH:.space 12      # space for 3 registers
newline:	  .asciiz "\n"
done_str:	  .asciiz "done with task\n"
print_reg_str:	  .asciiz "Printing registers...\n"
timer_intrpt_str: .asciiz "time interrupt exception\n"
scanner_intrpt_str:	.asciiz "scanner interrupt exception\n"
bonk_intrpt_str:	  .asciiz "bonk interrupt exception\n"
non_intrpt_str:   .asciiz "Non-interrupt exception\n"
unhandled_str:    .asciiz "Unhandled interrupt type\n"


.ktext 0x80000180
interrupt_handler:
.set noat
      move      $k1, $at               # Save $at                               
.set at
      la      $k0, chunkIH                
      sw      $a0, 0($k0)              # Get some free registers                  
      sw      $a1, 4($k0)              # by storing them to a global variable    
      sw      $v0, 8($k0)	       # 8($k0) = $v0

      mfc0    $k0, $13                 # Get Cause register                       
      srl     $a0, $k0, 2                
      and     $a0, $a0, 0xf            # ExcCode field                            
      bne     $a0, 0, non_intrpt         

interrupt_dispatch:                    # Interrupt:                             
      mfc0    $k0, $13                 # Get Cause register, again                 
      beq     $k0, $zero, done         # handled all outstanding interrupts     
  
      and     $a0, $k0, 0x1000         # is there a bonk interrupt?                
      bne     $a0, 0, bonk_interrupt   

      and     $a0, $k0, 0x2000	       # is there a scanner interrupt?
      bne     $a0, 0, scanner_interrupt

      and     $a0, $k0, 0x8000         # is there a timer interrupt?
      bne     $a0, 0, timer_interrupt

                         # add dispatch for other interrupt types here.

      li      $v0, 4                   # Unhandled interrupt types

      la      $a0, unhandled_str
      syscall 
      j       done

bonk_interrupt:
      sw      $a1, 0xffff0060($zero)   # acknowledge interrupt

      li      $v0, 4
      la      $a0, bonk_intrpt_str
      syscall			       #print interrupt handler

      j       interrupt_dispatch       # see if other interrupts are waiting

timer_interrupt:
      sw      $a1, 0xffff006c($zero)   # acknowledge interrupt

      li      $v0, 4
      la      $a0, timer_intrpt_str
      syscall			       #print interrupt handler

      j       interrupt_dispatch       # see if other interrupts are waiting

scanner_interrupt:
      sw      $a1, 0xffff0064($zero)   # acknowledge interrupt
      
      li      $v0, 4
      la      $a0, scanner_intrpt_str
      syscall			       #print interrupt handler

      
      j	      print_registers
done_printing:

      j	      interrupt_dispatch

non_intrpt:                            # was some non-interrupt
      li      $v0, 4
      la      $a0, non_intrpt_str
      syscall                          # print out an error message

      # fall through to done

done:
      la      $k0, chunkIH
      lw      $a0, 0($k0)              # Restore saved registers
      lw      $a1, 4($k0)
      lw      $v0, 8($k0)
      mfc0    $k0, $14                 # Exception Program Counter (PC)
.set noat
      move    $at, $k1                 # Restore $at
.set at 
      rfe   
      jr      $k0
      nop

print_registers:
      li      $v0, 4
      la      $a0, print_reg_str
      syscall

      li      $v0, 1
      move    $a0, $v1
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $a1
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $a2
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $a3
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t0
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t1
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t2
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t3
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t4
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t5
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t6
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t7
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t8
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $t9
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s1
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s2
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s3
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s4
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s5
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s6
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 1
      move    $a0, $s7
      syscall  
      li      $v0, 4
      la      $a0, newline
      syscall

      li      $v0, 4
      la      $a0, done_str
      syscall
j     done_printing


