### Need to set aside room for output
.data         # Data segment
output: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,   # output array, 15 x 32 bits 0f 0

.text		# Text segment
# args(listhead, output array head?);
#	$a0 == listhead
sort_and_extract:
	#move	$t0, $a0		# turns t0 into walker variable
	addi	$t1, $a0, 112   # t1 == endpoint of loop
	move	$t2, output		# t2 == head of output super array
	sub	$sp, $sp, 16        # since its not recursive, we'll do this before the loops
	
big_for_loop:			# start of over-arching for loop
	beq		$a0, $t1, end_big_loop
	# save registers (t0, t1, t2, a0)
	 sw		$a0, 0($sp)
	 sw		$t1, 4($sp)
	 sw		$t2, 8($sp)
	 #sw		$a0, 12($sp)
	 sw		$ra, 12($sp)
	#move $a0, $t0
 jal		sort_list
	# restore registers, but don't fix stack pointer
	 lw		$a0, 0($sp)
	 lw		$t2, 8($sp)
	 lw		$ra, 12($sp)
	 #move $a0, $t0
	 li $a1, 32
	 move $a2, $t2
 jal		compact(head, 32, start of output array)
	# restore registers
	 lw		$a0, 0($sp)
	 lw		$t1, 4($sp)
	 lw		$t2, 8($sp)
	 #lw		$a0, 12($sp)
	 lw		$ra, 12($sp)
	# increment things
	 addi	$a0, $a0, 8		# steps to next entry in array
	 addi	$t2, $t2, 8		# steps to next sub-array of output
	 
j	big_for_loop
	
end_big_loop:
	add $sp, $sp, 16
	j	$ra
	 

#---------------------------------------------
#	Things needed for sort
#---------------------------------------------

#------------------
#  Remove Element
#------------------
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
	
#---------
#  Sort
#---------	
sort_list:  # $a0 = mylist
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
# $a0 = base_address(bool), $a1 = length, $a2 = base_address(word[])

  li   $t0, 0           # $t0 = boolIndex, initialized to 0 
  li   $t1, 0x80000000  # $t1 = mask, initialized to 1 << 31 

compact_loop:
  bge  $t0, $a1, compact_done

  lw   $t2, 0($a0)      # $t2 = bool[boolIndex]
  lw   $t3, 0($a2)      # $t3 = word[wordIndex]
  beq  $t2, $zero, compact_else_case
  or   $t3, $t3, $t1    # t3 |= mask
  j    compact_endif

compact_else_case:
  not  $t4, $t1         # can re-use $t2 instead of using $t4
  and  $t3, $t3, $t4    # t3 &= ~mask

compact_endif:
  sw   $t3, 0($a2)      # word[wordIndex] = t3
  srl  $t1, $t1, 1      # mask = mask >> 1

  bne  $t1, $zero, compact_loop_maintainance
  addi $a2, $a2, 4      # advance word array pointer
  li   $t1, 0x80000000  # reset mask

compact_loop_maintainance:
  addi $t0, $t0, 1      # increment boolIndex
  lw   $a0, 8($a0)      # advance walker to walker->next
  j    compact_loop

compact_done:
  jr   $ra              # return
