# Particle Effects: blure
#
# Starts at VRAM: 80013F30 / VROM: ??????
#

.section .text
func_80013F30:
# MqDbg: EffectBlure_AddVertex
    addiu   $sp, $sp, 0xFE80           # $sp -= 0x180
    sw      s3, 0x0028($sp)
    sw      s2, 0x0024($sp)
    sw      s1, 0x0020($sp)
    or      s1, a0, $zero              # s1 = 00000000
    or      s2, a1, $zero              # s2 = 00000000
    or      s3, a2, $zero              # s3 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s0, 0x001C($sp)
    beql    s1, $zero, lbl_8001423C
    lw      $ra, 0x002C($sp)
    lbu     v0, 0x019E(s1)             # 0000019E
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    slti    $at, v0, 0x0010
    beq     $at, $zero, lbl_80014238
    sll     t6, v0,  2
    subu    t6, t6, v0
    sll     t6, t6,  3
    addu    s0, s1, t6
    sw      t7, 0x0000(s0)             # 00000000
    lhu     t8, 0x0188(s1)             # 00000188
    lui     $at, 0x3F00                # $at = 3F000000
    andi    t9, t8, 0x0002             # t9 = 00000000
    bnel    t9, $zero, lbl_80014010
    mtc1    $at, $f0                   # $f0 = 0.50
    lwc1    $f4, 0x0000(s2)            # 00000000
    trunc.w.s $f6, $f4
    mfc1    t1, $f6
    nop
    sh      t1, 0x0008(s0)             # 00000008
    lwc1    $f8, 0x0004(s2)            # 00000004
    trunc.w.s $f10, $f8
    mfc1    t3, $f10
    nop
    sh      t3, 0x000A(s0)             # 0000000A
    lwc1    $f16, 0x0008(s2)           # 00000008
    trunc.w.s $f18, $f16
    mfc1    t5, $f18
    nop
    sh      t5, 0x000C(s0)             # 0000000C
    lwc1    $f4, 0x0000(s3)            # 00000000
    trunc.w.s $f6, $f4
    mfc1    t7, $f6
    nop
    sh      t7, 0x000E(s0)             # 0000000E
    lwc1    $f8, 0x0004(s3)            # 00000004
    trunc.w.s $f10, $f8
    mfc1    t9, $f10
    nop
    sh      t9, 0x0010(s0)             # 00000010
    lwc1    $f16, 0x0008(s3)           # 00000008
    trunc.w.s $f18, $f16
    mfc1    t1, $f18
    b       lbl_80014224
    sh      t1, 0x0012(s0)             # 00000012
    mtc1    $at, $f0                   # $f0 = 0.50
lbl_80014010:
    nop
    lh      t2, -0x000A(s0)            # FFFFFFF6
    lh      t3, -0x0010(s0)            # FFFFFFF0
    addiu   a0, $sp, 0x0160            # a0 = FFFFFFE0
    mtc1    t2, $f4                    # $f4 = 0.00
    mtc1    t3, $f8                    # $f8 = 0.00
    addiu   a1, $sp, 0x016C            # a1 = FFFFFFEC
    cvt.s.w $f6, $f4
    addiu   a2, $sp, 0x0154            # a2 = FFFFFFD4
    cvt.s.w $f10, $f8
    add.s   $f16, $f6, $f10
    mul.s   $f18, $f16, $f0
    swc1    $f18, 0x016C($sp)
    lh      t5, -0x000E(s0)            # FFFFFFF2
    lh      t4, -0x0008(s0)            # FFFFFFF8
    mtc1    t5, $f6                    # $f6 = 0.00
    mtc1    t4, $f4                    # $f4 = 0.00
    cvt.s.w $f10, $f6
    cvt.s.w $f8, $f4
    add.s   $f16, $f8, $f10
    mul.s   $f18, $f16, $f0
    swc1    $f18, 0x0170($sp)
    lh      t7, -0x000C(s0)            # FFFFFFF4
    lh      t6, -0x0006(s0)            # FFFFFFFA
    mtc1    t7, $f8                    # $f8 = 0.00
    mtc1    t6, $f4                    # $f4 = 0.00
    cvt.s.w $f10, $f8
    cvt.s.w $f6, $f4
    add.s   $f16, $f6, $f10
    mul.s   $f18, $f16, $f0
    swc1    $f18, 0x0174($sp)
    lwc1    $f8, 0x0000(s3)            # 00000000
    lwc1    $f4, 0x0000(s2)            # 00000000
    add.s   $f6, $f4, $f8
    mul.s   $f10, $f6, $f0
    swc1    $f10, 0x0160($sp)
    lwc1    $f18, 0x0004(s3)           # 00000004
    lwc1    $f16, 0x0004(s2)           # 00000004
    add.s   $f4, $f16, $f18
    mul.s   $f8, $f4, $f0
    swc1    $f8, 0x0164($sp)
    lwc1    $f10, 0x0008(s3)           # 00000008
    lwc1    $f6, 0x0008(s2)            # 00000008
    add.s   $f16, $f6, $f10
    mul.s   $f18, $f16, $f0
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f18, 0x0168($sp)
    jal     func_800A5510
    addiu   a0, $sp, 0x0154            # a0 = FFFFFFD4
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x6020($at)           # 80106020
    mov.s   $f2, $f0
    abs.s   $f0, $f0
    lui     $at, 0x3F80                # $at = 3F800000
    c.lt.s  $f0, $f4
    nop
    bc1tl   lbl_80014228
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    mtc1    $at, $f8                   # $f8 = 1.00
    addiu   a0, $sp, 0x0154            # a0 = FFFFFFD4
    div.s   $f2, $f8, $f2
    mfc1    a1, $f2
    jal     func_80063DDC
    nop
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF90
    lw      a1, 0x0160($sp)
    lw      a2, 0x0164($sp)
    jal     func_8008F82C              # guTranslateF
    lw      a3, 0x0168($sp)
    lwc1    $f6, 0x015C($sp)
    lh      a1, 0x018C(s1)             # 0000018C
    addiu   a0, $sp, 0x00D0            # a0 = FFFFFF50
    lw      a2, 0x0154($sp)
    lw      a3, 0x0158($sp)
    jal     func_8008FCE0
    swc1    $f6, 0x0010($sp)
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF90
    addiu   a1, $sp, 0x00D0            # a1 = FFFFFF50
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0090            # a2 = FFFFFF10
    lwc1    $f10, 0x0160($sp)
    lwc1    $f18, 0x0164($sp)
    lwc1    $f8, 0x0168($sp)
    neg.s   $f16, $f10
    neg.s   $f4, $f18
    neg.s   $f6, $f8
    mfc1    a2, $f4
    mfc1    a3, $f6
    mfc1    a1, $f16
    jal     func_8008F82C              # guTranslateF
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF90
    addiu   a0, $sp, 0x0090            # a0 = FFFFFF10
    addiu   a1, $sp, 0x0110            # a1 = FFFFFF90
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0050            # a2 = FFFFFED0
    addiu   a0, $sp, 0x0050            # a0 = FFFFFED0
    or      a1, s2, $zero              # a1 = 00000000
    jal     func_8008ED08
    addiu   a2, $sp, 0x0038            # a2 = FFFFFEB8
    addiu   a0, $sp, 0x0050            # a0 = FFFFFED0
    or      a1, s3, $zero              # a1 = 00000000
    jal     func_8008ED08
    addiu   a2, $sp, 0x0044            # a2 = FFFFFEC4
    lwc1    $f10, 0x0038($sp)
    trunc.w.s $f16, $f10
    mfc1    t9, $f16
    nop
    sh      t9, 0x0008(s0)             # 00000008
    lwc1    $f18, 0x003C($sp)
    trunc.w.s $f4, $f18
    mfc1    t1, $f4
    nop
    sh      t1, 0x000A(s0)             # 0000000A
    lwc1    $f8, 0x0040($sp)
    trunc.w.s $f6, $f8
    mfc1    t3, $f6
    nop
    sh      t3, 0x000C(s0)             # 0000000C
    lwc1    $f10, 0x0044($sp)
    trunc.w.s $f16, $f10
    mfc1    t5, $f16
    nop
    sh      t5, 0x000E(s0)             # 0000000E
    lwc1    $f18, 0x0048($sp)
    trunc.w.s $f4, $f18
    mfc1    t7, $f4
    nop
    sh      t7, 0x0010(s0)             # 00000010
    lwc1    $f8, 0x004C($sp)
    trunc.w.s $f6, $f8
    mfc1    t9, $f6
    nop
    sh      t9, 0x0012(s0)             # 00000012
lbl_80014224:
    addiu   t0, $zero, 0x0001          # t0 = 00000001
lbl_80014228:
    sw      t0, 0x0004(s0)             # 00000004
    lbu     t1, 0x019E(s1)             # 0000019E
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x019E(s1)             # 0000019E
lbl_80014238:
    lw      $ra, 0x002C($sp)
lbl_8001423C:
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    lw      s2, 0x0024($sp)
    lw      s3, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0180           # $sp += 0x180


func_80014254:
# MqDbg: EffectBlure_AddSpace
    beq     a0, $zero, lbl_80014290
    nop
    lbu     v0, 0x019E(a0)             # 0000019E
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    slti    $at, v0, 0x0010
    beq     $at, $zero, lbl_80014290
    sll     t6, v0,  2
    subu    t6, t6, v0
    sll     t6, t6,  3
    addu    v1, a0, t6
    sw      $zero, 0x0000(v1)          # 00000000
    sw      t7, 0x0004(v1)             # 00000004
    lbu     t8, 0x019E(a0)             # 0000019E
    addiu   t9, t8, 0x0001             # t9 = 00000001
    sb      t9, 0x019E(a0)             # 0000019E
lbl_80014290:
    jr      $ra
    nop


func_80014298:
# MqDbg: EffectBlure_InitElements
    sb      $zero, 0x019E(a0)          # 0000019E
    or      v1, a0, $zero              # v1 = 00000000
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a1, $zero, 0x0010          # a1 = 00000010
lbl_800142AC:
    addiu   v0, v0, 0x0004             # v0 = 00000004
    sw      a0, 0x0018(v1)             # 00000018
    sh      $zero, 0x0020(v1)          # 00000020
    sh      $zero, 0x0022(v1)          # 00000022
    sh      $zero, 0x0024(v1)          # 00000024
    sh      $zero, 0x0026(v1)          # 00000026
    sh      $zero, 0x0028(v1)          # 00000028
    sh      $zero, 0x002A(v1)          # 0000002A
    sw      $zero, 0x001C(v1)          # 0000001C
    sh      $zero, 0x002C(v1)          # 0000002C
    sw      a0, 0x0030(v1)             # 00000030
    sh      $zero, 0x0038(v1)          # 00000038
    sh      $zero, 0x003A(v1)          # 0000003A
    sh      $zero, 0x003C(v1)          # 0000003C
    sh      $zero, 0x003E(v1)          # 0000003E
    sh      $zero, 0x0040(v1)          # 00000040
    sh      $zero, 0x0042(v1)          # 00000042
    sw      $zero, 0x0034(v1)          # 00000034
    sh      $zero, 0x0044(v1)          # 00000044
    sw      a0, 0x0048(v1)             # 00000048
    sh      $zero, 0x0050(v1)          # 00000050
    sh      $zero, 0x0052(v1)          # 00000052
    sh      $zero, 0x0054(v1)          # 00000054
    sh      $zero, 0x0056(v1)          # 00000056
    sh      $zero, 0x0058(v1)          # 00000058
    sh      $zero, 0x005A(v1)          # 0000005A
    sw      $zero, 0x004C(v1)          # 0000004C
    sh      $zero, 0x005C(v1)          # 0000005C
    addiu   v1, v1, 0x0060             # v1 = 00000060
    sw      a0, -0x0060(v1)            # 00000000
    sh      $zero, -0x0058(v1)         # 00000008
    sh      $zero, -0x0056(v1)         # 0000000A
    sh      $zero, -0x0054(v1)         # 0000000C
    sh      $zero, -0x0052(v1)         # 0000000E
    sh      $zero, -0x0050(v1)         # 00000010
    sh      $zero, -0x004E(v1)         # 00000012
    sw      $zero, -0x005C(v1)         # 00000004
    bne     v0, a1, lbl_800142AC
    sh      $zero, -0x004C(v1)         # 00000014
    jr      $ra
    nop


func_80014350:
# MqDbg: EffectBlure_Init1
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beql    a0, $zero, lbl_80014454
    lw      $ra, 0x0014($sp)
    beql    a1, $zero, lbl_80014454
    lw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    jal     func_80014298
    sw      a1, 0x001C($sp)
    lw      a1, 0x001C($sp)
    lw      a0, 0x0018($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    lbu     t6, 0x0184(a1)             # 00000184
    mtc1    $at, $f4                   # $f4 = 1.00
    sb      t6, 0x018E(a0)             # 0000018E
    lbu     t7, 0x0188(a1)             # 00000188
    sb      t7, 0x0192(a0)             # 00000192
    lbu     t8, 0x018C(a1)             # 0000018C
    sb      t8, 0x0196(a0)             # 00000196
    lbu     t9, 0x0190(a1)             # 00000190
    sb      t9, 0x019A(a0)             # 0000019A
    lbu     t0, 0x0185(a1)             # 00000185
    sb      t0, 0x018F(a0)             # 0000018F
    lbu     t1, 0x0189(a1)             # 00000189
    sb      t1, 0x0193(a0)             # 00000193
    lbu     t2, 0x018D(a1)             # 0000018D
    sb      t2, 0x0197(a0)             # 00000197
    lbu     t3, 0x0191(a1)             # 00000191
    sb      t3, 0x019B(a0)             # 0000019B
    lbu     t4, 0x0186(a1)             # 00000186
    sb      t4, 0x0190(a0)             # 00000190
    lbu     t5, 0x018A(a1)             # 0000018A
    sb      t5, 0x0194(a0)             # 00000194
    lbu     t6, 0x018E(a1)             # 0000018E
    sb      t6, 0x0198(a0)             # 00000198
    lbu     t7, 0x0192(a1)             # 00000192
    sb      t7, 0x019C(a0)             # 0000019C
    lbu     t8, 0x0187(a1)             # 00000187
    sb      t8, 0x0191(a0)             # 00000191
    lbu     t9, 0x018B(a1)             # 0000018B
    sb      t9, 0x0195(a0)             # 00000195
    lbu     t0, 0x018F(a1)             # 0000018F
    sb      t0, 0x0199(a0)             # 00000199
    lbu     t1, 0x0193(a1)             # 00000193
    sb      t1, 0x019D(a0)             # 0000019D
    lw      t2, 0x0194(a1)             # 00000194
    sb      t2, 0x019F(a0)             # 0000019F
    lw      t3, 0x0198(a1)             # 00000198
    sb      t3, 0x01A0(a0)             # 000001A0
    lw      t4, 0x019C(a1)             # 0000019C
    sh      $zero, 0x0188(a0)          # 00000188
    sh      $zero, 0x018A(a0)          # 0000018A
    sh      $zero, 0x018C(a0)          # 0000018C
    sb      $zero, 0x01A1(a0)          # 000001A1
    sb      $zero, 0x01A2(a0)          # 000001A2
    sb      $zero, 0x01A3(a0)          # 000001A3
    sb      $zero, 0x01A4(a0)          # 000001A4
    sb      $zero, 0x01A5(a0)          # 000001A5
    sb      $zero, 0x01A6(a0)          # 000001A6
    sb      $zero, 0x01A7(a0)          # 000001A7
    sb      $zero, 0x01A8(a0)          # 000001A8
    sb      $zero, 0x01A9(a0)          # 000001A9
    swc1    $f4, 0x0184(a0)            # 00000184
    sw      t4, 0x0180(a0)             # 00000180
    lw      $ra, 0x0014($sp)
lbl_80014454:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80014460:
# MqDbg: EffectBlure_Init2
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beql    a0, $zero, lbl_80014588
    lw      $ra, 0x0014($sp)
    beql    a1, $zero, lbl_80014588
    lw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    jal     func_80014298
    sw      a1, 0x001C($sp)
    lw      a1, 0x001C($sp)
    lw      a0, 0x0018($sp)
    lui     $at, 0x4F80                # $at = 4F800000
    lbu     t6, 0x0008(a1)             # 00000008
    sb      t6, 0x018E(a0)             # 0000018E
    lbu     t7, 0x000C(a1)             # 0000000C
    sb      t7, 0x0192(a0)             # 00000192
    lbu     t8, 0x0010(a1)             # 00000010
    sb      t8, 0x0196(a0)             # 00000196
    lbu     t9, 0x0014(a1)             # 00000014
    sb      t9, 0x019A(a0)             # 0000019A
    lbu     t0, 0x0009(a1)             # 00000009
    sb      t0, 0x018F(a0)             # 0000018F
    lbu     t1, 0x000D(a1)             # 0000000D
    sb      t1, 0x0193(a0)             # 00000193
    lbu     t2, 0x0011(a1)             # 00000011
    sb      t2, 0x0197(a0)             # 00000197
    lbu     t3, 0x0015(a1)             # 00000015
    sb      t3, 0x019B(a0)             # 0000019B
    lbu     t4, 0x000A(a1)             # 0000000A
    sb      t4, 0x0190(a0)             # 00000190
    lbu     t5, 0x000E(a1)             # 0000000E
    sb      t5, 0x0194(a0)             # 00000194
    lbu     t6, 0x0012(a1)             # 00000012
    sb      t6, 0x0198(a0)             # 00000198
    lbu     t7, 0x0016(a1)             # 00000016
    sb      t7, 0x019C(a0)             # 0000019C
    lbu     t8, 0x000B(a1)             # 0000000B
    sb      t8, 0x0191(a0)             # 00000191
    lbu     t9, 0x000F(a1)             # 0000000F
    sb      t9, 0x0195(a0)             # 00000195
    lbu     t0, 0x0013(a1)             # 00000013
    sb      t0, 0x0199(a0)             # 00000199
    lbu     t1, 0x0017(a1)             # 00000017
    sb      t1, 0x019D(a0)             # 0000019D
    lbu     t2, 0x0018(a1)             # 00000018
    sb      t2, 0x019F(a0)             # 0000019F
    lbu     t3, 0x0019(a1)             # 00000019
    sb      t3, 0x01A0(a0)             # 000001A0
    lw      t4, 0x0000(a1)             # 00000000
    sw      t4, 0x0180(a0)             # 00000180
    lhu     t5, 0x0004(a1)             # 00000004
    sh      t5, 0x0188(a0)             # 00000188
    lbu     t6, 0x001A(a1)             # 0000001A
    sb      t6, 0x01A1(a0)             # 000001A1
    lh      t7, 0x0006(a1)             # 00000006
    sh      $zero, 0x018C(a0)          # 0000018C
    sh      t7, 0x018A(a0)             # 0000018A
    lbu     t8, 0x001B(a1)             # 0000001B
    mtc1    t8, $f4                    # $f4 = 0.00
    bgez    t8, lbl_80014560
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_80014560:
    swc1    $f6, 0x0184(a0)            # 00000184
    lwl     t0, 0x001C(a1)             # 0000001C
    lwr     t0, 0x001F(a1)             # 0000001F
    swl     t0, 0x01A2(a0)             # 000001A2
    swr     t0, 0x01A5(a0)             # 000001A5
    lwl     t2, 0x0020(a1)             # 00000020
    lwr     t2, 0x0023(a1)             # 00000023
    swl     t2, 0x01A6(a0)             # 000001A6
    swr     t2, 0x01A9(a0)             # 000001A9
    lw      $ra, 0x0014($sp)
lbl_80014588:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80014594:
# MqDbg: EffectBlure_Destroy
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_800145A0:
# MqDbg: EffectBlure_Update
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    bnel    a0, $zero, lbl_800145BC
    lbu     v1, 0x019E(a0)             # 0000019E
    b       lbl_800149F8
    or      v0, $zero, $zero           # v0 = 00000000
    lbu     v1, 0x019E(a0)             # 0000019E
lbl_800145BC:
    addiu   s0, $zero, 0x0002          # s0 = 00000002
    addiu   t5, $zero, 0x000F          # t5 = 0000000F
    bne     v1, $zero, lbl_800145D4
    nop
    b       lbl_800149F8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800145D4:
    lw      v0, 0x0000(a0)             # 00000000
    addiu   t2, a0, 0x0018             # t2 = 00000018
    bne     v0, $zero, lbl_800147B4
    nop
    lw      t7, 0x0000(t2)             # 00000018
    addiu   t3, a0, 0x0030             # t3 = 00000030
    addiu   t4, a0, 0x0048             # t4 = 00000048
    sw      t7, 0x0000(a0)             # 00000000
    lw      t6, 0x0004(t2)             # 0000001C
    addiu   v1, a0, 0x0048             # v1 = 00000048
    addiu   a1, v1, 0x0018             # a1 = 00000060
    sw      t6, 0x0004(a0)             # 00000004
    lw      t7, 0x0008(t2)             # 00000020
    addiu   a2, v1, 0x0030             # a2 = 00000078
    addiu   a3, v1, 0x0048             # a3 = 00000090
    sw      t7, 0x0008(a0)             # 00000008
    lw      t6, 0x000C(t2)             # 00000024
    addiu   t0, v1, 0x0060             # t0 = 000000A8
    addiu   v0, $zero, 0x0003          # v0 = 00000003
    sw      t6, 0x000C(a0)             # 0000000C
    lw      t7, 0x0010(t2)             # 00000028
    sw      t7, 0x0010(a0)             # 00000010
    lw      t6, 0x0014(t2)             # 0000002C
    sw      t6, 0x0014(a0)             # 00000014
    lw      t9, 0x0000(t3)             # 00000030
    sw      t9, 0x0000(t2)             # 00000018
    lw      t8, 0x0004(t3)             # 00000034
    sw      t8, 0x0004(t2)             # 0000001C
    lw      t9, 0x0008(t3)             # 00000038
    sw      t9, 0x0008(t2)             # 00000020
    lw      t8, 0x000C(t3)             # 0000003C
    sw      t8, 0x000C(t2)             # 00000024
    lw      t9, 0x0010(t3)             # 00000040
    sw      t9, 0x0010(t2)             # 00000028
    lw      t8, 0x0014(t3)             # 00000044
    sw      t8, 0x0014(t2)             # 0000002C
    lw      t7, 0x0000(t4)             # 00000048
    sw      t7, 0x0000(t3)             # 00000030
    lw      t6, 0x0004(t4)             # 0000004C
    sw      t6, 0x0004(t3)             # 00000034
    lw      t7, 0x0008(t4)             # 00000050
    sw      t7, 0x0008(t3)             # 00000038
    lw      t6, 0x000C(t4)             # 00000054
    sw      t6, 0x000C(t3)             # 0000003C
    lw      t7, 0x0010(t4)             # 00000058
    sw      t7, 0x0010(t3)             # 00000040
    lw      t6, 0x0014(t4)             # 0000005C
    sw      t6, 0x0014(t3)             # 00000044
lbl_80014694:
    lw      t9, 0x0000(a1)             # 00000060
    addiu   v0, v0, 0x0004             # v0 = 00000007
    addiu   v1, v1, 0x0060             # v1 = 000000A8
    sw      t9, -0x0060(v1)            # 00000048
    lw      t8, 0x0004(a1)             # 00000064
    addiu   a1, a1, 0x0060             # a1 = 000000C0
    addiu   a2, a2, 0x0060             # a2 = 000000D8
    sw      t8, -0x005C(v1)            # 0000004C
    lw      t9, -0x0058(a1)            # 00000068
    addiu   a3, a3, 0x0060             # a3 = 000000F0
    addiu   t0, t0, 0x0060             # t0 = 00000108
    sw      t9, -0x0058(v1)            # 00000050
    lw      t8, -0x0054(a1)            # 0000006C
    sw      t8, -0x0054(v1)            # 00000054
    lw      t9, -0x0050(a1)            # 00000070
    sw      t9, -0x0050(v1)            # 00000058
    lw      t8, -0x004C(a1)            # 00000074
    sw      t8, -0x004C(v1)            # 0000005C
    lw      t7, -0x0060(a2)            # 00000078
    sw      t7, -0x0060(a1)            # 00000060
    lw      t6, -0x005C(a2)            # 0000007C
    sw      t6, -0x005C(a1)            # 00000064
    lw      t7, -0x0058(a2)            # 00000080
    sw      t7, -0x0058(a1)            # 00000068
    lw      t6, -0x0054(a2)            # 00000084
    sw      t6, -0x0054(a1)            # 0000006C
    lw      t7, -0x0050(a2)            # 00000088
    sw      t7, -0x0050(a1)            # 00000070
    lw      t6, -0x004C(a2)            # 0000008C
    sw      t6, -0x004C(a1)            # 00000074
    lw      t9, -0x0060(a3)            # 00000090
    sw      t9, -0x0060(a2)            # 00000078
    lw      t8, -0x005C(a3)            # 00000094
    sw      t8, -0x005C(a2)            # 0000007C
    lw      t9, -0x0058(a3)            # 00000098
    sw      t9, -0x0058(a2)            # 00000080
    lw      t8, -0x0054(a3)            # 0000009C
    sw      t8, -0x0054(a2)            # 00000084
    lw      t9, -0x0050(a3)            # 000000A0
    sw      t9, -0x0050(a2)            # 00000088
    lw      t8, -0x004C(a3)            # 000000A4
    sw      t8, -0x004C(a2)            # 0000008C
    lw      t7, -0x0060(t0)            # 000000A8
    sw      t7, -0x0060(a3)            # 00000090
    lw      t6, -0x005C(t0)            # 000000AC
    sw      t6, -0x005C(a3)            # 00000094
    lw      t7, -0x0058(t0)            # 000000B0
    sw      t7, -0x0058(a3)            # 00000098
    lw      t6, -0x0054(t0)            # 000000B4
    sw      t6, -0x0054(a3)            # 0000009C
    lw      t7, -0x0050(t0)            # 000000B8
    sw      t7, -0x0050(a3)            # 000000A0
    lw      t6, -0x004C(t0)            # 000000BC
    bne     v0, t5, lbl_80014694
    sw      t6, -0x004C(a3)            # 000000A4
    sw      s0, 0x0000(v1)             # 000000A8
    sh      $zero, 0x0008(v1)          # 000000B0
    sh      $zero, 0x000A(v1)          # 000000B2
    sh      $zero, 0x000C(v1)          # 000000B4
    sh      $zero, 0x000E(v1)          # 000000B6
    sh      $zero, 0x0010(v1)          # 000000B8
    sh      $zero, 0x0012(v1)          # 000000BA
    sh      $zero, 0x0014(v1)          # 000000BC
    sw      $zero, 0x0004(v1)          # 000000AC
    lbu     t8, 0x019E(a0)             # 0000019E
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    andi    v1, t9, 0x00FF             # v1 = 000000FF
    bgtz    v1, lbl_800145D4
    sb      t9, 0x019E(a0)             # 0000019E
    sb      $zero, 0x019E(a0)          # 0000019E
    b       lbl_800149F8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800147B4:
    bne     s0, v0, lbl_800147C4
    nop
    b       lbl_800149F8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800147C4:
    blez    v1, lbl_800147F4
    or      v0, $zero, $zero           # v0 = 00000000
    or      v1, a0, $zero              # v1 = 00000000
    lw      t6, 0x0004(v1)             # 00000004
lbl_800147D4:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   v1, v1, 0x0018             # v1 = 00000018
    addiu   t7, t6, 0x0001             # t7 = 00000001
    sw      t7, -0x0014(v1)            # 00000004
    lbu     t8, 0x019E(a0)             # 0000019E
    slt     $at, v0, t8
    bnel    $at, $zero, lbl_800147D4
    lw      t6, 0x0004(v1)             # 0000001C
lbl_800147F4:
    lbu     t9, 0x019F(a0)             # 0000019F
    lw      t6, 0x0004(a0)             # 00000004
    addiu   t2, a0, 0x0018             # t2 = 00000018
    slt     $at, t9, t6
    beql    $at, $zero, lbl_800149E8
    lh      t8, 0x018C(a0)             # 0000018C
    lw      t8, 0x0000(t2)             # 00000018
    addiu   t3, a0, 0x0030             # t3 = 00000030
    addiu   t4, a0, 0x0048             # t4 = 00000048
    sw      t8, 0x0000(a0)             # 00000000
    lw      t7, 0x0004(t2)             # 0000001C
    addiu   v1, a0, 0x0048             # v1 = 00000048
    addiu   a1, v1, 0x0018             # a1 = 00000060
    sw      t7, 0x0004(a0)             # 00000004
    lw      t8, 0x0008(t2)             # 00000020
    addiu   a2, v1, 0x0030             # a2 = 00000078
    addiu   a3, v1, 0x0048             # a3 = 00000090
    sw      t8, 0x0008(a0)             # 00000008
    lw      t7, 0x000C(t2)             # 00000024
    addiu   t0, v1, 0x0060             # t0 = 000000A8
    addiu   v0, $zero, 0x0003          # v0 = 00000003
    sw      t7, 0x000C(a0)             # 0000000C
    lw      t8, 0x0010(t2)             # 00000028
    sw      t8, 0x0010(a0)             # 00000010
    lw      t7, 0x0014(t2)             # 0000002C
    sw      t7, 0x0014(a0)             # 00000014
    lw      t6, 0x0000(t3)             # 00000030
    sw      t6, 0x0000(t2)             # 00000018
    lw      t9, 0x0004(t3)             # 00000034
    sw      t9, 0x0004(t2)             # 0000001C
    lw      t6, 0x0008(t3)             # 00000038
    sw      t6, 0x0008(t2)             # 00000020
    lw      t9, 0x000C(t3)             # 0000003C
    sw      t9, 0x000C(t2)             # 00000024
    lw      t6, 0x0010(t3)             # 00000040
    sw      t6, 0x0010(t2)             # 00000028
    lw      t9, 0x0014(t3)             # 00000044
    sw      t9, 0x0014(t2)             # 0000002C
    lw      t8, 0x0000(t4)             # 00000048
    sw      t8, 0x0000(t3)             # 00000030
    lw      t7, 0x0004(t4)             # 0000004C
    sw      t7, 0x0004(t3)             # 00000034
    lw      t8, 0x0008(t4)             # 00000050
    sw      t8, 0x0008(t3)             # 00000038
    lw      t7, 0x000C(t4)             # 00000054
    sw      t7, 0x000C(t3)             # 0000003C
    lw      t8, 0x0010(t4)             # 00000058
    sw      t8, 0x0010(t3)             # 00000040
    lw      t7, 0x0014(t4)             # 0000005C
    sw      t7, 0x0014(t3)             # 00000044
lbl_800148BC:
    lw      t6, 0x0000(a1)             # 00000060
    addiu   v0, v0, 0x0004             # v0 = 00000007
    addiu   v1, v1, 0x0060             # v1 = 000000A8
    sw      t6, -0x0060(v1)            # 00000048
    lw      t9, 0x0004(a1)             # 00000064
    addiu   a1, a1, 0x0060             # a1 = 000000C0
    addiu   a2, a2, 0x0060             # a2 = 000000D8
    sw      t9, -0x005C(v1)            # 0000004C
    lw      t6, -0x0058(a1)            # 00000068
    addiu   a3, a3, 0x0060             # a3 = 000000F0
    addiu   t0, t0, 0x0060             # t0 = 00000108
    sw      t6, -0x0058(v1)            # 00000050
    lw      t9, -0x0054(a1)            # 0000006C
    sw      t9, -0x0054(v1)            # 00000054
    lw      t6, -0x0050(a1)            # 00000070
    sw      t6, -0x0050(v1)            # 00000058
    lw      t9, -0x004C(a1)            # 00000074
    sw      t9, -0x004C(v1)            # 0000005C
    lw      t8, -0x0060(a2)            # 00000078
    sw      t8, -0x0060(a1)            # 00000060
    lw      t7, -0x005C(a2)            # 0000007C
    sw      t7, -0x005C(a1)            # 00000064
    lw      t8, -0x0058(a2)            # 00000080
    sw      t8, -0x0058(a1)            # 00000068
    lw      t7, -0x0054(a2)            # 00000084
    sw      t7, -0x0054(a1)            # 0000006C
    lw      t8, -0x0050(a2)            # 00000088
    sw      t8, -0x0050(a1)            # 00000070
    lw      t7, -0x004C(a2)            # 0000008C
    sw      t7, -0x004C(a1)            # 00000074
    lw      t6, -0x0060(a3)            # 00000090
    sw      t6, -0x0060(a2)            # 00000078
    lw      t9, -0x005C(a3)            # 00000094
    sw      t9, -0x005C(a2)            # 0000007C
    lw      t6, -0x0058(a3)            # 00000098
    sw      t6, -0x0058(a2)            # 00000080
    lw      t9, -0x0054(a3)            # 0000009C
    sw      t9, -0x0054(a2)            # 00000084
    lw      t6, -0x0050(a3)            # 000000A0
    sw      t6, -0x0050(a2)            # 00000088
    lw      t9, -0x004C(a3)            # 000000A4
    sw      t9, -0x004C(a2)            # 0000008C
    lw      t8, -0x0060(t0)            # 000000A8
    sw      t8, -0x0060(a3)            # 00000090
    lw      t7, -0x005C(t0)            # 000000AC
    sw      t7, -0x005C(a3)            # 00000094
    lw      t8, -0x0058(t0)            # 000000B0
    sw      t8, -0x0058(a3)            # 00000098
    lw      t7, -0x0054(t0)            # 000000B4
    sw      t7, -0x0054(a3)            # 0000009C
    lw      t8, -0x0050(t0)            # 000000B8
    sw      t8, -0x0050(a3)            # 000000A0
    lw      t7, -0x004C(t0)            # 000000BC
    bne     v0, t5, lbl_800148BC
    sw      t7, -0x004C(a3)            # 000000A4
    sw      s0, 0x0000(v1)             # 000000A8
    sh      $zero, 0x0008(v1)          # 000000B0
    sh      $zero, 0x000A(v1)          # 000000B2
    sh      $zero, 0x000C(v1)          # 000000B4
    sh      $zero, 0x000E(v1)          # 000000B6
    sh      $zero, 0x0010(v1)          # 000000B8
    sh      $zero, 0x0012(v1)          # 000000BA
    sh      $zero, 0x0014(v1)          # 000000BC
    sw      $zero, 0x0004(v1)          # 000000AC
    lbu     t9, 0x019E(a0)             # 0000019E
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t6, t9, 0xFFFF             # t6 = FFFFFFFE
    andi    t7, t6, 0x00FF             # t7 = 000000FE
    bgtz    t7, lbl_800149DC
    sb      t6, 0x019E(a0)             # 0000019E
    b       lbl_800149F8
    sb      $zero, 0x019E(a0)          # 0000019E
lbl_800149DC:
    b       lbl_800149F8
    or      v0, $zero, $zero           # v0 = 00000000
    lh      t8, 0x018C(a0)             # 0000018C
lbl_800149E8:
    lh      t9, 0x018A(a0)             # 0000018A
    or      v0, $zero, $zero           # v0 = 00000000
    addu    t6, t8, t9
    sh      t6, 0x018C(a0)             # 0000018C
lbl_800149F8:
    lw      s0, 0x0004($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0008           # $sp += 0x8


func_80014A04:
# MqDbg: EffectBlure_UpdateFlags
    addiu   $sp, $sp, 0xFF90           # $sp -= 0x70
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    lw      t6, -0x0018(s0)            # FFFFFFE8
    beql    t6, $zero, lbl_80014A38
    lhu     t8, 0x0014(s0)             # 00000014
    lw      t7, 0x0018(s0)             # 00000018
    addiu   a0, $sp, 0x0064            # a0 = FFFFFFF4
    addiu   a1, s0, 0x0008             # a1 = 00000008
    bne     t7, $zero, lbl_80014A4C
    addiu   v0, s0, 0xFFE8             # v0 = FFFFFFE8
    lhu     t8, 0x0014(s0)             # 00000014
lbl_80014A38:
    andi    t0, t8, 0xFFFC             # t0 = 00000000
    sh      t0, 0x0014(s0)             # 00000014
    ori     t1, t0, 0x0002             # t1 = 00000002
    b       lbl_80014B60
    sh      t1, 0x0014(s0)             # 00000014
lbl_80014A4C:
    addiu   a2, v0, 0x0008             # a2 = FFFFFFF0
    sw      v0, 0x0028($sp)
    jal     func_80063D80
    sw      a1, 0x0024($sp)
    lw      v0, 0x0028($sp)
    addiu   a1, s0, 0x000E             # a1 = 0000000E
    sw      a1, 0x0020($sp)
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFE8
    jal     func_80063D80
    addiu   a2, v0, 0x000E             # a2 = 0000000E
    addiu   v0, s0, 0x0018             # v0 = 00000018
    addiu   a1, v0, 0x0008             # a1 = 00000020
    sw      v0, 0x0028($sp)
    addiu   a0, $sp, 0x004C            # a0 = FFFFFFDC
    jal     func_80063D80
    lw      a2, 0x0024($sp)
    lw      v0, 0x0028($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFD0
    lw      a2, 0x0020($sp)
    jal     func_80063D80
    addiu   a1, v0, 0x000E             # a1 = 0000000E
    addiu   a0, $sp, 0x0064            # a0 = FFFFFFF4
    addiu   a1, $sp, 0x004C            # a1 = FFFFFFDC
    jal     func_800A4EE0
    addiu   a2, $sp, 0x0034            # a2 = FFFFFFC4
    bne     v0, $zero, lbl_80014AE0
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFE8
    addiu   a1, $sp, 0x0040            # a1 = FFFFFFD0
    jal     func_800A4EE0
    addiu   a2, $sp, 0x0030            # a2 = FFFFFFC0
    bne     v0, $zero, lbl_80014AE0
    addiu   a0, $sp, 0x004C            # a0 = FFFFFFDC
    addiu   a1, $sp, 0x0040            # a1 = FFFFFFD0
    jal     func_800A4EE0
    addiu   a2, $sp, 0x002C            # a2 = FFFFFFBC
    beq     v0, $zero, lbl_80014AF4
    lui     $at, 0xBF00                # $at = BF000000
lbl_80014AE0:
    lhu     t2, 0x0014(s0)             # 00000014
    andi    t4, t2, 0xFFFC             # t4 = 00000000
    sh      t4, 0x0014(s0)             # 00000014
    b       lbl_80014B60
    sh      t4, 0x0014(s0)             # 00000014
lbl_80014AF4:
    mtc1    $at, $f0                   # $f0 = -0.50
    lwc1    $f4, 0x0034($sp)
    lwc1    $f6, 0x0030($sp)
    c.le.s  $f4, $f0
    nop
    bc1tl   lbl_80014B3C
    lhu     t5, 0x0014(s0)             # 00000014
    c.le.s  $f6, $f0
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f10, 0x002C($sp)
    bc1tl   lbl_80014B3C
    lhu     t5, 0x0014(s0)             # 00000014
    lwc1    $f8, 0x6024($at)           # 80106024
    c.le.s  $f10, $f8
    nop
    bc1fl   lbl_80014B50
    lhu     t8, 0x0014(s0)             # 00000014
    lhu     t5, 0x0014(s0)             # 00000014
lbl_80014B3C:
    andi    t7, t5, 0xFFFC             # t7 = 00000000
    sh      t7, 0x0014(s0)             # 00000014
    b       lbl_80014B60
    sh      t7, 0x0014(s0)             # 00000014
    lhu     t8, 0x0014(s0)             # 00000014
lbl_80014B50:
    andi    t0, t8, 0xFFFC             # t0 = 00000000
    sh      t0, 0x0014(s0)             # 00000014
    ori     t1, t0, 0x0001             # t1 = 00000001
    sh      t1, 0x0014(s0)             # 00000014
lbl_80014B60:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0070           # $sp += 0x70
    jr      $ra
    nop


func_80014B74:
# MqDbg: EffectBlure_GetComputedValues
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sdc1    $f20, 0x0018($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    mtc1    a2, $f20                   # $f20 = 0.00
    or      s1, a3, $zero              # s1 = 00000000
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s0, 0x0020($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0180(s2)             # 00000180
    sltiu   $at, t6, 0x0005
    beq     $at, $zero, lbl_80014F30
    sll     t6, t6,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t6
    lw      t6, 0x6028($at)            # 80106028
    jr      t6
    nop
lbl_80014BC0:
    lw      t7, 0x003C($sp)
    mfc1    a2, $f20
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  3
    addu    s0, s2, t8
    lh      a0, 0x0008(s0)             # 00000008
    jal     func_8001B960
    lh      a1, 0x000E(s0)             # 0000000E
    sh      v0, 0x0000(s1)             # 00000000
    mfc1    a2, $f20
    lh      a1, 0x0010(s0)             # 00000010
    jal     func_8001B960
    lh      a0, 0x000A(s0)             # 0000000A
    sh      v0, 0x0002(s1)             # 00000002
    mfc1    a2, $f20
    lh      a1, 0x0012(s0)             # 00000012
    jal     func_8001B960
    lh      a0, 0x000C(s0)             # 0000000C
    lw      v1, 0x0048($sp)
    sh      v0, 0x0004(s1)             # 00000004
    lh      t9, 0x000E(s0)             # 0000000E
    sh      t9, 0x0000(v1)             # 00000000
    lh      t0, 0x0010(s0)             # 00000010
    sh      t0, 0x0002(v1)             # 00000002
    lh      t1, 0x0012(s0)             # 00000012
    b       lbl_80014F78
    sh      t1, 0x0004(v1)             # 00000004
lbl_80014C30:
    lw      t2, 0x003C($sp)
    mfc1    a2, $f20
    sll     t3, t2,  2
    subu    t3, t3, t2
    sll     t3, t3,  3
    addu    s0, s2, t3
    lh      t4, 0x0008(s0)             # 00000008
    sh      t4, 0x0000(s1)             # 00000000
    lh      t5, 0x000A(s0)             # 0000000A
    sh      t5, 0x0002(s1)             # 00000002
    lh      t6, 0x000C(s0)             # 0000000C
    sh      t6, 0x0004(s1)             # 00000004
    lh      a1, 0x0008(s0)             # 00000008
    jal     func_8001B960
    lh      a0, 0x000E(s0)             # 0000000E
    lw      v1, 0x0048($sp)
    mfc1    a2, $f20
    sh      v0, 0x0000(v1)             # 00000000
    lh      a1, 0x000A(s0)             # 0000000A
    jal     func_8001B960
    lh      a0, 0x0010(s0)             # 00000010
    lw      v1, 0x0048($sp)
    mfc1    a2, $f20
    sh      v0, 0x0002(v1)             # 00000002
    lh      a1, 0x000C(s0)             # 0000000C
    jal     func_8001B960
    lh      a0, 0x0012(s0)             # 00000012
    lw      v1, 0x0048($sp)
    b       lbl_80014F78
    sh      v0, 0x0004(v1)             # 00000004
lbl_80014CA8:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f2                   # $f2 = 0.50
    lw      t7, 0x003C($sp)
    mul.s   $f20, $f20, $f2
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  3
    addu    s0, s2, t8
    lh      a0, 0x0008(s0)             # 00000008
    lh      a1, 0x000E(s0)             # 0000000E
    mfc1    a2, $f20
    jal     func_8001B960
    nop
    sh      v0, 0x0000(s1)             # 00000000
    mfc1    a2, $f20
    lh      a1, 0x0010(s0)             # 00000010
    jal     func_8001B960
    lh      a0, 0x000A(s0)             # 0000000A
    sh      v0, 0x0002(s1)             # 00000002
    mfc1    a2, $f20
    lh      a1, 0x0012(s0)             # 00000012
    jal     func_8001B960
    lh      a0, 0x000C(s0)             # 0000000C
    sh      v0, 0x0004(s1)             # 00000004
    mfc1    a2, $f20
    lh      a1, 0x0008(s0)             # 00000008
    jal     func_8001B960
    lh      a0, 0x000E(s0)             # 0000000E
    lw      v1, 0x0048($sp)
    mfc1    a2, $f20
    sh      v0, 0x0000(v1)             # 00000000
    lh      a1, 0x000A(s0)             # 0000000A
    jal     func_8001B960
    lh      a0, 0x0010(s0)             # 00000010
    lw      v1, 0x0048($sp)
    mfc1    a2, $f20
    sh      v0, 0x0002(v1)             # 00000002
    lh      a1, 0x000C(s0)             # 0000000C
    jal     func_8001B960
    lh      a0, 0x0012(s0)             # 00000012
    lw      v1, 0x0048($sp)
    add.s   $f20, $f20, $f20
    b       lbl_80014F78
    sh      v0, 0x0004(v1)             # 00000004
lbl_80014D58:
    lw      t9, 0x003C($sp)
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f2                   # $f2 = 0.50
    sll     t0, t9,  2
    subu    t0, t0, t9
    sll     t0, t0,  3
    addu    s0, s2, t0
    lh      t1, 0x0008(s0)             # 00000008
    lh      t2, 0x000E(s0)             # 0000000E
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f6                   # $f6 = 1.00
    subu    t3, t1, t2
    sh      t3, 0x0030($sp)
    lh      t0, 0x0030($sp)
    lh      t5, 0x0010(s0)             # 00000010
    lh      t4, 0x000A(s0)             # 0000000A
    mtc1    t0, $f8                    # $f8 = 0.00
    subu    t6, t4, t5
    sh      t6, 0x0032($sp)
    cvt.s.w $f10, $f8
    lh      t8, 0x0012(s0)             # 00000012
    lh      t7, 0x000C(s0)             # 0000000C
    subu    t9, t7, t8
    sh      t9, 0x0034($sp)
    mul.s   $f16, $f10, $f2
    lwc1    $f4, 0x0184(s2)            # 00000184
    lh      t1, 0x0008(s0)             # 00000008
    sub.s   $f0, $f4, $f6
    mtc1    t1, $f6                    # $f6 = 0.00
    mul.s   $f18, $f16, $f0
    cvt.s.w $f8, $f6
    mul.s   $f4, $f18, $f20
    add.s   $f10, $f4, $f8
    trunc.w.s $f16, $f10
    mfc1    t3, $f16
    nop
    sh      t3, 0x0000(s1)             # 00000000
    lh      t4, 0x0032($sp)
    lh      t5, 0x000A(s0)             # 0000000A
    mtc1    t4, $f18                   # $f18 = 0.00
    mtc1    t5, $f16                   # $f16 = 0.00
    cvt.s.w $f6, $f18
    cvt.s.w $f18, $f16
    mul.s   $f4, $f6, $f2
    nop
    mul.s   $f8, $f4, $f0
    nop
    mul.s   $f10, $f8, $f20
    add.s   $f6, $f10, $f18
    trunc.w.s $f4, $f6
    mfc1    t7, $f4
    nop
    sh      t7, 0x0002(s1)             # 00000002
    lh      t8, 0x0034($sp)
    lh      t9, 0x000C(s0)             # 0000000C
    lw      v1, 0x0048($sp)
    mtc1    t8, $f8                    # $f8 = 0.00
    mtc1    t9, $f4                    # $f4 = 0.00
    cvt.s.w $f16, $f8
    cvt.s.w $f8, $f4
    mul.s   $f10, $f16, $f2
    nop
    mul.s   $f18, $f10, $f0
    nop
    mul.s   $f6, $f18, $f20
    add.s   $f16, $f6, $f8
    trunc.w.s $f10, $f16
    mfc1    t1, $f10
    nop
    sh      t1, 0x0004(s1)             # 00000004
    lh      t3, 0x0030($sp)
    lh      t2, 0x000E(s0)             # 0000000E
    mtc1    t3, $f6                    # $f6 = 0.00
    mtc1    t2, $f18                   # $f18 = 0.00
    cvt.s.w $f8, $f6
    cvt.s.w $f4, $f18
    mul.s   $f16, $f8, $f2
    nop
    mul.s   $f10, $f16, $f0
    nop
    mul.s   $f18, $f10, $f20
    sub.s   $f6, $f4, $f18
    trunc.w.s $f8, $f6
    mfc1    t5, $f8
    nop
    sh      t5, 0x0000(v1)             # 00000000
    lh      t7, 0x0032($sp)
    lh      t6, 0x0010(s0)             # 00000010
    mtc1    t7, $f4                    # $f4 = 0.00
    mtc1    t6, $f16                   # $f16 = 0.00
    cvt.s.w $f18, $f4
    cvt.s.w $f10, $f16
    mul.s   $f6, $f18, $f2
    nop
    mul.s   $f8, $f6, $f0
    nop
    mul.s   $f16, $f8, $f20
    sub.s   $f4, $f10, $f16
    trunc.w.s $f18, $f4
    mfc1    t9, $f18
    nop
    sh      t9, 0x0002(v1)             # 00000002
    lh      t1, 0x0034($sp)
    lh      t0, 0x0012(s0)             # 00000012
    mtc1    t1, $f10                   # $f10 = 0.00
    mtc1    t0, $f6                    # $f6 = 0.00
    cvt.s.w $f16, $f10
    cvt.s.w $f8, $f6
    mul.s   $f4, $f16, $f2
    nop
    mul.s   $f18, $f4, $f0
    nop
    mul.s   $f6, $f18, $f20
    sub.s   $f10, $f8, $f6
    trunc.w.s $f16, $f10
    mfc1    t3, $f16
    b       lbl_80014F78
    sh      t3, 0x0004(v1)             # 00000004
lbl_80014F30:
    lw      t4, 0x003C($sp)
    lw      v1, 0x0048($sp)
    sll     t5, t4,  2
    subu    t5, t5, t4
    sll     t5, t5,  3
    addu    s0, s2, t5
    lh      t6, 0x0008(s0)             # 00000008
    sh      t6, 0x0000(s1)             # 00000000
    lh      t7, 0x000A(s0)             # 0000000A
    sh      t7, 0x0002(s1)             # 00000002
    lh      t8, 0x000C(s0)             # 0000000C
    sh      t8, 0x0004(s1)             # 00000004
    lh      t9, 0x000E(s0)             # 0000000E
    sh      t9, 0x0000(v1)             # 00000000
    lh      t0, 0x0010(s0)             # 00000010
    sh      t0, 0x0002(v1)             # 00000002
    lh      t1, 0x0012(s0)             # 00000012
    sh      t1, 0x0004(v1)             # 00000004
lbl_80014F78:
    lhu     t2, 0x0188(s2)             # 00000188
    andi    t3, t2, 0x0010             # t3 = 00000000
    beql    t3, $zero, lbl_80014FBC
    mfc1    a2, $f20
    lw      v1, 0x0050($sp)
    lw      s0, 0x004C($sp)
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    sb      v0, 0x0003(s0)             # 00000003
    sb      v0, 0x0002(s0)             # 00000002
    sb      v0, 0x0001(s0)             # 00000001
    sb      v0, 0x0000(s0)             # 00000000
    sb      v0, 0x0000(v1)             # 00000000
    sb      v0, 0x0001(v1)             # 00000001
    sb      v0, 0x0002(v1)             # 00000002
    b       lbl_8001506C
    sb      v0, 0x0003(v1)             # 00000003
    mfc1    a2, $f20
lbl_80014FBC:
    lbu     a0, 0x018E(s2)             # 0000018E
    jal     func_8001B9B4
    lbu     a1, 0x0196(s2)             # 00000196
    lw      s0, 0x004C($sp)
    mfc1    a2, $f20
    sb      v0, 0x0000(s0)             # 00000000
    lbu     a1, 0x0197(s2)             # 00000197
    jal     func_8001B9B4
    lbu     a0, 0x018F(s2)             # 0000018F
    sb      v0, 0x0001(s0)             # 00000001
    mfc1    a2, $f20
    lbu     a1, 0x0198(s2)             # 00000198
    jal     func_8001B9B4
    lbu     a0, 0x0190(s2)             # 00000190
    sb      v0, 0x0002(s0)             # 00000002
    mfc1    a2, $f20
    lbu     a1, 0x0199(s2)             # 00000199
    jal     func_8001B9B4
    lbu     a0, 0x0191(s2)             # 00000191
    sb      v0, 0x0003(s0)             # 00000003
    mfc1    a2, $f20
    lbu     a1, 0x019A(s2)             # 0000019A
    jal     func_8001B9B4
    lbu     a0, 0x0192(s2)             # 00000192
    lw      v1, 0x0050($sp)
    mfc1    a2, $f20
    sb      v0, 0x0000(v1)             # 00000000
    lbu     a1, 0x019B(s2)             # 0000019B
    jal     func_8001B9B4
    lbu     a0, 0x0193(s2)             # 00000193
    lw      v1, 0x0050($sp)
    mfc1    a2, $f20
    sb      v0, 0x0001(v1)             # 00000001
    lbu     a1, 0x019C(s2)             # 0000019C
    jal     func_8001B9B4
    lbu     a0, 0x0194(s2)             # 00000194
    lw      v1, 0x0050($sp)
    mfc1    a2, $f20
    sb      v0, 0x0002(v1)             # 00000002
    lbu     a1, 0x019D(s2)             # 0000019D
    jal     func_8001B9B4
    lbu     a0, 0x0195(s2)             # 00000195
    lw      v1, 0x0050($sp)
    sb      v0, 0x0003(v1)             # 00000003
lbl_8001506C:
    lw      $ra, 0x002C($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_80015088:
# MqDbg: EffectBlure_SetupSmooth
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    lw      t6, 0x001C($sp)
    addiu   a1, $zero, 0x0026          # a1 = 00000026
    jal     func_8007DFBC
    lw      a0, 0x02D0(t6)             # 000002D0
    lw      t7, 0x001C($sp)
    sw      v0, 0x02D0(t7)             # 000002D0
    lw      $ra, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800150BC:
# MqDbg: EffectBlure_DrawElemNoInterpolation
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s3, 0x0030($sp)
    sw      s2, 0x002C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    or      s3, a3, $zero              # s3 = 00000000
    sw      $ra, 0x0034($sp)
    sw      s1, 0x0028($sp)
    sw      s0, 0x0024($sp)
    sw      a1, 0x0094($sp)
    sw      a2, 0x0098($sp)
    addiu   a0, $sp, 0x0064            # a0 = FFFFFFD4
    jal     func_80063CCC              # Vec3f_CopyVec3s
    addiu   a1, s2, 0x000E             # a1 = 0000000E
    lw      s0, 0x02C4(s3)             # 000002C4
    lui     v0, 0x800E                 # v0 = 800E0000
    addiu   v0, v0, 0x79F0             # v0 = 800E79F0
    addiu   s0, s0, 0xFFC0             # s0 = FFFFFFC0
    beq     s0, $zero, lbl_80015574
    sw      s0, 0x02C4(s3)             # 000002C4
    lw      t7, 0x0000(v0)             # 800E79F0
    swl     t7, 0x0000(s0)             # FFFFFFC0
    swr     t7, 0x0003(s0)             # FFFFFFC3
    lw      t6, 0x0004(v0)             # 800E79F4
    swl     t6, 0x0004(s0)             # FFFFFFC4
    swr     t6, 0x0007(s0)             # FFFFFFC7
    lw      t7, 0x0008(v0)             # 800E79F8
    swl     t7, 0x0008(s0)             # FFFFFFC8
    swr     t7, 0x000B(s0)             # FFFFFFCB
    lw      t6, 0x000C(v0)             # 800E79FC
    swl     t6, 0x000C(s0)             # FFFFFFCC
    swr     t6, 0x000F(s0)             # FFFFFFCF
    lw      t9, 0x0000(v0)             # 800E79F0
    swl     t9, 0x0010(s0)             # FFFFFFD0
    swr     t9, 0x0013(s0)             # FFFFFFD3
    lw      t8, 0x0004(v0)             # 800E79F4
    swl     t8, 0x0014(s0)             # FFFFFFD4
    swr     t8, 0x0017(s0)             # FFFFFFD7
    lw      t9, 0x0008(v0)             # 800E79F8
    swl     t9, 0x0018(s0)             # FFFFFFD8
    swr     t9, 0x001B(s0)             # FFFFFFDB
    lw      t8, 0x000C(v0)             # 800E79FC
    swl     t8, 0x001C(s0)             # FFFFFFDC
    swr     t8, 0x001F(s0)             # FFFFFFDF
    lw      t1, 0x0000(v0)             # 800E79F0
    swl     t1, 0x0020(s0)             # FFFFFFE0
    swr     t1, 0x0023(s0)             # FFFFFFE3
    lw      t0, 0x0004(v0)             # 800E79F4
    swl     t0, 0x0024(s0)             # FFFFFFE4
    swr     t0, 0x0027(s0)             # FFFFFFE7
    lw      t1, 0x0008(v0)             # 800E79F8
    swl     t1, 0x0028(s0)             # FFFFFFE8
    swr     t1, 0x002B(s0)             # FFFFFFEB
    lw      t0, 0x000C(v0)             # 800E79FC
    swl     t0, 0x002C(s0)             # FFFFFFEC
    swr     t0, 0x002F(s0)             # FFFFFFEF
    lw      t3, 0x0000(v0)             # 800E79F0
    swl     t3, 0x0030(s0)             # FFFFFFF0
    swr     t3, 0x0033(s0)             # FFFFFFF3
    lw      t2, 0x0004(v0)             # 800E79F4
    swl     t2, 0x0034(s0)             # FFFFFFF4
    swr     t2, 0x0037(s0)             # FFFFFFF7
    lw      t3, 0x0008(v0)             # 800E79F8
    swl     t3, 0x0038(s0)             # FFFFFFF8
    swr     t3, 0x003B(s0)             # FFFFFFFB
    lw      t2, 0x000C(v0)             # 800E79FC
    swl     t2, 0x003C(s0)             # FFFFFFFC
    swr     t2, 0x003F(s0)             # FFFFFFFF
    lw      t4, 0x0094($sp)
    lbu     t6, 0x019F(s2)             # 0000019F
    lw      t5, 0x0004(t4)             # 00000004
    mtc1    t6, $f8                    # $f8 = 0.00
    mtc1    t5, $f4                    # $f4 = 0.00
    cvt.s.w $f10, $f8
    bgez    t6, lbl_800151F8
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f10, $f10, $f16
lbl_800151F8:
    div.s   $f0, $f6, $f10
    addiu   t7, $sp, 0x007C            # t7 = FFFFFFEC
    addiu   t8, $sp, 0x0074            # t8 = FFFFFFE4
    addiu   t9, $sp, 0x0070            # t9 = FFFFFFE0
    sw      t9, 0x0018($sp)
    sw      t8, 0x0014($sp)
    sw      t7, 0x0010($sp)
    or      a0, s2, $zero              # a0 = 00000000
    lw      a1, 0x0098($sp)
    addiu   a3, $sp, 0x0084            # a3 = FFFFFFF4
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    lh      t0, 0x007C($sp)
    lh      t1, 0x007E($sp)
    lh      t2, 0x0080($sp)
    mtc1    t0, $f18                   # $f18 = 0.00
    mtc1    t1, $f8                    # $f8 = 0.00
    mtc1    t2, $f6                    # $f6 = 0.00
    cvt.s.w $f4, $f18
    addiu   s1, $sp, 0x004C            # s1 = FFFFFFBC
    or      a2, s1, $zero              # a2 = FFFFFFBC
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFC8
    addiu   a1, $sp, 0x0064            # a1 = FFFFFFD4
    cvt.s.w $f16, $f8
    swc1    $f4, 0x0058($sp)
    cvt.s.w $f10, $f6
    swc1    $f16, 0x005C($sp)
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f10, 0x0060($sp)
    or      a0, s1, $zero              # a0 = FFFFFFBC
    jal     func_80063DDC
    lui     a1, 0x4120                 # a1 = 41200000
    lwc1    $f18, 0x004C($sp)
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFC8
    addiu   a1, $sp, 0x0064            # a1 = FFFFFFD4
    trunc.w.s $f4, $f18
    or      a2, s1, $zero              # a2 = FFFFFFBC
    mfc1    t4, $f4
    nop
    sh      t4, 0x0000(s0)             # FFFFFFC0
    lwc1    $f8, 0x0050($sp)
    trunc.w.s $f16, $f8
    mfc1    t6, $f16
    nop
    sh      t6, 0x0002(s0)             # FFFFFFC2
    lwc1    $f6, 0x0054($sp)
    trunc.w.s $f10, $f6
    mfc1    t8, $f10
    nop
    sh      t8, 0x0004(s0)             # FFFFFFC4
    lbu     t9, 0x0070($sp)
    sb      t9, 0x000C(s0)             # FFFFFFCC
    lbu     t0, 0x0071($sp)
    sb      t0, 0x000D(s0)             # FFFFFFCD
    lbu     t1, 0x0072($sp)
    sb      t1, 0x000E(s0)             # FFFFFFCE
    lbu     t2, 0x0073($sp)
    sb      t2, 0x000F(s0)             # FFFFFFCF
    lh      t3, 0x0084($sp)
    lh      t4, 0x0086($sp)
    lh      t5, 0x0088($sp)
    mtc1    t3, $f18                   # $f18 = 0.00
    mtc1    t4, $f8                    # $f8 = 0.00
    mtc1    t5, $f6                    # $f6 = 0.00
    cvt.s.w $f4, $f18
    cvt.s.w $f16, $f8
    swc1    $f4, 0x0058($sp)
    cvt.s.w $f10, $f6
    swc1    $f16, 0x005C($sp)
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f10, 0x0060($sp)
    or      a0, s1, $zero              # a0 = FFFFFFBC
    jal     func_80063DDC
    lui     a1, 0x4120                 # a1 = 41200000
    lwc1    $f18, 0x004C($sp)
    lui     $at, 0x4F80                # $at = 4F800000
    trunc.w.s $f4, $f18
    mfc1    t7, $f4
    nop
    sh      t7, 0x0010(s0)             # FFFFFFD0
    lwc1    $f8, 0x0050($sp)
    trunc.w.s $f16, $f8
    mfc1    t9, $f16
    nop
    sh      t9, 0x0012(s0)             # FFFFFFD2
    lwc1    $f6, 0x0054($sp)
    trunc.w.s $f10, $f6
    mfc1    t1, $f10
    nop
    sh      t1, 0x0014(s0)             # FFFFFFD4
    lbu     t2, 0x0074($sp)
    sb      t2, 0x001C(s0)             # FFFFFFDC
    lbu     t3, 0x0075($sp)
    sb      t3, 0x001D(s0)             # FFFFFFDD
    lbu     t4, 0x0076($sp)
    sb      t4, 0x001E(s0)             # FFFFFFDE
    lbu     t5, 0x0077($sp)
    sb      t5, 0x001F(s0)             # FFFFFFDF
    lw      t6, 0x0094($sp)
    lbu     t8, 0x019F(s2)             # 0000019F
    lw      t7, 0x001C(t6)             # 0000001C
    mtc1    t8, $f8                    # $f8 = 0.00
    mtc1    t7, $f18                   # $f18 = 0.00
    cvt.s.w $f16, $f8
    bgez    t8, lbl_800153B0
    cvt.s.w $f4, $f18
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f16, $f16, $f6
lbl_800153B0:
    div.s   $f0, $f4, $f16
    lw      a1, 0x0098($sp)
    addiu   t9, $sp, 0x007C            # t9 = FFFFFFEC
    addiu   t0, $sp, 0x0074            # t0 = FFFFFFE4
    addiu   t1, $sp, 0x0070            # t1 = FFFFFFE0
    sw      t1, 0x0018($sp)
    sw      t0, 0x0014($sp)
    sw      t9, 0x0010($sp)
    or      a0, s2, $zero              # a0 = 00000000
    addiu   a3, $sp, 0x0084            # a3 = FFFFFFF4
    addiu   a1, a1, 0x0001             # a1 = 00000001
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    lh      t2, 0x0084($sp)
    lh      t3, 0x0086($sp)
    lh      t4, 0x0088($sp)
    mtc1    t2, $f10                   # $f10 = 0.00
    mtc1    t3, $f8                    # $f8 = 0.00
    mtc1    t4, $f4                    # $f4 = 0.00
    cvt.s.w $f18, $f10
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFC8
    addiu   a1, $sp, 0x0064            # a1 = FFFFFFD4
    or      a2, s1, $zero              # a2 = FFFFFFBC
    cvt.s.w $f6, $f8
    swc1    $f18, 0x0058($sp)
    cvt.s.w $f16, $f4
    swc1    $f6, 0x005C($sp)
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f16, 0x0060($sp)
    or      a0, s1, $zero              # a0 = FFFFFFBC
    jal     func_80063DDC
    lui     a1, 0x4120                 # a1 = 41200000
    lwc1    $f10, 0x004C($sp)
    addiu   a0, $sp, 0x0058            # a0 = FFFFFFC8
    addiu   a1, $sp, 0x0064            # a1 = FFFFFFD4
    trunc.w.s $f18, $f10
    or      a2, s1, $zero              # a2 = FFFFFFBC
    mfc1    t6, $f18
    nop
    sh      t6, 0x0020(s0)             # FFFFFFE0
    lwc1    $f8, 0x0050($sp)
    trunc.w.s $f6, $f8
    mfc1    t8, $f6
    nop
    sh      t8, 0x0022(s0)             # FFFFFFE2
    lwc1    $f4, 0x0054($sp)
    trunc.w.s $f16, $f4
    mfc1    t0, $f16
    nop
    sh      t0, 0x0024(s0)             # FFFFFFE4
    lbu     t1, 0x0074($sp)
    sb      t1, 0x002C(s0)             # FFFFFFEC
    lbu     t2, 0x0075($sp)
    sb      t2, 0x002D(s0)             # FFFFFFED
    lbu     t3, 0x0076($sp)
    sb      t3, 0x002E(s0)             # FFFFFFEE
    lbu     t4, 0x0077($sp)
    sb      t4, 0x002F(s0)             # FFFFFFEF
    lh      t5, 0x007C($sp)
    lh      t6, 0x007E($sp)
    lh      t7, 0x0080($sp)
    mtc1    t5, $f10                   # $f10 = 0.00
    mtc1    t6, $f8                    # $f8 = 0.00
    mtc1    t7, $f4                    # $f4 = 0.00
    cvt.s.w $f18, $f10
    cvt.s.w $f6, $f8
    swc1    $f18, 0x0058($sp)
    cvt.s.w $f16, $f4
    swc1    $f6, 0x005C($sp)
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f16, 0x0060($sp)
    or      a0, s1, $zero              # a0 = FFFFFFBC
    jal     func_80063DDC
    lui     a1, 0x4120                 # a1 = 41200000
    lwc1    $f10, 0x004C($sp)
    trunc.w.s $f18, $f10
    mfc1    t9, $f18
    nop
    sh      t9, 0x0030(s0)             # FFFFFFF0
    lwc1    $f8, 0x0050($sp)
    trunc.w.s $f6, $f8
    mfc1    t1, $f6
    nop
    sh      t1, 0x0032(s0)             # FFFFFFF2
    lwc1    $f4, 0x0054($sp)
    lui     t1, 0x0600                 # t1 = 06000000
    trunc.w.s $f16, $f4
    mfc1    t3, $f16
    nop
    sh      t3, 0x0034(s0)             # FFFFFFF4
    lbu     t4, 0x0070($sp)
    sb      t4, 0x003C(s0)             # FFFFFFFC
    lbu     t5, 0x0071($sp)
    sb      t5, 0x003D(s0)             # FFFFFFFD
    lbu     t6, 0x0072($sp)
    sb      t6, 0x003E(s0)             # FFFFFFFE
    lbu     t7, 0x0073($sp)
    sb      t7, 0x003F(s0)             # FFFFFFFF
    lw      v0, 0x02D0(s3)             # 000002D0
    lui     t9, 0x0100                 # t9 = 01000000
    ori     t9, t9, 0x4008             # t9 = 01004008
    addiu   t8, v0, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s3)             # 000002D0
    sw      s0, 0x0004(v0)             # 00000004
    sw      t9, 0x0000(v0)             # 00000000
    lw      v0, 0x02D0(s3)             # 000002D0
    ori     t1, t1, 0x0204             # t1 = 06000204
    addiu   t2, $zero, 0x0406          # t2 = 00000406
    addiu   t0, v0, 0x0008             # t0 = 00000008
    sw      t0, 0x02D0(s3)             # 000002D0
    sw      t2, 0x0004(v0)             # 00000004
    sw      t1, 0x0000(v0)             # 00000000
lbl_80015574:
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0024($sp)
    lw      s1, 0x0028($sp)
    lw      s2, 0x002C($sp)
    lw      s3, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_80015590:
# MqDbg: EffectBlure_DrawElemHermiteInterpolation
    addiu   $sp, $sp, 0xFDF8           # $sp -= 0x208
    sw      s4, 0x0068($sp)
    sw      s2, 0x0060($sp)
    sw      s0, 0x0058($sp)
    or      s0, a0, $zero              # s0 = 00000000
    or      s2, a1, $zero              # s2 = 00000000
    or      s4, a2, $zero              # s4 = 00000000
    sw      $ra, 0x007C($sp)
    sw      s8, 0x0078($sp)
    sw      s7, 0x0074($sp)
    sw      s6, 0x0070($sp)
    sw      s5, 0x006C($sp)
    sw      s3, 0x0064($sp)
    sw      s1, 0x005C($sp)
    sdc1    $f30, 0x0050($sp)
    sdc1    $f28, 0x0048($sp)
    sdc1    $f26, 0x0040($sp)
    sdc1    $f24, 0x0038($sp)
    sdc1    $f22, 0x0030($sp)
    sdc1    $f20, 0x0028($sp)
    sw      a3, 0x0214($sp)
    addiu   a0, $sp, 0x0148            # a0 = FFFFFF40
    jal     func_80063CCC              # Vec3f_CopyVec3s
    addiu   a1, s0, 0x000E             # a1 = 0000000E
    lw      t6, 0x0004(s2)             # 00000004
    lbu     t7, 0x019F(s0)             # 0000019F
    addiu   s1, $sp, 0x01FC            # s1 = FFFFFFF4
    mtc1    t6, $f4                    # $f4 = 0.00
    mtc1    t7, $f8                    # $f8 = 0.00
    addiu   s3, $sp, 0x01F4            # s3 = FFFFFFEC
    cvt.s.w $f6, $f4
    bgez    t7, lbl_80015624
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f10, $f10, $f16
lbl_80015624:
    div.s   $f0, $f6, $f10
    addiu   t8, $sp, 0x01B4            # t8 = FFFFFFAC
    addiu   t9, $sp, 0x01B0            # t9 = FFFFFFA8
    sw      t9, 0x0018($sp)
    sw      t8, 0x0014($sp)
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, s4, $zero              # a1 = 00000000
    or      a3, s1, $zero              # a3 = FFFFFFF4
    sw      s3, 0x0010($sp)
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    addiu   a0, $sp, 0x01DC            # a0 = FFFFFFD4
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s1, $zero              # a1 = FFFFFFF4
    addiu   a0, $sp, 0x01D0            # a0 = FFFFFFC8
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s3, $zero              # a1 = FFFFFFEC
    lw      t1, 0x001C(s2)             # 0000001C
    lbu     t2, 0x019F(s0)             # 0000019F
    mtc1    t1, $f18                   # $f18 = 0.00
    mtc1    t2, $f8                    # $f8 = 0.00
    cvt.s.w $f4, $f18
    bgez    t2, lbl_80015698
    cvt.s.w $f16, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f16, $f16, $f6
lbl_80015698:
    div.s   $f0, $f4, $f16
    addiu   t3, $sp, 0x01AC            # t3 = FFFFFFA4
    addiu   t4, $sp, 0x01A8            # t4 = FFFFFFA0
    sw      t4, 0x0018($sp)
    sw      t3, 0x0014($sp)
    or      a0, s0, $zero              # a0 = 00000000
    addiu   a1, s4, 0x0001             # a1 = 00000001
    or      a3, s1, $zero              # a3 = FFFFFFF4
    sw      s3, 0x0010($sp)
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    addiu   s5, $sp, 0x019C            # s5 = FFFFFF94
    or      a0, s5, $zero              # a0 = FFFFFF94
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s1, $zero              # a1 = FFFFFFF4
    addiu   s6, $sp, 0x0190            # s6 = FFFFFF88
    or      a0, s6, $zero              # a0 = FFFFFF88
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s3, $zero              # a1 = FFFFFFEC
    lhu     t5, 0x0014(s2)             # 00000014
    addiu   $at, $zero, 0x0002         # $at = 00000002
    andi    t6, t5, 0x0003             # t6 = 00000000
    bne     t6, $at, lbl_80015724
    or      a0, s5, $zero              # a0 = FFFFFF94
    addiu   a1, $sp, 0x01DC            # a1 = FFFFFFD4
    jal     func_80063D48              # Vec3f_Sub
    addiu   a2, $sp, 0x01C4            # a2 = FFFFFFBC
    addiu   s7, $sp, 0x01B8            # s7 = FFFFFFB0
    or      a2, s7, $zero              # a2 = FFFFFFB0
    or      a0, s6, $zero              # a0 = FFFFFF88
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x01D0            # a1 = FFFFFFC8
    b       lbl_800157C8
    lui     $at, 0x3F00                # $at = 3F000000
lbl_80015724:
    lw      t7, -0x0014(s2)            # FFFFFFEC
    lbu     t8, 0x019F(s0)             # 0000019F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t7, $f10                   # $f10 = 0.00
    mtc1    t8, $f8                    # $f8 = 0.00
    cvt.s.w $f18, $f10
    bgez    t8, lbl_80015750
    cvt.s.w $f6, $f8
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f6, $f6, $f4
lbl_80015750:
    div.s   $f0, $f18, $f6
    addiu   t9, $sp, 0x01EC            # t9 = FFFFFFE4
    addiu   t1, $sp, 0x01E8            # t1 = FFFFFFE0
    sw      t1, 0x0018($sp)
    sw      t9, 0x0014($sp)
    or      a0, s0, $zero              # a0 = 00000000
    addiu   a1, s4, 0xFFFF             # a1 = FFFFFFFF
    or      a3, s1, $zero              # a3 = FFFFFFF4
    sw      s3, 0x0010($sp)
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    addiu   s7, $sp, 0x0134            # s7 = FFFFFF2C
    or      a0, s7, $zero              # a0 = FFFFFF2C
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s1, $zero              # a1 = FFFFFFF4
    addiu   s8, $sp, 0x0128            # s8 = FFFFFF20
    or      a0, s8, $zero              # a0 = FFFFFF20
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s3, $zero              # a1 = FFFFFFEC
    or      a0, s5, $zero              # a0 = FFFFFF94
    or      a1, s7, $zero              # a1 = FFFFFF2C
    jal     func_80063D48              # Vec3f_Sub
    addiu   a2, $sp, 0x01C4            # a2 = FFFFFFBC
    addiu   s7, $sp, 0x01B8            # s7 = FFFFFFB0
    or      a2, s7, $zero              # a2 = FFFFFFB0
    or      a0, s6, $zero              # a0 = FFFFFF88
    jal     func_80063D48              # Vec3f_Sub
    or      a1, s8, $zero              # a1 = FFFFFF20
    lui     $at, 0x3F00                # $at = 3F000000
lbl_800157C8:
    mtc1    $at, $f20                  # $f20 = 0.50
    addiu   a0, $sp, 0x01C4            # a0 = FFFFFFBC
    mfc1    a1, $f20
    jal     func_80063DDC
    nop
    mfc1    a1, $f20
    jal     func_80063DDC
    or      a0, s7, $zero              # a0 = FFFFFFB0
    lhu     t2, 0x002C(s2)             # 0000002C
    addiu   $at, $zero, 0x0002         # $at = 00000002
    andi    t3, t2, 0x0003             # t3 = 00000000
    bnel    t3, $at, lbl_80015830
    lw      t4, 0x0034(s2)             # 00000034
    addiu   s2, $sp, 0x0184            # s2 = FFFFFF7C
    or      a2, s2, $zero              # a2 = FFFFFF7C
    or      a0, s5, $zero              # a0 = FFFFFF94
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x01DC            # a1 = FFFFFFD4
    addiu   s0, $sp, 0x0178            # s0 = FFFFFF70
    or      a2, s0, $zero              # a2 = FFFFFF70
    or      a0, s6, $zero              # a0 = FFFFFF88
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x01D0            # a1 = FFFFFFC8
    b       lbl_800158D4
    mfc1    a1, $f20
    lw      t4, 0x0034(s2)             # FFFFFFB0
lbl_80015830:
    lbu     t5, 0x019F(s0)             # 0000010F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t4, $f16                   # $f16 = 0.00
    mtc1    t5, $f8                    # $f8 = 0.00
    cvt.s.w $f10, $f16
    bgez    t5, lbl_80015858
    cvt.s.w $f4, $f8
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f4, $f4, $f18
lbl_80015858:
    div.s   $f0, $f10, $f4
    addiu   t6, $sp, 0x01EC            # t6 = FFFFFFE4
    addiu   t7, $sp, 0x01E8            # t7 = FFFFFFE0
    sw      t7, 0x0018($sp)
    sw      t6, 0x0014($sp)
    or      a0, s0, $zero              # a0 = FFFFFF70
    addiu   a1, s4, 0x0002             # a1 = 00000002
    or      a3, s1, $zero              # a3 = FFFFFFF4
    sw      s3, 0x0010($sp)
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    addiu   s0, $sp, 0x011C            # s0 = FFFFFF14
    or      a0, s0, $zero              # a0 = FFFFFF14
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s1, $zero              # a1 = FFFFFFF4
    addiu   s1, $sp, 0x0110            # s1 = FFFFFF08
    or      a0, s1, $zero              # a0 = FFFFFF08
    jal     func_80063CCC              # Vec3f_CopyVec3s
    or      a1, s3, $zero              # a1 = FFFFFFEC
    addiu   s2, $sp, 0x0184            # s2 = FFFFFF7C
    or      a2, s2, $zero              # a2 = FFFFFF7C
    or      a0, s0, $zero              # a0 = FFFFFF14
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x01DC            # a1 = FFFFFFD4
    addiu   s0, $sp, 0x0178            # s0 = FFFFFF70
    or      a2, s0, $zero              # a2 = FFFFFF70
    or      a0, s1, $zero              # a0 = FFFFFF08
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x01D0            # a1 = FFFFFFC8
    mfc1    a1, $f20
lbl_800158D4:
    jal     func_80063DDC
    or      a0, s2, $zero              # a0 = FFFFFF7C
    mfc1    a1, $f20
    jal     func_80063DDC
    or      a0, s0, $zero              # a0 = FFFFFF70
    lw      v0, 0x0214($sp)
    addiu   s7, $sp, 0x0168            # s7 = FFFFFF60
    addiu   a0, $sp, 0x01DC            # a0 = FFFFFFD4
    lw      s0, 0x02C4(v0)             # 000002C4
    addiu   a1, $sp, 0x0148            # a1 = FFFFFF40
    addiu   s0, s0, 0xFF00             # s0 = FFFFFE70
    beq     s0, $zero, lbl_80015F1C
    sw      s0, 0x02C4(v0)             # 000002C4
    jal     func_80063D48              # Vec3f_Sub
    or      a2, s7, $zero              # a2 = FFFFFF60
    lui     $at, 0x4120                # $at = 41200000
    mtc1    $at, $f30                  # $f30 = 10.00
    or      a0, s7, $zero              # a0 = FFFFFF60
    mfc1    a1, $f30
    jal     func_80063DDC
    nop
    addiu   s8, $sp, 0x015C            # s8 = FFFFFF54
    or      a2, s8, $zero              # a2 = FFFFFF54
    addiu   a0, $sp, 0x01D0            # a0 = FFFFFFC8
    jal     func_80063D48              # Vec3f_Sub
    addiu   a1, $sp, 0x0148            # a1 = FFFFFF40
    mfc1    a1, $f30
    jal     func_80063DDC
    or      a0, s8, $zero              # a0 = FFFFFF54
    addiu   a0, $sp, 0x0158            # a0 = FFFFFF50
    jal     func_800646C8
    addiu   a1, $sp, 0x01B4            # a1 = FFFFFFAC
    addiu   a0, $sp, 0x0154            # a0 = FFFFFF4C
    jal     func_800646C8
    addiu   a1, $sp, 0x01B0            # a1 = FFFFFFA8
    lui     s6, 0x800E                 # s6 = 800E0000
    addiu   s6, s6, 0x7A00             # s6 = 800E7A00
    lw      t9, 0x0000(s6)             # 800E7A00
    swl     t9, 0x0000(s0)             # FFFFFE70
    swr     t9, 0x0003(s0)             # FFFFFE73
    lw      t8, 0x0004(s6)             # 800E7A04
    swl     t8, 0x0004(s0)             # FFFFFE74
    swr     t8, 0x0007(s0)             # FFFFFE77
    lw      t9, 0x0008(s6)             # 800E7A08
    swl     t9, 0x0008(s0)             # FFFFFE78
    swr     t9, 0x000B(s0)             # FFFFFE7B
    lw      t8, 0x000C(s6)             # 800E7A0C
    swl     t8, 0x000C(s0)             # FFFFFE7C
    swr     t8, 0x000F(s0)             # FFFFFE7F
    lw      t2, 0x0000(s6)             # 800E7A00
    swl     t2, 0x0010(s0)             # FFFFFE80
    swr     t2, 0x0013(s0)             # FFFFFE83
    lw      t1, 0x0004(s6)             # 800E7A04
    swl     t1, 0x0014(s0)             # FFFFFE84
    swr     t1, 0x0017(s0)             # FFFFFE87
    lw      t2, 0x0008(s6)             # 800E7A08
    swl     t2, 0x0018(s0)             # FFFFFE88
    swr     t2, 0x001B(s0)             # FFFFFE8B
    lw      t1, 0x000C(s6)             # 800E7A0C
    swl     t1, 0x001C(s0)             # FFFFFE8C
    swr     t1, 0x001F(s0)             # FFFFFE8F
    jal     func_800CD628
    lwc1    $f12, 0x0168($sp)
    trunc.w.s $f6, $f0
    mfc1    t4, $f6
    nop
    sh      t4, 0x0000(s0)             # FFFFFE70
    jal     func_800CD628
    lwc1    $f12, 0x016C($sp)
    trunc.w.s $f16, $f0
    mfc1    t6, $f16
    nop
    sh      t6, 0x0002(s0)             # FFFFFE72
    jal     func_800CD628
    lwc1    $f12, 0x0170($sp)
    trunc.w.s $f8, $f0
    mfc1    t8, $f8
    nop
    sh      t8, 0x0004(s0)             # FFFFFE74
    lbu     t9, 0x0158($sp)
    sb      t9, 0x000C(s0)             # FFFFFE7C
    lbu     t1, 0x0159($sp)
    sb      t1, 0x000D(s0)             # FFFFFE7D
    lbu     t2, 0x015A($sp)
    sb      t2, 0x000E(s0)             # FFFFFE7E
    lbu     t3, 0x015B($sp)
    sb      t3, 0x000F(s0)             # FFFFFE7F
    jal     func_800CD628
    lwc1    $f12, 0x015C($sp)
    trunc.w.s $f18, $f0
    mfc1    t5, $f18
    nop
    sh      t5, 0x0010(s0)             # FFFFFE80
    jal     func_800CD628
    lwc1    $f12, 0x0160($sp)
    trunc.w.s $f10, $f0
    mfc1    t7, $f10
    nop
    sh      t7, 0x0012(s0)             # FFFFFE82
    jal     func_800CD628
    lwc1    $f12, 0x0164($sp)
    trunc.w.s $f4, $f0
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    addiu   s4, $zero, 0x0003          # s4 = 00000003
    addiu   s2, s0, 0x0030             # s2 = FFFFFEA0
    mfc1    t9, $f4
    addiu   s1, s0, 0x0020             # s1 = FFFFFE90
    sh      t9, 0x0014(s0)             # FFFFFE84
    lbu     t1, 0x0154($sp)
    sb      t1, 0x001C(s0)             # FFFFFE8C
    lbu     t2, 0x0155($sp)
    sb      t2, 0x001D(s0)             # FFFFFE8D
    lbu     t3, 0x0156($sp)
    sb      t3, 0x001E(s0)             # FFFFFE8E
    lbu     t4, 0x0157($sp)
    sb      t4, 0x001F(s0)             # FFFFFE8F
lbl_80015AA4:
    mtc1    s3, $f6                    # $f6 = 0.00
    lui     $at, 0x40E0                # $at = 40E00000
    mtc1    $at, $f8                   # $f8 = 7.00
    cvt.s.w $f16, $f6
    lui     $at, 0x4040                # $at = 40400000
    mtc1    $at, $f18                  # $f18 = 3.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    or      s5, s4, $zero              # s5 = 00000003
    div.s   $f28, $f16, $f8
    lwc1    $f8, 0x01DC($sp)
    addiu   a0, $sp, 0x00FC            # a0 = FFFFFEF4
    addiu   a1, $sp, 0x0148            # a1 = FFFFFF40
    or      a2, s7, $zero              # a2 = FFFFFF60
    mul.s   $f0, $f28, $f28
    nop
    mul.s   $f2, $f0, $f28
    add.s   $f6, $f0, $f0
    mul.s   $f14, $f0, $f18
    add.s   $f12, $f2, $f2
    sub.s   $f16, $f2, $f6
    sub.s   $f10, $f12, $f14
    sub.s   $f26, $f14, $f12
    add.s   $f24, $f10, $f4
    lwc1    $f10, 0x019C($sp)
    add.s   $f22, $f16, $f28
    mul.s   $f18, $f24, $f8
    lwc1    $f16, 0x01C4($sp)
    sub.s   $f20, $f2, $f0
    mul.s   $f4, $f26, $f10
    add.s   $f6, $f18, $f4
    mul.s   $f8, $f22, $f16
    lwc1    $f18, 0x0184($sp)
    mul.s   $f4, $f20, $f18
    lwc1    $f18, 0x01A0($sp)
    add.s   $f10, $f6, $f8
    lwc1    $f6, 0x01E0($sp)
    mul.s   $f8, $f24, $f6
    add.s   $f16, $f10, $f4
    mul.s   $f10, $f26, $f18
    swc1    $f16, 0x00FC($sp)
    lwc1    $f16, 0x01C8($sp)
    mul.s   $f6, $f22, $f16
    add.s   $f4, $f8, $f10
    lwc1    $f8, 0x0188($sp)
    mul.s   $f10, $f20, $f8
    lwc1    $f8, 0x01A4($sp)
    add.s   $f18, $f4, $f6
    lwc1    $f4, 0x01E4($sp)
    mul.s   $f6, $f24, $f4
    add.s   $f16, $f18, $f10
    mul.s   $f18, $f26, $f8
    swc1    $f16, 0x0100($sp)
    lwc1    $f16, 0x01CC($sp)
    mul.s   $f4, $f22, $f16
    add.s   $f10, $f6, $f18
    lwc1    $f6, 0x018C($sp)
    mul.s   $f18, $f20, $f6
    add.s   $f8, $f10, $f4
    add.s   $f16, $f8, $f18
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f16, 0x0104($sp)
    mfc1    a1, $f30
    jal     func_80063DDC
    or      a0, s7, $zero              # a0 = FFFFFF60
    lwc1    $f10, 0x01D0($sp)
    lwc1    $f6, 0x0190($sp)
    lwc1    $f16, 0x01B8($sp)
    mul.s   $f4, $f24, $f10
    addiu   a0, $sp, 0x00FC            # a0 = FFFFFEF4
    addiu   a1, $sp, 0x0148            # a1 = FFFFFF40
    mul.s   $f8, $f26, $f6
    or      a2, s8, $zero              # a2 = FFFFFF54
    mul.s   $f10, $f22, $f16
    add.s   $f18, $f4, $f8
    lwc1    $f4, 0x0178($sp)
    mul.s   $f8, $f20, $f4
    add.s   $f6, $f18, $f10
    lwc1    $f18, 0x01D4($sp)
    lwc1    $f4, 0x0194($sp)
    mul.s   $f10, $f24, $f18
    add.s   $f16, $f6, $f8
    mul.s   $f6, $f26, $f4
    swc1    $f16, 0x00FC($sp)
    lwc1    $f16, 0x01BC($sp)
    mul.s   $f18, $f22, $f16
    add.s   $f8, $f10, $f6
    lwc1    $f10, 0x017C($sp)
    mul.s   $f6, $f20, $f10
    lwc1    $f10, 0x0198($sp)
    add.s   $f4, $f8, $f18
    lwc1    $f8, 0x01D8($sp)
    mul.s   $f18, $f24, $f8
    add.s   $f16, $f4, $f6
    mul.s   $f4, $f26, $f10
    swc1    $f16, 0x0100($sp)
    lwc1    $f16, 0x01C0($sp)
    mul.s   $f8, $f22, $f16
    add.s   $f6, $f18, $f4
    lwc1    $f18, 0x0180($sp)
    mul.s   $f4, $f20, $f18
    add.s   $f10, $f6, $f8
    add.s   $f16, $f10, $f4
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f16, 0x0104($sp)
    mfc1    a1, $f30
    jal     func_80063DDC
    or      a0, s8, $zero              # a0 = FFFFFF54
    lw      t6, 0x0000(s6)             # 800E7A00
    swl     t6, 0x0000(s1)             # FFFFFE90
    swr     t6, 0x0003(s1)             # FFFFFE93
    lw      t5, 0x0004(s6)             # 800E7A04
    swl     t5, 0x0004(s1)             # FFFFFE94
    swr     t5, 0x0007(s1)             # FFFFFE97
    lw      t6, 0x0008(s6)             # 800E7A08
    swl     t6, 0x0008(s1)             # FFFFFE98
    swr     t6, 0x000B(s1)             # FFFFFE9B
    lw      t5, 0x000C(s6)             # 800E7A0C
    swl     t5, 0x000C(s1)             # FFFFFE9C
    swr     t5, 0x000F(s1)             # FFFFFE9F
    lw      t8, 0x0000(s6)             # 800E7A00
    swl     t8, 0x0000(s2)             # FFFFFEA0
    swr     t8, 0x0003(s2)             # FFFFFEA3
    lw      t7, 0x0004(s6)             # 800E7A04
    swl     t7, 0x0004(s2)             # FFFFFEA4
    swr     t7, 0x0007(s2)             # FFFFFEA7
    lw      t8, 0x0008(s6)             # 800E7A08
    swl     t8, 0x0008(s2)             # FFFFFEA8
    swr     t8, 0x000B(s2)             # FFFFFEAB
    lw      t7, 0x000C(s6)             # 800E7A0C
    swl     t7, 0x000C(s2)             # FFFFFEAC
    swr     t7, 0x000F(s2)             # FFFFFEAF
    jal     func_800CD628
    lwc1    $f12, 0x0168($sp)
    trunc.w.s $f6, $f0
    mfc1    t1, $f6
    nop
    sh      t1, 0x0000(s1)             # FFFFFE90
    jal     func_800CD628
    lwc1    $f12, 0x016C($sp)
    trunc.w.s $f8, $f0
    mfc1    t3, $f8
    nop
    sh      t3, 0x0002(s1)             # FFFFFE92
    jal     func_800CD628
    lwc1    $f12, 0x0170($sp)
    trunc.w.s $f18, $f0
    mfc1    a2, $f28
    mfc1    t5, $f18
    nop
    sh      t5, 0x0004(s1)             # FFFFFE94
    lbu     a1, 0x01AC($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B4($sp)
    sb      v0, 0x000C(s1)             # FFFFFE9C
    mfc1    a2, $f28
    lbu     a1, 0x01AD($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B5($sp)
    sb      v0, 0x000D(s1)             # FFFFFE9D
    mfc1    a2, $f28
    lbu     a1, 0x01AE($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B6($sp)
    sb      v0, 0x000E(s1)             # FFFFFE9E
    mfc1    a2, $f28
    lbu     a1, 0x01AF($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B7($sp)
    sb      v0, 0x000F(s1)             # FFFFFE9F
    jal     func_800CD628
    lwc1    $f12, 0x015C($sp)
    trunc.w.s $f10, $f0
    mfc1    t7, $f10
    nop
    sh      t7, 0x0000(s2)             # FFFFFEA0
    jal     func_800CD628
    lwc1    $f12, 0x0160($sp)
    trunc.w.s $f4, $f0
    mfc1    t9, $f4
    nop
    sh      t9, 0x0002(s2)             # FFFFFEA2
    jal     func_800CD628
    lwc1    $f12, 0x0164($sp)
    trunc.w.s $f16, $f0
    mfc1    a2, $f28
    mfc1    t2, $f16
    nop
    sh      t2, 0x0004(s2)             # FFFFFEA4
    lbu     a1, 0x01A8($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B0($sp)
    sb      v0, 0x000C(s2)             # FFFFFEAC
    mfc1    a2, $f28
    lbu     a1, 0x01A9($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B1($sp)
    sb      v0, 0x000D(s2)             # FFFFFEAD
    mfc1    a2, $f28
    lbu     a1, 0x01AA($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B2($sp)
    sb      v0, 0x000E(s2)             # FFFFFEAE
    mfc1    a2, $f28
    lbu     a1, 0x01AB($sp)
    jal     func_8001B9B4
    lbu     a0, 0x01B3($sp)
    sll     t3, s5,  4
    addu    t4, s0, t3
    sb      v0, 0x000F(t4)             # 0000000F
    addiu   s3, s3, 0x0001             # s3 = 00000002
    addiu   $at, $zero, 0x0008         # $at = 00000008
    addiu   s4, s4, 0x0002             # s4 = 00000005
    addiu   s2, s2, 0x0020             # s2 = FFFFFEC0
    bne     s3, $at, lbl_80015AA4
    addiu   s1, s1, 0x0020             # s1 = FFFFFEB0
    lw      t0, 0x0214($sp)
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t6, 0x0101                 # t6 = 01010000
    ori     t6, t6, 0x0020             # t6 = 01010020
    addiu   t5, v0, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(t0)             # 000002D0
    sw      s0, 0x0004(v0)             # 00000004
    sw      t6, 0x0000(v0)             # 00000000
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t8, 0x0600                 # t8 = 06000000
    ori     t8, t8, 0x0206             # t8 = 06000206
    addiu   t7, v0, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(t0)             # 000002D0
    addiu   t9, $zero, 0x0604          # t9 = 00000604
    sw      t9, 0x0004(v0)             # 00000004
    sw      t8, 0x0000(v0)             # 00000000
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t2, 0x0604                 # t2 = 06040000
    lui     t3, 0x0004                 # t3 = 00040000
    addiu   t1, v0, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(t0)             # 000002D0
    ori     t3, t3, 0x0A08             # t3 = 00040A08
    ori     t2, t2, 0x060A             # t2 = 0604060A
    sw      t2, 0x0000(v0)             # 00000000
    sw      t3, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t5, 0x0608                 # t5 = 06080000
    lui     t6, 0x0008                 # t6 = 00080000
    addiu   t4, v0, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(t0)             # 000002D0
    ori     t6, t6, 0x0E0C             # t6 = 00080E0C
    ori     t5, t5, 0x0A0E             # t5 = 06080A0E
    sw      t5, 0x0000(v0)             # 00000000
    sw      t6, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t8, 0x060C                 # t8 = 060C0000
    lui     t9, 0x000C                 # t9 = 000C0000
    addiu   t7, v0, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(t0)             # 000002D0
    ori     t9, t9, 0x1210             # t9 = 000C1210
    ori     t8, t8, 0x0E12             # t8 = 060C0E12
    sw      t8, 0x0000(v0)             # 00000000
    sw      t9, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t2, 0x0610                 # t2 = 06100000
    lui     t3, 0x0010                 # t3 = 00100000
    addiu   t1, v0, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(t0)             # 000002D0
    ori     t3, t3, 0x1614             # t3 = 00101614
    ori     t2, t2, 0x1216             # t2 = 06101216
    sw      t2, 0x0000(v0)             # 00000000
    sw      t3, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t5, 0x0614                 # t5 = 06140000
    lui     t6, 0x0014                 # t6 = 00140000
    addiu   t4, v0, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(t0)             # 000002D0
    ori     t6, t6, 0x1A18             # t6 = 00141A18
    ori     t5, t5, 0x161A             # t5 = 0614161A
    sw      t5, 0x0000(v0)             # 00000000
    sw      t6, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(t0)             # 000002D0
    lui     t8, 0x0618                 # t8 = 06180000
    lui     t9, 0x0018                 # t9 = 00180000
    addiu   t7, v0, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(t0)             # 000002D0
    ori     t9, t9, 0x1E1C             # t9 = 00181E1C
    ori     t8, t8, 0x1A1E             # t8 = 06181A1E
    sw      t8, 0x0000(v0)             # 00000000
    sw      t9, 0x0004(v0)             # 00000004
lbl_80015F1C:
    lw      $ra, 0x007C($sp)
    ldc1    $f20, 0x0028($sp)
    ldc1    $f22, 0x0030($sp)
    ldc1    $f24, 0x0038($sp)
    ldc1    $f26, 0x0040($sp)
    ldc1    $f28, 0x0048($sp)
    ldc1    $f30, 0x0050($sp)
    lw      s0, 0x0058($sp)
    lw      s1, 0x005C($sp)
    lw      s2, 0x0060($sp)
    lw      s3, 0x0064($sp)
    lw      s4, 0x0068($sp)
    lw      s5, 0x006C($sp)
    lw      s6, 0x0070($sp)
    lw      s7, 0x0074($sp)
    lw      s8, 0x0078($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0208           # $sp += 0x208


func_80015F64:
# MqDbg: EffectBlure_DrawSmooth
    addiu   $sp, $sp, 0xFEE8           # $sp -= 0x118
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    or      s4, a0, $zero              # s4 = 00000000
    or      s5, a1, $zero              # s5 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s1, s4, $zero              # s1 = 00000000
    lbu     v1, 0x019E(s4)             # 0000019E
    addiu   s3, $zero, 0x0018          # s3 = 00000018
    slti    $at, v1, 0x0002
    bnel    $at, $zero, lbl_80016214
    lw      $ra, 0x002C($sp)
    multu   v1, s3
    lhu     t6, 0x0014(s4)             # 00000014
    addiu   s0, s4, 0x0018             # s0 = 00000018
    addiu   s2, $zero, 0xFFFC          # s2 = FFFFFFFC
    andi    t8, t6, 0xFFFC             # t8 = 00000000
    sh      t8, 0x0014(s4)             # 00000014
    ori     t9, t8, 0x0002             # t9 = 00000002
    sh      t9, 0x0014(s4)             # 00000014
    mflo    t0
    addu    t1, s4, t0
    addiu   t2, t1, 0xFFE8             # t2 = FFFFFFE8
    sltu    $at, s0, t2
    beql    $at, $zero, lbl_80016010
    addiu   a2, $zero, 0x0018          # a2 = 00000018
lbl_80015FDC:
    jal     func_80014A04
    or      a0, s0, $zero              # a0 = 00000018
    lbu     t3, 0x019E(s1)             # 0000019E
    addiu   s0, s0, 0x0018             # s0 = 00000030
    multu   t3, s3
    mflo    t4
    addu    t5, s1, t4
    addiu   t6, t5, 0xFFE8             # t6 = FFFFFFE8
    sltu    $at, s0, t6
    bne     $at, $zero, lbl_80015FDC
    nop
    lbu     v1, 0x019E(s4)             # 0000019E
    addiu   a2, $zero, 0x0018          # a2 = 00000018
lbl_80016010:
    multu   v1, a2
    or      a0, s4, $zero              # a0 = 00000000
    or      a1, s5, $zero              # a1 = 00000000
    mflo    t7
    addu    v0, s4, t7
    lhu     t8, -0x0004(v0)            # FFFFFFFC
    and     t9, t8, s2
    sh      t9, -0x0004(v0)            # FFFFFFFC
    lbu     t0, 0x019E(s4)             # 0000019E
    multu   t0, a2
    mflo    t1
    addu    v0, s4, t1
    lhu     t2, -0x0004(v0)            # FFFFFFFC
    ori     t3, t2, 0x0002             # t3 = 00000002
    jal     func_80015088
    sh      t3, -0x0004(v0)            # FFFFFFFC
    lh      t4, 0x000E(s4)             # 0000000E
    lh      t5, 0x0010(s4)             # 00000010
    lh      t6, 0x0012(s4)             # 00000012
    mtc1    t4, $f4                    # $f4 = 0.00
    mtc1    t5, $f6                    # $f6 = 0.00
    mtc1    t6, $f8                    # $f8 = 0.00
    cvt.s.w $f4, $f4
    addiu   s0, $sp, 0x00CC            # s0 = FFFFFFB4
    or      a0, s0, $zero              # a0 = FFFFFFB4
    cvt.s.w $f6, $f6
    mfc1    a1, $f4
    cvt.s.w $f8, $f8
    mfc1    a2, $f6
    mfc1    a3, $f8
    jal     func_8008F82C              # guTranslateF
    nop
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f0, 0x603C($at)           # 8010603C
    addiu   s2, $sp, 0x008C            # s2 = FFFFFF74
    or      a0, s2, $zero              # a0 = FFFFFF74
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_8008F4A8              # guScaleF
    nop
    or      a0, s0, $zero              # a0 = FFFFFFB4
    or      a1, s2, $zero              # a1 = FFFFFF74
    jal     func_8008EDB8
    addiu   a2, $sp, 0x004C            # a2 = FFFFFF34
    or      a0, s5, $zero              # a0 = 00000000
    jal     func_8008FC98
    addiu   a1, $sp, 0x004C            # a1 = FFFFFF34
    beql    v0, $zero, lbl_80016214
    lw      $ra, 0x002C($sp)
    lw      a0, 0x02D0(s5)             # 000002D0
    lui     t8, 0xDA38                 # t8 = DA380000
    ori     t8, t8, 0x0003             # t8 = DA380003
    addiu   t7, a0, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s5)             # 000002D0
    sw      v0, 0x0004(a0)             # 00000004
    sw      t8, 0x0000(a0)             # 00000000
    lbu     t9, 0x019E(s4)             # 0000019E
    or      s2, $zero, $zero           # s2 = 00000000
    or      s0, s4, $zero              # s0 = 00000000
    multu   t9, s3
    addiu   s3, $zero, 0x0002          # s3 = 00000002
    mflo    t0
    addu    t1, s4, t0
    addiu   t2, t1, 0xFFE8             # t2 = FFFFFFE8
    sltu    $at, s4, t2
    beql    $at, $zero, lbl_80016214
    lw      $ra, 0x002C($sp)
lbl_80016120:
    lw      t3, 0x0000(s0)             # 00000000
    beql    t3, $zero, lbl_8001613C
    lbu     t5, 0x019E(s1)             # 0000019E
    lw      t4, 0x0018(s0)             # 00000018
    bnel    t4, $zero, lbl_80016158
    lhu     v0, 0x0014(s0)             # 00000014
    lbu     t5, 0x019E(s1)             # 0000019E
lbl_8001613C:
    sll     t6, t5,  2
    subu    t6, t6, t5
    sll     t6, t6,  3
    addu    v0, s1, t6
    b       lbl_80016200
    addiu   v0, v0, 0xFFE8             # v0 = FFFFFFE8
    lhu     v0, 0x0014(s0)             # 00000014
lbl_80016158:
    andi    v0, v0, 0x0003             # v0 = 00000000
    bne     v0, $zero, lbl_80016174
    nop
    lhu     t7, 0x002C(s0)             # 0000002C
    andi    t8, t7, 0x0003             # t8 = 00000000
    beql    t8, $zero, lbl_800161C0
    or      a0, s4, $zero              # a0 = 00000000
lbl_80016174:
    bne     s3, v0, lbl_8001618C
    nop
    lhu     t9, 0x002C(s0)             # 0000002C
    andi    t0, t9, 0x0003             # t0 = 00000000
    beql    t0, $zero, lbl_800161C0
    or      a0, s4, $zero              # a0 = 00000000
lbl_8001618C:
    bne     v0, $zero, lbl_800161A4
    nop
    lhu     t1, 0x002C(s0)             # 0000002C
    andi    t2, t1, 0x0003             # t2 = 00000000
    beql    s3, t2, lbl_800161C0
    or      a0, s4, $zero              # a0 = 00000000
lbl_800161A4:
    bne     s3, v0, lbl_800161D8
    or      a0, s4, $zero              # a0 = 00000000
    lhu     t3, 0x002C(s0)             # 0000002C
    andi    t4, t3, 0x0003             # t4 = 00000000
    bnel    s3, t4, lbl_800161DC
    or      a1, s0, $zero              # a1 = 00000000
    or      a0, s4, $zero              # a0 = 00000000
lbl_800161C0:
    or      a1, s0, $zero              # a1 = 00000000
    or      a2, s2, $zero              # a2 = 00000000
    jal     func_800150BC
    or      a3, s5, $zero              # a3 = 00000000
    b       lbl_800161EC
    lbu     t5, 0x019E(s1)             # 0000019E
lbl_800161D8:
    or      a1, s0, $zero              # a1 = 00000000
lbl_800161DC:
    or      a2, s2, $zero              # a2 = 00000000
    jal     func_80015590
    or      a3, s5, $zero              # a3 = 00000000
    lbu     t5, 0x019E(s1)             # 0000019E
lbl_800161EC:
    sll     t6, t5,  2
    subu    t6, t6, t5
    sll     t6, t6,  3
    addu    v0, s1, t6
    addiu   v0, v0, 0xFFE8             # v0 = FFFFFFE8
lbl_80016200:
    addiu   s0, s0, 0x0018             # s0 = 00000018
    sltu    $at, s0, v0
    bne     $at, $zero, lbl_80016120
    addiu   s2, s2, 0x0001             # s2 = 00000001
    lw      $ra, 0x002C($sp)
lbl_80016214:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0118           # $sp += 0x118


func_80016234:
# MqDbg: EffectBlure_SetupSimple
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    sw      a2, 0x0020($sp)
    lw      t6, 0x0018($sp)
    addiu   a1, $zero, 0x0026          # a1 = 00000026
    jal     func_8007DFBC
    lw      a0, 0x02D0(t6)             # 000002D0
    lw      t7, 0x0018($sp)
    sw      v0, 0x02D0(t7)             # 000002D0
    lw      $ra, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_8001626C:
# MqDbg: EffectBlure_SetupSimpleAlt
# gameplay_keep texture: Flare
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a2, 0x0020($sp)
    or      a2, a0, $zero              # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t7, 0xE700                 # t7 = E7000000
    addiu   a1, $zero, 0x0026          # a1 = 00000026
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t7, 0x0000(v1)             # 00000000
    lw      a0, 0x02D0(a2)             # 000002D0
    jal     func_8007DFBC
    sw      a2, 0x0018($sp)
    lw      a2, 0x0018($sp)
    lw      t0, 0x001C($sp)
    lui     t1, 0xE700                 # t1 = E7000000
    addiu   t8, v0, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(a2)             # 000002D0
    lui     t9, 0xE300                 # t9 = E3000000
    ori     t9, t9, 0x0A01             # t9 = E3000A01
    lui     t2, 0x0010                 # t2 = 00100000
    sw      t2, 0x0004(v0)             # 00000004
    sw      t9, 0x0000(v0)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t4, 0xE300                 # t4 = E3000000
    ori     t4, t4, 0x1001             # t4 = E3001001
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t4, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t6, 0xD700                 # t6 = D7000000
    ori     t6, t6, 0x0002             # t6 = D7000002
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(a2)             # 000002D0
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    sw      t7, 0x0004(v1)             # 00000004
    sw      t6, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t2, 0x0400                 # t2 = 04000000
    addiu   t2, t2, 0x6020             # t2 = 04006020
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(a2)             # 000002D0
    lui     t9, 0xFD90                 # t9 = FD900000
    sw      t9, 0x0000(v1)             # 00000000
    sw      t2, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t5, 0x0701                 # t5 = 07010000
    ori     t5, t5, 0x4260             # t5 = 07014260
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(a2)             # 000002D0
    lui     t4, 0xF590                 # t4 = F5900000
    sw      t4, 0x0000(v1)             # 00000000
    sw      t5, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t7, 0xE600                 # t7 = E6000000
    lui     t9, 0xF300                 # t9 = F3000000
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t7, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t2, 0x073F                 # t2 = 073F0000
    ori     t2, t2, 0xF100             # t2 = 073FF100
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(a2)             # 000002D0
    sw      t2, 0x0004(v1)             # 00000004
    sw      t9, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t5, 0xF588                 # t5 = F5880000
    ori     t5, t5, 0x1000             # t5 = F5881000
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t6, 0x0001                 # t6 = 00010000
    ori     t6, t6, 0x4260             # t6 = 00014260
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(a2)             # 000002D0
    sw      t6, 0x0004(v1)             # 00000004
    sw      t5, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t9, 0x000F                 # t9 = 000F0000
    ori     t9, t9, 0xC07C             # t9 = 000FC07C
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(a2)             # 000002D0
    lui     t8, 0xF200                 # t8 = F2000000
    sw      t8, 0x0000(v1)             # 00000000
    sw      t9, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t3, 0xFC17                 # t3 = FC170000
    lui     t4, 0x35FC                 # t4 = 35FC0000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(a2)             # 000002D0
    ori     t4, t4, 0xFF78             # t4 = 35FCFF78
    ori     t3, t3, 0x1660             # t3 = FC171660
    sw      t3, 0x0000(v1)             # 00000000
    sw      t4, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t6, 0xE200                 # t6 = E2000000
    lui     t7, 0x0C18                 # t7 = 0C180000
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(a2)             # 000002D0
    ori     t7, t7, 0x4B50             # t7 = 0C184B50
    ori     t6, t6, 0x001C             # t6 = E200001C
    sw      t6, 0x0000(v1)             # 00000000
    sw      t7, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t9, 0xD9F0                 # t9 = D9F00000
    ori     t9, t9, 0xFFFF             # t9 = D9F0FFFF
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t9, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t3, 0xD9FF                 # t3 = D9FF0000
    lui     t4, 0x0020                 # t4 = 00200000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(a2)             # 000002D0
    ori     t4, t4, 0x0005             # t4 = 00200005
    ori     t3, t3, 0xFFFF             # t3 = D9FFFFFF
    sw      t3, 0x0000(v1)             # 00000000
    sw      t4, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(a2)             # 000002D0
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t7, 0xFB00                 # t7 = FB000000
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(a2)             # 000002D0
    sw      t7, 0x0000(v1)             # 00000000
    lbu     t4, 0x01A7(t0)             # 000001A7
    lbu     t9, 0x01A6(t0)             # 000001A6
    lbu     t8, 0x01A8(t0)             # 000001A8
    sll     t5, t4, 16
    sll     t2, t9, 24
    or      t6, t2, t5                 # t6 = 00000008
    lbu     t2, 0x01A9(t0)             # 000001A9
    sll     t9, t8,  8
    or      t3, t6, t9                 # t3 = D9F0FFFF
    or      t5, t3, t2                 # t5 = D9F0FFFF
    sw      t5, 0x0004(v1)             # 00000004
    lw      $ra, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800164C8:
# MqDbg: EffectBlure_DrawSimpleVertices
    addiu   $sp, $sp, 0xFE30           # $sp -= 0x1D0
    sw      s1, 0x003C($sp)
    sw      s0, 0x0038($sp)
    or      s0, a0, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    sw      $ra, 0x005C($sp)
    sw      s8, 0x0058($sp)
    sw      s7, 0x0054($sp)
    sw      s6, 0x0050($sp)
    sw      s5, 0x004C($sp)
    sw      s4, 0x0048($sp)
    sw      s3, 0x0044($sp)
    sw      s2, 0x0040($sp)
    sdc1    $f24, 0x0030($sp)
    sdc1    $f22, 0x0028($sp)
    sdc1    $f20, 0x0020($sp)
    sw      a2, 0x01D8($sp)
    lbu     t6, 0x01A1(s1)             # 000001A1
    lui     t9, 0x800E                 # t9 = 800E0000
    or      a0, s0, $zero              # a0 = 00000000
    sll     t7, t6,  2
    addu    t9, t9, t7
    lw      t9, 0x7A10(t9)             # 800E7A10
    or      a1, s1, $zero              # a1 = 00000000
    lw      a2, 0x01D8($sp)
    jalr    $ra, t9
    nop
    lw      v1, 0x02D0(s0)             # 000002D0
    lui     t1, 0xE700                 # t1 = E7000000
    lui     $at, 0x8010                # $at = 80100000
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s0)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lbu     t2, 0x019E(s1)             # 0000019E
    or      s2, $zero, $zero           # s2 = 00000000
    lw      s5, 0x01D8($sp)
    addiu   t3, t2, 0xFFFF             # t3 = FFFFFFFF
    blez    t3, lbl_80016978
    addiu   s8, $zero, 0x0604          # s8 = 00000604
    lwc1    $f24, 0x6040($at)          # 80106040
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f22                  # $f22 = 1.00
    lui     $at, 0x3F00                # $at = 3F000000
    lui     s7, 0x0600                 # s7 = 06000000
    lui     s6, 0x0100                 # s6 = 01000000
    mtc1    $at, $f20                  # $f20 = 0.50
    ori     s6, s6, 0x4008             # s6 = 01004008
    ori     s7, s7, 0x0206             # s7 = 06000206
    addiu   s3, $sp, 0x0158            # s3 = FFFFFF88
    lbu     t4, 0x01A1(s1)             # 000001A1
lbl_80016594:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t5, s2,  2
    bne     t4, $at, lbl_800166E4
    subu    t5, t5, s2
    sll     t5, t5,  3
    addu    t6, s1, t5
    lw      t7, 0x0004(t6)             # 00000004
    lbu     t9, 0x019F(s1)             # 0000019F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t7, $f4                    # $f4 = 0.00
    mtc1    t9, $f8                    # $f8 = 0.00
    cvt.s.w $f6, $f4
    bgez    t9, lbl_800165D8
    cvt.s.w $f10, $f8
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f10, $f10, $f18
lbl_800165D8:
    div.s   $f0, $f6, $f10
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t1, 0xFA00                 # t1 = FA000000
    ori     t1, t1, 0x0080             # t1 = FA000080
    addiu   t8, v0, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s0)             # 000002D0
    sw      t1, 0x0000(v0)             # 00000000
    lbu     t5, 0x01A5(s1)             # 000001A5
    lbu     t6, 0x01A3(s1)             # 000001A3
    lbu     t3, 0x01A2(s1)             # 000001A2
    lbu     t1, 0x01A4(s1)             # 000001A4
    mtc1    t5, $f4                    # $f4 = 0.00
    sll     t7, t6, 16
    sll     t4, t3, 24
    or      t9, t4, t7                 # t9 = 00000000
    sll     t2, t1,  8
    or      t3, t9, t2                 # t3 = 00000000
    bgez    t5, lbl_80016634
    cvt.s.w $f8, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f8, $f8, $f18
lbl_80016634:
    sub.s   $f6, $f22, $f0
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f10, $f8, $f6
    cfc1    t6, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f4, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beql    t4, $zero, lbl_800166B0
    mfc1    t4, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f4, $f10, $f4
    ctc1    t4, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_800166A4
    nop
    mfc1    t4, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800166BC
    or      t4, t4, $at                # t4 = 80000000
lbl_800166A4:
    b       lbl_800166BC
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
    mfc1    t4, $f4
lbl_800166B0:
    nop
    bltz    t4, lbl_800166A4
    nop
lbl_800166BC:
    andi    t7, t4, 0x00FF             # t7 = 000000FF
    ctc1    t6, $f31
    or      t8, t3, t7                 # t8 = 000000FF
    sw      t8, 0x0004(v0)             # 00000004
    lw      v1, 0x02D0(s0)             # 000002D0
    lui     t9, 0xE700                 # t9 = E7000000
    addiu   t1, v1, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(s0)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t9, 0x0000(v1)             # 00000000
lbl_800166E4:
    lw      v1, 0x02D0(s0)             # 000002D0
    or      s4, s5, $zero              # s4 = 00000000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s0)             # 000002D0
    sw      s5, 0x0004(v1)             # 00000004
    sw      s6, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s0)             # 000002D0
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s0)             # 000002D0
    sw      s8, 0x0004(v1)             # 00000004
    sw      s7, 0x0000(v1)             # 00000000
    lhu     t6, 0x0188(s1)             # 00000188
    lw      t3, 0x01D8($sp)
    sll     t8, s2,  6
    andi    t4, t6, 0x0004             # t4 = 00000000
    beq     t4, $zero, lbl_8001695C
    addu    v0, t3, t8
    lh      t1, 0x0010(v0)             # 00000010
    lh      t9, 0x0000(v0)             # 00000000
    addiu   a0, $sp, 0x01A8            # a0 = FFFFFFD8
    mtc1    t1, $f18                   # $f18 = 0.00
    mtc1    t9, $f6                    # $f6 = -604462900000000000000000.00
    addiu   a1, $sp, 0x01B4            # a1 = FFFFFFE4
    cvt.s.w $f8, $f18
    addiu   a2, $sp, 0x019C            # a2 = FFFFFFCC
    cvt.s.w $f10, $f6
    add.s   $f4, $f8, $f10
    mul.s   $f18, $f4, $f20
    swc1    $f18, 0x01B4($sp)
    lh      t5, 0x0002(v0)             # 00000002
    lh      t2, 0x0012(v0)             # 00000012
    mtc1    t5, $f10                   # $f10 = 0.00
    mtc1    t2, $f6                    # $f6 = 0.00
    cvt.s.w $f4, $f10
    cvt.s.w $f8, $f6
    add.s   $f18, $f8, $f4
    mul.s   $f6, $f18, $f20
    swc1    $f6, 0x01B8($sp)
    lh      t4, 0x0004(v0)             # 00000004
    lh      t6, 0x0014(v0)             # 00000014
    mtc1    t4, $f4                    # $f4 = 0.00
    mtc1    t6, $f10                   # $f10 = 0.00
    cvt.s.w $f18, $f4
    cvt.s.w $f8, $f10
    add.s   $f6, $f8, $f18
    mul.s   $f10, $f6, $f20
    swc1    $f10, 0x01BC($sp)
    lh      t3, 0x0020(v0)             # 00000020
    lh      t7, 0x0030(v0)             # 00000030
    mtc1    t3, $f18                   # $f18 = 0.00
    mtc1    t7, $f4                    # $f4 = 0.00
    cvt.s.w $f6, $f18
    cvt.s.w $f8, $f4
    add.s   $f10, $f8, $f6
    mul.s   $f4, $f10, $f20
    swc1    $f4, 0x01A8($sp)
    lh      t1, 0x0022(v0)             # 00000022
    lh      t8, 0x0032(v0)             # 00000032
    mtc1    t1, $f6                    # $f6 = 0.00
    mtc1    t8, $f18                   # $f18 = 0.00
    cvt.s.w $f10, $f6
    cvt.s.w $f8, $f18
    add.s   $f4, $f8, $f10
    mul.s   $f18, $f4, $f20
    swc1    $f18, 0x01AC($sp)
    lh      t2, 0x0024(v0)             # 00000024
    lh      t9, 0x0034(v0)             # 00000034
    mtc1    t2, $f10                   # $f10 = 0.00
    mtc1    t9, $f6                    # $f6 = -604462900000000000000000.00
    cvt.s.w $f4, $f10
    cvt.s.w $f8, $f6
    add.s   $f18, $f8, $f4
    mul.s   $f6, $f18, $f20
    jal     func_80063D48              # Vec3f_Sub
    swc1    $f6, 0x01B0($sp)
    lwc1    $f12, 0x019C($sp)
    lwc1    $f14, 0x01A0($sp)
    lwc1    $f16, 0x01A4($sp)
    mul.s   $f10, $f12, $f12
    nop
    mul.s   $f8, $f14, $f14
    add.s   $f4, $f10, $f8
    mul.s   $f18, $f16, $f16
    add.s   $f0, $f4, $f18
    sqrt.s  $f2, $f0
    abs.s   $f0, $f2
    c.lt.s  $f24, $f0
    nop
    bc1f    lbl_8001695C
    nop
    div.s   $f2, $f22, $f2
    addiu   a0, $sp, 0x019C            # a0 = FFFFFFCC
    mfc1    a1, $f2
    jal     func_80063DDC
    nop
    or      a0, s3, $zero              # a0 = FFFFFF88
    lw      a1, 0x01B4($sp)
    lw      a2, 0x01B8($sp)
    jal     func_8008F82C              # guTranslateF
    lw      a3, 0x01BC($sp)
    lwc1    $f12, 0x019C($sp)
    lwc1    $f14, 0x01A0($sp)
    lwc1    $f16, 0x01A4($sp)
    mfc1    a2, $f12
    mfc1    a3, $f14
    addiu   a0, $sp, 0x0118            # a0 = FFFFFF48
    addiu   a1, $zero, 0x3FFF          # a1 = 00003FFF
    jal     func_8008FCE0
    swc1    $f16, 0x0010($sp)
    or      a0, s3, $zero              # a0 = FFFFFF88
    addiu   a1, $sp, 0x0118            # a1 = FFFFFF48
    jal     func_8008EDB8
    addiu   a2, $sp, 0x00D8            # a2 = FFFFFF08
    lwc1    $f6, 0x01B4($sp)
    lwc1    $f8, 0x01B8($sp)
    lwc1    $f18, 0x01BC($sp)
    neg.s   $f10, $f6
    neg.s   $f4, $f8
    neg.s   $f6, $f18
    mfc1    a2, $f4
    mfc1    a3, $f6
    mfc1    a1, $f10
    jal     func_8008F82C              # guTranslateF
    or      a0, s3, $zero              # a0 = FFFFFF88
    addiu   a0, $sp, 0x00D8            # a0 = FFFFFF08
    or      a1, s3, $zero              # a1 = FFFFFF88
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0098            # a2 = FFFFFEC8
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_8008FC98
    addiu   a1, $sp, 0x0098            # a1 = FFFFFEC8
    beq     v0, $zero, lbl_80016978
    lui     t0, 0x8010                 # t0 = 80100000
    lw      v1, 0x02D0(s0)             # 000002D0
    lui     t6, 0xDA38                 # t6 = DA380000
    ori     t6, t6, 0x0003             # t6 = DA380003
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s0)             # 000002D0
    sw      v0, 0x0004(v1)             # 00000004
    sw      t6, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s0)             # 000002D0
    addiu   t0, t0, 0xEDB0             # t0 = 800FEDB0
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(s0)             # 000002D0
    sw      s4, 0x0004(v1)             # 00000004
    sw      s6, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s0)             # 000002D0
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s0)             # 000002D0
    sw      s8, 0x0004(v1)             # 00000004
    sw      s7, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s0)             # 000002D0
    lui     t8, 0xDA38                 # t8 = DA380000
    ori     t8, t8, 0x0003             # t8 = DA380003
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(s0)             # 000002D0
    sw      t0, 0x0004(v1)             # 00000004
    sw      t8, 0x0000(v1)             # 00000000
lbl_8001695C:
    lbu     t1, 0x019E(s1)             # 0000019E
    addiu   s2, s2, 0x0001             # s2 = 00000001
    addiu   s5, s5, 0x0040             # s5 = 00000040
    addiu   t9, t1, 0xFFFF             # t9 = FFFFFFFF
    slt     $at, s2, t9
    bnel    $at, $zero, lbl_80016594
    lbu     t4, 0x01A1(s1)             # 000001A1
lbl_80016978:
    lw      $ra, 0x005C($sp)
    ldc1    $f20, 0x0020($sp)
    ldc1    $f22, 0x0028($sp)
    ldc1    $f24, 0x0030($sp)
    lw      s0, 0x0038($sp)
    lw      s1, 0x003C($sp)
    lw      s2, 0x0040($sp)
    lw      s3, 0x0044($sp)
    lw      s4, 0x0048($sp)
    lw      s5, 0x004C($sp)
    lw      s6, 0x0050($sp)
    lw      s7, 0x0054($sp)
    lw      s8, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x01D0           # $sp += 0x1D0


func_800169B4:
# MqDbg: EffectBlure_DrawSimple
    addiu   $sp, $sp, 0xFF68           # $sp -= 0x98
    sw      s5, 0x003C($sp)
    or      s5, a0, $zero              # s5 = 00000000
    sw      $ra, 0x004C($sp)
    sw      s8, 0x0048($sp)
    sw      s7, 0x0044($sp)
    sw      s6, 0x0040($sp)
    sw      s4, 0x0038($sp)
    sw      s3, 0x0034($sp)
    sw      s2, 0x0030($sp)
    sw      s1, 0x002C($sp)
    sw      s0, 0x0028($sp)
    sw      a1, 0x009C($sp)
    lbu     v1, 0x019E(s5)             # 0000019E
    or      s6, s5, $zero              # s6 = 00000000
    lw      t6, 0x009C($sp)
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_80016E90
    sll     s7, v1,  2
    lw      t7, 0x02C4(t6)             # 000002C4
    sll     t8, s7,  4
    addiu   t9, t8, 0x000F             # t9 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     t1, t9, $at
    subu    s2, t7, t1
    beq     s2, $zero, lbl_80016E90
    sw      s2, 0x02C4(t6)             # 000002C4
    lui     t2, 0x800E                 # t2 = 800E0000
    addiu   t2, t2, 0x7A1C             # t2 = 800E7A1C
    lwl     t4, 0x0000(t2)             # 800E7A1C
    lwr     t4, 0x0003(t2)             # 800E7A1F
    lui     t5, 0x800E                 # t5 = 800E0000
    addiu   t5, t5, 0x7A2C             # t5 = 800E7A2C
    swl     t4, 0x0000(s2)             # 00000000
    swr     t4, 0x0003(s2)             # 00000003
    lwl     t3, 0x0004(t2)             # 800E7A20
    lwr     t3, 0x0007(t2)             # 800E7A23
    or      v0, s2, $zero              # v0 = 00000000
    lui     t7, 0x800E                 # t7 = 800E0000
    swl     t3, 0x0004(s2)             # 00000004
    swr     t3, 0x0007(s2)             # 00000007
    lwl     t4, 0x0008(t2)             # 800E7A24
    lwr     t4, 0x000B(t2)             # 800E7A27
    addiu   t7, t7, 0x7A3C             # t7 = 800E7A3C
    addiu   v0, v0, 0x0040             # v0 = 00000040
    swl     t4, 0x0008(s2)             # 00000008
    swr     t4, 0x000B(s2)             # 0000000B
    lwl     t3, 0x000C(t2)             # 800E7A28
    lwr     t3, 0x000F(t2)             # 800E7A2B
    lui     t2, 0x800E                 # t2 = 800E0000
    addiu   t2, t2, 0x7A4C             # t2 = 800E7A4C
    swl     t3, 0x000C(s2)             # 0000000C
    swr     t3, 0x000F(s2)             # 0000000F
    lwl     t9, 0x0000(t5)             # 800E7A2C
    lwr     t9, 0x0003(t5)             # 800E7A2F
    addiu   t0, $zero, 0x0018          # t0 = 00000018
    addiu   s0, $zero, 0xFFFE          # s0 = FFFFFFFE
    swl     t9, -0x0030(v0)            # 00000010
    swr     t9, -0x002D(v0)            # 00000013
    lwl     t8, 0x0004(t5)             # 800E7A30
    lwr     t8, 0x0007(t5)             # 800E7A33
    addiu   s3, $zero, 0xFFFF          # s3 = FFFFFFFF
    or      s4, s5, $zero              # s4 = 00000000
    swl     t8, -0x002C(v0)            # 00000014
    swr     t8, -0x0029(v0)            # 00000017
    lwl     t9, 0x0008(t5)             # 800E7A34
    lwr     t9, 0x000B(t5)             # 800E7A37
    swl     t9, -0x0028(v0)            # 00000018
    swr     t9, -0x0025(v0)            # 0000001B
    lwl     t8, 0x000C(t5)             # 800E7A38
    lwr     t8, 0x000F(t5)             # 800E7A3B
    swl     t8, -0x0024(v0)            # 0000001C
    swr     t8, -0x0021(v0)            # 0000001F
    lwl     t6, 0x0000(t7)             # 800E7A3C
    lwr     t6, 0x0003(t7)             # 800E7A3F
    swl     t6, -0x0020(v0)            # 00000020
    swr     t6, -0x001D(v0)            # 00000023
    lwl     t1, 0x0004(t7)             # 800E7A40
    lwr     t1, 0x0007(t7)             # 800E7A43
    swl     t1, -0x001C(v0)            # 00000024
    swr     t1, -0x0019(v0)            # 00000027
    lwl     t6, 0x0008(t7)             # 800E7A44
    lwr     t6, 0x000B(t7)             # 800E7A47
    swl     t6, -0x0018(v0)            # 00000028
    swr     t6, -0x0015(v0)            # 0000002B
    lwl     t1, 0x000C(t7)             # 800E7A48
    lwr     t1, 0x000F(t7)             # 800E7A4B
    swl     t1, -0x0014(v0)            # 0000002C
    swr     t1, -0x0011(v0)            # 0000002F
    lwl     t4, 0x0000(t2)             # 800E7A4C
    lwr     t4, 0x0003(t2)             # 800E7A4F
    swl     t4, -0x0010(v0)            # 00000030
    swr     t4, -0x000D(v0)            # 00000033
    lwl     t3, 0x0004(t2)             # 800E7A50
    lwr     t3, 0x0007(t2)             # 800E7A53
    swl     t3, -0x000C(v0)            # 00000034
    swr     t3, -0x0009(v0)            # 00000037
    lwl     t4, 0x0008(t2)             # 800E7A54
    lwr     t4, 0x000B(t2)             # 800E7A57
    swl     t4, -0x0008(v0)            # 00000038
    swr     t4, -0x0005(v0)            # 0000003B
    lwl     t3, 0x000C(t2)             # 800E7A58
    lwr     t3, 0x000F(t2)             # 800E7A5B
    swl     t3, -0x0004(v0)            # 0000003C
    swr     t3, -0x0001(v0)            # 0000003F
    lbu     a0, 0x019E(s5)             # 0000019E
    slti    $at, a0, 0x0002
    bne     $at, $zero, lbl_80016CD4
    or      v1, a0, $zero              # v1 = 00000000
    multu   a0, t0
    lui     a0, 0x800E                 # a0 = 800E0000
    lui     a2, 0x800E                 # a2 = 800E0000
    lui     a1, 0x800E                 # a1 = 800E0000
    addiu   a1, a1, 0x7A7C             # a1 = 800E7A7C
    addiu   a2, a2, 0x7A8C             # a2 = 800E7A8C
    addiu   a0, a0, 0x7A6C             # a0 = 800E7A6C
    or      a3, s5, $zero              # a3 = 00000000
    mflo    t5
    addu    t8, s5, t5
    addiu   t9, t8, 0xFFD0             # t9 = FFFFFFD0
    sltu    $at, s5, t9
    beq     $at, $zero, lbl_80016CD4
    nop
    lui     v1, 0x800E                 # v1 = 800E0000
    addiu   v1, v1, 0x7A5C             # v1 = 800E7A5C
    lwl     t1, 0x0000(v1)             # 800E7A5C
lbl_80016BAC:
    lwr     t1, 0x0003(v1)             # 800E7A5F
    addiu   a3, a3, 0x0018             # a3 = 00000018
    addiu   v0, v0, 0x0040             # v0 = 00000080
    swl     t1, -0x0040(v0)            # 00000040
    swr     t1, -0x003D(v0)            # 00000043
    lwl     t7, 0x0004(v1)             # 800E7A60
    lwr     t7, 0x0007(v1)             # 800E7A63
    swl     t7, -0x003C(v0)            # 00000044
    swr     t7, -0x0039(v0)            # 00000047
    lwl     t1, 0x0008(v1)             # 800E7A64
    lwr     t1, 0x000B(v1)             # 800E7A67
    swl     t1, -0x0038(v0)            # 00000048
    swr     t1, -0x0035(v0)            # 0000004B
    lwl     t7, 0x000C(v1)             # 800E7A68
    lwr     t7, 0x000F(v1)             # 800E7A6B
    swl     t7, -0x0034(v0)            # 0000004C
    swr     t7, -0x0031(v0)            # 0000004F
    lwl     t2, 0x0000(a0)             # 800E7A6C
    lwr     t2, 0x0003(a0)             # 800E7A6F
    swl     t2, -0x0030(v0)            # 00000050
    swr     t2, -0x002D(v0)            # 00000053
    lwl     t6, 0x0004(a0)             # 800E7A70
    lwr     t6, 0x0007(a0)             # 800E7A73
    swl     t6, -0x002C(v0)            # 00000054
    swr     t6, -0x0029(v0)            # 00000057
    lwl     t2, 0x0008(a0)             # 800E7A74
    lwr     t2, 0x000B(a0)             # 800E7A77
    swl     t2, -0x0028(v0)            # 00000058
    swr     t2, -0x0025(v0)            # 0000005B
    lwl     t6, 0x000C(a0)             # 800E7A78
    lwr     t6, 0x000F(a0)             # 800E7A7B
    swl     t6, -0x0024(v0)            # 0000005C
    swr     t6, -0x0021(v0)            # 0000005F
    lwl     t4, 0x0000(a1)             # 800E7A7C
    lwr     t4, 0x0003(a1)             # 800E7A7F
    swl     t4, -0x0020(v0)            # 00000060
    swr     t4, -0x001D(v0)            # 00000063
    lwl     t3, 0x0004(a1)             # 800E7A80
    lwr     t3, 0x0007(a1)             # 800E7A83
    swl     t3, -0x001C(v0)            # 00000064
    swr     t3, -0x0019(v0)            # 00000067
    lwl     t4, 0x0008(a1)             # 800E7A84
    lwr     t4, 0x000B(a1)             # 800E7A87
    swl     t4, -0x0018(v0)            # 00000068
    swr     t4, -0x0015(v0)            # 0000006B
    lwl     t3, 0x000C(a1)             # 800E7A88
    lwr     t3, 0x000F(a1)             # 800E7A8B
    swl     t3, -0x0014(v0)            # 0000006C
    swr     t3, -0x0011(v0)            # 0000006F
    lwl     t8, 0x0000(a2)             # 800E7A8C
    lwr     t8, 0x0003(a2)             # 800E7A8F
    swl     t8, -0x0010(v0)            # 00000070
    swr     t8, -0x000D(v0)            # 00000073
    lwl     t5, 0x0004(a2)             # 800E7A90
    lwr     t5, 0x0007(a2)             # 800E7A93
    swl     t5, -0x000C(v0)            # 00000074
    swr     t5, -0x0009(v0)            # 00000077
    lwl     t8, 0x0008(a2)             # 800E7A94
    lwr     t8, 0x000B(a2)             # 800E7A97
    swl     t8, -0x0008(v0)            # 00000078
    swr     t8, -0x0005(v0)            # 0000007B
    lwl     t5, 0x000C(a2)             # 800E7A98
    lwr     t5, 0x000F(a2)             # 800E7A9B
    swl     t5, -0x0004(v0)            # 0000007C
    swr     t5, -0x0001(v0)            # 0000007F
    lbu     t9, 0x019E(s6)             # 0000019E
    multu   t9, t0
    mflo    t7
    addu    t1, s6, t7
    addiu   t6, t1, 0xFFD0             # t6 = FFFFFFD0
    sltu    $at, a3, t6
    bnel    $at, $zero, lbl_80016BAC
    lwl     t1, 0x0000(v1)             # 800E7A5C
    lbu     v1, 0x019E(s5)             # 0000019E
lbl_80016CD4:
    blez    v1, lbl_80016E80
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s8, $sp, 0x0074            # s8 = FFFFFFDC
lbl_80016CE0:
    lw      t2, 0x0004(s4)             # 00000004
    lbu     t3, 0x019F(s5)             # 0000019F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t2, $f4                    # $f4 = 0.00
    mtc1    t3, $f8                    # $f8 = 0.00
    cvt.s.w $f6, $f4
    bgez    t3, lbl_80016D0C
    cvt.s.w $f10, $f8
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f10, $f10, $f16
lbl_80016D0C:
    div.s   $f0, $f6, $f10
    addiu   t4, $sp, 0x006C            # t4 = FFFFFFD4
    addiu   t5, $sp, 0x0064            # t5 = FFFFFFCC
    addiu   t8, $sp, 0x0060            # t8 = FFFFFFC8
    sw      t8, 0x0018($sp)
    sw      t5, 0x0014($sp)
    sw      t4, 0x0010($sp)
    or      a0, s5, $zero              # a0 = 00000000
    or      a1, s1, $zero              # a1 = 00000000
    or      a3, s8, $zero              # a3 = FFFFFFDC
    mfc1    a2, $f0
    jal     func_80014B74
    nop
    bltz    s0, lbl_80016D88
    addiu   s1, s1, 0x0001             # s1 = 00000001
    lh      t7, 0x0074($sp)
    sll     t9, s0,  4
    addu    v0, s2, t9
    sh      t7, 0x0000(v0)             # 00000000
    lh      t1, 0x0076($sp)
    sh      t1, 0x0002(v0)             # 00000002
    lh      t6, 0x0078($sp)
    sh      t6, 0x0004(v0)             # 00000004
    lbu     t2, 0x0064($sp)
    sb      t2, 0x000C(v0)             # 0000000C
    lbu     t3, 0x0065($sp)
    sb      t3, 0x000D(v0)             # 0000000D
    lbu     t4, 0x0066($sp)
    sb      t4, 0x000E(v0)             # 0000000E
    lbu     t5, 0x0067($sp)
    sb      t5, 0x000F(v0)             # 0000000F
lbl_80016D88:
    bltz    s3, lbl_80016DD0
    or      v1, s3, $zero              # v1 = FFFFFFFF
    lh      t9, 0x006C($sp)
    sll     t8, v1,  4
    addu    v0, s2, t8
    sh      t9, 0x0000(v0)             # 00000000
    lh      t7, 0x006E($sp)
    sh      t7, 0x0002(v0)             # 00000002
    lh      t1, 0x0070($sp)
    sh      t1, 0x0004(v0)             # 00000004
    lbu     t6, 0x0060($sp)
    sb      t6, 0x000C(v0)             # 0000000C
    lbu     t2, 0x0061($sp)
    sb      t2, 0x000D(v0)             # 0000000D
    lbu     t3, 0x0062($sp)
    sb      t3, 0x000E(v0)             # 0000000E
    lbu     t4, 0x0063($sp)
    sb      t4, 0x000F(v0)             # 0000000F
lbl_80016DD0:
    addiu   v1, v1, 0x0001             # v1 = 00000000
    slt     $at, s7, v1
    bne     $at, $zero, lbl_80016E1C
    lh      t8, 0x0074($sp)
    sll     t5, v1,  4
    addu    v0, s2, t5
    sh      t8, 0x0000(v0)             # 00000000
    lh      t9, 0x0076($sp)
    sh      t9, 0x0002(v0)             # 00000002
    lh      t7, 0x0078($sp)
    sh      t7, 0x0004(v0)             # 00000004
    lbu     t1, 0x0064($sp)
    sb      t1, 0x000C(v0)             # 0000000C
    lbu     t6, 0x0065($sp)
    sb      t6, 0x000D(v0)             # 0000000D
    lbu     t2, 0x0066($sp)
    sb      t2, 0x000E(v0)             # 0000000E
    lbu     t3, 0x0067($sp)
    sb      t3, 0x000F(v0)             # 0000000F
lbl_80016E1C:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    slt     $at, s7, v1
    bne     $at, $zero, lbl_80016E68
    lh      t5, 0x006C($sp)
    sll     t4, v1,  4
    addu    v0, s2, t4
    sh      t5, 0x0000(v0)             # 00000000
    lh      t8, 0x006E($sp)
    sh      t8, 0x0002(v0)             # 00000002
    lh      t9, 0x0070($sp)
    sh      t9, 0x0004(v0)             # 00000004
    lbu     t7, 0x0060($sp)
    sb      t7, 0x000C(v0)             # 0000000C
    lbu     t1, 0x0061($sp)
    sb      t1, 0x000D(v0)             # 0000000D
    lbu     t6, 0x0062($sp)
    sb      t6, 0x000E(v0)             # 0000000E
    lbu     t2, 0x0063($sp)
    sb      t2, 0x000F(v0)             # 0000000F
lbl_80016E68:
    lbu     t3, 0x019E(s6)             # 0000019E
    addiu   s0, s0, 0x0004             # s0 = 00000002
    addiu   s3, s3, 0x0004             # s3 = 00000003
    slt     $at, s1, t3
    bne     $at, $zero, lbl_80016CE0
    addiu   s4, s4, 0x0018             # s4 = 00000018
lbl_80016E80:
    lw      a0, 0x009C($sp)
    or      a1, s5, $zero              # a1 = 00000000
    jal     func_800164C8
    or      a2, s2, $zero              # a2 = 00000000
lbl_80016E90:
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
    addiu   $sp, $sp, 0x0098           # $sp += 0x98


func_80016EC0:
# MqDbg: EffectBlure_Draw
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      s7, 0x0038($sp)
    sw      s2, 0x0024($sp)
    or      s2, a0, $zero              # s2 = 00000000
    or      s7, a1, $zero              # s7 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s6, 0x0034($sp)
    sw      s5, 0x0030($sp)
    sw      s4, 0x002C($sp)
    sw      s3, 0x0028($sp)
    sw      s1, 0x0020($sp)
    sw      s0, 0x001C($sp)
    sdc1    $f20, 0x0010($sp)
    or      s6, s2, $zero              # s6 = 00000000
    lw      a2, 0x02D0(s7)             # 000002D0
    lui     t7, 0xDA38                 # t7 = DA380000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t6, a2, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s7)             # 000002D0
    addiu   t8, t8, 0xEDB0             # t8 = 800FEDB0
    ori     t7, t7, 0x0003             # t7 = DA380003
    sw      t7, 0x0000(a2)             # 00000000
    sw      t8, 0x0004(a2)             # 00000004
    lbu     t9, 0x019E(s2)             # 0000019E
    beql    t9, $zero, lbl_80017378
    lw      $ra, 0x003C($sp)
    lhu     t1, 0x0188(s2)             # 00000188
    bnel    t1, $zero, lbl_80017348
    lbu     t6, 0x01A1(s2)             # 000001A1
    jal     func_8007E51C
    or      a0, s7, $zero              # a0 = 00000000
    lw      a2, 0x02D0(s7)             # 000002D0
    lui     t3, 0xE700                 # t3 = E7000000
    addiu   t2, a2, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s7)             # 000002D0
    sw      $zero, 0x0004(a2)          # 00000004
    sw      t3, 0x0000(a2)             # 00000000
    lw      v0, 0x02C4(s7)             # 000002C4
    addiu   v0, v0, 0xFE00             # v0 = FFFFFE00
    sw      v0, 0x02C4(s7)             # 000002C4
    beq     v0, $zero, lbl_80017374
    sw      v0, 0x0040($sp)
    lbu     t4, 0x019E(s2)             # 0000019E
    or      s3, $zero, $zero           # s3 = 00000000
    or      s4, $zero, $zero           # s4 = 00000000
    blez    t4, lbl_80017240
    or      s1, s2, $zero              # s1 = 00000000
    addiu   s5, $zero, 0x0001          # s5 = 00000001
    lw      t5, 0x0000(s1)             # 00000000
lbl_80016F84:
    lw      t8, 0x0040($sp)
    bnel    s5, t5, lbl_80017228
    lbu     t4, 0x019E(s6)             # 0000019E
    lw      t6, 0x0004(s1)             # 00000004
    lbu     t7, 0x019F(s2)             # 0000019F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t6, $f4                    # $f4 = 0.00
    mtc1    t7, $f8                    # $f8 = 0.00
    cvt.s.w $f6, $f4
    bgez    t7, lbl_80016FBC
    cvt.s.w $f10, $f8
    mtc1    $at, $f16                  # $f16 = 4294967000.00
    nop
    add.s   $f10, $f10, $f16
lbl_80016FBC:
    lw      v0, 0x0180(s2)             # 00000180
    sll     t9, s3,  4
    div.s   $f20, $f6, $f10
    beq     v0, $zero, lbl_80017130
    addu    s0, t8, t9
    beq     v0, s5, lbl_80016FF0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_80017048
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beql    v0, $at, lbl_800170A4
    lui     $at, 0x3F00                # $at = 3F000000
    b       lbl_80017134
    lh      t7, 0x0008(s1)             # 00000008
lbl_80016FF0:
    mfc1    a2, $f20
    lh      a0, 0x0008(s1)             # 00000008
    jal     func_8001B960
    lh      a1, 0x000E(s1)             # 0000000E
    sh      v0, 0x0000(s0)             # 00000000
    mfc1    a2, $f20
    lh      a1, 0x0010(s1)             # 00000010
    jal     func_8001B960
    lh      a0, 0x000A(s1)             # 0000000A
    sh      v0, 0x0002(s0)             # 00000002
    mfc1    a2, $f20
    lh      a1, 0x0012(s1)             # 00000012
    jal     func_8001B960
    lh      a0, 0x000C(s1)             # 0000000C
    sh      v0, 0x0004(s0)             # 00000004
    lh      t1, 0x000E(s1)             # 0000000E
    sh      t1, 0x0010(s0)             # 00000010
    lh      t2, 0x0010(s1)             # 00000010
    sh      t2, 0x0012(s0)             # 00000012
    lh      t3, 0x0012(s1)             # 00000012
    b       lbl_80017160
    sh      t3, 0x0014(s0)             # 00000014
lbl_80017048:
    lh      t4, 0x0008(s1)             # 00000008
    mfc1    a2, $f20
    sh      t4, 0x0000(s0)             # 00000000
    lh      t5, 0x000A(s1)             # 0000000A
    sh      t5, 0x0002(s0)             # 00000002
    lh      t6, 0x000C(s1)             # 0000000C
    sh      t6, 0x0004(s0)             # 00000004
    lh      a1, 0x0008(s1)             # 00000008
    jal     func_8001B960
    lh      a0, 0x000E(s1)             # 0000000E
    sh      v0, 0x0010(s0)             # 00000010
    mfc1    a2, $f20
    lh      a1, 0x000A(s1)             # 0000000A
    jal     func_8001B960
    lh      a0, 0x0010(s1)             # 00000010
    sh      v0, 0x0012(s0)             # 00000012
    mfc1    a2, $f20
    lh      a1, 0x000C(s1)             # 0000000C
    jal     func_8001B960
    lh      a0, 0x0012(s1)             # 00000012
    b       lbl_80017160
    sh      v0, 0x0014(s0)             # 00000014
    lui     $at, 0x3F00                # $at = 3F000000
lbl_800170A4:
    mtc1    $at, $f18                  # $f18 = 0.50
    lh      a0, 0x0008(s1)             # 00000008
    lh      a1, 0x000E(s1)             # 0000000E
    mul.s   $f20, $f20, $f18
    mfc1    a2, $f20
    jal     func_8001B960
    nop
    sh      v0, 0x0000(s0)             # 00000000
    mfc1    a2, $f20
    lh      a1, 0x0010(s1)             # 00000010
    jal     func_8001B960
    lh      a0, 0x000A(s1)             # 0000000A
    sh      v0, 0x0002(s0)             # 00000002
    mfc1    a2, $f20
    lh      a1, 0x0012(s1)             # 00000012
    jal     func_8001B960
    lh      a0, 0x000C(s1)             # 0000000C
    sh      v0, 0x0004(s0)             # 00000004
    mfc1    a2, $f20
    lh      a1, 0x0008(s1)             # 00000008
    jal     func_8001B960
    lh      a0, 0x000E(s1)             # 0000000E
    sh      v0, 0x0010(s0)             # 00000010
    mfc1    a2, $f20
    lh      a1, 0x000A(s1)             # 0000000A
    jal     func_8001B960
    lh      a0, 0x0010(s1)             # 00000010
    sh      v0, 0x0012(s0)             # 00000012
    mfc1    a2, $f20
    lh      a1, 0x000C(s1)             # 0000000C
    jal     func_8001B960
    lh      a0, 0x0012(s1)             # 00000012
    sh      v0, 0x0014(s0)             # 00000014
    b       lbl_80017160
    add.s   $f20, $f20, $f20
lbl_80017130:
    lh      t7, 0x0008(s1)             # 00000008
lbl_80017134:
    sh      t7, 0x0000(s0)             # 00000000
    lh      t8, 0x000A(s1)             # 0000000A
    sh      t8, 0x0002(s0)             # 00000002
    lh      t9, 0x000C(s1)             # 0000000C
    sh      t9, 0x0004(s0)             # 00000004
    lh      t1, 0x000E(s1)             # 0000000E
    sh      t1, 0x0010(s0)             # 00000010
    lh      t2, 0x0010(s1)             # 00000010
    sh      t2, 0x0012(s0)             # 00000012
    lh      t3, 0x0012(s1)             # 00000012
    sh      t3, 0x0014(s0)             # 00000014
lbl_80017160:
    sh      $zero, 0x0006(s0)          # 00000006
    sh      $zero, 0x0008(s0)          # 00000008
    sh      $zero, 0x000A(s0)          # 0000000A
    mfc1    a2, $f20
    lbu     a1, 0x0196(s2)             # 00000196
    jal     func_8001B9B4
    lbu     a0, 0x018E(s2)             # 0000018E
    sb      v0, 0x000C(s0)             # 0000000C
    mfc1    a2, $f20
    lbu     a1, 0x0197(s2)             # 00000197
    jal     func_8001B9B4
    lbu     a0, 0x018F(s2)             # 0000018F
    sb      v0, 0x000D(s0)             # 0000000D
    mfc1    a2, $f20
    lbu     a1, 0x0198(s2)             # 00000198
    jal     func_8001B9B4
    lbu     a0, 0x0190(s2)             # 00000190
    sb      v0, 0x000E(s0)             # 0000000E
    mfc1    a2, $f20
    lbu     a1, 0x0199(s2)             # 00000199
    jal     func_8001B9B4
    lbu     a0, 0x0191(s2)             # 00000191
    sb      v0, 0x000F(s0)             # 0000000F
    sh      $zero, 0x0016(s0)          # 00000016
    sh      $zero, 0x0018(s0)          # 00000018
    sh      $zero, 0x001A(s0)          # 0000001A
    mfc1    a2, $f20
    addiu   s3, s3, 0x0001             # s3 = 00000001
    addiu   s0, s0, 0x0010             # s0 = 00000010
    lbu     a1, 0x019A(s2)             # 0000019A
    jal     func_8001B9B4
    lbu     a0, 0x0192(s2)             # 00000192
    sb      v0, 0x000C(s0)             # 0000001C
    mfc1    a2, $f20
    lbu     a1, 0x019B(s2)             # 0000019B
    jal     func_8001B9B4
    lbu     a0, 0x0193(s2)             # 00000193
    sb      v0, 0x000D(s0)             # 0000001D
    mfc1    a2, $f20
    lbu     a1, 0x019C(s2)             # 0000019C
    jal     func_8001B9B4
    lbu     a0, 0x0194(s2)             # 00000194
    sb      v0, 0x000E(s0)             # 0000001E
    mfc1    a2, $f20
    lbu     a1, 0x019D(s2)             # 0000019D
    jal     func_8001B9B4
    lbu     a0, 0x0195(s2)             # 00000195
    sb      v0, 0x000F(s0)             # 0000001F
    addiu   s3, s3, 0x0001             # s3 = 00000002
    lbu     t4, 0x019E(s6)             # 0000019E
lbl_80017228:
    addiu   s4, s4, 0x0001             # s4 = 00000001
    addiu   s1, s1, 0x0018             # s1 = 00000018
    slt     $at, s4, t4
    bnel    $at, $zero, lbl_80016F84
    lw      t5, 0x0000(s1)             # 00000018
    or      s3, $zero, $zero           # s3 = 00000000
lbl_80017240:
    addiu   s5, $zero, 0x0001          # s5 = 00000001
    or      a3, $zero, $zero           # a3 = 00000000
    lw      a2, 0x02D0(s7)             # 000002D0
    lui     t6, 0x0102                 # t6 = 01020000
    ori     t6, t6, 0x0040             # t6 = 01020040
    addiu   t5, a2, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s7)             # 000002D0
    sw      t6, 0x0000(a2)             # 00000000
    lw      t7, 0x0040($sp)
    or      s1, s2, $zero              # s1 = 00000000
    lui     t0, 0x0700                 # t0 = 07000000
    sw      t7, 0x0004(a2)             # 00000004
    lbu     t8, 0x019E(s2)             # 0000019E
    blezl   t8, lbl_80017378
    lw      $ra, 0x003C($sp)
    lw      t9, 0x0000(s1)             # 00000000
lbl_80017280:
    addiu   s1, s1, 0x0018             # s1 = 00000018
    bne     t9, $zero, lbl_800172A8
    nop
    lbu     v0, 0x019E(s6)             # 0000019E
    or      a3, $zero, $zero           # a3 = 00000000
    sll     t1, v0,  2
    subu    t1, t1, v0
    sll     t1, t1,  3
    b       lbl_80017330
    addu    v1, t1, s2
lbl_800172A8:
    bne     a3, $zero, lbl_800172B8
    sll     v0, s3,  1
    b       lbl_80017318
    or      a3, s5, $zero              # a3 = 00000001
lbl_800172B8:
    lw      a2, 0x02D0(s7)             # 000002D0
    addiu   a0, v0, 0xFFFC             # a0 = FFFFFFFC
    addiu   t3, v0, 0xFFFE             # t3 = FFFFFFFE
    andi    t4, t3, 0x00FF             # t4 = 000000FE
    andi    a0, a0, 0x00FF             # a0 = 000000FC
    addiu   a1, v0, 0x0002             # a1 = 00000002
    andi    a1, a1, 0x00FF             # a1 = 00000002
    sll     a0, a0, 16
    sll     t5, t4,  8
    addiu   t2, a2, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s7)             # 000002D0
    or      t6, a0, t5                 # t6 = 000000FC
    sll     t9, a1,  8
    or      t1, a0, t9                 # t1 = 000000FC
    or      t7, t6, a1                 # t7 = 000000FE
    andi    t2, v0, 0x00FF             # t2 = 00000000
    or      t3, t1, t2                 # t3 = 000000FC
    or      t8, t7, t0                 # t8 = 070000FE
    sw      t8, 0x0000(a2)             # 00000000
    sw      t3, 0x0004(a2)             # 00000004
    lbu     t4, 0x01A0(s2)             # 000001A0
    bnel    s5, t4, lbl_8001731C
    lbu     v0, 0x019E(s6)             # 0000019E
    or      a3, $zero, $zero           # a3 = 00000000
lbl_80017318:
    lbu     v0, 0x019E(s6)             # 0000019E
lbl_8001731C:
    addiu   s3, s3, 0x0002             # s3 = 00000002
    sll     t5, v0,  2
    subu    t5, t5, v0
    sll     t5, t5,  3
    addu    v1, t5, s2
lbl_80017330:
    sltu    $at, s1, v1
    bnel    $at, $zero, lbl_80017280
    lw      t9, 0x0000(s1)             # 00000018
    b       lbl_80017378
    lw      $ra, 0x003C($sp)
    lbu     t6, 0x01A1(s2)             # 000001A1
lbl_80017348:
    or      a1, s7, $zero              # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    slti    $at, t6, 0x0002
    beq     $at, $zero, lbl_8001736C
    nop
    jal     func_800169B4
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_80017378
    lw      $ra, 0x003C($sp)
lbl_8001736C:
    jal     func_80015F64
    or      a1, s7, $zero              # a1 = 00000000
lbl_80017374:
    lw      $ra, 0x003C($sp)
lbl_80017378:
    ldc1    $f20, 0x0010($sp)
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    lw      s2, 0x0024($sp)
    lw      s3, 0x0028($sp)
    lw      s4, 0x002C($sp)
    lw      s5, 0x0030($sp)
    lw      s6, 0x0034($sp)
    lw      s7, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    nop
    nop
    nop

