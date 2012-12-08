# SPIMbot MMIO
velocity	 = 0xffff0010	 # -10 to 10, Immediately updates SPIMbot's velocity
angle		 = 0xffff0014	 # -360 to 360, used when orientation_control is written to turn SPIMbot
angle_type	 = 0xffff0018	 # 0 relative, 1 absolute
time		 = 0xffff001c	 # 0 to 0xffffffff, reading gives the number of elapsed cycles, writing requests an interrupt at given time
x_loc		 = 0xffff0020	 # 0 to 300, gives SPIMbot's x coord
y_loc		 = 0xffff0024	 # 0 to 300, gives SPIMbot's y coord
scan_x       = 0xffff0050    # 0 t0 300, x-coord for scan
scan_y       = 0xffff0054    # 0 to 300, y-coord for scan
scan_radius  = 0xffff0058    # 0 to 300 scan radius
scan_address = 0xffff005c    # Must be written to to perform scan
print_int	 = 0xffff0080	 # Prints an int to the screen
print_float	 = 0xffff0084	 # Prints a float to the screen
print_hex    = 0xffff0088    # Prints a hex to the screen
other_bot_x  = 0xffff00a0    # Other Bot's x coord
other_bot_y  = 0xffff00a4    # Other Bot's y coord

get_token_loc:                  	# get_token_loc(int n, int[] a)
    	li    $t0, 0                	# v0 = x, v1 = y

array_search:
	beq   $a0, $t0, array_found
	add   $a1, $a1, 8
	add   $t0, $t0, 1
	j     array_search

array_found:
    	lw    $a1, 0($a1)             # Loads 32-bit integer into a1
	li    $t1, 300                # Bound of acceptable behavior
    	li    $t0, 0x0000ffff         # Probably check my syntax on this one
	li    $t2, 0x80000000         # Sets most significant bit to 1, will AND for invalid values
x_check:
	and   $v0, $t0, $a1           # returns 1st 16 bits as x value
	ble   $v0, $t1, y_check       # checks if the x value is acceptable
	and   $v0, $t2, $v0           # sets return value unacceptable bit

y_check:
	srl   $v1, $a1, 16            # shifts right the 32 bits
	ble   $v1, $t1, end_get_token # checks y validity
	and   $v1, $t1, $v1           # sets to invalid

end_get_token:
    j $ra
         
