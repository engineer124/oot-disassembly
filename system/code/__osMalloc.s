

.section .text
func_800CDD90:
# MqDbg: 
# Creates Memory Free List with one node, and attaches it
# A0 = Free List Manager
# A1 = Start Address
# A2 = Size
    addiu   v0, a1, 0x000F             # v0 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     v0, v0, $at
    subu    t6, v0, a1
    subu    a2, a2, t6
    and     a2, a2, $at
    addiu   t7, a2, 0xFFD0             # t7 = FFFFFFD0
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   t9, $zero, 0x7373          # t9 = 00007373
    sw      $zero, 0x0008(v0)          # 00000017
    sw      $zero, 0x000C(v0)          # 0000001B
    sw      t7, 0x0004(v0)             # 00000013
    sh      t8, 0x0002(v0)             # 00000011
    sh      t9, 0x0000(v0)             # 0000000F
    sw      v0, 0x0000(a0)             # 00000000
    sw      a1, 0x0004(a0)             # 00000004
    jr      $ra
    sw      a2, 0x0008(a0)             # 00000008


func_800CDDD8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CDDF8:
# MqDbg: 
    lw      v0, 0x0004(a0)             # 00000004
    jr      $ra
    sltu    v0, $zero, v0


func_800CDE04:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    lw      t0, 0x0000(a0)             # 00000000
    addiu   t2, $zero, 0xFFF0          # t2 = FFFFFFF0
    addiu   t6, a1, 0x000F             # t6 = 0000000F
    or      t1, $zero, $zero           # t1 = 00000000
    beq     t0, $zero, lbl_800CDEE4
    and     a1, t6, t2
    lh      t8, 0x0002(t0)             # 00000002
lbl_800CDE2C:
    beql    t8, $zero, lbl_800CDEDC
    lw      t0, 0x0008(t0)             # 00000008
    lw      v0, 0x0004(t0)             # 00000004
    sltu    $at, v0, a1
    bne     $at, $zero, lbl_800CDED8
    addiu   t9, a1, 0x000F             # t9 = 0000000F
    and     v1, t9, t2
    addiu   v1, v1, 0x0030             # v1 = 00000030
    sltu    $at, v1, v0
    beq     $at, $zero, lbl_800CDE98
    addu    v0, t0, v1
    lw      t3, 0x0008(t0)             # 00000008
    sw      t0, 0x000C(v0)             # 0000000C
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      t3, 0x0008(v0)             # 00000008
    lw      t4, 0x0004(t0)             # 00000004
    addiu   t7, $zero, 0x7373          # t7 = 00007373
    sh      t6, 0x0002(v0)             # 00000002
    subu    t5, t4, v1
    sw      t5, 0x0004(v0)             # 00000004
    sh      t7, 0x0000(v0)             # 00000000
    sw      v0, 0x0008(t0)             # 00000008
    sw      a1, 0x0004(t0)             # 00000004
    lw      a0, 0x0008(v0)             # 00000008
    beql    a0, $zero, lbl_800CDE9C
    sh      $zero, 0x0002(t0)          # 00000002
    sw      v0, 0x000C(a0)             # 0000000C
lbl_800CDE98:
    sh      $zero, 0x0002(t0)          # 00000002
lbl_800CDE9C:
    sw      a2, 0x0010(t0)             # 00000010
    sw      a3, 0x0014(t0)             # 00000014
    sw      t0, 0x001C($sp)
    jal     func_80003CA0              # osGetThreadId
    or      a0, $zero, $zero           # a0 = 00000000
    lw      t0, 0x001C($sp)
    sw      v0, 0x0018(t0)             # 00000018
    lw      t8, 0x0020($sp)
    jal     func_800048C0              # osGetTime
    sw      t8, 0x001C(t0)             # 0000001C
    lw      t0, 0x001C($sp)
    sw      v0, 0x0020(t0)             # 00000020
    sw      v1, 0x0024(t0)             # 00000024
    b       lbl_800CDEE4
    addiu   t1, t0, 0x0030             # t1 = 00000030
lbl_800CDED8:
    lw      t0, 0x0008(t0)             # 00000008
lbl_800CDEDC:
    bnel    t0, $zero, lbl_800CDE2C
    lh      t8, 0x0002(t0)             # 00000002
lbl_800CDEE4:
    bne     t1, $zero, lbl_800CDF0C
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x5450             # v0 = 80105450
    lw      t9, 0x0000(v0)             # 80105450
    lw      t4, 0x0020($sp)
    addiu   t3, t9, 0x0001             # t3 = 00000001
    sw      t3, 0x0000(v0)             # 80105450
    lbu     t5, 0x000C(t4)             # 0000000C
    addiu   t6, t5, 0x0001             # t6 = 00000001
    sb      t6, 0x000C(t4)             # 0000000C
lbl_800CDF0C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, t1, $zero              # v0 = 00000030
    jr      $ra
    nop


func_800CDF20:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    lw      t0, 0x0000(a0)             # 00000000
    addiu   t2, $zero, 0xFFF0          # t2 = FFFFFFF0
    addiu   t6, a1, 0x000F             # t6 = 0000000F
    lw      v0, 0x0008(t0)             # 00000008
    and     a1, t6, t2
    or      t1, $zero, $zero           # t1 = 00000000
    beq     v0, $zero, lbl_800CDF60
    addiu   t9, a1, 0x000F             # t9 = 0000000F
    or      t0, v0, $zero              # t0 = 00000000
lbl_800CDF54:
    lw      v0, 0x0008(v0)             # 00000008
    bnel    v0, $zero, lbl_800CDF54
    or      t0, v0, $zero              # t0 = 00000000
lbl_800CDF60:
    beq     t0, $zero, lbl_800CE024
    and     a0, t9, t2
    lh      t8, 0x0002(t0)             # 00000002
lbl_800CDF6C:
    beql    t8, $zero, lbl_800CE01C
    lw      t0, 0x000C(t0)             # 0000000C
    lw      v0, 0x0004(t0)             # 00000004
    sltu    $at, v0, a1
    bnel    $at, $zero, lbl_800CE01C
    lw      t0, 0x000C(t0)             # 0000000C
    addiu   a0, a0, 0x0030             # a0 = 00000030
    sltu    $at, a0, v0
    beq     $at, $zero, lbl_800CDFD4
    addu    t3, t0, v0
    lw      t4, 0x0008(t0)             # 00000008
    subu    v1, t3, a1
    addiu   t5, $zero, 0x7373          # t5 = 00007373
    sw      t0, 0x000C(v1)             # 0000000C
    sw      a1, 0x0004(v1)             # 00000004
    sh      t5, 0x0000(v1)             # 00000000
    sw      t4, 0x0008(v1)             # 00000008
    lw      t6, 0x0004(t0)             # 00000004
    sw      v1, 0x0008(t0)             # 00000008
    subu    t7, t6, a0
    sw      t7, 0x0004(t0)             # 00000004
    lw      a2, 0x0008(v1)             # 00000008
    or      t0, v1, $zero              # t0 = 00000000
    beq     a2, $zero, lbl_800CDFD4
    nop
    sw      v1, 0x000C(a2)             # 0000000C
lbl_800CDFD4:
    sh      $zero, 0x0002(t0)          # 00000002
    lw      t8, 0x0028($sp)
    sw      a3, 0x0014(t0)             # 00000014
    or      a0, $zero, $zero           # a0 = 00000000
    sw      t8, 0x0010(t0)             # 00000010
    jal     func_80003CA0              # osGetThreadId
    sw      t0, 0x001C($sp)
    lw      t0, 0x001C($sp)
    sw      v0, 0x0018(t0)             # 00000018
    lw      t9, 0x0020($sp)
    jal     func_800048C0              # osGetTime
    sw      t9, 0x001C(t0)             # 0000001C
    lw      t0, 0x001C($sp)
    sw      v0, 0x0020(t0)             # 00000020
    sw      v1, 0x0024(t0)             # 00000024
    b       lbl_800CE024
    addiu   t1, t0, 0x0030             # t1 = 00000030
    lw      t0, 0x000C(t0)             # 0000000C
lbl_800CE01C:
    bnel    t0, $zero, lbl_800CDF6C
    lh      t8, 0x0002(t0)             # 00000002
lbl_800CE024:
    bne     t1, $zero, lbl_800CE04C
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x5450             # v0 = 80105450
    lw      t3, 0x0000(v0)             # 80105450
    lw      t5, 0x0020($sp)
    addiu   t4, t3, 0x0001             # t4 = 00000001
    sw      t4, 0x0000(v0)             # 80105450
    lbu     t6, 0x000C(t5)             # 0000000C
    addiu   t7, t6, 0x0001             # t7 = 00000001
    sb      t7, 0x000C(t5)             # 0000000C
lbl_800CE04C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, t1, $zero              # v0 = 00000030
    jr      $ra
    nop


func_800CE060:
# MqDbg: 
# osMalloc?
# Allocate memory on free list (head end)
# A0 = Free list reference pointer
# A1 = size to allocate
# V0 = ptr to allocated block
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    lw      a2, 0x0000(a0)             # 00000000
    addiu   t0, $zero, 0xFFF0          # t0 = FFFFFFF0
    addiu   t6, a1, 0x000F             # t6 = 0000000F
    or      a3, $zero, $zero           # a3 = 00000000
    beq     a2, $zero, lbl_800CE140
    and     a1, t6, t0
    lh      t8, 0x0002(a2)             # 00000002
lbl_800CE088:
    beql    t8, $zero, lbl_800CE138
    lw      a2, 0x0008(a2)             # 00000008
    lw      v0, 0x0004(a2)             # 00000004
    sltu    $at, v0, a1
    bne     $at, $zero, lbl_800CE134
    addiu   t9, a1, 0x000F             # t9 = 0000000F
    and     v1, t9, t0
    addiu   v1, v1, 0x0030             # v1 = 00000030
    sltu    $at, v1, v0
    beq     $at, $zero, lbl_800CE0F4
    addu    v0, a2, v1
    lw      t1, 0x0008(a2)             # 00000008
    sw      a2, 0x000C(v0)             # 0000000C
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sw      t1, 0x0008(v0)             # 00000008
    lw      t2, 0x0004(a2)             # 00000004
    addiu   t5, $zero, 0x7373          # t5 = 00007373
    sh      t4, 0x0002(v0)             # 00000002
    subu    t3, t2, v1
    sw      t3, 0x0004(v0)             # 00000004
    sh      t5, 0x0000(v0)             # 00000000
    sw      v0, 0x0008(a2)             # 00000008
    sw      a1, 0x0004(a2)             # 00000004
    lw      a0, 0x0008(v0)             # 00000008
    beql    a0, $zero, lbl_800CE0F8
    sh      $zero, 0x0002(a2)          # 00000002
    sw      v0, 0x000C(a0)             # 0000000C
lbl_800CE0F4:
    sh      $zero, 0x0002(a2)          # 00000002
lbl_800CE0F8:
    sw      $zero, 0x0010(a2)          # 00000010
    sw      $zero, 0x0014(a2)          # 00000014
    sw      a2, 0x001C($sp)
    jal     func_80003CA0              # osGetThreadId
    or      a0, $zero, $zero           # a0 = 00000000
    lw      a2, 0x001C($sp)
    sw      v0, 0x0018(a2)             # 00000018
    lw      t6, 0x0020($sp)
    jal     func_800048C0              # osGetTime
    sw      t6, 0x001C(a2)             # 0000001C
    lw      a2, 0x001C($sp)
    sw      v0, 0x0020(a2)             # 00000020
    sw      v1, 0x0024(a2)             # 00000024
    b       lbl_800CE140
    addiu   a3, a2, 0x0030             # a3 = 00000030
lbl_800CE134:
    lw      a2, 0x0008(a2)             # 00000008
lbl_800CE138:
    bnel    a2, $zero, lbl_800CE088
    lh      t8, 0x0002(a2)             # 00000002
lbl_800CE140:
    bne     a3, $zero, lbl_800CE168
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x5450             # v0 = 80105450
    lw      t7, 0x0000(v0)             # 80105450
    lw      t9, 0x0020($sp)
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sw      t8, 0x0000(v0)             # 80105450
    lbu     t1, 0x000C(t9)             # 0000000C
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x000C(t9)             # 0000000C
lbl_800CE168:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, a3, $zero              # v0 = 00000030
    jr      $ra
    nop


func_800CE17C:
# MqDbg: 
# Allocate memory on free list (tail end)
# A0 = Heap Reference Ptr
# A1 = Allocate Size
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    lw      a2, 0x0000(a0)             # 00000000
    addiu   t0, $zero, 0xFFF0          # t0 = FFFFFFF0
    addiu   t6, a1, 0x000F             # t6 = 0000000F
    lw      v0, 0x0008(a2)             # 00000008
    and     a1, t6, t0
    or      a3, $zero, $zero           # a3 = 00000000
    beq     v0, $zero, lbl_800CE1B8
    addiu   t9, a1, 0x000F             # t9 = 0000000F
    or      a2, v0, $zero              # a2 = 00000000
lbl_800CE1AC:
    lw      v0, 0x0008(v0)             # 00000008
    bnel    v0, $zero, lbl_800CE1AC
    or      a2, v0, $zero              # a2 = 00000000
lbl_800CE1B8:
    beq     a2, $zero, lbl_800CE278
    and     a0, t9, t0
    lh      t8, 0x0002(a2)             # 00000002
lbl_800CE1C4:
    beql    t8, $zero, lbl_800CE270
    lw      a2, 0x000C(a2)             # 0000000C
    lw      v0, 0x0004(a2)             # 00000004
    sltu    $at, v0, a1
    bnel    $at, $zero, lbl_800CE270
    lw      a2, 0x000C(a2)             # 0000000C
    addiu   a0, a0, 0x0030             # a0 = 00000030
    sltu    $at, a0, v0
    beq     $at, $zero, lbl_800CE22C
    addu    t1, a2, v0
    lw      t2, 0x0008(a2)             # 00000008
    subu    v1, t1, a1
    addiu   t3, $zero, 0x7373          # t3 = 00007373
    sw      a2, 0x000C(v1)             # 0000000C
    sw      a1, 0x0004(v1)             # 00000004
    sh      t3, 0x0000(v1)             # 00000000
    sw      t2, 0x0008(v1)             # 00000008
    lw      t4, 0x0004(a2)             # 00000004
    sw      v1, 0x0008(a2)             # 00000008
    subu    t5, t4, a0
    sw      t5, 0x0004(a2)             # 00000004
    lw      a3, 0x0008(v1)             # 00000008
    or      a2, v1, $zero              # a2 = 00000000
    beq     a3, $zero, lbl_800CE22C
    nop
    sw      v1, 0x000C(a3)             # 0000000C
lbl_800CE22C:
    sh      $zero, 0x0002(a2)          # 00000002
    sw      $zero, 0x0010(a2)          # 00000010
    sw      $zero, 0x0014(a2)          # 00000014
    sw      a2, 0x001C($sp)
    jal     func_80003CA0              # osGetThreadId
    or      a0, $zero, $zero           # a0 = 00000000
    lw      a2, 0x001C($sp)
    sw      v0, 0x0018(a2)             # 00000018
    lw      t6, 0x0020($sp)
    jal     func_800048C0              # osGetTime
    sw      t6, 0x001C(a2)             # 0000001C
    lw      a2, 0x001C($sp)
    sw      v0, 0x0020(a2)             # 00000020
    sw      v1, 0x0024(a2)             # 00000024
    b       lbl_800CE278
    addiu   a3, a2, 0x0030             # a3 = 00000030
    lw      a2, 0x000C(a2)             # 0000000C
lbl_800CE270:
    bnel    a2, $zero, lbl_800CE1C4
    lh      t8, 0x0002(a2)             # 00000002
lbl_800CE278:
    bne     a3, $zero, lbl_800CE2A0
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x5450             # v0 = 80105450
    lw      t7, 0x0000(v0)             # 80105450
    lw      t9, 0x0020($sp)
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sw      t8, 0x0000(v0)             # 80105450
    lbu     t1, 0x000C(t9)             # 0000000C
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x000C(t9)             # 0000000C
lbl_800CE2A0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, a3, $zero              # v0 = 00000030
    jr      $ra
    nop


func_800CE2B4:
# MqDbg: 
# osFree?
# Marks a memory node as being free for re-use, and combines if next to free nodes
# A0 = Free list reference pointer
# A1 = pointer to block to free (not the node)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    beq     a1, $zero, lbl_800CE3D4
    or      a3, a0, $zero              # a3 = 00000000
    lh      t6, -0x0030(a1)            # FFFFFFD0
    addiu   $at, $zero, 0x7373         # $at = 00007373
    addiu   a1, a1, 0xFFD0             # a1 = FFFFFFD0
    beq     t6, $at, lbl_800CE2E8
    lui     a0, 0x003F                 # a0 = 003F0000
    jal     func_80003CC0              # osSetIntMask
    ori     a0, a0, 0xFF01             # a0 = 003FFF01
    b       lbl_800CE3D8
    lw      $ra, 0x0014($sp)
lbl_800CE2E8:
    lh      t7, 0x0002(a1)             # 00000002
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    or      a0, $zero, $zero           # a0 = 00000000
    beql    t7, $zero, lbl_800CE314
    sh      t8, 0x0002(a1)             # 00000002
    lui     a0, 0x003F                 # a0 = 003F0000
    jal     func_80003CC0              # osSetIntMask
    ori     a0, a0, 0xFF01             # a0 = 003FFF01
    b       lbl_800CE3D8
    lw      $ra, 0x0014($sp)
    sh      t8, 0x0002(a1)             # 00000002
lbl_800CE314:
    sw      $zero, 0x0010(a1)          # 00000010
    sw      $zero, 0x0014(a1)          # 00000014
    sw      a3, 0x0028($sp)
    jal     func_80003CA0              # osGetThreadId
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    lw      a3, 0x0028($sp)
    sw      v0, 0x0018(a1)             # 00000018
    jal     func_800048C0              # osGetTime
    sw      a3, 0x001C(a1)             # 0000001C
    lw      a1, 0x0018($sp)
    lw      a0, 0x0008(a1)             # 00000008
    sw      v0, 0x0020(a1)             # 00000020
    sw      v1, 0x0024(a1)             # 00000024
    beql    a0, $zero, lbl_800CE394
    lw      v1, 0x000C(a1)             # 0000000C
    lh      t9, 0x0002(a0)             # 00000002
    or      v0, a0, $zero              # v0 = 00000000
    beql    t9, $zero, lbl_800CE394
    lw      v1, 0x000C(a1)             # 0000000C
    lw      v1, 0x0008(a0)             # 00000008
    beql    v1, $zero, lbl_800CE378
    lw      t0, 0x0004(a1)             # 00000004
    sw      a1, 0x000C(v1)             # 0000000C
    lw      t0, 0x0004(a1)             # 00000004
lbl_800CE378:
    lw      t1, 0x0004(v0)             # 00000004
    addu    t2, t0, t1
    addiu   t3, t2, 0x0030             # t3 = 00000030
    sw      t3, 0x0004(a1)             # 00000004
    lw      t4, 0x0008(v0)             # 00000008
    sw      t4, 0x0008(a1)             # 00000008
    lw      v1, 0x000C(a1)             # 0000000C
lbl_800CE394:
    beql    v1, $zero, lbl_800CE3D8
    lw      $ra, 0x0014($sp)
    lh      t5, 0x0002(v1)             # 00000002
    beql    t5, $zero, lbl_800CE3D8
    lw      $ra, 0x0014($sp)
    lw      t6, 0x0004(v1)             # 00000004
    lw      t7, 0x0004(a1)             # 00000004
    addu    t8, t6, t7
    addiu   t9, t8, 0x0030             # t9 = 00000030
    sw      t9, 0x0004(v1)             # 00000004
    lw      t0, 0x0008(a1)             # 00000008
    sw      t0, 0x0008(v1)             # 00000008
    lw      a0, 0x0008(a1)             # 00000008
    beql    a0, $zero, lbl_800CE3D8
    lw      $ra, 0x0014($sp)
    sw      v1, 0x000C(a0)             # 0000000C
lbl_800CE3D4:
    lw      $ra, 0x0014($sp)
lbl_800CE3D8:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800CE3E4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    beq     a1, $zero, lbl_800CE504
    sw      a1, 0x002C($sp)
    lh      t7, -0x0030(a1)            # FFFFFFD0
    addiu   $at, $zero, 0x7373         # $at = 00007373
    addiu   a1, a1, 0xFFD0             # a1 = FFFFFFD0
    beq     t7, $at, lbl_800CE41C
    lui     a0, 0x003F                 # a0 = 003F0000
    jal     func_80003CC0              # osSetIntMask
    ori     a0, a0, 0xFF01             # a0 = 003FFF01
    b       lbl_800CE508
    lw      $ra, 0x0014($sp)
lbl_800CE41C:
    lh      t8, 0x0002(a1)             # 00000002
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    or      a0, $zero, $zero           # a0 = 00000000
    beql    t8, $zero, lbl_800CE448
    sh      t9, 0x0002(a1)             # 00000002
    lui     a0, 0x003F                 # a0 = 003F0000
    jal     func_80003CC0              # osSetIntMask
    ori     a0, a0, 0xFF01             # a0 = 003FFF01
    b       lbl_800CE508
    lw      $ra, 0x0014($sp)
    sh      t9, 0x0002(a1)             # 00000002
lbl_800CE448:
    sw      a2, 0x0010(a1)             # 00000010
    sw      a3, 0x0014(a1)             # 00000014
    jal     func_80003CA0              # osGetThreadId
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    sw      v0, 0x0018(a1)             # 00000018
    lw      t0, 0x0028($sp)
    jal     func_800048C0              # osGetTime
    sw      t0, 0x001C(a1)             # 0000001C
    lw      a1, 0x0018($sp)
    lw      a0, 0x0008(a1)             # 00000008
    sw      v0, 0x0020(a1)             # 00000020
    sw      v1, 0x0024(a1)             # 00000024
    beql    a0, $zero, lbl_800CE4C4
    lw      v1, 0x000C(a1)             # 0000000C
    lh      t1, 0x0002(a0)             # 00000002
    or      v0, a0, $zero              # v0 = 00000000
    beql    t1, $zero, lbl_800CE4C4
    lw      v1, 0x000C(a1)             # 0000000C
    lw      v1, 0x0008(a0)             # 00000008
    beql    v1, $zero, lbl_800CE4A8
    lw      t2, 0x0004(a1)             # 00000004
    sw      a1, 0x000C(v1)             # 0000000C
    lw      t2, 0x0004(a1)             # 00000004
lbl_800CE4A8:
    lw      t3, 0x0004(v0)             # 00000004
    addu    t4, t2, t3
    addiu   t5, t4, 0x0030             # t5 = 00000030
    sw      t5, 0x0004(a1)             # 00000004
    lw      t6, 0x0008(v0)             # 00000008
    sw      t6, 0x0008(a1)             # 00000008
    lw      v1, 0x000C(a1)             # 0000000C
lbl_800CE4C4:
    beql    v1, $zero, lbl_800CE508
    lw      $ra, 0x0014($sp)
    lh      t7, 0x0002(v1)             # 00000002
    beql    t7, $zero, lbl_800CE508
    lw      $ra, 0x0014($sp)
    lw      t8, 0x0004(v1)             # 00000004
    lw      t9, 0x0004(a1)             # 00000004
    addu    t0, t8, t9
    addiu   t1, t0, 0x0030             # t1 = 00000030
    sw      t1, 0x0004(v1)             # 00000004
    lw      t2, 0x0008(a1)             # 00000008
    sw      t2, 0x0008(v1)             # 00000008
    lw      a0, 0x0008(a1)             # 00000008
    beql    a0, $zero, lbl_800CE508
    lw      $ra, 0x0014($sp)
    sw      v1, 0x000C(a0)             # 0000000C
lbl_800CE504:
    lw      $ra, 0x0014($sp)
lbl_800CE508:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800CE514:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a0, 0x0038($sp)
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lui     a0, 0x003F                 # a0 = 003F0000
    or      s0, a1, $zero              # s0 = 00000000
    ori     a0, a0, 0xFF01             # a0 = 003FFF01
    jal     func_80003CC0              # osSetIntMask
    sw      a2, 0x0040($sp)
    bne     s0, $zero, lbl_800CE554
    lw      a3, 0x0040($sp)
    lw      a0, 0x0038($sp)
    jal     func_800CE060              # osMalloc?
    or      a1, a3, $zero              # a1 = 00000000
    b       lbl_800CE62C
    or      s0, v0, $zero              # s0 = 00000000
lbl_800CE554:
    bne     a3, $zero, lbl_800CE570
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    lw      a0, 0x0038($sp)
    jal     func_800CE2B4              # osFree?
    or      a1, s0, $zero              # a1 = 00000000
    b       lbl_800CE62C
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800CE570:
    addiu   t0, s0, 0xFFD0             # t0 = FFFFFFD0
    lw      v0, 0x0004(t0)             # FFFFFFD4
    addiu   a3, a3, 0x000F             # a3 = 0000000F
    and     a3, a3, $at
    beq     a3, v0, lbl_800CE62C
    sltu    $at, v0, a3
    beq     $at, $zero, lbl_800CE62C
    nop
    lw      a1, 0x0008(t0)             # FFFFFFD8
    subu    v1, a3, v0
    lw      a0, 0x0038($sp)
    beql    a1, $zero, lbl_800CE5F8
    or      a1, a3, $zero              # a1 = 0000000F
    lh      t6, 0x0002(a1)             # 00000011
    beql    t6, $zero, lbl_800CE5F8
    or      a1, a3, $zero              # a1 = 0000000F
    lw      v0, 0x0004(a1)             # 00000013
    addiu   a2, $zero, 0x0030          # a2 = 00000030
    sltu    $at, v0, v1
    bnel    $at, $zero, lbl_800CE5F8
    or      a1, a3, $zero              # a1 = 0000000F
    lw      a0, 0x0008(a1)             # 00000017
    subu    t7, v0, v1
    sw      t7, 0x0004(a1)             # 00000013
    beq     a0, $zero, lbl_800CE5DC
    addu    t8, a1, v1
    sw      t8, 0x000C(a0)             # 0000000C
lbl_800CE5DC:
    addu    a0, a1, v1
    sw      a0, 0x0008(t0)             # FFFFFFD8
    jal     func_800D5E60
    sw      a3, 0x0004(t0)             # FFFFFFD4
    b       lbl_800CE62C
    nop
    or      a1, a3, $zero              # a1 = 00000000
lbl_800CE5F8:
    jal     func_800CE060              # osMalloc?
    sw      t0, 0x0020($sp)
    lw      t0, 0x0020($sp)
    beq     v0, $zero, lbl_800CE628
    sw      v0, 0x0030($sp)
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800D2350
    lw      a2, 0x0004(t0)             # 00000004
    lw      a0, 0x0038($sp)
    jal     func_800CE2B4              # osFree?
    or      a1, s0, $zero              # a1 = 00000000
lbl_800CE628:
    lw      s0, 0x0030($sp)
lbl_800CE62C:
    bne     s0, $zero, lbl_800CE654
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x5450             # v0 = 80105450
    lw      t9, 0x0000(v0)             # 80105450
    lw      v1, 0x0038($sp)
    addiu   t1, t9, 0x0001             # t1 = 00000001
    sw      t1, 0x0000(v0)             # 80105450
    lbu     t2, 0x000C(v1)             # 0000000C
    addiu   t3, t2, 0x0001             # t3 = 00000001
    sb      t3, 0x000C(v1)             # 0000000C
lbl_800CE654:
    lw      $ra, 0x001C($sp)
    or      v0, s0, $zero              # v0 = 00000000
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800CE668:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CE514
    sw      a3, 0x0024($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CE688:
# MqDbg: 
# Get Free Space Info
# Locates all allocated and free memory within free list
# A0 = Free List Handle ptr
# A1 = int*, total free space on heap?
# A2 = int*, total free space on heap
# A3 = int*, total allocated space on heap, not factoring free list nodes
    sw      $zero, 0x0000(a1)          # 00000000
    sw      $zero, 0x0000(a2)          # 00000000
    sw      $zero, 0x0000(a3)          # 00000000
    lw      v0, 0x0000(a0)             # 00000000
    beq     v0, $zero, lbl_800CE6F4
    nop
    lh      t6, 0x0002(v0)             # 00000002
lbl_800CE6A4:
    beql    t6, $zero, lbl_800CE6DC
    lw      t1, 0x0000(a3)             # 00000000
    lw      t7, 0x0000(a2)             # 00000000
    lw      t8, 0x0004(v0)             # 00000004
    addu    t9, t7, t8
    sw      t9, 0x0000(a2)             # 00000000
    lw      t0, 0x0000(a1)             # 00000000
    lw      v1, 0x0004(v0)             # 00000004
    sltu    $at, t0, v1
    beql    $at, $zero, lbl_800CE6EC
    lw      v0, 0x0008(v0)             # 00000008
    b       lbl_800CE6E8
    sw      v1, 0x0000(a1)             # 00000000
    lw      t1, 0x0000(a3)             # 00000000
lbl_800CE6DC:
    lw      t2, 0x0004(v0)             # 00000004
    addu    t3, t1, t2
    sw      t3, 0x0000(a3)             # 00000000
lbl_800CE6E8:
    lw      v0, 0x0008(v0)             # 00000008
lbl_800CE6EC:
    bnel    v0, $zero, lbl_800CE6A4
    lh      t6, 0x0002(v0)             # 00000002
lbl_800CE6F4:
    jr      $ra
    nop


func_800CE6FC:
# MqDbg: 
# Verify Free List Integrity
# A0 = Free List Handle ptr
# V0 = 1 if valid, else 0
    lw      v0, 0x0000(a0)             # 00000000
    addiu   v1, $zero, 0x7373          # v1 = 00007373
    beql    v0, $zero, lbl_800CE730
    or      v0, $zero, $zero           # v0 = 00000000
    lh      t6, 0x0000(v0)             # 00000000
lbl_800CE710:
    beql    v1, t6, lbl_800CE724
    lw      v0, 0x0008(v0)             # 00000008
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CE720:
    lw      v0, 0x0008(v0)             # 00000009
lbl_800CE724:
    bnel    v0, $zero, lbl_800CE710
    lh      t6, 0x0000(v0)             # 00000001
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CE730:
    jr      $ra
    nop


func_800CE738:
# MqDbg: 
    jr      $ra
    lbu     v0, 0x000C(a0)             # 0000000C

