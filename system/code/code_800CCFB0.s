

.section .text
func_800CCFB0:
# MqDbg: func_800FC800
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    sw      a1, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      a1, 0x0020($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    or      a2, v0, $zero              # a2 = 00000000
    bne     a1, $zero, lbl_800CCFE0
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800CCFE0:
    jal     func_800CE060              # osMalloc?
    sw      a2, 0x001C($sp)
    lw      a0, 0x001C($sp)
    jal     func_80003CC0              # osSetIntMask
    sw      v0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    lw      v0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CD008:
# MqDbg: func_800FC83C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      a1, 0x0020($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    or      a2, v0, $zero              # a2 = 00000000
    beq     a1, $zero, lbl_800CD03C
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    jal     func_800CE2B4              # osFree?
    sw      v0, 0x001C($sp)
    lw      a2, 0x001C($sp)
lbl_800CD03C:
    jal     func_80003CC0              # osSetIntMask
    or      a0, a2, $zero              # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CD054:
# MqDbg: func_800FC868
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x001C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    or      s3, a3, $zero              # s3 = 00000000
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a1, 0x0034($sp)
    sw      a2, 0x0038($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      a0, 0x0038($sp)
    lw      t6, 0x0034($sp)
    or      s0, s2, $zero              # s0 = 00000000
    sw      v0, 0x002C($sp)
    multu   t6, a0
    mflo    t7
    addu    s1, s2, t7
    sltu    $at, s2, s1
    beq     $at, $zero, lbl_800CD0C4
    or      s2, a0, $zero              # s2 = 00000000
lbl_800CD0AC:
    jalr    $ra, s3
    or      a0, s0, $zero              # a0 = 00000000
    addu    s0, s0, s2
    sltu    $at, s0, s1
    bne     $at, $zero, lbl_800CD0AC
    nop
lbl_800CD0C4:
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x002C($sp)
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800CD0E8:
# MqDbg: func_800FC8D8
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x001C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    or      s3, a3, $zero              # s3 = 00000000
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a1, 0x0034($sp)
    sw      a2, 0x0038($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      a0, 0x0038($sp)
    lw      t6, 0x0034($sp)
    or      s0, s2, $zero              # s0 = 00000000
    sw      v0, 0x002C($sp)
    multu   t6, a0
    mflo    t7
    addu    s1, s2, t7
    sltu    $at, s2, s1
    beq     $at, $zero, lbl_800CD15C
    or      s2, a0, $zero              # s2 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
lbl_800CD144:
    jalr    $ra, s3
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addu    s0, s0, s2
    sltu    $at, s0, s1
    bnel    $at, $zero, lbl_800CD144
    or      a0, s0, $zero              # a0 = 00000000
lbl_800CD15C:
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x002C($sp)
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800CD180:
# MqDbg: func_800FC948
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s4, 0x0040($sp)
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s3, 0x003C($sp)
    sw      s2, 0x0038($sp)
    or      s2, a1, $zero              # s2 = 00000000
    or      s3, a3, $zero              # s3 = 00000000
    sw      s1, 0x0034($sp)
    sw      s0, 0x0030($sp)
    sw      a2, 0x0058($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    bne     s4, $zero, lbl_800CD1D4
    sw      v0, 0x004C($sp)
    lw      t6, 0x0058($sp)
    multu   s2, t6
    mflo    a0
    jal     func_800CCFB0
    nop
    or      s4, v0, $zero              # s4 = 00000000
lbl_800CD1D4:
    beq     s4, $zero, lbl_800CD238
    nop
    beq     s3, $zero, lbl_800CD238
    lw      t7, 0x0058($sp)
    multu   s2, t7
    or      s0, s4, $zero              # s0 = 00000000
    or      s2, t7, $zero              # s2 = 00000000
    mflo    t8
    addu    s1, s4, t8
    sltu    $at, s4, s1
    beq     $at, $zero, lbl_800CD238
    or      a0, s0, $zero              # a0 = 00000000
lbl_800CD204:
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, $zero, $zero           # a3 = 00000000
    sw      $zero, 0x0010($sp)
    sw      $zero, 0x0014($sp)
    sw      $zero, 0x0018($sp)
    sw      $zero, 0x001C($sp)
    jalr    $ra, s3
    sw      $zero, 0x0020($sp)
    addu    s0, s0, s2
    sltu    $at, s0, s1
    bnel    $at, $zero, lbl_800CD204
    or      a0, s0, $zero              # a0 = 00000000
lbl_800CD238:
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x004C($sp)
    lw      $ra, 0x0044($sp)
    or      v0, s4, $zero              # v0 = 00000000
    lw      s4, 0x0040($sp)
    lw      s0, 0x0030($sp)
    lw      s1, 0x0034($sp)
    lw      s2, 0x0038($sp)
    lw      s3, 0x003C($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800CD264:
# MqDbg: func_800FCA18
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s4, 0x0028($sp)
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    or      s2, a1, $zero              # s2 = 00000000
    or      s3, a3, $zero              # s3 = 00000000
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      v1, 0x0040($sp)
    beq     s4, $zero, lbl_800CD2F8
    sw      v0, 0x0034($sp)
    beql    s3, $zero, lbl_800CD2E8
    lw      t7, 0x0048($sp)
    multu   s2, v1
    or      s1, s4, $zero              # s1 = 00000000
    or      s2, v1, $zero              # s2 = 00000000
    mflo    t6
    addu    s0, s4, t6
    sltu    $at, s4, s0
    beq     $at, $zero, lbl_800CD2E4
    subu    s0, s0, s2
lbl_800CD2CC:
    or      a0, s0, $zero              # a0 = 00000000
    jalr    $ra, s3
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    sltu    $at, s1, s0
    bnel    $at, $zero, lbl_800CD2CC
    subu    s0, s0, s2
lbl_800CD2E4:
    lw      t7, 0x0048($sp)
lbl_800CD2E8:
    beq     t7, $zero, lbl_800CD2F8
    nop
    jal     func_800CD008
    or      a0, s4, $zero              # a0 = 00000000
lbl_800CD2F8:
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x0034($sp)
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800CD320:
# MqDbg: func_800FCB34
# Checks state of 80105430
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x5430(v0)             # 80105430
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s0, 0x0014($sp)
    sw      s1, 0x0018($sp)
    lui     s0, 0x8010                 # s0 = 80100000
    sw      $ra, 0x001C($sp)
    addiu   s0, s0, 0x5430             # s0 = 80105430
    beq     v0, $zero, lbl_800CD374
    or      s1, $zero, $zero           # s1 = 00000000
    addu    s0, s0, v0
lbl_800CD34C:
    lw      v1, 0x0004(s0)             # 80105434
    beql    v1, $zero, lbl_800CD364
    lw      v0, 0x0000(s0)             # 80105430
    jalr    $ra, v1
    nop
    lw      v0, 0x0000(s0)             # 80105430
lbl_800CD364:
    sw      s1, 0x0000(s0)             # 80105430
    or      s1, s0, $zero              # s1 = 80105430
    bnel    v0, $zero, lbl_800CD34C
    addu    s0, s0, v0
lbl_800CD374:
    lw      $ra, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    sw      s1, 0x5430($at)            # 80105430
    lw      s1, 0x0018($sp)
    lw      s0, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800CD390:
# MqDbg: SystemHeap_Init
# Allocates main heap
# Wrapper for 800CDD90 (A0 = 12BAA0)
# A0 = Block Start
# A1 = Block Size
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800CDD90
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    jal     func_800CD320
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop