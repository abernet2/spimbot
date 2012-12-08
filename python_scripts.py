##for x in range(0, 60, 4):
##	print "\tla \t$t0, output"
##	print "\tlw \t$t3, " + str(x) + "($t0)"
##	print "\tjal \tprint_register_t3"
##
##for x in range(0, 112, 8):
##	print "\taddi \t $s0, $s0, 8"
##	print "\tmove \t $a0, $s0" 
##	print "\tjal \t sort_list"
##	print "\tadd \t $a0, $s0, $zero"
##	print "\tjal \t compact"
##	print "\taddi \t $s1, $s1, 4"
##	print "\tsw \t $v0, 0($s1)"

def print_t_registers():
    regs = []
    for x in range(0,10):
        reg = '$t'+str(x)
        regs.append(reg)
        print reg
    return regs
def print_s_registers():
    regs = []
    for x in range(0, 8):
        reg = '$s'+str(x)
        regs.append(reg)
        print reg
    return regs
def print_a_registers():
    regs = []
    for x in range(0,4):
        reg = '$a'+str(x)
        regs.append(reg)
        print reg
    return regs
def print_v_registers():
    regs = []
    for x in range(0,2):
        reg = '$v'+str(x)
        regs.append(reg)
        print reg
    return regs
def print_all_registers():
    all_regs = []
    for reg in print_a_registers():
        all_regs.append(reg)
    for reg in print_t_registers():
        all_regs.append(reg)
    for reg in print_s_registers():
        all_regs.append(reg)
    for reg in print_v_registers():
        all_regs.append(reg)
    return all_regs
def print_print_functions(all_regs):
    for reg in all_regs:
        print 'print_register_'+reg.replace('$','')+':'
        print '\tsub \t$sp, $sp, 12 \t # save $a0 and $v0 on stack'
        print '\tsw \t$ra, 0($sp)'
        print '\tsw \t$v0, 4($sp)'
        print '\tsw \t$a0, 8($sp)'
        print ''
        print '\tli \t$v0, 4'
        print '\tla \t$a0, print_reg_'+reg.replace('$','')+'_str'
        print '\tsyscall'
        print '\tmove \t$a0, '+reg
        print '\tjal \tprint_register'
        print ''
        print '\tlw \t$ra, 0($sp)'
        print '\tlw \t$v0, 4($sp)'
        print '\tlw \t$a0, 8($sp)'
        print '\tadd \t$sp, $sp, 12'
        print '\tjr \t$ra'
all_regs = print_all_registers()
print_print_functions(all_regs)

        
