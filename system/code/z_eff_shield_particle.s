# Particle Effects: shield particles
#
# Starts at VRAM: 800173B0 / VROM: A8D310
#


.section .text
func_800173B0:
# MqDbg: EffectShieldParticle_Init
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      s3, 0x003C($sp)
    sw      s1, 0x0034($sp)
    or      s1, a0, $zero              # s1 = 00000000
    or      s3, a1, $zero              # s3 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s4, 0x0040($sp)
    sw      s2, 0x0038($sp)
    sw      s0, 0x0030($sp)
    sdc1    $f24, 0x0028($sp)
    sdc1    $f22, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    beq     s1, $zero, lbl_800175BC
    or      s2, s1, $zero              # s2 = 00000000
    beql    s3, $zero, lbl_800175C0
    lw      $ra, 0x0044($sp)
    lbu     t6, 0x0000(s3)             # 00000000
    andi    t7, t6, 0x00FF             # t7 = 00000000
    slti    $at, t7, 0x0011
    beq     $at, $zero, lbl_800175BC
    sb      t6, 0x0180(s1)             # 00000180
    lwl     t9, 0x0002(s3)             # 00000002
    lwr     t9, 0x0005(s3)             # 00000005
    addiu   s4, $zero, 0x0018          # s4 = 00000018
    or      s0, s1, $zero              # s0 = 00000000
    swl     t9, 0x0182(s1)             # 00000182
    swr     t9, 0x0185(s1)             # 00000185
    lhu     t9, 0x0006(s3)             # 00000006
    sh      t9, 0x0186(s1)             # 00000186
    lwl     t1, 0x0008(s3)             # 00000008
    lwr     t1, 0x000B(s3)             # 0000000B
    swl     t1, 0x0188(s1)             # 00000188
    swr     t1, 0x018B(s1)             # 0000018B
    lwl     t3, 0x000C(s3)             # 0000000C
    lwr     t3, 0x000F(s3)             # 0000000F
    swl     t3, 0x018C(s1)             # 0000018C
    swr     t3, 0x018F(s1)             # 0000018F
    lwl     t5, 0x0010(s3)             # 00000010
    lwr     t5, 0x0013(s3)             # 00000013
    andi    t3, t6, 0x00FF             # t3 = 00000000
    multu   t3, s4
    swl     t5, 0x0190(s1)             # 00000190
    swr     t5, 0x0193(s1)             # 00000193
    lwl     t7, 0x0014(s3)             # 00000014
    lwr     t7, 0x0017(s3)             # 00000017
    swl     t7, 0x0194(s1)             # 00000194
    swr     t7, 0x0197(s1)             # 00000197
    lwl     t9, 0x0018(s3)             # 00000018
    lwr     t9, 0x001B(s3)             # 0000001B
    mflo    t4
    addu    t5, s1, t4
    swl     t9, 0x0198(s1)             # 00000198
    swr     t9, 0x019B(s1)             # 0000019B
    lwl     t1, 0x001C(s3)             # 0000001C
    lwr     t1, 0x001F(s3)             # 0000001F
    sltu    $at, s1, t5
    swl     t1, 0x019C(s1)             # 0000019C
    swr     t1, 0x019F(s1)             # 0000019F
    lwc1    $f4, 0x0020(s3)            # 00000020
    swc1    $f4, 0x01A0(s1)            # 000001A0
    lwc1    $f6, 0x0024(s3)            # 00000024
    swc1    $f6, 0x01A8(s1)            # 000001A8
    lwc1    $f8, 0x0028(s3)            # 00000028
    swc1    $f8, 0x01AC(s1)            # 000001AC
    lbu     t2, 0x002C(s3)             # 0000002C
    sb      $zero, 0x01B1(s1)          # 000001B1
    beq     $at, $zero, lbl_80017550
    sb      t2, 0x01B0(s1)             # 000001B0
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f24                  # $f24 = 0.50
    lui     $at, 0x8010                # $at = 80100000
    mtc1    $zero, $f20                # $f20 = 0.00
    lwc1    $f22, 0x6050($at)          # 80106050
lbl_800174D4:
    jal     func_800CDCCC              # Rand.Next() float
    nop
    lwc1    $f10, 0x01A8(s1)           # 000001A8
    swc1    $f20, 0x0008(s0)           # 00000008
    swc1    $f20, 0x000C(s0)           # 0000000C
    mul.s   $f2, $f10, $f24
    swc1    $f20, 0x0010(s0)           # 00000010
    mul.s   $f16, $f0, $f2
    add.s   $f18, $f16, $f2
    swc1    $f18, 0x0000(s0)           # 00000000
    lwc1    $f4, 0x0000(s0)            # 00000000
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f4, 0x0004(s0)            # 00000004
    mul.s   $f6, $f0, $f22
    trunc.w.s $f8, $f6
    mfc1    t7, $f8
    jal     func_800CDCCC              # Rand.Next() float
    sh      t7, 0x0014(s0)             # 00000014
    mul.s   $f10, $f0, $f22
    addiu   s0, s0, 0x0018             # s0 = 00000018
    trunc.w.s $f16, $f10
    mfc1    t9, $f16
    nop
    sh      t9, -0x0002(s0)            # 00000016
    lbu     t0, 0x0180(s2)             # 00000180
    multu   t0, s4
    mflo    t1
    addu    t2, s2, t1
    sltu    $at, s0, t2
    bne     $at, $zero, lbl_800174D4
    nop
lbl_80017550:
    lw      t3, 0x003C(s3)             # 0000003C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t3, $at, lbl_800175B8
    sw      t3, 0x01C4(s1)             # 000001C4
    sb      $zero, 0x01B2(s1)          # 000001B2
    lwl     t6, 0x002E(s3)             # 0000002E
    lwr     t6, 0x0031(s3)             # 00000031
    swl     t6, 0x01B4(s1)             # 000001B4
    swr     t6, 0x01B7(s1)             # 000001B7
    lwl     t5, 0x0032(s3)             # 00000032
    lwr     t5, 0x0035(s3)             # 00000035
    swl     t5, 0x01B8(s1)             # 000001B8
    swr     t5, 0x01BB(s1)             # 000001BB
    lwl     t6, 0x0036(s3)             # 00000036
    lwr     t6, 0x0039(s3)             # 00000039
    swl     t6, 0x01BC(s1)             # 000001BC
    jal     func_8001A880
    swr     t6, 0x01BF(s1)             # 000001BF
    jal     func_8001A880
    or      s0, v0, $zero              # s0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    addiu   a1, v0, 0x07A8             # a1 = 000007A8
    jal     func_800665B0
    addiu   a2, s1, 0x01B2             # a2 = 000001B2
    b       lbl_800175BC
    sw      v0, 0x01C0(s1)             # 000001C0
lbl_800175B8:
    sw      $zero, 0x01C0(s1)          # 000001C0
lbl_800175BC:
    lw      $ra, 0x0044($sp)
lbl_800175C0:
    ldc1    $f20, 0x0018($sp)
    ldc1    $f22, 0x0020($sp)
    ldc1    $f24, 0x0028($sp)
    lw      s0, 0x0030($sp)
    lw      s1, 0x0034($sp)
    lw      s2, 0x0038($sp)
    lw      s3, 0x003C($sp)
    lw      s4, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_800175E8:
# MqDbg: EffectShieldParticle_Destroy
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    or      a3, a0, $zero              # a3 = 00000000
    beql    a3, $zero, lbl_80017668
    lw      $ra, 0x0014($sp)
    lw      t6, 0x01C4(a3)             # 000001C4
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bnel    t6, $at, lbl_80017668
    lw      $ra, 0x0014($sp)
    jal     func_8001A880
    sw      a3, 0x0028($sp)
    lw      a3, 0x0028($sp)
    lw      t8, 0x07A8(v0)             # 000007A8
    lw      t7, 0x01C0(a3)             # 000001C0
    bne     t7, t8, lbl_80017640
    nop
    jal     func_8001A880
    sw      a3, 0x0028($sp)
    lw      a3, 0x0028($sp)
    lw      t9, 0x01C0(a3)             # 000001C0
    lw      t0, 0x0008(t9)             # 00000008
    sw      t0, 0x07A8(v0)             # 000007A8
lbl_80017640:
    jal     func_8001A880
    sw      a3, 0x0028($sp)
    jal     func_8001A880
    sw      v0, 0x001C($sp)
    lw      a3, 0x0028($sp)
    lw      a0, 0x001C($sp)
    addiu   a1, v0, 0x07A8             # a1 = 000007A8
    jal     func_80066610
    lw      a2, 0x01C0(a3)             # 000001C0
    lw      $ra, 0x0014($sp)
lbl_80017668:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_80017674:
# MqDbg: EffectShieldParticle_Update
    bne     a0, $zero, lbl_80017684
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_80017684:
    lbu     t6, 0x0180(a0)             # 00000180
    addiu   a1, $zero, 0x0018          # a1 = 00000018
    or      v1, a0, $zero              # v1 = 00000000
    multu   t6, a1
    mflo    t7
    addu    t8, a0, t7
    sltu    $at, a0, t8
    beql    $at, $zero, lbl_80017784
    lw      t2, 0x01C4(a0)             # 000001C4
    mtc1    $zero, $f2                 # $f2 = 0.00
    nop
    lwc1    $f4, 0x0004(v1)            # 00000004
lbl_800176B4:
    lwc1    $f6, 0x01A0(a0)            # 000001A0
    sub.s   $f8, $f4, $f6
    swc1    $f8, 0x0004(v1)            # 00000004
    lwc1    $f10, 0x0004(v1)           # 00000004
    c.lt.s  $f10, $f2
    nop
    bc1fl   lbl_800176DC
    lwc1    $f0, 0x000C(v1)            # 0000000C
    swc1    $f2, 0x0004(v1)            # 00000004
    lwc1    $f0, 0x000C(v1)            # 0000000C
lbl_800176DC:
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_80017718
    lwc1    $f4, 0x0008(v1)            # 00000008
    lwc1    $f16, 0x01A0(a0)           # 000001A0
    sub.s   $f18, $f0, $f16
    swc1    $f18, 0x000C(v1)           # 0000000C
    lwc1    $f0, 0x000C(v1)            # 0000000C
    c.lt.s  $f0, $f2
    nop
    bc1fl   lbl_80017718
    lwc1    $f4, 0x0008(v1)            # 00000008
    swc1    $f2, 0x000C(v1)            # 0000000C
    lwc1    $f0, 0x000C(v1)            # 0000000C
    lwc1    $f4, 0x0008(v1)            # 00000008
lbl_80017718:
    lwc1    $f6, 0x0004(v1)            # 00000004
    lwc1    $f10, 0x0010(v1)           # 00000010
    c.eq.s  $f2, $f0
    add.s   $f8, $f4, $f6
    add.s   $f16, $f10, $f0
    swc1    $f8, 0x0008(v1)            # 00000008
    bc1f    lbl_80017760
    swc1    $f16, 0x0010(v1)           # 00000010
    lwc1    $f4, 0x0008(v1)            # 00000008
    lwc1    $f6, 0x0010(v1)            # 00000010
    lwc1    $f18, 0x01AC(a0)           # 000001AC
    sub.s   $f8, $f4, $f6
    c.lt.s  $f18, $f8
    nop
    bc1fl   lbl_80017764
    lbu     t9, 0x0180(v0)             # 00000180
    lwc1    $f10, 0x0000(v1)           # 00000000
    swc1    $f10, 0x000C(v1)           # 0000000C
lbl_80017760:
    lbu     t9, 0x0180(v0)             # 00000180
lbl_80017764:
    addiu   v1, v1, 0x0018             # v1 = 00000018
    multu   t9, a1
    mflo    t0
    addu    t1, v0, t0
    sltu    $at, v1, t1
    bnel    $at, $zero, lbl_800176B4
    lwc1    $f4, 0x0004(v1)            # 0000001C
    lw      t2, 0x01C4(a0)             # 000001C4
lbl_80017784:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    or      v0, $zero, $zero           # v0 = 00000000
    bnel    t2, $at, lbl_800177B0
    lbu     t5, 0x01B1(a0)             # 000001B1
    lh      t3, 0x01BE(a0)             # 000001BE
    bgez    t3, lbl_800177A8
    sra     t4, t3,  1
    addiu   $at, t3, 0x0001            # $at = 00000001
    sra     t4, $at,  1
lbl_800177A8:
    sh      t4, 0x01BE(a0)             # 000001BE
    lbu     t5, 0x01B1(a0)             # 000001B1
lbl_800177B0:
    lbu     t7, 0x01B0(a0)             # 000001B0
    addiu   t6, t5, 0x0001             # t6 = 00000001
    andi    t8, t6, 0x00FF             # t8 = 00000001
    slt     $at, t7, t8
    beq     $at, $zero, lbl_800177D0
    sb      t6, 0x01B1(a0)             # 000001B1
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800177D0:
    jr      $ra
    nop


func_800177D8:
# MqDbg: EffectShieldParticle_GetColors
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    or      s0, a2, $zero              # s0 = 00000000
    lbu     t6, 0x01B0(a0)             # 000001B0
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t6, $f4                    # $f4 = 0.00
    bgez    t6, lbl_80017804
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_80017804:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f10                  # $f10 = 0.50
    nop
    mul.s   $f16, $f6, $f10
    trunc.w.s $f18, $f16
    mfc1    v0, $f18
    nop
    bnel    v0, $zero, lbl_80017870
    lbu     t1, 0x01B1(a0)             # 000001B1
    lbu     t8, 0x0188(a0)             # 00000188
    sb      t8, 0x0000(a1)             # 00000000
    lbu     t9, 0x0189(a0)             # 00000189
    sb      t9, 0x0001(a1)             # 00000001
    lbu     t2, 0x018A(a0)             # 0000018A
    sb      t2, 0x0002(a1)             # 00000002
    lbu     t3, 0x018B(a0)             # 0000018B
    sb      t3, 0x0003(a1)             # 00000003
    lbu     t4, 0x018C(a0)             # 0000018C
    sb      t4, 0x0000(s0)             # 00000000
    lbu     t5, 0x018D(a0)             # 0000018D
    sb      t5, 0x0001(s0)             # 00000001
    lbu     t6, 0x018E(a0)             # 0000018E
    sb      t6, 0x0002(s0)             # 00000002
    lbu     t7, 0x018F(a0)             # 0000018F
    b       lbl_800184EC
    sb      t7, 0x0003(s0)             # 00000003
    lbu     t1, 0x01B1(a0)             # 000001B1
lbl_80017870:
    slt     $at, t1, v0
    beq     $at, $zero, lbl_80017EC0
    or      v1, t1, $zero              # v1 = 00000000
    mtc1    t1, $f4                    # $f4 = 0.00
    mtc1    v0, $f10                   # $f10 = 0.00
    bgez    t1, lbl_8001789C
    cvt.s.w $f8, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f8, $f8, $f6
lbl_8001789C:
    cvt.s.w $f16, $f10
    lbu     v1, 0x0188(a0)             # 00000188
    mtc1    v1, $f18                   # $f18 = 0.00
    div.s   $f0, $f8, $f16
    bgez    v1, lbl_800178C4
    cvt.s.w $f4, $f18
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f4, $f4, $f6
lbl_800178C4:
    lbu     t8, 0x0190(a0)             # 00000190
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    subu    t9, t8, v1
    mtc1    t9, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f8, $f10
    mul.s   $f16, $f8, $f0
    add.s   $f18, $f4, $f16
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f6, $f18
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beq     t3, $zero, lbl_8001794C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f6                   # $f6 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f6, $f18, $f6
    ctc1    t3, $f31
    nop
    cvt.w.s $f6, $f6
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_80017944
    nop
    mfc1    t3, $f6
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001795C
    or      t3, t3, $at                # t3 = 80000000
lbl_80017944:
    b       lbl_8001795C
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
lbl_8001794C:
    mfc1    t3, $f6
    nop
    bltz    t3, lbl_80017944
    nop
lbl_8001795C:
    sb      t3, 0x0000(a1)             # 00000000
    lbu     a2, 0x0189(a0)             # 00000189
    ctc1    t2, $f31
    mtc1    a2, $f10                   # $f10 = 0.00
    bgez    a2, lbl_80017984
    cvt.s.w $f8, $f10
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f8, $f8, $f4
lbl_80017984:
    lbu     t4, 0x0191(a0)             # 00000191
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    subu    t5, t4, a2
    mtc1    t5, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    mul.s   $f6, $f18, $f0
    add.s   $f10, $f8, $f6
    cfc1    t6, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beq     t7, $zero, lbl_80017A0C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f4, $f10, $f4
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80017A04
    nop
    mfc1    t7, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017A1C
    or      t7, t7, $at                # t7 = 80000000
lbl_80017A04:
    b       lbl_80017A1C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_80017A0C:
    mfc1    t7, $f4
    nop
    bltz    t7, lbl_80017A04
    nop
lbl_80017A1C:
    sb      t7, 0x0001(a1)             # 00000001
    lbu     a3, 0x018A(a0)             # 0000018A
    ctc1    t6, $f31
    mtc1    a3, $f16                   # $f16 = 0.00
    bgez    a3, lbl_80017A44
    cvt.s.w $f18, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f18, $f18, $f8
lbl_80017A44:
    lbu     t8, 0x0192(a0)             # 00000192
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    subu    t9, t8, a3
    mtc1    t9, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f10, $f6
    mul.s   $f4, $f10, $f0
    add.s   $f16, $f18, $f4
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f8, $f16
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beq     t3, $zero, lbl_80017ACC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f8, $f16, $f8
    ctc1    t3, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_80017AC4
    nop
    mfc1    t3, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017ADC
    or      t3, t3, $at                # t3 = 80000000
lbl_80017AC4:
    b       lbl_80017ADC
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
lbl_80017ACC:
    mfc1    t3, $f8
    nop
    bltz    t3, lbl_80017AC4
    nop
lbl_80017ADC:
    sb      t3, 0x0002(a1)             # 00000002
    lbu     t0, 0x018B(a0)             # 0000018B
    ctc1    t2, $f31
    mtc1    t0, $f6                    # $f6 = 0.00
    bgez    t0, lbl_80017B04
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f10, $f10, $f18
lbl_80017B04:
    lbu     t4, 0x0193(a0)             # 00000193
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    subu    t5, t4, t0
    mtc1    t5, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f16, $f4
    mul.s   $f8, $f16, $f0
    add.s   $f6, $f10, $f8
    cfc1    t6, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f18, $f6
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beq     t7, $zero, lbl_80017B8C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f18, $f6, $f18
    ctc1    t7, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80017B84
    nop
    mfc1    t7, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017B9C
    or      t7, t7, $at                # t7 = 80000000
lbl_80017B84:
    b       lbl_80017B9C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_80017B8C:
    mfc1    t7, $f18
    nop
    bltz    t7, lbl_80017B84
    nop
lbl_80017B9C:
    sb      t7, 0x0003(a1)             # 00000003
    lbu     v0, 0x018C(a0)             # 0000018C
    ctc1    t6, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    v0, $f4                    # $f4 = 0.00
    bgez    v0, lbl_80017BC4
    cvt.s.w $f16, $f4
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f16, $f16, $f10
lbl_80017BC4:
    lbu     t8, 0x0194(a0)             # 00000194
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t9, t8, v0
    mtc1    t9, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f6, $f8
    mul.s   $f18, $f6, $f0
    add.s   $f4, $f16, $f18
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beql    t3, $zero, lbl_80017C54
    mfc1    t3, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_80017C48
    nop
    mfc1    t3, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017C60
    or      t3, t3, $at                # t3 = 80000000
lbl_80017C48:
    b       lbl_80017C60
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
    mfc1    t3, $f10
lbl_80017C54:
    nop
    bltz    t3, lbl_80017C48
    nop
lbl_80017C60:
    sb      t3, 0x0000(s0)             # 00000000
    lbu     v1, 0x018D(a0)             # 0000018D
    ctc1    t2, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    v1, $f8                    # $f8 = 0.00
    bgez    v1, lbl_80017C88
    cvt.s.w $f6, $f8
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f6, $f6, $f16
lbl_80017C88:
    lbu     t4, 0x0195(a0)             # 00000195
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t5, t4, v1
    mtc1    t5, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f4, $f18
    mul.s   $f10, $f4, $f0
    add.s   $f8, $f6, $f10
    cfc1    t6, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f16, $f8
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beql    t7, $zero, lbl_80017D18
    mfc1    t7, $f16
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f16, $f8, $f16
    ctc1    t7, $f31
    nop
    cvt.w.s $f16, $f16
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80017D0C
    nop
    mfc1    t7, $f16
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017D24
    or      t7, t7, $at                # t7 = 80000000
lbl_80017D0C:
    b       lbl_80017D24
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    mfc1    t7, $f16
lbl_80017D18:
    nop
    bltz    t7, lbl_80017D0C
    nop
lbl_80017D24:
    sb      t7, 0x0001(s0)             # 00000001
    lbu     a1, 0x018E(a0)             # 0000018E
    ctc1    t6, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    a1, $f18                   # $f18 = 0.00
    bgez    a1, lbl_80017D4C
    cvt.s.w $f4, $f18
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f4, $f4, $f6
lbl_80017D4C:
    lbu     t8, 0x0196(a0)             # 00000196
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t9, t8, a1
    mtc1    t9, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f8, $f10
    mul.s   $f16, $f8, $f0
    add.s   $f18, $f4, $f16
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f6, $f18
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beql    t3, $zero, lbl_80017DDC
    mfc1    t3, $f6
    mtc1    $at, $f6                   # $f6 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f6, $f18, $f6
    ctc1    t3, $f31
    nop
    cvt.w.s $f6, $f6
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_80017DD0
    nop
    mfc1    t3, $f6
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017DE8
    or      t3, t3, $at                # t3 = 80000000
lbl_80017DD0:
    b       lbl_80017DE8
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
    mfc1    t3, $f6
lbl_80017DDC:
    nop
    bltz    t3, lbl_80017DD0
    nop
lbl_80017DE8:
    sb      t3, 0x0002(s0)             # 00000002
    lbu     a2, 0x018F(a0)             # 0000018F
    ctc1    t2, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    a2, $f10                   # $f10 = 0.00
    bgez    a2, lbl_80017E10
    cvt.s.w $f8, $f10
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f8, $f8, $f4
lbl_80017E10:
    lbu     t4, 0x0197(a0)             # 00000197
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t5, t4, a2
    mtc1    t5, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    mul.s   $f6, $f18, $f0
    add.s   $f10, $f8, $f6
    cfc1    t6, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beql    t7, $zero, lbl_80017EA0
    mfc1    t7, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f4, $f10, $f4
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80017E94
    nop
    mfc1    t7, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017EAC
    or      t7, t7, $at                # t7 = 80000000
lbl_80017E94:
    b       lbl_80017EAC
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    mfc1    t7, $f4
lbl_80017EA0:
    nop
    bltz    t7, lbl_80017E94
    nop
lbl_80017EAC:
    ctc1    t6, $f31
    sb      t7, 0x0003(s0)             # 00000003
    nop
    b       lbl_800184F0
    lw      s0, 0x0004($sp)
lbl_80017EC0:
    subu    t8, v1, v0
    mtc1    t8, $f16                   # $f16 = 0.00
    mtc1    v0, $f8                    # $f8 = 0.00
    lbu     a2, 0x0190(a0)             # 00000190
    cvt.s.w $f18, $f16
    mtc1    a2, $f10                   # $f10 = 0.00
    cvt.s.w $f6, $f8
    cvt.s.w $f4, $f10
    bgez    a2, lbl_80017EF8
    div.s   $f0, $f18, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f4, $f4, $f16
lbl_80017EF8:
    lbu     t9, 0x0198(a0)             # 00000198
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    subu    t2, t9, a2
    mtc1    t2, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f18, $f8
    mul.s   $f6, $f18, $f0
    add.s   $f10, $f4, $f6
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f16, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beq     t4, $zero, lbl_80017F80
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f16, $f10, $f16
    ctc1    t4, $f31
    nop
    cvt.w.s $f16, $f16
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_80017F78
    nop
    mfc1    t4, $f16
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80017F90
    or      t4, t4, $at                # t4 = 80000000
lbl_80017F78:
    b       lbl_80017F90
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
lbl_80017F80:
    mfc1    t4, $f16
    nop
    bltz    t4, lbl_80017F78
    nop
lbl_80017F90:
    sb      t4, 0x0000(a1)             # 00000000
    lbu     a3, 0x0191(a0)             # 00000191
    ctc1    t3, $f31
    mtc1    a3, $f8                    # $f8 = 0.00
    bgez    a3, lbl_80017FB8
    cvt.s.w $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_80017FB8:
    lbu     t5, 0x0199(a0)             # 00000199
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    subu    t6, t5, a3
    mtc1    t6, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f10, $f6
    mul.s   $f16, $f10, $f0
    add.s   $f8, $f18, $f16
    cfc1    t7, $f31
    ctc1    t8, $f31
    nop
    cvt.w.s $f4, $f8
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    beq     t8, $zero, lbl_80018040
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sub.s   $f4, $f8, $f4
    ctc1    t8, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    bne     t8, $zero, lbl_80018038
    nop
    mfc1    t8, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80018050
    or      t8, t8, $at                # t8 = 80000000
lbl_80018038:
    b       lbl_80018050
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
lbl_80018040:
    mfc1    t8, $f4
    nop
    bltz    t8, lbl_80018038
    nop
lbl_80018050:
    sb      t8, 0x0001(a1)             # 00000001
    lbu     t0, 0x0192(a0)             # 00000192
    ctc1    t7, $f31
    mtc1    t0, $f6                    # $f6 = 0.00
    bgez    t0, lbl_80018078
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f10, $f10, $f18
lbl_80018078:
    lbu     t9, 0x019A(a0)             # 0000019A
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    subu    t2, t9, t0
    mtc1    t2, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f8, $f16
    mul.s   $f4, $f8, $f0
    add.s   $f6, $f10, $f4
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f18, $f6
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beq     t4, $zero, lbl_80018100
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f18, $f6, $f18
    ctc1    t4, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_800180F8
    nop
    mfc1    t4, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80018110
    or      t4, t4, $at                # t4 = 80000000
lbl_800180F8:
    b       lbl_80018110
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
lbl_80018100:
    mfc1    t4, $f18
    nop
    bltz    t4, lbl_800180F8
    nop
lbl_80018110:
    sb      t4, 0x0002(a1)             # 00000002
    lbu     t1, 0x0193(a0)             # 00000193
    ctc1    t3, $f31
    mtc1    t1, $f16                   # $f16 = 0.00
    bgez    t1, lbl_80018138
    cvt.s.w $f8, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f8, $f8, $f10
lbl_80018138:
    lbu     t5, 0x019B(a0)             # 0000019B
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    subu    t6, t5, t1
    mtc1    t6, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    mul.s   $f18, $f6, $f0
    add.s   $f16, $f8, $f18
    cfc1    t7, $f31
    ctc1    t8, $f31
    nop
    cvt.w.s $f10, $f16
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    beq     t8, $zero, lbl_800181C0
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sub.s   $f10, $f16, $f10
    ctc1    t8, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    bne     t8, $zero, lbl_800181B8
    nop
    mfc1    t8, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800181D0
    or      t8, t8, $at                # t8 = 80000000
lbl_800181B8:
    b       lbl_800181D0
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
lbl_800181C0:
    mfc1    t8, $f10
    nop
    bltz    t8, lbl_800181B8
    nop
lbl_800181D0:
    sb      t8, 0x0003(a1)             # 00000003
    lbu     v0, 0x0194(a0)             # 00000194
    ctc1    t7, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    v0, $f4                    # $f4 = 0.00
    bgez    v0, lbl_800181F8
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800181F8:
    lbu     t9, 0x019C(a0)             # 0000019C
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t2, t9, v0
    mtc1    t2, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f16, $f18
    mul.s   $f10, $f16, $f0
    add.s   $f4, $f6, $f10
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f8, $f4
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beql    t4, $zero, lbl_80018288
    mfc1    t4, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f8, $f4, $f8
    ctc1    t4, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_8001827C
    nop
    mfc1    t4, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80018294
    or      t4, t4, $at                # t4 = 80000000
lbl_8001827C:
    b       lbl_80018294
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
    mfc1    t4, $f8
lbl_80018288:
    nop
    bltz    t4, lbl_8001827C
    nop
lbl_80018294:
    sb      t4, 0x0000(s0)             # 00000000
    lbu     v1, 0x0195(a0)             # 00000195
    ctc1    t3, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    v1, $f18                   # $f18 = 0.00
    bgez    v1, lbl_800182BC
    cvt.s.w $f16, $f18
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f16, $f16, $f6
lbl_800182BC:
    lbu     t5, 0x019D(a0)             # 0000019D
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t6, t5, v1
    mtc1    t6, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f4, $f10
    mul.s   $f8, $f4, $f0
    add.s   $f18, $f16, $f8
    cfc1    t7, $f31
    ctc1    t8, $f31
    nop
    cvt.w.s $f6, $f18
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    beql    t8, $zero, lbl_8001834C
    mfc1    t8, $f6
    mtc1    $at, $f6                   # $f6 = 2147484000.00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sub.s   $f6, $f18, $f6
    ctc1    t8, $f31
    nop
    cvt.w.s $f6, $f6
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    bne     t8, $zero, lbl_80018340
    nop
    mfc1    t8, $f6
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80018358
    or      t8, t8, $at                # t8 = 80000000
lbl_80018340:
    b       lbl_80018358
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
    mfc1    t8, $f6
lbl_8001834C:
    nop
    bltz    t8, lbl_80018340
    nop
lbl_80018358:
    sb      t8, 0x0001(s0)             # 00000001
    lbu     a1, 0x0196(a0)             # 00000196
    ctc1    t7, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    a1, $f10                   # $f10 = 0.00
    bgez    a1, lbl_80018380
    cvt.s.w $f4, $f10
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f4, $f4, $f16
lbl_80018380:
    lbu     t9, 0x019E(a0)             # 0000019E
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t2, t9, a1
    mtc1    t2, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f18, $f8
    mul.s   $f6, $f18, $f0
    add.s   $f10, $f4, $f6
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f16, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beql    t4, $zero, lbl_80018410
    mfc1    t4, $f16
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f16, $f10, $f16
    ctc1    t4, $f31
    nop
    cvt.w.s $f16, $f16
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_80018404
    nop
    mfc1    t4, $f16
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001841C
    or      t4, t4, $at                # t4 = 80000000
lbl_80018404:
    b       lbl_8001841C
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
    mfc1    t4, $f16
lbl_80018410:
    nop
    bltz    t4, lbl_80018404
    nop
lbl_8001841C:
    sb      t4, 0x0002(s0)             # 00000002
    lbu     a2, 0x0197(a0)             # 00000197
    ctc1    t3, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    a2, $f8                    # $f8 = 0.00
    bgez    a2, lbl_80018444
    cvt.s.w $f18, $f8
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_80018444:
    lbu     t5, 0x019F(a0)             # 0000019F
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    subu    t6, t5, a2
    mtc1    t6, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f10, $f6
    mul.s   $f16, $f10, $f0
    add.s   $f8, $f18, $f16
    cfc1    t7, $f31
    ctc1    t8, $f31
    nop
    cvt.w.s $f4, $f8
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    beql    t8, $zero, lbl_800184D4
    mfc1    t8, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sub.s   $f4, $f8, $f4
    ctc1    t8, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t8, $f31
    nop
    andi    t8, t8, 0x0078             # t8 = 00000000
    bne     t8, $zero, lbl_800184C8
    nop
    mfc1    t8, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800184E0
    or      t8, t8, $at                # t8 = 80000000
lbl_800184C8:
    b       lbl_800184E0
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
    mfc1    t8, $f4
lbl_800184D4:
    nop
    bltz    t8, lbl_800184C8
    nop
lbl_800184E0:
    ctc1    t7, $f31
    sb      t8, 0x0003(s0)             # 00000003
    nop
lbl_800184EC:
    lw      s0, 0x0004($sp)
lbl_800184F0:
    jr      $ra
    addiu   $sp, $sp, 0x0008           # $sp += 0x8


func_800184F8:
# MqDbg: EffectShieldParticle_Draw
# gameplay_keep texture: Blank Circle
    addiu   $sp, $sp, 0xFE50           # $sp -= 0x1B0
    sw      s5, 0x005C($sp)
    sw      s1, 0x004C($sp)
    or      s1, a1, $zero              # s1 = 00000000
    or      s5, a0, $zero              # s5 = 00000000
    sw      $ra, 0x006C($sp)
    sw      s8, 0x0068($sp)
    sw      s7, 0x0064($sp)
    sw      s6, 0x0060($sp)
    sw      s4, 0x0058($sp)
    sw      s3, 0x0054($sp)
    sw      s2, 0x0050($sp)
    sw      s0, 0x0048($sp)
    sdc1    $f30, 0x0040($sp)
    sdc1    $f28, 0x0038($sp)
    sdc1    $f26, 0x0030($sp)
    sdc1    $f24, 0x0028($sp)
    sdc1    $f22, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    or      s6, s5, $zero              # s6 = 00000000
    beq     s5, $zero, lbl_800189D0
    addiu   a1, $zero, 0x0026          # a1 = 00000026
    jal     func_8007DFBC
    lw      a0, 0x02D0(s1)             # 000002D0
    lui     s0, 0xE700                 # s0 = E7000000
    addiu   t6, v0, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s1)             # 000002D0
    lui     t7, 0xE300                 # t7 = E3000000
    ori     t7, t7, 0x0A01             # t7 = E3000A01
    lui     t8, 0x0010                 # t8 = 00100000
    sw      t8, 0x0004(v0)             # 00000004
    sw      t7, 0x0000(v0)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t1, 0xD700                 # t1 = D7000000
    lui     t4, 0xFD90                 # t4 = FD900000
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s1)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      s0, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    ori     t1, t1, 0x0002             # t1 = D7000002
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
    addiu   t0, v1, 0x0008             # t0 = 00000008
    sw      t0, 0x02D0(s1)             # 000002D0
    sw      t2, 0x0004(v1)             # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t5, 0x0404                 # t5 = 04040000
    addiu   t5, t5, 0x9450             # t5 = 04039450
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(s1)             # 000002D0
    sw      t5, 0x0004(v1)             # 00000004
    sw      t4, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t8, 0x0701                 # t8 = 07010000
    ori     t8, t8, 0x4050             # t8 = 07014050
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s1)             # 000002D0
    lui     t7, 0xF590                 # t7 = F5900000
    sw      t7, 0x0000(v1)             # 00000000
    sw      t8, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t0, 0xE600                 # t0 = E6000000
    lui     t2, 0xF300                 # t2 = F3000000
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s1)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t0, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t3, 0x071F                 # t3 = 071F0000
    ori     t3, t3, 0xF200             # t3 = 071FF200
    addiu   t1, v1, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(s1)             # 000002D0
    sw      t3, 0x0004(v1)             # 00000004
    sw      t2, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t6, 0xF588                 # t6 = F5880000
    ori     t6, t6, 0x0800             # t6 = F5880800
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(s1)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      s0, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t7, 0x0001                 # t7 = 00010000
    ori     t7, t7, 0x4050             # t7 = 00014050
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s1)             # 000002D0
    sw      t7, 0x0004(v1)             # 00000004
    sw      t6, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t0, 0x0007                 # t0 = 00070000
    ori     t0, t0, 0xC07C             # t0 = 0007C07C
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s1)             # 000002D0
    lui     t9, 0xF200                 # t9 = F2000000
    sw      t9, 0x0000(v1)             # 00000000
    sw      t0, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t2, 0xFC30                 # t2 = FC300000
    lui     t3, 0x5FFE                 # t3 = 5FFE0000
    addiu   t1, v1, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(s1)             # 000002D0
    ori     t3, t3, 0xFE38             # t3 = 5FFEFE38
    ori     t2, t2, 0xB3FF             # t2 = FC30B3FF
    sw      t2, 0x0000(v1)             # 00000000
    sw      t3, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t5, 0xE200                 # t5 = E2000000
    lui     t6, 0x0C18                 # t6 = 0C180000
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(s1)             # 000002D0
    ori     t6, t6, 0x4B50             # t6 = 0C184B50
    ori     t5, t5, 0x001C             # t5 = E200001C
    sw      t5, 0x0000(v1)             # 00000000
    sw      t6, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t8, 0xD9F0                 # t8 = D9F00000
    ori     t8, t8, 0xF9FF             # t8 = D9F0F9FF
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s1)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t8, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t0, 0xD9FF                 # t0 = D9FF0000
    lui     t1, 0x0020                 # t1 = 00200000
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s1)             # 000002D0
    ori     t1, t1, 0x0005             # t1 = 00200005
    ori     t0, t0, 0xFFFF             # t0 = D9FFFFFF
    sw      t0, 0x0000(v1)             # 00000000
    sw      t1, 0x0004(v1)             # 00000004
    or      a0, s5, $zero              # a0 = 00000000
    addiu   a1, $sp, 0x01A4            # a1 = FFFFFFF4
    jal     func_800177D8
    addiu   a2, $sp, 0x01A0            # a2 = FFFFFFF0
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t3, 0xFA00                 # t3 = FA000000
    lui     s8, 0xDA38                 # s8 = DA380000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s1)             # 000002D0
    sw      t3, 0x0000(v1)             # 00000000
    lbu     t8, 0x01A5($sp)
    lbu     t5, 0x01A4($sp)
    lbu     t2, 0x01A6($sp)
    lbu     t7, 0x01A7($sp)
    sll     t9, t8, 16
    sll     t6, t5, 24
    or      t0, t6, t9                 # t0 = 00000000
    sll     t3, t2,  8
    or      t4, t0, t3                 # t4 = FA000000
    or      t8, t4, t7                 # t8 = FA000000
    sw      t8, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t9, 0xFB00                 # t9 = FB000000
    ori     s8, s8, 0x0003             # s8 = DA380003
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s1)             # 000002D0
    sw      t9, 0x0000(v1)             # 00000000
    lbu     t5, 0x01A1($sp)
    lbu     t2, 0x01A0($sp)
    lbu     t6, 0x01A2($sp)
    lbu     t3, 0x01A3($sp)
    sll     t4, t5, 16
    sll     t0, t2, 24
    or      t7, t0, t4                 # t7 = FA000000
    sll     t9, t6,  8
    or      t1, t7, t9                 # t1 = FB000000
    or      t5, t1, t3                 # t5 = FB000000
    sw      t5, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s1)             # 000002D0
    addiu   s7, $zero, 0x0018          # s7 = 00000018
    addiu   s4, $sp, 0x0090            # s4 = FFFFFEE0
    addiu   t0, v1, 0x0008             # t0 = 00000008
    sw      t0, 0x02D0(s1)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      s0, 0x0000(v1)             # 00000000
    lbu     t4, 0x0180(s5)             # 00000180
    or      s2, s5, $zero              # s2 = 00000000
    addiu   s3, $sp, 0x00D0            # s3 = FFFFFF20
    multu   t4, s7
    addiu   s0, $sp, 0x0110            # s0 = FFFFFF60
    mflo    t8
    addu    t6, s5, t8
    sltu    $at, s5, t6
    beq     $at, $zero, lbl_800189D0
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f30                  # $f30 = 0.50
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f26                  # $f26 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    mtc1    $zero, $f28                # $f28 = 0.00
    lwc1    $f20, 0x6054($at)          # 80106054
    lwc1    $f0, 0x0008(s2)            # 00000008
lbl_800187FC:
    lwc1    $f2, 0x0010(s2)            # 00000010
    lui     $at, 0x3C80                # $at = 3C800000
    mtc1    $at, $f16                  # $f16 = 0.02
    add.s   $f4, $f0, $f2
    sub.s   $f14, $f0, $f2
    mul.s   $f6, $f4, $f30
    nop
    mul.s   $f18, $f14, $f16
    trunc.w.s $f8, $f6
    div.s   $f4, $f18, $f20
    mfc1    t9, $f8
    nop
    sll     t2, t9, 16
    sra     t1, t2, 16
    mtc1    t1, $f10                   # $f10 = -664614000000000000000000000000000000.00
    nop
    cvt.s.w $f24, $f10
    trunc.w.s $f6, $f4
    mfc1    t5, $f6
    nop
    sll     t0, t5, 16
    sra     t4, t0, 16
    mtc1    t4, $f8                    # $f8 = -166153500000000000000000000000000000.00
    nop
    cvt.s.w $f22, $f8
    c.lt.s  $f22, $f26
    nop
    bc1f    lbl_80018874
    nop
    mov.s   $f22, $f26
lbl_80018874:
    lh      t8, 0x0182(s5)             # 00000182
    lh      t6, 0x0184(s5)             # 00000184
    lh      t7, 0x0186(s5)             # 00000186
    mtc1    t8, $f10                   # $f10 = -166153500000000000000000000000000000.00
    mtc1    t6, $f16                   # $f16 = 0.00
    mtc1    t7, $f18                   # $f18 = -166153500000000000000000000000000000.00
    cvt.s.w $f10, $f10
    or      a0, s3, $zero              # a0 = FFFFFF20
    cvt.s.w $f16, $f16
    mfc1    a1, $f10
    cvt.s.w $f18, $f18
    mfc1    a2, $f16
    mfc1    a3, $f18
    jal     func_8008F82C              # guTranslateF
    nop
    or      a0, s0, $zero              # a0 = FFFFFF60
    or      a1, $zero, $zero           # a1 = 00000000
    lh      a2, 0x0014(s2)             # 00000014
    jal     func_8008F50C
    or      a3, $zero, $zero           # a3 = 00000000
    or      a0, s3, $zero              # a0 = FFFFFF20
    or      a1, s0, $zero              # a1 = FFFFFF60
    jal     func_8008EDB8
    or      a2, s4, $zero              # a2 = FFFFFEE0
    or      a0, s0, $zero              # a0 = FFFFFF60
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_8008F50C
    lh      a3, 0x0016(s2)             # 00000016
    or      a0, s4, $zero              # a0 = FFFFFEE0
    or      a1, s0, $zero              # a1 = FFFFFF60
    jal     func_8008EDB8
    or      a2, s3, $zero              # a2 = FFFFFF20
    mfc1    a1, $f24
    mfc1    a2, $f28
    mfc1    a3, $f28
    jal     func_8008F82C              # guTranslateF
    or      a0, s0, $zero              # a0 = FFFFFF60
    or      a0, s3, $zero              # a0 = FFFFFF20
    or      a1, s0, $zero              # a1 = FFFFFF60
    jal     func_8008EDB8
    or      a2, s4, $zero              # a2 = FFFFFEE0
    mul.s   $f4, $f22, $f20
    mfc1    a2, $f20
    mfc1    a3, $f20
    or      a0, s0, $zero              # a0 = FFFFFF60
    mfc1    a1, $f4
    jal     func_8008F4A8              # guScaleF
    nop
    or      a0, s4, $zero              # a0 = FFFFFEE0
    or      a1, s0, $zero              # a1 = FFFFFF60
    jal     func_8008EDB8
    or      a2, s3, $zero              # a2 = FFFFFF20
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_8008FC98
    or      a1, s3, $zero              # a1 = FFFFFF20
    beq     v0, $zero, lbl_800189D0
    lui     t1, 0x0100                 # t1 = 01000000
    lw      v1, 0x02D0(s1)             # 000002D0
    ori     t1, t1, 0x4008             # t1 = 01004008
    lui     t0, 0x0600                 # t0 = 06000000
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s1)             # 000002D0
    sw      v0, 0x0004(v1)             # 00000004
    sw      s8, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    lui     t3, 0x800E                 # t3 = 800E0000
    addiu   t3, t3, 0x7AA0             # t3 = 800E7AA0
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s1)             # 000002D0
    sw      t3, 0x0004(v1)             # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s1)             # 000002D0
    ori     t0, t0, 0x0204             # t0 = 06000204
    addiu   t4, $zero, 0x0602          # t4 = 00000602
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s1)             # 000002D0
    sw      t4, 0x0004(v1)             # 00000004
    sw      t0, 0x0000(v1)             # 00000000
    lbu     t8, 0x0180(s6)             # 00000180
    addiu   s2, s2, 0x0018             # s2 = 00000018
    multu   t8, s7
    mflo    t6
    addu    t7, s6, t6
    sltu    $at, s2, t7
    bnel    $at, $zero, lbl_800187FC
    lwc1    $f0, 0x0008(s2)            # 00000020
lbl_800189D0:
    lw      $ra, 0x006C($sp)
    ldc1    $f20, 0x0018($sp)
    ldc1    $f22, 0x0020($sp)
    ldc1    $f24, 0x0028($sp)
    ldc1    $f26, 0x0030($sp)
    ldc1    $f28, 0x0038($sp)
    ldc1    $f30, 0x0040($sp)
    lw      s0, 0x0048($sp)
    lw      s1, 0x004C($sp)
    lw      s2, 0x0050($sp)
    lw      s3, 0x0054($sp)
    lw      s4, 0x0058($sp)
    lw      s5, 0x005C($sp)
    lw      s6, 0x0060($sp)
    lw      s7, 0x0064($sp)
    lw      s8, 0x0068($sp)
    jr      $ra
    addiu   $sp, $sp, 0x01B0           # $sp += 0x1B0
    nop
    nop
