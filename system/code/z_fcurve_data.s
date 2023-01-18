# "FCurve Animation Data" part of the code file
#
# Seems to handle FCurve animation computations for different actors.
#
# Starts at VRAM: 80059990 / VROM: ACF8F0
#

func_80059990:
# MqDbg: Curve_CubicHermiteSpline
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    mul.s   $f2, $f12, $f12
    lui     $at, 0x4040                # $at = 40400000
    mtc1    $at, $f4                   # $f4 = 3.00
    lui     $at, 0x3F80                # $at = 3F800000
    mul.s   $f16, $f2, $f12
    nop
    mul.s   $f6, $f2, $f4
    mtc1    $at, $f4                   # $f4 = 1.00
    add.s   $f18, $f16, $f16
    swc1    $f6, 0x0004($sp)
    lwc1    $f8, 0x0004($sp)
    sub.s   $f10, $f18, $f8
    add.s   $f6, $f10, $f4
    lwc1    $f10, 0x0040($sp)
    mul.s   $f4, $f6, $f10
    sub.s   $f6, $f8, $f18
    lwc1    $f10, 0x0044($sp)
    mul.s   $f8, $f6, $f10
    add.s   $f10, $f2, $f2
    add.s   $f6, $f4, $f8
    sub.s   $f4, $f16, $f10
    lwc1    $f10, 0x0048($sp)
    add.s   $f8, $f4, $f12
    mul.s   $f4, $f8, $f10
    nop
    mul.s   $f8, $f4, $f14
    sub.s   $f4, $f16, $f2
    add.s   $f10, $f6, $f8
    lwc1    $f6, 0x004C($sp)
    mul.s   $f8, $f4, $f6
    nop
    mul.s   $f4, $f8, $f14
    add.s   $f0, $f10, $f4
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_80059A28:
# MqDbg: Curve_Interpolate
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sdc1    $f20, 0x0018($sp)
    mov.s   $f20, $f12
    sw      $ra, 0x0024($sp)
    lh      t6, 0x0002(a1)             # 00000002
    addiu   t0, $zero, 0x000C          # t0 = 0000000C
    mtc1    t6, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    c.le.s  $f20, $f6
    nop
    bc1f    lbl_80059A64
    nop
    b       lbl_80059BB4
    lwc1    $f0, 0x0008(a1)            # 00000008
lbl_80059A64:
    multu   a2, t0
    or      v1, $zero, $zero           # v1 = 00000000
    mflo    t7
    addu    v0, a1, t7
    lh      t8, -0x000A(v0)            # FFFFFFF6
    mtc1    t8, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    c.le.s  $f10, $f20
    nop
    bc1fl   lbl_80059AA0
    or      v0, a1, $zero              # v0 = 00000000
    b       lbl_80059BB4
    lwc1    $f0, -0x0004(v0)           # FFFFFFFC
    or      v0, a1, $zero              # v0 = 00000000
lbl_80059AA0:
    lh      t9, 0x000E(v0)             # 0000000E
    mtc1    t9, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f4, $f18
    c.lt.s  $f20, $f4
    nop
    bc1fl   lbl_80059BAC
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lhu     a2, 0x0000(v0)             # 00000000
    andi    t1, a2, 0x0001             # t1 = 00000000
    beq     t1, $zero, lbl_80059AD8
    andi    t2, a2, 0x0002             # t2 = 00000000
    b       lbl_80059BB4
    lwc1    $f0, 0x0008(v0)            # 00000008
lbl_80059AD8:
    beq     t2, $zero, lbl_80059B30
    addiu   a0, v1, 0x0001             # a0 = 00000002
    multu   a0, t0
    lh      t4, 0x0002(v0)             # 00000002
    lwc1    $f2, 0x0008(v0)            # 00000008
    mtc1    t4, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f16, $f6
    mflo    t3
    addu    v1, a1, t3
    lh      t5, 0x0002(v1)             # 00000003
    sub.s   $f8, $f20, $f16
    mtc1    t5, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f18, $f10
    lwc1    $f10, 0x0008(v1)           # 00000009
    sub.s   $f4, $f18, $f16
    sub.s   $f18, $f10, $f2
    div.s   $f6, $f8, $f4
    mul.s   $f8, $f18, $f6
    b       lbl_80059BB4
    add.s   $f0, $f8, $f2
lbl_80059B30:
    multu   a0, t0
    lh      t6, 0x0002(v0)             # 00000002
    lh      t9, 0x0006(v0)             # 00000006
    lw      a2, 0x0008(v0)             # 00000008
    mtc1    t6, $f4                    # $f4 = 0.00
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f8, 0x78F0($at)           # 801078F0
    cvt.s.w $f16, $f4
    mtc1    t9, $f4                    # $f4 = 0.00
    mflo    t7
    addu    v1, a1, t7
    lh      t8, 0x0002(v1)             # 00000003
    lw      a3, 0x0008(v1)             # 00000009
    sub.s   $f6, $f20, $f16
    mtc1    t8, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f18, $f10
    cvt.s.w $f10, $f4
    sub.s   $f0, $f18, $f16
    swc1    $f10, 0x0010($sp)
    lh      t1, 0x0004(v1)             # 00000005
    div.s   $f12, $f6, $f0
    mtc1    t1, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f6, $f18
    mul.s   $f14, $f0, $f8
    jal     func_80059990
    swc1    $f6, 0x0014($sp)
    b       lbl_80059BB8
    lw      $ra, 0x0024($sp)
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_80059BAC:
    b       lbl_80059AA0
    addiu   v0, v0, 0x000C             # v0 = 0000000C
lbl_80059BB4:
    lw      $ra, 0x0024($sp)
lbl_80059BB8:
    ldc1    $f20, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop
    nop
    nop