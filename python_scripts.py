import re

##for x in range(0, 60, 4):
##	print "\tla \t$t0, output"
##	print "\tlw \t$t3, " + str(x) + "($t0)"
##	print "\tjal \tprint_register_t3"
##
for x in range(0, 112, 8):
    print "\taddi \t$t4, $t4, 8"
    print "\tmove \t$a0, $t4" 
    print "\tjal \tsort_list"
    print "\tadd \t$a0, $t4, $zero"
    print "\tjal \tcompact"
    print "\taddi \t$t5, $t5, 4"
    print "\tsw \t$v0, 0($t5)"
    print"\tjal \tvalid_x_y"
    print "\tbeq \t$v0, $zero, finish_sort_and_extract"
    print "\t\t\t#Next"

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
def print_load_save_register(regs, kernel=False):
    x = 0
    size = len(regs) * 4
    p = '$sp' #p for pointer
    if kernel:
        p = '$k0'
    print '\tsub \t'+p+', '+p+', '+str(size)+'\t# adjust/substract stackpointer'
    for reg in regs:
        print '\tsw \t'+reg+', '+str(x)+'('+p+')\t# saving register '+reg
        x = x + 4
    print ''
    x = 0
    for reg in regs:
        print '\tlw \t'+reg+', '+str(x)+'('+p+')\t# loading register '+reg
        x = x + 4
    print '\taddi \t'+p+', '+p+', '+ str(size)+'\t# add/restore stackpointer'
def print_grid_data(grid_length):
    box_array = {}
    mult = 300 / grid_length
    row_length = 20 * grid_length
    array_size = row_length * grid_length
    count = 0
    string = 'map_grid:'
    for y in range(0, grid_length):
        print '\t\t###### New Row ######'
        for x in range(0, grid_length):
            string += '\t.word '+str(y * mult)
            string += ', '+str((y * mult) + (mult - 1))
            string += ', '+str(x * mult)
            string += ', '+str((x * mult) + (mult - 1))
            string += ', 0,'
            string += '\t # this is '+str(count+1)+'th element, grid location is '+str(count * 20)+'(map_grid)'
            box_array[count+1] = string
            print string
            count = count+1
            string = '\t'
    return box_array
def sort_grid_data(grid):
    data = []
    length = int(len(grid) ** .5)
    half_length =  length / 2 + length % 2
    middle_key = ((half_length - 1) * length) + half_length
    key = middle_key
    for x in range(2, length + 2, 2):
        key, r_data = walk(key, length, x, grid)
        key -= (length + 1)
        for item in r_data:
            data.append(item)
    return data
    #print 'sorted_map_grid:\t'
    #for string in data:
        #print string
def walk(key, length, distance, grid):
    data = []
    o_key = key
    for x in range(1, distance):
        key = key + length
        data.append(grid[key])
    for x in range(1, distance):
        key = key + 1
        data.append(grid[key])
    for x in range(1, distance):
        key = key - length
        data.append(grid[key])
    for x in range(1, distance):
        key = key - 1
        data.append(grid[key])
    return o_key, data

def print_grid(length):
    for x in range(0,length):
        string = '\t'
        for y in range(1,length+1):
            string += str(length * x + y)+','
        print string
def tokensToData(tokens):
    data = []
    for s in tokens.split(', '):
        data.append(s)
    return data
def correct_tokens():
    data = []
    string = "983082, 7078068, 16384096, 5963996, 4391182, 2752620, 11796730, 14418011, 6291523, 17694735, 9175072, 13172886, 2097353, 9830540, 11796660"
    for s in string.split(', '):
        data.append(s)
    return data
def check_tokens(tokens):
    values = {}
    tokenData = tokensToData(tokens)
    counter = 0
    for s in tokenData:
        if s in correct_tokens():
            values[counter] = s
        else:
            num = int(s)
            if (num & int('0xffff',16) <= 300) and (num >> 16 <= 300):
                print 'invalid number!!!' + str(num)
        counter += 1
    return values
def check_all_tokens(strings):
    for tokens in strings:
        print check_tokens(tokens)
def parse_raw_tokens(tokens):
    data = []
    tokens = tokens.replace("Printing data in memory: ", '|')
    tokens = tokens.replace("scanner interrupt exception\n",'')
    tokens = tokens.split('|')
    for line in tokens:
        line = line.rstrip(', \n')
        if line is not '':
            data.append(line)
    return data
    
tokens = ["983082, 7078068, 16384096, 5963996, 4391182, 2752620, 11796730, 14418011, 6291523, 17694735, 9175072, 13172886, 2097353, 9830540, 11796660", 
        "446826946, 138976252, 1677257291, 34754322, 2014552792, 502146567, 1420307655, 1849519148, 1573183909, 2083507181, 254511757, 1867833580, 1989496138, 1178161984, 1616611502", 
        "1237352874, 569540174, 1816367400, 1604301265, 630808365, 1187721431, 677082641, 1429756755, 911142640, 1893829366, 256186630, 1398258512, 1534864813, 935462728, 1679064086", 
        "9830540, 1507246593, 899758758, 2048455304, 1453427056, 1043195430, 580565698, 1340074561, 1479721485, 663938857, 512117267, 1104390937, 253125469, 1944153734, 2093466641", 
        "9830540, 716593894, 1196927702, 538889856, 757975798, 368102439, 1715417968, 243477878, 675640083, 339687830, 1344388496, 1357714291, 1373268324, 1002824058, 2113656028", 
        "1089602121, 2131786490, 1555249326, 2043176649, 991185012, 816176687, 1946921635, 1536525238, 963416900, 744890288, 1751494274, 1095864672, 2068185293, 1335026362, 1070762617", 
        "7078068, 1296319890, 1132552318, 1708320775, 1905606013, 183134729, 1244608154, 1300135701, 479542302, 1931016951, 2010520554, 1935414804, 1188057427, 1510094539, 976186402", 
        "7078068, 398875591, 1444961692, 1785564816, 137511852, 1969902955, 247278521, 1134446244, 1665867435, 1058660691, 931389738, 1179569239, 120475605, 741922739, 1450100074", 
        "621399319, 1567371747, 26798946, 1735478315, 386013790, 2131487264, 244906756, 1927765127, 1196180287, 142230035, 164215186, 499866325, 1613416626, 1750310402, 1063396863", 
        "219958911, 1159051154, 1010534495, 199148723, 178892692, 285901744, 7010150, 991504516, 1358181114, 804577269, 178493869, 288875576, 2082946722, 1291546439, 934159354", 
        "794166599, 865688414, 388387907, 2091897602, 1681129930, 320379878, 298274888, 1766631558, 976849003, 1806169562, 617321191, 1743417495, 1996152592, 1019737308, 392472043", 
        "13172886, 1075498877, 457580817, 1446123012, 867327204, 377103120, 188788351, 288627815, 919122900, 1611358653, 1439171527, 1214535709, 1579795873, 2072010443, 1892486293", 
        "13172886, 1097379997, 1975792616, 1116516352, 117205614, 1838101045, 361914115, 177372792, 547934284, 1582683843, 67540762, 1321135623, 1369179097, 1777468830, 1087543428", 
        "2025868156, 121989028, 1419467854, 1513527725, 544298690, 265115855, 472139562, 856347956, 2084910433, 1781960453, 287912897, 865874137, 231366398, 233814841, 40455992", 
        "1451170378, 1880963527, 1449419966, 1441790383, 514818565, 1656154050, 557534064, 506101803, 701077633, 208076265, 867294433, 695454243, 1169878275, 1586045881, 1610120612", 
        "101821654, 137167026, 1635391825, 1485169784, 693652610, 577415942, 1760330610, 4474674, 2134303509, 1215662336, 173360142, 1048354711, 1160703534, 1392724103, 1877117327"]

new_tokens = """
scanner interrupt exception
Printing data in memory: 983082, 7078068, 16384096, 5963996, 4391182, 2752620, 11796730, 14418011, 6291523, 17694735, 9175072, 13172886, 2097353, 9830540, 11796660, 
scanner interrupt exception
Printing data in memory: 840511330, 1163958193, 891673524, 1720513414, 35249977, 979813839, 1651291018, 1197907250, 277874547, 935494213, 1316478467, 1607337709, 1456578237, 1087811298, 1334996830, 
scanner interrupt exception
Printing data in memory: 1464816962, 1208156254, 514879360, 480691848, 5468190, 2020189559, 727604243, 1262757695, 1835141672, 1656975971, 1634240004, 134665410, 63654172, 1867046207, 1544827655, 
scanner interrupt exception
Printing data in memory: 9830540, 848491029, 1103423806, 678061896, 1590799543, 1573410797, 1442986743, 690120304, 868243198, 1222067413, 1818335154, 2016380138, 839889137, 1991954850, 577585260, 
scanner interrupt exception
Printing data in memory: 9830540, 525833837, 2042200508, 904047303, 131786811, 749385487, 1163185543, 1831472872, 1765803358, 1566324070, 611148092, 475387078, 150912745, 1971829843, 969814536, 
scanner interrupt exception
Printing data in memory: 1604319093, 1888654547, 601280314, 1784086468, 581438745, 1479289108, 1038054092, 1396359790, 978848632, 245122449, 2110327345, 357457689, 1598410805, 650843441, 148369105, 
scanner interrupt exception
Printing data in memory: 7078068, 6431864, 1643513832, 1405838604, 1556228083, 1052111994, 237767814, 2037372990, 1810829654, 600765535, 1189449676, 1232015622, 1305774894, 1821186507, 1104299610, 
scanner interrupt exception
Printing data in memory: 7078068, 173962655, 1871736529, 1830284964, 1354987881, 350976558, 908171589, 924543950, 174586932, 1580509684, 1178416087, 620594838, 141068216, 1825679014, 793358898, 
scanner interrupt exception
Printing data in memory: 838270364, 1998871019, 1034811129, 1903981587, 1345505673, 178695218, 588607453, 465268584, 1088824205, 742952099, 823487524, 1698408194, 1311230512, 1224572857, 998372897, 
scanner interrupt exception
Printing data in memory: 79928731, 296402603, 1367848270, 1832883933, 112423356, 1305469657, 1143916962, 572111841, 215726765, 512009854, 348698466, 1992452802, 1702891309, 1630830268, 1143251348, 
scanner interrupt exception
Printing data in memory: 860001091, 1145467652, 1806552072, 516300699, 1815391408, 302401756, 1003117627, 1320892141, 217541590, 1002993249, 59952542, 325381421, 179153774, 1375361546, 1380054924, 
scanner interrupt exception
Printing data in memory: 13172886, 1376034884, 1991107583, 2081128440, 1699119944, 2057373239, 788004621, 1132235092, 1521510039, 896369494, 1441058189, 223376823, 9808956, 676734180, 1331038747, 
scanner interrupt exception
Printing data in memory: 13172886, 939408683, 168676152, 1626144206, 638619562, 1711667834, 1890127364, 1752495172, 1131231965, 860850051, 1139872543, 346363038, 860388861, 1044962166, 319362665, 
scanner interrupt exception
Printing data in memory: 1665739991, 70853720, 90941737, 747978251, 1005803745, 1682713847, 413876582, 1410076811, 1249073775, 1817998433, 115739595, 464309406, 1286804991, 1636731511, 1221881227, 
scanner interrupt exception
Printing data in memory: 1407649101, 726246403, 1260595574, 1908538724, 122469554, 270529787, 1569356649, 1707383125, 690109901, 2130104524, 1092004819, 68268244, 332517091, 821756592, 1199842777, 
scanner interrupt exception
Printing data in memory: 53149260, 825286886, 450570373, 81353623, 1697385476, 401812164, 1274252376, 1348613582, 684740319, 1981531154, 1711102720, 1458238232, 1549528532, 1360155066, 1074797045, 
scanner interrupt exception
Printing data in memory: 784595121, 196433776, 848485225, 2044578012, 1746299271, 116872958, 1369680494, 312163044, 1387755188, 258758337, 623712438, 1899365596, 1233388734, 1982643801, 97629228, 
scanner interrupt exception
Printing data in memory: 1551080013, 1602480998, 1893034166, 178568413, 1135110164, 634827846, 989639301, 1251696782, 1109630561, 710759862, 924118218, 985617516, 446150703, 1178043333, 435745948, 
scanner interrupt exception
Printing data in memory: 1780017857, 1140781934, 1938866283, 1533542937, 1081905104, 409692579, 1737360976, 94472411, 2036719298, 168726537, 1744992514, 1686835411, 1255036248, 1664292290, 1087394924, 
scanner interrupt exception
Printing data in memory: 2122362965, 548527114, 1313750501, 1399216086, 208848366, 1232915502, 1761069129, 1002602065, 480252424, 551993620, 2007914227, 744229132, 1135351651, 572050533, 255561038, 
scanner interrupt exception
Printing data in memory: 1520257500, 465143520, 1694040609, 202947426, 729093697, 1884983413, 1692955546, 2098304243, 211131298, 892072214, 1989853579, 372271955, 1407350572, 40838289, 1532923798, 
scanner interrupt exception
Printing data in memory: 5963996, 1922709873, 1459356584, 1513810335, 1667383359, 39947679, 1585559532, 1361364634, 1059535059, 1107794958, 1351995055, 1539949672, 1727641775, 628963770, 1012285741, 
scanner interrupt exception
Printing data in memory: 5963996, 62606784, 1525289691, 620049558, 857484958, 1056580678, 160868772, 449979716, 1515254844, 699744616, 275230950, 965319073, 1424603220, 1971685703, 1986825187, 
scanner interrupt exception
Printing data in memory: 1343589299, 146725789, 1747778742, 158020801, 1417471014, 110238556, 1738264422, 261374639, 1656173714, 1936193641, 1587468906, 1752672323, 406165251, 1099738483, 2127187543, 
scanner interrupt exception
Printing data in memory: 1676090405, 570869417, 649878320, 931426260, 1343087737, 1098523246, 678275550, 617955591, 1035869140, 1346345275, 757506581, 586451330, 1962227476, 266033823, 1234600974, 
scanner interrupt exception
Printing data in memory: 1252007538, 1950152758, 640760145, 2079813954, 1486729510, 1255181959, 2068802519, 1556857692, 1353588965, 2141859660, 335042243, 1732631511, 1951898481, 848562131, 531116274, 
scanner interrupt exception
Printing data in memory: 422682505, 2116177849, 148767453, 2025529997, 1113951555, 1230420939, 1137263296, 1713861493, 426467526, 705777109, 484776133, 633963896, 320232219, 390783886, 299665503, 
scanner interrupt exception
Printing data in memory: 1350515336, 1565716512, 1926925170, 868769097, 747665320, 1161200144, 1819406205, 1881425495, 1292863508, 563573031, 855550758, 2089333582, 443545497, 2141951680, 1474297259, 
scanner interrupt exception
Printing data in memory: 2090435836, 304748720, 83615632, 592412764, 1413991637, 228631027, 976642644, 1471864571, 1353738440, 1160889768, 665133863, 2141060802, 781641157, 1593093038, 663847761, 
scanner interrupt exception
Printing data in memory: 1760854808, 1683937556, 179210612, 604919187, 1320370583, 988026444, 1129161250, 899543337, 1081011149, 847077549, 2102092055, 1386931221, 318628347, 514549438, 1444230872, 
scanner interrupt exception
Printing data in memory: 14418011, 543218458, 1312668949, 961704935, 2008819528, 1728387246, 1623876825, 1601519728, 522740138, 705657204, 368773350, 1457250988, 1627149488, 1275213144, 733169667, 
scanner interrupt exception
Printing data in memory: 14418011, 1109522202, 281899820, 351646492, 1028633060, 292541063, 278631389, 768045647, 2131885537, 723064204, 616458976, 748320131, 1479622849, 336835283, 845567017, 
scanner interrupt exception
"""

def filter_data(data):
    r_data = []
    p = re.compile('([0-9]*\(map_grid\))')
    for string in data:
        find = p.search(string)
        if find:
            r_data.append(find.group().replace('(map_grid)','')+',')
    return r_data
def print_offset_map(data):
    print 'sorted_map_offsets:'
    count = 0
    line = ''
    for string in data:
        line += string
        count += 1
        if count == 9:
            print '\t\t.word\t' + line
            line = ''
            count = 0
# ll_regs = print_all_registers()
# print_load_save_register(['$t0','$t1','$t2','$ra','$a0','$v0'],True)
# print_offset_map(filter_data(sort_grid_data(print_grid_data(10))))
# print_grid(10)
#check_all_tokens(parse_raw_tokens(new_tokens))
    




        
