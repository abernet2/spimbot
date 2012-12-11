# -------------------------------------------------------------------------------------
# This is the SpimBot program created by Jack Abernethy, John McConnell, and Brian Xue.
#--------------------------------------------------------------------------------------

.data
map_grid:	.word 0, 29, 0, 29 0,	 	# this is 1th element, grid location is 0(map_grid)
		.word 0, 29, 30, 59 0,	 	# this is 2th element, grid location is 20(map_grid)
		.word 0, 29, 60, 89 0,	 	# this is 3th element, grid location is 40(map_grid)
		.word 0, 29, 90, 119 0,	 	# this is 4th element, grid location is 60(map_grid)
		.word 0, 29, 120, 149 0,	 # this is 5th element, grid location is 80(map_grid)
		.word 0, 29, 150, 179 0,	 # this is 6th element, grid location is 100(map_grid)
		.word 0, 29, 180, 209 0,	 # this is 7th element, grid location is 120(map_grid)
		.word 0, 29, 210, 239 0,	 # this is 8th element, grid location is 140(map_grid)
		.word 0, 29, 240, 269 0,	 # this is 9th element, grid location is 160(map_grid)
		.word 0, 29, 270, 299 0,	 # this is 10th element, grid location is 180(map_grid)
		###### New Row ######
		.word 30, 59, 0, 29 0,	 	# this is 11th element, grid location is 200(map_grid)
		.word 30, 59, 30, 59 0,	 	# this is 12th element, grid location is 220(map_grid)
		.word 30, 59, 60, 89 0,	 	# this is 13th element, grid location is 240(map_grid)
		.word 30, 59, 90, 119 0,	 # this is 14th element, grid location is 260(map_grid)
		.word 30, 59, 120, 149 0,	 # this is 15th element, grid location is 280(map_grid)
		.word 30, 59, 150, 179 0,	 # this is 16th element, grid location is 300(map_grid)
		.word 30, 59, 180, 209 0,	 # this is 17th element, grid location is 320(map_grid)
		.word 30, 59, 210, 239 0,	 # this is 18th element, grid location is 340(map_grid)
		.word 30, 59, 240, 269 0,	 # this is 19th element, grid location is 360(map_grid)
		.word 30, 59, 270, 299 0,	 # this is 20th element, grid location is 380(map_grid)
		###### New Row ######
		.word 60, 89, 0, 29 0,	 	# this is 21th element, grid location is 400(map_grid)
		.word 60, 89, 30, 59 0,	 	# this is 22th element, grid location is 420(map_grid)
		.word 60, 89, 60, 89 0,	 	# this is 23th element, grid location is 440(map_grid)
		.word 60, 89, 90, 119 0,	 # this is 24th element, grid location is 460(map_grid)
		.word 60, 89, 120, 149 0,	 # this is 25th element, grid location is 480(map_grid)
		.word 60, 89, 150, 179 0,	 # this is 26th element, grid location is 500(map_grid)
		.word 60, 89, 180, 209 0,	 # this is 27th element, grid location is 520(map_grid)
		.word 60, 89, 210, 239 0,	 # this is 28th element, grid location is 540(map_grid)
		.word 60, 89, 240, 269 0,	 # this is 29th element, grid location is 560(map_grid)
		.word 60, 89, 270, 299 0,	 # this is 30th element, grid location is 580(map_grid)
		###### New Row ######
		.word 90, 119, 0, 29 0,	 	# this is 31th element, grid location is 600(map_grid)
		.word 90, 119, 30, 59 0,	 # this is 32th element, grid location is 620(map_grid)
		.word 90, 119, 60, 89 0,	 # this is 33th element, grid location is 640(map_grid)
		.word 90, 119, 90, 119 0,	 # this is 34th element, grid location is 660(map_grid)
		.word 90, 119, 120, 149 0,	 # this is 35th element, grid location is 680(map_grid)
		.word 90, 119, 150, 179 0,	 # this is 36th element, grid location is 700(map_grid)
		.word 90, 119, 180, 209 0,	 # this is 37th element, grid location is 720(map_grid)
		.word 90, 119, 210, 239 0,	 # this is 38th element, grid location is 740(map_grid)
		.word 90, 119, 240, 269 0,	 # this is 39th element, grid location is 760(map_grid)
		.word 90, 119, 270, 299 0,	 # this is 40th element, grid location is 780(map_grid)
		###### New Row ######
		.word 120, 149, 0, 29 0,	 # this is 41th element, grid location is 800(map_grid)
		.word 120, 149, 30, 59 0,	 # this is 42th element, grid location is 820(map_grid)
		.word 120, 149, 60, 89 0,	 # this is 43th element, grid location is 840(map_grid)
		.word 120, 149, 90, 119 0,	 # this is 44th element, grid location is 860(map_grid)
		.word 120, 149, 120, 149 0,	 # this is 45th element, grid location is 880(map_grid)
		.word 120, 149, 150, 179 0,	 # this is 46th element, grid location is 900(map_grid)
		.word 120, 149, 180, 209 0,	 # this is 47th element, grid location is 920(map_grid)
		.word 120, 149, 210, 239 0,	 # this is 48th element, grid location is 940(map_grid)
		.word 120, 149, 240, 269 0,	 # this is 49th element, grid location is 960(map_grid)
		.word 120, 149, 270, 299 0,	 # this is 50th element, grid location is 980(map_grid)
		###### New Row ######
		.word 150, 179, 0, 29 0,	 # this is 51th element, grid location is 1000(map_grid)
		.word 150, 179, 30, 59 0,	 # this is 52th element, grid location is 1020(map_grid)
		.word 150, 179, 60, 89 0,	 # this is 53th element, grid location is 1040(map_grid)
		.word 150, 179, 90, 119 0,	 # this is 54th element, grid location is 1060(map_grid)
		.word 150, 179, 120, 149 0,	 # this is 55th element, grid location is 1080(map_grid)
		.word 150, 179, 150, 179 0,	 # this is 56th element, grid location is 1100(map_grid)
		.word 150, 179, 180, 209 0,	 # this is 57th element, grid location is 1120(map_grid)
		.word 150, 179, 210, 239 0,	 # this is 58th element, grid location is 1140(map_grid)
		.word 150, 179, 240, 269 0,	 # this is 59th element, grid location is 1160(map_grid)
		.word 150, 179, 270, 299 0,	 # this is 60th element, grid location is 1180(map_grid)
		###### New Row ######
		.word 180, 209, 0, 29 0,	 # this is 61th element, grid location is 1200(map_grid)
		.word 180, 209, 30, 59 0,	 # this is 62th element, grid location is 1220(map_grid)
		.word 180, 209, 60, 89 0,	 # this is 63th element, grid location is 1240(map_grid)
		.word 180, 209, 90, 119 0,	 # this is 64th element, grid location is 1260(map_grid)
		.word 180, 209, 120, 149 0,	 # this is 65th element, grid location is 1280(map_grid)
		.word 180, 209, 150, 179 0,	 # this is 66th element, grid location is 1300(map_grid)
		.word 180, 209, 180, 209 0,	 # this is 67th element, grid location is 1320(map_grid)
		.word 180, 209, 210, 239 0,	 # this is 68th element, grid location is 1340(map_grid)
		.word 180, 209, 240, 269 0,	 # this is 69th element, grid location is 1360(map_grid)
		.word 180, 209, 270, 299 0,	 # this is 70th element, grid location is 1380(map_grid)
		###### New Row ######
		.word 210, 239, 0, 29 0,	 # this is 71th element, grid location is 1400(map_grid)
		.word 210, 239, 30, 59 0,	 # this is 72th element, grid location is 1420(map_grid)
		.word 210, 239, 60, 89 0,	 # this is 73th element, grid location is 1440(map_grid)
		.word 210, 239, 90, 119 0,	 # this is 74th element, grid location is 1460(map_grid)
		.word 210, 239, 120, 149 0,	 # this is 75th element, grid location is 1480(map_grid)
		.word 210, 239, 150, 179 0,	 # this is 76th element, grid location is 1500(map_grid)
		.word 210, 239, 180, 209 0,	 # this is 77th element, grid location is 1520(map_grid)
		.word 210, 239, 210, 239 0,	 # this is 78th element, grid location is 1540(map_grid)
		.word 210, 239, 240, 269 0,	 # this is 79th element, grid location is 1560(map_grid)
		.word 210, 239, 270, 299 0,	 # this is 80th element, grid location is 1580(map_grid)
		###### New Row ######
		.word 240, 269, 0, 29 0,	 # this is 81th element, grid location is 1600(map_grid)
		.word 240, 269, 30, 59 0,	 # this is 82th element, grid location is 1620(map_grid)
		.word 240, 269, 60, 89 0,	 # this is 83th element, grid location is 1640(map_grid)
		.word 240, 269, 90, 119 0,	 # this is 84th element, grid location is 1660(map_grid)
		.word 240, 269, 120, 149 0,	 # this is 85th element, grid location is 1680(map_grid)
		.word 240, 269, 150, 179 0,	 # this is 86th element, grid location is 1700(map_grid)
		.word 240, 269, 180, 209 0,	 # this is 87th element, grid location is 1720(map_grid)
		.word 240, 269, 210, 239 0,	 # this is 88th element, grid location is 1740(map_grid)
		.word 240, 269, 240, 269 0,	 # this is 89th element, grid location is 1760(map_grid)
		.word 240, 269, 270, 299 0,	 # this is 90th element, grid location is 1780(map_grid)
		###### New Row ######
		.word 270, 299, 0, 29 0,	 # this is 91th element, grid location is 1800(map_grid)
		.word 270, 299, 30, 59 0,	 # this is 92th element, grid location is 1820(map_grid)
		.word 270, 299, 60, 89 0,	 # this is 93th element, grid location is 1840(map_grid)
		.word 270, 299, 90, 119 0,	 # this is 94th element, grid location is 1860(map_grid)
		.word 270, 299, 120, 149 0,	 # this is 95th element, grid location is 1880(map_grid)
		.word 270, 299, 150, 179 0,	 # this is 96th element, grid location is 1900(map_grid)
		.word 270, 299, 180, 209 0,	 # this is 97th element, grid location is 1920(map_grid)
		.word 270, 299, 210, 239 0,	 # this is 98th element, grid location is 1940(map_grid)
		.word 270, 299, 240, 269 0,	 # this is 99th element, grid location is 1960(map_grid)
		.word 270, 299, 270, 299 0,	 # this is 100th element, grid location is 1980(map_grid)
sorted_map_offsets:
		.word	1080,1100,900,880,860,1060,1260,1280,1300,
		.word	1320,1120,920,720,700,680,660,640,840,
		.word	1040,1240,1440,1460,1480,1500,1520,1540,1340,
		.word	1140,940,740,540,520,500,480,460,440,
		.word	420,620,820,1020,1220,1420,1620,1640,1660,
		.word	1680,1700,1720,1740,1760,1560,1360,1160,960,
		.word	760,560,360,340,320,300,280,260,240,
		.word	220,200,400,600,800,1000,1200,1400,1600,
		.word	1800,1820,1840,1860,1880,1900,1920,1940,1960,
		.word	1980,1780,1580,1380,1180,980,780,580,380,
		.word	180,160,140,120,100,80,60,40,20,
map_move_head_index:	.word 0
map_scan_head_index:	.word 0
#state: 			.word 0			# state
data_ready:		.word 0
data_valid:		.word 0
is_scanning:		.word 0
#output_index:		.word 0
output: 		.space 60  		# output array, 15 x 32 bits 0f 0
scan_data: 		.space 819200 		# Memory allocation for scan data 50 * 16384
next_x_loc:		.word 0
next_y_loc:		.word 0


# euclidean stuff
three:	.float	3.0
five:	.float	5.0
PI:	.float	3.141592
F180:	.float  180.0


.text
main:
	#li	$s3, 3
	#li	$s4, 4
	#li	$s5, 5
	#li	$s6, 6
	#li	$s7, 7

	#sw	$zero,  0xffff0010($0)	# stop the bot

	#la	$t0, sorted_map_grid	# load sort_map_grid_address
	#la	$t1, sorted_map_scan_head
	#sw	$t0, 0($t1)		# point the head to the start of map_grid_address
	#la	$t1, sorted_map_move_head
	#sw	$t0, 0($t1)

	#la	$t0, state
	li	$s0, 4
	#sw	$t1, 0($t0)

	jal	initialize		# call your initialization function
					# this should set up interrupt handling;

# all of the actual steering, etc. should
# be done by the interrupt handler
# changes the state to 30 iff state == 0 we can use this to change the state of our machine to behave differently!
# I will show an example below, at the end of the scanner interrupt, it store 30 to the value of state
# this next function will check if the state is 30, if it is then the machine 'knows' it is ready to move the bot!!!
# loop forever (note that interrupts
# will still be handled)

main_state_dispatcher:
	la	$t0, is_scanning		# variable which is 1 if the bot is currently scanning
	lw	$t0, 0($t0)
	bne	$t0, $zero, skip_perform_scan
	la	$t0, data_ready			# variable which is 1 if data is ready to be used
	lw	$t0, 0($t0)
	bne	$t0, $zero, skip_perform_scan
	la	$t0, data_valid			# variable which is 1 if current data is valid
	lw	$t0, 0($t0)
	bne	$t0, $zero, skip_perform_scan
	j	preform_next_scan
skip_perform_scan:

	# la	$t0, state			# load address of state
	# lw	$t0, 0($t0)			# load value of state	
	# move	$t0, $s0
						# 0 deprecated do nothing
	# li	$t1, 1				# 1 deprecated don't use
	li	$t2, 2				# 2 means tells the bot to sort data
	beq	$s0, $t2, sort_and_extract	
	li	$t3, 3				# 3 means tells the bot to perform the next scan
	beq	$s0, $t3, preform_next_scan	#
	li	$t4, 4				# 4 means tells the bot to load the next_grid into the next_x_loc, next_y_loc variables
	beq	$s0, $t4, load_next_grid	#
	li	$t5, 5				# 5 means tells the bot to move to next_x_loc, next_y_loc
	beq	$s0, $t5, move_2_next_xy	#
	li	$t6, 6				# 6 means tells the bot to check if it has missed next_x_loc, next_y_loc
	beq	$s0, $t6, check_if_bot_missed	#
	li	$t7, 7				# 7 means tells the bot to take the output data and put into next_x_loc, next_y_loc
	beq	$s0, $t7, load_output_2_next_xy	

	# li	$t8, 8
	
						# state is moved to 32 on bonks
						# if state =  ?? move the bot to the next_output 32 means bot is ready to go to next token
done_dispatch:				# j to this to finish dispatch
	j	main_state_dispatcher

main_move_bot:	# $a0 == x $a1 == y
	sub	$sp, $sp, 4
	sw	$ra, 0($sp)		# save return address on stack
	
	#li     	$t4, 0	
	#sw     	$t4, 0xffff0010($zero)	# set velocity to 10

	lw     	$t0, 0xffff0020($zero)  # get_current_x()
	lw     	$t1, 0xffff0024($zero)  # get_current_y()

	sub     $a0, $a0, $t0	       	# get difference in distance from curr_x to token
	sub     $a1, $a1, $t1	       	# get difference in distance from curr_y to token
	
	jal	sb_arctan		# get the angle
	
	sw     	$v0, 0xffff0014($zero)  # set angle to new_angle
	li     	$t4, 1 
	sw     	$t4, 0xffff0018($zero)	# set orientation control = 1 (absolute)

	li     	$t4, 10	
	sw     	$t4, 0xffff0010($zero)	# set velocity to 10

	lw	$ra, 0($sp)		# restore return address on stack
	add	$sp, $sp, 4
	
	jr      $ra

get_x_y:
    	li    	$t0, 0x0000ffff         # Probably check my syntax on this one
	lw	$t1, 0($a0)
	and   	$v1, $t0, $t1           # returns 1st 16 bits as y value
	srl   	$v0, $t1, 16            # shifts right the 32 bits as x value
	jr	$ra

preform_next_scan:
	la	$t0, map_scan_head_index	# address of head
	lw	$t6, 0($t0)			# $t1 = offset of sorted map offset, $t6 = offset

	bgt	$t6, 400, ran_out_of_grid_2	# if offset of sorted map offset > 400
	
	la	$t2, sorted_map_offsets		
	add	$t2, $t2, $t6			# t2 is offset + @ sorted_map_offsets
	lw	$t2, 0($t2)			# result t2 offset of sorted_map

	la	$t1, map_grid
	add	$t2, $t2, $t1			# t2 map_grid

	addi	$t6, $t6, 4			# increment the head by 4 bytes
	sw	$t6, 0($t0)

	lw	$t7, 16($t2)			# gets enemy
	bne	$t7, $zero, preform_next_scan
 			
	lw	$t3, 0($t2)			# gets grid=>top_y
	lw	$t4, 4($t2)			# gets grid=>bot_y

	add	$t3, $t4, $t3			# add Bot + Top
	srl	$t3, $t3, 1			# divide by 2

	lw	$t4, 8($t2)			# grid=>Left
	lw	$t5, 12($t2)			# grid=>Right
	add	$t4, $t5, $t4			# add Left + Right
	srl	$t4, $t4, 1			# divide by 2

		       				# this is performing a scan
      	sw      $t4, 0xffff0050($zero)		# X center
      	sw      $t3, 0xffff0054($zero)		# Y center
      	#li      $t0, 0x96
	li	$t0, 0x12
      	sw      $t0, 0xffff0058($zero)		# radius
      	la      $t0, scan_data
     	sw      $t0, 0xffff005c($zero)  	# memory location
	
	#j	skip_reset_offset
#skip_reset_offset:

	la	$t0, is_scanning
	li	$t1, 1
	sw	$t1, 0($t0)	
	
	la	$t0, data_ready
	sw	$zero, 0($t0)

	la	$t0, data_valid
	sw	$zero, 0($t0)
	j	skip_ran_out_2
ran_out_of_grid_2:
	la	$t0, map_scan_head_index	# address of head
	sw	$zero, 0($t0)			# $t1 = offset of sorted map offset, $t6 = offset

skip_ran_out_2:
	#la	$t0, state
	li	$s0, 4
	#sw	$t1, 0($t0)


	j	done_dispatch

###############################
#Move to next grid
##############################
load_next_grid:
	la	$t0, map_move_head_index	# address of head
	lw	$t6, 0($t0)			# $t1 = offset of sorted map offset, $t6 = offset

	bgt	$t6, 400, ran_out_of_grid	# if offset of sorted map offset > 400
	
	la	$t2, sorted_map_offsets		
	add	$t2, $t2, $t6			# t2 is offset + @ sorted_map_offsets
	lw	$t2, 0($t2)			# result t2 offset of sorted_map

	la	$t1, map_grid
	add	$t2, $t2, $t1			# t2 map_grid

	addi	$t6, $t6, 4			# increment the head by 4 bytes
	sw	$t6, 0($t0)
 
	lw	$t7, 16($t2)		# get the enemy
	bne	$t7, $zero, load_next_grid	# oh no the enemy
	
	lw	$t3, 0($t2)		# gets top_y
	lw	$t4, 4($t2)		# gets bot_y
	lw	$t5, 8($t2)		# gets right_x
	lw	$t6, 12($t2)		# gets left_x
		

	add	$a0, $t4, $t3
	srl	$a0, $a0, 1		# gets middle_y of grid
	add	$a1, $t6, $t5
	srl	$a1, $a1, 1		# gets middle_x of grid

	li    	$t1, 298                # Bound of acceptable behavior
	bgt	$a0, $t1, done_dispatch	# skip if not in bounds
	bgt	$a1, $t1, done_dispatch	# skip if not in bounds
	li	$t1, 2
	ble	$a0, $t1, done_dispatch
	ble	$a1, $t1, done_dispatch


	la	$t2, next_y_loc		# load next_x_loc and next_y_loc
	la	$t3, next_x_loc		# store x and y respectively
	sw	$a0, 0($t2)
	sw	$a1, 0($t3)
	#la	$t0, state
	li	$s0, 5
	#sw	$t1, 0($t0)
	j	done_dispatch
ran_out_of_grid:
	la	$t0, map_move_head_index	# address of head
	sw	$zero, 0($t0)			# $t1 = offset of sorted map offset, $t6 = offset

	#la	$t0, state
	li	$s0, 7
	#sw	$t1, 0($t0)

	j	done_dispatch

move_2_next_xy:
	la	$t0, next_x_loc		# load next_x_loc and next_y_loc
	la	$t1, next_y_loc
	lw	$a0, 0($t0)		# equals x
	lw	$a1, 0($t1)		# equals y
		
	jal	main_move_bot		# move to that x and y
	
	#la	$t0, state
	li	$s0, 6
	#sw	$t1, 0($t0)

	j	done_dispatch

check_if_bot_missed:	# add opponent location first
	lw	$a0, 0xffff00a0($zero)	# opponent x
	lw	$a1, 0xffff00a4($zero)	# opponent y
	li	$t0, 30		
	div	$a0, $a0, $t0	# divide x / 30
	div	$a1, $a1, $t0	# divide y / 30

	li	$t0, 20	
	mul	$a0, $a0, $t0	# x * 20
	li	$t0, 200
	mul	$a1, $a1, $t0	# y * 200


	add	$a0, $a0, $a1	# add x offset + y offset
	la	$t0, map_grid
	add	$a0, $a0, $t0
	sw	$a0, 16($a0) 


	la	$a0, next_x_loc
	lw	$a0, 0($a0)
	la	$a1, next_y_loc
	lw	$a1, 0($a1)

	jal	check_missed_tokenv2

	la	$a0, data_valid		# load data ready
	lw	$a0, 0($a0)		# put_data in a0
	beq	$v0, 1, missed_location
	beq	$v0, 2, hit_location
	j	done_dispatch
hit_location:	# a0 = data_ready
	beq	$a0, $zero, hit_but_no_data
	li	$s0, 7
	#la	$t1, state
	#sw	$t0, 0($t1)
	j	done_dispatch
hit_but_no_data:
	la	$t0, data_ready
	sw	$zero, 0($t0)
	li	$s0, 4
	#la	$t1, state
	#sw	$t0, 0($t1)

	j	done_dispatch
missed_location:
	li	$s0, 5
	#la	$t1, state
	#sw	$t0, 0($t1)

	j	done_dispatch

check_missed_tokenv2:			# takes in $a0, $a1 for token_x, token_y
					# checks if bot is heading away from token
					# returns 0 if bot is still on the right path
					# returns 1 if it missed
					# returns 2 if it hit the token radius
	lw	$t0, 0xffff0014($zero)	#gets current angle

	blt	$t0, $zero, add_360	#abs(current angle)
	j	skip_add_360
add_360:
	addi	$t0, 360
skip_add_360:
	lw	$t1, 0xffff0020($zero)	#gets current x
	lw	$t2, 0xffff0024($zero)	#gets current y
	
	sub	$t3, $t1, $a0		#gets x diff
	abs	$t3, $t3		#abs(xdiff)
	sub	$t4, $t2, $a1		#gets y diff
	abs	$t4, $t4		#abs(ydiff)

	ble	$t3, 1, check_y
	j	skip_check_y
check_y:
	ble	$t4, 1, token_hit
skip_check_y:
	#checking the angle		#angle between 180, 270	
	bge	$t0, 270, up_right	#checks which quadrant bot is supposed to be in
	bge	$t0, 180, up_left
	bge	$t0, 90, bot_left
bot_right:
	bgt	$t1, $a0, missedv2
	bgt	$t2, $a1, missedv2
	j	not_missedv2
bot_left:
	blt	$t1, $a0, missedv2
	bgt	$t2, $a1, missedv2
	j	not_missedv2
up_left:
	blt	$t1, $a0, missedv2
	blt	$t2, $a1, missedv2
	j	not_missedv2
up_right:
	bgt	$t1, $a0, missedv2
	blt	$t2, $a1, missedv2
	j	not_missedv2
not_missedv2:
	li	$v0, 0
	jr	$ra
missedv2:
	li	$v0, 1
	jr	$ra
token_hit:
	li	$v0, 2
	jr	$ra

load_output_2_next_xy:
	#la	$t0, output_index
	move	$t1, $s2
	bge	$t1, 60, done_with_output
	la	$a0, output		# load the next_output
	add	$a0, $a0, $t1

	jal	get_x_y			# get the x and y, $v0 = x, $v1 = y

	li    	$t1, 298                # Bound of acceptable behavior
	bgt	$v0, $t1, skip_load	# skip if not in bounds
	bgt	$v1, $t1, skip_load	# skip if not in bounds
	li	$t1, 2
	ble	$v0, $t1, skip_load
	ble	$v1, $t1, skip_load

	la	$t0, data_valid
	li	$t1, 1
	sw	$t1, 0($t0)

	la	$t0, next_x_loc
	sw	$v0, 0($t0)
	la	$t0, next_y_loc
	sw	$v1, 0($t0)
	
	#la	$t0, state		# load state
	li	$s0, 5
	#sw	$t1, 0($t0)		# state goes to 5

	#la	$t0, movement_state
	#li	$t1, 1
	#sw	$t1, 0($t0)

	#la	$t0, output_index	
	#lw	$t1, 0($t0)
	add	$s2, $s2, 4
	#sw	$t1, 0($t0)

	j	done_dispatch
skip_load:
	#la	$t0, output_index	
	#lw	$t1, 0($t0)
	#add	$t1, $t1, 4
	#sw	$t1, 0($t0)
	#j	load_output_2_next_xy
done_with_output:
	#la	$t0, output_index
	#move	$s1 $zero
	
	la	$t0, data_valid		# data is not_ready because it has been used
	sw	$zero, 0($t0)

	la	$t0, data_ready		# data is not_ready because it has been used
	sw	$zero, 0($t0)


	#la	$t0, state		# go load the next grid
	li	$s0, 4
	#sw	$t1, 0($t0)

	j	done_dispatch


# -----------------------------------------------------------------
# This is the beginning of the sort and extract function
# Author: Jack Abernethy
# The labels used in the section include:
# 	sort_and_extract
# 	big_for_loop
# 	end_big_loop
# 	insert_after_element
# 	iea_after_head
# 	iea_done
# 	iea_not_head
# 	iea_not_tail
# 	remove_element
#	re_empty_list
#	re_not_empty_list
#	re_not_first
#	re_not_last
#	re_done
#	sort_list
#	sl_2_or_more
#	sl_loop
#	sl_skip
#	sl_loop_done
#	compact
#	compact_loop
#	compact_else_case
#	compact_endif
#	compact_loop_maintainance
#	compact_done
# -----------------------------------------------------------------

# args(listhead, output array head?);
#	$a0 == listhead

#---------------------------------------------------------------
#	Things needed for sort
#---------------------------------------------------------------


sort_and_extract:
	la 	$s3, scan_data
	la	$t5, output
	# -------------------- PREPARE CALLS --------------------- #
	#move	$t4, $a0		# back up $a0

	move	$a0, $s3		# a0 = scan_data + offset
	jal	sort_list
	move	$a0, $s3		# a0 = scan_data + offset
	jal	compact
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract	# if not valid finish
	add	$t6, $t5, $s1		# add t5 + offset
	sw	$v0, 0($t6)		# store value in output + offset
	addi 	$s3, $s3, 8		# increment scan_data
	addi 	$s1, $s1, 4		# increment in_head
	move	$a0, $s3
	
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	addi 	$s3, $s3, 8 	# increment the In_offset
	addi 	$s1, $s1, 4 	# Offset the Output
	move 	$a0, $s3 	# move scan_data back to $a0
			#Next
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	sort_list
	move 	$a0, $s3 	# a0 = scan + offset
	jal 	compact 	# Compact the value
	#jal 	valid_x_y
	beq 	$v1, $zero, finish_sort_and_extract 	# End if not valid
	add 	$t6, $t5, $s1
	sw 	$v0, 0($t6) 	# Store compact value in Output
	#addi 	$s3, $s3, 8 	# increment the In_offset
	#addi 	$s1, $s1, 4 	# Offset the Output
	#move 	$a0, $s3 	# move scan_data back to $a0

finish_sort_and_extract:
	#la	$t0, output_index
	#sw	$zero, 0($t0)

	la	$t0, data_valid
	li	$t1, 1
	lw	$t1, 0($t0)

	#la	$t0, state		# load state address
	li	$s0, 7
	#sw	$t1, 0($t0)		# state goes back 0

	#la	$a0, output
	#li	$a1, 60
	#jal	print_data_in_memory

	j	done_dispatch

	


#---------------------------------------------------------------
#	Things needed for sort
#---------------------------------------------------------------
insert_element_after:	
	# inserts the new element $a0 after $a1
	# if $a1 is 0, then we insert at the front of the list

	bne	$a1, $zero, iea_not_head # if a1 is null, we have to assign the head and tail

	lw	$t0, 0($a2) 		# $t0 = mylist->head
	sw	$t0, 8($a0)		# node->next = mylist->head;
	beqz	$t0, iea_after_head	# if ( mylist->head != NULL ) {
	sw	$a0, 4($t0)		#   mylist->head->prev = node;
		     			# }
iea_after_head:	
	sw	$a0, 0($a2)		# mylist->head = node;
	lw	$t0, 4($a2)		# $t0 = mylist->tail
	bnez	$t0, iea_done		# if ( mylist->tail == NULL ) {
	sw	$a0, 4($a2)		#   mylist->tail = node;
iea_done:	     			# }
	jr	$ra

iea_not_head:
	lw	$t1, 8($a1)		# $t1 = prev->next
	bne	$t1, $zero, iea_not_tail# if ( prev->next == NULL ) {
	sw	$a0, 4($a2)		#   mylist->tail = node;
	b	iea_end			# }
iea_not_tail:				# else {
	sw	$t1, 8($a0)		#   node->next = prev->next;
	sw	$a0, 4($t1)		#   node->next->prev = node;
		     			# }

iea_end:	
	sw	$a0, 8($a1)		# store the new pointer as the next of $a1
	sw	$a1, 4($a0)		# store the old pointer as prev of $a0
	jr	$ra			# return
	# END insert_element_after

#------------------------------------------------------
#  Remove Element
#------------------------------------------------------
remove_element:
	# removes the element at $a0 (list is in $a1)
	# if this element is the whole list, we have to empty the list
	lw	$t0, 0($a1)  	        # t0 = mylist->head
	lw	$t1, 4($a1)  	        # t1 = mylist->tail
	bne	$t0, $t1, re_not_empty_list

re_empty_list:
	sw	$zero, 0($a1)		# zero out the head ptr
	sw	$zero, 4($a1)		# zero out the tail ptr
	j	re_done

re_not_empty_list:
	lw	$t2, 4($a0)		# t2 = node->prev
	lw	$t3, 8($a0)		# t3 = node->next
	bne	$t2, $zero, re_not_first# if (node->prev == NULL) {

	sw	$t3, 0($a1)		# mylist->head = node->next;
	sw	$zero, 4($t3)		# node->next->prev = NULL;
	j	re_done

re_not_first: 
	bne	$t3, $zero, re_not_last# if (node->next == NULL) {
	sw	$t2, 4($a1)		# mylist->tail = node->prev;
	sw	$zero, 8($t2)		# node->prev->next = NULL;
	j	re_done
re_not_last:
	sw	$t3, 8($t2)		# node->prev->next = node->next;
	sw	$t2, 4($t3)		# node->next->prev = node->prev;

re_done:
	sw	$zero, 4($a0)		# zero out $a0's prev
	sw	$zero, 8($a0)		# zero out $a0's next
	jr	$ra			# return
	# END remove_element
	
#--------------------------------------------------------------------------
#  Sort
#--------------------------------------------------------------------------
sort_list:  # $a0 = mylist, toDO t0 = a0
	lw	$t0, 0($a0)  	        # t0 = mylist->head, smallest
	lw	$t1, 4($a0)  	        # t1 = mylist->tail
	bne	$t0, $t1, sl_2_or_more	# if (mylist->head == mylist->tail) {
	jr	$ra  	  		#    return;

sl_2_or_more:
	sub	$sp, $sp, 12
	sw	$ra, 0($sp)		# save $ra
	sw	$a0, 4($sp)		# save my_list
	lw	$t1, 8($t0)  	        # t1 = trav = smallest->next
sl_loop:
	beq	$t1, $zero, sl_loop_done # trav != NULL
	lw	$t3, 0($t1) 		# trav->data
	lw	$t2, 0($t0) 		# smallest->data
	bge	$t3, $t2, sl_skip	# inverse of: if (trav->data < smallest->data) { 
	move	$t0, $t1		# smallest = trav;
sl_skip:
	lw	$t1, 8($t1)		# trav = trav->next
	j	sl_loop
	
sl_loop_done:
	sw	$t0, 8($sp)		# save smallest

	move	$a1, $a0		# my_list is arg2
	move 	$a0, $t0		# smallest is arg1
	jal 	remove_element		# remove_node(smallest, mylist);

	lw	$a0, 4($sp)		# restore my_list as arg1
	jal	sort_list		# sort_list(mylist);

	lw	$a0, 8($sp)		# restore smallest as arg1
	li	$a1, 0			# pass NULL as arg2
	lw	$a2, 4($sp)		# restore my_list as arg3
	jal	insert_element_after	# insert_node_after(smallest, NULL, mylist);

	lw	$ra, 0($sp)		# restore $ra
	add	$sp, $sp, 12	# this maybe needs to be 16 with new struct
	jr	$ra
	# END sort_list
#--------------------------------------------
#	Compact function args(list head, length, base_address of final array)
#--------------------------------------------
compact:
	sub	$sp, $sp, 4
	sw	$ra, 0($sp)
	addi	$v0, $zero, 0
	li    	$t9, 298                # Bound of acceptable behavior
    	li    	$t6, 0x0000ffff         # Probably check my syntax on this one
  	li   	$t1, 0x80000000  	# $t1 = mask, initialized to 1 << 31
	lw	$t2, 0($a0)		# $t2 = list->head
compact_while:						# counter < 9
	beq	$t2, $zero, return_valid_compact 	# head == zero
	lw	$t3, 12($t2)			# $t3 = head->value
	beq	$t3, $zero, compact_value_zero	# if(value == zero)
	or	$v0, $v0, $t1		#val |= mask
	#### CHECK ####
	and   	$t7, $v0, $t6           # returns 1st 16 bits as y value
	srl   	$t8, $v0, 16            # shifts right the 32 bits as x value
	bgt	$t7, $t9, return_not_valid_compact	# skip if not in bounds
	bgt	$t8, $t9, return_not_valid_compact	# skip if not in bounds
	j	skip_compact_branch
compact_value_zero:
	not	$t0, $t1		# $t0 = ~mask
	and	$v0, $v0, $t0		# val &= ~mask
skip_compact_branch:
  	srl  	$t1, $t1, 1      	# mask = mask >> 1
	lw	$t2, 8($t2)		# $t2 = head->next
	j	compact_while
return_valid_compact:
	li	$v1, 1
	lw	$ra, 0($sp)
	add	$sp, $sp, 4
	jr	$ra
return_not_valid_compact:
	li	$v1, 0
	lw	$ra, 0($sp)
	add	$sp, $sp, 4
	jr	$ra


# ----------------------------------------------------------
# This is the end of the sort and extract function
# ----------------------------------------------------------

valid_x_y:		#v0 = integer, 1 equals vaild, 0 equals not valid
    	li    	$t0, 0x0000ffff         # Probably check my syntax on this one
	move	$t1, $v0
	and   	$t2, $t0, $t1           # returns 1st 16 bits as y value
	srl   	$t3, $t1, 16            # shifts right the 32 bits as x value
	li    	$t1, 298                # Bound of acceptable behavior
	bgt	$t2, $t1, not_valid_xy	# skip if not in bounds
	bgt	$t3, $t1, not_valid_xy	# skip if not in bounds
	li	$t1, 2
	ble	$t2, $t1, not_valid_xy
	ble	$t3, $t1, not_valid_xy
	li	$v1, 1
	jr	$ra
not_valid_xy:
	li	$v1, 0

	jr	$ra



# ----------------------------------------------------------------
# Arctan function - Part of the Euclidean Library
# Labels used include:
#
# ----------------------------------------------------------------
sb_arctan:
	li	$v0, 0		# angle = 0;

	abs	$t0, $a0	# get absolute values
	abs	$t1, $a1
	ble	$t1, $t0, no_TURN_90	  

	## if (abs(y) > abs(x)) { rotate 90 degrees }
	move	$t0, $a1	# int temp = y;
	sub	$a1, $zero, $a0	# y = -x;      
	move	$a0, $t0	# x = temp;    
	li	$v0, 90		# angle = 90;  

no_TURN_90:
	bge	$a0, $zero, pos_x 	# skip if (x >= 0)

	## if (x < 0) 
	add	$v0, $v0, 180	# angle += 180;

pos_x:
	mtc1	$a0, $f0
	mtc1	$a1, $f1
	cvt.s.w $f0, $f0	# convert from ints to floats
	cvt.s.w $f1, $f1
	
	div.s	$f0, $f1, $f0	# float v = (float) y / (float) x;

	mul.s	$f1, $f0, $f0	# v^^2
	mul.s	$f2, $f1, $f0	# v^^3
	l.s	$f3, three($zero)	# load 5.0
	div.s 	$f3, $f2, $f3	# v^^3/3
	sub.s	$f6, $f0, $f3	# v - v^^3/3

	mul.s	$f4, $f1, $f2	# v^^5
	l.s	$f5, five($zero)	# load 3.0
	div.s 	$f5, $f4, $f5	# v^^5/5
	add.s	$f6, $f6, $f5	# value = v - v^^3/3 + v^^5/5

	l.s	$f8, PI($zero)		# load PI
	div.s	$f6, $f6, $f8	# value / PI
	l.s	$f7, F180($zero)	# load 180.0
	mul.s	$f6, $f6, $f7	# 180.0 * value / PI

	cvt.w.s $f6, $f6	# convert "delta" back to integer
	mfc1	$t0, $f6
	add	$v0, $v0, $t0	# angle += delta

	jr 	$ra

# ----------------------------------------------------------
# This next section is dedicated to the functions that belong to the debug environment
# Author: John McConnell
# The labels used in this section include
# ----------------------------------------------------------

# Print the data of a memory address $a0 = @ of the data, $a1 = size of the data in bytes
# the function will step by 4 printing data from the memory address until it has stepped $a1 / 4 times

# ALL your code goes below this line.
#
# We will delete EVERYTHING above the line; DO NOT delete the line.
#
# ---------------------------------------------------------------------

initialize:
     	li	$t4, 0xb001               	# Or(timer, bonk, scan, global)

     	mtc0   	$t4, $12                   	# set interrupt mask (Status register)
     
      	#li      $t0, 0x96		       	# this is performing a scan
      	#sw      $t0, 0xffff0050($zero)
      	#sw      $t0, 0xffff0054($zero)
      	#li      $t0, 0x19
      	#sw      $t0, 0xffff0058($zero)
      	#la      $t0, scan_data
     	#sw      $t0, 0xffff005c($zero)  

	la	$t0, is_scanning
	li	$t1, 1
	sw	$t1, 0($t0)

	j	preform_next_scan

	jr	$ra

.kdata                 # interrupt handler data (separated just for readability)
chunkIH:.space 30      # space for 16 registers

#-----------------------------------------------------------
# This section is dedicated for strings to be printed by syscall
# the labels used are defined below
# End of string sections
#----------------------------------------------------------


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
	#sw 	$a0, 16($k0)			# saving register $a0
	#sw 	$v0, 20($k0)			# saving register $v0


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


      	j       done

bonk_interrupt:
      	sw      $t0, 0xffff0060($zero)   	# acknowledge interrupt

      	jal     bounce	       			# Bounce

      	j       interrupt_dispatch       	# see if other interrupts are waiting

timer_interrupt:
      	sw      $t0, 0xffff006c($zero)  	# acknowledge interrupt

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
      
	la	$t0, data_ready
	li	$t1, 1
	sw	$t1, 0($t0)
	
	la	$t0, is_scanning
	sw	$zero, 0($t0)	

	#la	$t0, state			# make state == 32
	li	$s0, 2
	#sw	$t1, 0($t0)

skip_sort_data:
      	j	interrupt_dispatch
non_intrpt:                            		# was some non-interrupt

      	li      $v0, 4
      	la      $a0, non_intrpt_str
      	syscall                         	# print out an error message
      	
	# fall through to done
done:
      	la     	$k0, chunkIH                	# $k0 is the kernel pointer
	lw 	$t0, 0($k0)			# loading register $t0
	lw 	$t1, 4($k0)			# loading register $t1
	lw 	$t2, 8($k0)			# loading register $t2
	lw 	$ra, 12($k0)			# loading register $ra
	#lw 	$a0, 16($k0)			# loading register $a0
	#lw 	$v0, 20($k0)			# loading register $v0

     	mfc0    $k0, $14                 	# Exception Program Counter (PC)
.set noat
      	move    $at, $k1                 	# Restore $at
.set at 
      	rfe   
      	jr      $k0
      	nop

bounce:	
	lw	$t0, 0xffff0014($zero)
	addi	$t0, $t0, 135
	sw     	$t0, 0xffff0014($zero)  #set angle to new_angle
	
	li     	$t0, 0 
	sw     	$t0, 0xffff0018($zero)	#set orientation control = 1 (absolute)
	
	sw     	$zero, 0xffff0010($zero)	#set velocity to 10
	
	jr      $ra

	










