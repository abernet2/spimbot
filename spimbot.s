.data
index:	.word 0
state: 	.word 0

scanner:  .space 16384		#space allocated for scanner data
main:
	sw	$0,  0xffff0010($0)	#stop the bot

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

#copied from p1

      li     $t4, 0x8000                # timer interrupt enable bit
     or     $t4, $t4, 0x1000           # bonk interrupt bit
     or     $t4, $t4, 1                # global interrupt enable
     or     $t4, $t4, 0x2000		#scan interrupt bit
     mtc0   $t4, $12                   # set interrupt mask (Status register)

     li     $a0, 10
     sw     $a0, 0xffff0010($zero)     # drive
     jr     $ra

#example stuffs

.kdata                # interrupt handler data (separated just for readability)
chunkIH:.space 8      # space for two registers
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

      and     $a0, $k0, 0x2000		#checks for scan interrupt
      bne     $a0, 0, scan_interrupt

                         # add dispatch for other interrupt types here.

      li      $v0, 4                   # Unhandled interrupt types

      la      $a0, unhandled_str
      syscall 
      j       done

bonk_interrupt:
      sw      $zero, 0xffff0010($zero) # ???
      sw      $a1, 0xffff0060($zero)   # acknowledge interrupt

      j       interrupt_dispatch       # see if other interrupts are waiting


scan_interrupt:				
	
	li     $t0, 150			#set scan coordinates
	sw     $t0, 0xffff0020
	sw     $t0, 0xffff0024	
	li     $t0, 213			#set radius (213 is approximate length for whole map)
	
	la     $t1, scanner		#starts scan, loads address
	sa     $t1, 0xffff005c
	sw     $a1, 0xffff0064		#acknowledge interrupt	
	j      interrupt_dispatch	


	
non_intrpt:                         # was some non-interrupt
      li      $v0, 4
      la      $a0, non_intrpt_str
      syscall                          # print out an error message

      # fall through to done

done:
      la      $k0, chunkIH
      lw      $a0, 0($k0)              # Restore saved registers
      lw      $a1, 4($k0)
      mfc0    $k0, $14                 # Exception Program Counter (PC)
.set noat
      move    $at, $k1                 # Restore $at
.set at 
      rfe   
      jr      $k0
      nop
