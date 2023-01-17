# Particle Effects: sparks
#
# Starts at VRAM: 80018A20 / VROM: ??????
#

.section .text
func_80018A20:
# MqDbg: EffectSpark_Init
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      s1, 0x0048($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x005C($sp)
    sw      s5, 0x0058($sp)
    sw      s4, 0x0054($sp)
    sw      s3, 0x0050($sp)
    sw      s2, 0x004C($sp)
    sw      s0, 0x0044($sp)
    sdc1    $f30, 0x0038($sp)
    sdc1    $f28, 0x0030($sp)
    sdc1    $f26, 0x0028($sp)
    sdc1    $f24, 0x0020($sp)
    sdc1    $f22, 0x0018($sp)
    sdc1    $f20, 0x0010($sp)
    beq     s1, $zero, lbl_80018DC0
    or      s5, s1, $zero              # s5 = 00000000
    beql    a1, $zero, lbl_80018DC4
    lw      $ra, 0x005C($sp)
    lw      t6, 0x0494(a1)             # 00000494
    beql    t6, $zero, lbl_80018DC4
    lw      $ra, 0x005C($sp)
    lw      t7, 0x0498(a1)             # 00000498
    beql    t7, $zero, lbl_80018DC4
    lw      $ra, 0x005C($sp)
    lwl     t9, 0x0000(a1)             # 00000000
    lwr     t9, 0x0003(a1)             # 00000003
    swl     t9, 0x0000(s1)             # 00000000
    swr     t9, 0x0003(s1)             # 00000003
    lhu     t9, 0x0004(a1)             # 00000004
    sh      t9, 0x0004(s1)             # 00000004
    lwc1    $f4, 0x048C(a1)            # 0000048C
    swc1    $f4, 0x048C(s1)            # 0000048C
    lwc1    $f6, 0x0490(a1)            # 00000490
    swc1    $f6, 0x0490(s1)            # 00000490
    lw      t0, 0x0494(a1)             # 00000494
    sw      t0, 0x0494(s1)             # 00000494
    lw      t1, 0x0498(a1)             # 00000498
    sw      t1, 0x0498(s1)             # 00000498
    lbu     t2, 0x049C(a1)             # 0000049C
    sb      t2, 0x049C(s1)             # 0000049C
    lbu     t3, 0x049D(a1)             # 0000049D
    sb      t3, 0x049D(s1)             # 0000049D
    lbu     t4, 0x049E(a1)             # 0000049E
    sb      t4, 0x049E(s1)             # 0000049E
    lbu     t5, 0x049F(a1)             # 0000049F
    sb      t5, 0x049F(s1)             # 0000049F
    lbu     t6, 0x04A0(a1)             # 000004A0
    sb      t6, 0x04A0(s1)             # 000004A0
    lbu     t7, 0x04A1(a1)             # 000004A1
    sb      t7, 0x04A1(s1)             # 000004A1
    lbu     t8, 0x04A2(a1)             # 000004A2
    sb      t8, 0x04A2(s1)             # 000004A2
    lbu     t9, 0x04A3(a1)             # 000004A3
    sb      t9, 0x04A3(s1)             # 000004A3
    lbu     t0, 0x04A4(a1)             # 000004A4
    sb      t0, 0x04A4(s1)             # 000004A4
    lbu     t1, 0x04A5(a1)             # 000004A5
    sb      t1, 0x04A5(s1)             # 000004A5
    lbu     t2, 0x04A6(a1)             # 000004A6
    sb      t2, 0x04A6(s1)             # 000004A6
    lbu     t3, 0x04A7(a1)             # 000004A7
    sb      t3, 0x04A7(s1)             # 000004A7
    lbu     t4, 0x04A8(a1)             # 000004A8
    sb      t4, 0x04A8(s1)             # 000004A8
    lbu     t5, 0x04A9(a1)             # 000004A9
    sb      t5, 0x04A9(s1)             # 000004A9
    lbu     t6, 0x04AA(a1)             # 000004AA
    sb      t6, 0x04AA(s1)             # 000004AA
    lbu     t7, 0x04AB(a1)             # 000004AB
    sb      t7, 0x04AB(s1)             # 000004AB
    lbu     t8, 0x04AC(a1)             # 000004AC
    sb      t8, 0x04AC(s1)             # 000004AC
    lbu     t9, 0x04AD(a1)             # 000004AD
    sb      t9, 0x04AD(s1)             # 000004AD
    lbu     t0, 0x04AE(a1)             # 000004AE
    sb      t0, 0x04AE(s1)             # 000004AE
    lbu     t1, 0x04AF(a1)             # 000004AF
    sb      t1, 0x04AF(s1)             # 000004AF
    lbu     t2, 0x04B0(a1)             # 000004B0
    sb      t2, 0x04B0(s1)             # 000004B0
    lbu     t3, 0x04B1(a1)             # 000004B1
    sb      t3, 0x04B1(s1)             # 000004B1
    lbu     t4, 0x04B2(a1)             # 000004B2
    sb      t4, 0x04B2(s1)             # 000004B2
    lbu     t5, 0x04B3(a1)             # 000004B3
    sb      t5, 0x04B3(s1)             # 000004B3
    lbu     t6, 0x04B4(a1)             # 000004B4
    lw      t5, 0x0494(s1)             # 00000494
    sb      t6, 0x04B4(s1)             # 000004B4
    lbu     t7, 0x04B5(a1)             # 000004B5
    lw      t6, 0x0498(s1)             # 00000498
    sb      t7, 0x04B5(s1)             # 000004B5
    lbu     t8, 0x04B6(a1)             # 000004B6
    multu   t5, t6
    sb      t8, 0x04B6(s1)             # 000004B6
    lbu     t9, 0x04B7(a1)             # 000004B7
    sb      t9, 0x04B7(s1)             # 000004B7
    lbu     t0, 0x04B8(a1)             # 000004B8
    sb      t0, 0x04B8(s1)             # 000004B8
    lbu     t1, 0x04B9(a1)             # 000004B9
    mflo    v0
    addiu   v0, v0, 0x0002             # v0 = 00000002
    sb      t1, 0x04B9(s1)             # 000004B9
    lbu     t2, 0x04BA(a1)             # 000004BA
    slti    $at, v0, 0x0021
    sb      t2, 0x04BA(s1)             # 000004BA
    lbu     t3, 0x04BB(a1)             # 000004BB
    sb      t3, 0x04BB(s1)             # 000004BB
    lw      t4, 0x04C0(a1)             # 000004C0
    sw      v0, 0x0008(s1)             # 00000008
    beq     $at, $zero, lbl_80018DC0
    sw      t4, 0x04C0(s1)             # 000004C0
    blez    v0, lbl_80018DBC
    or      s3, $zero, $zero           # s3 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f30, 0x6060($at)          # 80106060
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f26, 0x6064($at)          # 80106064
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f24, 0x6068($at)          # 80106068
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f22, 0x606C($at)          # 8010606C
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f20                  # $f20 = 0.50
    mtc1    $zero, $f28                # $f28 = 0.00
    or      s2, s1, $zero              # s2 = 00000000
    addiu   s0, s1, 0x000C             # s0 = 0000000C
lbl_80018C20:
    lh      t8, 0x0000(s1)             # 00000000
    or      s4, s0, $zero              # s4 = 0000000C
    mtc1    t8, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    swc1    $f10, 0x0018(s2)           # 00000018
    lh      t9, 0x0002(s1)             # 00000002
    mtc1    t9, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f4, $f18
    swc1    $f4, 0x001C(s2)            # 0000001C
    lh      t0, 0x0004(s1)             # 00000004
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f8, 0x0020(s2)            # 00000020
    sub.s   $f10, $f0, $f20
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f10, 0x0000(s0)           # 0000000C
    sub.s   $f18, $f0, $f20
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f18, 0x0004(s0)           # 00000010
    lwc1    $f12, 0x0000(s0)           # 0000000C
    lwc1    $f14, 0x0004(s0)           # 00000010
    sub.s   $f2, $f0, $f20
    mul.s   $f4, $f12, $f12
    lui     $at, 0x3F80                # $at = 3F800000
    mul.s   $f6, $f14, $f14
    swc1    $f2, 0x0008(s0)            # 00000014
    mul.s   $f10, $f2, $f2
    add.s   $f8, $f4, $f6
    add.s   $f0, $f8, $f10
    sqrt.s  $f16, $f0
    abs.s   $f0, $f16
    c.lt.s  $f0, $f30
    nop
    bc1tl   lbl_80018D0C
    swc1    $f28, 0x0008(s0)           # 00000014
    mtc1    $at, $f18                  # $f18 = 1.00
    lwc1    $f4, 0x048C(s1)            # 0000048C
    div.s   $f0, $f18, $f16
    mul.s   $f6, $f4, $f0
    nop
    mul.s   $f8, $f12, $f6
    lwc1    $f6, 0x0008(s0)            # 00000014
    swc1    $f8, 0x0000(s0)            # 0000000C
    lwc1    $f10, 0x048C(s1)           # 0000048C
    mul.s   $f18, $f10, $f0
    nop
    mul.s   $f4, $f14, $f18
    swc1    $f4, 0x0004(s0)            # 00000010
    lwc1    $f8, 0x048C(s1)            # 0000048C
    mul.s   $f10, $f8, $f0
    nop
    mul.s   $f18, $f6, $f10
    b       lbl_80018D18
    swc1    $f18, 0x0008(s0)           # 00000014
    swc1    $f28, 0x0008(s0)           # 00000014
lbl_80018D0C:
    swc1    $f28, 0x0000(s0)           # 0000000C
    lwc1    $f4, 0x048C(s1)            # 0000048C
    swc1    $f4, 0x0004(s0)            # 00000010
lbl_80018D18:
    jal     func_800CDCCC              # Rand.Next() float
    nop
    mul.s   $f8, $f0, $f24
    sub.s   $f6, $f22, $f8
    trunc.w.s $f10, $f6
    mfc1    t2, $f10
    jal     func_800CDCCC              # Rand.Next() float
    sh      t2, 0x0018(s0)             # 00000024
    mul.s   $f18, $f0, $f24
    sub.s   $f4, $f22, $f18
    trunc.w.s $f8, $f4
    mfc1    t4, $f8
    jal     func_800CDCCC              # Rand.Next() float
    sh      t4, 0x001A(s0)             # 00000026
    mul.s   $f6, $f0, $f24
    sub.s   $f10, $f22, $f6
    trunc.w.s $f18, $f10
    mfc1    t6, $f18
    jal     func_800CDCCC              # Rand.Next() float
    sh      t6, 0x001C(s0)             # 00000028
    mul.s   $f4, $f0, $f26
    trunc.w.s $f8, $f4
    mfc1    t8, $f8
    jal     func_800CDCCC              # Rand.Next() float
    sh      t8, 0x001E(s0)             # 0000002A
    mul.s   $f6, $f0, $f26
    trunc.w.s $f10, $f6
    mfc1    t0, $f10
    jal     func_800CDCCC              # Rand.Next() float
    sh      t0, 0x0020(s0)             # 0000002C
    mul.s   $f18, $f0, $f26
    trunc.w.s $f4, $f18
    mfc1    t2, $f4
    nop
    sh      t2, 0x0022(s4)             # 0000002E
    lw      t3, 0x0008(s5)             # 00000008
    addiu   s3, s3, 0x0001             # s3 = 00000001
    addiu   s2, s2, 0x0024             # s2 = 00000024
    slt     $at, s3, t3
    bne     $at, $zero, lbl_80018C20
    addiu   s0, s0, 0x0024             # s0 = 00000030
lbl_80018DBC:
    sw      $zero, 0x04BC(s1)          # 000004BC
lbl_80018DC0:
    lw      $ra, 0x005C($sp)
lbl_80018DC4:
    ldc1    $f20, 0x0010($sp)
    ldc1    $f22, 0x0018($sp)
    ldc1    $f24, 0x0020($sp)
    ldc1    $f26, 0x0028($sp)
    ldc1    $f28, 0x0030($sp)
    ldc1    $f30, 0x0038($sp)
    lw      s0, 0x0044($sp)
    lw      s1, 0x0048($sp)
    lw      s2, 0x004C($sp)
    lw      s3, 0x0050($sp)
    lw      s4, 0x0054($sp)
    lw      s5, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_80018DFC:
# MqDbg: EffectSpark_Destroy
# Store A0 to stack
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_80018E08:
# MqDbg: EffectSpark_Update
    lw      t6, 0x0008(a0)             # 00000008
    or      v0, $zero, $zero           # v0 = 00000000
    or      v1, a0, $zero              # v1 = 00000000
    blezl   t6, lbl_80018EA4
    lw      t7, 0x04BC(a0)             # 000004BC
    lwc1    $f4, 0x0018(v1)            # 00000018
lbl_80018E20:
    lwc1    $f6, 0x000C(v1)            # 0000000C
    lwc1    $f0, 0x0010(v1)            # 00000010
    lwc1    $f10, 0x001C(v1)           # 0000001C
    add.s   $f8, $f4, $f6
    lwc1    $f4, 0x0014(v1)            # 00000014
    lwc1    $f18, 0x0020(v1)           # 00000020
    add.s   $f16, $f10, $f0
    swc1    $f8, 0x0018(v1)            # 00000018
    lh      t7, 0x002A(v1)             # 0000002A
    add.s   $f6, $f18, $f4
    swc1    $f16, 0x001C(v1)           # 0000001C
    lh      t8, 0x0024(v1)             # 00000024
    lh      t0, 0x002C(v1)             # 0000002C
    swc1    $f6, 0x0020(v1)            # 00000020
    lwc1    $f8, 0x0490(a0)            # 00000490
    lh      t1, 0x0026(v1)             # 00000026
    lh      t3, 0x002E(v1)             # 0000002E
    add.s   $f10, $f0, $f8
    lh      t4, 0x0028(v1)             # 00000028
    addu    t9, t7, t8
    addu    t2, t0, t1
    addu    t5, t3, t4
    swc1    $f10, 0x0010(v1)           # 00000010
    sh      t9, 0x002A(v1)             # 0000002A
    sh      t2, 0x002C(v1)             # 0000002C
    sh      t5, 0x002E(v1)             # 0000002E
    lw      t6, 0x0008(a0)             # 00000008
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   v1, v1, 0x0024             # v1 = 00000024
    slt     $at, v0, t6
    bnel    $at, $zero, lbl_80018E20
    lwc1    $f4, 0x0018(v1)            # 0000003C
    lw      t7, 0x04BC(a0)             # 000004BC
lbl_80018EA4:
    lw      t9, 0x04C0(a0)             # 000004C0
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t8, t7, 0x0001             # t8 = 00000001
    slt     $at, t9, t8
    beq     $at, $zero, lbl_80018EC4
    sw      t8, 0x04BC(a0)             # 000004BC
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_80018EC4:
    jr      $ra
    nop


func_80018ECC:
# MqDbg: EffectSpark_Draw
# gameplay_keep texture: Blank Circle
    addiu   $sp, $sp, 0xFE00           # $sp -= 0x200
    sw      s8, 0x0058($sp)
    sw      s2, 0x0040($sp)
    or      s2, a1, $zero              # s2 = 00000000
    or      s8, a0, $zero              # s8 = 00000000
    sw      $ra, 0x005C($sp)
    sw      s7, 0x0054($sp)
    sw      s6, 0x0050($sp)
    sw      s5, 0x004C($sp)
    sw      s4, 0x0048($sp)
    sw      s3, 0x0044($sp)
    sw      s1, 0x003C($sp)
    sw      s0, 0x0038($sp)
    sdc1    $f26, 0x0030($sp)
    sdc1    $f24, 0x0028($sp)
    sdc1    $f22, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    jal     func_8001A880
    sw      s8, 0x01F8($sp)
    or      s4, v0, $zero              # s4 = 00000000
    beq     s8, $zero, lbl_8001A0A0
    lui     t7, 0xDA38                 # t7 = DA380000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0xEDB0             # t8 = 800FEDB0
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s2)             # 000002D0
    ori     t7, t7, 0x0003             # t7 = DA380003
    sw      t7, 0x0000(v1)             # 00000000
    sw      t8, 0x0004(v1)             # 00000004
    lw      a0, 0x02D0(s2)             # 000002D0
    jal     func_8007DFBC
    addiu   a1, $zero, 0x0026          # a1 = 00000026
    lui     a3, 0xE700                 # a3 = E7000000
    addiu   t9, v0, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s2)             # 000002D0
    lui     t0, 0xE300                 # t0 = E3000000
    ori     t0, t0, 0x0A01             # t0 = E3000A01
    lui     t1, 0x0010                 # t1 = 00100000
    sw      t1, 0x0004(v0)             # 00000004
    sw      t0, 0x0000(v0)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t4, 0xD700                 # t4 = D7000000
    lui     t7, 0xFD90                 # t7 = FD900000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      a3, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    ori     t4, t4, 0x0002             # t4 = D7000002
    addiu   t5, $zero, 0xFFFF          # t5 = FFFFFFFF
    addiu   t3, v1, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(s2)             # 000002D0
    sw      t5, 0x0004(v1)             # 00000004
    sw      t4, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t8, 0x0404                 # t8 = 04040000
    addiu   t8, t8, 0x9450             # t8 = 04039450
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s2)             # 000002D0
    sw      t8, 0x0004(v1)             # 00000004
    sw      t7, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t1, 0x0701                 # t1 = 07010000
    ori     t1, t1, 0x4050             # t1 = 07014050
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s2)             # 000002D0
    lui     t0, 0xF590                 # t0 = F5900000
    sw      t0, 0x0000(v1)             # 00000000
    sw      t1, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t3, 0xE600                 # t3 = E6000000
    lui     t5, 0xF300                 # t5 = F3000000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t3, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t6, 0x071F                 # t6 = 071F0000
    ori     t6, t6, 0xF200             # t6 = 071FF200
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(s2)             # 000002D0
    sw      t6, 0x0004(v1)             # 00000004
    sw      t5, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t9, 0xF588                 # t9 = F5880000
    ori     t9, t9, 0x0800             # t9 = F5880800
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      a3, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t0, 0x0001                 # t0 = 00010000
    ori     t0, t0, 0x4050             # t0 = 00014050
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s2)             # 000002D0
    sw      t0, 0x0004(v1)             # 00000004
    sw      t9, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t3, 0x0007                 # t3 = 00070000
    ori     t3, t3, 0xC07C             # t3 = 0007C07C
    addiu   t1, v1, 0x0008             # t1 = 00000008
    sw      t1, 0x02D0(s2)             # 000002D0
    lui     t2, 0xF200                 # t2 = F2000000
    sw      t2, 0x0000(v1)             # 00000000
    sw      t3, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t5, 0xFCFF                 # t5 = FCFF0000
    lui     t6, 0xFFFE                 # t6 = FFFE0000
    addiu   t4, v1, 0x0008             # t4 = 00000008
    sw      t4, 0x02D0(s2)             # 000002D0
    ori     t6, t6, 0x7238             # t6 = FFFE7238
    ori     t5, t5, 0xFFFF             # t5 = FCFFFFFF
    sw      t5, 0x0000(v1)             # 00000000
    sw      t6, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t8, 0xE200                 # t8 = E2000000
    lui     t9, 0x0C18                 # t9 = 0C180000
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s2)             # 000002D0
    ori     t9, t9, 0x4B50             # t9 = 0C184B50
    ori     t8, t8, 0x001C             # t8 = E200001C
    sw      t8, 0x0000(v1)             # 00000000
    sw      t9, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t1, 0xD9F0                 # t1 = D9F00000
    ori     t1, t1, 0xF9FF             # t1 = D9F0F9FF
    addiu   t0, v1, 0x0008             # t0 = 00000008
    sw      t0, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t1, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t3, 0xD9FF                 # t3 = D9FF0000
    lui     t4, 0x0020                 # t4 = 00200000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s2)             # 000002D0
    ori     t4, t4, 0x0005             # t4 = 00200005
    ori     t3, t3, 0xFFFF             # t3 = D9FFFFFF
    sw      t3, 0x0000(v1)             # 00000000
    sw      t4, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    addiu   t5, v1, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      a3, 0x0000(v1)             # 00000000
    lw      t7, 0x0008(s8)             # 00000008
    lw      t6, 0x02C4(s2)             # 000002C4
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    sll     t8, t7,  6
    addiu   t9, t8, 0x000F             # t9 = E200002B
    and     t0, t9, $at
    subu    s1, t6, t0
    beq     s1, $zero, lbl_8001A0A0
    sw      s1, 0x02C4(s2)             # 000002C4
    lw      t1, 0x04BC(s8)             # 000004BC
    lw      t2, 0x04C0(s8)             # 000004C0
    lbu     t3, 0x049C(s8)             # 0000049C
    mtc1    t1, $f4                    # $f4 = -8478609000000000.00
    mtc1    t2, $f8                    # $f8 = 0.00
    or      v0, $zero, $zero           # v0 = 00000000
    cvt.s.w $f6, $f4
    mtc1    t3, $f4                    # $f4 = -9007199000000000.00
    cvt.s.w $f10, $f8
    cvt.s.w $f2, $f4
    bgez    t3, lbl_80019174
    div.s   $f0, $f6, $f10
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f2, $f2, $f8
lbl_80019174:
    lbu     t4, 0x04AC(s8)             # 000004AC
    mtc1    t4, $f6                    # $f6 = 0.00
    bgez    t4, lbl_80019194
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80019194:
    sub.s   $f8, $f10, $f2
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    mul.s   $f6, $f8, $f0
    add.s   $f4, $f6, $f2
    cfc1    t5, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beq     t7, $zero, lbl_8001920C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80019204
    nop
    mfc1    t7, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001921C
    or      t7, t7, $at                # t7 = 80000000
lbl_80019204:
    b       lbl_8001921C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_8001920C:
    mfc1    t7, $f10
    nop
    bltz    t7, lbl_80019204
    nop
lbl_8001921C:
    sb      t7, 0x01EB($sp)
    lbu     t8, 0x049D(s8)             # 0000049D
    ctc1    t5, $f31
    mtc1    t8, $f8                    # $f8 = -590297800000000000000.00
    bgez    t8, lbl_80019244
    cvt.s.w $f12, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f12, $f12, $f6
lbl_80019244:
    lbu     t9, 0x04AD(s8)             # 000004AD
    mtc1    t9, $f4                    # $f4 = -590298800000000000000.00
    bgez    t9, lbl_80019264
    cvt.s.w $f10, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f10, $f10, $f8
lbl_80019264:
    sub.s   $f6, $f10, $f12
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    mul.s   $f4, $f6, $f0
    add.s   $f8, $f4, $f12
    cfc1    t6, $f31
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    beq     t0, $zero, lbl_800192DC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    bne     t0, $zero, lbl_800192D4
    nop
    mfc1    t0, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800192EC
    or      t0, t0, $at                # t0 = 80000000
lbl_800192D4:
    b       lbl_800192EC
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
lbl_800192DC:
    mfc1    t0, $f10
    nop
    bltz    t0, lbl_800192D4
    nop
lbl_800192EC:
    sb      t0, 0x01EA($sp)
    lbu     t1, 0x049E(s8)             # 0000049E
    ctc1    t6, $f31
    mtc1    t1, $f6                    # $f6 = -8478609000000000.00
    bgez    t1, lbl_80019314
    cvt.s.w $f14, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f14, $f14, $f4
lbl_80019314:
    lbu     t2, 0x04AE(s8)             # 000004AE
    mtc1    t2, $f8                    # $f8 = 0.00
    bgez    t2, lbl_80019334
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f10, $f10, $f6
lbl_80019334:
    sub.s   $f4, $f10, $f14
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    mul.s   $f8, $f4, $f0
    add.s   $f6, $f8, $f14
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f6
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beq     t4, $zero, lbl_800193AC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f10, $f6, $f10
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_800193A4
    nop
    mfc1    t4, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800193BC
    or      t4, t4, $at                # t4 = 80000000
lbl_800193A4:
    b       lbl_800193BC
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
lbl_800193AC:
    mfc1    t4, $f10
    nop
    bltz    t4, lbl_800193A4
    nop
lbl_800193BC:
    sb      t4, 0x01E9($sp)
    lbu     t5, 0x049F(s8)             # 0000049F
    ctc1    t3, $f31
    mtc1    t5, $f4                    # $f4 = 0.00
    bgez    t5, lbl_800193E4
    cvt.s.w $f16, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f16, $f16, $f8
lbl_800193E4:
    lbu     t7, 0x04AF(s8)             # 000004AF
    mtc1    t7, $f6                    # $f6 = NaN
    bgez    t7, lbl_80019404
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80019404:
    sub.s   $f8, $f10, $f16
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    mul.s   $f6, $f8, $f0
    add.s   $f4, $f6, $f16
    cfc1    t8, $f31
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    beq     t9, $zero, lbl_8001947C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    bne     t9, $zero, lbl_80019474
    nop
    mfc1    t9, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001948C
    or      t9, t9, $at                # t9 = 80000000
lbl_80019474:
    b       lbl_8001948C
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
lbl_8001947C:
    mfc1    t9, $f10
    nop
    bltz    t9, lbl_80019474
    nop
lbl_8001948C:
    sb      t9, 0x01E8($sp)
    lbu     t6, 0x04A0(s8)             # 000004A0
    ctc1    t8, $f31
    mtc1    t6, $f8                    # $f8 = NaN
    bgez    t6, lbl_800194B4
    cvt.s.w $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f18, $f18, $f6
lbl_800194B4:
    lbu     t0, 0x04B0(s8)             # 000004B0
    mtc1    t0, $f4                    # $f4 = NaN
    bgez    t0, lbl_800194D4
    cvt.s.w $f10, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f10, $f10, $f8
lbl_800194D4:
    sub.s   $f6, $f10, $f18
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    mul.s   $f4, $f6, $f0
    add.s   $f8, $f4, $f18
    cfc1    t1, $f31
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    beq     t2, $zero, lbl_8001954C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    bne     t2, $zero, lbl_80019544
    nop
    mfc1    t2, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001955C
    or      t2, t2, $at                # t2 = 80000000
lbl_80019544:
    b       lbl_8001955C
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
lbl_8001954C:
    mfc1    t2, $f10
    nop
    bltz    t2, lbl_80019544
    nop
lbl_8001955C:
    sb      t2, 0x01E7($sp)
    lbu     t3, 0x04A1(s8)             # 000004A1
    ctc1    t1, $f31
    mtc1    t3, $f6                    # $f6 = -9007199000000000.00
    bgez    t3, lbl_80019584
    cvt.s.w $f2, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f2, $f2, $f4
lbl_80019584:
    lbu     t4, 0x04B1(s8)             # 000004B1
    mtc1    t4, $f8                    # $f8 = NaN
    bgez    t4, lbl_800195A4
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f10, $f10, $f6
lbl_800195A4:
    sub.s   $f4, $f10, $f2
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    mul.s   $f8, $f4, $f0
    add.s   $f6, $f8, $f2
    cfc1    t5, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f6
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beq     t7, $zero, lbl_8001961C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f10, $f6, $f10
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80019614
    nop
    mfc1    t7, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001962C
    or      t7, t7, $at                # t7 = 80000000
lbl_80019614:
    b       lbl_8001962C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_8001961C:
    mfc1    t7, $f10
    nop
    bltz    t7, lbl_80019614
    nop
lbl_8001962C:
    sb      t7, 0x01E6($sp)
    lbu     t8, 0x04A2(s8)             # 000004A2
    ctc1    t5, $f31
    mtc1    t8, $f4                    # $f4 = -590297800000000000000.00
    bgez    t8, lbl_80019654
    cvt.s.w $f12, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f12, $f12, $f8
lbl_80019654:
    lbu     t9, 0x04B2(s8)             # 000004B2
    mtc1    t9, $f6                    # $f6 = NaN
    bgez    t9, lbl_80019674
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80019674:
    sub.s   $f8, $f10, $f12
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    mul.s   $f6, $f8, $f0
    add.s   $f4, $f6, $f12
    cfc1    t6, $f31
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    beq     t0, $zero, lbl_800196EC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    bne     t0, $zero, lbl_800196E4
    nop
    mfc1    t0, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800196FC
    or      t0, t0, $at                # t0 = 80000000
lbl_800196E4:
    b       lbl_800196FC
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
lbl_800196EC:
    mfc1    t0, $f10
    nop
    bltz    t0, lbl_800196E4
    nop
lbl_800196FC:
    sb      t0, 0x01E5($sp)
    lbu     t1, 0x04A3(s8)             # 000004A3
    ctc1    t6, $f31
    mtc1    t1, $f8                    # $f8 = -8478609000000000.00
    bgez    t1, lbl_80019724
    cvt.s.w $f14, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f14, $f14, $f6
lbl_80019724:
    lbu     t2, 0x04B3(s8)             # 000004B3
    mtc1    t2, $f4                    # $f4 = NaN
    bgez    t2, lbl_80019744
    cvt.s.w $f10, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f10, $f10, $f8
lbl_80019744:
    sub.s   $f6, $f10, $f14
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    mul.s   $f4, $f6, $f0
    add.s   $f8, $f4, $f14
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beq     t4, $zero, lbl_800197BC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_800197B4
    nop
    mfc1    t4, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800197CC
    or      t4, t4, $at                # t4 = 80000000
lbl_800197B4:
    b       lbl_800197CC
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
lbl_800197BC:
    mfc1    t4, $f10
    nop
    bltz    t4, lbl_800197B4
    nop
lbl_800197CC:
    sb      t4, 0x01E4($sp)
    lbu     t5, 0x04A4(s8)             # 000004A4
    ctc1    t3, $f31
    mtc1    t5, $f6                    # $f6 = 0.00
    bgez    t5, lbl_800197F4
    cvt.s.w $f16, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f16, $f16, $f4
lbl_800197F4:
    lbu     t7, 0x04B4(s8)             # 000004B4
    mtc1    t7, $f8                    # $f8 = NaN
    bgez    t7, lbl_80019814
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f10, $f10, $f6
lbl_80019814:
    sub.s   $f4, $f10, $f16
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    mul.s   $f8, $f4, $f0
    add.s   $f6, $f8, $f16
    cfc1    t8, $f31
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f6
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    beq     t9, $zero, lbl_8001988C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sub.s   $f10, $f6, $f10
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    bne     t9, $zero, lbl_80019884
    nop
    mfc1    t9, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001989C
    or      t9, t9, $at                # t9 = 80000000
lbl_80019884:
    b       lbl_8001989C
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
lbl_8001988C:
    mfc1    t9, $f10
    nop
    bltz    t9, lbl_80019884
    nop
lbl_8001989C:
    sb      t9, 0x01E3($sp)
    lbu     t6, 0x04A5(s8)             # 000004A5
    ctc1    t8, $f31
    mtc1    t6, $f4                    # $f4 = NaN
    bgez    t6, lbl_800198C4
    cvt.s.w $f18, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f18, $f18, $f8
lbl_800198C4:
    lbu     t0, 0x04B5(s8)             # 000004B5
    mtc1    t0, $f6                    # $f6 = NaN
    bgez    t0, lbl_800198E4
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_800198E4:
    sub.s   $f8, $f10, $f18
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    mul.s   $f6, $f8, $f0
    add.s   $f4, $f6, $f18
    cfc1    t1, $f31
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    beq     t2, $zero, lbl_8001995C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    bne     t2, $zero, lbl_80019954
    nop
    mfc1    t2, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_8001996C
    or      t2, t2, $at                # t2 = 80000000
lbl_80019954:
    b       lbl_8001996C
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
lbl_8001995C:
    mfc1    t2, $f10
    nop
    bltz    t2, lbl_80019954
    nop
lbl_8001996C:
    sb      t2, 0x01E2($sp)
    lbu     t3, 0x04A6(s8)             # 000004A6
    ctc1    t1, $f31
    mtc1    t3, $f8                    # $f8 = -9007199000000000.00
    bgez    t3, lbl_80019994
    cvt.s.w $f2, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f2, $f2, $f6
lbl_80019994:
    lbu     t4, 0x04B6(s8)             # 000004B6
    mtc1    t4, $f4                    # $f4 = NaN
    bgez    t4, lbl_800199B4
    cvt.s.w $f10, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f10, $f10, $f8
lbl_800199B4:
    sub.s   $f6, $f10, $f2
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    mul.s   $f4, $f6, $f0
    add.s   $f8, $f4, $f2
    cfc1    t5, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beq     t7, $zero, lbl_80019A2C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80019A24
    nop
    mfc1    t7, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019A3C
    or      t7, t7, $at                # t7 = 80000000
lbl_80019A24:
    b       lbl_80019A3C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_80019A2C:
    mfc1    t7, $f10
    nop
    bltz    t7, lbl_80019A24
    nop
lbl_80019A3C:
    sb      t7, 0x01E1($sp)
    lbu     t8, 0x04A7(s8)             # 000004A7
    ctc1    t5, $f31
    mtc1    t8, $f6                    # $f6 = -590297800000000000000.00
    bgez    t8, lbl_80019A64
    cvt.s.w $f12, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f12, $f12, $f4
lbl_80019A64:
    lbu     t9, 0x04B7(s8)             # 000004B7
    mtc1    t9, $f8                    # $f8 = NaN
    bgez    t9, lbl_80019A84
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f10, $f10, $f6
lbl_80019A84:
    sub.s   $f4, $f10, $f12
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    mul.s   $f8, $f4, $f0
    add.s   $f6, $f8, $f12
    cfc1    t6, $f31
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f6
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    beq     t0, $zero, lbl_80019AFC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sub.s   $f10, $f6, $f10
    ctc1    t0, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    bne     t0, $zero, lbl_80019AF4
    nop
    mfc1    t0, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019B0C
    or      t0, t0, $at                # t0 = 80000000
lbl_80019AF4:
    b       lbl_80019B0C
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
lbl_80019AFC:
    mfc1    t0, $f10
    nop
    bltz    t0, lbl_80019AF4
    nop
lbl_80019B0C:
    sb      t0, 0x01E0($sp)
    lbu     t1, 0x04A8(s8)             # 000004A8
    ctc1    t6, $f31
    mtc1    t1, $f4                    # $f4 = -8478609000000000.00
    bgez    t1, lbl_80019B34
    cvt.s.w $f14, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f14, $f14, $f8
lbl_80019B34:
    lbu     t2, 0x04B8(s8)             # 000004B8
    mtc1    t2, $f6                    # $f6 = NaN
    bgez    t2, lbl_80019B54
    cvt.s.w $f10, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80019B54:
    sub.s   $f8, $f10, $f14
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    mul.s   $f6, $f8, $f0
    add.s   $f4, $f6, $f14
    cfc1    t3, $f31
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    beq     t4, $zero, lbl_80019BCC
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t4, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t4, $f31
    nop
    andi    t4, t4, 0x0078             # t4 = 00000000
    bne     t4, $zero, lbl_80019BC4
    nop
    mfc1    t4, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019BDC
    or      t4, t4, $at                # t4 = 80000000
lbl_80019BC4:
    b       lbl_80019BDC
    addiu   t4, $zero, 0xFFFF          # t4 = FFFFFFFF
lbl_80019BCC:
    mfc1    t4, $f10
    nop
    bltz    t4, lbl_80019BC4
    nop
lbl_80019BDC:
    sb      t4, 0x01DF($sp)
    lbu     t5, 0x04A9(s8)             # 000004A9
    ctc1    t3, $f31
    mtc1    t5, $f8                    # $f8 = 0.00
    bgez    t5, lbl_80019C04
    cvt.s.w $f16, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f16, $f16, $f6
lbl_80019C04:
    lbu     t7, 0x04B9(s8)             # 000004B9
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t7, $f4                    # $f4 = NaN
    bgez    t7, lbl_80019C24
    cvt.s.w $f10, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f10, $f10, $f8
lbl_80019C24:
    sub.s   $f6, $f10, $f16
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f4, $f6, $f0
    add.s   $f8, $f4, $f16
    cfc1    t8, $f31
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    beql    t9, $zero, lbl_80019CA4
    mfc1    t9, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t9, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    bne     t9, $zero, lbl_80019C98
    nop
    mfc1    t9, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019CB0
    or      t9, t9, $at                # t9 = 80000000
lbl_80019C98:
    b       lbl_80019CB0
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
    mfc1    t9, $f10
lbl_80019CA4:
    nop
    bltz    t9, lbl_80019C98
    nop
lbl_80019CB0:
    sb      t9, 0x01DE($sp)
    lbu     t6, 0x04AA(s8)             # 000004AA
    ctc1    t8, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t6, $f6                    # $f6 = NaN
    bgez    t6, lbl_80019CD8
    cvt.s.w $f18, $f6
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_80019CD8:
    lbu     t0, 0x04BA(s8)             # 000004BA
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t0, $f8                    # $f8 = NaN
    bgez    t0, lbl_80019CF8
    cvt.s.w $f10, $f8
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f10, $f10, $f6
lbl_80019CF8:
    sub.s   $f4, $f10, $f18
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f8, $f4, $f0
    add.s   $f6, $f8, $f18
    cfc1    t1, $f31
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f6
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    beql    t2, $zero, lbl_80019D78
    mfc1    t2, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sub.s   $f10, $f6, $f10
    ctc1    t2, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    bne     t2, $zero, lbl_80019D6C
    nop
    mfc1    t2, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019D84
    or      t2, t2, $at                # t2 = 80000000
lbl_80019D6C:
    b       lbl_80019D84
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
    mfc1    t2, $f10
lbl_80019D78:
    nop
    bltz    t2, lbl_80019D6C
    nop
lbl_80019D84:
    sb      t2, 0x01DD($sp)
    lbu     t3, 0x04AB(s8)             # 000004AB
    ctc1    t1, $f31
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t3, $f4                    # $f4 = -9007199000000000.00
    sll     t6, v0,  4
    bgez    t3, lbl_80019DB0
    cvt.s.w $f2, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f2, $f2, $f8
lbl_80019DB0:
    lbu     t4, 0x04BB(s8)             # 000004BB
    lui     $at, 0x4F80                # $at = 4F800000
    addu    s0, s1, t6
    mtc1    t4, $f6                    # $f6 = NaN
    or      s3, s8, $zero              # s3 = 00000000
    bgez    t4, lbl_80019DD8
    cvt.s.w $f10, $f6
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80019DD8:
    sub.s   $f8, $f10, $f2
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    addiu   s6, $zero, 0x0020          # s6 = 00000020
    mul.s   $f6, $f8, $f0
    addiu   s5, $zero, 0x0400          # s5 = 00000400
    add.s   $f4, $f6, $f2
    cfc1    t5, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f4
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beql    t7, $zero, lbl_80019E60
    mfc1    t7, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f10, $f4, $f10
    ctc1    t7, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_80019E54
    nop
    mfc1    t7, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_80019E6C
    or      t7, t7, $at                # t7 = 80000000
lbl_80019E54:
    b       lbl_80019E6C
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    mfc1    t7, $f10
lbl_80019E60:
    nop
    bltz    t7, lbl_80019E54
    nop
lbl_80019E6C:
    sb      t7, 0x01DC($sp)
    lw      t8, 0x0008(s8)             # 00000008
    ctc1    t5, $f31
    or      s7, $zero, $zero           # s7 = 00000000
    blez    t8, lbl_8001A08C
    lui     $at, 0x0001                # $at = 00010000
    ori     $at, $at, 0x1DA0           # $at = 00011DA0
    addu    t9, s4, $at
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f26                  # $f26 = 1.00
    lui     $at, 0x3C80                # $at = 3C800000
    mtc1    $at, $f24                  # $f24 = 0.02
    lui     $at, 0x3FC0                # $at = 3FC00000
    mtc1    $at, $f22                  # $f22 = 1.50
    lui     $at, 0x4020                # $at = 40200000
    mtc1    $at, $f20                  # $f20 = 2.50
    sw      t9, 0x006C($sp)
    addiu   s4, $zero, 0xFFE0          # s4 = FFFFFFE0
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF10
lbl_80019EB8:
    lw      a1, 0x0018(s3)             # 00000018
    lw      a2, 0x001C(s3)             # 0000001C
    jal     func_8008F82C              # guTranslateF
    lw      a3, 0x0020(s3)             # 00000020
    jal     func_800CDCCC              # Rand.Next() float
    nop
    mul.s   $f8, $f0, $f20
    mfc1    a3, $f26
    addiu   a0, $sp, 0x00D0            # a0 = FFFFFED0
    add.s   $f6, $f8, $f22
    mul.s   $f2, $f6, $f24
    mfc1    a1, $f2
    mfc1    a2, $f2
    jal     func_8008F4A8              # guScaleF
    nop
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF10
    lw      a1, 0x006C($sp)
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0090            # a2 = FFFFFE90
    addiu   a0, $sp, 0x0090            # a0 = FFFFFE90
    addiu   a1, $sp, 0x00D0            # a1 = FFFFFED0
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0150            # a2 = FFFFFF50
    sh      s4, 0x0000(s0)             # 00000000
    sh      s4, 0x0002(s0)             # 00000002
    sh      $zero, 0x0004(s0)          # 00000004
    lbu     t0, 0x01EB($sp)
    addiu   s0, s0, 0x0040             # s0 = 00000040
    or      a0, s2, $zero              # a0 = 00000000
    sb      t0, -0x0034(s0)            # 0000000C
    lbu     t1, 0x01EA($sp)
    addiu   a1, $sp, 0x0150            # a1 = FFFFFF50
    sb      t1, -0x0033(s0)            # 0000000D
    lbu     t2, 0x01E9($sp)
    sb      t2, -0x0032(s0)            # 0000000E
    lbu     t3, 0x01E8($sp)
    sh      $zero, -0x0038(s0)         # 00000008
    sh      s5, -0x0036(s0)            # 0000000A
    sh      $zero, -0x003A(s0)         # 00000006
    sh      s6, -0x0030(s0)            # 00000010
    sh      s6, -0x002E(s0)            # 00000012
    sh      $zero, -0x002C(s0)         # 00000014
    sb      t3, -0x0031(s0)            # 0000000F
    lbu     t4, 0x01E7($sp)
    sb      t4, -0x0024(s0)            # 0000001C
    lbu     t5, 0x01E6($sp)
    sb      t5, -0x0023(s0)            # 0000001D
    lbu     t7, 0x01E5($sp)
    sb      t7, -0x0022(s0)            # 0000001E
    lbu     t8, 0x01E4($sp)
    sh      s5, -0x0028(s0)            # 00000018
    sh      $zero, -0x0026(s0)         # 0000001A
    sh      $zero, -0x002A(s0)         # 00000016
    sh      s4, -0x0020(s0)            # 00000020
    sh      s6, -0x001E(s0)            # 00000022
    sh      $zero, -0x001C(s0)         # 00000024
    sb      t8, -0x0021(s0)            # 0000001F
    lbu     t9, 0x01E3($sp)
    sb      t9, -0x0014(s0)            # 0000002C
    lbu     t6, 0x01E2($sp)
    sb      t6, -0x0013(s0)            # 0000002D
    lbu     t0, 0x01E1($sp)
    sb      t0, -0x0012(s0)            # 0000002E
    lbu     t1, 0x01E0($sp)
    sh      $zero, -0x0018(s0)         # 00000028
    sh      $zero, -0x0016(s0)         # 0000002A
    sh      $zero, -0x001A(s0)         # 00000026
    sh      s6, -0x0010(s0)            # 00000030
    sh      s4, -0x000E(s0)            # 00000032
    sh      $zero, -0x000C(s0)         # 00000034
    sb      t1, -0x0011(s0)            # 0000002F
    lbu     t2, 0x01DF($sp)
    sb      t2, -0x0004(s0)            # 0000003C
    lbu     t3, 0x01DE($sp)
    sb      t3, -0x0003(s0)            # 0000003D
    lbu     t4, 0x01DD($sp)
    sb      t4, -0x0002(s0)            # 0000003E
    lbu     t5, 0x01DC($sp)
    sh      s5, -0x0008(s0)            # 00000038
    sh      s5, -0x0006(s0)            # 0000003A
    sh      $zero, -0x000A(s0)         # 00000036
    jal     func_8008FC98
    sb      t5, -0x0001(s0)            # 0000003F
    beq     v0, $zero, lbl_8001A0A0
    lui     t6, 0x0100                 # t6 = 01000000
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t8, 0xDA38                 # t8 = DA380000
    ori     t8, t8, 0x0003             # t8 = DA380003
    addiu   t7, v1, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s2)             # 000002D0
    sw      v0, 0x0004(v1)             # 00000004
    sw      t8, 0x0000(v1)             # 00000000
    lw      v1, 0x02D0(s2)             # 000002D0
    sll     t0, s7,  6
    addu    t1, t0, s1
    addiu   t9, v1, 0x0008             # t9 = 00000008
    sw      t9, 0x02D0(s2)             # 000002D0
    ori     t6, t6, 0x4008             # t6 = 01004008
    sw      t6, 0x0000(v1)             # 00000000
    sw      t1, 0x0004(v1)             # 00000004
    lw      v1, 0x02D0(s2)             # 000002D0
    lui     t3, 0x0604                 # t3 = 06040000
    lui     t4, 0x0004                 # t4 = 00040000
    addiu   t2, v1, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s2)             # 000002D0
    ori     t4, t4, 0x0602             # t4 = 00040602
    ori     t3, t3, 0x0006             # t3 = 06040006
    sw      t3, 0x0000(v1)             # 00000000
    sw      t4, 0x0004(v1)             # 00000004
    lw      t5, 0x01F8($sp)
    addiu   s7, s7, 0x0001             # s7 = 00000001
    addiu   s3, s3, 0x0024             # s3 = 00000024
    lw      t7, 0x0008(t5)             # 00000008
    slt     $at, s7, t7
    bnel    $at, $zero, lbl_80019EB8
    addiu   a0, $sp, 0x0110            # a0 = FFFFFF10
    lui     a3, 0xE700                 # a3 = E7000000
lbl_8001A08C:
    lw      v1, 0x02D0(s2)             # 000002D0
    addiu   t8, v1, 0x0008             # t8 = 00000008
    sw      t8, 0x02D0(s2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      a3, 0x0000(v1)             # 00000000
lbl_8001A0A0:
    lw      $ra, 0x005C($sp)
    ldc1    $f20, 0x0018($sp)
    ldc1    $f22, 0x0020($sp)
    ldc1    $f24, 0x0028($sp)
    ldc1    $f26, 0x0030($sp)
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
    addiu   $sp, $sp, 0x0200           # $sp += 0x200

