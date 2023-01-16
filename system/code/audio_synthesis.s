# Audio Synthesis
#
# Starts at VRAM: 800B0280 / VROM: B261E0
#

.section .text
func_800B0280:
# MqDbg: AudioSynth_InitNextRingBuf
    sll     t6, a2,  2
    subu    t6, t6, a2
    sll     t6, t6,  2
    subu    t6, t6, a2
    sll     t6, t6,  3
    addu    t6, t6, a2
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  3
    addu    t0, t6, t7
    lbu     t8, 0x001C(t0)             # 0000001C
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    slti    $at, t8, 0x0002
    sw      a0, 0x0050($sp)
    bne     $at, $zero, lbl_800B0454
    sw      a1, 0x0054($sp)
    addiu   a3, t0, 0x0018             # a3 = 00000018
    lbu     t9, 0x0002(a3)             # 0000001A
    sll     t7, a1,  3
    subu    t7, t7, a1
    bnel    t9, $zero, lbl_800B0458
    addiu   a3, t0, 0x0018             # a3 = 00000018
    lbu     t3, 0x0003(a3)             # 0000001B
    sll     t7, t7,  2
    addiu   a1, $zero, 0x0340          # a1 = 00000340
    sll     t4, t3,  3
    addu    t4, t4, t3
    sll     t4, t4,  2
    subu    t4, t4, t3
    sll     t4, t4,  2
    addu    t5, a3, t4
    addu    a2, t5, t7
    lw      a0, 0x0044(a2)             # 00000044
    addiu   a2, a2, 0x0040             # a2 = 00000040
    sw      a2, 0x004C($sp)
    sw      t0, 0x0020($sp)
    jal     func_800BBE00
    sw      a3, 0x001C($sp)
    lw      a2, 0x004C($sp)
    lw      a3, 0x001C($sp)
    lw      t0, 0x0020($sp)
    lh      t8, 0x0010(a2)             # 00000010
    or      a1, $zero, $zero           # a1 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    bgez    t8, lbl_800B0344
    sra     t9, t8,  1
    addiu   $at, t8, 0x0001            # $at = 00000001
    sra     t9, $at,  1
lbl_800B0344:
    blezl   t9, lbl_800B03D4
    lh      t6, 0x0012(a2)             # 00000012
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t3, 0x0004(a2)             # 00000004
lbl_800B0354:
    lw      t7, 0x000C(a2)             # 0000000C
    lw      t5, 0x0028(a3)             # 00000028
    sll     v1, a1,  1
    addu    t4, t3, v1
    lh      t6, 0x0000(t4)             # 00000000
    sll     t8, t7,  1
    addu    t9, t5, t8
    addu    t3, t9, v0
    sh      t6, 0x0000(t3)             # 00000000
    lw      t4, 0x0008(a2)             # 00000008
    lw      t9, 0x000C(a2)             # 0000000C
    lw      t8, 0x002C(a3)             # 0000002C
    addu    t7, t4, v1
    lh      t5, 0x0000(t7)             # 00000000
    sll     t6, t9,  1
    addu    t3, t8, t6
    addu    t4, t3, v0
    sh      t5, 0x0000(t4)             # 00000000
    lh      t9, 0x0010(a2)             # 00000010
    lbu     t7, 0x0004(a3)             # 00000004
    addiu   a0, a0, 0x0001             # a0 = 00000001
    addiu   v0, v0, 0x0002             # v0 = 00000002
    addu    a1, a1, t7
    bgez    t9, lbl_800B03C0
    sra     t8, t9,  1
    addiu   $at, t9, 0x0001            # $at = 00000001
    sra     t8, $at,  1
lbl_800B03C0:
    slt     $at, a0, t8
    bnel    $at, $zero, lbl_800B0354
    lw      t3, 0x0004(a2)             # 00000004
    or      a0, $zero, $zero           # a0 = 00000000
    lh      t6, 0x0012(a2)             # 00000012
lbl_800B03D4:
    bgez    t6, lbl_800B03E4
    sra     t3, t6,  1
    addiu   $at, t6, 0x0001            # $at = 00000001
    sra     t3, $at,  1
lbl_800B03E4:
    blezl   t3, lbl_800B0458
    addiu   a3, t0, 0x0018             # a3 = 00000018
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t5, 0x0004(a2)             # 00000004
lbl_800B03F4:
    sll     v1, a1,  1
    lw      t9, 0x0028(a3)             # 00000040
    addu    t4, t5, v1
    lh      t7, 0x0000(t4)             # 00000000
    addu    t8, t9, v0
    addiu   a0, a0, 0x0001             # a0 = 00000001
    sh      t7, 0x0000(t8)             # 00000000
    lw      t6, 0x0008(a2)             # 00000008
    lw      t4, 0x002C(a3)             # 00000044
    addu    t3, t6, v1
    lh      t5, 0x0000(t3)             # 00000000
    addu    t9, t4, v0
    addiu   v0, v0, 0x0002             # v0 = 00000002
    sh      t5, 0x0000(t9)             # 00000000
    lh      t8, 0x0012(a2)             # 00000012
    lbu     t7, 0x0004(a3)             # 0000001C
    addu    a1, a1, t7
    bgez    t8, lbl_800B0448
    sra     t6, t8,  1
    addiu   $at, t8, 0x0001            # $at = 00000001
    sra     t6, $at,  1
lbl_800B0448:
    slt     $at, a0, t6
    bnel    $at, $zero, lbl_800B03F4
    lw      t5, 0x0004(a2)             # 00000004
lbl_800B0454:
    addiu   a3, t0, 0x0018             # a3 = 00000018
lbl_800B0458:
    lbu     t7, 0x0004(a3)             # 0000001C
    lw      t9, 0x0050($sp)
    lw      t1, 0x0054($sp)
    lbu     t3, 0x0003(a3)             # 0000001B
    div     $zero, t9, t7
    addu    $at, t1, $zero
    sll     t1, t1,  3
    subu    t1, t1, $at
    sll     t4, t3,  3
    addu    t4, t4, t3
    lw      a0, 0x001C(a3)             # 00000034
    sll     t4, t4,  2
    lw      t6, 0x0024(a3)             # 0000003C
    subu    t4, t4, t3
    sll     t4, t4,  2
    mflo    v1
    addu    t5, a3, t4
    sll     t1, t1,  2
    addu    t8, a0, v1
    addu    a2, t5, t1
    subu    v0, t8, t6
    addiu   a2, a2, 0x0040             # a2 = 00000040
    bne     t7, $zero, lbl_800B04BC
    nop
    break   # 0x01C00
lbl_800B04BC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800B04D4
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800B04D4
    nop
    break   # 0x01800
lbl_800B04D4:
    subu    t7, v1, v0
    bgez    v0, lbl_800B0504
    or      t2, a0, $zero              # t2 = 00000001
    sll     t3, v1,  1
    sh      t3, 0x0010(a2)             # 00000050
    sh      $zero, 0x0012(a2)          # 00000052
    lw      t4, 0x001C(a3)             # 00000034
    sw      t4, 0x000C(a2)             # 0000004C
    lw      t5, 0x001C(a3)             # 00000034
    addu    t9, t5, v1
    b       lbl_800B0520
    sw      t9, 0x001C(a3)             # 00000034
lbl_800B0504:
    sll     t8, t7,  1
    sll     t6, v0,  1
    sh      t8, 0x0010(a2)             # 00000050
    sh      t6, 0x0012(a2)             # 00000052
    lw      t3, 0x001C(a3)             # 00000034
    sw      t3, 0x000C(a2)             # 0000004C
    sw      v0, 0x001C(a3)             # 00000034
lbl_800B0520:
    sh      v1, 0x0000(a2)             # 00000040
    lw      t4, 0x0050($sp)
    sh      t4, 0x0002(a2)             # 00000042
    lhu     v0, 0x0014(a3)             # 0000002C
    lw      t8, 0x0050($sp)
    beql    v0, $zero, lbl_800B05F0
    lw      $ra, 0x0014($sp)
    lw      a1, 0x0024(a3)             # 0000003C
    addu    a0, v0, t2
    slt     $at, a0, a1
    bnel    $at, $zero, lbl_800B0558
    lbu     t6, 0x0004(a3)             # 0000001C
    subu    a0, a0, a1
    lbu     t6, 0x0004(a3)             # 0000001C
lbl_800B0558:
    lbu     t5, 0x0003(a3)             # 0000001B
    div     $zero, t8, t6
    sll     t9, t5,  3
    addu    t9, t9, t5
    sll     t9, t9,  2
    mflo    v1
    subu    t9, t9, t5
    sll     t9, t9,  2
    addu    t3, a0, v1
    addu    t7, a3, t9
    subu    v0, t3, a1
    addu    a2, t7, t1
    addiu   a2, a2, 0x0158             # a2 = 00000198
    bne     t6, $zero, lbl_800B0598
    nop
    break   # 0x01C00
lbl_800B0598:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t6, $at, lbl_800B05B0
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800B05B0
    nop
    break   # 0x01800
lbl_800B05B0:
    subu    t5, v1, v0
    bgez    v0, lbl_800B05D0
    sll     t7, v0,  1
    sll     t4, v1,  1
    sh      t4, 0x0010(a2)             # 000001A8
    sh      $zero, 0x0012(a2)          # 000001AA
    b       lbl_800B05E0
    sw      a0, 0x000C(a2)             # 000001A4
lbl_800B05D0:
    sll     t9, t5,  1
    sh      t9, 0x0010(a2)             # 000001A8
    sh      t7, 0x0012(a2)             # 000001AA
    sw      a0, 0x000C(a2)             # 000001A4
lbl_800B05E0:
    sh      v1, 0x0000(a2)             # 00000198
    lw      t8, 0x0050($sp)
    sh      t8, 0x0002(a2)             # 0000019A
    lw      $ra, 0x0014($sp)
lbl_800B05F0:
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_800B05FC:
# MqDbg: func_800DB03C
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      v1, 0x2894(a3)             # 80127EC4
    or      a1, $zero, $zero           # a1 = 00000000
    multu   v1, a0
    mflo    v0
    sll     a2, v0,  5
    blez    v1, lbl_800B067C
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800B0620:
    lw      t6, 0x352C(a3)             # 80128B5C
    lw      t7, 0x0014(a3)             # 80125644
    addu    v0, v1, t6
    lw      t8, 0x00C0(v0)             # 000000C0
    addiu   v0, v0, 0x00C0             # v0 = 000000C0
    addu    a0, a2, t7
    srl     t9, t8, 31
    beql    t9, $zero, lbl_800B0658
    lbu     t2, 0x0000(a0)             # 00000000
    lbu     t0, 0x0000(v0)             # 000000C0
    andi    t1, t0, 0xFFBF             # t1 = 00000000
    b       lbl_800B0660
    sb      t1, 0x0000(v0)             # 000000C0
    lbu     t2, 0x0000(a0)             # 00000000
lbl_800B0658:
    andi    t3, t2, 0xFF7F             # t3 = 00000000
    sb      t3, 0x0000(a0)             # 00000000
lbl_800B0660:
    sb      $zero, 0x0006(v0)          # 000000C6
    lw      t4, 0x2894(a3)             # 80127EC4
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addiu   v1, v1, 0x00E0             # v1 = 000000E0
    slt     $at, a1, t4
    bne     $at, $zero, lbl_800B0620
    addiu   a2, a2, 0x0020             # a2 = 00000020
lbl_800B067C:
    jr      $ra
    nop


func_800B0684:
# MqDbg: AudioSynth_Update
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s5, 0x002C($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    sw      s4, 0x0028($sp)
    lh      s4, 0x2854(s5)             # 80127E84
    sw      s8, 0x0038($sp)
    sw      s6, 0x0030($sp)
    sw      s1, 0x001C($sp)
    or      s1, a2, $zero              # s1 = 00000000
    or      s6, a3, $zero              # s6 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s7, 0x0034($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0040($sp)
    sw      a1, 0x0044($sp)
    blez    s4, lbl_800B06F8
    or      s8, a0, $zero              # s8 = 00000000
lbl_800B06D4:
    addiu   s0, s4, 0xFFFF             # s0 = FFFFFFFF
    jal     func_800C1B24
    or      a0, s0, $zero              # a0 = FFFFFFFF
    lh      t6, 0x2854(s5)             # 80127E84
    jal     func_800B05FC
    subu    a0, t6, s4
    bgtz    s0, lbl_800B06D4
    or      s4, s0, $zero              # s4 = FFFFFFFF
    lh      s4, 0x2854(s5)             # 80127E84
lbl_800B06F8:
    or      s7, s1, $zero              # s7 = 00000000
    blez    s4, lbl_800B07F0
    sw      $zero, 0x0010(s5)          # 80125640
lbl_800B0704:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lh      s2, 0x2854(s5)             # 80127E84
    bne     s4, $at, lbl_800B071C
    or      s1, $zero, $zero           # s1 = 00000000
    b       lbl_800B077C
    or      s3, s6, $zero              # s3 = 00000000
lbl_800B071C:
    div     $zero, s6, s4
    bne     s4, $zero, lbl_800B072C
    nop
    break   # 0x01C00
lbl_800B072C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     s4, $at, lbl_800B0744
    lui     $at, 0x8000                # $at = 80000000
    bne     s6, $at, lbl_800B0744
    nop
    break   # 0x01800
lbl_800B0744:
    lh      v1, 0x2858(s5)             # 80127E88
    mflo    v0
    slt     $at, v0, v1
    bnel    $at, $zero, lbl_800B0764
    lh      v1, 0x285A(s5)             # 80127E8A
    b       lbl_800B077C
    or      s3, v1, $zero              # s3 = 00000000
    lh      v1, 0x285A(s5)             # 80127E8A
lbl_800B0764:
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800B077C
    lh      s3, 0x2856(s5)             # 80127E86
    b       lbl_800B077C
    or      s3, v1, $zero              # s3 = 00000000
    lh      s3, 0x2856(s5)             # 80127E86
lbl_800B077C:
    lb      v0, 0x0001(s5)             # 80125631
    blezl   v0, lbl_800B07C8
    or      a0, s7, $zero              # a0 = 00000000
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800B0790:
    lbu     t7, 0x0019(s0)             # 80125649
    or      a0, s3, $zero              # a0 = 00000000
    subu    a1, s2, s4
    beql    t7, $zero, lbl_800B07B8
    addiu   s1, s1, 0x0001             # s1 = 00000001
    jal     func_800B0280
    or      a2, s1, $zero              # a2 = 00000001
    lh      s2, 0x2854(s5)             # 80127E84
    lb      v0, 0x0001(s5)             # 80125631
    addiu   s1, s1, 0x0001             # s1 = 00000002
lbl_800B07B8:
    slt     $at, s1, v0
    bne     $at, $zero, lbl_800B0790
    addiu   s0, s0, 0x02C8             # s0 = 801258F8
    or      a0, s7, $zero              # a0 = 00000000
lbl_800B07C8:
    or      a1, s3, $zero              # a1 = 00000000
    or      a2, s8, $zero              # a2 = 00000000
    jal     func_800B1944
    subu    a3, s2, s4
    addiu   s4, s4, 0xFFFF             # s4 = FFFFFFFE
    sll     t8, s3,  2
    or      s8, v0, $zero              # s8 = 00000000
    subu    s6, s6, s3
    bgtz    s4, lbl_800B0704
    addu    s7, s7, t8
lbl_800B07F0:
    lb      t9, 0x0001(s5)             # 80125631
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
    blez    t9, lbl_800B0838
    or      s1, $zero, $zero           # s1 = 00000000
    lbu     v0, 0x001A(s0)             # 8012564A
lbl_800B0808:
    beq     v0, $zero, lbl_800B0814
    addiu   t0, v0, 0xFFFF             # t0 = FFFFFFFF
    sb      t0, 0x001A(s0)             # 8012564A
lbl_800B0814:
    lbu     t1, 0x001B(s0)             # 8012564B
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s0, s0, 0x02C8             # s0 = 801258F8
    xori    t2, t1, 0x0001             # t2 = 00000001
    sb      t2, -0x02AD(s0)            # 8012564B
    lb      t3, 0x0001(s5)             # 80125631
    slt     $at, s1, t3
    bnel    $at, $zero, lbl_800B0808
    lbu     v0, 0x001A(s0)             # 80125912
lbl_800B0838:
    lw      t4, 0x0040($sp)
    lw      t7, 0x0044($sp)
    or      v0, s8, $zero              # v0 = 00000000
    subu    t5, s8, t4
    sra     t6, t5,  3
    sw      t6, 0x0000(t7)             # 00000000
    lw      $ra, 0x003C($sp)
    lw      s8, 0x0038($sp)
    lw      s7, 0x0034($sp)
    lw      s6, 0x0030($sp)
    lw      s5, 0x002C($sp)
    lw      s4, 0x0028($sp)
    lw      s3, 0x0024($sp)
    lw      s2, 0x0020($sp)
    lw      s1, 0x001C($sp)
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800B0880:
# MqDbg: func_800DB2C0
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lh      t6, 0x2854(a2)             # 80127E84
    addiu   v0, a0, 0x0001             # v0 = 00000001
    slt     $at, v0, t6
    beq     $at, $zero, lbl_800B08E8
    nop
    lw      t7, 0x2894(a2)             # 80127EC4
lbl_800B08A0:
    lw      t1, 0x0014(a2)             # 80125644
    multu   t7, v0
    mflo    t8
    addu    t9, t8, a1
    sll     t0, t9,  5
    addu    v1, t0, t1
    lw      t2, 0x0000(v1)             # 00000000
    sll     t4, t2,  1
    bltz    t4, lbl_800B08E8
    nop
    lbu     t5, 0x0000(v1)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000002
    andi    t6, t5, 0xFF7F             # t6 = 00000000
    sb      t6, 0x0000(v1)             # 00000000
    lh      t7, 0x2854(a2)             # 80127E84
    slt     $at, v0, t7
    bnel    $at, $zero, lbl_800B08A0
    lw      t7, 0x2894(a2)             # 80127EC4
lbl_800B08E8:
    jr      $ra
    nop


func_800B08F0:
# MqDbg: AudioSynth_LoadRingBuffer1AtTemp
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    lbu     t7, 0x0003(a1)             # 00000003
    lh      t0, 0x0032($sp)
    or      t6, a1, $zero              # t6 = 00000000
    sll     t8, t7,  3
    addu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t1, t0,  3
    sll     t8, t8,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t9, a1, t8
    addu    v1, t9, t1
    addiu   v1, v1, 0x0040             # v1 = 00000040
    lh      a3, 0x0010(v1)             # 00000050
    lhu     a2, 0x000E(v1)             # 0000004E
    sw      v1, 0x0024($sp)
    sw      t6, 0x0010($sp)
    jal     func_800B15C8
    addiu   a1, $zero, 0x03E0          # a1 = 000003E0
    lw      v1, 0x0024($sp)
    or      a0, v0, $zero              # a0 = 00000000
    lw      t2, 0x002C($sp)
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B0988
    lw      $ra, 0x001C($sp)
    lh      a1, 0x0010(v1)             # 00000010
    sw      t2, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x03E0             # a1 = 000003E0
    jal     func_800B15C8
    andi    a1, a1, 0xFFFF             # a1 = 000003E0
    or      a0, v0, $zero              # a0 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800B0988:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B0998:
# MqDbg: AudioSynth_SaveRingBuffer1AtTemp
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    lbu     t7, 0x0003(a1)             # 00000003
    lh      t0, 0x0032($sp)
    or      t6, a1, $zero              # t6 = 00000000
    sll     t8, t7,  3
    addu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t1, t0,  3
    sll     t8, t8,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t9, a1, t8
    addu    v1, t9, t1
    addiu   v1, v1, 0x0040             # v1 = 00000040
    lh      a3, 0x0010(v1)             # 00000050
    lhu     a2, 0x000E(v1)             # 0000004E
    sw      v1, 0x0024($sp)
    sw      t6, 0x0010($sp)
    jal     func_800B1634
    addiu   a1, $zero, 0x03E0          # a1 = 000003E0
    lw      v1, 0x0024($sp)
    or      a0, v0, $zero              # a0 = 00000000
    lw      t2, 0x002C($sp)
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B0A30
    lw      $ra, 0x001C($sp)
    lh      a1, 0x0010(v1)             # 00000010
    sw      t2, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x03E0             # a1 = 000003E0
    jal     func_800B1634
    andi    a1, a1, 0xFFFF             # a1 = 000003E0
    or      a0, v0, $zero              # a0 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800B0A30:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B0A40:
# MqDbg: AudioSynth_LeakReverb
    lui     t6, 0x0A00                 # t6 = 0A000000
    lui     t7, 0x0720                 # t7 = 07200000
    ori     t7, t7, 0x01A0             # t7 = 072001A0
    ori     t6, t6, 0x0C80             # t6 = 0A000C80
    sw      t6, 0x0000(a0)             # 00000000
    sw      t7, 0x0004(a0)             # 00000004
    lh      t8, 0x0010(a1)             # 00000010
    lui     t0, 0x0C1A                 # t0 = 0C1A0000
    addiu   a2, a0, 0x0008             # a2 = 00000008
    lui     t2, 0x0E20                 # t2 = 0E200000
    andi    t9, t8, 0xFFFF             # t9 = 00000000
    or      t1, t9, t0                 # t1 = 0C1A0000
    ori     t2, t2, 0x0C80             # t2 = 0E200C80
    sw      t2, 0x0004(a2)             # 0000000C
    sw      t1, 0x0000(a2)             # 00000008
    lh      t3, 0x0012(a1)             # 00000012
    addiu   a3, a2, 0x0008             # a3 = 00000010
    lui     t6, 0x0720                 # t6 = 07200000
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t4, t0                 # t5 = 0C1A0000
    ori     t6, t6, 0x0E20             # t6 = 07200E20
    sw      t6, 0x0004(a3)             # 00000014
    sw      t5, 0x0000(a3)             # 00000010
    jr      $ra
    addiu   v0, a3, 0x0008             # v0 = 00000018


func_800B0AA4:
# MqDbg: func_800DB4E4
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sw      a1, 0x0034($sp)
    sw      a3, 0x003C($sp)
    lbu     t6, 0x0003(a2)             # 00000003
    lh      t9, 0x003E($sp)
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sll     t7, t6,  3
    addu    t7, t7, t6
    sll     t7, t7,  2
    subu    t7, t7, t6
    sll     t4, t9,  3
    sll     t7, t7,  2
    subu    t4, t4, t9
    sll     t4, t4,  2
    addu    t8, a2, t7
    addu    v1, t8, t4
    lw      v0, 0x004C(v1)             # 0000004C
    lh      t5, 0x0050(v1)             # 00000050
    or      s0, a2, $zero              # s0 = 00000000
    andi    t0, v0, 0x0007             # t0 = 00000000
    sll     t0, t0,  1
    sll     t0, t0, 16
    sra     t0, t0, 16
    addu    t1, t0, t5
    addiu   t1, t1, 0x000F             # t1 = 0000000F
    andi    t1, t1, 0xFFF0             # t1 = 00000000
    sll     t1, t1, 16
    addiu   v1, v1, 0x0040             # v1 = 00000040
    sra     t1, t1, 16
    sh      t1, 0x0028($sp)
    sw      v1, 0x002C($sp)
    sh      t0, 0x002A($sp)
    sw      s0, 0x0010($sp)
    addiu   a3, $zero, 0x01A0          # a3 = 000001A0
    addiu   a1, $zero, 0x03E0          # a1 = 000003E0
    bgez    t0, lbl_800B0B48
    sra     t6, t0,  1
    addiu   $at, t0, 0x0001            # $at = 00000001
    sra     t6, $at,  1
lbl_800B0B48:
    subu    a2, v0, t6
    jal     func_800B15C8
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    lw      v1, 0x002C($sp)
    lh      t1, 0x0028($sp)
    lh      t0, 0x002A($sp)
    lh      t7, 0x0012(v1)             # 00000012
    addiu   a1, t1, 0x03E0             # a1 = 000003E0
    or      a0, v0, $zero              # a0 = 00000000
    beq     t7, $zero, lbl_800B0B90
    andi    a1, a1, 0xFFFF             # a1 = 000003E0
    addiu   t9, $zero, 0x01A0          # t9 = 000001A0
    subu    a3, t9, t1
    or      a2, $zero, $zero           # a2 = 00000000
    sw      s0, 0x0010($sp)
    jal     func_800B15C8
    sh      t0, 0x002A($sp)
    lh      t0, 0x002A($sp)
lbl_800B0B90:
    addiu   t8, t0, 0x03E0             # t8 = 000003E0
    lui     t2, 0x0800                 # t2 = 08000000
    andi    t4, t8, 0xFFFF             # t4 = 000003E0
    or      t5, t4, t2                 # t5 = 080003E0
    sw      t5, 0x0000(v0)             # 00000000
    lw      a1, 0x0034($sp)
    lui     $at, 0x0C80                # $at = 0C800000
    lui     t3, 0x0500                 # t3 = 05000000
    sll     a1, a1,  1
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    or      t6, a1, $at                # t6 = 0C800000
    sw      t6, 0x0004(v0)             # 00000004
    lbu     t9, 0x0000(s0)             # 00000000
    lhu     t6, 0x000E(s0)             # 0000000E
    addiu   a2, v0, 0x0008             # a2 = 00000008
    sll     t8, t9, 16
    or      t4, t8, t3                 # t4 = 050003E0
    or      t7, t4, t6                 # t7 = 0D8003E0
    sw      t7, 0x0000(a2)             # 00000008
    lw      t9, 0x0030(s0)             # 00000030
    addiu   t8, t0, 0x0580             # t8 = 00000580
    addiu   a3, a2, 0x0008             # a3 = 00000010
    andi    t5, t8, 0xFFFF             # t5 = 00000580
    lui     $at, 0x0E20                # $at = 0E200000
    sw      t9, 0x0004(a2)             # 0000000C
    or      t6, a1, $at                # t6 = 0E200000
    or      t4, t5, t2                 # t4 = 08000580
    sw      t4, 0x0000(a3)             # 00000010
    sw      t6, 0x0004(a3)             # 00000014
    lbu     t9, 0x0000(s0)             # 00000000
    lhu     t6, 0x000E(s0)             # 0000000E
    addiu   t1, a3, 0x0008             # t1 = 00000018
    sll     t8, t9, 16
    or      t5, t8, t3                 # t5 = 05000580
    or      t7, t5, t6                 # t7 = 0F200580
    sw      t7, 0x0000(t1)             # 00000018
    lw      t9, 0x0034(s0)             # 00000034
    addiu   v0, t1, 0x0008             # v0 = 00000020
    sw      t9, 0x0004(t1)             # 0000001C
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B0C40:
# MqDbg: func_800DB680
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sw      a2, 0x0038($sp)
    lbu     t6, 0x0003(a1)             # 00000003
    lh      t9, 0x003A($sp)
    lui     t1, 0x0800                 # t1 = 08000000
    sll     t7, t6,  3
    addu    t7, t7, t6
    sll     t7, t7,  2
    subu    t7, t7, t6
    sll     t0, t9,  3
    sll     t7, t7,  2
    subu    t0, t0, t9
    sll     t0, t0,  2
    addu    t8, a1, t7
    ori     t1, t1, 0x0C80             # t1 = 08000C80
    addu    s1, t8, t0
    sw      t1, 0x0000(a0)             # 00000000
    lhu     t2, 0x0058(s1)             # 00000058
    lui     $at, 0x0720                # $at = 07200000
    addiu   v1, a0, 0x0008             # v1 = 00000008
    sll     t3, t2,  1
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t4, $at                # t5 = 07200000
    sw      t5, 0x0004(a0)             # 00000004
    lbu     t7, 0x0000(a1)             # 00000000
    lhu     t1, 0x0056(s1)             # 00000056
    lui     $at, 0x0500                # $at = 05000000
    sll     t9, t7, 16
    or      t8, t9, $at                # t8 = 05000000
    or      t2, t8, t1                 # t2 = 0D000C80
    sw      t2, 0x0000(v1)             # 00000008
    lw      t3, 0x0038(a1)             # 00000038
    or      s2, a1, $zero              # s2 = 00000000
    addiu   s1, s1, 0x0040             # s1 = 00000040
    sw      t3, 0x0004(v1)             # 0000000C
    lw      t4, 0x0028(s2)             # 00000028
    lh      a3, 0x0010(s1)             # 00000050
    lhu     a2, 0x000E(s1)             # 0000004E
    addiu   a0, v1, 0x0008             # a0 = 00000010
    addiu   a1, $zero, 0x0720          # a1 = 00000720
    jal     func_800B16A0
    sw      t4, 0x0010($sp)
    lh      a3, 0x0012(s1)             # 00000052
    or      s0, v0, $zero              # s0 = 00000000
    or      a0, v0, $zero              # a0 = 00000000
    beql    a3, $zero, lbl_800B0D30
    lui     t6, 0x0800                 # t6 = 08000000
    lh      a1, 0x0010(s1)             # 00000050
    lw      t5, 0x0028(s2)             # 00000028
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0720             # a1 = 00000720
    andi    a1, a1, 0xFFFF             # a1 = 00000720
    jal     func_800B16A0
    sw      t5, 0x0010($sp)
    or      s0, v0, $zero              # s0 = 00000000
    lui     t6, 0x0800                 # t6 = 08000000
lbl_800B0D30:
    ori     t6, t6, 0x0E20             # t6 = 08000E20
    or      v0, s0, $zero              # v0 = 00000000
    sw      t6, 0x0000(v0)             # 00000000
    lhu     t7, 0x0018(s1)             # 00000058
    lui     $at, 0x0720                # $at = 07200000
    addiu   v1, s0, 0x0008             # v1 = 00000008
    sll     t9, t7,  1
    andi    t0, t9, 0xFFFF             # t0 = 00000000
    or      t8, t0, $at                # t8 = 07200000
    sw      t8, 0x0004(v0)             # 00000004
    lbu     t2, 0x0000(s2)             # 00000000
    lhu     t6, 0x0016(s1)             # 00000056
    lui     $at, 0x0500                # $at = 05000000
    sll     t3, t2, 16
    or      t4, t3, $at                # t4 = 05000000
    or      t7, t4, t6                 # t7 = 0D000E20
    sw      t7, 0x0000(v1)             # 00000008
    lw      t9, 0x003C(s2)             # 0000003C
    addiu   a0, v1, 0x0008             # a0 = 00000010
    addiu   a1, $zero, 0x0720          # a1 = 00000720
    sw      t9, 0x0004(v1)             # 0000000C
    lw      t0, 0x002C(s2)             # 0000002C
    lh      a3, 0x0010(s1)             # 00000050
    lhu     a2, 0x000E(s1)             # 0000004E
    jal     func_800B16A0
    sw      t0, 0x0010($sp)
    lh      a3, 0x0012(s1)             # 00000052
    or      s0, v0, $zero              # s0 = 00000000
    or      a0, v0, $zero              # a0 = 00000000
    beql    a3, $zero, lbl_800B0DD0
    lw      $ra, 0x002C($sp)
    lh      a1, 0x0010(s1)             # 00000050
    lw      t8, 0x002C(s2)             # 0000002C
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0720             # a1 = 00000720
    andi    a1, a1, 0xFFFF             # a1 = 00000720
    jal     func_800B16A0
    sw      t8, 0x0010($sp)
    or      s0, v0, $zero              # s0 = 00000000
    lw      $ra, 0x002C($sp)
lbl_800B0DD0:
    or      v0, s0, $zero              # v0 = 00000000
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B0DE8:
# MqDbg: func_800DB828
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sw      a1, 0x0034($sp)
    sw      a3, 0x003C($sp)
    lbu     t6, 0x0003(a2)             # 00000003
    lh      t9, 0x003E($sp)
    or      s0, a2, $zero              # s0 = 00000000
    sll     t7, t6,  3
    addu    t7, t7, t6
    sll     t7, t7,  2
    subu    t7, t7, t6
    sll     t5, t9,  3
    sll     t7, t7,  2
    subu    t5, t5, t9
    sll     t5, t5,  2
    addu    t8, a2, t7
    addu    v1, t8, t5
    lhu     v0, 0x0058(v1)             # 00000058
    or      t7, a1, $zero              # t7 = 00000000
    lw      t0, 0x004C(v1)             # 0000004C
    sll     t6, v0, 15
    div     $zero, t6, a1
    mflo    t9
    sh      t9, 0x0054(v1)             # 00000054
    lw      t8, 0x0034($sp)
    andi    t1, t0, 0x0007             # t1 = 00000000
    sll     t1, t1,  1
    sll     t5, t8, 15
    div     $zero, t5, v0
    sll     t1, t1, 16
    sra     t1, t1, 16
    addiu   v1, v1, 0x0040             # v1 = 00000040
    bne     t7, $zero, lbl_800B0E78
    nop
    break   # 0x01C00
lbl_800B0E78:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800B0E90
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800B0E90
    nop
    break   # 0x01800
lbl_800B0E90:
    lh      t7, 0x0010(v1)             # 00000050
    bne     v0, $zero, lbl_800B0EA0
    nop
    break   # 0x01C00
lbl_800B0EA0:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B0EB8
    lui     $at, 0x8000                # $at = 80000000
    bne     t5, $at, lbl_800B0EB8
    nop
    break   # 0x01800
lbl_800B0EB8:
    addu    t2, t1, t7
    mflo    t6
    addiu   t2, t2, 0x000F             # t2 = 0000000F
    sh      t6, 0x0016(v1)             # 00000056
    andi    t2, t2, 0xFFF0             # t2 = 00000000
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sll     t2, t2, 16
    sra     t2, t2, 16
    sh      t2, 0x0028($sp)
    sh      t1, 0x002A($sp)
    sw      v1, 0x002C($sp)
    sw      s0, 0x0010($sp)
    addiu   a1, $zero, 0x03E0          # a1 = 000003E0
    bgez    t1, lbl_800B0EFC
    sra     t9, t1,  1
    addiu   $at, t1, 0x0001            # $at = 00000001
    sra     t9, $at,  1
lbl_800B0EFC:
    subu    a2, t0, t9
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    jal     func_800B15C8
    addiu   a3, $zero, 0x01A0          # a3 = 000001A0
    lw      v1, 0x002C($sp)
    lh      t2, 0x0028($sp)
    lh      t1, 0x002A($sp)
    lh      t8, 0x0012(v1)             # 00000012
    addiu   a1, t2, 0x03E0             # a1 = 000003E0
    or      a0, v0, $zero              # a0 = 00000000
    beq     t8, $zero, lbl_800B0F50
    andi    a1, a1, 0xFFFF             # a1 = 000003E0
    addiu   t5, $zero, 0x01A0          # t5 = 000001A0
    subu    a3, t5, t2
    or      a2, $zero, $zero           # a2 = 00000000
    sw      s0, 0x0010($sp)
    sw      v1, 0x002C($sp)
    jal     func_800B15C8
    sh      t1, 0x002A($sp)
    lw      v1, 0x002C($sp)
    lh      t1, 0x002A($sp)
lbl_800B0F50:
    addiu   t6, t1, 0x03E0             # t6 = 000003E0
    lui     t3, 0x0800                 # t3 = 08000000
    andi    t7, t6, 0xFFFF             # t7 = 000003E0
    or      t9, t7, t3                 # t9 = 080003E0
    sw      t9, 0x0000(v0)             # 00000000
    lw      a2, 0x0034($sp)
    lui     $at, 0x0C80                # $at = 0C800000
    lui     t4, 0x0500                 # t4 = 05000000
    sll     a2, a2,  1
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    or      t8, a2, $at                # t8 = 0C800000
    sw      t8, 0x0004(v0)             # 00000004
    lbu     t6, 0x0000(s0)             # 00000000
    lhu     t5, 0x0014(v1)             # 00000014
    addiu   a3, v0, 0x0008             # a3 = 00000008
    sll     t7, t6, 16
    or      t9, t7, t4                 # t9 = 050003E0
    or      t6, t9, t5                 # t6 = 050003E0
    sw      t6, 0x0000(a3)             # 00000008
    lw      t7, 0x0030(s0)             # 00000030
    addiu   t8, t1, 0x0580             # t8 = 00000580
    addiu   t0, a3, 0x0008             # t0 = 00000010
    andi    t9, t8, 0xFFFF             # t9 = 00000580
    lui     $at, 0x0E20                # $at = 0E200000
    sw      t7, 0x0004(a3)             # 0000000C
    or      t6, a2, $at                # t6 = 0E200000
    or      t5, t9, t3                 # t5 = 08000580
    sw      t5, 0x0000(t0)             # 00000010
    sw      t6, 0x0004(t0)             # 00000014
    lbu     t8, 0x0000(s0)             # 00000000
    lhu     t7, 0x0014(v1)             # 00000014
    addiu   t2, t0, 0x0008             # t2 = 00000018
    sll     t9, t8, 16
    or      t5, t9, t4                 # t5 = 05000580
    or      t8, t5, t7                 # t8 = 050007E0
    sw      t8, 0x0000(t2)             # 00000018
    lw      t9, 0x0034(s0)             # 00000034
    addiu   v0, t2, 0x0008             # v0 = 00000020
    sw      t9, 0x0004(t2)             # 0000001C
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B1000:
# MqDbg: AudioSynth_FilterReverb
    lw      t6, 0x0270(a2)             # 00000270
    or      v0, a0, $zero              # v0 = 00000000
    andi    t7, a1, 0xFFFF             # t7 = 00000000
    beq     t6, $zero, lbl_800B1050
    lui     $at, 0x0702                # $at = 07020000
    or      t8, t7, $at                # t8 = 07020000
    sw      t8, 0x0000(v0)             # 00000000
    lw      t9, 0x0270(a2)             # 00000270
    lui     $at, 0x0700                # $at = 07000000
    addiu   a0, a0, 0x0008             # a0 = 00000008
    sw      t9, 0x0004(v0)             # 00000004
    lbu     t1, 0x0000(a2)             # 00000000
    or      v1, a0, $zero              # v1 = 00000008
    addiu   a0, a0, 0x0008             # a0 = 00000010
    sll     t2, t1, 16
    or      t3, t2, $at                # t3 = 07000000
    ori     t4, t3, 0x0C80             # t4 = 07000C80
    sw      t4, 0x0000(v1)             # 00000008
    lw      t5, 0x0278(a2)             # 00000278
    sw      t5, 0x0004(v1)             # 0000000C
lbl_800B1050:
    lw      t6, 0x0274(a2)             # 00000274
    or      v0, a0, $zero              # v0 = 00000010
    andi    t7, a1, 0xFFFF             # t7 = 00000000
    beq     t6, $zero, lbl_800B10A0
    lui     $at, 0x0702                # $at = 07020000
    or      t8, t7, $at                # t8 = 07020000
    sw      t8, 0x0000(v0)             # 00000010
    lw      t9, 0x0274(a2)             # 00000274
    lui     $at, 0x0700                # $at = 07000000
    addiu   a0, a0, 0x0008             # a0 = 00000018
    sw      t9, 0x0004(v0)             # 00000014
    lbu     t1, 0x0000(a2)             # 00000000
    or      v1, a0, $zero              # v1 = 00000018
    addiu   a0, a0, 0x0008             # a0 = 00000020
    sll     t2, t1, 16
    or      t3, t2, $at                # t3 = 07000000
    ori     t4, t3, 0x0E20             # t4 = 07000E20
    sw      t4, 0x0000(v1)             # 00000018
    lw      t5, 0x027C(a2)             # 0000027C
    sw      t5, 0x0004(v1)             # 0000001C
lbl_800B10A0:
    jr      $ra
    or      v0, a0, $zero              # v0 = 00000020


func_800B10A8:
# MqDbg: AudioSynth_MaybeMixRingBuffer1
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    lb      t7, 0x0005(a1)             # 00000005
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x5630             # t0 = 80125630
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t8, t8,  3
    addu    t8, t8, t7
    sll     t8, t8,  3
    addiu   t9, t8, 0x0018             # t9 = 00000018
    addu    a3, t9, t0
    lbu     t1, 0x0004(a3)             # 00000004
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      a1, a3, $zero              # a1 = 00000000
    bne     t1, $at, lbl_800B1140
    lh      a2, 0x0032($sp)
    sw      a2, 0x001C($sp)
    jal     func_800B08F0
    sw      a3, 0x0024($sp)
    lw      t2, 0x002C($sp)
    lui     $at, 0x0C34                # $at = 0C340000
    lui     t6, 0x0C80                 # t6 = 0C800000
    lh      t3, 0x0008(t2)             # 00000008
    lw      a2, 0x001C($sp)
    lw      a1, 0x0024($sp)
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t4, $at                # t5 = 0C340000
    ori     t6, t6, 0x03E0             # t6 = 0C8003E0
    sw      t6, 0x0004(v0)             # 00000004
    sw      t5, 0x0000(v0)             # 00000000
    jal     func_800B0998
    addiu   a0, v0, 0x0008             # a0 = 00000008
    or      a0, v0, $zero              # a0 = 00000000
lbl_800B1140:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B1154:
# MqDbg: func_800DBB94
    jr      $ra
    nop


func_800B115C:
# MqDbg: AudioSynth_ClearBuffer
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t6, a1, $at
    lui     $at, 0x0200                # $at = 02000000
    or      t7, t6, $at                # t7 = 02000000
    sw      t7, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a2, 0x0004(a0)             # 00000004


func_800B117C:
# MqDbg: func_800DBBBC
    jr      $ra
    nop


func_800B1184:
# MqDbg: func_800DBBC4
    jr      $ra
    nop


func_800B118C:
# MqDbg: func_800DBBCC
    jr      $ra
    nop


func_800B1194:
# MqDbg: AudioSynth_Mix
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x0C00                # $at = 0C000000
    or      t8, t7, $at                # t8 = 0C000000
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    or      t0, t8, t9                 # t0 = 0C000000
    sw      t0, 0x0000(a0)             # 00000000
    lw      t3, 0x0010($sp)
    sll     t2, a3, 16
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t2, t4                 # t5 = 00000000
    jr      $ra
    sw      t5, 0x0004(a0)             # 00000004


func_800B11C8:
# MqDbg: func_800DBC08
    jr      $ra
    nop


func_800B11D0:
# MqDbg: func_800DBC10
    jr      $ra
    nop


func_800B11D8:
# MqDbg: func_800DBC18
    jr      $ra
    nop


func_800B11E0:
# MqDbg: AudioSynth_SetBuffer
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x0800                # $at = 08000000
    or      t8, t7, $at                # t8 = 08000000
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    or      t0, t8, t9                 # t0 = 08000000
    sw      t0, 0x0000(a0)             # 00000000
    lw      t3, 0x0010($sp)
    sll     t2, a3, 16
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t2, t4                 # t5 = 00000000
    jr      $ra
    sw      t5, 0x0004(a0)             # 00000004


func_800B1214:
# MqDbg: func_800DBC54
    jr      $ra
    nop


func_800B121C:
# MqDbg: func_800DBC5C
    jr      $ra
    nop


func_800B1224:
# MqDbg: AudioSynth_DMemMove
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t6, a1, $at
    lui     $at, 0x0A00                # $at = 0A000000
    sll     t9, a2, 16
    andi    t0, a3, 0xFFFF             # t0 = 00000000
    or      t7, t6, $at                # t7 = 0A000000
    or      t1, t9, t0                 # t1 = 00000000
    sw      t7, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t1, 0x0004(a0)             # 00000004


func_800B1250:
# MqDbg: func_800DBC90
    jr      $ra
    nop


func_800B1258:
# MqDbg: func_800DBC98
    jr      $ra
    nop


func_800B1260:
# MqDbg: func_800DBCA0
    jr      $ra
    nop


func_800B1268:
# MqDbg: func_800DBCA8
    jr      $ra
    nop


func_800B1270:
# MqDbg: AudioSynth_InterL
    andi    t6, a3, 0xFFFF             # t6 = 00000000
    lui     $at, 0x1100                # $at = 11000000
    sll     t9, a1, 16
    andi    t0, a2, 0xFFFF             # t0 = 00000000
    or      t7, t6, $at                # t7 = 11000000
    or      t1, t9, t0                 # t1 = 00000000
    sw      t7, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t1, 0x0004(a0)             # 00000004


func_800B1294:
# MqDbg: AudioSynth_EnvSetup1
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x1200                # $at = 12000000
    or      t8, t7, $at                # t8 = 12000000
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    or      t0, t8, t9                 # t0 = 12000000
    sw      t0, 0x0000(a0)             # 00000000
    lw      t3, 0x0010($sp)
    sll     t2, a3, 16
    andi    t4, t3, 0xFFFF             # t4 = 00000000
    or      t5, t2, t4                 # t5 = 00000000
    jr      $ra
    sw      t5, 0x0004(a0)             # 00000004


func_800B12C8:
# MqDbg: func_800DBD08
    jr      $ra
    nop


func_800B12D0:
# MqDbg: AudioSynth_LoadBuffer
    sra     t6, a2,  4
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sll     t8, t7, 16
    lui     $at, 0x1400                # $at = 14000000
    or      t9, t8, $at                # t9 = 14000000
    andi    t0, a1, 0xFFFF             # t0 = 00000000
    or      t1, t9, t0                 # t1 = 14000000
    sw      t1, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a3, 0x0004(a0)             # 00000004


func_800B12F8:
# MqDbg: AudioSynth_SaveBuffer
    sra     t6, a2,  4
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sll     t8, t7, 16
    lui     $at, 0x1500                # $at = 15000000
    or      t9, t8, $at                # t9 = 15000000
    andi    t0, a1, 0xFFFF             # t0 = 00000000
    or      t1, t9, t0                 # t1 = 15000000
    sw      t1, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a3, 0x0004(a0)             # 00000004


func_800B1320:
# MqDbg: AudioSynth_EnvSetup2
    sll     t8, a1, 16
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    lui     t6, 0x1600                 # t6 = 16000000
    or      t0, t8, t9                 # t0 = 00000000
    sw      t6, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t0, 0x0004(a0)             # 00000004


func_800B133C:
# MqDbg: func_800DBD7C
    jr      $ra
    nop


func_800B1344:
# MqDbg: func_800DBD84
    jr      $ra
    nop


func_800B134C:
# MqDbg: func_800DBD8C
    jr      $ra
    nop


func_800B1354:
# MqDbg: AudioSynth_S8Dec
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x1700                # $at = 17000000
    or      t8, t7, $at                # t8 = 17000000
    sw      t8, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a2, 0x0004(a0)             # 00000004


func_800B1370:
# MqDbg: AudioSynth_HiLoGain
    lw      t9, 0x0010($sp)
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x0E00                # $at = 0E000000
    or      t8, t7, $at                # t8 = 0E000000
    sll     t3, a2, 16
    andi    t4, a3, 0xFFFF             # t4 = 00000000
    andi    t0, t9, 0xFFFF             # t0 = 00000000
    or      t1, t8, t0                 # t1 = 0E000000
    or      t5, t3, t4                 # t5 = 00000000
    sw      t1, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t5, 0x0004(a0)             # 00000004


func_800B13A4:
# MqDbg: AudioSynth_UnkCmd19
    lw      t6, 0x0010($sp)
    lui     $at, 0x1900                # $at = 19000000
    andi    t0, a3, 0xFFFF             # t0 = 00000000
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sll     t8, t7, 16
    or      t9, t8, $at                # t9 = 19000000
    sll     t3, a1, 16
    andi    t4, a2, 0xFFFF             # t4 = 00000000
    or      t1, t9, t0                 # t1 = 19000000
    or      t5, t3, t4                 # t5 = 00000000
    sw      t1, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t5, 0x0004(a0)             # 00000004


func_800B13D8:
# MqDbg: func_800DBE18
    jr      $ra
    nop


func_800B13E0:
# MqDbg: func_800DBE20
    jr      $ra
    nop


func_800B13E8:
# MqDbg: func_800DBE28
    jr      $ra
    nop


func_800B13F0:
# MqDbg: func_800DBE30
    jr      $ra
    nop


func_800B13F8:
# MqDbg: AudioSynth_UnkCmd3
    andi    t6, a3, 0xFFFF             # t6 = 00000000
    lui     $at, 0x0300                # $at = 03000000
    sll     t9, a1, 16
    andi    t0, a2, 0xFFFF             # t0 = 00000000
    or      t7, t6, $at                # t7 = 03000000
    or      t1, t9, t0                 # t1 = 00000000
    sw      t7, 0x0000(a0)             # 00000000
    jr      $ra
    sw      t1, 0x0004(a0)             # 00000004


func_800B141C:
# MqDbg: func_800DBE5C
    jr      $ra
    nop


func_800B1424:
# MqDbg: func_800DBE64
    jr      $ra
    nop


func_800B142C:
# MqDbg: func_800DBE6C
    jr      $ra
    nop


func_800B1434:
# MqDbg: AudioSynth_LoadFilterBuffer
    andi    t6, a1, 0x00FF             # t6 = 00000000
    sll     t7, t6, 16
    lui     $at, 0x0700                # $at = 07000000
    or      t8, t7, $at                # t8 = 07000000
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    or      t0, t8, t9                 # t0 = 07000000
    sw      t0, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a3, 0x0004(a0)             # 00000004


func_800B1458:
# MqDbg: AudioSynth_LoadFilterSize
    andi    t6, a1, 0xFFFF             # t6 = 00000000
    lui     $at, 0x0702                # $at = 07020000
    or      t7, t6, $at                # t7 = 07020000
    sw      t7, 0x0000(a0)             # 00000000
    jr      $ra
    sw      a2, 0x0004(a0)             # 00000004


func_800B1470:
# MqDbg: AudioSynth_LoadRingBuffer1
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    lbu     t7, 0x0003(a2)             # 00000003
    lh      t0, 0x0036($sp)
    or      t6, a2, $zero              # t6 = 00000000
    sll     t8, t7,  3
    addu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t1, t0,  3
    sll     t8, t8,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t9, a2, t8
    addu    v1, t9, t1
    addiu   v1, v1, 0x0040             # v1 = 00000040
    lh      a3, 0x0010(v1)             # 00000050
    lhu     a2, 0x000E(v1)             # 0000004E
    sw      v1, 0x0024($sp)
    sw      t6, 0x0010($sp)
    jal     func_800B15C8
    addiu   a1, $zero, 0x0C80          # a1 = 00000C80
    lw      v1, 0x0024($sp)
    or      a0, v0, $zero              # a0 = 00000000
    lw      t2, 0x0030($sp)
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B150C
    lw      $ra, 0x001C($sp)
    lh      a1, 0x0010(v1)             # 00000010
    sw      t2, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0C80             # a1 = 00000C80
    jal     func_800B15C8
    andi    a1, a1, 0xFFFF             # a1 = 00000C80
    or      a0, v0, $zero              # a0 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800B150C:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B151C:
# MqDbg: AudioSynth_LoadRingBuffer2
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    lbu     t7, 0x0003(a2)             # 00000003
    lh      t0, 0x0036($sp)
    or      t6, a2, $zero              # t6 = 00000000
    sll     t8, t7,  3
    addu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t1, t0,  3
    sll     t8, t8,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t9, a2, t8
    addu    v1, t9, t1
    addiu   v1, v1, 0x0158             # v1 = 00000158
    lh      a3, 0x0010(v1)             # 00000168
    lhu     a2, 0x000E(v1)             # 00000166
    sw      v1, 0x0024($sp)
    sw      t6, 0x0010($sp)
    jal     func_800B15C8
    addiu   a1, $zero, 0x0C80          # a1 = 00000C80
    lw      v1, 0x0024($sp)
    or      a0, v0, $zero              # a0 = 00000000
    lw      t2, 0x0030($sp)
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B15B8
    lw      $ra, 0x001C($sp)
    lh      a1, 0x0010(v1)             # 00000010
    sw      t2, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0C80             # a1 = 00000C80
    jal     func_800B15C8
    andi    a1, a1, 0xFFFF             # a1 = 00000C80
    or      a0, v0, $zero              # a0 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800B15B8:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B15C8:
# MqDbg: AudioSynth_LoadRingBufferPart
    sra     t0, a3,  4
    andi    t0, t0, 0x00FF             # t0 = 00000000
    sll     t0, t0, 16
    lui     $at, 0x1400                # $at = 14000000
    or      t0, t0, $at                # t0 = 14000000
    andi    t6, a1, 0xFFFF             # t6 = 00000000
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    or      t7, t0, t6                 # t7 = 14000000
    sw      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0010($sp)
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    sll     t1, a2,  1
    lw      t9, 0x0028(t8)             # 00000028
    addiu   t4, a1, 0x01A0             # t4 = 000001A0
    andi    t5, t4, 0xFFFF             # t5 = 000001A0
    addu    t3, t9, t1
    sw      t3, 0x0004(a0)             # 00000004
    addiu   t2, a0, 0x0008             # t2 = 00000008
    or      t6, t0, t5                 # t6 = 140001A0
    sw      t6, 0x0000(t2)             # 00000008
    lw      t7, 0x0010($sp)
    addiu   v0, t2, 0x0008             # v0 = 00000010
    lw      t8, 0x002C(t7)             # 1400002C
    addu    t9, t8, t1
    jr      $ra
    sw      t9, 0x0004(t2)             # 0000000C


func_800B1634:
# MqDbg: AudioSynth_SaveRingBufferPart
    sra     t0, a3,  4
    andi    t0, t0, 0x00FF             # t0 = 00000000
    sll     t0, t0, 16
    lui     $at, 0x1500                # $at = 15000000
    or      t0, t0, $at                # t0 = 15000000
    andi    t6, a1, 0xFFFF             # t6 = 00000000
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    or      t7, t0, t6                 # t7 = 15000000
    sw      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0010($sp)
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    sll     t1, a2,  1
    lw      t9, 0x0028(t8)             # 00000028
    addiu   t4, a1, 0x01A0             # t4 = 000001A0
    andi    t5, t4, 0xFFFF             # t5 = 000001A0
    addu    t3, t9, t1
    sw      t3, 0x0004(a0)             # 00000004
    addiu   t2, a0, 0x0008             # t2 = 00000008
    or      t6, t0, t5                 # t6 = 150001A0
    sw      t6, 0x0000(t2)             # 00000008
    lw      t7, 0x0010($sp)
    addiu   v0, t2, 0x0008             # v0 = 00000010
    lw      t8, 0x002C(t7)             # 1500002C
    addu    t9, t8, t1
    jr      $ra
    sw      t9, 0x0004(t2)             # 0000000C


func_800B16A0:
# MqDbg: AudioSynth_SaveBufferOffset
    sra     t6, a3,  4
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sll     t8, t7, 16
    lui     $at, 0x1500                # $at = 15000000
    or      t9, t8, $at                # t9 = 15000000
    andi    t0, a1, 0xFFFF             # t0 = 00000000
    sw      a1, 0x0004($sp)
    sw      a2, 0x0008($sp)
    or      t1, t9, t0                 # t1 = 15000000
    sw      t1, 0x0000(a0)             # 00000000
    lw      t3, 0x0010($sp)
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    sll     t2, a2,  1
    addu    t4, t2, t3
    sw      t4, 0x0004(a0)             # 00000004
    jr      $ra
    addiu   v0, a0, 0x0008             # v0 = 00000008


func_800B16E4:
# MqDbg: AudioSynth_MaybeLoadRingBuffer2
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a3, 0x0024($sp)
    lbu     t6, 0x0004(a2)             # 00000004
    sll     a3, a3, 16
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t6, $at, lbl_800B1710
    sra     a3, a3, 16
    jal     func_800B151C
    nop
    or      a0, v0, $zero              # a0 = 00000000
lbl_800B1710:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B1724:
# MqDbg: AudioSynth_LoadReverbSamples
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a3, 0x002C($sp)
    lbu     t6, 0x0004(a2)             # 00000004
    sll     a3, a3, 16
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sra     a3, a3, 16
    bne     t6, $at, lbl_800B1778
    or      s0, a0, $zero              # s0 = 00000000
    lbu     t7, 0x0018(a2)             # 00000018
    beq     t7, $zero, lbl_800B1768
    nop
    jal     func_800B0DE8
    nop
    b       lbl_800B1784
    or      s0, v0, $zero              # s0 = 00000000
lbl_800B1768:
    jal     func_800B1470
    or      a0, s0, $zero              # a0 = 00000000
    b       lbl_800B1784
    or      s0, v0, $zero              # s0 = 00000000
lbl_800B1778:
    jal     func_800B0AA4
    or      a0, s0, $zero              # a0 = 00000000
    or      s0, v0, $zero              # s0 = 00000000
lbl_800B1784:
    lw      $ra, 0x001C($sp)
    or      v0, s0, $zero              # v0 = 00000000
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800B1798:
# MqDbg: AudioSynth_SaveReverbSamples
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0020($sp)
    sw      s0, 0x001C($sp)
    sw      a2, 0x0038($sp)
    lbu     t6, 0x0003(a1)             # 00000003
    sll     a2, a2, 16
    sra     a2, a2, 16
    sll     t7, t6,  3
    addu    t7, t7, t6
    sll     t7, t7,  2
    sll     t9, a2,  3
    subu    t7, t7, t6
    lbu     t0, 0x0004(a1)             # 00000004
    sll     t7, t7,  2
    subu    t9, t9, a2
    sll     t9, t9,  2
    addu    t8, a1, t7
    addu    v0, t8, t9
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      s0, a0, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    bne     t0, $at, lbl_800B1868
    addiu   v1, v0, 0x0040             # v1 = 00000040
    lbu     t1, 0x0018(a1)             # 00000018
    beql    t1, $zero, lbl_800B1818
    lhu     a2, 0x000E(v1)             # 0000004E
    jal     func_800B0C40
    nop
    b       lbl_800B1880
    or      s0, v0, $zero              # s0 = 00000000
    lhu     a2, 0x000E(v1)             # 0000000E
lbl_800B1818:
    lh      a3, 0x0010(v1)             # 00000010
    sw      v1, 0x002C($sp)
    sw      s1, 0x0010($sp)
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800B1634
    addiu   a1, $zero, 0x0C80          # a1 = 00000C80
    lw      v1, 0x002C($sp)
    or      s0, v0, $zero              # s0 = 00000000
    or      a0, v0, $zero              # a0 = 00000000
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B1884
    sb      $zero, 0x0000(s1)          # 00000000
    lh      a1, 0x0010(v1)             # 00000010
    sw      s1, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0C80             # a1 = 00000C80
    jal     func_800B1634
    andi    a1, a1, 0xFFFF             # a1 = 00000C80
    b       lbl_800B1880
    or      s0, v0, $zero              # s0 = 00000000
lbl_800B1868:
    or      a0, s0, $zero              # a0 = 00000000
    addiu   s0, s0, 0x0008             # s0 = 00000008
    addiu   a1, $zero, 0x0C80          # a1 = 00000C80
    addiu   a2, $zero, 0x0340          # a2 = 00000340
    jal     func_800B12F8
    lw      a3, 0x0044(v0)             # 00000044
lbl_800B1880:
    sb      $zero, 0x0000(s1)          # 00000000
lbl_800B1884:
    lw      $ra, 0x0024($sp)
    or      v0, s0, $zero              # v0 = 00000008
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B189C:
# MqDbg: AudioSynth_SaveRingBuffer2
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    lbu     t7, 0x0003(a1)             # 00000003
    lh      t0, 0x0032($sp)
    or      t6, a1, $zero              # t6 = 00000000
    sll     t8, t7,  3
    addu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t1, t0,  3
    sll     t8, t8,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t9, a1, t8
    addu    v1, t9, t1
    addiu   v1, v1, 0x0158             # v1 = 00000158
    lh      a3, 0x0010(v1)             # 00000168
    lhu     a2, 0x000E(v1)             # 00000166
    sw      v1, 0x0024($sp)
    sw      t6, 0x0010($sp)
    jal     func_800B1634
    addiu   a1, $zero, 0x0C80          # a1 = 00000C80
    lw      v1, 0x0024($sp)
    or      a0, v0, $zero              # a0 = 00000000
    lw      t2, 0x002C($sp)
    lh      a3, 0x0012(v1)             # 00000012
    beql    a3, $zero, lbl_800B1934
    lw      $ra, 0x001C($sp)
    lh      a1, 0x0010(v1)             # 00000010
    sw      t2, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a1, a1, 0x0C80             # a1 = 00000C80
    jal     func_800B1634
    andi    a1, a1, 0xFFFF             # a1 = 00000C80
    or      a0, v0, $zero              # a0 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800B1934:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B1944:
# MqDbg: AudioSynth_DoOneAudioUpdate
    addiu   $sp, $sp, 0xFF08           # $sp -= 0xF8
    sw      s5, 0x003C($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    lw      t0, 0x2894(s5)             # 80127EC4
    lb      t1, 0x0001(s5)             # 80125631
    sw      s8, 0x0048($sp)
    multu   t0, a3
    sw      s3, 0x0034($sp)
    sw      s2, 0x0030($sp)
    or      s3, a2, $zero              # s3 = 00000000
    or      s8, a3, $zero              # s8 = 00000000
    sw      $ra, 0x004C($sp)
    sw      s7, 0x0044($sp)
    sw      s6, 0x0040($sp)
    sw      s4, 0x0038($sp)
    sw      s1, 0x002C($sp)
    mflo    t2
    sw      s0, 0x0028($sp)
    sw      a0, 0x00F8($sp)
    sw      a1, 0x00FC($sp)
    bne     t1, $zero, lbl_800B19F8
    or      s2, $zero, $zero           # s2 = 00000000
    blez    t0, lbl_800B19F0
    or      s1, $zero, $zero           # s1 = 00000000
    lw      t6, 0x0014(s5)             # 80125644
    sll     t7, t2,  5
    addiu   a0, $sp, 0x009C            # a0 = FFFFFFA4
    addu    v0, t6, t7
lbl_800B19B8:
    lw      t8, 0x0000(v0)             # 00000000
    addu    t3, a0, s2
    srl     t9, t8, 31
    beql    t9, $zero, lbl_800B19E0
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s2, s2, 0x0001             # s2 = 00000001
    sll     s2, s2, 16
    sra     s2, s2, 16
    sb      s1, 0x0000(t3)             # 00000000
    addiu   s1, s1, 0x0001             # s1 = 00000002
lbl_800B19E0:
    slt     $at, s1, t0
    bne     $at, $zero, lbl_800B19B8
    addiu   v0, v0, 0x0020             # v0 = 00000020
    or      s1, $zero, $zero           # s1 = 00000000
lbl_800B19F0:
    b       lbl_800B1AE4
    or      s4, $zero, $zero           # s4 = 00000000
lbl_800B19F8:
    blez    t1, lbl_800B1A7C
    or      s4, $zero, $zero           # s4 = 00000000
    addiu   a0, $sp, 0x009C            # a0 = FFFFFFA4
lbl_800B1A04:
    blez    t0, lbl_800B1A60
    or      s1, $zero, $zero           # s1 = 00000000
    lw      t5, 0x0014(s5)             # 80125644
    sll     t4, t2,  5
    addu    v1, t4, t5
lbl_800B1A18:
    or      v0, v1, $zero              # v0 = 00000000
    lw      t6, 0x0000(v0)             # 00000000
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800B1A54
    addiu   s1, s1, 0x0001             # s1 = 00000001
    lbu     t8, 0x0001(v0)             # 00000001
    addu    t3, a0, s2
    srl     t9, t8,  5
    bnel    s4, t9, lbl_800B1A54
    addiu   s1, s1, 0x0001             # s1 = 00000002
    addiu   s2, s2, 0x0001             # s2 = 00000002
    sll     s2, s2, 16
    sra     s2, s2, 16
    sb      s1, 0x0000(t3)             # 00000000
    addiu   s1, s1, 0x0001             # s1 = 00000003
lbl_800B1A54:
    slt     $at, s1, t0
    bne     $at, $zero, lbl_800B1A18
    addiu   v1, v1, 0x0020             # v1 = 00000020
lbl_800B1A60:
    addiu   s4, s4, 0x0001             # s4 = 00000001
    sll     s4, s4, 16
    sra     s4, s4, 16
    slt     $at, s4, t1
    bne     $at, $zero, lbl_800B1A04
    nop
    or      s4, $zero, $zero           # s4 = 00000000
lbl_800B1A7C:
    addiu   a0, $sp, 0x009C            # a0 = FFFFFFA4
    blez    t0, lbl_800B1AE4
    or      s1, $zero, $zero           # s1 = 00000000
    lw      t5, 0x0014(s5)             # 80125644
    sll     t4, t2,  5
    addu    v1, t4, t5
lbl_800B1A94:
    or      v0, v1, $zero              # v0 = 00000020
    lw      t6, 0x0000(v0)             # 00000020
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800B1AD4
    addiu   s1, s1, 0x0001             # s1 = 00000001
    lbu     t8, 0x0001(v0)             # 00000021
    addu    t3, a0, s2
    srl     t9, t8,  5
    slt     $at, t9, t1
    bnel    $at, $zero, lbl_800B1AD4
    addiu   s1, s1, 0x0001             # s1 = 00000002
    addiu   s2, s2, 0x0001             # s2 = 00000003
    sll     s2, s2, 16
    sra     s2, s2, 16
    sb      s1, 0x0000(t3)             # 00000000
    addiu   s1, s1, 0x0001             # s1 = 00000003
lbl_800B1AD4:
    slt     $at, s1, t0
    bne     $at, $zero, lbl_800B1A94
    addiu   v1, v1, 0x0020             # v1 = 00000040
    or      s1, $zero, $zero           # s1 = 00000000
lbl_800B1AE4:
    or      v0, s3, $zero              # v0 = 00000000
    lui     t4, 0x0200                 # t4 = 02000000
    ori     t4, t4, 0x0940             # t4 = 02000940
    addiu   t5, $zero, 0x0340          # t5 = 00000340
    sw      t5, 0x0004(v0)             # 00000004
    sw      t4, 0x0000(v0)             # 00000000
    lb      t6, 0x0001(s5)             # 80125631
    addiu   s3, s3, 0x0008             # s3 = 00000008
    sw      t2, 0x008C($sp)
    blez    t6, lbl_800B1DC8
    addiu   s7, $zero, 0x00E0          # s7 = 000000E0
    sw      t2, 0x008C($sp)
    sll     t7, s4,  2
lbl_800B1B18:
    subu    t7, t7, s4
    sll     t7, t7,  2
    subu    t7, t7, s4
    sll     t7, t7,  3
    addu    t7, t7, s4
    sll     t7, t7,  3
    addu    t8, s5, t7
    sw      t8, 0x005C($sp)
    lbu     t3, 0x0019(t8)             # 00000019
    or      a0, s3, $zero              # a0 = 00000008
    lw      a1, 0x00FC($sp)
    beq     t3, $zero, lbl_800B1C8C
    sw      t3, 0x0090($sp)
    sll     s6, s8, 16
    sra     s6, s6, 16
    sll     a3, s6, 16
    addiu   s0, t8, 0x0018             # s0 = 00000018
    or      a2, s0, $zero              # a2 = 00000018
    jal     func_800B1724
    sra     a3, a3, 16
    lh      t4, 0x000A(s0)             # 00000022
    lui     $at, 0x0C34                # $at = 0C340000
    lui     t7, 0x0C80                 # t7 = 0C800000
    andi    t5, t4, 0xFFFF             # t5 = 00000000
    or      t6, t5, $at                # t6 = 0C340000
    ori     t7, t7, 0x0940             # t7 = 0C800940
    sw      t7, 0x0004(v0)             # 00000004
    sw      t6, 0x0000(v0)             # 00000000
    lhu     t8, 0x0014(s0)             # 0000002C
    addiu   v1, v0, 0x0008             # v1 = 00000008
    or      s3, v1, $zero              # s3 = 00000008
    beq     t8, $zero, lbl_800B1BB8
    sw      t8, 0x007C($sp)
    lui     t9, 0x0A00                 # t9 = 0A000000
    lui     t4, 0x03E0                 # t4 = 03E00000
    ori     t4, t4, 0x0340             # t4 = 03E00340
    ori     t9, t9, 0x0C80             # t9 = 0A000C80
    sw      t9, 0x0000(v1)             # 00000008
    sw      t4, 0x0004(v1)             # 0000000C
    addiu   s3, v1, 0x0008             # s3 = 00000010
lbl_800B1BB8:
    lhu     t5, 0x000C(s0)             # 00000024
    ori     $at, $zero, 0x8000         # $at = 00008000
    or      v0, s3, $zero              # v0 = 00000010
    addu    t6, t5, $at
    andi    t7, t6, 0xFFFF             # t7 = 00000000
    lui     $at, 0x0C34                # $at = 0C340000
    lui     t3, 0x0C80                 # t3 = 0C800000
    ori     t3, t3, 0x0C80             # t3 = 0C800C80
    or      t8, t7, $at                # t8 = 0C340000
    sw      t8, 0x0000(v0)             # 00000010
    sw      t3, 0x0004(v0)             # 00000014
    lh      t9, 0x0010(s0)             # 00000028
    addiu   s3, s3, 0x0008             # s3 = 00000018
    or      a0, s3, $zero              # a0 = 00000018
    bne     t9, $zero, lbl_800B1C04
    nop
    lh      t4, 0x0012(s0)             # 0000002A
    beql    t4, $zero, lbl_800B1C14
    lw      t5, 0x007C($sp)
lbl_800B1C04:
    jal     func_800B0A40
    or      a1, s0, $zero              # a1 = 00000018
    or      s3, v0, $zero              # s3 = 00000000
    lw      t5, 0x007C($sp)
lbl_800B1C14:
    or      a0, s3, $zero              # a0 = 00000000
    or      a1, s0, $zero              # a1 = 00000018
    beq     t5, $zero, lbl_800B1C8C
    sll     a2, s6, 16
    jal     func_800B1798
    sra     a2, a2, 16
    lb      t6, 0x0005(s0)             # 0000001D
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    or      s3, v0, $zero              # s3 = 00000000
    beq     t6, $at, lbl_800B1C50
    or      a0, v0, $zero              # a0 = 00000000
    or      a1, s0, $zero              # a1 = 00000018
    jal     func_800B10A8
    or      a2, s8, $zero              # a2 = 00000000
    or      s3, v0, $zero              # s3 = 00000000
lbl_800B1C50:
    sll     a3, s6, 16
    sra     a3, a3, 16
    or      a0, s3, $zero              # a0 = 00000000
    lw      a1, 0x00FC($sp)
    jal     func_800B16E4
    or      a2, s0, $zero              # a2 = 00000018
    lh      t7, 0x0016(s0)             # 0000002E
    lui     $at, 0x0C34                # $at = 0C340000
    lui     t9, 0x03E0                 # t9 = 03E00000
    andi    t8, t7, 0xFFFF             # t8 = 00000000
    or      t3, t8, $at                # t3 = 0C340000
    ori     t9, t9, 0x0C80             # t9 = 03E00C80
    sw      t9, 0x0004(v0)             # 00000004
    sw      t3, 0x0000(v0)             # 00000000
    addiu   s3, v0, 0x0008             # s3 = 00000008
lbl_800B1C8C:
    slt     $at, s1, s2
    beq     $at, $zero, lbl_800B1D08
    addiu   t4, $sp, 0x009C            # t4 = FFFFFFA4
    addu    s0, s1, t4
lbl_800B1C9C:
    lbu     v0, 0x0000(s0)             # 00000018
    lw      t5, 0x008C($sp)
    lw      t8, 0x0014(s5)             # 80125644
    or      a0, v0, $zero              # a0 = 00000000
    addu    t6, v0, t5
    sll     t7, t6,  5
    addu    a1, t7, t8
    lbu     t3, 0x0001(a1)             # 00000001
    srl     t9, t3,  5
    bnel    s4, t9, lbl_800B1D0C
    lw      t7, 0x0090($sp)
    multu   v0, s7
    lw      t5, 0x352C(s5)             # 80128B5C
    lw      t6, 0x00FC($sp)
    lw      a3, 0x00F8($sp)
    sw      s3, 0x0014($sp)
    sw      s8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    mflo    t4
    addu    a2, t4, t5
    jal     func_800B1ED0
    addiu   a2, a2, 0x0010             # a2 = 00000010
    addiu   s1, s1, 0x0001             # s1 = 00000001
    slt     $at, s1, s2
    or      s3, v0, $zero              # s3 = 00000000
    bne     $at, $zero, lbl_800B1C9C
    addiu   s0, s0, 0x0001             # s0 = 00000019
lbl_800B1D08:
    lw      t7, 0x0090($sp)
lbl_800B1D0C:
    lw      s0, 0x005C($sp)
    beql    t7, $zero, lbl_800B1DB0
    lb      t5, 0x0001(s5)             # 80125631
    lw      t8, 0x0288(s0)             # 000002A1
    sll     s6, s8, 16
    sra     s6, s6, 16
    bne     t8, $zero, lbl_800B1D38
    addiu   s0, s0, 0x0018             # s0 = 00000031
    lw      t3, 0x0274(s0)             # 000002A5
    beql    t3, $zero, lbl_800B1D54
    lw      t9, 0x007C($sp)
lbl_800B1D38:
    lw      a1, 0x00FC($sp)
    or      a0, s3, $zero              # a0 = 00000000
    or      a2, s0, $zero              # a2 = 00000031
    jal     func_800B1000
    sll     a1, a1,  1
    or      s3, v0, $zero              # s3 = 00000000
    lw      t9, 0x007C($sp)
lbl_800B1D54:
    or      a0, s3, $zero              # a0 = 00000000
    or      a1, s0, $zero              # a1 = 00000031
    beq     t9, $zero, lbl_800B1D80
    sll     a2, s6, 16
    sll     a2, s6, 16
    sra     a2, a2, 16
    or      a0, s3, $zero              # a0 = 00000000
    jal     func_800B189C
    or      a1, s0, $zero              # a1 = 00000031
    b       lbl_800B1DAC
    or      s3, v0, $zero              # s3 = 00000000
lbl_800B1D80:
    jal     func_800B1798
    sra     a2, a2, 16
    lb      t4, 0x0005(s0)             # 00000036
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    or      s3, v0, $zero              # s3 = 00000000
    beq     t4, $at, lbl_800B1DAC
    or      a0, v0, $zero              # a0 = 00000000
    or      a1, s0, $zero              # a1 = 00000031
    jal     func_800B10A8
    or      a2, s8, $zero              # a2 = 00000000
    or      s3, v0, $zero              # s3 = 00000000
lbl_800B1DAC:
    lb      t5, 0x0001(s5)             # 80125631
lbl_800B1DB0:
    addiu   s4, s4, 0x0001             # s4 = 00000001
    sll     s4, s4, 16
    sra     s4, s4, 16
    slt     $at, s4, t5
    bnel    $at, $zero, lbl_800B1B18
    sll     t7, s4,  2
lbl_800B1DC8:
    lw      s6, 0x00FC($sp)
    slt     $at, s1, s2
    addiu   s7, $zero, 0x00E0          # s7 = 000000E0
    beq     $at, $zero, lbl_800B1E40
    sll     s6, s6,  1
    addiu   t6, $sp, 0x009C            # t6 = FFFFFFA4
    addu    s0, s1, t6
    addu    s4, s2, t6
lbl_800B1DE8:
    lbu     v0, 0x0000(s0)             # 00000031
    lw      t7, 0x008C($sp)
    lw      t5, 0x352C(s5)             # 80128B5C
    multu   v0, s7
    lw      t9, 0x0014(s5)             # 80125644
    lw      t6, 0x00FC($sp)
    addu    t8, v0, t7
    sll     t3, t8,  5
    sw      s8, 0x0018($sp)
    sw      s3, 0x0014($sp)
    lw      a3, 0x00F8($sp)
    or      a0, v0, $zero              # a0 = 00000000
    addu    a1, t3, t9
    mflo    t4
    addu    a2, t4, t5
    addiu   a2, a2, 0x0010             # a2 = 00000010
    jal     func_800B1ED0
    sw      t6, 0x0010($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000032
    sltu    $at, s0, s4
    bne     $at, $zero, lbl_800B1DE8
    or      s3, v0, $zero              # s3 = 00000000
lbl_800B1E40:
    sra     t7, s6,  4
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t3, t8, 16
    lui     $at, 0x0D00                # $at = 0D000000
    or      t9, t3, $at                # t9 = 0D000000
    sll     t6, s6,  1
    sra     t7, t6,  4
    ori     t4, t9, 0x03C0             # t4 = 0D0003C0
    or      v1, s3, $zero              # v1 = 00000000
    andi    t8, t7, 0x00FF             # t8 = 00000000
    lui     t5, 0x0940                 # t5 = 09400000
    sll     t3, t8, 16
    lui     $at, 0x1500                # $at = 15000000
    ori     t5, t5, 0x0AE0             # t5 = 09400AE0
    sw      t4, 0x0000(v1)             # 00000000
    addiu   s3, s3, 0x0008             # s3 = 00000008
    or      t9, t3, $at                # t9 = 15000000
    sw      t5, 0x0004(v1)             # 00000004
    ori     t4, t9, 0x03C0             # t4 = 150003C0
    or      a0, s3, $zero              # a0 = 00000008
    sw      t4, 0x0000(a0)             # 00000008
    lw      t5, 0x00F8($sp)
    addiu   v0, s3, 0x0008             # v0 = 00000010
    sw      t5, 0x0004(a0)             # 0000000C
    lw      $ra, 0x004C($sp)
    lw      s8, 0x0048($sp)
    lw      s7, 0x0044($sp)
    lw      s6, 0x0040($sp)
    lw      s5, 0x003C($sp)
    lw      s4, 0x0038($sp)
    lw      s3, 0x0034($sp)
    lw      s2, 0x0030($sp)
    lw      s1, 0x002C($sp)
    lw      s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00F8           # $sp += 0xF8


func_800B1ED0:
# MqDbg: AudioSynth_ProcessNote
    addiu   $sp, $sp, 0xFEA0           # $sp -= 0x160
    sw      $ra, 0x004C($sp)
    sw      s8, 0x0048($sp)
    sw      s7, 0x0044($sp)
    sw      s6, 0x0040($sp)
    sw      s5, 0x003C($sp)
    sw      s4, 0x0038($sp)
    sw      s3, 0x0034($sp)
    sw      s2, 0x0030($sp)
    sw      s1, 0x002C($sp)
    sw      s0, 0x0028($sp)
    sw      a0, 0x0160($sp)
    sw      a3, 0x016C($sp)
    lw      v1, 0x0000(a1)             # 00000000
    sll     t9, a0,  3
    lui     t4, 0x8013                 # t4 = 80130000
    sll     t6, v1, 11
    lw      t4, -0x74A4(t4)            # 80128B5C
    srl     t7, t6, 30
    subu    t9, t9, a0
    sll     t5, v1,  1
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sll     t9, t9,  5
    srl     t6, t5, 31
    sll     t3, v1,  2
    or      s0, a2, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    sw      t7, 0x008C($sp)
    srl     t3, t3, 31
    or      t1, $zero, $zero           # t1 = 00000000
    bne     t2, t6, lbl_800B1F9C
    addu    a3, t9, t4
    sb      $zero, 0x0000(a2)          # 00000000
    lw      t7, 0x00BC(a3)             # 000000BC
    sh      $zero, 0x0006(a2)          # 00000006
    sh      $zero, 0x0010(a2)          # 00000010
    sh      $zero, 0x0012(a2)          # 00000012
    sb      $zero, 0x0002(a2)          # 00000002
    sb      $zero, 0x0003(a2)          # 00000003
    sw      t7, 0x0008(a2)             # 00000008
    lbu     t8, 0x0005(a1)             # 00000005
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      $zero, 0x0005(a2)          # 00000005
    sb      t9, 0x001A(a2)             # 0000001A
    sb      t8, 0x0004(a2)             # 00000004
    lbu     t4, 0x00C0(a3)             # 000000C0
    or      t1, t2, $zero              # t1 = 00000001
    or      t3, $zero, $zero           # t3 = 00000000
    andi    t5, t4, 0xFFDF             # t5 = 00000000
    sb      t5, 0x00C0(a3)             # 000000C0
    lw      v1, 0x0000(a1)             # 00000000
lbl_800B1F9C:
    lhu     t6, 0x000C(s1)             # 0000000C
    lw      t8, 0x0170($sp)
    sll     a0, v1, 14
    andi    t7, t6, 0xFFFF             # t7 = 00000000
    multu   t7, t8
    sh      t6, 0x0136($sp)
    lhu     t5, 0x0006(s0)             # 00000006
    lbu     v0, 0x0005(s0)             # 00000005
    srl     a0, a0, 31
    addiu   a0, a0, 0x0001             # a0 = 00000001
    mflo    t9
    sll     t4, t9,  1
    addu    t0, t4, t5
    bne     t2, v0, lbl_800B1FD8
    sh      t0, 0x0006(s0)             # 00000006
lbl_800B1FD8:
    sb      a0, 0x0005(s0)             # 00000005
    lw      v1, 0x0000(s1)             # 00000000
    sll     t8, v1, 13
    bgezl   t8, lbl_800B2048
    lw      t8, 0x0010(s1)             # 00000010
    srl     a3, t0, 16
    lw      a0, 0x0174($sp)
    sw      a3, 0x0050($sp)
    or      a1, s1, $zero              # a1 = 00000000
    or      a2, s0, $zero              # a2 = 00000000
    sw      s0, 0x0168($sp)
    jal     func_800B2FB4
    sw      s1, 0x0164($sp)
    lw      a0, 0x0168($sp)
    lw      t5, 0x0050($sp)
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lw      a2, 0x0008(a0)             # 00000008
    sll     t9, a2,  1
    addiu   t4, t9, 0x0580             # t4 = 00000580
    sh      t4, 0x00AE($sp)
    addu    t6, a2, t5
    sw      t6, 0x0008(a0)             # 00000008
    lw      s1, 0x0164($sp)
    lw      s0, 0x0168($sp)
    lw      v1, 0x0000(s1)             # 00000000
    b       lbl_800B28F4
    sw      v0, 0x0174($sp)
    lw      t8, 0x0010(s1)             # 00000010
lbl_800B2048:
    srl     t5, t0, 16
    lw      v0, 0x0000(t8)             # 00000000
    lw      a1, 0x0008(v0)             # 00000008
    lw      t9, 0x0004(a1)             # 00000004
    sw      t9, 0x0100($sp)
    lw      t4, 0x0004(v0)             # 00000004
    sw      $zero, 0x00B0($sp)
    sw      $zero, 0x00BC($sp)
    blez    a0, lbl_800B28F4
    sw      t4, 0x0110($sp)
    sw      t3, 0x0088($sp)
    or      t3, s0, $zero              # t3 = 00000000
    sw      t5, 0x0050($sp)
    sw      v0, 0x0150($sp)
    sw      a0, 0x00C0($sp)
    sw      a1, 0x014C($sp)
    sw      a3, 0x009C($sp)
    sw      t1, 0x0138($sp)
    sw      s0, 0x0168($sp)
    sw      s1, 0x0164($sp)
    lw      s2, 0x0174($sp)
    lw      t2, 0x00D4($sp)
    or      v1, a0, $zero              # v1 = 00000000
lbl_800B20A4:
    lw      t6, 0x0150($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      t1, $zero, $zero           # t1 = 00000000
    lw      a3, 0x0000(t6)             # 00000000
    or      s5, $zero, $zero           # s5 = 00000000
    bne     v1, $at, lbl_800B20C8
    srl     a3, a3, 28
    b       lbl_800B20F0
    lw      s8, 0x0050($sp)
lbl_800B20C8:
    lw      t7, 0x0050($sp)
    lw      t4, 0x00BC($sp)
    lw      s8, 0x0050($sp)
    andi    t8, t7, 0x0001             # t8 = 00000000
    beq     t8, $zero, lbl_800B20F0
    sll     t5, t4,  1
    addiu   $at, $zero, 0xFFFE         # $at = FFFFFFFE
    and     t9, t7, $at
    b       lbl_800B20F0
    addu    s8, t9, t5
lbl_800B20F0:
    beq     a3, $zero, lbl_800B2100
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     a3, $at, lbl_800B21AC
    nop
lbl_800B2100:
    lw      t6, 0x0150($sp)
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x5640(t8)             # 80125640
    lw      v0, 0x000C(t6)             # 0000000C
    lw      t7, 0x008C($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    addiu   v0, v0, 0x0008             # v0 = 00000008
    beq     t8, v0, lbl_800B21AC
    nop
    beq     t7, $at, lbl_800B2148
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t7, $at, lbl_800B2158
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     t7, $at, lbl_800B2158
    nop
    b       lbl_800B2158
    nop
lbl_800B2148:
    addiu   t4, t4, 0x0EBA             # t4 = 80100EBA
    lui     $at, 0x8012                # $at = 80120000
    b       lbl_800B2160
    sw      t4, 0x5640($at)            # 80125640
lbl_800B2158:
    lui     $at, 0x8012                # $at = 80120000
    sw      v0, 0x5640($at)            # 80125640
lbl_800B2160:
    lw      t9, 0x0150($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    lw      v0, 0x000C(t9)             # 0000000C
    or      v1, s2, $zero              # v1 = 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    lw      t5, 0x0000(v0)             # 00000008
    lw      t8, 0x0004(v0)             # 0000000C
    addiu   s2, s2, 0x0008             # s2 = 00000008
    sll     t6, t5,  4
    multu   t6, t8
    mflo    a0
    and     t7, a0, $at
    lui     $at, 0x0B00                # $at = 0B000000
    or      t4, t7, $at                # t4 = 0B000000
    sw      t4, 0x0000(v1)             # 00000000
    lw      t9, 0x5640(t9)             # 80125640
    sw      t9, 0x0004(v1)             # 00000004
    lw      v1, 0x00C0($sp)
lbl_800B21AC:
    beql    s8, $zero, lbl_800B27AC
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $zero, 0x0140($sp)
lbl_800B21B8:
    sw      $zero, 0x013C($sp)
    lw      a2, 0x0008(t3)             # 00000008
    lw      t6, 0x0150($sp)
    subu    a0, s8, t1
    sw      a0, 0x00FC($sp)
    lw      t5, 0x0100($sp)
    lw      t0, 0x0000(t6)             # 00000000
    andi    s3, a2, 0x000F             # s3 = 00000000
    or      s4, $zero, $zero           # s4 = 00000000
    subu    v1, t5, a2
    bne     s3, $zero, lbl_800B21F8
    srl     a3, t0, 28
    lbu     t8, 0x0000(t3)             # 00000000
    bnel    t8, $zero, lbl_800B21FC
    addiu   t7, $zero, 0x0010          # t7 = 00000010
    addiu   s3, $zero, 0x0010          # s3 = 00000010
lbl_800B21F8:
    addiu   t7, $zero, 0x0010          # t7 = 00000010
lbl_800B21FC:
    subu    a1, t7, s3
    slt     $at, a0, v1
    beq     $at, $zero, lbl_800B2238
    or      s6, a1, $zero              # s6 = 00000000
    subu    v0, a0, a1
    addiu   v0, v0, 0x000F             # v0 = 00000017
    bgez    v0, lbl_800B2220
    addu    $at, v0, $zero
    addiu   $at, v0, 0x000F            # $at = 00000026
lbl_800B2220:
    sra     v0, $at,  4
    sll     s0, v0,  4
    addu    t4, a1, s0
    or      s1, v0, $zero              # s1 = 00000017
    b       lbl_800B2284
    subu    s7, t4, a0
lbl_800B2238:
    subu    s0, v1, a1
    bgtz    s0, lbl_800B224C
    or      s7, $zero, $zero           # s7 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    or      s6, v1, $zero              # s6 = 00000000
lbl_800B224C:
    lw      t9, 0x014C($sp)
    addiu   s1, s0, 0x000F             # s1 = 0000000F
    bgez    s1, lbl_800B2260
    addu    $at, s1, $zero
    addiu   $at, s1, 0x000F            # $at = 0000001E
lbl_800B2260:
    sra     s1, $at,  4
    lw      t5, 0x0008(t9)             # 80120008
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    beql    t5, $zero, lbl_800B2284
    sw      t8, 0x0140($sp)
    b       lbl_800B2284
    sw      t6, 0x013C($sp)
    sw      t8, 0x0140($sp)
lbl_800B2284:
    sltiu   $at, a3, 0x0006
    beq     $at, $zero, lbl_800B2360
    sll     t7, a3,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x6850($at)           # 801097B0
    jr      t7
    nop
    addiu   t4, $zero, 0x0010          # t4 = 00000010
    addiu   t2, $zero, 0x0009          # t2 = 00000009
    sw      t4, 0x00CC($sp)
    b       lbl_800B2360
    sw      $zero, 0x00C8($sp)
    addiu   t9, $zero, 0x0010          # t9 = 00000010
    addiu   t2, $zero, 0x0005          # t2 = 00000005
    sw      t9, 0x00CC($sp)
    b       lbl_800B2360
    sw      $zero, 0x00C8($sp)
    addiu   t5, $zero, 0x0010          # t5 = 00000010
    addiu   t2, $zero, 0x0010          # t2 = 00000010
    sw      t5, 0x00CC($sp)
    b       lbl_800B2360
    sw      $zero, 0x00C8($sp)
    or      a0, s2, $zero              # a0 = 00000008
    sll     a2, s8,  1
    addiu   a2, a2, 0x0020             # a2 = 00000020
    addiu   s2, s2, 0x0008             # s2 = 00000010
    addiu   a1, $zero, 0x0580          # a1 = 00000580
    sw      $zero, 0x0138($sp)
    sw      $zero, 0x0120($sp)
    or      t1, s8, $zero              # t1 = 00000000
    or      s5, s8, $zero              # s5 = 00000000
    sw      s8, 0x0104($sp)
    jal     func_800B115C
    sw      t2, 0x00D4($sp)
    lw      t1, 0x0104($sp)
    lw      t2, 0x00D4($sp)
    b       lbl_800B2714
    lw      t3, 0x0168($sp)
    or      a0, s2, $zero              # a0 = 00000010
    sll     a2, s8,  1
    addiu   a2, a2, 0x0020             # a2 = 00000020
    addiu   s2, s2, 0x0008             # s2 = 00000018
    addiu   a1, $zero, 0x0580          # a1 = 00000580
    sw      $zero, 0x0138($sp)
    sw      $zero, 0x0120($sp)
    or      t1, s8, $zero              # t1 = 00000000
    or      s5, s8, $zero              # s5 = 00000000
    sw      s8, 0x0104($sp)
    jal     func_800B115C
    sw      t2, 0x00D4($sp)
    lw      t1, 0x0104($sp)
    lw      t2, 0x00D4($sp)
    b       lbl_800B2714
    lw      t3, 0x0168($sp)
lbl_800B2360:
    beq     s1, $zero, lbl_800B2474
    lw      t6, 0x00CC($sp)
    addu    t8, a2, t6
    subu    v1, t8, s3
    bgez    v1, lbl_800B237C
    addu    $at, v1, $zero
    addiu   $at, v1, 0x000F            # $at = 0000000F
lbl_800B237C:
    sra     v1, $at,  4
    sll     v0, t0,  4
    srl     v0, v0, 30
    bne     v0, $zero, lbl_800B23AC
    addiu   $at, $zero, 0x0001         # $at = 00000001
    multu   v1, t2
    lw      t7, 0x00C8($sp)
    lw      t5, 0x0110($sp)
    mflo    t4
    addu    t9, t7, t4
    b       lbl_800B2410
    addu    a1, t9, t5
lbl_800B23AC:
    bne     v0, $at, lbl_800B23BC
    nop
    b       lbl_800B2BBC
    or      v0, s2, $zero              # v0 = 00000018
lbl_800B23BC:
    multu   v1, t2
    lw      t6, 0x00C8($sp)
    lw      t4, 0x0110($sp)
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    lw      a2, 0x0138($sp)
    addiu   a3, t3, 0x0001             # a3 = 00000001
    sw      v0, 0x0010($sp)
    sw      t1, 0x0104($sp)
    sw      t2, 0x00D4($sp)
    mflo    t8
    addu    t7, t6, t8
    addu    a0, t7, t4
    multu   s1, t2
    mflo    a1
    addiu   a1, a1, 0x001F             # a1 = 0000001F
    jal     func_800B689C
    and     a1, a1, $at
    lw      t1, 0x0104($sp)
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
    or      a1, v0, $zero              # a1 = 00000000
lbl_800B2410:
    bne     a1, $zero, lbl_800B2420
    nop
    b       lbl_800B2BBC
    or      v0, s2, $zero              # v0 = 00000018
lbl_800B2420:
    multu   s1, t2
    lui     $at, 0x1400                # $at = 14000000
    addiu   t7, $zero, 0x0940          # t7 = 00000940
    andi    t0, a1, 0x000F             # t0 = 00000000
    or      a0, s2, $zero              # a0 = 00000018
    subu    t4, a1, t0
    sw      t4, 0x0004(a0)             # 0000001C
    addiu   s2, s2, 0x0008             # s2 = 00000020
    mflo    v0
    addiu   v0, v0, 0x001F             # v0 = 00000037
    andi    v0, v0, 0xFFF0             # v0 = 00000030
    sra     t9, v0,  4
    andi    t5, t9, 0x00FF             # t5 = 00000000
    sll     t6, t5, 16
    or      t8, t6, $at                # t8 = 14000000
    subu    t5, t7, v0
    andi    t6, t5, 0xFFFF             # t6 = 00000000
    or      t7, t8, t6                 # t7 = 14000000
    sw      t7, 0x0000(a0)             # 00000018
    b       lbl_800B2480
    lbu     a2, 0x0000(t3)             # 00000000
lbl_800B2474:
    or      s0, $zero, $zero           # s0 = 00000000
    or      t0, $zero, $zero           # t0 = 00000000
    lbu     a2, 0x0000(t3)             # 00000000
lbl_800B2480:
    beq     a2, $zero, lbl_800B24B0
    or      v0, s2, $zero              # v0 = 00000020
    lui     t9, 0x0F00                 # t9 = 0F000000
    sw      t9, 0x0000(v0)             # 00000020
    lw      t5, 0x0150($sp)
    addiu   t7, $zero, 0x0002          # t7 = 00000002
    addiu   s2, s2, 0x0008             # s2 = 00000028
    lw      t8, 0x0008(t5)             # 00000008
    addiu   t6, t8, 0x0010             # t6 = 14000010
    sw      t6, 0x0004(v0)             # 00000024
    sw      t7, 0x0138($sp)
    sb      $zero, 0x0000(t3)          # 00000000
lbl_800B24B0:
    lw      t4, 0x0150($sp)
    sll     t9, s3,  1
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    lw      a3, 0x0000(t4)             # 00000000
    bne     t1, $zero, lbl_800B24D0
    srl     a3, a3, 28
    b       lbl_800B24D8
    sw      t9, 0x0120($sp)
lbl_800B24D0:
    addiu   s4, s5, 0x001F             # s4 = 0000001F
    and     s4, s4, $at
lbl_800B24D8:
    beq     a3, $zero, lbl_800B24F8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a3, $at, lbl_800B25EC
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     a3, $at, lbl_800B2570
    nop
    b       lbl_800B2658
    nop
lbl_800B24F8:
    multu   s1, t2
    addiu   t7, $zero, 0x0940          # t7 = 00000940
    lui     $at, 0x0800                # $at = 08000000
    or      v0, s2, $zero              # v0 = 00000028
    addiu   t9, s4, 0x0580             # t9 = 0000059F
    addiu   s2, s2, 0x0008             # s2 = 00000030
    or      v1, s2, $zero              # v1 = 00000030
    addiu   s2, s2, 0x0008             # s2 = 00000038
    mflo    t5
    addiu   t8, t5, 0x001F             # t8 = 0000001F
    andi    t6, t8, 0xFFF0             # t6 = 00000010
    subu    t5, t7, t6
    addu    t8, t5, t0
    andi    t7, t8, 0xFFFF             # t7 = 0000001F
    or      t6, t7, $at                # t6 = 0800001F
    sll     t8, s0,  1
    andi    t7, t8, 0xFFFF             # t7 = 0000001F
    sw      t6, 0x0000(v0)             # 00000028
    sll     t5, t9, 16
    or      t6, t5, t7                 # t6 = 0000001F
    sw      t6, 0x0004(v0)             # 0000002C
    lw      t4, 0x0138($sp)
    lui     $at, 0x0100                # $at = 01000000
    andi    t9, t4, 0x00FF             # t9 = 00000000
    sll     t8, t9, 16
    or      t5, t8, $at                # t5 = 0100001F
    sw      t5, 0x0000(v1)             # 00000030
    lw      t7, 0x000C(t3)             # 0000000C
    b       lbl_800B2658
    sw      t7, 0x0004(v1)             # 00000034
lbl_800B2570:
    multu   s1, t2
    addiu   t8, $zero, 0x0940          # t8 = 00000940
    lui     $at, 0x0800                # $at = 08000000
    or      v0, s2, $zero              # v0 = 00000038
    addiu   t7, s4, 0x0580             # t7 = 0000059F
    addiu   s2, s2, 0x0008             # s2 = 00000040
    or      v1, s2, $zero              # v1 = 00000040
    addiu   s2, s2, 0x0008             # s2 = 00000048
    mflo    t6
    addiu   t4, t6, 0x001F             # t4 = 0000003E
    andi    t9, t4, 0xFFF0             # t9 = 00000030
    subu    t6, t8, t9
    addu    t4, t6, t0
    andi    t8, t4, 0xFFFF             # t8 = 0000003E
    or      t9, t8, $at                # t9 = 0800003E
    sll     t4, s0,  1
    andi    t8, t4, 0xFFFF             # t8 = 0000003E
    sw      t9, 0x0000(v0)             # 00000038
    sll     t6, t7, 16
    or      t9, t6, t8                 # t9 = 0000003F
    sw      t9, 0x0004(v0)             # 0000003C
    lw      t5, 0x0138($sp)
    lui     $at, 0x0100                # $at = 01000000
    ori     t7, t5, 0x0004             # t7 = 0100001F
    andi    t4, t7, 0x00FF             # t4 = 0000001F
    sll     t6, t4, 16
    or      t8, t6, $at                # t8 = 0100001F
    sw      t8, 0x0000(v1)             # 00000040
    lw      t9, 0x000C(t3)             # 0000000C
    b       lbl_800B2658
    sw      t9, 0x0004(v1)             # 00000044
lbl_800B25EC:
    multu   s1, t2
    addiu   t6, $zero, 0x0940          # t6 = 00000940
    or      a0, s2, $zero              # a0 = 00000048
    addiu   s2, s2, 0x0008             # s2 = 00000050
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a3, s4, 0x0580             # a3 = 0000059F
    sw      t1, 0x0104($sp)
    sw      t2, 0x00D4($sp)
    mflo    t5
    addiu   t7, t5, 0x001F             # t7 = 0100003E
    andi    t4, t7, 0xFFF0             # t4 = 00000030
    subu    t8, t6, t4
    sll     t9, t8, 16
    sra     t5, t9, 16
    sll     t7, s0,  1
    sw      t7, 0x0010($sp)
    jal     func_800B11E0
    addu    a2, t5, t0
    lw      t3, 0x0168($sp)
    or      a0, s2, $zero              # a0 = 00000050
    addiu   s2, s2, 0x0008             # s2 = 00000058
    lw      a1, 0x0138($sp)
    jal     func_800B1354
    lw      a2, 0x000C(t3)             # 0000000C
    lw      t1, 0x0104($sp)
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
lbl_800B2658:
    beq     t1, $zero, lbl_800B26A8
    or      v0, s2, $zero              # v0 = 00000058
    sll     t6, s3,  1
    addu    t4, s4, t6
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    addiu   t8, t4, 0x0580             # t8 = 00000580
    and     t9, t8, $at
    lui     $at, 0x0A00                # $at = 0A000000
    or      t5, t9, $at                # t5 = 0A000000
    addu    t8, s0, s6
    subu    t9, t8, s7
    sw      t5, 0x0000(v0)             # 00000058
    sll     t5, t9,  1
    addiu   t6, s5, 0x0580             # t6 = 00000580
    sll     t4, t6, 16
    andi    t7, t5, 0xFFFF             # t7 = 00000000
    or      t6, t4, t7                 # t6 = 00000000
    sw      t6, 0x0004(v0)             # 0000005C
    addiu   s2, s2, 0x0008             # s2 = 00000060
lbl_800B26A8:
    lw      t9, 0x0138($sp)
    addu    t8, s0, s6
    subu    v1, t8, s7
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t9, $at, lbl_800B26D8
    addu    t1, t1, v1
    xori    v0, t9, 0x0002             # v0 = 00000002
    sltiu   v0, v0, 0x0001
    bne     v0, $zero, lbl_800B26F0
    sw      $zero, 0x0138($sp)
    b       lbl_800B26FC
    sll     t7, v1,  1
lbl_800B26D8:
    addiu   t5, $zero, 0x0020          # t5 = 00000020
    sll     s5, s0,  1
    sw      t5, 0x0120($sp)
    addiu   s5, s5, 0x0020             # s5 = 00000020
    b       lbl_800B2714
    sw      $zero, 0x0138($sp)
lbl_800B26F0:
    sll     t4, v1,  1
    b       lbl_800B2714
    addu    s5, t4, s5
lbl_800B26FC:
    beql    s5, $zero, lbl_800B2710
    addu    s5, s3, v1
    b       lbl_800B2714
    addu    s5, t7, s5
    addu    s5, s3, v1
lbl_800B2710:
    sll     s5, s5,  1
lbl_800B2714:
    lw      t6, 0x0140($sp)
    lw      t7, 0x013C($sp)
    lw      t4, 0x00FC($sp)
    beq     t6, $zero, lbl_800B2774
    or      a0, s2, $zero              # a0 = 00000060
    subu    a2, s8, t1
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sw      t8, 0x0088($sp)
    sll     a2, a2,  1
    addiu   s2, s2, 0x0008             # s2 = 00000068
    addiu   a1, s5, 0x0580             # a1 = 000005A0
    jal     func_800B115C
    sw      t2, 0x00D4($sp)
    lw      v0, 0x009C($sp)
    lbu     t5, 0x00C0(v0)             # 000000C0
    ori     t4, t5, 0x0020             # t4 = 00000020
    sb      t4, 0x00C0(v0)             # 000000C0
    lw      a1, 0x0160($sp)
    jal     func_800B0880
    lw      a0, 0x0178($sp)
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
    b       lbl_800B27A8
    lw      v1, 0x00C0($sp)
lbl_800B2774:
    beq     t7, $zero, lbl_800B2790
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sb      t6, 0x0000(t3)             # 00000000
    lw      t8, 0x014C($sp)
    lw      t9, 0x0000(t8)             # 00000000
    b       lbl_800B279C
    sw      t9, 0x0008(t3)             # 00000008
lbl_800B2790:
    lw      t5, 0x0008(t3)             # 00000008
    addu    t7, t5, t4
    sw      t7, 0x0008(t3)             # 00000008
lbl_800B279C:
    bnel    t1, s8, lbl_800B21B8
    sw      $zero, 0x0140($sp)
    lw      v1, 0x00C0($sp)
lbl_800B27A8:
    addiu   $at, $zero, 0x0001         # $at = 00000001
lbl_800B27AC:
    beq     v1, $at, lbl_800B27C8
    lw      t6, 0x0120($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v1, $at, lbl_800B27D4
    lw      t9, 0x00BC($sp)
    b       lbl_800B28B0
    lw      t7, 0x0088($sp)
lbl_800B27C8:
    addiu   t8, t6, 0x0580             # t8 = 00000581
    b       lbl_800B28AC
    sh      t8, 0x00AE($sp)
lbl_800B27D4:
    beq     t9, $zero, lbl_800B27F0
    or      a0, s2, $zero              # a0 = 00000068
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t9, $at, lbl_800B2868
    or      a0, s2, $zero              # a0 = 00000068
    b       lbl_800B28B0
    lw      t7, 0x0088($sp)
lbl_800B27F0:
    lw      a1, 0x0120($sp)
    addiu   t5, $zero, 0x03E0          # t5 = 000003E0
    sh      t5, 0x00AE($sp)
    addiu   a2, $zero, 0x03E0          # a2 = 000003E0
    addiu   s2, s2, 0x0008             # s2 = 00000070
    sw      t2, 0x00D4($sp)
    addiu   a1, a1, 0x0580             # a1 = 00000580
    bgez    s8, lbl_800B281C
    sra     a3, s8,  1
    addiu   $at, s8, 0x0001            # $at = 00000001
    sra     a3, $at,  1
lbl_800B281C:
    addiu   $at, $zero, 0xFFF8         # $at = FFFFFFF8
    addiu   a3, a3, 0x0007             # a3 = 00000007
    jal     func_800B1270
    and     a3, a3, $at
    lw      t4, 0x0088($sp)
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
    beq     t4, $zero, lbl_800B2860
    sw      s8, 0x00B0($sp)
    or      a0, s2, $zero              # a0 = 00000070
    addiu   s2, s2, 0x0008             # s2 = 00000078
    addiu   a1, s8, 0x03E0             # a1 = 000003E0
    addiu   a2, s8, 0x0010             # a2 = 00000010
    jal     func_800B115C
    sw      t2, 0x00D4($sp)
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
lbl_800B2860:
    b       lbl_800B28AC
    lw      v1, 0x00C0($sp)
lbl_800B2868:
    lw      a1, 0x0120($sp)
    lw      a2, 0x00B0($sp)
    addiu   s2, s2, 0x0008             # s2 = 00000080
    sw      t2, 0x00D4($sp)
    addiu   a1, a1, 0x0580             # a1 = 00000580
    addiu   a2, a2, 0x03E0             # a2 = 000003E0
    bgez    s8, lbl_800B2890
    sra     a3, s8,  1
    addiu   $at, s8, 0x0001            # $at = 00000001
    sra     a3, $at,  1
lbl_800B2890:
    addiu   $at, $zero, 0xFFF8         # $at = FFFFFFF8
    addiu   a3, a3, 0x0007             # a3 = 00000007
    jal     func_800B1270
    and     a3, a3, $at
    lw      t2, 0x00D4($sp)
    lw      t3, 0x0168($sp)
    lw      v1, 0x00C0($sp)
lbl_800B28AC:
    lw      t7, 0x0088($sp)
lbl_800B28B0:
    lw      t8, 0x00BC($sp)
    beq     t7, $zero, lbl_800B28D4
    addiu   t9, t8, 0x0001             # t9 = 00000001
    lw      s1, 0x0164($sp)
    lw      s0, 0x0168($sp)
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lw      v1, 0x0000(s1)             # 0000000F
    b       lbl_800B28F4
    sw      s2, 0x0174($sp)
lbl_800B28D4:
    bne     t9, v1, lbl_800B20A4
    sw      t9, 0x00BC($sp)
    lw      s1, 0x0164($sp)
    sw      t2, 0x00D4($sp)
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lw      v1, 0x0000(s1)             # 0000000F
    sw      s2, 0x0174($sp)
    lw      s0, 0x0168($sp)
lbl_800B28F4:
    sll     t4, v1,  1
    srl     t7, t4, 31
    lw      s2, 0x0174($sp)
    bne     t2, t7, lbl_800B2918
    or      t1, $zero, $zero           # t1 = 00000000
    lbu     t6, 0x0000(s1)             # 0000000F
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    andi    t8, t6, 0xFFBF             # t8 = 00000000
    sb      t8, 0x0000(s1)             # 0000000F
lbl_800B2918:
    lw      s4, 0x0170($sp)
    lhu     t9, 0x00AE($sp)
    or      a0, s2, $zero              # a0 = 00000080
    sll     s4, s4,  1
    or      a2, s4, $zero              # a2 = 0000001F
    or      a1, s0, $zero              # a1 = 00000000
    lhu     a3, 0x0136($sp)
    sw      t1, 0x0014($sp)
    sw      t1, 0x0138($sp)
    sw      s0, 0x0168($sp)
    sw      s1, 0x0164($sp)
    jal     func_800B2BEC
    sw      t9, 0x0010($sp)
    lw      t5, 0x008C($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s2, v0, $zero              # s2 = 00000000
    bne     t5, $at, lbl_800B2978
    or      a0, v0, $zero              # a0 = 00000000
    addiu   a1, $zero, 0x03C0          # a1 = 000003C0
    addiu   a2, $zero, 0x03C0          # a2 = 000003C0
    or      a3, s4, $zero              # a3 = 0000001F
    sw      $zero, 0x0010($sp)
    jal     func_800B13A4
    addiu   s2, v0, 0x0008             # s2 = 00000008
lbl_800B2978:
    lw      t4, 0x008C($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    or      a0, s2, $zero              # a0 = 00000008
    bne     t4, $at, lbl_800B299C
    addiu   a1, $zero, 0x03C0          # a1 = 000003C0
    addiu   a2, $zero, 0x03C0          # a2 = 000003C0
    or      a3, s4, $zero              # a3 = 0000001F
    jal     func_800B13F8
    addiu   s2, s2, 0x0008             # s2 = 00000010
lbl_800B299C:
    lw      s6, 0x0164($sp)
    or      a0, s2, $zero              # a0 = 00000010
    addiu   a2, $zero, 0x03C0          # a2 = 000003C0
    lbu     a1, 0x0002(s6)             # 00000002
    or      a3, $zero, $zero           # a3 = 00000000
    addiu   t7, s4, 0x0020             # t7 = 0000003F
    beq     a1, $zero, lbl_800B29D4
    slti    $at, a1, 0x0010
    beq     $at, $zero, lbl_800B29C8
    addiu   s2, s2, 0x0008             # s2 = 00000018
    addiu   a1, $zero, 0x0010          # a1 = 00000010
lbl_800B29C8:
    jal     func_800B1370
    sw      t7, 0x0010($sp)
    lw      s6, 0x0164($sp)
lbl_800B29D4:
    lw      a2, 0x0014(s6)             # 00000014
    or      a0, s2, $zero              # a0 = 00000018
    or      a1, s4, $zero              # a1 = 0000001F
    beql    a2, $zero, lbl_800B2A18
    lw      s1, 0x0168($sp)
    jal     func_800B1458
    addiu   s2, s2, 0x0008             # s2 = 00000020
    lw      t6, 0x0168($sp)
    or      a0, s2, $zero              # a0 = 00000020
    addiu   s2, s2, 0x0008             # s2 = 00000028
    lw      a3, 0x000C(t6)             # 0000000C
    lw      a1, 0x0138($sp)
    addiu   a2, $zero, 0x03C0          # a2 = 000003C0
    jal     func_800B1434
    addiu   a3, a3, 0x0040             # a3 = 00000040
    lw      s6, 0x0164($sp)
    lw      s1, 0x0168($sp)
lbl_800B2A18:
    lbu     s0, 0x0007(s6)             # 00000007
    lhu     v1, 0x000E(s6)             # 0000000E
    lw      s3, 0x000C(s1)             # 0000001B
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    or      s5, v1, $zero              # s5 = 00000000
    beq     s0, $zero, lbl_800B2B00
    addiu   s3, s3, 0x00E0             # s3 = 000000F0
    beq     v1, $zero, lbl_800B2B00
    or      a0, s2, $zero              # a0 = 00000028
    addiu   a1, $zero, 0x03C0          # a1 = 000003C0
    addiu   a2, $zero, 0x0760          # a2 = 00000760
    or      a3, s4, $zero              # a3 = 0000001F
    jal     func_800B1224
    addiu   s2, s2, 0x0008             # s2 = 00000030
    lw      t8, 0x0168($sp)
    addiu   t7, $zero, 0x0760          # t7 = 00000760
    subu    s1, t7, s0
    lbu     t9, 0x001A(t8)             # 0000001A
    or      a1, s1, $zero              # a1 = 0000000F
    or      a0, s2, $zero              # a0 = 00000030
    beq     t9, $zero, lbl_800B2A98
    or      a2, s0, $zero              # a2 = 00000000
    addiu   t5, $zero, 0x0760          # t5 = 00000760
    subu    s1, t5, s0
    or      a0, s2, $zero              # a0 = 00000030
    addiu   s2, s2, 0x0008             # s2 = 00000038
    or      a1, s1, $zero              # a1 = 0000000F
    jal     func_800B115C
    or      a2, s0, $zero              # a2 = 00000000
    lw      t4, 0x0168($sp)
    b       lbl_800B2AA4
    sb      $zero, 0x001A(t4)          # 0000001A
lbl_800B2A98:
    or      a3, s3, $zero              # a3 = 000000F0
    jal     func_800B12D0
    addiu   s2, s2, 0x0008             # s2 = 00000040
lbl_800B2AA4:
    or      a0, s2, $zero              # a0 = 00000040
    subu    a1, s4, s0
    addiu   a1, a1, 0x03C0             # a1 = 000003C0
    addiu   s2, s2, 0x0008             # s2 = 00000048
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800B12F8
    or      a3, s3, $zero              # a3 = 000000F0
    or      a0, s2, $zero              # a0 = 00000048
    addiu   s2, s2, 0x0008             # s2 = 00000050
    sra     a1, s4,  4
    or      a2, s5, $zero              # a2 = 00000000
    addiu   a3, $zero, 0x0760          # a3 = 00000760
    jal     func_800B1194
    sw      s1, 0x0010($sp)
    or      a0, s2, $zero              # a0 = 00000050
    addiu   s2, s2, 0x0008             # s2 = 00000058
    or      a1, s1, $zero              # a1 = 0000000F
    addiu   a2, $zero, 0x03C0          # a2 = 000003C0
    jal     func_800B1224
    or      a3, s4, $zero              # a3 = 0000001F
    lw      s1, 0x0168($sp)
    b       lbl_800B2B04
    lw      s6, 0x0164($sp)
lbl_800B2B00:
    sb      t8, 0x001A(s1)             # 00000029
lbl_800B2B04:
    lbu     t9, 0x0003(s6)             # 00000003
    or      a0, s2, $zero              # a0 = 00000058
    or      a1, s6, $zero              # a1 = 00000000
    bne     t9, $zero, lbl_800B2B24
    or      a2, s1, $zero              # a2 = 0000000F
    lbu     t5, 0x0002(s1)             # 00000011
    beql    t5, $zero, lbl_800B2B30
    lbu     t4, 0x0004(s6)             # 00000004
lbl_800B2B24:
    b       lbl_800B2B50
    addiu   s0, $zero, 0x0001          # s0 = 00000001
    lbu     t4, 0x0004(s6)             # 00000004
lbl_800B2B30:
    bne     t4, $zero, lbl_800B2B48
    nop
    lbu     t7, 0x0003(s1)             # 00000012
    or      s0, $zero, $zero           # s0 = 00000000
    beq     t7, $zero, lbl_800B2B50
    nop
lbl_800B2B48:
    b       lbl_800B2B50
    addiu   s0, $zero, 0x0002          # s0 = 00000002
lbl_800B2B50:
    lw      t8, 0x0138($sp)
    addiu   t6, $zero, 0x03C0          # t6 = 000003C0
    sw      t6, 0x0010($sp)
    lw      a3, 0x0170($sp)
    sw      s0, 0x0014($sp)
    jal     func_800B2C8C
    sw      t8, 0x0018($sp)
    lw      t9, 0x0164($sp)
    lw      t7, 0x0138($sp)
    or      s2, v0, $zero              # s2 = 00000000
    lhu     t5, 0x0000(t9)             # 00000000
    or      a0, s2, $zero              # a0 = 00000000
    or      a3, s4, $zero              # a3 = 0000001F
    andi    t4, t5, 0x0001             # t4 = 00000000
    beq     t4, $zero, lbl_800B2BB8
    andi    t6, t7, 0x0001             # t6 = 00000000
    bnel    t6, $zero, lbl_800B2BA0
    lw      t8, 0x0138($sp)
    sw      $zero, 0x0138($sp)
    lw      t8, 0x0138($sp)
lbl_800B2BA0:
    lw      a1, 0x0164($sp)
    lw      a2, 0x0168($sp)
    sw      s0, 0x0014($sp)
    jal     func_800B3124
    sw      t8, 0x0010($sp)
    or      s2, v0, $zero              # s2 = 00000000
lbl_800B2BB8:
    or      v0, s2, $zero              # v0 = 00000000
lbl_800B2BBC:
    lw      $ra, 0x004C($sp)
    lw      s0, 0x0028($sp)
    lw      s1, 0x002C($sp)
    lw      s2, 0x0030($sp)
    lw      s3, 0x0034($sp)
    lw      s4, 0x0038($sp)
    lw      s5, 0x003C($sp)
    lw      s6, 0x0040($sp)
    lw      s7, 0x0044($sp)
    lw      s8, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0160           # $sp += 0x160


func_800B2BEC:
# MqDbg: AudioSynth_FinalResample
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a3, 0x002C($sp)
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    bne     a3, $zero, lbl_800B2C1C
    sw      $ra, 0x001C($sp)
    addiu   a1, $zero, 0x03C0          # a1 = 000003C0
    jal     func_800B115C
    addiu   s0, s0, 0x0008             # s0 = 00000008
    b       lbl_800B2C7C
    lw      $ra, 0x001C($sp)
lbl_800B2C1C:
    lhu     t7, 0x0032($sp)
    lui     $at, 0x0800                # $at = 08000000
    or      v0, s0, $zero              # v0 = 00000008
    or      t8, t7, $at                # t8 = 08000000
    lui     $at, 0x03C0                # $at = 03C00000
    andi    t9, a2, 0xFFFF             # t9 = 00000000
    or      t0, t9, $at                # t0 = 03C00000
    sw      t0, 0x0004(v0)             # 0000000C
    sw      t8, 0x0000(v0)             # 00000008
    lw      t1, 0x0034($sp)
    lui     $at, 0x0500                # $at = 05000000
    addiu   s0, s0, 0x0008             # s0 = 00000010
    andi    t2, t1, 0x00FF             # t2 = 00000000
    sll     t3, t2, 16
    or      t4, t3, $at                # t4 = 05000000
    andi    t5, a3, 0xFFFF             # t5 = 00000000
    or      t6, t4, t5                 # t6 = 05000000
    or      v1, s0, $zero              # v1 = 00000010
    sw      t6, 0x0000(v1)             # 00000010
    lw      t7, 0x000C(a1)             # 0000000C
    addiu   s0, s0, 0x0008             # s0 = 00000018
    addiu   t8, t7, 0x0020             # t8 = 00000020
    sw      t8, 0x0004(v1)             # 00000014
    lw      $ra, 0x001C($sp)
lbl_800B2C7C:
    or      v0, s0, $zero              # v0 = 00000018
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800B2C8C:
# MqDbg: AudioSynth_ProcessEnvelope
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0020($sp)
    sw      s0, 0x001C($sp)
    sw      a3, 0x0074($sp)
    lhu     v0, 0x0008(a1)             # 00000008
    lhu     v1, 0x000A(a1)             # 0000000A
    lhu     t5, 0x0010(a2)             # 00000010
    sll     v0, v0,  4
    andi    t0, v0, 0xFFFF             # t0 = 00000000
    sll     v1, v1,  4
    or      s0, a0, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    lbu     t2, 0x0005(a1)             # 00000005
    lhu     $ra, 0x0012(a2)            # 00000012
    andi    v1, v1, 0xFFFF             # v1 = 00000000
    beq     t5, t0, lbl_800B2D18
    or      t1, t5, $zero              # t1 = 00000000
    sra     v0, a3,  3
    subu    t6, t0, t1
    div     $zero, t6, v0
    mflo    a3
    sll     a3, a3, 16
    bne     v0, $zero, lbl_800B2CF4
    nop
    break   # 0x01C00
lbl_800B2CF4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B2D0C
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800B2D0C
    nop
    break   # 0x01800
lbl_800B2D0C:
    sra     a3, a3, 16
    b       lbl_800B2D28
    or      t3, $ra, $zero             # t3 = 00000000
lbl_800B2D18:
    lw      v0, 0x0074($sp)
    or      a3, $zero, $zero           # a3 = 00000000
    sra     v0, v0,  3
    or      t3, $ra, $zero             # t3 = 00000000
lbl_800B2D28:
    beq     $ra, v1, lbl_800B2D70
    or      a0, v1, $zero              # a0 = 00000000
    subu    t7, a0, t3
    div     $zero, t7, v0
    mflo    t0
    sll     t0, t0, 16
    bne     v0, $zero, lbl_800B2D4C
    nop
    break   # 0x01C00
lbl_800B2D4C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B2D64
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_800B2D64
    nop
    break   # 0x01800
lbl_800B2D64:
    sra     t0, t0, 16
    b       lbl_800B2D78
    lbu     t4, 0x0004(a2)             # 00000004
lbl_800B2D70:
    or      t0, $zero, $zero           # t0 = 00000000
    lbu     t4, 0x0004(a2)             # 00000004
lbl_800B2D78:
    sw      t1, 0x0030($sp)
    andi    t8, t2, 0x007F             # t8 = 00000000
    beq     t4, t2, lbl_800B2DD0
    andi    t1, t4, 0x007F             # t1 = 00000000
    andi    t1, t4, 0x007F             # t1 = 00000000
    subu    t9, t8, t1
    sll     t6, t9,  9
    div     $zero, t6, v0
    mflo    t7
    sh      t7, 0x0052($sp)
    bne     v0, $zero, lbl_800B2DAC
    nop
    break   # 0x01C00
lbl_800B2DAC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B2DC4
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800B2DC4
    nop
    break   # 0x01800
lbl_800B2DC4:
    sb      t2, 0x0004(a2)             # 00000004
    b       lbl_800B2DD4
    nop
lbl_800B2DD0:
    sh      $zero, 0x0052($sp)
lbl_800B2DD4:
    multu   a3, v0
    lw      t8, 0x0030($sp)
    or      a0, s0, $zero              # a0 = 00000000
    lui     $at, 0x1200                # $at = 12000000
    lui     a1, 0x8010                 # a1 = 80100000
    mflo    t9
    addu    t6, t8, t9
    sh      t6, 0x0010(a2)             # 00000010
    multu   t0, v0
    or      v0, s0, $zero              # v0 = 00000000
    mflo    t7
    addu    t8, t3, t7
    sh      t8, 0x0012(a2)             # 00000012
    lhu     t9, 0x0000(s1)             # 00000000
    sll     t7, t1,  1
    andi    t8, t7, 0x00FF             # t8 = 00000000
    andi    t6, t9, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800B2EB8
    sll     t9, t8, 16
    addiu   a1, $zero, 0x05C0          # a1 = 000005C0
    addiu   a2, $zero, 0x01A0          # a2 = 000001A0
    addiu   s0, s0, 0x0008             # s0 = 00000008
    sh      a3, 0x0056($sp)
    sh      t0, 0x0054($sp)
    sw      t1, 0x0034($sp)
    sw      t3, 0x0028($sp)
    jal     func_800B115C
    sh      t4, 0x0050($sp)
    lh      t0, 0x0054($sp)
    lw      t1, 0x0034($sp)
    or      a0, s0, $zero              # a0 = 00000008
    lh      a3, 0x0056($sp)
    addiu   s0, s0, 0x0008             # s0 = 00000010
    lh      a2, 0x0052($sp)
    sw      t0, 0x0010($sp)
    jal     func_800B1294
    sll     a1, t1,  1
    or      a0, s0, $zero              # a0 = 00000010
    addiu   s0, s0, 0x0008             # s0 = 00000018
    lw      a1, 0x0030($sp)
    jal     func_800B1320
    lw      a2, 0x0028($sp)
    lw      v0, 0x007C($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lh      t4, 0x0050($sp)
    beq     v0, $at, lbl_800B2EA8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800B2EB0
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    b       lbl_800B2F04
    lw      a1, 0x17BC(a1)             # 801017BC
lbl_800B2EA8:
    b       lbl_800B2F04
    lw      a1, 0x17B4(a1)             # 801017B4
lbl_800B2EB0:
    b       lbl_800B2F04
    lw      a1, 0x17B8(a1)             # 801017B8
lbl_800B2EB8:
    lh      t7, 0x0052($sp)
    or      t6, t9, $at                # t6 = 00000002
    addiu   s0, s0, 0x0008             # s0 = 00000020
    andi    t8, t7, 0xFFFF             # t8 = 00000000
    or      t9, t6, t8                 # t9 = 00000002
    sw      t9, 0x0000(v0)             # 00000000
    andi    t8, t0, 0xFFFF             # t8 = 00000000
    sll     t6, a3, 16
    or      t9, t6, t8                 # t9 = 00000002
    sw      t9, 0x0004(v0)             # 00000004
    lui     t7, 0x1600                 # t7 = 16000000
    or      v1, s0, $zero              # v1 = 00000020
    sw      t7, 0x0000(v1)             # 00000020
    andi    t9, $ra, 0xFFFF            # t9 = 00000000
    sll     t8, t5, 16
    or      t7, t8, t9                 # t7 = 00000000
    sw      t7, 0x0004(v1)             # 00000024
    addiu   s0, s0, 0x0008             # s0 = 00000028
    lw      a1, 0x17BC(a1)             # 801017BC
lbl_800B2F04:
    lhu     t6, 0x007A($sp)
    lw      v1, 0x0000(s1)             # 00000000
    or      a0, s0, $zero              # a0 = 00000028
    sra     t8, t6,  4
    andi    t9, t8, 0x00FF             # t9 = 00000000
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x17B0(t6)             # 801017B0
    sll     t7, t9, 16
    lw      t9, 0x0074($sp)
    or      t8, t7, t6                 # t8 = 80100000
    addiu   v0, s0, 0x0008             # v0 = 00000030
    andi    t7, t9, 0x00FF             # t7 = 00000000
    sll     t6, t7,  8
    or      t9, t8, t6                 # t9 = 80100000
    andi    t7, t4, 0x0080             # t7 = 00000000
    sra     t8, t7,  7
    andi    t6, t8, 0x0001             # t6 = 00000000
    sll     t7, t6,  4
    or      t8, t9, t7                 # t8 = 80100000
    sll     t6, v1,  6
    srl     t9, t6, 31
    andi    t7, t9, 0x0001             # t7 = 00000000
    sll     t6, t7,  3
    or      t9, t8, t6                 # t9 = 80100000
    lbu     t8, 0x0000(s1)             # 00000000
    sw      a1, 0x0004(a0)             # 0000002C
    andi    t6, t8, 0x0001             # t6 = 00000000
    sll     t7, t6,  2
    or      t8, t9, t7                 # t8 = 80100000
    sll     t6, v1,  4
    srl     t9, t6, 31
    andi    t7, t9, 0x0001             # t7 = 00000000
    sll     t6, t7,  1
    or      t9, t8, t6                 # t9 = 80100000
    sll     t7, v1,  5
    srl     t8, t7, 31
    andi    t6, t8, 0x0001             # t6 = 00000000
    or      t7, t9, t6                 # t7 = 80100000
    sw      t7, 0x0000(a0)             # 00000028
    lw      $ra, 0x0024($sp)
    lw      s1, 0x0020($sp)
    lw      s0, 0x001C($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068           # $sp += 0x68


func_800B2FB4:
# MqDbg: AudioSynth_LoadWaveSamples
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a3, 0x002C($sp)
    lw      t6, 0x0000(a1)             # 00000000
    or      s0, a0, $zero              # s0 = 00000000
    lbu     t0, 0x0006(a1)             # 00000006
    sll     t7, t6, 11
    srl     t8, t7, 30
    beq     t8, $zero, lbl_800B302C
    lw      v1, 0x0008(a2)             # 00000008
    sll     a2, a3,  1
    addiu   a2, a2, 0x000F             # a2 = 0000000F
    lui     a3, 0x8010                 # a3 = 80100000
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     a2, a2, $at
    addiu   s0, s0, 0x0008             # s0 = 00000008
    lw      a3, 0x03C0(a3)             # 801003C0
    jal     func_800B12D0
    addiu   a1, $zero, 0x0580          # a1 = 00000580
    lui     v1, 0x8010                 # v1 = 80100000
    lw      t1, 0x002C($sp)
    addiu   v1, v1, 0x03A0             # v1 = 801003A0
    lw      t9, 0x0020(v1)             # 801003C0
    sll     t2, t1,  2
    or      v0, s0, $zero              # v0 = 00000008
    addu    t3, t9, t2
    b       lbl_800B3110
    sw      t3, 0x0020(v1)             # 801003C0
lbl_800B302C:
    lui     t4, 0x1408                 # t4 = 14080000
    ori     t4, t4, 0x0580             # t4 = 14080580
    or      v0, s0, $zero              # v0 = 00000008
    sw      t4, 0x0000(v0)             # 00000008
    lw      t5, 0x0010(a1)             # 00000010
    addiu   s0, s0, 0x0008             # s0 = 00000010
    beq     t0, $zero, lbl_800B30A8
    sw      t5, 0x0004(v0)             # 0000000C
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x17D0             # v0 = 801017D0
    sra     t6, t0,  2
    addu    t7, v0, t6
    lbu     t8, 0x0000(t7)             # 00000000
    andi    t9, t0, 0x0003             # t9 = 00000000
    addu    t2, v0, t9
    multu   v1, t8
    lbu     t3, 0x0000(t2)             # 00000000
    mflo    t1
    nop
    nop
    div     $zero, t1, t3
    mflo    v1
    bne     t3, $zero, lbl_800B3090
    nop
    break   # 0x01C00
lbl_800B3090:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t3, $at, lbl_800B30A8
    lui     $at, 0x8000                # $at = 80000000
    bne     t1, $at, lbl_800B30A8
    nop
    break   # 0x01800
lbl_800B30A8:
    lw      t5, 0x002C($sp)
    andi    v1, v1, 0x003F             # v1 = 00000020
    addiu   t4, $zero, 0x0040          # t4 = 00000040
    subu    v0, t4, v1
    slt     $at, v0, t5
    beq     $at, $zero, lbl_800B3108
    subu    a0, t5, v0
    addiu   a0, a0, 0x003F             # a0 = 0000003F
    bgez    a0, lbl_800B30D4
    addu    $at, a0, $zero
    addiu   $at, a0, 0x003F            # $at = 0000007E
lbl_800B30D4:
    sra     a0, $at,  6
    beq     a0, $zero, lbl_800B3108
    or      v0, s0, $zero              # v0 = 00000010
    andi    t6, a0, 0x00FF             # t6 = 0000003F
    sll     t7, t6, 16
    lui     $at, 0x0900                # $at = 09000000
    or      t8, t7, $at                # t8 = 09000000
    lui     t2, 0x0600                 # t2 = 06000000
    ori     t2, t2, 0x0080             # t2 = 06000080
    ori     t9, t8, 0x0580             # t9 = 09000580
    sw      t9, 0x0000(v0)             # 00000010
    sw      t2, 0x0004(v0)             # 00000014
    addiu   s0, s0, 0x0008             # s0 = 00000018
lbl_800B3108:
    sw      v1, 0x0008(a2)             # 00000008
    or      v0, s0, $zero              # v0 = 00000018
lbl_800B3110:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B3124:
# MqDbg: AudioSynth_ApplyHaasEffect
    lw      t6, 0x0014($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t6, t1, lbl_800B3148
    addiu   t0, $zero, 0x0940          # t0 = 00000940
    beq     t6, $at, lbl_800B315C
    addiu   t0, $zero, 0x0AE0          # t0 = 00000AE0
    jr      $ra
    or      v0, a0, $zero              # v0 = 00000000
lbl_800B3148:
    lbu     v1, 0x0003(a1)             # 00000003
    lbu     v0, 0x0002(a2)             # 00000002
    sb      $zero, 0x0003(a2)          # 00000003
    b       lbl_800B3178
    sb      v1, 0x0002(a2)             # 00000002
lbl_800B315C:
    lbu     v1, 0x0004(a1)             # 00000004
    lbu     v0, 0x0003(a2)             # 00000003
    sb      $zero, 0x0002(a2)          # 00000002
    b       lbl_800B3178
    sb      v1, 0x0003(a2)             # 00000003
    jr      $ra
    or      v0, a0, $zero              # v0 = 00000000
lbl_800B3178:
    lw      t7, 0x0010($sp)
    lui     t8, 0x0200                 # t8 = 02000000
    lui     $at, 0x03C0                # $at = 03C00000
    beq     t7, t1, lbl_800B32FC
    ori     t8, t8, 0x05C0             # t8 = 020005C0
    or      t1, v0, $zero              # t1 = 00000000
    beq     v0, v1, lbl_800B3240
    or      a1, v1, $zero              # a1 = 00000000
    addu    v0, a3, a1
    subu    t2, v0, t1
    andi    t9, t2, 0xFFFF             # t9 = 00000000
    lui     $at, 0x03C0                # $at = 03C00000
    or      t5, t9, $at                # t5 = 03C00000
    lui     t8, 0x0800                 # t8 = 08000000
    sll     t6, a3, 15
    ori     t8, t8, 0x05C0             # t8 = 080005C0
    or      t3, a0, $zero              # t3 = 00000000
    sw      t8, 0x0000(t3)             # 00000000
    sw      t5, 0x0004(t3)             # 00000004
    addiu   t9, t2, 0xFFFE             # t9 = FFFFFFFE
    addiu   a0, a0, 0x0008             # a0 = 00000008
    or      t4, a0, $zero              # t4 = 00000008
    sw      $zero, 0x0004(t4)          # 0000000C
    addiu   a0, a0, 0x0008             # a0 = 00000010
    bgez    t6, lbl_800B31E8
    sra     t7, t6,  1
    addiu   $at, t6, 0x0001            # $at = 00000001
    sra     t7, $at,  1
lbl_800B31E8:
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    bgez    t9, lbl_800B31FC
    sra     t5, t9,  1
    addiu   $at, t9, 0x0001            # $at = FFFFFFFF
    sra     t5, $at,  1
lbl_800B31FC:
    div     $zero, t8, t5
    bne     t5, $zero, lbl_800B320C
    nop
    break   # 0x01C00
lbl_800B320C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t5, $at, lbl_800B3224
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800B3224
    nop
    break   # 0x01800
lbl_800B3224:
    mflo    t6
    andi    t7, t6, 0xFFFF             # t7 = 00000000
    andi    t9, t7, 0xFFFF             # t9 = 00000000
    lui     $at, 0x0600                # $at = 06000000
    or      t8, t9, $at                # t8 = 06000000
    b       lbl_800B3268
    sw      t8, 0x0000(t4)             # 00000008
lbl_800B3240:
    or      t2, a0, $zero              # t2 = 00000010
    lui     t5, 0x0A00                 # t5 = 0A000000
    andi    t6, a3, 0xFFFF             # t6 = 00000000
    lui     $at, 0x03C0                # $at = 03C00000
    or      t7, t6, $at                # t7 = 03C00000
    ori     t5, t5, 0x05C0             # t5 = 0A0005C0
    sw      t5, 0x0000(t2)             # 00000010
    sw      t7, 0x0004(t2)             # 00000014
    addiu   a0, a0, 0x0008             # a0 = 00000018
    addu    v0, a3, a1
lbl_800B3268:
    beq     t1, $zero, lbl_800B32D8
    lui     t8, 0x0A00                 # t8 = 0A000000
    addiu   t9, t1, 0x000F             # t9 = 0000000F
    andi    t8, t9, 0xFFF0             # t8 = 00000000
    sra     t5, t8,  4
    andi    t6, t5, 0x00FF             # t6 = 000000C0
    sll     t7, t6, 16
    lui     $at, 0x1400                # $at = 14000000
    or      t9, t7, $at                # t9 = 17C00000
    ori     t8, t9, 0x05C0             # t8 = 17C005C0
    or      t2, a0, $zero              # t2 = 00000018
    sw      t8, 0x0000(t2)             # 00000018
    lw      t5, 0x000C(a2)             # 0000000C
    addiu   a0, a0, 0x0008             # a0 = 00000020
    lui     t7, 0x0A00                 # t7 = 0A000000
    addiu   t6, t5, 0x00A0             # t6 = 0A000660
    sw      t6, 0x0004(t2)             # 0000001C
    ori     t7, t7, 0x03C0             # t7 = 0A0003C0
    or      t3, a0, $zero              # t3 = 00000020
    sw      t7, 0x0000(t3)             # 00000020
    subu    t6, v0, t1
    addiu   t8, t1, 0x05C0             # t8 = 000005C0
    sll     t5, t8, 16
    andi    t7, t6, 0xFFFF             # t7 = 00000660
    or      t9, t5, t7                 # t9 = 0A0007E0
    sw      t9, 0x0004(t3)             # 00000024
    b       lbl_800B3354
    addiu   a0, a0, 0x0008             # a0 = 00000028
lbl_800B32D8:
    or      t1, a0, $zero              # t1 = 00000028
    andi    t6, v0, 0xFFFF             # t6 = 00000000
    lui     $at, 0x05C0                # $at = 05C00000
    or      t5, t6, $at                # t5 = 05C00000
    ori     t8, t8, 0x03C0             # t8 = 000007C0
    sw      t8, 0x0000(t1)             # 00000028
    sw      t5, 0x0004(t1)             # 0000002C
    b       lbl_800B3354
    addiu   a0, a0, 0x0008             # a0 = 00000030
lbl_800B32FC:
    or      t1, a0, $zero              # t1 = 00000030
    lui     t7, 0x0A00                 # t7 = 0A000000
    andi    v0, a3, 0xFFFF             # v0 = 00000000
    or      t9, v0, $at                # t9 = 05C00000
    ori     t7, t7, 0x05C0             # t7 = 0A0005C0
    addiu   a0, a0, 0x0008             # a0 = 00000038
    sw      t7, 0x0000(t1)             # 00000030
    sw      t9, 0x0004(t1)             # 00000034
    or      t2, a0, $zero              # t2 = 00000038
    addiu   a0, a0, 0x0008             # a0 = 00000040
    sw      t8, 0x0000(t2)             # 00000038
    or      t3, a0, $zero              # t3 = 00000040
    addiu   t7, v1, 0x05C0             # t7 = 000005C0
    sw      v1, 0x0004(t2)             # 0000003C
    sll     t9, t7, 16
    lui     t6, 0x0A00                 # t6 = 0A000000
    ori     t6, t6, 0x03C0             # t6 = 0A0003C0
    or      t8, t9, v0                 # t8 = 05C00000
    sw      t8, 0x0004(t3)             # 00000044
    sw      t6, 0x0000(t3)             # 00000040
    addiu   a0, a0, 0x0008             # a0 = 00000048
    or      a1, v1, $zero              # a1 = 00000000
lbl_800B3354:
    beq     v1, $zero, lbl_800B3398
    or      v0, a0, $zero              # v0 = 00000048
    addiu   t6, a1, 0x000F             # t6 = 0000000F
    andi    t5, t6, 0xFFF0             # t5 = 00000000
    sra     t7, t5,  4
    andi    t9, t7, 0x00FF             # t9 = 000000C0
    sll     t8, t9, 16
    addiu   t5, a3, 0x05C0             # t5 = 000005C0
    lui     $at, 0x1500                # $at = 15000000
    or      t6, t8, $at                # t6 = 15C00000
    andi    t7, t5, 0xFFFF             # t7 = 000005C0
    or      t9, t6, t7                 # t9 = 15C005C0
    sw      t9, 0x0000(v0)             # 00000048
    lw      t8, 0x000C(a2)             # 0000000C
    addiu   a0, a0, 0x0008             # a0 = 00000050
    addiu   t5, t8, 0x00A0             # t5 = 05C000A0
    sw      t5, 0x0004(v0)             # 0000004C
lbl_800B3398:
    addiu   t6, a3, 0x003F             # t6 = 0000003F
    andi    t7, t6, 0xFFC0             # t7 = 00000000
    sra     t9, t7,  4
    andi    t8, t9, 0x00FF             # t8 = 000000C0
    sll     t5, t8, 16
    lui     $at, 0x0400                # $at = 04000000
    or      t6, t5, $at                # t6 = 05C000A0
    lui     $at, 0x05C0                # $at = 05C00000
    andi    t9, t0, 0xFFFF             # t9 = 00000AE0
    or      t8, t9, $at                # t8 = 05C00AE0
    ori     t7, t6, 0x7FFF             # t7 = 05C07FFF
    sw      t7, 0x0000(a0)             # 00000050
    sw      t8, 0x0004(a0)             # 00000054
    addiu   v0, a0, 0x0008             # v0 = 00000058
    jr      $ra
    nop
    nop
    nop
