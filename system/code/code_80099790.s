# Cutscene Camera Spline
#
# The code in this file is very similar to a spline system used in Super Mario 64 for cutscene camera movement
#
# Starts at VRAM: 80099790 / VROM: ??????
#

.section .text
func_80099790:
# MqDbg: func_800BB0A0
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   $sp, $sp, 0xFFF0           # $sp -= 0x10
    mtc1    $at, $f16                  # $f16 = 1.00
    sw      a2, 0x0018($sp)
    c.lt.s  $f16, $f12
    nop
    bc1fl   lbl_800997B8
    sub.s   $f0, $f16, $f12
    mov.s   $f12, $f16
    sub.s   $f0, $f16, $f12
lbl_800997B8:
    lui     $at, 0x40C0                # $at = 40C00000
    mtc1    $at, $f18                  # $f18 = 6.00
    lui     $at, 0x3F00                # $at = 3F000000
    mul.s   $f4, $f0, $f0
    mtc1    $at, $f10                  # $f10 = 0.50
    lui     $at, 0x8011                # $at = 80110000
    lw      v1, 0x0020($sp)
    lw      a0, 0x0024($sp)
    lw      a2, 0x0028($sp)
    lw      v0, 0x002C($sp)
    mul.s   $f6, $f4, $f0
    nop
    mul.s   $f2, $f12, $f12
    div.s   $f8, $f6, $f18
    mul.s   $f14, $f2, $f12
    nop
    mul.s   $f4, $f14, $f10
    lwc1    $f10, -0x7370($at)         # 80108C90
    lui     $at, 0x3F00                # $at = 3F000000
    swc1    $f8, 0x0000($sp)
    sub.s   $f6, $f4, $f2
    add.s   $f4, $f6, $f10
    neg.s   $f6, $f12
    swc1    $f4, 0x0004($sp)
    mul.s   $f10, $f6, $f12
    nop
    mul.s   $f6, $f10, $f12
    mtc1    $at, $f10                  # $f10 = 0.50
    nop
    mul.s   $f6, $f6, $f10
    mtc1    $at, $f10                  # $f10 = 0.50
    nop
    mul.s   $f10, $f2, $f10
    add.s   $f6, $f6, $f10
    mtc1    $at, $f10                  # $f10 = 0.50
    lui     $at, 0x8011                # $at = 80110000
    mul.s   $f10, $f12, $f10
    add.s   $f6, $f6, $f10
    lwc1    $f10, -0x736C($at)         # 80108C94
    add.s   $f6, $f6, $f10
    div.s   $f10, $f14, $f18
    swc1    $f6, 0x0008($sp)
    swc1    $f10, 0x000C($sp)
    lwc1    $f10, 0x0000(v1)           # 00000000
    mul.s   $f8, $f8, $f10
    lwc1    $f10, 0x0000(a0)           # 00000000
    mul.s   $f4, $f4, $f10
    add.s   $f10, $f8, $f4
    lwc1    $f8, 0x0000(a2)            # 00000000
    mul.s   $f4, $f6, $f8
    lwc1    $f8, 0x0000(v0)            # 00000000
    add.s   $f6, $f10, $f4
    lwc1    $f10, 0x000C($sp)
    mul.s   $f4, $f8, $f10
    add.s   $f8, $f4, $f6
    swc1    $f8, 0x0000(a1)            # 00000000
    lwc1    $f10, 0x0000($sp)
    lwc1    $f4, 0x0004(v1)            # 00000004
    lwc1    $f8, 0x0004($sp)
    mul.s   $f6, $f10, $f4
    lwc1    $f10, 0x0004(a0)           # 00000004
    mul.s   $f4, $f8, $f10
    lwc1    $f10, 0x0008($sp)
    add.s   $f8, $f6, $f4
    lwc1    $f6, 0x0004(a2)            # 00000004
    mul.s   $f4, $f10, $f6
    lwc1    $f6, 0x0004(v0)            # 00000004
    add.s   $f10, $f8, $f4
    lwc1    $f8, 0x000C($sp)
    mul.s   $f4, $f6, $f8
    add.s   $f6, $f4, $f10
    swc1    $f6, 0x0004(a1)            # 00000004
    lwc1    $f8, 0x0000($sp)
    lwc1    $f4, 0x0008(v1)            # 00000008
    lwc1    $f6, 0x0004($sp)
    mul.s   $f10, $f8, $f4
    lwc1    $f8, 0x0008(a0)            # 00000008
    mul.s   $f4, $f6, $f8
    lwc1    $f8, 0x0008($sp)
    add.s   $f6, $f10, $f4
    lwc1    $f10, 0x0008(a2)           # 00000008
    mul.s   $f4, $f8, $f10
    lwc1    $f10, 0x0008(v0)           # 00000008
    add.s   $f8, $f6, $f4
    lwc1    $f6, 0x000C($sp)
    mul.s   $f4, $f10, $f6
    add.s   $f10, $f4, $f8
    swc1    $f10, 0x0008(a1)           # 00000008
    lwc1    $f6, 0x0000($sp)
    lwc1    $f4, 0x000C(v1)            # 0000000C
    lwc1    $f10, 0x0004($sp)
    lw      t6, 0x0018($sp)
    mul.s   $f8, $f6, $f4
    lwc1    $f6, 0x000C(a0)            # 0000000C
    mul.s   $f4, $f10, $f6
    lwc1    $f6, 0x0008($sp)
    add.s   $f10, $f8, $f4
    lwc1    $f8, 0x000C(a2)            # 0000000C
    mul.s   $f4, $f6, $f8
    lwc1    $f8, 0x000C(v0)            # 0000000C
    add.s   $f6, $f10, $f4
    lwc1    $f10, 0x000C($sp)
    mul.s   $f4, $f8, $f10
    add.s   $f8, $f4, $f6
    swc1    $f8, 0x0000(t6)            # 00000000
    lwc1    $f10, 0x0000($sp)
    lwc1    $f4, 0x0010(v1)            # 00000010
    lwc1    $f8, 0x0004($sp)
    mul.s   $f6, $f10, $f4
    lwc1    $f10, 0x0010(a0)           # 00000010
    mul.s   $f4, $f8, $f10
    lwc1    $f10, 0x0008($sp)
    add.s   $f8, $f6, $f4
    lwc1    $f6, 0x0010(a2)            # 00000010
    mul.s   $f4, $f10, $f6
    lwc1    $f6, 0x0010(v0)            # 00000010
    add.s   $f10, $f8, $f4
    lwc1    $f8, 0x000C($sp)
    mul.s   $f4, $f6, $f8
    add.s   $f6, $f4, $f10
    swc1    $f6, 0x0000(a3)            # 00000000
    jr      $ra
    addiu   $sp, $sp, 0x0010           # $sp += 0x10


func_800999A4:
# MqDbg: func_800BB2B4
    addiu   $sp, $sp, 0xFF60           # $sp -= 0xA0
    mtc1    $zero, $f18                # $f18 = 0.00
    sw      $ra, 0x0024($sp)
    sw      a0, 0x00A0($sp)
    sw      a1, 0x00A4($sp)
    sw      a2, 0x00A8($sp)
    sw      a3, 0x00AC($sp)
    lw      t7, 0x00B0($sp)
    lw      t6, 0x00B4($sp)
    or      t2, $zero, $zero           # t2 = 00000000
    lh      t0, 0x0000(t7)             # 00000000
    mov.s   $f14, $f18
    mov.s   $f16, $f18
    bgez    t0, lbl_800999E4
    lwc1    $f12, 0x0000(t6)           # 00000000
    mov.s   $f12, $f18
lbl_800999E4:
    lw      t8, 0x00AC($sp)
    sll     t9, t0,  4
    addiu   t1, $zero, 0xFFFF          # t1 = FFFFFFFF
    addu    v0, t8, t9
    lb      t3, 0x0000(v0)             # 00000000
    beq     t1, t3, lbl_80099A20
    nop
    lb      t4, 0x0010(v0)             # 00000010
    beq     t1, t4, lbl_80099A20
    nop
    lb      t5, 0x0020(v0)             # 00000020
    addiu   v0, $sp, 0x004C            # v0 = FFFFFFAC
    or      a0, $zero, $zero           # a0 = 00000000
    bne     t1, t5, lbl_80099A28
    lw      t6, 0x00AC($sp)
lbl_80099A20:
    b       lbl_80099C50
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_80099A28:
    sll     t7, t0,  4
    addu    v1, t6, t7
    addiu   a1, $zero, 0x0040          # a1 = 00000040
    addiu   a0, a0, 0x0010             # a0 = 00000010
    beq     a0, a1, lbl_80099AA4
    lh      t8, 0x0008(v1)             # 00000008
lbl_80099A40:
    mtc1    t8, $f18                   # $f18 = 0.00
    addiu   a0, a0, 0x0010             # a0 = 00000020
    addiu   v0, v0, 0x0014             # v0 = 00000015
    cvt.s.w $f18, $f18
    addiu   v1, v1, 0x0010             # v1 = 00000010
    swc1    $f18, -0x0014(v0)          # 00000001
    lh      t9, -0x0006(v1)            # 0000000A
    mtc1    t9, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x0010(v0)          # 00000005
    lh      t3, -0x0004(v1)            # 0000000C
    mtc1    t3, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x000C(v0)          # 00000009
    lb      t4, -0x000F(v1)            # 00000001
    mtc1    t4, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x0008(v0)          # 0000000D
    lwc1    $f18, -0x000C(v1)          # 00000004
    swc1    $f18, -0x0004(v0)          # 00000011
    bne     a0, a1, lbl_80099A40
    lh      t8, 0x0008(v1)             # 00000018
lbl_80099AA4:
    mtc1    t8, $f18                   # $f18 = 0.00
    addiu   v0, v0, 0x0014             # v0 = 00000029
    addiu   v1, v1, 0x0010             # v1 = 00000020
    cvt.s.w $f18, $f18
    swc1    $f18, -0x0014(v0)          # 00000015
    lh      t9, -0x0006(v1)            # 0000001A
    mtc1    t9, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x0010(v0)          # 00000019
    lh      t3, -0x0004(v1)            # 0000001C
    mtc1    t3, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x000C(v0)          # 0000001D
    lb      t4, -0x000F(v1)            # 00000011
    mtc1    t4, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f18, $f18
    swc1    $f18, -0x0008(v0)          # 00000021
    lwc1    $f18, -0x000C(v1)          # 00000014
    swc1    $f18, -0x0004(v0)          # 00000025
    addiu   t5, $sp, 0x004C            # t5 = FFFFFFAC
    addiu   t6, $sp, 0x0060            # t6 = FFFFFFC0
    addiu   t7, $sp, 0x0074            # t7 = FFFFFFD4
    addiu   t8, $sp, 0x0088            # t8 = FFFFFFE8
    sw      t8, 0x001C($sp)
    sw      t7, 0x0018($sp)
    sw      t6, 0x0014($sp)
    sw      t5, 0x0010($sp)
    lw      a1, 0x00A0($sp)
    lw      a2, 0x00A4($sp)
    lw      a3, 0x00A8($sp)
    sw      t2, 0x009C($sp)
    swc1    $f14, 0x003C($sp)
    jal     func_80099790
    swc1    $f16, 0x0038($sp)
    lw      a1, 0x00B0($sp)
    lw      a2, 0x00AC($sp)
    mtc1    $zero, $f18                # $f18 = 0.00
    lh      t9, 0x0000(a1)             # 00000000
    lw      a0, 0x00B4($sp)
    addiu   t1, $zero, 0xFFFF          # t1 = FFFFFFFF
    sll     t3, t9,  4
    addu    v0, a2, t3
    lhu     v1, 0x0012(v0)             # 00000012
    lw      t2, 0x009C($sp)
    lwc1    $f14, 0x003C($sp)
    beq     v1, $zero, lbl_80099B94
    lwc1    $f16, 0x0038($sp)
    mtc1    v1, $f8                    # $f8 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f6                   # $f6 = 1.00
    bgez    v1, lbl_80099B90
    cvt.s.w $f10, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f10, $f10, $f4
lbl_80099B90:
    div.s   $f14, $f6, $f10
lbl_80099B94:
    lhu     v1, 0x0022(v0)             # 00000022
    lui     $at, 0x3F80                # $at = 3F800000
    beql    v1, $zero, lbl_80099BCC
    sub.s   $f4, $f16, $f14
    mtc1    v1, $f4                    # $f4 = 0.00
    mtc1    $at, $f8                   # $f8 = 1.00
    bgez    v1, lbl_80099BC4
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_80099BC4:
    div.s   $f16, $f8, $f6
    sub.s   $f4, $f16, $f14
lbl_80099BCC:
    lwc1    $f2, 0x0000(a0)            # 00000000
    mul.s   $f10, $f2, $f4
    add.s   $f0, $f10, $f14
    c.lt.s  $f0, $f18
    nop
    bc1fl   lbl_80099BF4
    add.s   $f8, $f2, $f0
    mtc1    $zero, $f0                 # $f0 = 0.00
    nop
    add.s   $f8, $f2, $f0
lbl_80099BF4:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f12                  # $f12 = 1.00
    swc1    $f8, 0x0000(a0)            # 00000000
    lwc1    $f6, 0x0000(a0)            # 00000000
    c.le.s  $f12, $f6
    nop
    bc1fl   lbl_80099C50
    or      v0, t2, $zero              # v0 = 00000000
    lh      t4, 0x0000(a1)             # 00000000
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sh      t5, 0x0000(a1)             # 00000000
    lh      t6, 0x0000(a1)             # 00000000
    sll     t7, t6,  4
    addu    t8, a2, t7
    lb      t9, 0x0030(t8)             # 00000030
    bnel    t1, t9, lbl_80099C44
    lwc1    $f4, 0x0000(a0)            # 00000000
    sh      $zero, 0x0000(a1)          # 00000000
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lwc1    $f4, 0x0000(a0)            # 00000000
lbl_80099C44:
    sub.s   $f10, $f4, $f12
    swc1    $f10, 0x0000(a0)           # 00000000
    or      v0, t2, $zero              # v0 = 00000001
lbl_80099C50:
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x00A0           # $sp += 0xA0
    jr      $ra
    nop
