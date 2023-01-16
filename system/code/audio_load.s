# Audio Load
#
# Starts at VRAM: 800B67B0 / VROM: ??????
#

.section .text
func_800B67B0:
# MqDbg: AudioLoad_DecreaseSampleDmaTtls
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lw      v1, 0x2624(a2)             # 80127C54
    or      v0, $zero, $zero           # v0 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    beql    v1, $zero, lbl_800B6828
    lw      t4, 0x2620(a2)             # 80127C50
    lw      t6, 0x261C(a2)             # 80127C4C
lbl_800B67D0:
    addu    v1, a0, t6
    lbu     a1, 0x000E(v1)             # 0000000E
    beq     a1, $zero, lbl_800B680C
    addiu   t7, a1, 0xFFFF             # t7 = FFFFFFFF
    andi    t8, t7, 0x00FF             # t8 = 000000FF
    bne     t8, $zero, lbl_800B680C
    sb      t7, 0x000E(v1)             # 0000000E
    lbu     t9, 0x282E(a2)             # 80127E5E
    sb      t9, 0x000D(v1)             # 0000000D
    lbu     t0, 0x282E(a2)             # 80127E5E
    addu    t1, a2, t0
    sb      v0, 0x262C(t1)             # 0000262C
    lbu     t2, 0x282E(a2)             # 80127E5E
    addiu   t3, t2, 0x0001             # t3 = 00000001
    sb      t3, 0x282E(a2)             # 80127E5E
lbl_800B680C:
    lw      v1, 0x2624(a2)             # 80127C54
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   a0, a0, 0x0010             # a0 = 00000010
    sltu    $at, v0, v1
    bnel    $at, $zero, lbl_800B67D0
    lw      t6, 0x261C(a2)             # 80127C4C
    lw      t4, 0x2620(a2)             # 80127C50
lbl_800B6828:
    or      v0, v1, $zero              # v0 = 00000000
    sll     a0, v1,  4
    sltu    $at, v1, t4
    beq     $at, $zero, lbl_800B6894
    nop
    lw      t5, 0x261C(a2)             # 80127C4C
lbl_800B6840:
    addu    v1, a0, t5
    lbu     a1, 0x000E(v1)             # 0000000E
    beq     a1, $zero, lbl_800B687C
    addiu   t6, a1, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x00FF             # t7 = 000000FF
    bne     t7, $zero, lbl_800B687C
    sb      t6, 0x000E(v1)             # 0000000E
    lbu     t8, 0x282F(a2)             # 80127E5F
    sb      t8, 0x000D(v1)             # 0000000D
    lbu     t9, 0x282F(a2)             # 80127E5F
    addu    t0, a2, t9
    sb      v0, 0x272C(t0)             # 0000272C
    lbu     t1, 0x282F(a2)             # 80127E5F
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x282F(a2)             # 80127E5F
lbl_800B687C:
    lw      t3, 0x2620(a2)             # 80127C50
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   a0, a0, 0x0010             # a0 = 00000020
    sltu    $at, v0, t3
    bnel    $at, $zero, lbl_800B6840
    lw      t5, 0x261C(a2)             # 80127C4C
lbl_800B6894:
    jr      $ra
    sw      $zero, 0x2628(a2)          # 80127C58


func_800B689C:
# MqDbg: AudioLoad_DmaSampleData
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s1, 0x0030($sp)
    sw      s0, 0x002C($sp)
    or      s0, a1, $zero              # s0 = 00000000
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a2, 0x0058($sp)
    sw      a3, 0x005C($sp)
    bne     a2, $zero, lbl_800B68E0
    or      t3, $zero, $zero           # t3 = 00000000
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x5630             # t1 = 80125630
    lw      a2, 0x2624(t1)             # 80127C54
    lbu     v0, 0x0000(a3)             # 00000000
    sltu    $at, v0, a2
    bnel    $at, $zero, lbl_800B6A38
    lw      a1, 0x261C(t1)             # 80127C4C
lbl_800B68E0:
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x5630             # t1 = 80125630
    lw      a2, 0x2624(t1)             # 80127C54
    lw      a1, 0x2620(t1)             # 80127C50
    or      a0, a2, $zero              # a0 = 00000000
    sltu    $at, a2, a1
    beql    $at, $zero, lbl_800B69D4
    lw      t9, 0x0058($sp)
    lw      t9, 0x261C(t1)             # 80127C4C
    sll     t8, a0,  4
    addu    v1, t8, t9
lbl_800B690C:
    lw      t4, 0x0004(v1)             # 00000004
    or      t0, v1, $zero              # t0 = 00000000
    subu    v0, s1, t4
    bltzl   v0, lbl_800B69C0
    addiu   a0, a0, 0x0001             # a0 = 00000001
    lhu     t5, 0x000A(t0)             # 0000000A
    subu    t6, t5, s0
    sltu    $at, t6, v0
    bnel    $at, $zero, lbl_800B69C0
    addiu   a0, a0, 0x0001             # a0 = 00000002
    lbu     t7, 0x000E(t0)             # 0000000E
    bnel    t7, $zero, lbl_800B699C
    addiu   t4, $zero, 0x0020          # t4 = 00000020
    lbu     v0, 0x282D(t1)             # 80127E5D
    lbu     t8, 0x282F(t1)             # 80127E5F
    beql    t8, v0, lbl_800B699C
    addiu   t4, $zero, 0x0020          # t4 = 00000020
    lbu     v1, 0x000D(t0)             # 0000000D
    addu    t9, t1, v0
    beql    v0, v1, lbl_800B6994
    addiu   t9, v0, 0x0001             # t9 = 00000001
    lbu     t4, 0x272C(t9)             # 0000272D
    addu    t5, t1, v1
    sb      t4, 0x272C(t5)             # 0000272C
    lbu     t8, 0x282D(t1)             # 80127E5D
    lw      t7, 0x261C(t1)             # 80127C4C
    lbu     t6, 0x000D(t0)             # 0000000D
    addu    t9, t1, t8
    lbu     t4, 0x272C(t9)             # 0000272D
    sll     t5, t4,  4
    addu    t8, t7, t5
    sb      t6, 0x000D(t8)             # 0000000D
    lbu     v0, 0x282D(t1)             # 80127E5D
    addiu   t9, v0, 0x0001             # t9 = 00000001
lbl_800B6994:
    sb      t9, 0x282D(t1)             # 80127E5D
    addiu   t4, $zero, 0x0020          # t4 = 00000020
lbl_800B699C:
    sb      t4, 0x000E(t0)             # 0000000E
    lw      t7, 0x005C($sp)
    sb      a0, 0x0000(t7)             # 00000000
    lw      t5, 0x0000(t0)             # 00000000
    lw      t8, 0x0004(t0)             # 00000004
    addu    t6, t5, s1
    b       lbl_800B6BC4
    subu    v0, t6, t8
    addiu   a0, a0, 0x0001             # a0 = 00000003
lbl_800B69C0:
    sltu    $at, a0, a1
    bne     $at, $zero, lbl_800B690C
    addiu   v1, v1, 0x0010             # v1 = 00000010
    sw      t0, 0x0048($sp)
    lw      t9, 0x0058($sp)
lbl_800B69D4:
    lw      t0, 0x0048($sp)
    lw      t4, 0x005C($sp)
    bnel    t9, $zero, lbl_800B69F4
    lbu     v0, 0x282D(t1)             # 80127E5D
    lbu     v0, 0x0000(t4)             # 00000020
    b       lbl_800B6A38
    lw      a1, 0x261C(t1)             # 80127C4C
    lbu     v0, 0x282D(t1)             # 80127E5D
lbl_800B69F4:
    lbu     t7, 0x282F(t1)             # 80127E5F
    lw      t5, 0x0058($sp)
    beq     t7, v0, lbl_800B6A2C
    nop
    beq     t5, $zero, lbl_800B6A2C
    addu    t6, t1, v0
    lbu     t2, 0x272C(t6)             # 0000272C
    lw      t4, 0x261C(t1)             # 80127C4C
    addiu   t8, v0, 0x0001             # t8 = 00000001
    sll     t9, t2,  4
    sb      t8, 0x282D(t1)             # 80127E5D
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sw      t2, 0x0038($sp)
    addu    t0, t9, t4
lbl_800B6A2C:
    b       lbl_800B6AF0
    nop
    lw      a1, 0x261C(t1)             # 80127C4C
lbl_800B6A38:
    sll     t7, v0,  4
    addu    t0, t7, a1
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800B6A44:
    lw      v1, 0x0004(t0)             # 00000004
    subu    v0, s1, v1
    bltzl   v0, lbl_800B6AE0
    sll     t5, a0,  4
    lhu     t5, 0x000A(t0)             # 0000000A
    subu    t6, t5, s0
    sltu    $at, t6, v0
    bnel    $at, $zero, lbl_800B6AE0
    sll     t5, a0,  4
    lbu     t8, 0x000E(t0)             # 0000000E
    bnel    t8, $zero, lbl_800B6AC8
    lw      t6, 0x0000(t0)             # 00000000
    lbu     v0, 0x282C(t1)             # 80127E5C
    lbu     v1, 0x000D(t0)             # 0000000D
    addu    t9, t1, v0
    beql    v0, v1, lbl_800B6ABC
    addiu   t9, v0, 0x0001             # t9 = 00000001
    lbu     t4, 0x262C(t9)             # 0000262D
    addu    t7, t1, v1
    sb      t4, 0x262C(t7)             # 0000262C
    lbu     t8, 0x282C(t1)             # 80127E5C
    lw      t6, 0x261C(t1)             # 80127C4C
    lbu     t5, 0x000D(t0)             # 0000000D
    addu    t9, t1, t8
    lbu     t4, 0x262C(t9)             # 0000262D
    sll     t7, t4,  4
    addu    t8, t6, t7
    sb      t5, 0x000D(t8)             # 0000000E
    lbu     v0, 0x282C(t1)             # 80127E5C
    addiu   t9, v0, 0x0001             # t9 = 00000001
lbl_800B6ABC:
    sb      t9, 0x282C(t1)             # 80127E5C
    lw      v1, 0x0004(t0)             # 00000004
    lw      t6, 0x0000(t0)             # 00000000
lbl_800B6AC8:
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    sb      t4, 0x000E(t0)             # 0000000E
    addu    t7, t6, s1
    b       lbl_800B6BC4
    subu    v0, t7, v1
    sll     t5, a0,  4
lbl_800B6AE0:
    addiu   a0, a0, 0x0001             # a0 = 00000001
    sltu    $at, a2, a0
    beq     $at, $zero, lbl_800B6A44
    addu    t0, t5, a1
lbl_800B6AF0:
    bne     t3, $zero, lbl_800B6B28
    lw      t2, 0x0038($sp)
    lbu     v0, 0x282C(t1)             # 80127E5C
    lbu     t8, 0x282E(t1)             # 80127E5E
    addu    t9, t1, v0
    bne     t8, v0, lbl_800B6B14
    addiu   t4, v0, 0x0001             # t4 = 00000001
    b       lbl_800B6BC4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B6B14:
    lbu     t2, 0x262C(t9)             # 0000262D
    lw      t7, 0x261C(t1)             # 80127C4C
    sb      t4, 0x282C(t1)             # 80127E5C
    sll     t6, t2,  4
    addu    t0, t6, t7
lbl_800B6B28:
    lhu     v0, 0x000A(t0)             # 0000000A
    addiu   t5, $zero, 0x0003          # t5 = 00000003
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sb      t5, 0x000E(t0)             # 0000000E
    and     s0, s1, $at
    sw      s0, 0x0004(t0)             # 00000004
    sh      v0, 0x0008(t0)             # 00000008
    lw      v1, 0x28A0(t1)             # 80127ED0
    lw      t9, 0x0000(t0)             # 00000000
    lw      t6, 0x0060($sp)
    sll     t8, v1,  2
    subu    t8, t8, v1
    sll     t8, t8,  3
    lui     t4, 0x8012                 # t4 = 80120000
    lui     t7, 0x8011                 # t7 = 80110000
    addiu   t7, t7, 0x9800             # t7 = 80109800
    addiu   t4, t4, 0x7500             # t4 = 80127500
    addu    a0, t1, t8
    addiu   t5, v1, 0x0001             # t5 = 00000011
    sw      t5, 0x28A0(t1)             # 80127ED0
    addiu   a0, a0, 0x1FE8             # a0 = 00001FE9
    sw      t4, 0x0018($sp)
    sw      t7, 0x0020($sp)
    sw      t2, 0x0038($sp)
    sw      t0, 0x0048($sp)
    or      a3, s0, $zero              # a3 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    sw      v0, 0x0014($sp)
    sw      t9, 0x0010($sp)
    jal     func_800B81A0
    sw      t6, 0x001C($sp)
    lw      t2, 0x0038($sp)
    lw      t8, 0x005C($sp)
    lw      t0, 0x0048($sp)
    subu    t9, s1, s0
    sb      t2, 0x0000(t8)             # 00000000
    lw      t4, 0x0000(t0)             # 00000000
    addu    v0, t9, t4
lbl_800B6BC4:
    lw      $ra, 0x0034($sp)
    lw      s0, 0x002C($sp)
    lw      s1, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800B6BD8:
# MqDbg: AudioLoad_InitSampleDmaBuffers
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x0020($sp)
    lui     s2, 0x8012                 # s2 = 80120000
    addiu   s2, s2, 0x5630             # s2 = 80125630
    lw      t8, 0x2894(s2)             # 80127EC4
    lh      t0, 0x2848(s2)             # 80127E78
    sw      s4, 0x0028($sp)
    sll     t9, t8,  6
    multu   t9, t0
    lw      t6, 0x2874(s2)             # 80127EA4
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x7FF0             # s4 = 80127FF0
    sw      $ra, 0x002C($sp)
    sw      a0, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    or      a0, s4, $zero              # a0 = 80127FF0
    mflo    a1
    sw      t6, 0x288C(s2)             # 80127EBC
    jal     func_800B399C
    nop
    lw      t1, 0x2894(s2)             # 80127EC4
    lh      t3, 0x2848(s2)             # 80127E78
    sw      v0, 0x261C(s2)             # 80127C4C
    sll     t2, t1,  2
    subu    t2, t2, t1
    multu   t2, t3
    or      s1, $zero, $zero           # s1 = 00000000
    mflo    s3
    blezl   s3, lbl_800B6CC4
    lw      a0, 0x2620(s2)             # 80127C50
lbl_800B6C58:
    lw      t4, 0x2620(s2)             # 80127C50
    lw      t6, 0x261C(s2)             # 80127C4C
    or      a0, s4, $zero              # a0 = 80127FF0
    sll     t5, t4,  4
    lw      a1, 0x288C(s2)             # 80127EBC
    jal     func_800B3870
    addu    s0, t5, t6
    bne     v0, $zero, lbl_800B6C84
    sw      v0, 0x0000(s0)             # 00000000
    b       lbl_800B6CC0
    or      s1, $zero, $zero           # s1 = 00000000
lbl_800B6C84:
    lw      a0, 0x0000(s0)             # 00000000
    jal     func_800B37F8
    lw      a1, 0x288C(s2)             # 80127EBC
    lw      t7, 0x288C(s2)             # 80127EBC
    sw      $zero, 0x0004(s0)          # 00000004
    sh      $zero, 0x0008(s0)          # 00000008
    sb      $zero, 0x000C(s0)          # 0000000C
    sb      $zero, 0x000E(s0)          # 0000000E
    sh      t7, 0x000A(s0)             # 0000000A
    lw      t8, 0x2620(s2)             # 80127C50
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   t9, t8, 0x0001             # t9 = 00000001
    bne     s1, s3, lbl_800B6C58
    sw      t9, 0x2620(s2)             # 80127C50
    or      s1, $zero, $zero           # s1 = 00000000
lbl_800B6CC0:
    lw      a0, 0x2620(s2)             # 80127C50
lbl_800B6CC4:
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    beq     a0, $zero, lbl_800B6D00
    or      v1, $zero, $zero           # v1 = 00000000
    sb      s1, 0x262C(v0)             # 80127C5C
lbl_800B6CD8:
    lw      t0, 0x261C(s2)             # 80127C4C
    addiu   v0, v0, 0x0001             # v0 = 80125631
    addu    t1, t0, v1
    sb      s1, 0x000D(t1)             # 0000000D
    lw      a0, 0x2620(s2)             # 80127C50
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   v1, v1, 0x0010             # v1 = 00000010
    sltu    $at, s1, a0
    bnel    $at, $zero, lbl_800B6CD8
    sb      s1, 0x262C(v0)             # 80127C5D
lbl_800B6D00:
    slti    $at, a0, 0x0100
    beq     $at, $zero, lbl_800B6D2C
    or      s1, a0, $zero              # s1 = 00000000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5730             # v1 = 80125730
    addu    v0, s2, s1
lbl_800B6D18:
    addiu   v0, v0, 0x0001             # v0 = 80125632
    sltu    $at, v0, v1
    bne     $at, $zero, lbl_800B6D18
    sb      $zero, 0x262B(v0)          # 80127C5D
    lw      a0, 0x2620(s2)             # 80127C50
lbl_800B6D2C:
    lw      t3, 0x2894(s2)             # 80127EC4
    lw      t2, 0x2878(s2)             # 80127EA8
    sb      $zero, 0x282C(s2)          # 80127E5C
    sb      a0, 0x282E(s2)             # 80127E5E
    sw      a0, 0x2624(s2)             # 80127C54
    or      s1, $zero, $zero           # s1 = 00000000
    blez    t3, lbl_800B6DBC
    sw      t2, 0x288C(s2)             # 80127EBC
lbl_800B6D4C:
    lw      t4, 0x2620(s2)             # 80127C50
    lw      t6, 0x261C(s2)             # 80127C4C
    or      a0, s4, $zero              # a0 = 80127FF0
    sll     t5, t4,  4
    lw      a1, 0x288C(s2)             # 80127EBC
    jal     func_800B3870
    addu    s0, t5, t6
    bne     v0, $zero, lbl_800B6D78
    sw      v0, 0x0000(s0)             # 00000000
    b       lbl_800B6DBC
    lw      a0, 0x2620(s2)             # 80127C50
lbl_800B6D78:
    lw      a0, 0x0000(s0)             # 00000000
    jal     func_800B37F8
    lw      a1, 0x288C(s2)             # 80127EBC
    lw      t7, 0x288C(s2)             # 80127EBC
    sw      $zero, 0x0004(s0)          # 00000004
    sh      $zero, 0x0008(s0)          # 00000008
    sb      $zero, 0x000C(s0)          # 0000000C
    sb      $zero, 0x000E(s0)          # 0000000E
    sh      t7, 0x000A(s0)             # 0000000A
    lw      t0, 0x2894(s2)             # 80127EC4
    lw      t8, 0x2620(s2)             # 80127C50
    addiu   s1, s1, 0x0001             # s1 = 00000001
    slt     $at, s1, t0
    addiu   t9, t8, 0x0001             # t9 = 00000001
    bne     $at, $zero, lbl_800B6D4C
    sw      t9, 0x2620(s2)             # 80127C50
    or      a0, t9, $zero              # a0 = 00000001
lbl_800B6DBC:
    lw      s1, 0x2624(s2)             # 80127C54
    sltu    $at, s1, a0
    beq     $at, $zero, lbl_800B6E10
    sll     v1, s1,  4
    addu    v0, s2, s1
    lw      t1, 0x2624(s2)             # 80127C54
lbl_800B6DD4:
    subu    t2, $zero, t1
    addu    t3, v0, t2
    sb      s1, 0x272C(t3)             # 0000272C
    lw      t6, 0x261C(s2)             # 80127C4C
    lw      t4, 0x2624(s2)             # 80127C54
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addu    t7, t6, v1
    subu    t5, s1, t4
    sb      t5, 0x000D(t7)             # 0000000D
    lw      a0, 0x2620(s2)             # 80127C50
    addiu   s1, s1, 0x0001             # s1 = 00000002
    addiu   v1, v1, 0x0010             # v1 = 00000010
    sltu    $at, s1, a0
    bnel    $at, $zero, lbl_800B6DD4
    lw      t1, 0x2624(s2)             # 80127C54
lbl_800B6E10:
    slti    $at, a0, 0x0100
    beq     $at, $zero, lbl_800B6E40
    or      s1, a0, $zero              # s1 = 00000001
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5730             # v1 = 80125730
    addu    v0, s2, s1
lbl_800B6E28:
    lw      t8, 0x2624(s2)             # 80127C54
    addiu   v0, v0, 0x0001             # v0 = 00000002
    sltu    $at, v0, v1
    bne     $at, $zero, lbl_800B6E28
    sb      t8, 0x272B(v0)             # 0000272D
    lw      a0, 0x2620(s2)             # 80127C50
lbl_800B6E40:
    lw      t9, 0x2624(s2)             # 80127C54
    lw      $ra, 0x002C($sp)
    sb      $zero, 0x282D(s2)          # 80127E5D
    subu    t0, a0, t9
    sb      t0, 0x282F(s2)             # 80127E5F
    lw      s2, 0x0020($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B6E70:
# MqDbg: AudioLoad_IsFontLoadComplete
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800B6E8C
    or      a1, a0, $zero              # a1 = 00000000
    b       lbl_800B6ED8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6E8C:
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, a1
    lbu     t6, -0x7568(t6)            # 80128A98
    slti    $at, t6, 0x0002
    bne     $at, $zero, lbl_800B6EAC
    nop
    b       lbl_800B6ED8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6EAC:
    jal     func_800B7D28
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     t7, 0x8013                 # t7 = 80130000
    addu    t7, t7, v0
    lbu     t7, -0x7568(t7)            # 80128A98
    or      v0, $zero, $zero           # v0 = 00000000
    slti    $at, t7, 0x0002
    bne     $at, $zero, lbl_800B6ED8
    nop
    b       lbl_800B6ED8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6ED8:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6EE8:
# MqDbg: AudioLoad_IsSeqLoadComplete
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800B6F04
    or      a1, a0, $zero              # a1 = 00000000
    b       lbl_800B6F50
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6F04:
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, a1
    lbu     t6, -0x7538(t6)            # 80128AC8
    slti    $at, t6, 0x0002
    bne     $at, $zero, lbl_800B6F24
    nop
    b       lbl_800B6F50
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6F24:
    jal     func_800B7D28
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t7, 0x8013                 # t7 = 80130000
    addu    t7, t7, v0
    lbu     t7, -0x7538(t7)            # 80128AC8
    or      v0, $zero, $zero           # v0 = 00000000
    slti    $at, t7, 0x0002
    bne     $at, $zero, lbl_800B6F50
    nop
    b       lbl_800B6F50
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6F50:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6F60:
# MqDbg: AudioLoad_IsSampleLoadComplete
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800B6F7C
    or      a1, a0, $zero              # a1 = 00000000
    b       lbl_800B6FC8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6F7C:
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, a1
    lbu     t6, -0x7598(t6)            # 80128A68
    slti    $at, t6, 0x0002
    bne     $at, $zero, lbl_800B6F9C
    nop
    b       lbl_800B6FC8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6F9C:
    jal     func_800B7D28
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    lui     t7, 0x8013                 # t7 = 80130000
    addu    t7, t7, v0
    lbu     t7, -0x7598(t7)            # 80128A68
    or      v0, $zero, $zero           # v0 = 00000000
    slti    $at, t7, 0x0002
    bne     $at, $zero, lbl_800B6FC8
    nop
    b       lbl_800B6FC8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B6FC8:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6FD8:
# MqDbg: AudioLoad_SetFontLoadStatus
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a0, $at, lbl_800B7000
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addu    v0, a0, t6
    lbu     t7, 0x3468(v0)             # 00003468
    addiu   $at, $zero, 0x0005         # $at = 00000005
    beq     t7, $at, lbl_800B7000
    nop
    sb      a1, 0x3468(v0)             # 00003468
lbl_800B7000:
    jr      $ra
    nop


func_800B7008:
# MqDbg: AudioLoad_SetSeqLoadStatus
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a0, $at, lbl_800B7030
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addu    v0, a0, t6
    lbu     t7, 0x3498(v0)             # 00003498
    addiu   $at, $zero, 0x0005         # $at = 00000005
    beq     t7, $at, lbl_800B7030
    nop
    sb      a1, 0x3498(v0)             # 00003498
lbl_800B7030:
    jr      $ra
    nop


func_800B7038:
# MqDbg: AudioLoad_SetSampleFontLoadStatusAndApplyCaches
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a0, $at, lbl_800B7088
    sw      $ra, 0x0014($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addu    v1, a0, t6
    lbu     v0, 0x3438(v1)             # 00003438
    addiu   a2, $zero, 0x0005          # a2 = 00000005
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a2, v0, lbl_800B7070
    nop
    sb      a1, 0x3438(v1)             # 00003438
    andi    v0, a1, 0x00FF             # v0 = 00000000
lbl_800B7070:
    beq     a2, v0, lbl_800B7080
    nop
    bnel    v0, $at, lbl_800B708C
    lw      $ra, 0x0014($sp)
lbl_800B7080:
    jal     func_800B6450
    nop
lbl_800B7088:
    lw      $ra, 0x0014($sp)
lbl_800B708C:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B7098:
# MqDbg: AudioLoad_SetSampleFontLoadStatus
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a0, $at, lbl_800B70C0
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addu    v0, a0, t6
    lbu     t7, 0x3438(v0)             # 00003438
    addiu   $at, $zero, 0x0005         # $at = 00000005
    beq     t7, $at, lbl_800B70C0
    nop
    sb      a1, 0x3438(v0)             # 00003438
lbl_800B70C0:
    jr      $ra
    nop


func_800B70C8:
# MqDbg: AudioLoad_InitTable
# Initializes Audiobank, Audioseq, and Audiotable pointer tables for fast DMA access
# A0 = Table Address
# A1 = VRom File Start
# A2 = ? (always 0?)
    sw      a2, 0x0008($sp)
    lh      v1, 0x0000(a0)             # 00000000
    sh      a2, 0x0002(a0)             # 00000002
    sw      a1, 0x0004(a0)             # 00000004
    blez    v1, lbl_800B7120
    or      v0, $zero, $zero           # v0 = 00000000
    or      a2, a0, $zero              # a2 = 00000000
    addiu   a3, $zero, 0x0002          # a3 = 00000002
lbl_800B70E8:
    lw      t6, 0x0014(a2)             # 00000014
    addiu   v0, v0, 0x0001             # v0 = 00000001
    beql    t6, $zero, lbl_800B7118
    slt     $at, v0, v1
    lb      t7, 0x0018(a2)             # 00000018
    bnel    a3, t7, lbl_800B7118
    slt     $at, v0, v1
    lw      t8, 0x0010(a2)             # 00000010
    addu    t9, t8, a1
    sw      t9, 0x0010(a2)             # 00000010
    lh      v1, 0x0000(a0)             # 00000000
    slt     $at, v0, v1
lbl_800B7118:
    bne     $at, $zero, lbl_800B70E8
    addiu   a2, a2, 0x0010             # a2 = 00000010
lbl_800B7120:
    jr      $ra
    nop


func_800B7128:
# MqDbg: AudioLoad_SyncLoadSeqFonts
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s3, 0x0020($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lhu     t6, 0x2840(s3)             # 80127E70
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    slt     $at, a0, t6
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    bne     $at, $zero, lbl_800B7160
    sw      a1, 0x003C($sp)
    b       lbl_800B71BC
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7160:
    lw      v0, 0x283C(s3)             # 80127E6C
    sll     t7, a0,  1
    addiu   s2, $zero, 0x00FF          # s2 = 000000FF
    addu    t8, v0, t7
    lhu     s0, 0x0000(t8)             # 00000000
    addu    t9, s0, v0
    lbu     s1, 0x0000(t9)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    blezl   s1, lbl_800B71B4
    lw      t2, 0x003C($sp)
    lw      t0, 0x283C(s3)             # 80127E6C
lbl_800B718C:
    addu    t1, s0, t0
    lbu     s2, 0x0000(t1)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000002
    jal     func_800B7A14
    or      a0, s2, $zero              # a0 = 000000FF
    addiu   s1, s1, 0xFFFF             # s1 = FFFFFFFF
    bgtzl   s1, lbl_800B718C
    lw      t0, 0x283C(s3)             # 80127E6C
    sw      v0, 0x0028($sp)
    lw      t2, 0x003C($sp)
lbl_800B71B4:
    lw      v0, 0x0028($sp)
    sw      s2, 0x0000(t2)             # 00000000
lbl_800B71BC:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800B71D8:
# MqDbg: AudioLoad_SyncLoadSeqParts
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x7E70(t6)             # 80127E70
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    slt     $at, a0, t6
    beq     $at, $zero, lbl_800B7228
    or      a2, a1, $zero              # a2 = 00000000
    andi    t7, a1, 0x0002             # t7 = 00000000
    beq     t7, $zero, lbl_800B7214
    addiu   a1, $sp, 0x0018            # a1 = FFFFFFF8
    sw      a0, 0x0020($sp)
    jal     func_800B7128
    sw      a2, 0x0024($sp)
    lw      a0, 0x0020($sp)
    lw      a2, 0x0024($sp)
lbl_800B7214:
    andi    t8, a2, 0x0001             # t8 = 00000000
    beql    t8, $zero, lbl_800B722C
    lw      $ra, 0x0014($sp)
    jal     func_800B7884
    nop
lbl_800B7228:
    lw      $ra, 0x0014($sp)
lbl_800B722C:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B7238:
# MqDbg: AudioLoad_SyncLoadSample
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0020($sp)
    lbu     t6, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      s0, a0, $zero              # s0 = 00000000
    andi    t7, t6, 0x0001             # t7 = 00000000
    bnel    t7, $at, lbl_800B7314
    lw      $ra, 0x0024($sp)
    lw      v0, 0x0000(a0)             # 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    sll     v1, v0,  4
    srl     v1, v1, 30
    beq     v1, $zero, lbl_800B7310
    and     a0, v0, $at
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v1, 24
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sw      t8, 0x0010($sp)
    jal     func_800B5B84
    sra     a3, a3, 24
    bne     v0, $zero, lbl_800B72A0
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800B7310
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B72A0:
    lw      v0, 0x0000(s0)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     t9, 0x8012                 # t9 = 80120000
    sll     v1, v0,  4
    srl     v1, v1, 30
    bne     v1, $at, lbl_800B72E4
    or      a3, v1, $zero              # a3 = 00000000
    lw      t9, 0x7E68(t9)             # 80127E68
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a0, 0x0004(s0)             # 00000004
    lh      a3, 0x0002(t9)             # 80120002
    sw      a1, 0x002C($sp)
    jal     func_800B818C
    and     a2, v0, $at
    b       lbl_800B7300
    lbu     t0, 0x0000(s0)             # 00000000
lbl_800B72E4:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a0, 0x0004(s0)             # 00000004
    sw      a1, 0x002C($sp)
    jal     func_800B8068
    and     a2, v0, $at
    lbu     t0, 0x0000(s0)             # 00000000
lbl_800B7300:
    andi    t1, t0, 0xFFF3             # t1 = 00000000
    sb      t1, 0x0000(s0)             # 00000000
    lw      t2, 0x002C($sp)
    sw      t2, 0x0004(s0)             # 00000004
lbl_800B7310:
    lw      $ra, 0x0024($sp)
lbl_800B7314:
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B7324:
# MqDbg: AudioLoad_SyncLoadInstrument
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    slti    $at, a1, 0x007F
    or      s0, a0, $zero              # s0 = 00000000
    beq     $at, $zero, lbl_800B73AC
    sw      $ra, 0x001C($sp)
    jal     func_800BCA58
    nop
    bne     v0, $zero, lbl_800B7354
    or      v1, v0, $zero              # v1 = 00000000
    b       lbl_800B73E0
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B7354:
    lbu     t6, 0x0001(v0)             # 00000000
    or      a1, s0, $zero              # a1 = 00000000
    beql    t6, $zero, lbl_800B7378
    lw      a0, 0x0010(v1)             # 00000010
    lw      a0, 0x0008(v1)             # 00000008
    jal     func_800B7238
    sw      v1, 0x0024($sp)
    lw      v1, 0x0024($sp)
    lw      a0, 0x0010(v1)             # 00000010
lbl_800B7378:
    sw      v1, 0x0024($sp)
    jal     func_800B7238
    or      a1, s0, $zero              # a1 = 00000000
    lw      v1, 0x0024($sp)
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    or      a1, s0, $zero              # a1 = 00000000
    lbu     t7, 0x0002(v1)             # 00000002
    beql    t7, $at, lbl_800B73E4
    lw      $ra, 0x001C($sp)
    jal     func_800B7238
    lw      a0, 0x0018(v1)             # 00000018
    b       lbl_800B73E4
    lw      $ra, 0x001C($sp)
lbl_800B73AC:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    bne     a1, $at, lbl_800B73E0
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BCB2C
    or      a1, a2, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800B73D0
    or      v1, v0, $zero              # v1 = 00000000
    b       lbl_800B73E0
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B73D0:
    lw      a0, 0x0004(v1)             # 00000004
    jal     func_800B7238
    or      a1, s0, $zero              # a1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B73E0:
    lw      $ra, 0x001C($sp)
lbl_800B73E4:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800B73F4:
# MqDbg: AudioLoad_AsyncLoad
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lw      t6, 0x0030($sp)
    sw      $ra, 0x001C($sp)
    jal     func_800B82A0
    sw      t6, 0x0010($sp)
    bne     v0, $zero, lbl_800B741C
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    jal     func_80001E20              # osSendMesg
    or      a2, $zero, $zero           # a2 = 00000000
lbl_800B741C:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B742C:
# MqDbg: AudioLoad_AsyncLoadSeq
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a3, 0x002C($sp)
    lw      t6, 0x002C($sp)
    sw      a1, 0x0024($sp)
    or      a1, a0, $zero              # a1 = 00000000
    or      a3, a2, $zero              # a3 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800B73F4
    sw      t6, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B7470:
# MqDbg: AudioLoad_AsyncLoadSampleBank
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a3, 0x002C($sp)
    lw      t6, 0x002C($sp)
    sw      a1, 0x0024($sp)
    or      a1, a0, $zero              # a1 = 00000000
    or      a3, a2, $zero              # a3 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    jal     func_800B73F4
    sw      t6, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B74B4:
# MqDbg: AudioLoad_AsyncLoadFont
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a3, 0x002C($sp)
    lw      t6, 0x002C($sp)
    sw      a1, 0x0024($sp)
    or      a1, a0, $zero              # a1 = 00000000
    or      a3, a2, $zero              # a3 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    jal     func_800B73F4
    sw      t6, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B74F8:
# MqDbg: AudioLoad_GetFontsForSequence
# Fetch data from some Music table? (Reads from 801139B0, Music Related Table)
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lw      v0, 0x283C(a2)             # 80127E6C
    sll     t6, a0,  1
    addu    t7, v0, t6
    lhu     v1, 0x0000(t7)             # 00000000
    addu    t8, v1, v0
    lbu     t9, 0x0000(t8)             # 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
    bne     t9, $zero, lbl_800B752C
    sw      t9, 0x0000(a1)             # 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B752C:
    lw      t1, 0x283C(a2)             # 80127E6C
    addu    v0, t1, v1
    jr      $ra
    nop


func_800B753C:
# MqDbg: AudioLoad_DiscardSeqFonts
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s3, 0x0020($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lw      v0, 0x283C(s3)             # 80127E6C
    sll     t6, a0,  1
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addu    t7, v0, t6
    lhu     s1, 0x0000(t7)             # 00000000
    addu    t8, s1, v0
    lbu     s2, 0x0000(t8)             # 00000000
    addiu   s1, s1, 0x0001             # s1 = 00000001
    blezl   s2, lbl_800B75D4
    lw      $ra, 0x0024($sp)
    lw      t9, 0x283C(s3)             # 80127E6C
lbl_800B7584:
    addiu   s2, s2, 0xFFFF             # s2 = FFFFFFFF
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addu    t0, s1, t9
    lbu     a1, 0x0000(t0)             # 00000000
    jal     func_800B7D28
    addiu   s1, s1, 0x0001             # s1 = 00000002
    or      s0, v0, $zero              # s0 = 00000000
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    jal     func_800B5AA8
    or      a1, v0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800B75C8
    nop
    jal     func_800B75EC
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800B6FD8
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800B75C8:
    bgtzl   s2, lbl_800B7584
    lw      t9, 0x283C(s3)             # 80127E6C
    lw      $ra, 0x0024($sp)
lbl_800B75D4:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800B75EC:
# MqDbg: AudioLoad_DiscardFont
    lui     t6, 0x8013                 # t6 = 80130000
    lh      t6, -0x7DAE(t6)            # 80128252
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    bne     a0, t6, lbl_800B7614
    or      a2, a0, $zero              # a2 = 00000000
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    lui     $at, 0x8013                # $at = 80130000
    b       lbl_800B7630
    sh      t7, -0x7DAE($at)           # 80128252
lbl_800B7614:
    lui     t8, 0x8013                 # t8 = 80130000
    lh      t8, -0x7DA2(t8)            # 8012825E
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
    lui     $at, 0x8013                # $at = 80130000
    bne     a2, t8, lbl_800B7630
    nop
    sh      t9, -0x7DA2($at)           # 8012825E
lbl_800B7630:
    lui     t1, 0x8013                 # t1 = 80130000
    lw      t1, -0x7EA0(t1)            # 80128160
    lui     t0, 0x8013                 # t0 = 80130000
    addiu   t0, t0, 0x8160             # t0 = 80128160
    or      a0, t0, $zero              # a0 = 80128160
    beq     t1, $zero, lbl_800B767C
    or      v1, $zero, $zero           # v1 = 00000000
    or      v0, t0, $zero              # v0 = 80128160
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    lh      t2, 0x001E(v0)             # 8012817E
lbl_800B7658:
    bnel    a2, t2, lbl_800B7668
    lw      t3, 0x0000(a0)             # 80128160
    sh      a1, 0x001E(v0)             # 8012817E
    lw      t3, 0x0000(a0)             # 80128160
lbl_800B7668:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    addiu   v0, v0, 0x000C             # v0 = 8012816C
    sltu    $at, v1, t3
    bnel    $at, $zero, lbl_800B7658
    lh      t2, 0x001E(v0)             # 8012818A
lbl_800B767C:
    jal     func_800B3608
    or      a0, a2, $zero              # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B7694:
# MqDbg: AudioLoad_SyncInitSeqPlayer
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2984(v0)             # 80127FB4
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     t6, $zero, lbl_800B76B8
    sll     t7, a0,  2
    b       lbl_800B76D4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B76B8:
    subu    t7, t7, a0
    sll     t7, t7,  2
    subu    t7, t7, a0
    sll     t7, t7,  5
    addu    t8, v0, t7
    jal     func_800B773C
    sw      $zero, 0x360C(t8)          # 0000360C
lbl_800B76D4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B76E4:
# MqDbg: AudioLoad_SyncInitSeqPlayerSkipTicks
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2984(v0)             # 80127FB4
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     t6, $zero, lbl_800B7708
    or      a3, a2, $zero              # a3 = 00000000
    b       lbl_800B772C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7708:
    sll     t7, a0,  2
    subu    t7, t7, a0
    sll     t7, t7,  2
    subu    t7, t7, a0
    sll     t7, t7,  5
    addu    t8, v0, t7
    sw      a3, 0x360C(t8)             # 0000360C
    jal     func_800B773C
    or      a2, $zero, $zero           # a2 = 00000000
lbl_800B772C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B773C:
# MqDbg: AudioLoad_SyncInitSeqPlayerInternal
# Initalizes data for Sequence playback
# A0 = ?
# A1 = Sequence to preload data
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s3, 0x0024($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lhu     t7, 0x2840(s3)             # 80127E70
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    slt     $at, a1, t7
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    bne     $at, $zero, lbl_800B7780
    sw      a2, 0x0038($sp)
    b       lbl_800B7864
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7780:
    lw      t8, 0x0030($sp)
    sll     t9, t8,  2
    subu    t9, t9, t8
    sll     t9, t9,  2
    subu    t9, t9, t8
    sll     t9, t9,  5
    addu    s4, s3, t9
    addiu   s4, s4, 0x3530             # s4 = 00003530
    jal     func_800BF12C
    or      a0, s4, $zero              # a0 = 00003530
    lw      t0, 0x0034($sp)
    lw      v0, 0x283C(s3)             # 80127E6C
    addiu   s2, $zero, 0x00FF          # s2 = 000000FF
    sll     t1, t0,  1
    addu    t2, v0, t1
    lhu     s0, 0x0000(t2)             # 00000000
    addu    t3, s0, v0
    lbu     s1, 0x0000(t3)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    blez    s1, lbl_800B77F8
    nop
    lw      t4, 0x283C(s3)             # 80127E6C
lbl_800B77D8:
    addu    t5, s0, t4
    lbu     s2, 0x0000(t5)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000002
    jal     func_800B7A14
    or      a0, s2, $zero              # a0 = 000000FF
    addiu   s1, s1, 0xFFFF             # s1 = FFFFFFFF
    bgtzl   s1, lbl_800B77D8
    lw      t4, 0x283C(s3)             # 80127E6C
lbl_800B77F8:
    jal     func_800B7884
    lw      a0, 0x0034($sp)
    bne     v0, $zero, lbl_800B7810
    or      s0, v0, $zero              # s0 = 00000000
    b       lbl_800B7864
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7810:
    jal     func_800C1C28
    or      a0, s4, $zero              # a0 = 00003530
    lw      t6, 0x0034($sp)
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    or      a1, s2, $zero              # a1 = 000000FF
    jal     func_800B7D28
    sb      t6, 0x0004(s4)             # 00003534
    lbu     t8, 0x0000(s4)             # 00003530
    sb      v0, 0x0005(s4)             # 00003535
    sw      s0, 0x0018(s4)             # 00003548
    ori     t0, t8, 0x0080             # t0 = 00000080
    sb      t0, 0x0000(s4)             # 00003530
    andi    t1, t0, 0x00BF             # t1 = 00000080
    sw      s0, 0x0078(s4)             # 000035A8
    sb      $zero, 0x0090(s4)          # 000035C0
    sh      $zero, 0x0010(s4)          # 00003540
    sb      t1, 0x0000(s4)             # 00003530
    lw      t2, 0x0030($sp)
    or      a0, s4, $zero              # a0 = 00003530
    jal     func_800C1BD8
    sb      t2, 0x0007(s4)             # 00003537
lbl_800B7864:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B7884:
# MqDbg: AudioLoad_SyncLoadSeq
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    lw      a1, 0x0028($sp)
    jal     func_800B7D28
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, v0
    lbu     t6, -0x7538(t6)            # 80128AC8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      a0, $zero, $zero           # a0 = 00000000
    bne     t6, $at, lbl_800B78C0
    lw      a1, 0x0028($sp)
    b       lbl_800B78C8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B78C0:
    jal     func_800B7B18
    addiu   a2, $sp, 0x0020            # a2 = FFFFFFF8
lbl_800B78C8:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800B78D8:
# MqDbg: AudioLoad_GetSampleBank
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B78F8
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B78F8:
# MqDbg: AudioLoad_TrySyncLoadSampleBank
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0038($sp)
    sw      a1, 0x003C($sp)
    sw      s0, 0x0018($sp)
    sw      a2, 0x0040($sp)
    lw      a1, 0x0038($sp)
    jal     func_800B7D28
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      s0, v0, $zero              # s0 = 00000000
    jal     func_800B7DB8
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800B7D64
    sw      v0, 0x0030($sp)
    lw      v1, 0x0030($sp)
    beq     v0, $zero, lbl_800B797C
    or      a2, v0, $zero              # a2 = 00000000
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, s0
    lbu     t6, -0x7598(t6)            # 80128A68
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      a0, s0, $zero              # a0 = 00000000
    beq     t6, $at, lbl_800B796C
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B7098
    sw      v0, 0x0034($sp)
    lw      a2, 0x0034($sp)
lbl_800B796C:
    lw      t7, 0x003C($sp)
    or      v0, a2, $zero              # v0 = 00000000
    b       lbl_800B7A00
    sw      $zero, 0x0000(t7)          # 00000000
lbl_800B797C:
    lw      a1, 0x0038($sp)
    addiu   $at, $zero, 0x0004         # $at = 00000004
    lw      t9, 0x0040($sp)
    sll     t8, a1,  4
    addu    a3, v1, t8
    lb      v0, 0x0019(a3)             # 00000019
    lw      t1, 0x003C($sp)
    beq     v0, $at, lbl_800B79A8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t9, $at, lbl_800B79C0
    addiu   a0, $zero, 0x0002          # a0 = 00000002
lbl_800B79A8:
    lb      t0, 0x0018(a3)             # 00000018
    sll     t2, s0,  4
    addu    t3, v1, t2
    sw      t0, 0x0000(t1)             # 00000000
    b       lbl_800B7A00
    lw      v0, 0x0010(t3)             # 00000010
lbl_800B79C0:
    addiu   a2, $sp, 0x0040            # a2 = 00000008
    sw      v1, 0x0030($sp)
    jal     func_800B7B18
    sw      a3, 0x0024($sp)
    lw      v1, 0x0030($sp)
    beq     v0, $zero, lbl_800B79E8
    lw      a3, 0x0024($sp)
    lw      t4, 0x003C($sp)
    b       lbl_800B7A00
    sw      $zero, 0x0000(t4)          # 00000000
lbl_800B79E8:
    lb      t5, 0x0018(a3)             # 00000018
    lw      t6, 0x003C($sp)
    sll     t7, s0,  4
    addu    t8, v1, t7
    sw      t5, 0x0000(t6)             # 00000000
    lw      v0, 0x0010(t8)             # 00000010
lbl_800B7A00:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800B7A14:
# MqDbg: AudioLoad_SyncLoadFont
# Initalizes Instrument Set?
# A0 = instrument set
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    lw      a1, 0x0048($sp)
    jal     func_800B7D28
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    addu    t6, a1, v0
    lbu     t7, 0x3468(t6)             # 00003468
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      v0, 0x001C($sp)
    bne     t7, $at, lbl_800B7A54
    sll     t9, v0,  2
    b       lbl_800B7B08
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7A54:
    lw      t8, 0x2844(a1)             # 80127E74
    addu    t9, t9, v0
    sll     t9, t9,  2
    addu    v1, t8, t9
    lbu     a0, 0x0002(v1)             # 00000002
    lbu     a3, 0x0003(v1)             # 00000003
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      a0, 0x0020($sp)
    beq     a0, $at, lbl_800B7A98
    sw      a3, 0x0024($sp)
    addiu   a1, $sp, 0x0030            # a1 = FFFFFFE8
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B78F8
    sw      a3, 0x003C($sp)
    lw      a3, 0x003C($sp)
    b       lbl_800B7A9C
    sw      v0, 0x0028($sp)
lbl_800B7A98:
    sw      $zero, 0x0028($sp)
lbl_800B7A9C:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a3, $at, lbl_800B7ABC
    or      a0, a3, $zero              # a0 = 00000000
    addiu   a1, $sp, 0x0034            # a1 = FFFFFFEC
    jal     func_800B78F8
    or      a2, $zero, $zero           # a2 = 00000000
    b       lbl_800B7AC0
    sw      v0, 0x002C($sp)
lbl_800B7ABC:
    sw      $zero, 0x002C($sp)
lbl_800B7AC0:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      a1, 0x0048($sp)
    jal     func_800B7B18
    addiu   a2, $sp, 0x0038            # a2 = FFFFFFF0
    bne     v0, $zero, lbl_800B7AE0
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800B7B08
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7AE0:
    lw      t0, 0x0038($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      a0, 0x001C($sp)
    bne     t0, $at, lbl_800B7B04
    addiu   a2, $sp, 0x0020            # a2 = FFFFFFD8
    or      a3, $zero, $zero           # a3 = 00000000
    jal     func_800B9758
    sw      a1, 0x0044($sp)
    lw      a1, 0x0044($sp)
lbl_800B7B04:
    or      v0, a1, $zero              # v0 = 00000000
lbl_800B7B08:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800B7B18:
# MqDbg: AudioLoad_SyncLoad
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0050($sp)
    sw      a1, 0x0054($sp)
    jal     func_800B7D28
    sw      a2, 0x0058($sp)
    sw      v0, 0x002C($sp)
    lw      a0, 0x0050($sp)
    jal     func_800B7D64
    or      a1, v0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B7B5C
    or      s0, v0, $zero              # s0 = 00000000
    lw      t6, 0x0058($sp)
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    b       lbl_800B7CC0
    sw      $zero, 0x0000(t6)          # 00000000
lbl_800B7B5C:
    jal     func_800B7DB8
    lw      a0, 0x0050($sp)
    lw      t7, 0x002C($sp)
    sw      v0, 0x0048($sp)
    lw      t3, 0x0054($sp)
    sll     t8, t7,  4
    addu    v1, v0, t8
    lw      t9, 0x0014(v1)             # 00000014
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sll     t4, t3,  4
    addiu   t1, t9, 0x000F             # t1 = 0000000F
    and     t2, t1, $at
    sw      t9, 0x004C($sp)
    sw      t2, 0x004C($sp)
    addu    a0, v0, t4
    lb      t5, 0x0018(a0)             # 00000018
    sw      t5, 0x0040($sp)
    lb      a1, 0x0019(a0)             # 00000019
    lw      t6, 0x0010(v1)             # 00000010
    sltiu   $at, a1, 0x0005
    sw      a1, 0x0024($sp)
    beq     $at, $zero, lbl_800B7C5C
    sw      t6, 0x0038($sp)
    sll     t7, a1,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x67C8($at)           # 80109838
    jr      t7
    nop
    lw      a0, 0x0050($sp)
    lw      a1, 0x002C($sp)
    jal     func_800B5B00
    lw      a2, 0x004C($sp)
    bne     v0, $zero, lbl_800B7C5C
    or      s0, v0, $zero              # s0 = 00000000
    b       lbl_800B7D18
    lw      $ra, 0x001C($sp)
    lw      a0, 0x0050($sp)
    lw      a1, 0x004C($sp)
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    jal     func_800B3EA0
    lw      a3, 0x002C($sp)
    bne     v0, $zero, lbl_800B7C5C
    or      s0, v0, $zero              # s0 = 00000000
    b       lbl_800B7D18
    lw      $ra, 0x001C($sp)
    lw      a0, 0x0050($sp)
    lw      a1, 0x004C($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B3EA0
    lw      a3, 0x002C($sp)
    bne     v0, $zero, lbl_800B7C5C
    or      s0, v0, $zero              # s0 = 00000000
    b       lbl_800B7D18
    lw      $ra, 0x001C($sp)
    lw      a0, 0x0050($sp)
    lw      a1, 0x004C($sp)
    addiu   a2, $zero, 0x0002          # a2 = 00000002
    jal     func_800B3EA0
    lw      a3, 0x002C($sp)
    bne     v0, $zero, lbl_800B7C5C
    or      s0, v0, $zero              # s0 = 00000000
    b       lbl_800B7D18
    lw      $ra, 0x001C($sp)
lbl_800B7C5C:
    lw      t9, 0x0058($sp)
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      t8, 0x0000(t9)             # 00000000
    lw      t0, 0x0040($sp)
    lw      a2, 0x004C($sp)
    lw      a0, 0x0038($sp)
    bne     t0, $at, lbl_800B7CA0
    or      a1, s0, $zero              # a1 = 00000000
    lw      t1, 0x0048($sp)
    lw      a0, 0x0038($sp)
    or      a1, s0, $zero              # a1 = 00000000
    lw      a2, 0x004C($sp)
    jal     func_800B818C
    lh      a3, 0x0002(t1)             # 00000002
    b       lbl_800B7CAC
    lw      t2, 0x0024($sp)
lbl_800B7CA0:
    jal     func_800B8068
    lw      a3, 0x0040($sp)
    lw      t2, 0x0024($sp)
lbl_800B7CAC:
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    bne     t2, $zero, lbl_800B7CC0
    nop
    b       lbl_800B7CC0
    addiu   a1, $zero, 0x0005          # a1 = 00000005
lbl_800B7CC0:
    lw      v0, 0x0050($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $zero, lbl_800B7CE8
    nop
    beq     v0, $at, lbl_800B7CF8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800B7D08
    nop
    b       lbl_800B7D14
    or      v0, s0, $zero              # v0 = 00000000
lbl_800B7CE8:
    jal     func_800B7008
    lw      a0, 0x002C($sp)
    b       lbl_800B7D14
    or      v0, s0, $zero              # v0 = 00000000
lbl_800B7CF8:
    jal     func_800B6FD8
    lw      a0, 0x002C($sp)
    b       lbl_800B7D14
    or      v0, s0, $zero              # v0 = 00000000
lbl_800B7D08:
    jal     func_800B7038
    lw      a0, 0x002C($sp)
    or      v0, s0, $zero              # v0 = 00000000
lbl_800B7D14:
    lw      $ra, 0x001C($sp)
lbl_800B7D18:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_800B7D28:
# MqDbg: AudioLoad_GetRealTableIndex
# Returns pointer to an Audio DMA table record
# A0 = Audio DMA table id, valid range between 0 and 2
# A1 = instrument set
# V0 = Record index (1 based index)
# V1 = Pointer to record
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B7DB8
    sw      a1, 0x001C($sp)
    lw      a1, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    sll     t6, a1,  4
    addu    v1, v0, t6
    lw      t7, 0x0014(v1)             # 00000014
    bnel    t7, $zero, lbl_800B7D5C
    or      v0, a1, $zero              # v0 = 00000000
    lw      a1, 0x0010(v1)             # 00000010
    or      v0, a1, $zero              # v0 = 00000000
lbl_800B7D5C:
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800B7D64:
# MqDbg: AudioLoad_SearchCaches
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    jal     func_800B5AA8
    sw      a1, 0x001C($sp)
    beq     v0, $zero, lbl_800B7D88
    lw      a0, 0x0018($sp)
    b       lbl_800B7DAC
    lw      $ra, 0x0014($sp)
lbl_800B7D88:
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    lw      a2, 0x001C($sp)
    beql    v0, $zero, lbl_800B7DA8
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800B7DAC
    lw      $ra, 0x0014($sp)
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7DA8:
    lw      $ra, 0x0014($sp)
lbl_800B7DAC:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B7DB8:
# MqDbg: AudioLoad_GetLoadTable
# Returns pointer to an Audio DMA table
# A0 = Audio DMA table id. 0 is Audioseq DMA, 1 is Audiobank DMA, 2 is Audiotable DMA
# V0 = pointer stored at 80127E60, 64, or 68 if A0 = 0 to 2, otherwise null
    beq     a0, $zero, lbl_800B7DE0
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a0, $at, lbl_800B7DE8
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a0, $at, lbl_800B7DF0
    lui     v1, 0x8012                 # v1 = 80120000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B7DE0:
    jr      $ra
    lw      v0, 0x7E60(v1)             # 80127E60
lbl_800B7DE8:
    jr      $ra
    lw      v0, 0x7E64(v1)             # 80127E64
lbl_800B7DF0:
    lw      v1, 0x7E68(v1)             # 80127E68
    jr      $ra
    or      v0, v1, $zero              # v0 = 80120000


func_800B7DFC:
# MqDbg: AudioLoad_RelocateFont
    addiu   $sp, $sp, 0xFF90           # $sp -= 0x70
    sll     t6, a0,  2
    lui     t7, 0x8012                 # t7 = 80120000
    lw      t7, 0x7E74(t7)             # 80127E74
    addu    t6, t6, a0
    sll     t6, t6,  2
    sw      $ra, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      t6, 0x0044($sp)
    addu    v0, t7, t6
    lbu     t9, 0x0000(v0)             # 00000000
    lbu     a3, 0x0001(v0)             # 00000001
    or      s3, a1, $zero              # s3 = 00000000
    sw      t9, 0x0050($sp)
    lw      v1, 0x0000(a1)             # 00000000
    or      s4, a2, $zero              # s4 = 00000000
    lhu     s5, 0x0004(v0)             # 00000004
    beql    v1, $zero, lbl_800B7EE0
    lw      v1, 0x0004(s3)             # 00000004
    beq     a3, $zero, lbl_800B7EDC
    addu    t0, v1, a1
    blez    a3, lbl_800B7EDC
    sw      t0, 0x0000(a1)             # 00000000
    or      s2, $zero, $zero           # s2 = 00000000
    sll     v1, a3,  2
    addiu   s6, $zero, 0x0001          # s6 = 00000001
    lw      t1, 0x0000(s3)             # 00000000
lbl_800B7E80:
    addu    v0, t1, s2
    lw      s0, 0x0000(v0)             # 00000000
    beq     s0, $zero, lbl_800B7ED0
    addu    s0, s0, s3
    sw      s0, 0x0000(v0)             # 00000000
    lbu     t2, 0x0002(s0)             # 00000002
    or      s1, s0, $zero              # s1 = 00000000
    addiu   a0, s0, 0x0004             # a0 = 00000004
    bne     t2, $zero, lbl_800B7ED0
    or      a1, s3, $zero              # a1 = 00000000
    or      a2, s4, $zero              # a2 = 00000000
    sw      v1, 0x003C($sp)
    jal     func_800B9618
    sw      a3, 0x0054($sp)
    lw      s0, 0x000C(s1)             # 0000000C
    lw      v1, 0x003C($sp)
    lw      a3, 0x0054($sp)
    addu    t3, s0, s3
    sw      t3, 0x000C(s1)             # 0000000C
    sb      s6, 0x0002(s1)             # 00000002
lbl_800B7ED0:
    addiu   s2, s2, 0x0004             # s2 = 00000004
    bnel    s2, v1, lbl_800B7E80
    lw      t1, 0x0000(s3)             # 00000000
lbl_800B7EDC:
    lw      v1, 0x0004(s3)             # 00000004
lbl_800B7EE0:
    addiu   s6, $zero, 0x0001          # s6 = 00000001
    beql    v1, $zero, lbl_800B7F40
    lw      t7, 0x0050($sp)
    beq     s5, $zero, lbl_800B7F3C
    addu    t4, v1, s3
    blez    s5, lbl_800B7F3C
    sw      t4, 0x0004(s3)             # 00000004
    or      s1, $zero, $zero           # s1 = 00000000
    sll     s2, s5,  3
    lw      t5, 0x0004(s3)             # 00000004
lbl_800B7F08:
    addu    s0, t5, s1
    beql    s0, $zero, lbl_800B7F34
    addiu   s1, s1, 0x0008             # s1 = 00000008
    lw      t6, 0x0000(s0)             # 00000000
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, s3, $zero              # a1 = 00000000
    beql    t6, $zero, lbl_800B7F34
    addiu   s1, s1, 0x0008             # s1 = 00000010
    jal     func_800B9618
    or      a2, s4, $zero              # a2 = 00000000
    addiu   s1, s1, 0x0008             # s1 = 00000018
lbl_800B7F34:
    bnel    s1, s2, lbl_800B7F08
    lw      t5, 0x0004(s3)             # 00000004
lbl_800B7F3C:
    lw      t7, 0x0050($sp)
lbl_800B7F40:
    addiu   t8, $zero, 0x007E          # t8 = 0000007E
    addiu   s2, s3, 0x0008             # s2 = 00000008
    slti    $at, t7, 0x007F
    bnel    $at, $zero, lbl_800B7F5C
    lw      v1, 0x0050($sp)
    sw      t8, 0x0050($sp)
    lw      v1, 0x0050($sp)
lbl_800B7F5C:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_800B7FF8
    sll     t9, v1,  2
    addu    s5, t9, s3
    lw      v0, 0x0000(s2)             # 00000008
lbl_800B7F74:
    beq     v0, $zero, lbl_800B7FE8
    addu    t0, v0, s3
    sw      t0, 0x0000(s2)             # 00000008
    lbu     t1, 0x0000(t0)             # 00000000
    or      s1, t0, $zero              # s1 = 00000000
    bnel    t1, $zero, lbl_800B7FEC
    addiu   s2, s2, 0x0004             # s2 = 0000000C
    lbu     t2, 0x0001(t0)             # 00000001
    addiu   a0, t0, 0x0008             # a0 = 00000008
    or      a1, s3, $zero              # a1 = 00000000
    beql    t2, $zero, lbl_800B7FB0
    addiu   a0, s1, 0x0010             # a0 = 00000010
    jal     func_800B9618
    or      a2, s4, $zero              # a2 = 00000000
    addiu   a0, s1, 0x0010             # a0 = 00000010
lbl_800B7FB0:
    or      a1, s3, $zero              # a1 = 00000000
    jal     func_800B9618
    or      a2, s4, $zero              # a2 = 00000000
    lbu     t3, 0x0002(s1)             # 00000002
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    addiu   a0, s1, 0x0018             # a0 = 00000018
    beq     t3, $at, lbl_800B7FD8
    or      a1, s3, $zero              # a1 = 00000000
    jal     func_800B9618
    or      a2, s4, $zero              # a2 = 00000000
lbl_800B7FD8:
    lw      s0, 0x0004(s1)             # 00000004
    sb      s6, 0x0000(s1)             # 00000000
    addu    t4, s0, s3
    sw      t4, 0x0004(s1)             # 00000004
lbl_800B7FE8:
    addiu   s2, s2, 0x0004             # s2 = 00000010
lbl_800B7FEC:
    sltu    $at, s5, s2
    beql    $at, $zero, lbl_800B7F74
    lw      v0, 0x0000(s2)             # 00000010
lbl_800B7FF8:
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7E74(t6)             # 80127E74
    lw      t7, 0x0044($sp)
    lw      t5, 0x0000(s3)             # 00000000
    lui     t0, 0x8012                 # t0 = 80120000
    addu    t8, t6, t7
    sw      t5, 0x000C(t8)             # 0000000C
    lw      t1, 0x0044($sp)
    lw      t0, 0x7E74(t0)             # 80127E74
    lw      t9, 0x0004(s3)             # 00000004
    lui     t4, 0x8012                 # t4 = 80120000
    addu    t2, t0, t1
    sw      t9, 0x0010(t2)             # 00000010
    lw      t6, 0x0044($sp)
    lw      t4, 0x7E74(t4)             # 80127E74
    addiu   t3, s3, 0x0008             # t3 = 00000008
    addu    t7, t4, t6
    sw      t3, 0x0008(t7)             # 00000008
    lw      $ra, 0x0034($sp)
    lw      s6, 0x0030($sp)
    lw      s5, 0x002C($sp)
    lw      s4, 0x0028($sp)
    lw      s3, 0x0024($sp)
    lw      s2, 0x0020($sp)
    lw      s1, 0x001C($sp)
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070           # $sp += 0x70


func_800B8068:
# MqDbg: AudioLoad_SyncDma
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s2, 0x0038($sp)
    sw      s0, 0x0030($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      s1, 0x0034($sp)
    addiu   s0, a2, 0x000F             # s0 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    or      s1, a1, $zero              # s1 = 00000000
    sw      $ra, 0x004C($sp)
    sw      s5, 0x0044($sp)
    and     s0, s0, $at
    or      a0, a1, $zero              # a0 = 00000000
    or      s5, a3, $zero              # s5 = 00000000
    sw      s6, 0x0048($sp)
    sw      s4, 0x0040($sp)
    sw      s3, 0x003C($sp)
    jal     func_800BBE00
    or      a1, s0, $zero              # a1 = 0000000F
    lui     s6, 0x8012                 # s6 = 80120000
    lui     s4, 0x8011                 # s4 = 80110000
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x7C18             # s3 = 80127C18
    addiu   s4, s4, 0x980C             # s4 = 8010980C
    addiu   s6, s6, 0x7C34             # s6 = 80127C34
    sltiu   $at, s0, 0x0400
    bne     $at, $zero, lbl_800B8120
lbl_800B80D0:
    addiu   t6, $zero, 0x0400          # t6 = 00000400
    sw      t6, 0x0014($sp)
    or      a0, s6, $zero              # a0 = 80127C34
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, s2, $zero              # a3 = 00000000
    sw      s1, 0x0010($sp)
    sw      s3, 0x0018($sp)
    sw      s5, 0x001C($sp)
    jal     func_800B81A0
    sw      s4, 0x0020($sp)
    or      a0, s3, $zero              # a0 = 80127C18
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_80002030              # osRecvMesg
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    addiu   s0, s0, 0xFC00             # s0 = FFFFFC0F
    sltiu   $at, s0, 0x0400
    addiu   s2, s2, 0x0400             # s2 = 00000400
    beq     $at, $zero, lbl_800B80D0
    addiu   s1, s1, 0x0400             # s1 = 00000400
lbl_800B8120:
    beq     s0, $zero, lbl_800B8164
    or      a0, s6, $zero              # a0 = 80127C34
    lui     t7, 0x8011                 # t7 = 80110000
    addiu   t7, t7, 0x9818             # t7 = 80109818
    sw      t7, 0x0020($sp)
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, s2, $zero              # a3 = 00000400
    sw      s1, 0x0010($sp)
    sw      s0, 0x0014($sp)
    sw      s3, 0x0018($sp)
    jal     func_800B81A0
    sw      s5, 0x001C($sp)
    or      a0, s3, $zero              # a0 = 80127C18
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_80002030              # osRecvMesg
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800B8164:
    lw      $ra, 0x004C($sp)
    lw      s0, 0x0030($sp)
    lw      s1, 0x0034($sp)
    lw      s2, 0x0038($sp)
    lw      s3, 0x003C($sp)
    lw      s4, 0x0040($sp)
    lw      s5, 0x0044($sp)
    lw      s6, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800B818C:
# MqDbg: AudioLoad_SyncDmaUnkMedium
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    jr      $ra
    sw      a3, 0x000C($sp)


func_800B81A0:
# MqDbg: AudioLoad_Dma
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2984(v0)             # 80127FB4
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s0, 0x0018($sp)
    sltiu   $at, t6, 0x0011
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    bne     $at, $zero, lbl_800B81D0
    sw      a1, 0x0024($sp)
    b       lbl_800B8264
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B81D0:
    lw      v1, 0x003C($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lw      t8, 0x0024($sp)
    beq     v1, $at, lbl_800B81F4
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v1, $at, lbl_800B81FC
    nop
    b       lbl_800B8264
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B81F4:
    b       lbl_800B820C
    lw      a0, 0x1E18(v0)             # 00001E18
lbl_800B81FC:
    b       lbl_800B820C
    lw      a0, 0x1E1C(v0)             # 00001E1C
    b       lbl_800B8264
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B820C:
    lw      v0, 0x0034($sp)
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    andi    t7, v0, 0x000F             # t7 = 00000000
    beql    t7, $zero, lbl_800B822C
    sb      t8, 0x0002(s0)             # 00000002
    addiu   v0, v0, 0x000F             # v0 = 0000000F
    and     v0, v0, $at
    sb      t8, 0x0002(s0)             # 00000002
lbl_800B822C:
    lw      t9, 0x0038($sp)
    addiu   t1, $zero, 0x0002          # t1 = 00000002
    or      a1, s0, $zero              # a1 = 00000000
    sw      t9, 0x0004(s0)             # 00000004
    lw      t0, 0x0030($sp)
    sw      a3, 0x000C(s0)             # 0000000C
    sw      v0, 0x0010(s0)             # 00000010
    sw      t0, 0x0008(s0)             # 00000008
    sw      t1, 0x0014(a0)             # 00000014
    lui     t9, 0x8010                 # t9 = 80100000
    lw      t9, 0x17E0(t9)             # 801017E0
    jalr    $ra, t9
    nop
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8264:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B8278:
# MqDbg: AudioLoad_Unused1
    jr      $ra
    nop


func_800B8280:
# MqDbg: AudioLoad_SyncLoadSimple
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800B7B18
    addiu   a2, $sp, 0x001C            # a2 = FFFFFFFC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B82A0:
# MqDbg: AudioLoad_AsyncLoadInner
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x002C($sp)
    sw      s0, 0x0028($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      a1, 0x005C($sp)
    sw      a2, 0x0060($sp)
    jal     func_800B7D28
    sw      a3, 0x0064($sp)
    beq     s0, $zero, lbl_800B82E8
    or      a1, v0, $zero              # a1 = 00000000
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    beq     s0, v1, lbl_800B8310
    lui     t7, 0x8013                 # t7 = 80130000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     s0, $at, lbl_800B8328
    lui     t8, 0x8013                 # t8 = 80130000
    b       lbl_800B8344
    or      a0, s0, $zero              # a0 = 00000000
lbl_800B82E8:
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, v0
    lbu     t6, -0x7538(t6)            # 80128AC8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t6, $at, lbl_800B8308
    nop
    b       lbl_800B8598
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8308:
    b       lbl_800B8344
    or      a0, s0, $zero              # a0 = 00000000
lbl_800B8310:
    addu    t7, t7, v0
    lbu     t7, -0x7568(t7)            # 80128A98
    bnel    v1, t7, lbl_800B8344
    or      a0, s0, $zero              # a0 = 00000000
    b       lbl_800B8598
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8328:
    addu    t8, t8, v0
    lbu     t8, -0x7598(t8)            # 80128A68
    bnel    v1, t8, lbl_800B8344
    or      a0, s0, $zero              # a0 = 00000000
    b       lbl_800B8598
    or      v0, $zero, $zero           # v0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
lbl_800B8344:
    jal     func_800B7D64
    sw      a1, 0x0034($sp)
    beq     v0, $zero, lbl_800B8378
    sw      v0, 0x004C($sp)
    lw      a1, 0x0064($sp)
    addiu   t9, $zero, 0x0002          # t9 = 00000002
    sw      t9, 0x003C($sp)
    lw      a0, 0x0068($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80001E20              # osSendMesg
    sll     a1, a1, 24
    b       lbl_800B8544
    nop
lbl_800B8378:
    jal     func_800B7DB8
    or      a0, s0, $zero              # a0 = 00000000
    lw      t0, 0x0034($sp)
    sw      v0, 0x0050($sp)
    lw      t6, 0x005C($sp)
    sll     t1, t0,  4
    addu    v1, v0, t1
    lw      t2, 0x0014(v1)             # 00000014
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sll     t7, t6,  4
    addiu   t4, t2, 0x000F             # t4 = 0000000F
    and     t5, t4, $at
    sw      t2, 0x0054($sp)
    sw      t5, 0x0054($sp)
    addu    a0, v0, t7
    lb      t8, 0x0018(a0)             # 00000018
    addiu   t0, $zero, 0x0002          # t0 = 00000002
    sw      t8, 0x0048($sp)
    lb      a1, 0x0019(a0)             # 00000019
    lw      t9, 0x0010(v1)             # 00000010
    sw      t0, 0x003C($sp)
    sltiu   $at, a1, 0x0005
    beq     $at, $zero, lbl_800B8488
    sw      t9, 0x0040($sp)
    sll     t1, a1,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t1
    lw      t1, -0x67B4($at)           # 8010984C
    jr      t1
    nop
    or      a0, s0, $zero              # a0 = 00000000
    lw      a1, 0x0034($sp)
    jal     func_800B5B00
    lw      a2, 0x0054($sp)
    bne     v0, $zero, lbl_800B8410
    sw      v0, 0x004C($sp)
    b       lbl_800B859C
    lw      $ra, 0x002C($sp)
lbl_800B8410:
    addiu   t2, $zero, 0x0005          # t2 = 00000005
    b       lbl_800B8488
    sw      t2, 0x003C($sp)
    or      a0, s0, $zero              # a0 = 00000000
    lw      a1, 0x0054($sp)
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    jal     func_800B3EA0
    lw      a3, 0x0034($sp)
    bne     v0, $zero, lbl_800B8488
    sw      v0, 0x004C($sp)
    b       lbl_800B859C
    lw      $ra, 0x002C($sp)
    or      a0, s0, $zero              # a0 = 00000000
    lw      a1, 0x0054($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B3EA0
    lw      a3, 0x0034($sp)
    bne     v0, $zero, lbl_800B8488
    sw      v0, 0x004C($sp)
    b       lbl_800B859C
    lw      $ra, 0x002C($sp)
    or      a0, s0, $zero              # a0 = 00000000
    lw      a1, 0x0054($sp)
    addiu   a2, $zero, 0x0002          # a2 = 00000002
    jal     func_800B3EA0
    lw      a3, 0x0034($sp)
    bne     v0, $zero, lbl_800B8488
    sw      v0, 0x004C($sp)
    b       lbl_800B859C
    lw      $ra, 0x002C($sp)
lbl_800B8488:
    lw      t3, 0x0048($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      a0, 0x0040($sp)
    bne     t3, $at, lbl_800B84F8
    lw      a1, 0x004C($sp)
    lw      t4, 0x0050($sp)
    lw      t7, 0x0064($sp)
    lw      t1, 0x005C($sp)
    lh      a0, 0x0002(t4)             # 00000002
    lw      t5, 0x0060($sp)
    sw      t3, 0x0010($sp)
    lw      t3, 0x003C($sp)
    sll     t9, s0, 16
    sll     t8, t7, 24
    or      t0, t8, t9                 # t0 = 00000000
    sll     t2, t1,  8
    lw      t6, 0x0068($sp)
    or      t4, t0, t2                 # t4 = 00000000
    sw      t5, 0x0014($sp)
    or      t5, t4, t3                 # t5 = 00000000
    sw      t5, 0x001C($sp)
    lw      a1, 0x0040($sp)
    lw      a2, 0x004C($sp)
    lw      a3, 0x0054($sp)
    jal     func_800B9004
    sw      t6, 0x0018($sp)
    b       lbl_800B8540
    addiu   t7, $zero, 0x0001          # t7 = 00000001
lbl_800B84F8:
    lw      t8, 0x0064($sp)
    lw      t2, 0x0034($sp)
    lw      t6, 0x0060($sp)
    lw      t5, 0x003C($sp)
    sll     t1, s0, 16
    sll     t9, t8, 24
    or      t0, t9, t1                 # t0 = 00000000
    sll     t4, t2,  8
    lw      t7, 0x0068($sp)
    or      t3, t0, t4                 # t3 = 00000000
    sw      t6, 0x0010($sp)
    or      t6, t3, t5                 # t6 = 00000000
    sw      t6, 0x0018($sp)
    lw      a2, 0x0054($sp)
    lw      a3, 0x0048($sp)
    jal     func_800B9088
    sw      t7, 0x0014($sp)
    addiu   t7, $zero, 0x0001          # t7 = 00000001
lbl_800B8540:
    sw      t7, 0x003C($sp)
lbl_800B8544:
    beq     s0, $zero, lbl_800B856C
    lw      a0, 0x0034($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     s0, $at, lbl_800B857C
    lw      a0, 0x0034($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     s0, $at, lbl_800B858C
    lw      a0, 0x0034($sp)
    b       lbl_800B8598
    lw      v0, 0x004C($sp)
lbl_800B856C:
    jal     func_800B7008
    lw      a1, 0x003C($sp)
    b       lbl_800B8598
    lw      v0, 0x004C($sp)
lbl_800B857C:
    jal     func_800B6FD8
    lw      a1, 0x003C($sp)
    b       lbl_800B8598
    lw      v0, 0x004C($sp)
lbl_800B858C:
    jal     func_800B7038
    lw      a1, 0x003C($sp)
    lw      v0, 0x004C($sp)
lbl_800B8598:
    lw      $ra, 0x002C($sp)
lbl_800B859C:
    lw      s0, 0x0028($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_800B85AC:
# MqDbg: AudioLoad_ProcessLoads
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B8CAC
    sw      a0, 0x0018($sp)
    jal     func_800B9B50
    lw      a0, 0x0018($sp)
    jal     func_800B91AC
    lw      a0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B85DC:
# MqDbg: AudioLoad_SetDmaHandler
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sw      a0, 0x17E0($at)            # 801017E0


func_800B85E8:
# MqDbg: AudioLoad_SetUnusedHandler
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sw      a0, 0x17E4($at)            # 801017E4


func_800B85F4:
# MqDbg: AudioLoad_InitSoundFont
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    lw      t8, 0x2834(a1)             # 80127E64
    sll     t9, a0,  4
    lw      t7, 0x2844(a1)             # 80127E74
    addu    v1, t8, t9
    lh      t0, 0x001A(v1)             # 0000001A
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  2
    addu    v0, t6, t7
    sra     t2, t0,  8
    sb      t2, 0x0002(v0)             # 00000002
    lh      t4, 0x001A(v1)             # 0000001A
    addiu   v1, v1, 0x0010             # v1 = 00000010
    sb      t4, 0x0003(v0)             # 00000003
    lh      t5, 0x000C(v1)             # 0000001C
    sra     t7, t5,  8
    sb      t7, 0x0000(v0)             # 00000000
    lh      t9, 0x000C(v1)             # 0000001C
    sb      t9, 0x0001(v0)             # 00000001
    lh      t0, 0x000E(v1)             # 0000001E
    jr      $ra
    sh      t0, 0x0004(v0)             # 00000004


func_800B8654:
# MqDbg: AudioLoad_Init
# ROM st: Audioseq, Audiobank, Audiotable
    addiu   $sp, $sp, 0xFF90           # $sp -= 0x70
    sw      s1, 0x0018($sp)
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x5630             # s1 = 80125630
    lui     $at, 0x8013                # $at = 80130000
    sw      $zero, -0x4580($at)        # 8012BA80
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0070($sp)
    sw      a1, 0x0074($sp)
    sw      $zero, 0x2984(s1)          # 80127FB4
    or      v0, s1, $zero              # v0 = 80125630
    addiu   v1, $zero, 0x6450          # v1 = 00006450
lbl_800B8688:
    addiu   v1, v1, 0xFFFF             # v1 = 0000644F
    sb      $zero, 0x0000(v0)          # 80125630
    bgez    v1, lbl_800B8688
    addiu   v0, v0, 0x0001             # v0 = 80125631
    lui     v0, 0x8000                 # v0 = 80000000
    lw      v0, 0x0300(v0)             # 80000300
    beq     v0, $zero, lbl_800B86C0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800B86EC
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800B86D8
    addiu   t7, $zero, 0x003C          # t7 = 0000003C
    b       lbl_800B86EC
    nop
lbl_800B86C0:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x67A0($at)          # 80109860
    addiu   t6, $zero, 0x0032          # t6 = 00000032
    sw      t6, 0x2964(s1)             # 80127F94
    b       lbl_800B8700
    swc1    $f4, 0x2960(s1)            # 80127F90
lbl_800B86D8:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x679C($at)          # 80109864
    sw      t7, 0x2964(s1)             # 80127F94
    b       lbl_800B8700
    swc1    $f6, 0x2960(s1)            # 80127F90
lbl_800B86EC:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f8, -0x6798($at)          # 80109868
    addiu   t8, $zero, 0x003C          # t8 = 0000003C
    sw      t8, 0x2964(s1)             # 80127F94
    swc1    $f8, 0x2960(s1)            # 80127F90
lbl_800B8700:
    jal     func_800BBDD8
    nop
    lui     v0, 0x8012                 # v0 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x5636             # a0 = 80125636
    addiu   v0, v0, 0x5630             # v0 = 80125630
    addiu   v1, $zero, 0x00A0          # v1 = 000000A0
lbl_800B871C:
    addiu   v0, v0, 0x0002             # v0 = 80125632
    sltu    $at, v0, a0
    bne     $at, $zero, lbl_800B871C
    sh      v1, 0x2972(v0)             # 80127FA4
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    sw      $zero, 0x289C(s1)          # 80127ECC
    sw      $zero, 0x28A4(s1)          # 80127ED4
    sw      $zero, 0x28A8(s1)          # 80127ED8
    sb      $zero, 0x289A(s1)          # 80127ECA
    sw      $zero, 0x28B8(s1)          # 80127EE8
    sw      $zero, 0x28F4(s1)          # 80127F24
    sw      $zero, 0x2944(s1)          # 80127F74
    addiu   a1, a1, 0x7C30             # a1 = 80127C30
    addiu   a0, a0, 0x7C18             # a0 = 80127C18
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x7518             # a1 = 80127518
    addiu   a0, a0, 0x7500             # a0 = 80127500
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0040          # a2 = 00000040
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x7468             # a1 = 80127468
    addiu   a0, a0, 0x7450             # a0 = 80127450
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0010          # a2 = 00000010
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x74C0             # a1 = 801274C0
    addiu   a0, a0, 0x74A8             # a0 = 801274A8
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0010          # a2 = 00000010
    sw      $zero, 0x28A0(s1)          # 80127ED0
    jal     func_80005680              # osCartRomInit
    sw      $zero, 0x2620(s1)          # 80127C50
    lw      v1, 0x0070($sp)
    sw      v0, 0x1E18(s1)             # 80127448
    lui     a0, 0x8011                 # a0 = 80110000
    bne     v1, $zero, lbl_800B87E0
    lui     t9, 0x8019                 # t9 = 80190000
    addiu   t9, t9, 0xEE60             # t9 = 8018EE60
    sw      t9, 0x3524(s1)             # 80128B54
    lui     t0, 0x8011                 # t0 = 80110000
    lw      t0, -0x5E4C(t0)            # 8010A1B4
    b       lbl_800B87EC
    sw      t0, 0x3528(s1)             # 80128B58
lbl_800B87E0:
    lw      t1, 0x0074($sp)
    sw      v1, 0x3524(s1)             # 80128B54
    sw      t1, 0x3528(s1)             # 80128B58
lbl_800B87EC:
    lw      t2, 0x3528(s1)             # 80128B58
    or      s0, $zero, $zero           # s0 = 00000000
    bgez    t2, lbl_800B8804
    sra     t3, t2,  3
    addiu   $at, t2, 0x0007            # $at = 00000007
    sra     t3, $at,  3
lbl_800B8804:
    blez    t3, lbl_800B884C
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t6, 0x3524(s1)             # 80128B54
lbl_800B8810:
    addiu   t4, $zero, 0x0000          # t4 = 00000000
    addiu   t5, $zero, 0x0000          # t5 = 00000000
    addu    t7, t6, v0
    sw      t4, 0x0000(t7)             # 00000000
    sw      t5, 0x0004(t7)             # 00000004
    lw      t8, 0x3528(s1)             # 80128B58
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addiu   v0, v0, 0x0008             # v0 = 00000008
    bgez    t8, lbl_800B8840
    sra     t9, t8,  3
    addiu   $at, t8, 0x0007            # $at = 00000007
    sra     t9, $at,  3
lbl_800B8840:
    slt     $at, s0, t9
    bnel    $at, $zero, lbl_800B8810
    lw      t6, 0x3524(s1)             # 80128B54
lbl_800B884C:
    jal     func_800B3BB0
    lw      a0, -0x5E48(a0)            # 8010A1B8
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800B885C:
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FE0             # a0 = 80127FE0
    jal     func_800B3940
    addiu   a1, $zero, 0x0B00          # a1 = 00000B00
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x563C             # t0 = 8012563C
    addiu   s0, s0, 0x0004             # s0 = 80125634
    sltu    $at, s0, t0
    bne     $at, $zero, lbl_800B885C
    sw      v0, 0x2964(s0)             # 80127F98
    lui     t1, 0x8011                 # t1 = 80110000
    lui     t2, 0x8011                 # t2 = 80110000
    lui     t3, 0x8011                 # t3 = 80110000
    lui     t6, 0x8011                 # t6 = 80110000
    addiu   t1, t1, 0x3B70             # t1 = 80113B70
    addiu   t2, t2, 0x3740             # t2 = 80113740
    addiu   t3, t3, 0x4260             # t3 = 80114260
    addiu   t6, t6, 0x39B0             # t6 = 801139B0
    sw      t1, 0x2830(s1)             # 80127E60
    sw      t2, 0x2834(s1)             # 80127E64
    sw      t3, 0x2838(s1)             # 80127E68
    sw      t6, 0x283C(s1)             # 80127E6C
    lh      t5, 0x0000(t1)             # 80113B70
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sb      $zero, 0x3519(s1)          # 80128B49
    sb      t7, 0x3518(s1)             # 80128B48
    jal     func_800B4EB4
    sh      t5, 0x2840(s1)             # 80127E70
    lui     a1, 0x0003                 # a1 = 00030000
    addiu   a1, a1, 0x9DE0             # a1 = 00029DE0
    lw      a0, 0x2830(s1)             # 80127E60
    jal     func_800B70C8
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a1, 0x0001                 # a1 = 00010000
    addiu   a1, a1, 0xD390             # a1 = 0000D390
    lw      a0, 0x2834(s1)             # 80127E64
    jal     func_800B70C8
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a1, 0x0008                 # a1 = 00080000
    addiu   a1, a1, 0x9470             # a1 = 00079470
    lw      a0, 0x2838(s1)             # 80127E68
    jal     func_800B70C8
    or      a2, $zero, $zero           # a2 = 00000000
    lw      t8, 0x2834(s1)             # 80127E64
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FE0             # a0 = 80127FE0
    lh      v1, 0x0000(t8)             # 00000000
    sll     a1, v1,  2
    addu    a1, a1, v1
    sll     a1, a1,  2
    jal     func_800B399C
    sw      v1, 0x0024($sp)
    lw      v1, 0x0024($sp)
    sw      v0, 0x2844(s1)             # 80127E74
    or      s0, $zero, $zero           # s0 = 00000000
    blez    v1, lbl_800B8958
    or      a0, s0, $zero              # a0 = 00000000
lbl_800B8940:
    jal     func_800B85F4
    sw      v1, 0x0024($sp)
    lw      v1, 0x0024($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, v1, lbl_800B8940
    or      a0, s0, $zero              # a0 = 00000001
lbl_800B8958:
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8011                 # a1 = 80110000
    lw      a1, -0x5E44(a1)            # 8010A1BC
    jal     func_800B399C
    addiu   a0, a0, 0x7FE0             # a0 = 80127FE0
    bne     v0, $zero, lbl_800B897C
    or      a1, v0, $zero              # a1 = 00000000
    lui     $at, 0x8011                # $at = 80110000
    sw      $zero, -0x5E44($at)        # 8010A1BC
lbl_800B897C:
    lui     a0, 0x8013                 # a0 = 80130000
    lui     a2, 0x8011                 # a2 = 80110000
    lw      a2, -0x5E44(a2)            # 8010A1BC
    jal     func_800B39F4
    addiu   a0, a0, 0x8380             # a0 = 80128380
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    sw      t9, 0x17E8($at)            # 801017E8
    lw      a1, 0x289C(s1)             # 80127ECC
    lw      a0, 0x5BE8(s1)             # 8012B218
    jal     func_80001E20              # osSendMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070           # $sp += 0x70


func_800B89C0:
# MqDbg: AudioLoad_InitSlowLoads
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    sw      $zero, 0x1D64(v0)          # 80127394
    jr      $ra
    sw      $zero, 0x1DC8(v0)          # 801273F8


func_800B89D4:
# MqDbg: AudioLoad_SlowLoadSample
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0020($sp)
    or      s0, a2, $zero              # s0 = 00000000
    sw      a0, 0x0030($sp)
    jal     func_800B8BA0
    sw      a1, 0x0034($sp)
    bne     v0, $zero, lbl_800B8A04
    or      t0, v0, $zero              # t0 = 00000000
    sb      $zero, 0x0000(s0)          # 00000000
    b       lbl_800B8B8C
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B8A04:
    lw      t6, 0x0000(v0)             # FFFFFFFF
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t9, $zero, 0x0002          # t9 = 00000002
    sll     t7, t6,  4
    srl     t8, t7, 30
    bne     t8, $zero, lbl_800B8A2C
    addiu   t1, t1, 0x5630             # t1 = 80125630
    sb      t9, 0x0000(s0)             # 00000000
    b       lbl_800B8B8C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8A2C:
    lw      t2, 0x1D4C(t1)             # 8012737C
    addiu   $at, $zero, 0x0003         # $at = 00000003
    sll     t3, t2,  2
    subu    t3, t3, t2
    sll     t3, t3,  3
    addu    t3, t3, t2
    sll     t3, t3,  2
    addu    v1, t1, t3
    lw      t4, 0x1D64(v1)             # 00001D64
    addiu   v1, v1, 0x1D50             # v1 = 00001D50
    bnel    t4, $at, lbl_800B8A64
    lw      t6, 0x0000(t0)             # 00000000
    sw      $zero, 0x0014(v1)          # 00001D64
    lw      t6, 0x0000(t0)             # 00000000
lbl_800B8A64:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    sw      t6, 0x0020(v1)             # 00001D70
    lw      t5, 0x0004(t0)             # 00000004
    sw      t5, 0x0024(v1)             # 00001D74
    lw      t6, 0x0008(t0)             # 00000008
    sw      t6, 0x0028(v1)             # 00001D78
    lw      t5, 0x000C(t0)             # 0000000C
    sw      s0, 0x001C(v1)             # 00001D6C
    sw      t5, 0x002C(v1)             # 00001D7C
    lw      v0, 0x0000(t0)             # 00000000
    lw      a2, 0x0004(t0)             # 00000004
    sw      t0, 0x002C($sp)
    sll     a3, v0,  4
    srl     a3, a3, 30
    sll     a3, a3, 24
    sra     a3, a3, 24
    sw      v1, 0x0028($sp)
    sw      $zero, 0x0010($sp)
    lw      a1, 0x0030($sp)
    jal     func_800B5B84
    and     a0, v0, $at
    lw      v1, 0x0028($sp)
    lw      t0, 0x002C($sp)
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x5630             # t1 = 80125630
    bne     v0, $zero, lbl_800B8B10
    sw      v0, 0x000C(v1)             # 0000000C
    lw      v0, 0x0000(t0)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t7, v0,  4
    srl     t8, t7, 30
    beq     t8, $at, lbl_800B8AF8
    srl     t9, v0, 28
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     t9, $at, lbl_800B8B04
    addiu   t2, $zero, 0x0003          # t2 = 00000003
lbl_800B8AF8:
    sb      $zero, 0x0000(s0)          # 00000000
    b       lbl_800B8B8C
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B8B04:
    sb      t2, 0x0000(s0)             # 00000000
    b       lbl_800B8B8C
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B8B10:
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    sw      v0, 0x0014(v1)             # 00000014
    lw      t3, 0x0000(t0)             # 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t4, t3, $at
    lw      t7, 0x000C(v1)             # 0000000C
    addiu   t5, t4, 0x000F             # t5 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     t6, t5, $at
    sw      t6, 0x0018(v1)             # 00000018
    sw      t7, 0x0010(v1)             # 00000010
    lw      t8, 0x0004(t0)             # 00000004
    sw      t8, 0x0008(v1)             # 00000008
    lw      t9, 0x0000(t0)             # 00000000
    sll     t2, t9,  4
    srl     t3, t2, 30
    sb      t3, 0x0000(v1)             # 00000000
    lw      t4, 0x0030($sp)
    andi    t6, t3, 0x00FF             # t6 = 00000000
    sb      t4, 0x0001(v1)             # 00000001
    lw      t5, 0x0034($sp)
    bne     v0, t6, lbl_800B8B7C
    sh      t5, 0x0002(v1)             # 00000002
    lw      t7, 0x2838(t1)             # 80127E68
    lh      t8, 0x0002(t7)             # 00000002
    sw      t8, 0x0004(v1)             # 00000004
lbl_800B8B7C:
    lw      t9, 0x1D4C(t1)             # 8012737C
    or      v0, $zero, $zero           # v0 = 00000000
    xori    t2, t9, 0x0001             # t2 = 00000001
    sw      t2, 0x1D4C(t1)             # 8012737C
lbl_800B8B8C:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B8BA0:
# MqDbg: AudioLoad_GetFontSample
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    slti    $at, a1, 0x0080
    sw      $ra, 0x0014($sp)
    beq     $at, $zero, lbl_800B8BD4
    or      a2, a1, $zero              # a2 = 00000000
    jal     func_800BCA58
    nop
    bne     v0, $zero, lbl_800B8BCC
    nop
    b       lbl_800B8C20
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8BCC:
    b       lbl_800B8C1C
    lw      v1, 0x0010(v0)             # 00000010
lbl_800B8BD4:
    slti    $at, a2, 0x0100
    beq     $at, $zero, lbl_800B8C00
    nop
    jal     func_800BCB2C
    addiu   a1, a2, 0xFF80             # a1 = FFFFFF80
    bne     v0, $zero, lbl_800B8BF8
    nop
    b       lbl_800B8C20
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B8BF8:
    b       lbl_800B8C1C
    lw      v1, 0x0004(v0)             # 00000004
lbl_800B8C00:
    jal     func_800BCC10
    addiu   a1, a2, 0xFF00             # a1 = FFFFFF00
    bnel    v0, $zero, lbl_800B8C1C
    lw      v1, 0x0000(v0)             # 00000000
    b       lbl_800B8C20
    or      v0, $zero, $zero           # v0 = 00000000
    lw      v1, 0x0000(v0)             # 00000000
lbl_800B8C1C:
    or      v0, v1, $zero              # v0 = 00000000
lbl_800B8C20:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B8C30:
# MqDbg: AudioLoad_Unused2
    jr      $ra
    nop


func_800B8C38:
# MqDbg: AudioLoad_FinishSlowLoad
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      t6, 0x0024(a0)             # 00000024
    or      a2, a0, $zero              # a2 = 00000000
    beql    t6, $zero, lbl_800B8CA0
    lw      $ra, 0x0014($sp)
    lbu     a0, 0x0001(a0)             # 00000001
    lhu     a1, 0x0002(a2)             # 00000002
    jal     func_800B8BA0
    sw      a2, 0x0018($sp)
    beq     v0, $zero, lbl_800B8C9C
    lw      a2, 0x0018($sp)
    lw      t8, 0x0000(v0)             # 00000000
    lw      t9, 0x0010(a2)             # 00000010
    sw      t8, 0x0020(a2)             # 00000020
    lw      t7, 0x0004(v0)             # 00000004
    sw      t7, 0x0024(a2)             # 00000024
    lw      t8, 0x0008(v0)             # 00000008
    sw      t8, 0x0028(a2)             # 00000028
    lw      t7, 0x000C(v0)             # 0000000C
    sw      t7, 0x002C(a2)             # 0000002C
    lbu     t0, 0x0000(v0)             # 00000000
    sw      t9, 0x0004(v0)             # 00000004
    andi    t1, t0, 0xFFF3             # t1 = 00000000
    sb      t1, 0x0000(v0)             # 00000000
lbl_800B8C9C:
    lw      $ra, 0x0014($sp)
lbl_800B8CA0:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B8CAC:
# MqDbg: AudioLoad_ProcessSlowLoads
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s7, 0x0030($sp)
    sw      s2, 0x001C($sp)
    sw      s6, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    lui     s2, 0x8012                 # s2 = 80120000
    lui     s7, 0x8012                 # s7 = 80120000
    or      s6, a0, $zero              # s6 = 00000000
    sw      $ra, 0x0034($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addiu   s7, s7, 0x56F8             # s7 = 801256F8
    addiu   s2, s2, 0x5630             # s2 = 80125630
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    addiu   s4, $zero, 0x0002          # s4 = 00000002
    addiu   s5, $zero, 0x0003          # s5 = 00000003
    lw      v0, 0x1D64(s2)             # 80127394
lbl_800B8CF8:
    beql    v0, s3, lbl_800B8D38
    addiu   s0, s2, 0x1D50             # s0 = 80127380
    bne     v0, s4, lbl_800B8DFC
    addiu   s0, s2, 0x1D50             # s0 = 80127380
    lbu     t6, 0x0000(s0)             # 80127380
    addiu   a0, s0, 0x0030             # a0 = 801273B0
    or      a1, $zero, $zero           # a1 = 00000000
    beq     s3, t6, lbl_800B8D24
    nop
    jal     func_80002030              # osRecvMesg
    or      a2, s3, $zero              # a2 = 00000001
lbl_800B8D24:
    beql    s6, $zero, lbl_800B8D38
    addiu   s0, s2, 0x1D50             # s0 = 80127380
    b       lbl_800B8DFC
    sw      s5, 0x0014(s0)             # 80127394
    addiu   s0, s2, 0x1D50             # s0 = 80127380
lbl_800B8D38:
    lw      s1, 0x0018(s0)             # 80127398
    sw      s4, 0x0014(s0)             # 80127394
    bne     s1, $zero, lbl_800B8D60
    slti    $at, s1, 0x0400
    jal     func_800B8C38
    or      a0, s0, $zero              # a0 = 80127380
    lw      t7, 0x001C(s0)             # 8012739C
    sw      s5, 0x0014(s0)             # 80127394
    b       lbl_800B8DFC
    sb      s3, 0x0000(t7)             # 00000000
lbl_800B8D60:
    beql    $at, $zero, lbl_800B8DA8
    lbu     t9, 0x0000(s0)             # 80127380
    lbu     t8, 0x0000(s0)             # 80127380
    or      a2, s1, $zero              # a2 = 00000000
    or      a0, s0, $zero              # a0 = 80127380
    bne     s3, t8, lbl_800B8D94
    nop
    lw      a0, 0x0008(s0)             # 80127388
    lw      a1, 0x000C(s0)             # 8012738C
    jal     func_800B8EB8
    lw      a3, 0x0004(s0)             # 80127384
    b       lbl_800B8D9C
    nop
lbl_800B8D94:
    jal     func_800B8E34
    or      a1, s1, $zero              # a1 = 00000000
lbl_800B8D9C:
    b       lbl_800B8DFC
    sw      $zero, 0x0018(s0)          # 80127398
    lbu     t9, 0x0000(s0)             # 80127380
lbl_800B8DA8:
    addiu   a2, $zero, 0x0400          # a2 = 00000400
    or      a0, s0, $zero              # a0 = 80127380
    bne     s3, t9, lbl_800B8DD0
    nop
    lw      a0, 0x0008(s0)             # 80127388
    lw      a1, 0x000C(s0)             # 8012738C
    jal     func_800B8EB8
    lw      a3, 0x0004(s0)             # 80127384
    b       lbl_800B8DDC
    lw      t0, 0x0018(s0)             # 80127398
lbl_800B8DD0:
    jal     func_800B8E34
    addiu   a1, $zero, 0x0400          # a1 = 00000400
    lw      t0, 0x0018(s0)             # 80127398
lbl_800B8DDC:
    lw      t2, 0x000C(s0)             # 8012738C
    lw      t4, 0x0008(s0)             # 80127388
    addiu   t1, t0, 0xFC00             # t1 = FFFFFC00
    addiu   t3, t2, 0x0400             # t3 = 00000400
    addiu   t5, t4, 0x0400             # t5 = 00000400
    sw      t1, 0x0018(s0)             # 80127398
    sw      t3, 0x000C(s0)             # 8012738C
    sw      t5, 0x0008(s0)             # 80127388
lbl_800B8DFC:
    addiu   s2, s2, 0x0064             # s2 = 80125694
    bnel    s2, s7, lbl_800B8CF8
    lw      v0, 0x1D64(s2)             # 801273F8
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    lw      s6, 0x002C($sp)
    lw      s7, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800B8E34:
# MqDbg: AudioLoad_DmaSlowCopy
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s0, 0x0030($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x0044($sp)
    jal     func_800BBE00
    lw      a0, 0x000C(a0)             # 0000000C
    addiu   a0, s0, 0x0030             # a0 = 00000030
    sw      a0, 0x003C($sp)
    addiu   a1, s0, 0x0048             # a1 = 00000048
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      t6, 0x000C(s0)             # 0000000C
    lw      t7, 0x0044($sp)
    lw      t8, 0x003C($sp)
    lw      a3, 0x0008(s0)             # 00000008
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    lbu     t9, 0x0000(s0)             # 00000000
    lui     t0, 0x8011                 # t0 = 80110000
    addiu   t0, t0, 0x9824             # t0 = 80109824
    sw      t0, 0x0020($sp)
    addiu   a0, s0, 0x004C             # a0 = 0000004C
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B81A0
    sw      t9, 0x001C($sp)
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0030($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_800B8EB8:
# MqDbg: AudioLoad_DmaSlowCopyUnkMedium
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    jr      $ra
    sw      a3, 0x000C($sp)


func_800B8ECC:
# MqDbg: AudioLoad_SlowLoadSeq
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x5630             # t0 = 80125630
    lhu     t6, 0x2840(t0)             # 80127E70
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    slt     $at, a0, t6
    sw      a1, 0x001C($sp)
    sw      a2, 0x0020($sp)
    bne     $at, $zero, lbl_800B8F00
    or      a3, a0, $zero              # a3 = 00000000
    sb      $zero, 0x0000(a2)          # 00000000
    b       lbl_800B8FC4
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800B8F00:
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800B7D28
    or      a1, a3, $zero              # a1 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800B7DB8
    sw      v0, 0x0018($sp)
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x5630             # t0 = 80125630
    lw      t8, 0x1D4C(t0)             # 8012737C
    lw      a3, 0x0018($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    sll     t9, t8,  2
    subu    t9, t9, t8
    sll     t9, t9,  3
    addu    t9, t9, t8
    sll     t9, t9,  2
    addu    v1, t0, t9
    lw      t2, 0x1D64(v1)             # 00001D64
    addiu   v1, v1, 0x1D50             # v1 = 00001D50
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    bne     t2, $at, lbl_800B8F5C
    sll     t4, a3,  4
    sw      $zero, 0x0014(v1)          # 00001D64
lbl_800B8F5C:
    lw      t1, 0x001C($sp)
    sw      $zero, 0x0024(v1)          # 00001D74
    lw      t3, 0x0020($sp)
    addu    a1, v0, t4
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sw      t3, 0x001C(v1)             # 00001D6C
    lw      a0, 0x0014(a1)             # 00000014
    sw      a2, 0x0014(v1)             # 00001D64
    sw      t1, 0x000C(v1)             # 00001D5C
    addiu   a0, a0, 0x000F             # a0 = 0000000F
    and     a0, a0, $at
    sw      a0, 0x0018(v1)             # 00001D68
    sw      t1, 0x0010(v1)             # 00001D60
    lw      t5, 0x0010(a1)             # 00000010
    sw      t5, 0x0008(v1)             # 00001D58
    lb      t6, 0x0018(a1)             # 00000018
    sb      a3, 0x0001(v1)             # 00001D51
    andi    t7, t6, 0x00FF             # t7 = 00000000
    bne     a2, t7, lbl_800B8FB4
    sb      t6, 0x0000(v1)             # 00001D50
    lh      t8, 0x0002(v0)             # 00000002
    sw      t8, 0x0004(v1)             # 00001D54
lbl_800B8FB4:
    lw      t9, 0x1D4C(t0)             # 8012737C
    or      v0, $zero, $zero           # v0 = 00000000
    xori    t2, t9, 0x0001             # t2 = 00000001
    sw      t2, 0x1D4C(t0)             # 8012737C
lbl_800B8FC4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B8FD4:
# MqDbg: AudioLoad_InitAsyncLoads
    lui     v1, 0x8012                 # v1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5BB0             # v0 = 80125BB0
    addiu   v1, v1, 0x5630             # v1 = 80125630
lbl_800B8FE4:
    addiu   v1, v1, 0x0160             # v1 = 80125790
    sb      $zero, 0x1668(v1)          # 80126DF8
    sb      $zero, 0x16C0(v1)          # 80126E50
    sb      $zero, 0x1718(v1)          # 80126EA8
    bne     v1, v0, lbl_800B8FE4
    sb      $zero, 0x1610(v1)          # 80126DA0
    jr      $ra
    nop


func_800B9004:
# MqDbg: AudioLoad_StartAsyncLoadUnkMedium
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    or      a0, a1, $zero              # a0 = 00000000
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    sw      a2, 0x0038($sp)
    or      a1, a2, $zero              # a1 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a3, 0x003C($sp)
    or      a2, a3, $zero              # a2 = 00000000
    lw      a3, 0x0040($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    jal     func_800B9088
    sw      t8, 0x0018($sp)
    bne     v0, $zero, lbl_800B9058
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800B9078
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B9058:
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7320             # a0 = 80127320
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80001E20              # osSendMesg
    sw      a1, 0x002C($sp)
    lw      v0, 0x002C($sp)
    lw      t9, 0x0030($sp)
    sw      t9, 0x0018(v0)             # 00000018
lbl_800B9078:
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B9088:
# MqDbg: AudioLoad_StartAsyncLoad
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     v0, 0x8012                 # v0 = 80120000
    lui     v1, 0x8012                 # v1 = 80120000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    addiu   v1, v1, 0x5BB0             # v1 = 80125BB0
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lb      t6, 0x1770(v0)             # 80126DA0
lbl_800B90A8:
    bnel    t6, $zero, lbl_800B90BC
    addiu   v0, v0, 0x0058             # v0 = 80125688
    b       lbl_800B90C8
    addiu   v1, v0, 0x1770             # v1 = 80126DF8
    addiu   v0, v0, 0x0058             # v0 = 801256E0
lbl_800B90BC:
    bnel    v0, v1, lbl_800B90A8
    lb      t6, 0x1770(v0)             # 80126E50
    lw      v1, 0x001C($sp)
lbl_800B90C8:
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5BB0             # t7 = 80125BB0
    bne     v0, t7, lbl_800B90E0
    lw      a0, 0x0030($sp)
    b       lbl_800B919C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B90E0:
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    sb      v0, 0x0000(v1)             # 80126DF8
    lw      t8, 0x0020($sp)
    sw      a1, 0x0004(v1)             # 80126DFC
    sw      a1, 0x000C(v1)             # 80126E04
    sw      a2, 0x0010(v1)             # 80126E08
    bne     a0, $zero, lbl_800B910C
    sw      t8, 0x0008(v1)             # 80126E00
    addiu   t9, $zero, 0x1000          # t9 = 00001000
    b       lbl_800B9168
    sw      t9, 0x0014(v1)             # 80126E0C
lbl_800B910C:
    bne     a0, v0, lbl_800B911C
    nop
    b       lbl_800B9168
    sw      a2, 0x0014(v1)             # 80126E0C
lbl_800B911C:
    div     $zero, a2, a0
    bne     a0, $zero, lbl_800B912C
    nop
    break   # 0x01C00
lbl_800B912C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a0, $at, lbl_800B9144
    lui     $at, 0x8000                # $at = 80000000
    bne     a2, $at, lbl_800B9144
    nop
    break   # 0x01800
lbl_800B9144:
    mflo    v0
    addiu   v0, v0, 0x00FF             # v0 = 00000100
    addiu   $at, $zero, 0xFF00         # $at = FFFFFF00
    and     v0, v0, $at
    sltiu   $at, v0, 0x0100
    beq     $at, $zero, lbl_800B9168
    sw      v0, 0x0014(v1)             # 80126E0C
    addiu   t0, $zero, 0x0100          # t0 = 00000100
    sw      t0, 0x0014(v1)             # 80126E0C
lbl_800B9168:
    lw      t1, 0x0034($sp)
    addiu   t2, $zero, 0x0003          # t2 = 00000003
    sb      t2, 0x0001(v1)             # 80126DF9
    sb      a3, 0x0002(v1)             # 80126DFA
    sw      t1, 0x0020(v1)             # 80126E18
    lw      t3, 0x0038($sp)
    addiu   a0, v1, 0x0024             # a0 = 80126E1C
    addiu   a1, v1, 0x003C             # a1 = 80126E34
    sw      t3, 0x001C(v1)             # 80126E14
    sw      v1, 0x001C($sp)
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      v0, 0x001C($sp)
lbl_800B919C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B91AC:
# MqDbg: AudioLoad_ProcessAsyncLoads
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    lw      t6, 0x2984(v1)             # 80127FB4
    sw      s3, 0x0020($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      s3, a0, $zero              # s3 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    beq     t6, $at, lbl_800B92B4
    sw      s0, 0x0014($sp)
    lw      a0, 0x1D48(v1)             # 80127378
    bne     a0, $zero, lbl_800B9258
    nop
    beq     s3, $zero, lbl_800B9224
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x7320             # s0 = 80127320
    addiu   s2, $zero, 0xFFFF          # s2 = FFFFFFFF
    addiu   s1, $sp, 0x0034            # s1 = FFFFFFFC
    or      a0, s0, $zero              # a0 = 80127320
lbl_800B9204:
    or      a1, s1, $zero              # a1 = FFFFFFFC
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    bnel    v0, s2, lbl_800B9204
    or      a0, s0, $zero              # a0 = 80127320
    lui     a0, 0x8012                 # a0 = 80120000
    b       lbl_800B9258
    lw      a0, 0x7378(a0)             # 80127378
lbl_800B9224:
    addiu   a0, s0, 0x7320             # a0 = 8012E640
    addiu   a1, $sp, 0x0034            # a1 = FFFFFFFC
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   s2, $zero, 0xFFFF          # s2 = FFFFFFFF
    bne     v0, s2, lbl_800B9250
    addiu   v1, v1, 0x5630             # v1 = 80125630
    sw      $zero, 0x1D48(v1)          # 80127378
    b       lbl_800B9258
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800B9250:
    lw      a0, 0x0034($sp)
    sw      a0, 0x1D48(v1)             # 80127378
lbl_800B9258:
    beq     a0, $zero, lbl_800B9268
    nop
    jal     func_800B92D0
    or      a1, s3, $zero              # a1 = 00000000
lbl_800B9268:
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s2, 0x8012                 # s2 = 80120000
    addiu   s2, s2, 0x5BB0             # s2 = 80125BB0
    addiu   s0, s0, 0x5630             # s0 = 80125630
    addiu   s1, $zero, 0x0001          # s1 = 00000001
    lb      t8, 0x1770(s0)             # 80126DA0
lbl_800B9280:
    addiu   t9, s0, 0x1770             # t9 = 80126DA0
    bnel    s1, t8, lbl_800B92AC
    addiu   s0, s0, 0x0058             # s0 = 80125688
    sw      t9, 0x0034($sp)
    lb      t1, 0x0002(t9)             # 80126DA2
    or      a0, t9, $zero              # a0 = 80126DA0
    beql    s1, t1, lbl_800B92AC
    addiu   s0, s0, 0x0058             # s0 = 801256E0
    jal     func_800B9418
    or      a1, s3, $zero              # a1 = 00000000
    addiu   s0, s0, 0x0058             # s0 = 80125738
lbl_800B92AC:
    bnel    s0, s2, lbl_800B9280
    lb      t8, 0x1770(s0)             # 80126EA8
lbl_800B92B4:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800B92D0:
# MqDbg: AudioLoad_ProcessAsyncLoadUnkMedium
    sw      a0, 0x0000($sp)
    jr      $ra
    sw      a1, 0x0004($sp)


func_800B92DC:
# MqDbg: AudioLoad_FinishAsyncLoad
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      a1, 0x001C(a0)             # 0000001C
    or      s0, a0, $zero              # s0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    srl     v0, a1, 16
    andi    v0, v0, 0x00FF             # v0 = 00000000
    beq     v0, $zero, lbl_800B9320
    or      v1, a1, $zero              # v1 = 00000000
    beq     v0, $at, lbl_800B934C
    srl     t6, v1,  8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800B9338
    srl     a0, v1,  8
    b       lbl_800B93F8
    sb      $zero, 0x0000(s0)          # 00000000
lbl_800B9320:
    srl     a0, v1,  8
    andi    a0, a0, 0x00FF             # a0 = 00000000
    jal     func_800B7008
    andi    a1, v1, 0x00FF             # a1 = 00000000
    b       lbl_800B93F4
    lw      a1, 0x001C(s0)             # 0000001C
lbl_800B9338:
    andi    a0, a0, 0x00FF             # a0 = 00000000
    jal     func_800B7038
    andi    a1, v1, 0x00FF             # a1 = 00000000
    b       lbl_800B93F4
    lw      a1, 0x001C(s0)             # 0000001C
lbl_800B934C:
    andi    t7, t6, 0x00FF             # t7 = 00000000
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x7E74(t8)             # 80127E74
    sll     t9, t7,  2
    addu    t9, t9, t7
    sll     t9, t9,  2
    sw      t7, 0x0028($sp)
    addu    v0, t8, t9
    lbu     a0, 0x0002(v0)             # 00000002
    lbu     a2, 0x0003(v0)             # 00000003
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      a0, 0x0030($sp)
    beq     a0, $at, lbl_800B93A4
    sw      a2, 0x0034($sp)
    addiu   a1, $sp, 0x0040            # a1 = FFFFFFE0
    sw      v1, 0x005C($sp)
    jal     func_800B78D8
    sw      a2, 0x0048($sp)
    lw      v1, 0x005C($sp)
    lw      a2, 0x0048($sp)
    b       lbl_800B93A8
    sw      v0, 0x0038($sp)
lbl_800B93A4:
    sw      $zero, 0x0038($sp)
lbl_800B93A8:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     a2, $at, lbl_800B93CC
    or      a0, a2, $zero              # a0 = 00000000
    addiu   a1, $sp, 0x0044            # a1 = FFFFFFE4
    jal     func_800B78D8
    sw      v1, 0x005C($sp)
    lw      v1, 0x005C($sp)
    b       lbl_800B93D0
    sw      v0, 0x003C($sp)
lbl_800B93CC:
    sw      $zero, 0x003C($sp)
lbl_800B93D0:
    lw      a0, 0x0028($sp)
    jal     func_800B6FD8
    andi    a1, v1, 0x00FF             # a1 = 00000000
    lw      a0, 0x0028($sp)
    lw      a1, 0x0004(s0)             # 00000004
    addiu   a2, $sp, 0x0030            # a2 = FFFFFFD0
    jal     func_800B9758
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    lw      a1, 0x001C(s0)             # 0000001C
lbl_800B93F4:
    sb      $zero, 0x0000(s0)          # 00000000
lbl_800B93F8:
    lw      a0, 0x0020(s0)             # 00000020
    jal     func_80001E20              # osSendMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0060           # $sp += 0x60
    jr      $ra
    nop


func_800B9418:
# MqDbg: AudioLoad_ProcessAsyncLoad
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lb      v0, 0x0001(a0)             # 00000001
    lui     v1, 0x8012                 # v1 = 80120000
    or      s0, a0, $zero              # s0 = 00000000
    slti    $at, v0, 0x0002
    bne     $at, $zero, lbl_800B9448
    lw      v1, 0x7E68(v1)             # 80127E68
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800B9560
    sb      t6, 0x0001(a0)             # 00000001
lbl_800B9448:
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    bne     a3, v0, lbl_800B945C
    nop
    b       lbl_800B949C
    sb      $zero, 0x0001(s0)          # 00000001
lbl_800B945C:
    beq     a1, $zero, lbl_800B947C
    addiu   a0, s0, 0x0024             # a0 = 00000024
    addiu   a0, s0, 0x0024             # a0 = 00000024
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_80002030              # osRecvMesg
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    b       lbl_800B9560
    sb      $zero, 0x0000(s0)          # 00000000
lbl_800B947C:
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80002030              # osRecvMesg
    sw      v1, 0x0024($sp)
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    lw      v1, 0x0024($sp)
    beq     v0, $at, lbl_800B9560
    addiu   a3, $zero, 0x0001          # a3 = 00000001
lbl_800B949C:
    lw      t7, 0x0010(s0)             # 00000010
    bne     t7, $zero, lbl_800B94B8
    sw      t7, 0x0020($sp)
    jal     func_800B92DC
    or      a0, s0, $zero              # a0 = 00000000
    b       lbl_800B9564
    lw      $ra, 0x001C($sp)
lbl_800B94B8:
    lw      a2, 0x0014(s0)             # 00000014
    lw      t9, 0x0020($sp)
    sltu    $at, t9, a2
    beql    $at, $zero, lbl_800B950C
    lb      t1, 0x0002(s0)             # 00000002
    lb      t0, 0x0002(s0)             # 00000002
    or      a2, t9, $zero              # a2 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    bne     a3, t0, lbl_800B94F8
    nop
    lw      a0, 0x0008(s0)             # 00000008
    lw      a1, 0x000C(s0)             # 0000000C
    jal     func_800B9604
    lh      a3, 0x0002(v1)             # 00000002
    b       lbl_800B9500
    nop
lbl_800B94F8:
    jal     func_800B9574
    lw      a1, 0x0020($sp)
lbl_800B9500:
    b       lbl_800B9560
    sw      $zero, 0x0010(s0)          # 00000010
    lb      t1, 0x0002(s0)             # 00000002
lbl_800B950C:
    or      a0, s0, $zero              # a0 = 00000000
    bne     a3, t1, lbl_800B9530
    nop
    lw      a0, 0x0008(s0)             # 00000008
    lw      a1, 0x000C(s0)             # 0000000C
    jal     func_800B9604
    lh      a3, 0x0002(v1)             # 00000002
    b       lbl_800B953C
    lw      a2, 0x0014(s0)             # 00000014
lbl_800B9530:
    jal     func_800B9574
    or      a1, a2, $zero              # a1 = 00000000
    lw      a2, 0x0014(s0)             # 00000014
lbl_800B953C:
    lw      t2, 0x0010(s0)             # 00000010
    lw      t4, 0x0008(s0)             # 00000008
    lw      t6, 0x000C(s0)             # 0000000C
    subu    t3, t2, a2
    addu    t5, t4, a2
    addu    t7, t6, a2
    sw      t3, 0x0010(s0)             # 00000010
    sw      t5, 0x0008(s0)             # 00000008
    sw      t7, 0x000C(s0)             # 0000000C
lbl_800B9560:
    lw      $ra, 0x001C($sp)
lbl_800B9564:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800B9574:AudioLoad_AsyncDma
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s0, 0x0030($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0034($sp)
    addiu   a1, a1, 0x000F             # a1 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     a1, a1, $at
    lw      a0, 0x000C(a0)             # 0000000C
    jal     func_800BBE00
    sw      a1, 0x0044($sp)
    addiu   a0, s0, 0x0024             # a0 = 00000024
    sw      a0, 0x003C($sp)
    addiu   a1, s0, 0x003C             # a1 = 0000003C
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      t6, 0x000C(s0)             # 0000000C
    lw      t7, 0x0044($sp)
    lw      t8, 0x003C($sp)
    lw      a3, 0x0008(s0)             # 00000008
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    lb      t9, 0x0002(s0)             # 00000002
    lui     t0, 0x8011                 # t0 = 80110000
    addiu   t0, t0, 0x9830             # t0 = 80109830
    sw      t0, 0x0020($sp)
    addiu   a0, s0, 0x0040             # a0 = 00000040
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B81A0
    sw      t9, 0x001C($sp)
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0030($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_800B9604:
# MqDbg: AudioLoad_AsyncDmaUnkMedium
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    jr      $ra
    sw      a3, 0x000C($sp)


func_800B9618:
# MqDbg: AudioLoad_RelocateSample
    lw      v0, 0x0000(a0)             # 00000000
    lui     $at, 0x8000                # $at = 80000000
    ori     $at, $at, 0x0001           # $at = 80000001
    sltu    $at, v0, $at
    beq     $at, $zero, lbl_800B9750
    or      a3, a2, $zero              # a3 = 00000000
    addu    v1, v0, a1
    sw      v1, 0x0000(a0)             # 00000000
    lw      t6, 0x0000(v1)             # 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t7, t6, $at
    beq     t7, $zero, lbl_800B9750
    or      a2, v1, $zero              # a2 = 00000000
    lbu     t8, 0x0000(v1)             # 00000000
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    andi    t9, t8, 0x0001             # t9 = 00000000
    beq     a0, t9, lbl_800B9750
    nop
    lw      t0, 0x0008(v1)             # 00000008
    lw      v0, 0x0000(a2)             # 00000000
    lw      t1, 0x000C(a2)             # 0000000C
    addu    v1, t0, a1
    sw      v1, 0x0008(a2)             # 00000008
    sll     v0, v0,  4
    srl     v0, v0, 30
    addu    v1, t1, a1
    beq     v0, $zero, lbl_800B96AC
    sw      v1, 0x000C(a2)             # 0000000C
    beq     v0, a0, lbl_800B96DC
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800B9708
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beql    v0, $at, lbl_800B970C
    lbu     t1, 0x0000(a2)             # 00000000
    b       lbl_800B970C
    lbu     t1, 0x0000(a2)             # 00000000
lbl_800B96AC:
    lw      t2, 0x0004(a2)             # 00000004
    lw      t3, 0x0008(a3)             # 00000008
    lbu     t8, 0x0000(a2)             # 00000000
    addu    v1, t2, t3
    sw      v1, 0x0004(a2)             # 00000004
    lw      t5, 0x0010(a3)             # 00000010
    andi    t9, t8, 0xFFF3             # t9 = 00000000
    sll     t6, t5,  2
    andi    t7, t6, 0x000C             # t7 = 00000000
    or      t0, t7, t9                 # t0 = 00000000
    b       lbl_800B9708
    sb      t0, 0x0000(a2)             # 00000000
lbl_800B96DC:
    lw      t1, 0x0004(a2)             # 00000004
    lw      t2, 0x000C(a3)             # 0000000C
    lbu     t8, 0x0000(a2)             # 00000000
    addu    v1, t1, t2
    sw      v1, 0x0004(a2)             # 00000004
    lw      t4, 0x0014(a3)             # 00000014
    andi    t7, t8, 0xFFF3             # t7 = 00000000
    sll     t5, t4,  2
    andi    t6, t5, 0x000C             # t6 = 00000000
    or      t9, t6, t7                 # t9 = 00000000
    sb      t9, 0x0000(a2)             # 00000000
lbl_800B9708:
    lbu     t1, 0x0000(a2)             # 00000000
lbl_800B970C:
    ori     t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x0000(a2)             # 00000000
    lw      v0, 0x0000(a2)             # 00000000
    sll     t4, v0,  6
    bgez    t4, lbl_800B9750
    sll     t5, v0,  4
    srl     t8, t5, 30
    beq     t8, $zero, lbl_800B9750
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x1768(v0)             # 80126D98
    sll     t7, t6,  2
    addu    t9, v0, t7
    sw      a2, 0x0B68(t9)             # 00000B68
    lw      t0, 0x1768(v0)             # 80126D98
    addiu   t1, t0, 0x0001             # t1 = 00000001
    sw      t1, 0x1768(v0)             # 80126D98
lbl_800B9750:
    jr      $ra
    nop


func_800B9758:
# MqDbg: AudioLoad_RelocateFontAndPreloadSamples
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    sw      s3, 0x0030($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lw      t6, 0x176C(s3)             # 80126D9C
    sw      s5, 0x0038($sp)
    sw      s2, 0x002C($sp)
    or      s2, a2, $zero              # s2 = 00000000
    or      s5, a3, $zero              # s5 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s7, 0x0040($sp)
    sw      s6, 0x003C($sp)
    sw      s4, 0x0034($sp)
    sw      s1, 0x0028($sp)
    sw      s0, 0x0024($sp)
    beq     t6, $zero, lbl_800B97A4
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800B97AC
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B97A4:
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1DA0($at)         # 80121DA0
lbl_800B97AC:
    sw      $zero, 0x1768(s3)          # 80126D98
    or      a2, s2, $zero              # a2 = 00000000
    jal     func_800B7DFC
    sw      v0, 0x004C($sp)
    lw      a0, 0x1768(s3)             # 80126D98
    or      a1, $zero, $zero           # a1 = 00000000
    or      s4, $zero, $zero           # s4 = 00000000
    blez    a0, lbl_800B9810
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   v0, t7, 0x5630             # v0 = 80125630
    sll     t8, a0,  2
    addu    a2, t8, v0
    addiu   v1, $zero, 0xFFF0          # v1 = FFFFFFF0
lbl_800B97E0:
    lw      t9, 0x0B68(v0)             # 80126198
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      t2, 0x0000(t9)             # 00000000
    addiu   v0, v0, 0x0004             # v0 = 80125634
    and     t3, t2, $at
    addiu   t4, t3, 0x000F             # t4 = 0000000F
    sltu    $at, v0, a2
    and     t5, t4, v1
    bne     $at, $zero, lbl_800B97E0
    addu    a1, a1, t5
    or      s4, $zero, $zero           # s4 = 00000000
lbl_800B9810:
    blez    a0, lbl_800B9AB0
    addiu   s7, $zero, 0x0001          # s7 = 00000001
    addiu   s6, $zero, 0x0003          # s6 = 00000003
    lw      t6, 0x176C(s3)             # 80126D9C
lbl_800B9820:
    addiu   $at, $zero, 0x0078         # $at = 00000078
    sll     t8, s4,  2
    beq     t6, $at, lbl_800B9AB0
    addu    t7, s3, t8
    lw      s0, 0x0B68(t7)             # 80120B68
    beq     s5, $zero, lbl_800B984C
    or      s1, $zero, $zero           # s1 = 00000000
    beql    s5, s7, lbl_800B98F4
    lw      v1, 0x0000(s0)             # 00000000
    b       lbl_800B9990
    nop
lbl_800B984C:
    lw      v1, 0x0000(s0)             # 00000000
    lw      t9, 0x0010(s2)             # 00000010
    lui     $at, 0x00FF                # $at = 00FF0000
    sll     v0, v1,  4
    srl     v0, v0, 30
    bne     t9, v0, lbl_800B988C
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a1, 0x0000(s2)             # 00000000
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    sw      s7, 0x0010($sp)
    jal     func_800B5B84
    and     a0, v1, $at
    b       lbl_800B9990
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B988C:
    lw      t2, 0x0014(s2)             # 00000014
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t2, v0, lbl_800B98C0
    and     a0, v1, $at
    lw      a1, 0x0004(s2)             # 00000004
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    jal     func_800B5B84
    sw      s7, 0x0010($sp)
    b       lbl_800B9990
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B98C0:
    bne     s6, v0, lbl_800B9990
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    sw      s7, 0x0010($sp)
    and     a0, v1, $at
    jal     func_800B5B84
    addiu   a1, $zero, 0x00FE          # a1 = 000000FE
    b       lbl_800B9990
    or      s1, v0, $zero              # s1 = 00000000
    lw      v1, 0x0000(s0)             # 00000000
lbl_800B98F4:
    lw      t3, 0x0010(s2)             # 00000010
    lui     $at, 0x00FF                # $at = 00FF0000
    sll     v0, v1,  4
    srl     v0, v0, 30
    bne     t3, v0, lbl_800B9930
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a1, 0x0000(s2)             # 00000000
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    sw      $zero, 0x0010($sp)
    jal     func_800B5B84
    and     a0, v1, $at
    b       lbl_800B9990
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B9930:
    lw      t4, 0x0014(s2)             # 00000014
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t4, v0, lbl_800B9964
    and     a0, v1, $at
    lw      a1, 0x0004(s2)             # 00000004
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    jal     func_800B5B84
    sw      $zero, 0x0010($sp)
    b       lbl_800B9990
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B9964:
    bne     s6, v0, lbl_800B9990
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    sw      $zero, 0x0010($sp)
    and     a0, v1, $at
    jal     func_800B5B84
    addiu   a1, $zero, 0x00FE          # a1 = 000000FE
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B9990:
    bne     s1, $zero, lbl_800B99A0
    nop
    b       lbl_800B9AA0
    lw      a0, 0x1768(s3)             # 80126D98
lbl_800B99A0:
    beql    s5, $zero, lbl_800B99BC
    lw      v1, 0x0000(s0)             # 00000000
    beql    s5, s7, lbl_800B9A38
    lw      t2, 0x176C(s3)             # 80126D9C
    b       lbl_800B9AA0
    lw      a0, 0x1768(s3)             # 80126D98
    lw      v1, 0x0000(s0)             # 00000000
lbl_800B99BC:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      a1, s1, $zero              # a1 = 00000000
    sll     v0, v1,  4
    srl     v0, v0, 30
    bne     v0, $at, lbl_800B9A08
    or      a3, v0, $zero              # a3 = 00000000
    lw      t5, 0x2838(s3)             # 80127E68
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     a2, v1, $at
    lw      a0, 0x0004(s0)             # 00000004
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800B818C
    lh      a3, 0x0002(t5)             # 00000002
    lbu     t6, 0x0000(s0)             # 00000000
    sw      s1, 0x0004(s0)             # 00000004
    andi    t8, t6, 0xFFF3             # t8 = 00000000
    b       lbl_800B9A2C
    sb      t8, 0x0000(s0)             # 00000000
lbl_800B9A08:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     a2, v1, $at
    jal     func_800B8068
    lw      a0, 0x0004(s0)             # 00000004
    lbu     t7, 0x0000(s0)             # 00000000
    sw      s1, 0x0004(s0)             # 00000004
    andi    t9, t7, 0xFFF3             # t9 = 00000000
    sb      t9, 0x0000(s0)             # 00000000
lbl_800B9A2C:
    b       lbl_800B9AA0
    lw      a0, 0x1768(s3)             # 80126D98
    lw      t2, 0x176C(s3)             # 80126D9C
lbl_800B9A38:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    sll     t3, t2,  2
    addu    t3, t3, t2
    sll     t3, t3,  2
    addu    v0, s3, t3
    sw      s0, 0x0D6C(v0)             # 00000D6C
    sw      s1, 0x0D70(v0)             # 00000D70
    lw      t4, 0x176C(s3)             # 80126D9C
    sw      $zero, 0x0D78(v0)          # 00000D78
    addiu   v0, v0, 0x0D68             # v0 = 00000D68
    sll     t5, t4, 24
    or      t6, t5, $at                # t6 = 00FFFFFF
    sw      t6, 0x000C(v0)             # 00000D74
    lw      v1, 0x0000(s0)             # 00000000
    lw      t8, 0x0004(s0)             # 00000004
    and     t7, v1, $at
    sll     t2, v1,  4
    srl     t3, t2, 30
    addu    t9, t8, t7
    addu    t4, t9, t3
    sw      t4, 0x0000(v0)             # 00000D68
    lw      t5, 0x176C(s3)             # 80126D9C
    lw      a0, 0x1768(s3)             # 80126D98
    addiu   t6, t5, 0x0001             # t6 = 00000001
    sw      t6, 0x176C(s3)             # 80126D9C
lbl_800B9AA0:
    addiu   s4, s4, 0x0001             # s4 = 00000001
    slt     $at, s4, a0
    bnel    $at, $zero, lbl_800B9820
    lw      t6, 0x176C(s3)             # 80126D9C
lbl_800B9AB0:
    lw      t1, 0x176C(s3)             # 80126D9C
    sw      $zero, 0x1768(s3)          # 80126D98
    lw      t8, 0x004C($sp)
    beql    t1, $zero, lbl_800B9B28
    lw      $ra, 0x0044($sp)
    bne     t8, $zero, lbl_800B9B24
    sll     t7, t1,  2
    addu    t7, t7, t1
    sll     t7, t7,  2
    addu    v0, s3, t7
    lw      s0, 0x0D58(v0)             # 00001AC0
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      v1, 0x0000(s0)             # 00000000
    lw      a1, 0x0D5C(v0)             # 00001AC4
    lui     t2, 0x8012                 # t2 = 80120000
    and     a2, v1, $at
    srl     t0, a2, 12
    lw      a0, 0x0004(s0)             # 00000004
    addiu   t0, t0, 0x0001             # t0 = 00000001
    addiu   t2, t2, 0x74A8             # t2 = 801274A8
    sw      t2, 0x0014($sp)
    sw      t0, 0x0010($sp)
    lw      t9, 0x0D60(v0)             # 00001AC8
    sll     a3, v1,  4
    addiu   v0, v0, 0x0D54             # v0 = 00001ABC
    srl     a3, a3, 30
    jal     func_800B9088
    sw      t9, 0x0018($sp)
lbl_800B9B24:
    lw      $ra, 0x0044($sp)
lbl_800B9B28:
    lw      s0, 0x0024($sp)
    lw      s1, 0x0028($sp)
    lw      s2, 0x002C($sp)
    lw      s3, 0x0030($sp)
    lw      s4, 0x0034($sp)
    lw      s5, 0x0038($sp)
    lw      s6, 0x003C($sp)
    lw      s7, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068           # $sp += 0x68


func_800B9B50:
# MqDbg: AudioLoad_ProcessSamplePreloads
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      t6, 0x176C(a3)             # 80126D9C
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x002C($sp)
    blez    t6, lbl_800B9CEC
    sw      s0, 0x0028($sp)
    beq     a0, $zero, lbl_800B9B9C
    addiu   a1, $sp, 0x004C            # a1 = FFFFFFF4
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x74A8             # a0 = 801274A8
    addiu   a1, $sp, 0x004C            # a1 = FFFFFFF4
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    sw      $zero, 0x176C(a3)          # 80126D9C
    b       lbl_800B9CF0
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B9B9C:
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x74A8             # a0 = 801274A8
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B9BC4
    addiu   a3, a3, 0x5630             # a3 = 80125630
    b       lbl_800B9CF0
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B9BC4:
    lw      a0, 0x004C($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   t3, $zero, 0x0014          # t3 = 00000014
    srl     a0, a0, 24
    sll     t7, a0,  2
    addu    t7, t7, a0
    sll     t7, t7,  2
    addu    v0, a3, t7
    lw      t8, 0x0D78(v0)             # 00000D78
    addiu   a2, v0, 0x0D68             # a2 = 00000D68
    or      v1, a2, $zero              # v1 = 00000D68
    bne     t8, $zero, lbl_800B9C44
    sw      a0, 0x004C($sp)
    lw      v0, 0x0004(a2)             # 00000D6C
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a0, 0x0000(v0)             # 00000000
    lw      t9, 0x0004(v0)             # 00000004
    lw      t8, 0x0000(a2)             # 00000D68
    and     t4, a0, $at
    sll     t6, a0,  4
    srl     t7, t6, 30
    addu    t5, t9, t4
    addu    a1, t5, t7
    bnel    a1, t8, lbl_800B9C44
    sw      t1, 0x0010(v1)             # 00000D78
    lbu     t4, 0x0000(v0)             # 00000000
    lw      t9, 0x0008(a2)             # 00000D70
    andi    t6, t4, 0xFFF3             # t6 = 00000000
    sb      t6, 0x0000(v0)             # 00000000
    sw      t9, 0x0004(v0)             # 00000004
    sw      t1, 0x0010(v1)             # 00000D78
lbl_800B9C44:
    addiu   t1, $zero, 0x0001          # t1 = 00000001
lbl_800B9C48:
    lw      v0, 0x176C(a3)             # 80126D9C
    blez    v0, lbl_800B9CEC
    addiu   t8, v0, 0xFFFF             # t8 = FFFFFFFF
    multu   v0, t3
    mflo    t5
    addu    v1, a3, t5
    lw      t7, 0x0D64(v1)             # 00001ACC
    addiu   v1, v1, 0x0D54             # v1 = 00001ABC
    bnel    t1, t7, lbl_800B9C7C
    lw      v0, 0x0004(v1)             # 00001AC0
    b       lbl_800B9C48
    sw      t8, 0x176C(a3)             # 80126D9C
    lw      v0, 0x0004(v1)             # 00001AC0
lbl_800B9C7C:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      a0, 0x0000(v0)             # 00000000
    lw      s0, 0x0004(v0)             # 00000004
    lw      t4, 0x0000(v1)             # 00001ABC
    and     a2, a0, $at
    sll     t0, a0,  4
    srl     t0, t0, 30
    addu    t9, s0, a2
    srl     t2, a2, 12
    addu    a1, t9, t0
    beq     a1, t4, lbl_800B9CC4
    addiu   t2, t2, 0x0001             # t2 = 00000001
    sw      t1, 0x0010(v1)             # 00001ACC
    lw      t6, 0x176C(a3)             # 80126D9C
    addiu   t5, t6, 0xFFFF             # t5 = FFFFFFFF
    b       lbl_800B9C48
    sw      t5, 0x176C(a3)             # 80126D9C
lbl_800B9CC4:
    lw      a1, 0x0008(v1)             # 00001AC4
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x74A8             # t7 = 801274A8
    sw      t7, 0x0014($sp)
    sw      t2, 0x0010($sp)
    lw      t8, 0x000C(v1)             # 00001AC8
    or      a0, s0, $zero              # a0 = 00000000
    or      a3, t0, $zero              # a3 = 00000000
    jal     func_800B9088
    sw      t8, 0x0018($sp)
lbl_800B9CEC:
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800B9CF0:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0028($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_800B9D04:
# MqDbg: AudioLoad_AddToSampleSet
    blez    a1, lbl_800B9D30
    or      v0, $zero, $zero           # v0 = 00000000
    lw      v1, 0x0004(a0)             # 00000004
    or      a3, a2, $zero              # a3 = 00000000
lbl_800B9D14:
    lw      t6, 0x0000(a3)             # 00000000
    lw      t7, 0x0004(t6)             # 00000004
    beq     v1, t7, lbl_800B9D30
    nop
    addiu   v0, v0, 0x0001             # v0 = 00000001
    bne     v0, a1, lbl_800B9D14
    addiu   a3, a3, 0x0004             # a3 = 00000004
lbl_800B9D30:
    bne     v0, a1, lbl_800B9D44
    sll     t8, a1,  2
    addu    t9, a2, t8
    sw      a0, 0x0000(t9)             # 00000000
    addiu   a1, a1, 0x0001             # a1 = 00000001
lbl_800B9D44:
    jr      $ra
    or      v0, a1, $zero              # v0 = 00000001


func_800B9D4C:
# MqDbg: AudioLoad_GetSamplesForFont
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7E74(t6)             # 80127E74
    sll     t7, a0,  2
    addu    t7, t7, a0
    sll     t7, t7,  2
    sw      $ra, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    addu    v0, t6, t7
    lbu     s0, 0x0001(v0)             # 00000001
    or      s3, a1, $zero              # s3 = 00000000
    or      s4, a0, $zero              # s4 = 00000000
    or      s1, $zero, $zero           # s1 = 00000000
    lbu     s6, 0x0000(v0)             # 00000000
    blez    s0, lbl_800B9DD8
    or      s2, $zero, $zero           # s2 = 00000000
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B9DA8:
    jal     func_800BCB2C
    or      a1, s2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B9DC8
    or      a1, s1, $zero              # a1 = 00000000
    lw      a0, 0x0004(v0)             # 00000004
    jal     func_800B9D04
    or      a2, s3, $zero              # a2 = 00000000
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B9DC8:
    addiu   s2, s2, 0x0001             # s2 = 00000001
    bnel    s2, s0, lbl_800B9DA8
    or      a0, s4, $zero              # a0 = 00000000
    or      s2, $zero, $zero           # s2 = 00000000
lbl_800B9DD8:
    blez    s6, lbl_800B9E54
    addiu   s5, $zero, 0x007F          # s5 = 0000007F
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B9DE4:
    jal     func_800BCA58
    or      a1, s2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B9E48
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t8, 0x0001(v0)             # 00000001
    or      a1, s1, $zero              # a1 = 00000000
    or      a2, s3, $zero              # a2 = 00000000
    beql    t8, $zero, lbl_800B9E18
    lbu     t9, 0x0002(s0)             # 00000002
    jal     func_800B9D04
    lw      a0, 0x0008(v0)             # 00000008
    or      s1, v0, $zero              # s1 = 00000000
    lbu     t9, 0x0002(s0)             # 00000002
lbl_800B9E18:
    or      a1, s1, $zero              # a1 = 00000000
    or      a2, s3, $zero              # a2 = 00000000
    beql    s5, t9, lbl_800B9E38
    lw      a0, 0x0010(s0)             # 00000010
    jal     func_800B9D04
    lw      a0, 0x0018(s0)             # 00000018
    or      s1, v0, $zero              # s1 = 00000000
    lw      a0, 0x0010(s0)             # 00000010
lbl_800B9E38:
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800B9D04
    or      a2, s3, $zero              # a2 = 00000000
    or      s1, v0, $zero              # s1 = 00000000
lbl_800B9E48:
    addiu   s2, s2, 0x0001             # s2 = 00000001
    bnel    s2, s6, lbl_800B9DE4
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B9E54:
    lw      $ra, 0x0034($sp)
    or      v0, s1, $zero              # v0 = 00000000
    lw      s1, 0x001C($sp)
    lw      s0, 0x0018($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800B9E80:
# MqDbg: AudioLoad_AddUsedSample
    lw      v0, 0x0000(a0)             # 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      v1, 0x0000(v0)             # 00000000
    and     t6, v1, $at
    beq     t6, $zero, lbl_800B9ED0
    sll     t8, v1,  6
    bgez    t8, lbl_800B9ED0
    sll     t9, v1,  4
    srl     t0, t9, 30
    beq     t0, $zero, lbl_800B9ED0
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lw      t1, 0x1768(v1)             # 80126D98
    sll     t2, t1,  2
    addu    t3, v1, t2
    sw      v0, 0x0B68(t3)             # 00000B68
    lw      t4, 0x1768(v1)             # 80126D98
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sw      t5, 0x1768(v1)             # 80126D98
lbl_800B9ED0:
    jr      $ra
    nop


func_800B9ED8:
# MqDbg: AudioLoad_PreloadSamplesForFont
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sw      s4, 0x0034($sp)
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x5630             # s4 = 80125630
    lw      t6, 0x176C(s4)             # 80126D9C
    sw      s5, 0x0038($sp)
    sw      s3, 0x0030($sp)
    sw      s1, 0x0028($sp)
    or      s1, a0, $zero              # s1 = 00000000
    or      s3, a2, $zero              # s3 = 00000000
    or      s5, a1, $zero              # s5 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s2, 0x002C($sp)
    sw      s0, 0x0024($sp)
    beq     t6, $zero, lbl_800B9F20
    sw      $zero, 0x0044($sp)
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sw      t7, 0x0044($sp)
lbl_800B9F20:
    lw      t8, 0x2844(s4)             # 80127E74
    sll     t9, s1,  2
    addu    t9, t9, s1
    sll     t9, t9,  2
    sw      $zero, 0x1768(s4)          # 80126D98
    addu    v0, t8, t9
    lbu     t2, 0x0001(v0)             # 00000001
    or      s2, $zero, $zero           # s2 = 00000000
    sw      t2, 0x0074($sp)
    lbu     v1, 0x0000(v0)             # 00000000
    lhu     t3, 0x0004(v0)             # 00000004
    blez    v1, lbl_800B9FB4
    sw      t3, 0x006C($sp)
    sw      v1, 0x0070($sp)
    or      a0, s1, $zero              # a0 = 00000000
lbl_800B9F5C:
    jal     func_800BCA58
    or      a1, s2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B9FA0
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t4, 0x0001(v0)             # 00000001
    beql    t4, $zero, lbl_800B9F84
    lbu     t5, 0x0002(s0)             # 00000002
    jal     func_800B9E80
    addiu   a0, v0, 0x0008             # a0 = 00000008
    lbu     t5, 0x0002(s0)             # 00000002
lbl_800B9F84:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    beq     t5, $at, lbl_800B9F98
    nop
    jal     func_800B9E80
    addiu   a0, s0, 0x0018             # a0 = 00000018
lbl_800B9F98:
    jal     func_800B9E80
    addiu   a0, s0, 0x0010             # a0 = 00000010
lbl_800B9FA0:
    lw      t6, 0x0070($sp)
    addiu   s2, s2, 0x0001             # s2 = 00000001
    bnel    s2, t6, lbl_800B9F5C
    or      a0, s1, $zero              # a0 = 00000000
    or      s2, $zero, $zero           # s2 = 00000000
lbl_800B9FB4:
    lw      t7, 0x0074($sp)
    blez    t7, lbl_800B9FEC
    or      a0, s1, $zero              # a0 = 00000000
lbl_800B9FC0:
    jal     func_800BCB2C
    or      a1, s2, $zero              # a1 = 00000000
    beql    v0, $zero, lbl_800B9FDC
    lw      t8, 0x0074($sp)
    jal     func_800B9E80
    addiu   a0, v0, 0x0004             # a0 = 00000004
    lw      t8, 0x0074($sp)
lbl_800B9FDC:
    addiu   s2, s2, 0x0001             # s2 = 00000001
    bnel    s2, t8, lbl_800B9FC0
    or      a0, s1, $zero              # a0 = 00000000
    or      s2, $zero, $zero           # s2 = 00000000
lbl_800B9FEC:
    lw      t9, 0x006C($sp)
    blez    t9, lbl_800BA020
    or      a0, s1, $zero              # a0 = 00000000
lbl_800B9FF8:
    jal     func_800BCC10
    or      a1, s2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800BA010
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_800B9E80
    nop
lbl_800BA010:
    lw      t2, 0x006C($sp)
    addiu   s2, s2, 0x0001             # s2 = 00000001
    bnel    s2, t2, lbl_800B9FF8
    or      a0, s1, $zero              # a0 = 00000000
lbl_800BA020:
    lw      a1, 0x1768(s4)             # 80126D98
    or      v1, $zero, $zero           # v1 = 00000000
    or      s2, $zero, $zero           # s2 = 00000000
    beql    a1, $zero, lbl_800BA334
    lw      $ra, 0x003C($sp)
    blez    a1, lbl_800BA080
    lw      t0, 0x176C(s4)             # 80126D9C
    lui     t3, 0x8012                 # t3 = 80120000
    addiu   v0, t3, 0x5630             # v0 = 80125630
    sll     t4, a1,  2
    addu    a2, t4, v0
    addiu   a0, $zero, 0xFFF0          # a0 = FFFFFFF0
lbl_800BA050:
    lw      t5, 0x0B68(v0)             # 80126198
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      t6, 0x0000(t5)             # 00000000
    addiu   v0, v0, 0x0004             # v0 = 80125634
    and     t7, t6, $at
    addiu   t8, t7, 0x000F             # t8 = 0000000F
    sltu    $at, v0, a2
    and     t9, t8, a0
    bne     $at, $zero, lbl_800BA050
    addu    v1, v1, t9
    or      s2, $zero, $zero           # s2 = 00000000
lbl_800BA080:
    blez    a1, lbl_800BA2C4
    lw      s1, 0x0054($sp)
    addiu   $at, $zero, 0x0078         # $at = 00000078
lbl_800BA08C:
    beq     t0, $at, lbl_800BA2C4
    sll     t2, s2,  2
    addu    t4, s4, t2
    lw      s0, 0x0B68(t4)             # 00000B68
    lw      v1, 0x0000(s0)             # 00000000
    sll     v0, v1,  4
    srl     v0, v0, 30
    beql    v0, $zero, lbl_800BA2B4
    addiu   s2, s2, 0x0001             # s2 = 00000001
    beq     s5, $zero, lbl_800BA0C8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    s5, $at, lbl_800BA13C
    lw      t8, 0x0010(s3)             # 00000010
    b       lbl_800BA19C
    nop
lbl_800BA0C8:
    lw      t3, 0x0010(s3)             # 00000010
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t3, v0, lbl_800BA100
    and     a0, v1, $at
    lw      a1, 0x0000(s3)             # 00000000
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sw      t5, 0x0010($sp)
    jal     func_800B5B84
    sra     a3, a3, 24
    b       lbl_800BA19C
    or      s1, v0, $zero              # s1 = 00000000
lbl_800BA100:
    lw      t6, 0x0014(s3)             # 00000014
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t6, v0, lbl_800BA19C
    and     a0, v1, $at
    lw      a1, 0x0004(s3)             # 00000004
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sw      t7, 0x0010($sp)
    jal     func_800B5B84
    sra     a3, a3, 24
    b       lbl_800BA19C
    or      s1, v0, $zero              # s1 = 00000000
    lw      t8, 0x0010(s3)             # 00000010
lbl_800BA13C:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t8, v0, lbl_800BA16C
    and     a0, v1, $at
    lw      a1, 0x0000(s3)             # 00000000
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    jal     func_800B5B84
    sw      $zero, 0x0010($sp)
    b       lbl_800BA19C
    or      s1, v0, $zero              # s1 = 00000000
lbl_800BA16C:
    lw      t9, 0x0014(s3)             # 00000014
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    bne     t9, v0, lbl_800BA19C
    and     a0, v1, $at
    lw      a1, 0x0004(s3)             # 00000004
    lw      a2, 0x0004(s0)             # 00000004
    sll     a3, v0, 24
    sra     a3, a3, 24
    jal     func_800B5B84
    sw      $zero, 0x0010($sp)
    or      s1, v0, $zero              # s1 = 00000000
lbl_800BA19C:
    bne     s1, $zero, lbl_800BA1B0
    nop
    lw      t0, 0x176C(s4)             # 80126D9C
    b       lbl_800BA2B0
    lw      a1, 0x1768(s4)             # 80126D98
lbl_800BA1B0:
    beq     s5, $zero, lbl_800BA1C8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     s5, $at, lbl_800BA248
    lw      t0, 0x176C(s4)             # 80126D9C
    b       lbl_800BA2B0
    lw      a1, 0x1768(s4)             # 80126D98
lbl_800BA1C8:
    lw      v1, 0x0000(s0)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      a1, s1, $zero              # a1 = 00000000
    sll     v0, v1,  4
    srl     v0, v0, 30
    bne     v0, $at, lbl_800BA218
    or      a3, v0, $zero              # a3 = 00000000
    lw      t2, 0x2838(s4)             # 80127E68
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     a2, v1, $at
    lw      a0, 0x0004(s0)             # 00000004
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800B818C
    lh      a3, 0x0002(t2)             # 00000002
    lbu     t4, 0x0000(s0)             # 00000000
    sw      s1, 0x0004(s0)             # 00000004
    andi    t3, t4, 0xFFF3             # t3 = 00000000
    b       lbl_800BA23C
    sb      t3, 0x0000(s0)             # 00000000
lbl_800BA218:
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     a2, v1, $at
    jal     func_800B8068
    lw      a0, 0x0004(s0)             # 00000004
    lbu     t5, 0x0000(s0)             # 00000000
    sw      s1, 0x0004(s0)             # 00000004
    andi    t6, t5, 0xFFF3             # t6 = 00000000
    sb      t6, 0x0000(s0)             # 00000000
lbl_800BA23C:
    lw      t0, 0x176C(s4)             # 80126D9C
    b       lbl_800BA2B0
    lw      a1, 0x1768(s4)             # 80126D98
lbl_800BA248:
    sll     t7, t0,  2
    addu    t7, t7, t0
    sll     t7, t7,  2
    addu    v0, s4, t7
    sw      s0, 0x0D6C(v0)             # 00000D6C
    sw      s1, 0x0D70(v0)             # 00000D70
    lw      t8, 0x176C(s4)             # 80126D9C
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    sll     t9, t8, 24
    or      t2, t9, $at                # t2 = 00FFFFFF
    sw      t2, 0x0D74(v0)             # 00000D74
    sw      $zero, 0x0D78(v0)          # 00000D78
    lw      v1, 0x0000(s0)             # 00000000
    lw      t4, 0x0004(s0)             # 00000004
    addiu   v0, v0, 0x0D68             # v0 = 00000D68
    and     t3, v1, $at
    sll     t6, v1,  4
    srl     t7, t6, 30
    addu    t5, t4, t3
    addu    t8, t5, t7
    sw      t8, 0x0000(v0)             # 00000D68
    lw      t9, 0x176C(s4)             # 80126D9C
    lw      a1, 0x1768(s4)             # 80126D98
    addiu   t0, t9, 0x0001             # t0 = 00000001
    sw      t0, 0x176C(s4)             # 80126D9C
lbl_800BA2B0:
    addiu   s2, s2, 0x0001             # s2 = 00000002
lbl_800BA2B4:
    slt     $at, s2, a1
    bnel    $at, $zero, lbl_800BA08C
    addiu   $at, $zero, 0x0078         # $at = 00000078
    sw      s1, 0x0054($sp)
lbl_800BA2C4:
    beq     t0, $zero, lbl_800BA330
    sw      $zero, 0x1768(s4)          # 80126D98
    lw      t4, 0x0044($sp)
    sll     t3, t0,  2
    addu    t3, t3, t0
    bne     t4, $zero, lbl_800BA330
    sll     t3, t3,  2
    addu    v0, s4, t3
    lw      s0, 0x0D58(v0)             # 00001AC0
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      v1, 0x0000(s0)             # 00000000
    lw      a1, 0x0D5C(v0)             # 00001AC4
    lui     t6, 0x8012                 # t6 = 80120000
    and     a2, v1, $at
    srl     t1, a2, 12
    lw      a0, 0x0004(s0)             # 00000004
    addiu   t1, t1, 0x0001             # t1 = 00000001
    addiu   t6, t6, 0x74A8             # t6 = 801274A8
    sw      t6, 0x0014($sp)
    sw      t1, 0x0010($sp)
    lw      t5, 0x0D60(v0)             # 00001AC8
    sll     a3, v1,  4
    addiu   v0, v0, 0x0D54             # v0 = 00001ABC
    srl     a3, a3, 30
    jal     func_800B9088
    sw      t5, 0x0018($sp)
lbl_800BA330:
    lw      $ra, 0x003C($sp)
lbl_800BA334:
    lw      s0, 0x0024($sp)
    lw      s1, 0x0028($sp)
    lw      s2, 0x002C($sp)
    lw      s3, 0x0030($sp)
    lw      s4, 0x0034($sp)
    lw      s5, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078           # $sp += 0x78


func_800BA354:
# MqDbg: AudioLoad_LoadPermanentSamples
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    jal     func_800B7DB8
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    lw      v1, 0x2D5C(s5)             # 8012838C
    or      s3, v0, $zero              # s3 = 00000000
    or      s1, $zero, $zero           # s1 = 00000000
    blez    v1, lbl_800BA464
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
    addiu   s8, $sp, 0x004C            # s8 = FFFFFFD4
    addiu   s7, $zero, 0x0014          # s7 = 00000014
    addiu   s6, $zero, 0x0001          # s6 = 00000001
    addiu   s4, $zero, 0x00FF          # s4 = 000000FF
lbl_800BA3B8:
    lh      t6, 0x2D68(s0)             # 80128398
    or      a0, s6, $zero              # a0 = 00000001
    bnel    s6, t6, lbl_800BA458
    addiu   s1, s1, 0x0001             # s1 = 00000001
    jal     func_800B7D28
    lh      a1, 0x2D6A(s0)             # 8012839A
    multu   v0, s7
    lw      t7, 0x2844(s5)             # 80127E74
    or      s2, v0, $zero              # s2 = 00000000
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    mflo    t8
    addu    v1, t7, t8
    lbu     t9, 0x0002(v1)             # 00000002
    sw      t9, 0x004C($sp)
    lbu     t0, 0x0003(v1)             # 00000003
    beq     t9, s4, lbl_800BA418
    sw      t0, 0x0050($sp)
    jal     func_800B7D28
    or      a1, t9, $zero              # a1 = 00000000
    sll     t2, v0,  4
    sw      v0, 0x004C($sp)
    addu    t3, s3, t2
    lb      t4, 0x0018(t3)             # 00000018
    sw      t4, 0x005C($sp)
lbl_800BA418:
    lw      a1, 0x0050($sp)
    beql    a1, s4, lbl_800BA444
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800B7D28
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    sll     t5, v0,  4
    sw      v0, 0x0050($sp)
    addu    t6, s3, t5
    lb      t7, 0x0018(t6)             # 00000018
    sw      t7, 0x0060($sp)
    or      a0, s2, $zero              # a0 = 00000000
lbl_800BA444:
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800B9ED8
    or      a2, s8, $zero              # a2 = FFFFFFD4
    lw      v1, 0x2D5C(s5)             # 8012838C
    addiu   s1, s1, 0x0001             # s1 = 00000002
lbl_800BA458:
    slt     $at, s1, v1
    bne     $at, $zero, lbl_800BA3B8
    addiu   s0, s0, 0x000C             # s0 = 8012563C
lbl_800BA464:
    lw      $ra, 0x003C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078           # $sp += 0x78


func_800BA494:
# MqDbg: AudioLoad_Unused3
    jr      $ra
    nop


func_800BA49C:
# MqDbg: AudioLoad_Unused4
    jr      $ra
    nop


func_800BA4A4:
# MqDbg: AudioLoad_Unused5
    jr      $ra
    nop


func_800BA4AC:
# MqDbg: AudioLoad_ScriptLoad
    lui     a3, 0x8010                 # a3 = 80100000
    lw      a3, 0x17EC(a3)             # 801017EC
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     $at, 0x8012                # $at = 80120000
    sll     t7, a3,  2
    addu    $at, $at, t7
    lui     t8, 0x8012                 # t8 = 80120000
    sw      $ra, 0x001C($sp)
    sw      a2, 0x0028($sp)
    sw      a2, 0x1D58($at)            # 80121D58
    addiu   t8, t8, 0x1D00             # t8 = 80121D00
    sw      t8, 0x0010($sp)
    jal     func_800B73F4
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a3, 0x8010                 # a3 = 80100000
    lw      a3, 0x17EC(a3)             # 801017EC
    lui     $at, 0x8010                # $at = 80100000
    addiu   a3, a3, 0x0001             # a3 = 80100001
    sw      a3, 0x17EC($at)            # 801017EC
    addiu   $at, $zero, 0x0010         # $at = 00000010
    bne     a3, $at, lbl_800BA508
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x17EC($at)         # 801017EC
lbl_800BA508:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BA518:
# MqDbg: AudioLoad_ProcessScriptLoads
# osRecvMsg, Get ? Message and do ?
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x1D00             # a0 = 80121D00
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BA560
    lw      t6, 0x0020($sp)
    srl     t7, t6, 24
    sll     t8, t7,  2
    lui     v0, 0x8012                 # v0 = 80120000
    addu    v0, v0, t8
    lw      v0, 0x1D58(v0)             # 80121D58
    beql    v0, $zero, lbl_800BA564
    lw      $ra, 0x0014($sp)
    sb      $zero, 0x0000(v0)          # 80120000
lbl_800BA560:
    lw      $ra, 0x0014($sp)
lbl_800BA564:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BA570:
# MqDbg: AudioLoad_InitScriptLoads
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x1D18             # a1 = 80121D18
    addiu   a0, a0, 0x1D00             # a0 = 80121D00
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0010          # a2 = 00000010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
