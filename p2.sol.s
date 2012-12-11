.data
index:	.word 0
state: 	.word 0

xcord:
.word   15	108	250	91	67	
.word   42	180	220	96	270	
.word   140	201	32	150	180
   
ycord:
.word   42	180	96	220	270	
.word   108	250	91	67	15	
.word   32	150	201	140	180

.text
main:
	sw	$0,  0xffff0010($0)	#stop the bot

	jal	initialize
	
whee:	j	whee

# -----------

initialize:
	li	$t4, 0x9001	        # modify to enable timer interrupts
	mtc0 	$t4, $12	        # set interrupt mask (Status register)

  	lw	$v0, 0xffff001c($0)	# current time
  	add	$v0, $v0, 1
  	sw	$v0, 0xffff001c($0)	# request timer in 50
	
	jr	$ra
	
.data
save0:  .word 0
save1:  .word 0

.ktext 0x80000180
interrupt_handler:
	.set noat
	move	$k1, $at		# Save $at
	.set at
	#sw	$a0, save0		# Get some free registers
	#sw	$a1, save1		# by storing them to a global variable

	mfc0 	$k0, $13		# Get Cause register
	srl 	$a0, $k0, 2		
	and 	$a0, $a0, 0xf		# ExcCode field
	bne 	$a0, 0, non_intrpt

interrupt_dispatch:			# Interrupt:
	mfc0 	$k0, $13		# Get Cause register, again
	beq	$k0, $zero, done	# handled all outstanding interrupts

	and 	$a0, $k0, 0x1000	# is there a bonk interrupt?
	bne 	$a0, 0, bonk_interrupt	

	andi    $a0, $k0, 0x8000	# timer interrupt
        bne     $a0, $0, timer_interrupt

	li $v0, 4			# Unhandled interrupt types
	la $a0, unhandled_str
	syscall
	j	 done
	
bonk_interrupt:
	li	$a0, 70
	sw	$a0, 0xffff0014($zero)		# set angle to turn 70 degrees
	sw	$zero, 0xffff0018($zero)	# send the turn command
	li	$a0, 10
	sw	$a0, 0xffff0010($zero)		# drive
	sw	$a1, 0xffff0060($zero)		# acknowledge interrupt

	j 	interrupt_dispatch		# see if other interrupts are waiting



timer_interrupt:
	sw	$0, 0xffff006c($0)		#acknowledge interrupt
	
	lw	$a0, state($0)
	bne	$a0, 0, timer_y

timer_x:
	lw	$a0, 0xffff0020($0)		#load our current x

	lw	$a1, index($0)
	mul	$a1, $a1, 4
	lw	$a1, xcord($a1)			#load target x

	sub	$a1, $a1, $a0
	abs	$a0, $a1
	blt	$a0, 2, timer_do_y		# within threshold

	lw	$k0, 0xffff001c($0)		# get current time
	mul	$a0, $a0, 400
	add	$k0, $k0, $a0			# set next timer appropriately
	sw	$k0, 0xffff001c($0)		# request timer 

	li	$a0, 0				# point in right direction
	bgt	$a1, $zero, t_drive
	li	$a0, 180

t_drive:
	sw	$a0, 0xffff0014($0)		# set angle
	li	$k0, 1
	sw	$k0, 0xffff0018($0)		# absolute
	li	$k0, 10
	sw	$k0, 0xffff0010($0)		# set velocity
	j	interrupt_dispatch

timer_do_y:
	li	$a0, 1
	lw	$a0, state($0)			# set state to 1

timer_y:
	lw	$a0, 0xffff0024($0)		# load our current y

	lw	$a1, index($0)
	mul	$a1, $a1, 4
	lw	$a1, ycord($a1)			# load target y

	sub	$a1, $a1, $a0
	abs	$a0, $a1
	blt	$a0, 2, timer_do_x		# within threshold

	lw	$k0, 0xffff001c($0)		# get current time
	mul	$a0, $a0, 400
	add	$k0, $k0, $a0			# set next timer appropriately
	sw	$k0, 0xffff001c($0)		# request timer 

	li	$a0, 90				# point in right direction
	bgt	$a1, $zero, t_drive
	li	$a0, 270
	j	t_drive

timer_do_x:
	li	$a0, 0
	lw	$a0, state($0)			# set state to 0
	
	lw	$a1, index($0)			# increment index
	add	$a1, $a1, 1
	sw	$a1, index($0)
	j	timer_x

non_intrpt:				# was some non-interrupt
	li $v0, 4			
	la $a0, non_intrpt_str
	syscall				# print out an error message
	j done

done:
	#lw	$a0, save0
	#lw	$a1, save1
	mfc0 	$k0 $14			# EPC
	.set noat
	move	$at $k1			# Restore $at
	.set at
	rfe				# Return from exception handler
	jr 	$k0
        nop

