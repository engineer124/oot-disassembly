# "Particle Effects" part of the code file
#
# Starts at VRAM: 8001B000 / VROM: ??????
#

.section .text
func_8001B000:
# MqDbg: EffectSs_InitInfo
# Allocate Particles (Main Particle Table)
# A0 = Global Context
# A1 = Number of Particles to Allocate
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x0020($sp)
    addiu   s2, $zero, 0x0060          # s2 = 00000060
    sw      $ra, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a1, 0x002C($sp)
    or      a2, a0, $zero              # a2 = 00000000
    lw      t6, 0x002C($sp)
    addiu   a0, a2, 0x0074             # a0 = 00000074
    multu   t6, s2
    mflo    a1
    jal     func_800A01B8
    nop
    lw      t7, 0x002C($sp)
    lui     s1, 0x800E                 # s1 = 800E0000
    addiu   s1, s1, 0x7B40             # s1 = 800E7B40
    multu   t7, s2
    sw      v0, 0x0000(s1)             # 800E7B40
    sw      $zero, 0x0004(s1)          # 800E7B44
    or      s0, v0, $zero              # s0 = 00000000
    sw      t7, 0x0008(s1)             # 800E7B48
    mflo    t9
    addu    t0, t9, v0
    sltu    $at, v0, t0
    beq     $at, $zero, lbl_8001B098
    nop
lbl_8001B06C:
    jal     func_8001B204
    or      a0, s0, $zero              # a0 = 00000000
    lw      t1, 0x0008(s1)             # 800E7B48
    lw      t3, 0x0000(s1)             # 800E7B40
    addiu   s0, s0, 0x0060             # s0 = 00000060
    multu   t1, s2
    mflo    t2
    addu    t4, t2, t3
    sltu    $at, s0, t4
    bne     $at, $zero, lbl_8001B06C
    nop
lbl_8001B098:
    lui     $at, 0x800E                # $at = 800E0000
    lui     v0, 0x800E                 # v0 = 800E0000
    addiu   v0, v0, 0x7C5C             # v0 = 800E7C5C
    sw      $zero, 0x7C50($at)         # 800E7C50
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    addiu   a0, $zero, 0x0025          # a0 = 00000025
lbl_8001B0B0:
    addiu   v1, v1, 0x0004             # v1 = 00000005
    sw      $zero, 0x002C(v0)          # 800E7C88
    sw      $zero, 0x0048(v0)          # 800E7CA4
    sw      $zero, 0x0064(v0)          # 800E7CC0
    addiu   v0, v0, 0x0070             # v0 = 800E7CCC
    bne     v1, a0, lbl_8001B0B0
    sw      $zero, -0x0060(v0)         # 800E7C6C
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_8001B0E4:
# MqDbg: EffectSs_ClearAll
# Deallocate Particles (Main Particle Table)
# A0 = Global Context
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s1, 0x001C($sp)
    lui     s1, 0x800E                 # s1 = 800E0000
    sw      s2, 0x0020($sp)
    addiu   s2, $zero, 0x0060          # s2 = 00000060
    addiu   s1, s1, 0x7B40             # s1 = 800E7B40
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0028($sp)
    multu   $zero, s2
    sw      $zero, 0x0000(s1)          # 800E7B40
    sw      $zero, 0x0004(s1)          # 800E7B44
    sw      $zero, 0x0008(s1)          # 800E7B48
    or      s0, $zero, $zero           # s0 = 00000000
    mflo    t7
    sltu    $at, $zero, t7
    beq     $at, $zero, lbl_8001B158
    nop
lbl_8001B12C:
    jal     func_8001B1A4
    or      a0, s0, $zero              # a0 = 00000000
    lw      t9, 0x0008(s1)             # 800E7B48
    lw      t1, 0x0000(s1)             # 800E7B40
    addiu   s0, s0, 0x0060             # s0 = 00000060
    multu   t9, s2
    mflo    t0
    addu    t2, t0, t1
    sltu    $at, s0, t2
    bne     $at, $zero, lbl_8001B12C
    nop
lbl_8001B158:
    lui     s0, 0x800E                 # s0 = 800E0000
    addiu   s0, s0, 0x7C40             # s0 = 800E7C40
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s2, $zero, 0x0025          # s2 = 00000025
lbl_8001B168:
    lw      a0, 0x0010(s0)             # 800E7C50
    beql    a0, $zero, lbl_8001B180
    addiu   s1, s1, 0x0001             # s1 = 00000001
    jal     func_80066C90
    nop
    addiu   s1, s1, 0x0001             # s1 = 00000002
lbl_8001B180:
    sw      $zero, 0x0010(s0)          # 800E7C50
    bne     s1, s2, lbl_8001B168
    addiu   s0, s0, 0x001C             # s0 = 800E7C5C
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_8001B1A4:
# MqDbg: EffectSs_Delete
# Kill Particle
# A0 = Particle Instance Ptr
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    lhu     v0, 0x005A(a1)             # 0000005A
    or      a0, a1, $zero              # a0 = 00000000
    andi    t6, v0, 0x0002             # t6 = 00000000
    beql    t6, $zero, lbl_8001B1D8
    andi    t7, v0, 0x0004             # t7 = 00000000
    jal     func_800C9568
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    lhu     v0, 0x005A(a1)             # 0000005A
    andi    t7, v0, 0x0004             # t7 = 00000000
lbl_8001B1D8:
    beq     t7, $zero, lbl_8001B1EC
    addiu   a0, a1, 0x002C             # a0 = 0000002C
    jal     func_800C9568
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
lbl_8001B1EC:
    jal     func_8001B204
    or      a0, a1, $zero              # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001B204:
# MqDbg: EffectSs_Reset
# Zero Particle
# A0 = Particle Instance Ptr
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   t6, $zero, 0x0025          # t6 = 00000025
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    addiu   t8, $zero, 0x0080          # t8 = 00000080
    sb      t6, 0x005F(a0)             # 0000005F
    swc1    $f0, 0x0020(a0)            # 00000020
    swc1    $f0, 0x001C(a0)            # 0000001C
    swc1    $f0, 0x0018(a0)            # 00000018
    swc1    $f0, 0x0014(a0)            # 00000014
    swc1    $f0, 0x0010(a0)            # 00000010
    swc1    $f0, 0x000C(a0)            # 0000000C
    swc1    $f0, 0x0034(a0)            # 00000034
    swc1    $f0, 0x0030(a0)            # 00000030
    swc1    $f0, 0x002C(a0)            # 0000002C
    swc1    $f0, 0x0008(a0)            # 00000008
    swc1    $f0, 0x0004(a0)            # 00000004
    swc1    $f0, 0x0000(a0)            # 00000000
    sh      t7, 0x005C(a0)             # 0000005C
    sh      $zero, 0x005A(a0)          # 0000005A
    sb      t8, 0x005E(a0)             # 0000005E
    sw      $zero, 0x0028(a0)          # 00000028
    sw      $zero, 0x0024(a0)          # 00000024
    sw      $zero, 0x0038(a0)          # 00000038
    sw      $zero, 0x003C(a0)          # 0000003C
    sh      $zero, 0x0040(a0)          # 00000040
    addiu   v1, a0, 0x0002             # v1 = 00000002
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_8001B274:
    addiu   v0, v0, 0x0004             # v0 = 00000005
    sh      $zero, 0x0042(v1)          # 00000044
    sh      $zero, 0x0044(v1)          # 00000046
    sh      $zero, 0x0046(v1)          # 00000048
    addiu   v1, v1, 0x0008             # v1 = 0000000A
    bne     v0, a0, lbl_8001B274
    sh      $zero, 0x0038(v1)          # 00000042
    jr      $ra
    nop


func_8001B298:
# MqDbg: EffectSs_FindSlot
# Try Get Particle Free Slot
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    lui     a2, 0x800E                 # a2 = 800E0000
    addiu   a2, a2, 0x7B40             # a2 = 800E7B40
    or      s0, a0, $zero              # s0 = 00000000
    sw      a1, 0x000C($sp)
    lw      v0, 0x0004(a2)             # 800E7B44
    lw      v1, 0x0008(a2)             # 800E7B48
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    slt     $at, v0, v1
    bne     $at, $zero, lbl_8001B2D4
    nop
    sw      $zero, 0x0004(a2)          # 800E7B44
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001B2D4:
    lui     a2, 0x800E                 # a2 = 800E0000
    lw      a2, 0x7B40(a2)             # 800E7B40
    sll     t6, v0,  2
    subu    t6, t6, v0
    sll     t6, t6,  5
    or      a0, v0, $zero              # a0 = 00000000
    addu    a3, a2, t6
lbl_8001B2F0:
    lh      t7, 0x005C(a3)             # 0000005C
    bnel    t0, t7, lbl_8001B308
    addiu   a0, a0, 0x0001             # a0 = 00000001
    b       lbl_8001B330
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a0, a0, 0x0001             # a0 = 00000002
lbl_8001B308:
    slt     $at, a0, v1
    bne     $at, $zero, lbl_8001B318
    nop
    or      a0, $zero, $zero           # a0 = 00000000
lbl_8001B318:
    beq     a0, v0, lbl_8001B330
    sll     t8, a0,  2
    subu    t8, t8, a0
    sll     t8, t8,  5
    b       lbl_8001B2F0
    addu    a3, a2, t8
lbl_8001B330:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     a1, $at, lbl_8001B34C
    sll     t1, v0,  2
    lw      t9, 0x000C($sp)
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_8001B3C4
    sw      a0, 0x0000(t9)             # 00000000
lbl_8001B34C:
    subu    t1, t1, v0
    sll     t1, t1,  5
    or      a0, v0, $zero              # a0 = 00000000
    addu    a3, a2, t1
lbl_8001B35C:
    lbu     a1, 0x005E(a3)             # 0000005E
    slt     $at, a1, s0
    bnel    $at, $zero, lbl_8001B388
    addiu   a0, a0, 0x0001             # a0 = 00000001
    bnel    s0, a1, lbl_8001B3BC
    lw      t5, 0x000C($sp)
    lhu     t2, 0x005A(a3)             # 0000005A
    andi    t3, t2, 0x0001             # t3 = 00000000
    beql    t3, $zero, lbl_8001B3BC
    lw      t5, 0x000C($sp)
    addiu   a0, a0, 0x0001             # a0 = 00000002
lbl_8001B388:
    slt     $at, a0, v1
    bne     $at, $zero, lbl_8001B398
    nop
    or      a0, $zero, $zero           # a0 = 00000000
lbl_8001B398:
    bne     a0, v0, lbl_8001B3A8
    sll     t4, a0,  2
    b       lbl_8001B3C4
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_8001B3A8:
    subu    t4, t4, a0
    sll     t4, t4,  5
    b       lbl_8001B35C
    addu    a3, a2, t4
    lw      t5, 0x000C($sp)
lbl_8001B3BC:
    or      v0, $zero, $zero           # v0 = 00000000
    sw      a0, 0x0000(t5)             # 00000000
lbl_8001B3C4:
    lw      s0, 0x0004($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0008           # $sp += 0x8


func_8001B3D0:
# MqDbg: EffectSs_Insert
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    jal     func_8009DB54
    nop
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_8001B458
    lw      t6, 0x0024($sp)
    lbu     a0, 0x005E(t6)             # 0000005E
    jal     func_8001B298
    addiu   a1, $sp, 0x001C            # a1 = FFFFFFFC
    bne     v0, $zero, lbl_8001B458
    lw      t7, 0x001C($sp)
    lw      t0, 0x001C($sp)
    lui     v0, 0x800E                 # v0 = 800E0000
    addiu   v0, v0, 0x7B40             # v0 = 800E7B40
    lw      t9, 0x0000(v0)             # 800E7B40
    lw      t3, 0x0024($sp)
    sll     t1, t0,  2
    subu    t1, t1, t0
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sll     t1, t1,  5
    sw      t8, 0x0004(v0)             # 800E7B44
    addu    t2, t9, t1
    addiu   t6, t3, 0x0060             # t6 = 00000060
lbl_8001B434:
    lw      t5, 0x0000(t3)             # 00000000
    addiu   t3, t3, 0x000C             # t3 = 0000000C
    addiu   t2, t2, 0x000C             # t2 = 0000000C
    sw      t5, -0x000C(t2)            # 00000000
    lw      t4, -0x0008(t3)            # 00000004
    sw      t4, -0x0008(t2)            # 00000004
    lw      t5, -0x0004(t3)            # 00000008
    bne     t3, t6, lbl_8001B434
    sw      t5, -0x0004(t2)            # 00000008
lbl_8001B458:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_8001B468:
# MqDbg: EffectSs_Spawn
# Spawn Particle. Also allocates overlay if not already in memory
# A0 = Global Context
# A1 = Particle Effect Id
# A2 = ?
# A3 = ptr to spawn coordinates?
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0040($sp)
    sw      a1, 0x0044($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    lw      a0, 0x0048($sp)
    jal     func_8001B298
    addiu   a1, $sp, 0x003C            # a1 = FFFFFFFC
    bne     v0, $zero, lbl_8001B600
    lw      t6, 0x003C($sp)
    lw      t8, 0x0044($sp)
    lui     t1, 0x800E                 # t1 = 800E0000
    addiu   t7, t6, 0x0001             # t7 = 00000001
    sll     t9, t8,  3
    subu    t9, t9, t8
    lui     $at, 0x800E                # $at = 800E0000
    sll     t9, t9,  2
    addiu   t1, t1, 0x7C40             # t1 = 800E7C40
    sw      t7, 0x7B44($at)            # 800E7B44
    addu    v1, t9, t1
    lw      v0, 0x0008(v1)             # 00000008
    lw      t2, 0x000C(v1)             # 0000000C
    bne     v0, $zero, lbl_8001B4D4
    subu    a0, t2, v0
    b       lbl_8001B53C
    lw      v0, 0x0014(v1)             # 00000014
lbl_8001B4D4:
    lw      t3, 0x0010(v1)             # 00000010
    bnel    t3, $zero, lbl_8001B518
    lw      v0, 0x0014(v1)             # 00000014
    jal     func_80066C38              # zelda_malloc?
    sw      v1, 0x0028($sp)
    lw      v1, 0x0028($sp)
    beq     v0, $zero, lbl_8001B600
    sw      v0, 0x0010(v1)             # 00000010
    lw      a0, 0x0000(v1)             # 00000000
    lw      a1, 0x0004(v1)             # 00000004
    lw      a2, 0x0008(v1)             # 00000008
    lw      a3, 0x000C(v1)             # 0000000C
    sw      v1, 0x0028($sp)
    jal     func_800CCBB8
    sw      v0, 0x0010($sp)
    lw      v1, 0x0028($sp)
    lw      v0, 0x0014(v1)             # 00000014
lbl_8001B518:
    or      a0, $zero, $zero           # a0 = 00000000
    beq     v0, $zero, lbl_8001B538
    nop
    lw      t5, 0x0008(v1)             # 00000008
    lw      t6, 0x0010(v1)             # 00000010
    subu    t7, t5, t6
    b       lbl_8001B538
    subu    a0, v0, t7
lbl_8001B538:
    or      v0, a0, $zero              # v0 = 00000000
lbl_8001B53C:
    lw      t8, 0x0004(v0)             # 00000004
    lw      t9, 0x003C($sp)
    lui     t2, 0x800E                 # t2 = 800E0000
    beq     t8, $zero, lbl_8001B600
    sll     t1, t9,  2
    lw      t2, 0x7B40(t2)             # 800E7B40
    subu    t1, t1, t9
    sll     t1, t1,  5
    sw      v0, 0x0030($sp)
    jal     func_8001B1A4
    addu    a0, t1, t2
    lw      t5, 0x003C($sp)
    addiu   v1, $zero, 0x0060          # v1 = 00000060
    lui     t0, 0x800E                 # t0 = 800E0000
    multu   t5, v1
    addiu   t0, t0, 0x7B40             # t0 = 800E7B40
    lw      t4, 0x0000(t0)             # 800E7B40
    lw      t3, 0x0044($sp)
    lw      v0, 0x0030($sp)
    mflo    t6
    addu    t7, t4, t6
    sb      t3, 0x005F(t7)             # 0000005F
    lw      t1, 0x003C($sp)
    lw      t9, 0x0000(t0)             # 800E7B40
    lw      t8, 0x0048($sp)
    multu   t1, v1
    mflo    t2
    addu    t5, t9, t2
    sb      t8, 0x005E(t5)             # 0000005E
    lw      a1, 0x003C($sp)
    lw      t9, 0x0004(v0)             # 00000004
    lw      t3, 0x0000(t0)             # 800E7B40
    multu   a1, v1
    lw      a3, 0x004C($sp)
    lw      a0, 0x0040($sp)
    mflo    t6
    addu    a2, t6, t3
    jalr    $ra, t9
    nop
    bne     v0, $zero, lbl_8001B600
    addiu   v1, $zero, 0x0060          # v1 = 00000060
    lw      t7, 0x003C($sp)
    lui     t2, 0x800E                 # t2 = 800E0000
    lw      t2, 0x7B40(t2)             # 800E7B40
    multu   t7, v1
    mflo    t1
    addu    a0, t1, t2
    jal     func_8001B204
    nop
lbl_8001B600:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001B610:
# MqDbg: EffectSs_Update
# Update/Execute Particle
# A0 = Global Context
# A1 = Particle Slot Id
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lw      t7, 0x7B40(t7)             # 800E7B40
    sll     t6, a1,  2
    subu    t6, t6, a1
    sll     t6, t6,  5
    addu    a2, t6, t7
    lw      v0, 0x0024(a2)             # 00000024
    beql    v0, $zero, lbl_8001B6A4
    lw      $ra, 0x0014($sp)
    lwc1    $f4, 0x000C(a2)            # 0000000C
    lwc1    $f6, 0x0018(a2)            # 00000018
    lwc1    $f10, 0x0010(a2)           # 00000010
    lwc1    $f16, 0x001C(a2)           # 0000001C
    add.s   $f8, $f4, $f6
    lwc1    $f6, 0x0020(a2)            # 00000020
    lwc1    $f4, 0x0014(a2)            # 00000014
    add.s   $f18, $f10, $f16
    swc1    $f8, 0x000C(a2)            # 0000000C
    lwc1    $f16, 0x000C(a2)           # 0000000C
    lwc1    $f10, 0x0000(a2)           # 00000000
    add.s   $f8, $f4, $f6
    swc1    $f18, 0x0010(a2)           # 00000010
    lwc1    $f6, 0x0010(a2)            # 00000010
    add.s   $f18, $f10, $f16
    swc1    $f8, 0x0014(a2)            # 00000014
    lwc1    $f4, 0x0004(a2)            # 00000004
    lwc1    $f16, 0x0014(a2)           # 00000014
    lwc1    $f10, 0x0008(a2)           # 00000008
    swc1    $f18, 0x0000(a2)           # 00000000
    add.s   $f8, $f4, $f6
    add.s   $f18, $f10, $f16
    swc1    $f8, 0x0004(a2)            # 00000004
    jalr    $ra, v0
    swc1    $f18, 0x0008(a2)           # 00000008
    lw      $ra, 0x0014($sp)
lbl_8001B6A4:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001B6B0:
# MqDbg: EffectSs_UpdateAll
# Update/Execute Particles
# A0 = Global Context
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x001C($sp)
    lui     s2, 0x800E                 # s2 = 800E0000
    sw      s3, 0x0020($sp)
    or      s3, a0, $zero              # s3 = 00000000
    addiu   s2, s2, 0x7B40             # s2 = 800E7B40
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    lw      t6, 0x0008(s2)             # 800E7B48
    or      s1, $zero, $zero           # s1 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    blezl   t6, lbl_8001B754
    lw      $ra, 0x0024($sp)
    lw      t7, 0x0000(s2)             # 800E7B40
lbl_8001B6EC:
    addu    a0, t7, s0
    lh      v0, 0x005C(a0)             # 0000005C
    bltz    v0, lbl_8001B728
    addiu   t8, v0, 0xFFFF             # t8 = FFFFFFFF
    sh      t8, 0x005C(a0)             # 0000005C
    lw      v1, 0x0000(s2)             # 800E7B40
    addu    t9, v1, s0
    lh      v0, 0x005C(t9)             # 0000005C
    bgez    v0, lbl_8001B728
    nop
    jal     func_8001B1A4
    addu    a0, s0, v1
    lw      t0, 0x0000(s2)             # 800E7B40
    addu    t1, t0, s0
    lh      v0, 0x005C(t1)             # 0000005C
lbl_8001B728:
    bltz    v0, lbl_8001B738
    or      a0, s3, $zero              # a0 = 00000000
    jal     func_8001B610
    or      a1, s1, $zero              # a1 = 00000000
lbl_8001B738:
    lw      t2, 0x0008(s2)             # 800E7B48
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s0, s0, 0x0060             # s0 = 00000060
    slt     $at, s1, t2
    bnel    $at, $zero, lbl_8001B6EC
    lw      t7, 0x0000(s2)             # 800E7B40
    lw      $ra, 0x0024($sp)
lbl_8001B754:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_8001B76C:
# MqDbg: EffectSs_Draw
# Draw Particle (Execute Instance + 0x28 func)
# A0 = Global Context
# A1 = Particle Slot Id
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lw      t7, 0x7B40(t7)             # 800E7B40
    sll     t6, a1,  2
    subu    t6, t6, a1
    sll     t6, t6,  5
    addu    a2, t6, t7
    lw      v0, 0x0028(a2)             # 00000028
    beql    v0, $zero, lbl_8001B7A4
    lw      $ra, 0x0014($sp)
    jalr    $ra, v0
    nop
    lw      $ra, 0x0014($sp)
lbl_8001B7A4:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001B7B0:
# MqDbg: EffectSs_DrawAll
# Draw Particles
# A0 = Global Context
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s2, 0x002C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      s3, 0x0030($sp)
    sw      s1, 0x0028($sp)
    sw      s0, 0x0024($sp)
    sdc1    $f22, 0x0018($sp)
    sdc1    $f20, 0x0010($sp)
    addiu   a0, s2, 0x07A8             # a0 = 000007A8
    jal     func_8006650C
    lw      a1, 0x0000(s2)             # 00000000
    or      s0, v0, $zero              # s0 = 00000000
    or      a0, v0, $zero              # a0 = 00000000
    lw      a1, 0x07A8(s2)             # 000007A8
    jal     func_80066298
    or      a2, $zero, $zero           # a2 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_80065D60
    lw      a1, 0x0000(s2)             # 00000000
    lui     s3, 0x800E                 # s3 = 800E0000
    addiu   s3, s3, 0x7B40             # s3 = 800E7B40
    lw      v1, 0x0008(s3)             # 800E7B48
    or      s0, $zero, $zero           # s0 = 00000000
    lui     $at, 0xC6FA                # $at = C6FA0000
    blezl   v1, lbl_8001B8DC
    lw      $ra, 0x0034($sp)
    mtc1    $at, $f22                  # $f22 = -32000.00
    lui     $at, 0x46FA                # $at = 46FA0000
    mtc1    $at, $f20                  # $f20 = 32000.00
    or      s1, $zero, $zero           # s1 = 00000000
lbl_8001B82C:
    lw      a1, 0x0000(s3)             # 800E7B40
    addu    v0, a1, s1
    lh      t6, 0x005C(v0)             # 0000005C
    bltzl   t6, lbl_8001B8CC
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lwc1    $f0, 0x0000(v0)            # 00000000
    c.lt.s  $f20, $f0
    nop
    bc1t    lbl_8001B8AC
    nop
    c.lt.s  $f0, $f22
    nop
    bc1t    lbl_8001B8AC
    nop
    lwc1    $f0, 0x0004(v0)            # 00000004
    c.lt.s  $f20, $f0
    nop
    bc1t    lbl_8001B8AC
    nop
    c.lt.s  $f0, $f22
    nop
    bc1t    lbl_8001B8AC
    nop
    lwc1    $f0, 0x0008(v0)            # 00000008
    c.lt.s  $f20, $f0
    nop
    bc1t    lbl_8001B8AC
    nop
    c.lt.s  $f0, $f22
    or      a0, s2, $zero              # a0 = 00000000
    bc1f    lbl_8001B8BC
    nop
lbl_8001B8AC:
    jal     func_8001B1A4
    addu    a0, s1, a1
    b       lbl_8001B8C8
    lw      v1, 0x0008(s3)             # 800E7B48
lbl_8001B8BC:
    jal     func_8001B76C
    or      a1, s0, $zero              # a1 = 00000001
    lw      v1, 0x0008(s3)             # 800E7B48
lbl_8001B8C8:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_8001B8CC:
    slt     $at, s0, v1
    bne     $at, $zero, lbl_8001B82C
    addiu   s1, s1, 0x0060             # s1 = 00000060
    lw      $ra, 0x0034($sp)
lbl_8001B8DC:
    ldc1    $f20, 0x0010($sp)
    ldc1    $f22, 0x0018($sp)
    lw      s0, 0x0024($sp)
    lw      s1, 0x0028($sp)
    lw      s2, 0x002C($sp)
    lw      s3, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_8001B8FC:
# MqDbg: func_80027DD4
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    sll     a1, a1, 16
    sll     a0, a0, 16
    sra     a0, a0, 16
    sra     a1, a1, 16
    bne     a2, $zero, lbl_8001B928
    subu    t6, a1, a0
    sll     v1, a1, 16
    b       lbl_8001B954
    sra     v1, v1, 16
lbl_8001B928:
    mtc1    t6, $f4                    # $f4 = 0.00
    mtc1    a2, $f8                    # $f8 = 0.00
    cvt.s.w $f6, $f4
    cvt.s.w $f10, $f8
    div.s   $f16, $f6, $f10
    trunc.w.s $f18, $f16
    mfc1    t8, $f18
    nop
    addu    v1, a0, t8
    sll     v1, v1, 16
    sra     v1, v1, 16
lbl_8001B954:
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_8001B960:
# MqDbg: func_80027E34
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    sll     a1, a1, 16
    sll     a0, a0, 16
    mtc1    a2, $f12                   # $f12 = 0.00
    sra     a0, a0, 16
    sra     a1, a1, 16
    subu    t6, a1, a0
    mtc1    t6, $f4                    # $f4 = 0.00
    mtc1    a0, $f10                   # $f10 = 0.00
    cvt.s.w $f6, $f4
    cvt.s.w $f16, $f10
    mul.s   $f8, $f6, $f12
    add.s   $f18, $f8, $f16
    trunc.w.s $f4, $f18
    mfc1    v0, $f4
    nop
    sll     v0, v0, 16
    sra     v0, v0, 16
    jr      $ra
    nop


func_8001B9B4:
# MqDbg: func_80027E84
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    mtc1    a2, $f12                   # $f12 = 0.00
    andi    a1, a1, 0x00FF             # a1 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    mtc1    a0, $f4                    # $f4 = 0.00
    mtc1    a1, $f8                    # $f8 = 0.00
    bgez    a0, lbl_8001B9E8
    cvt.s.w $f0, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f0, $f0, $f6
lbl_8001B9E8:
    bgez    a1, lbl_8001BA00
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f10, $f10, $f16
lbl_8001BA00:
    sub.s   $f18, $f10, $f0
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f4, $f18, $f12
    add.s   $f6, $f4, $f0
    cfc1    t6, $f31
    ctc1    v0, $f31
    nop
    cvt.w.s $f8, $f6
    cfc1    v0, $f31
    nop
    andi    v0, v0, 0x0078             # v0 = 00000000
    beql    v0, $zero, lbl_8001BA80
    mfc1    v0, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    sub.s   $f8, $f6, $f8
    ctc1    v0, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    v0, $f31
    nop
    andi    v0, v0, 0x0078             # v0 = 00000000
    bne     v0, $zero, lbl_8001BA74
    nop
    mfc1    v0, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001BA8C
    or      v0, v0, $at                # v0 = 80000000
lbl_8001BA74:
    b       lbl_8001BA8C
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    mfc1    v0, $f8
lbl_8001BA80:
    nop
    bltz    v0, lbl_8001BA74
    nop
lbl_8001BA8C:
    ctc1    t6, $f31
    andi    v0, v0, 0x00FF             # v0 = 000000FF
    nop
    jr      $ra
    nop
