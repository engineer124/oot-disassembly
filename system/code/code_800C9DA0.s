# Audio External Sequence
#
# Starts at VRAM: 800C9DA0 / VROM: B3FD00
#

.section .text
func_800C9DA0:
# MqDbg: Audio_StartSequence
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x43B8(t6)             # 801043B8
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    andi    a2, a2, 0x00FF             # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    beq     t6, $zero, lbl_800C9DD8
    sw      a1, 0x002C($sp)
    lbu     t7, 0x002B($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     t7, $at, lbl_800C9F14
lbl_800C9DD8:
    lui     t2, 0x8012                 # t2 = 80120000
    lhu     t2, 0x7E84(t2)             # 80127E84
    lbu     v1, 0x002B($sp)
    lbu     t9, 0x002F($sp)
    multu   a3, t2
    lui     $at, 0x8200                # $at = 82000000
    sll     v1, v1, 16
    or      t8, v1, $at                # t8 = 82000000
    or      t0, t9, $zero              # t0 = 00000000
    andi    a2, a2, 0x007F             # a2 = 00000000
    sll     t1, t0,  8
    or      a0, t8, t1                 # a0 = 82000000
    sb      a2, 0x0033($sp)
    sw      v1, 0x001C($sp)
    mflo    a1
    bgez    a1, lbl_800C9E20
    addu    $at, a1, $zero
    addiu   $at, a1, 0x0003            # $at = 00000003
lbl_800C9E20:
    sra     a1, $at,  2
    jal     func_800BB0BC
    nop
    lbu     t3, 0x002B($sp)
    lui     t5, 0x8012                 # t5 = 80120000
    addiu   t5, t5, 0x4C00             # t5 = 80124C00
    sll     t4, t3,  2
    addu    t4, t4, t3
    sll     t4, t4,  2
    subu    t4, t4, t3
    sll     t4, t4,  3
    addu    t4, t4, t3
    sll     t4, t4,  2
    lui     $at, 0x3F80                # $at = 3F800000
    addu    a2, t4, t5
    mtc1    $at, $f0                   # $f0 = 1.00
    lwc1    $f2, 0x0000(a2)            # 00000000
    lbu     t7, 0x0033($sp)
    lbu     t6, 0x002F($sp)
    c.eq.s  $f0, $f2
    sll     t9, t7,  8
    or      v0, t6, t9                 # v0 = 00000000
    lw      v1, 0x001C($sp)
    sh      v0, 0x0254(a2)             # 00000254
    bc1t    lbl_800C9EA8
    sh      v0, 0x0256(a2)             # 00000256
    lui     $at, 0x4100                # $at = 41000000
    mfc1    a1, $f2
    or      a0, v1, $at                # a0 = 41000000
    jal     func_800BB098
    sw      a2, 0x0018($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lw      a2, 0x0018($sp)
lbl_800C9EA8:
    lbu     t0, 0x002B($sp)
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t0,  2
    addu    t8, t8, t0
    sll     t8, t8,  2
    subu    t8, t8, t0
    sll     t8, t8,  3
    addu    t8, t8, t0
    sll     t8, t8,  2
    sh      $zero, 0x0028(a2)          # 00000028
    sh      $zero, 0x0018(a2)          # 00000018
    sw      $zero, 0x0014(a2)          # 00000014
    addu    a0, t8, t1
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C9EE4:
    sll     t2, v1,  5
    addiu   v1, v1, 0x0001             # v1 = 00000001
    addu    v0, a0, t2
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slti    $at, v1, 0x0010
    swc1    $f0, 0x0050(v0)            # 00000050
    sh      $zero, 0x005C(v0)          # 0000005C
    swc1    $f0, 0x0060(v0)            # 00000060
    bne     $at, $zero, lbl_800C9EE4
    sh      $zero, 0x006C(v0)          # 0000006C
    sh      $zero, 0x0250(a2)          # 00000250
    sh      $zero, 0x0252(a2)          # 00000252
lbl_800C9F14:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C9F24:
# MqDbg: Audio_StopSequence
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x7E84(t6)             # 80127E84
    andi    a2, a1, 0xFFFF             # a2 = 00000000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    multu   a2, t6
    sw      a0, 0x0018($sp)
    lbu     a0, 0x001B($sp)
    sw      a1, 0x001C($sp)
    lui     $at, 0x8300                # $at = 83000000
    sll     a0, a0, 16
    or      a0, a0, $at                # a0 = 83000000
    sw      $ra, 0x0014($sp)
    mflo    a1
    bgez    a1, lbl_800C9F64
    addu    $at, a1, $zero
    addiu   $at, a1, 0x0003            # $at = 00000003
lbl_800C9F64:
    sra     a1, $at,  2
    jal     func_800BB0BC
    nop
    lbu     t8, 0x001B($sp)
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    sll     t9, t8,  2
    addu    t9, t9, t8
    sll     t9, t9,  2
    subu    t9, t9, t8
    sll     t9, t9,  3
    addu    t9, t9, t8
    sll     t9, t9,  2
    addu    $at, $at, t9
    ori     t7, $zero, 0xFFFF          # t7 = 0000FFFF
    sh      t7, 0x4E54($at)            # 80124E54
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C9FAC:
# MqDbg: Audio_ProcessSeqCmd
    lui     $at, 0x0F00                # $at = 0F000000
    and     a3, a0, $at
    srl     t6, a0, 28
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sw      s0, 0x0018($sp)
    srl     a3, a3, 24
    sltiu   $at, t7, 0x0010
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    beq     $at, $zero, lbl_800CAA5C
    andi    a1, a3, 0x00FF             # a1 = 00000000
    sll     t7, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x5ED0($at)           # 8010A130
    jr      t7
    nop
    andi    a0, a3, 0x00FF             # a0 = 00000000
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    subu    t8, t8, a0
    sll     t8, t8,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t8, t8, a0
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t8,  2
    addu    t9, t1, t8
    lbu     t5, 0x0260(t9)             # 00000260
    andi    a2, s0, 0xFF00             # a2 = 00000000
    srl     a2, a2,  8
    bne     t5, $zero, lbl_800CAA5C
    andi    a2, a2, 0x00FF             # a2 = 00000000
    slti    $at, a2, 0x0080
    beq     $at, $zero, lbl_800CAA5C
    or      a1, s0, $zero              # a1 = 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    jal     func_800C9DA0
    andi    a1, a1, 0x00FF             # a1 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a1, s0, $at
    srl     a1, a1, 13
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    jal     func_800C9F24
    andi    a0, a3, 0x00FF             # a0 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x47F8             # v0 = 801247F8
    andi    t6, a3, 0x00FF             # t6 = 00000000
    addu    t4, v0, t6
    lbu     t2, 0x0000(t4)             # 00000000
    sw      t6, 0x002C($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    blez    t2, lbl_800CA12C
    or      t3, t2, $zero              # t3 = 00000000
    sll     t5, t6,  2
    addu    t5, t5, t6
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t5, t5,  1
    andi    a0, s0, 0x00FF             # a0 = 00000000
    sw      a0, 0x0030($sp)
    addu    a2, t5, t6
    sll     t8, v1,  1
lbl_800CA0C8:
    addu    t9, a2, t8
    lbu     t7, 0x0000(t9)             # 00000000
    addu    t5, v0, a1
    bnel    a0, t7, lbl_800CA114
    lbu     t6, 0x0000(t5)             # 00000000
    bne     v1, $zero, lbl_800CAA5C
    lbu     a0, 0x002F($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    andi    a2, s0, 0xFF00             # a2 = 00000000
    srl     a2, a2,  8
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    andi    a2, a2, 0x00FF             # a2 = 00000000
    jal     func_800C9DA0
    lbu     a1, 0x0033($sp)
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lbu     t6, 0x0000(t5)             # 00000000
lbl_800CA114:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, t6
    bnel    $at, $zero, lbl_800CA0C8
    sll     t8, v1,  1
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800CA12C:
    lw      t7, 0x002C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t5, t7,  2
    addu    t5, t5, t7
    sll     t5, t5,  1
    andi    t9, s0, 0x00FF             # t9 = 00000000
    andi    t1, t2, 0x00FF             # t1 = 00000000
    sw      t9, 0x0030($sp)
    blez    t3, lbl_800CA1A4
    addu    a2, t5, t6
    andi    a0, s0, 0xFF00             # a0 = 00000000
    lui     v0, 0x8012                 # v0 = 80120000
    addu    v0, v0, a1
    srl     a0, a0,  8
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lbu     v0, 0x47F8(v0)             # 801247F8
    sll     t8, v1,  1
lbl_800CA174:
    addu    t9, a2, t8
    lbu     t7, 0x0001(t9)             # 00000001
    slt     $at, a0, t7
    bnel    $at, $zero, lbl_800CA194
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    t1, v1, 0x00FF             # t1 = 00000001
    andi    v1, t2, 0x00FF             # v1 = 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800CA194:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800CA174
    sll     t8, v1,  1
lbl_800CA1A4:
    andi    t5, s0, 0xFF00             # t5 = 00000000
    srl     t6, t5,  8
    andi    t8, t6, 0x00FF             # t8 = 000000D0
    slti    $at, t3, 0x0005
    beq     $at, $zero, lbl_800CA1C8
    sw      t8, 0x003C($sp)
    addiu   t9, t2, 0x0001             # t9 = 00000001
    sb      t9, 0x0000(t4)             # 00000000
    andi    t3, t9, 0x00FF             # t3 = 00000001
lbl_800CA1C8:
    addiu   v1, t3, 0xFFFF             # v1 = 00000000
    andi    v1, v1, 0x00FF             # v1 = 00000000
    or      v0, v1, $zero              # v0 = 00000000
    beq     t1, v1, lbl_800CA20C
    or      t0, t1, $zero              # t0 = 00000001
lbl_800CA1DC:
    sll     t5, v0,  1
    addu    a1, a2, t5
    lbu     t6, -0x0001(a1)            # FFFFFFFF
    sll     t7, v1,  1
    addu    a0, a2, t7
    sb      t6, 0x0001(a0)             # 00000001
    lbu     t8, -0x0002(a1)            # FFFFFFFE
    addiu   v1, v1, 0xFFFF             # v1 = FFFFFFFF
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    or      v0, v1, $zero              # v0 = 000000FF
    bne     t0, v1, lbl_800CA1DC
    sb      t8, 0x0000(a0)             # 00000000
lbl_800CA20C:
    lw      t7, 0x003C($sp)
    lw      t5, 0x0030($sp)
    sll     t9, t1,  1
    addu    v0, a2, t9
    sb      t7, 0x0001(v0)             # 00000100
    bne     t0, $zero, lbl_800CAA5C
    sb      t5, 0x0000(v0)             # 000000FF
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    lbu     a0, 0x002F($sp)
    lbu     a1, 0x0033($sp)
    jal     func_800C9DA0
    lbu     a2, 0x003F($sp)
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47F8             # t6 = 801247F8
    andi    t8, a3, 0x00FF             # t8 = 00000000
    addu    t4, t6, t8
    lbu     t2, 0x0000(t4)             # 00000000
    sw      t8, 0x002C($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    or      t1, t2, $zero              # t1 = 00000000
    blez    t2, lbl_800CA2D0
    or      t3, t2, $zero              # t3 = 00000000
    sll     t5, t8,  2
    addu    t5, t5, t8
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x47D0             # t8 = 801247D0
    sll     t5, t5,  1
    addu    t7, a1, t6
    or      a0, s0, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lbu     v0, 0x0000(t7)             # 00000000
    addu    a2, t5, t8
    sll     t6, v1,  1
lbl_800CA2A4:
    addu    t7, a2, t6
    lbu     t9, 0x0000(t7)             # 00000000
    bnel    a0, t9, lbl_800CA2C0
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    t1, v1, 0x00FF             # t1 = 00000001
    andi    v1, t2, 0x00FF             # v1 = 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800CA2C0:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800CA2A4
    sll     t6, v1,  1
lbl_800CA2D0:
    beq     t1, t3, lbl_800CA344
    or      t0, t1, $zero              # t0 = 00000001
    addiu   a3, t3, 0xFFFF             # a3 = FFFFFFFF
    slt     $at, t1, a3
    beq     $at, $zero, lbl_800CA33C
    andi    v1, t1, 0x00FF             # v1 = 00000001
    lw      t5, 0x002C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t8, t5,  2
    addu    t8, t8, t5
    sll     t8, t8,  1
    addu    a2, t8, t6
    or      v0, v1, $zero              # v0 = 00000001
lbl_800CA308:
    sll     t9, v0,  1
    addu    a1, a2, t9
    lbu     t5, 0x0003(a1)             # 00000003
    sll     t7, v1,  1
    addu    a0, a2, t7
    addiu   v1, v1, 0x0001             # v1 = 00000002
    sb      t5, 0x0001(a0)             # 00000001
    lbu     t8, 0x0002(a1)             # 00000002
    andi    v1, v1, 0x00FF             # v1 = 00000002
    slt     $at, v1, a3
    or      v0, v1, $zero              # v0 = 00000002
    bne     $at, $zero, lbl_800CA308
    sb      t8, 0x0000(a0)             # 00000000
lbl_800CA33C:
    addiu   t6, t2, 0xFFFF             # t6 = FFFFFFFF
    sb      t6, 0x0000(t4)             # 00000000
lbl_800CA344:
    bne     t0, $zero, lbl_800CAA5C
    lbu     a0, 0x002F($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 0000FFFF
    andi    a1, a3, 0xFFFF             # a1 = 0000FFFF
    sw      a3, 0x003C($sp)
    jal     func_800C9F24
    sw      t4, 0x0024($sp)
    lw      t4, 0x0024($sp)
    lw      a0, 0x002C($sp)
    lw      a3, 0x003C($sp)
    lbu     t7, 0x0000(t4)             # 00000000
    sll     t9, a0,  2
    addu    t9, t9, a0
    beq     t7, $zero, lbl_800CAA5C
    sll     t9, t9,  1
    lui     t5, 0x8012                 # t5 = 80120000
    addiu   t5, t5, 0x47D0             # t5 = 801247D0
    addu    v0, t9, t5
    lbu     a1, 0x0000(v0)             # 00000000
    jal     func_800C9DA0
    lbu     a2, 0x0001(v0)             # 00000001
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA3CC
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA3CC:
    andi    t8, a3, 0x00FF             # t8 = 00000000
    sll     t6, t8,  2
    addu    t6, t6, t8
    sll     t6, t6,  2
    subu    t6, t6, t8
    sll     t6, t6,  3
    andi    t9, s0, 0x00FF             # t9 = 00000000
    mtc1    t9, $f4                    # $f4 = 0.00
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t6, t6, t8
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    addu    v0, t1, t6
    bgez    t9, lbl_800CA418
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CA418:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lwc1    $f2, 0x0000(v0)            # 00000000
    div.s   $f0, $f6, $f10
    c.eq.s  $f2, $f0
    swc1    $f0, 0x0004(v0)            # 00000004
    bc1tl   lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lwc1    $f16, 0x0004(v0)           # 00000004
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     $at, 0x4F80                # $at = 4F800000
    sub.s   $f18, $f2, $f16
    bgez    a1, lbl_800CA45C
    cvt.s.w $f8, $f4
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f8, $f8, $f6
lbl_800CA45C:
    div.s   $f10, $f18, $f8
    sh      a1, 0x000C(v0)             # 0000000C
    b       lbl_800CAA5C
    swc1    $f10, 0x0008(v0)           # 00000008
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA48C
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA48C:
    mtc1    a1, $f16                   # $f16 = 0.00
    or      v1, $zero, $zero           # v1 = 00000000
    bgez    a1, lbl_800CA4AC
    cvt.s.w $f2, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f2, $f2, $f4
lbl_800CA4AC:
    andi    a2, a3, 0x00FF             # a2 = 00000000
    sll     t5, a2,  2
    addu    t5, t5, a2
    sll     t5, t5,  2
    subu    t5, t5, a2
    sll     t5, t5,  3
    andi    t7, s0, 0xFFFF             # t7 = 00000000
    mtc1    t7, $f6                    # $f6 = 0.00
    addu    t5, t5, a2
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x4C00             # t8 = 80124C00
    sll     t5, t5,  2
    addu    a0, t5, t8
    bgez    t7, lbl_800CA4F8
    cvt.s.w $f18, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f18, $f18, $f8
lbl_800CA4F8:
    lui     $at, 0x447A                # $at = 447A0000
    mtc1    $at, $f10                  # $f10 = 1000.00
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    div.s   $f0, $f18, $f10
lbl_800CA50C:
    sll     t9, v1,  5
    addu    v0, a0, t9
    lwc1    $f16, 0x0060(v0)           # 00000060
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    sub.s   $f4, $f16, $f0
    slti    $at, v1, 0x0010
    swc1    $f0, 0x0064(v0)            # 00000064
    sh      a1, 0x006C(v0)             # 0000006C
    div.s   $f6, $f4, $f2
    bne     $at, $zero, lbl_800CA50C
    swc1    $f6, 0x0068(v0)            # 00000068
    sll     t8, a2,  2
    addu    t8, t8, a2
    sll     t8, t8,  2
    subu    t8, t8, a2
    sll     t8, t8,  3
    addu    t8, t8, a2
    sll     t8, t8,  2
    addu    t6, t1, t8
    ori     t5, $zero, 0xFFFF          # t5 = 0000FFFF
    b       lbl_800CAA5C
    sh      t5, 0x0250(t6)             # 00000250
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA588
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA588:
    andi    t7, a3, 0x00FF             # t7 = 00000000
    sll     t9, t7,  2
    addu    t9, t9, t7
    sll     t9, t9,  2
    subu    t9, t9, t7
    sll     t9, t9,  3
    andi    a0, s0, 0xF000             # a0 = 00000000
    lui     t1, 0x8012                 # t1 = 80120000
    srl     a0, a0, 12
    addu    t9, t9, t7
    andi    t6, s0, 0x0FFF             # t6 = 00000000
    mtc1    t6, $f8                    # $f8 = 0.00
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t8, a0,  5
    addu    v0, t1, t9
    addu    v1, v0, t8
    bgez    t6, lbl_800CA5E8
    cvt.s.w $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f18, $f18, $f10
lbl_800CA5E8:
    lui     $at, 0x447A                # $at = 447A0000
    mtc1    $at, $f16                  # $f16 = 1000.00
    lwc1    $f4, 0x0060(v1)            # 00000060
    mtc1    a1, $f8                    # $f8 = 0.00
    div.s   $f0, $f18, $f16
    cvt.s.w $f10, $f8
    swc1    $f0, 0x0064(v1)            # 00000064
    bgez    a1, lbl_800CA61C
    sub.s   $f6, $f4, $f0
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f10, $f10, $f18
lbl_800CA61C:
    div.s   $f16, $f6, $f10
    sh      a1, 0x006C(v1)             # 0000006C
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sllv    t8, t9, a0
    swc1    $f16, 0x0068(v1)           # 00000068
    lhu     t7, 0x0250(v0)             # 00000250
    or      t5, t7, t8                 # t5 = 80124C00
    b       lbl_800CAA5C
    sh      t5, 0x0250(v0)             # 00000250
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA660
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA660:
    andi    t0, a3, 0x00FF             # t0 = 00000000
    sll     t6, t0,  2
    addu    t6, t6, t0
    sll     t6, t6,  2
    subu    t6, t6, t0
    sll     t6, t6,  3
    andi    a2, s0, 0x0F00             # a2 = 00000000
    lui     t1, 0x8012                 # t1 = 80120000
    srl     a2, a2,  8
    addu    t6, t6, t0
    andi    t8, s0, 0x00FF             # t8 = 00000000
    mtc1    t8, $f4                    # $f4 = 0.00
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    andi    a2, a2, 0x00FF             # a2 = 00000000
    sll     a0, a2,  5
    addu    t9, t1, t6
    addu    v0, t9, a0
    bgez    t8, lbl_800CA6C0
    cvt.s.w $f8, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f8, $f8, $f18
lbl_800CA6C0:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f6                   # $f6 = 127.00
    lwc1    $f10, 0x0050(v0)           # 00000050
    div.s   $f0, $f8, $f6
    c.eq.s  $f10, $f0
    swc1    $f0, 0x0054(v0)            # 00000054
    bc1t    lbl_800CAA5C
    sll     t5, t0,  2
    addu    t5, t5, t0
    sll     t5, t5,  2
    subu    t5, t5, t0
    sll     t5, t5,  3
    addu    t5, t5, t0
    sll     t5, t5,  2
    addu    v0, t1, t5
    addu    v1, v0, a0
    lwc1    $f16, 0x0050(v1)           # 00000050
    lwc1    $f4, 0x0054(v1)            # 00000054
    mtc1    a1, $f8                    # $f8 = 0.00
    lui     $at, 0x4F80                # $at = 4F800000
    sub.s   $f18, $f16, $f4
    bgez    a1, lbl_800CA728
    cvt.s.w $f6, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_800CA728:
    div.s   $f16, $f18, $f6
    sh      a1, 0x005C(v1)             # 0000005C
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sllv    t7, t9, a2
    swc1    $f16, 0x0058(v1)           # 00000058
    lhu     t6, 0x0252(v0)             # 00000252
    or      t8, t6, t7                 # t8 = 00000000
    b       lbl_800CAA5C
    sh      t8, 0x0252(v0)             # 00000252
    andi    t9, a3, 0x00FF             # t9 = 00000000
    sll     t6, t9, 16
    lui     $at, 0x4600                # $at = 46000000
    or      t7, t6, $at                # t7 = 46000000
    lui     $at, 0x00FF                # $at = 00FF0000
    and     t8, s0, $at
    srl     t9, t8, 16
    or      a1, s0, $zero              # a1 = 00000000
    sll     a1, a1, 24
    andi    t6, t9, 0x00FF             # t6 = 00000000
    or      a0, t7, t6                 # a0 = 46000000
    jal     func_800BB0E0
    sra     a1, a1, 24
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    v0, a3, 0x00FF             # v0 = 00000000
    sll     t8, v0,  2
    addu    t8, t8, v0
    sll     t8, t8,  2
    subu    t8, t8, v0
    sll     t8, t8,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t8, t8, v0
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t8,  2
    addu    t5, t1, t8
    andi    a2, s0, 0x0F00             # a2 = 00000000
    lhu     t9, 0x0258(t5)             # 00000258
    srl     a2, a2,  8
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t6, t7, a2
    and     t8, t9, t6
    bne     t8, $zero, lbl_800CAA5C
    andi    t5, v0, 0x00FF             # t5 = 00000000
    sll     t7, t5, 16
    lui     $at, 0x0600                # $at = 06000000
    or      t9, t7, $at                # t9 = 06000001
    andi    t6, a2, 0x00FF             # t6 = 00000000
    sll     t8, t6,  8
    lui     $at, 0x00FF                # $at = 00FF0000
    and     t7, s0, $at
    or      t5, t9, t8                 # t5 = 06000001
    srl     t9, t7, 16
    or      a1, s0, $zero              # a1 = 00000000
    sll     a1, a1, 24
    andi    t8, t9, 0x00FF             # t8 = 00000001
    or      a0, t5, t8                 # a0 = 06000001
    jal     func_800BB0E0
    sra     a1, a1, 24
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    t6, a3, 0x00FF             # t6 = 00000000
    sll     t9, t6,  2
    addu    t9, t9, t6
    sll     t9, t9,  2
    subu    t9, t9, t6
    sll     t9, t9,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t9, t9, t6
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    addu    t5, t1, t9
    b       lbl_800CAA5C
    sh      s0, 0x0258(t5)             # 00000258
    or      a1, s0, $zero              # a1 = 00000000
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    beq     a1, $zero, lbl_800CA8A4
    or      v1, a1, $zero              # v1 = 00000000
    or      v0, a3, $zero              # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    lui     $at, 0x9000                # $at = 90000000
    or      a0, v0, $at                # a0 = 90000000
    sw      v0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    jal     func_800BB110
    sw      a3, 0x003C($sp)
    lw      v0, 0x0030($sp)
    lui     $at, 0x0800                # $at = 08000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a0, v0, $at                # a0 = 08000000
    jal     func_800BB0E0
    ori     a0, a0, 0xFF00             # a0 = 0800FF00
    lw      v1, 0x0034($sp)
    lw      a3, 0x003C($sp)
lbl_800CA8A4:
    xori    a2, v1, 0xFFFF             # a2 = FFFFFFFF
    beq     a2, $zero, lbl_800CAA5C
    or      v0, a3, $zero              # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    lui     $at, 0x9000                # $at = 90000000
    or      a0, v0, $at                # a0 = 90000000
    lui     $at, 0x0800                # $at = 08000000
    or      s0, v0, $at                # s0 = 08000000
    ori     s0, s0, 0xFF00             # s0 = 0800FF00
    jal     func_800BB110
    andi    a1, a2, 0xFFFF             # a1 = 0000FFFF
    or      a0, s0, $zero              # a0 = 0800FF00
    jal     func_800BB0E0
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    t8, a3, 0x00FF             # t8 = 00000000
    sll     t6, t8,  2
    addu    t6, t6, t8
    sll     t6, t6,  2
    subu    t6, t6, t8
    sll     t6, t6,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t6, t6, t8
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    addu    t9, t1, t6
    b       lbl_800CAA5C
    sw      s0, 0x0014(t9)             # 00000014
    lui     $at, 0x00F0                # $at = 00F00000
    and     t7, s0, $at
    srl     t5, t7, 20
    andi    t8, t5, 0x00FF             # t8 = 00000000
    addiu   $at, $zero, 0x000F         # $at = 0000000F
    beq     t8, $at, lbl_800CA998
    andi    t6, a3, 0x00FF             # t6 = 00000000
    sll     t9, t6,  2
    addu    t9, t9, t6
    sll     t9, t9,  2
    subu    t9, t9, t6
    sll     t9, t9,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t9, t9, t6
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    addu    v0, t1, t9
    lbu     v1, 0x004D(v0)             # 0000004D
    slti    $at, v1, 0x0007
    beq     $at, $zero, lbl_800CAA5C
    andi    t1, v1, 0x00FF             # t1 = 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    slti    $at, t1, 0x0008
    beq     $at, $zero, lbl_800CAA5C
    sb      t7, 0x004D(v0)             # 0000004D
    sll     t5, t1,  2
    addu    t8, v0, t5
    sw      s0, 0x002C(t8)             # 0000002C
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    b       lbl_800CAA5C
    sb      t6, 0x004C(v0)             # 0000004C
lbl_800CA998:
    andi    t9, a3, 0x00FF             # t9 = 00000000
    sll     t7, t9,  2
    addu    t7, t7, t9
    sll     t7, t7,  2
    subu    t7, t7, t9
    sll     t7, t7,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t7, t7, t9
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t7, t7,  2
    addu    t5, t1, t7
    b       lbl_800CAA5C
    sb      $zero, 0x004D(t5)          # 0000004D
    andi    v0, s0, 0x0F00             # v0 = 00000F00
    srl     v0, v0,  8
    andi    v0, v0, 0x00FF             # v0 = 00000000
    beq     v0, $zero, lbl_800CA9F4
    lui     a0, 0xF000                 # a0 = F0000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CAA10
    andi    t5, s0, 0x0001             # t5 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
lbl_800CA9F4:
    andi    t6, s0, 0x00FF             # t6 = 00000000
    lui     a1, 0x8010                 # a1 = 80100000
    addu    a1, a1, t6
    jal     func_800BB0BC
    lbu     a1, 0x43BC(a1)             # 801043BC
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
lbl_800CAA10:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800CAA5C
    sb      t5, 0x43B8($at)            # 801043B8
    andi    t8, s0, 0xFF00             # t8 = 0000FF00
    lui     v1, 0x8010                 # v1 = 80100000
    srl     t6, t8,  8
    lui     $at, 0x8010                # $at = 80100000
    addiu   v1, v1, 0x43C0             # v1 = 801043C0
    sb      t6, 0x438C($at)            # 8010438C
    lbu     t9, 0x0000(v1)             # 801043C0
    sb      s0, 0x0000(v1)             # 801043C0
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800BB548
    sb      t9, 0x0059($sp)
    jal     func_800C7E98
    lbu     a0, 0x0059($sp)
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CAA5C:
    lw      $ra, 0x001C($sp)
lbl_800CAA60:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0068           # $sp += 0x68
    jr      $ra
    nop


func_800CAA70:
# MqDbg: Audio_QueueSeqCmd
# Change background music?
# (writes data to the audio buffer for background music)
# A0 = u8? music ID
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x43B0             # v1 = 801043B0
    lbu     v0, 0x0000(v1)             # 801043B0
    lui     $at, 0x8012                # $at = 80120000
    sll     t6, v0,  2
    addu    $at, $at, t6
    sw      a0, 0x4800($at)            # 80124800
    addiu   t7, v0, 0x0001             # t7 = 00000001
    jr      $ra
    sb      t7, 0x0000(v1)             # 801043B0


func_800CAA98:
# MqDbg: Audio_ProcessSeqCmds
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    lui     s1, 0x8010                 # s1 = 80100000
    lui     s2, 0x8010                 # s2 = 80100000
    addiu   s2, s2, 0x43B0             # s2 = 801043B0
    addiu   s1, s1, 0x43B4             # s1 = 801043B4
    sw      s0, 0x0014($sp)
    lbu     s0, 0x0000(s1)             # 801043B4
    lbu     t6, 0x0000(s2)             # 801043B0
    sw      s3, 0x0020($sp)
    sw      $ra, 0x0024($sp)
    beq     s0, t6, lbl_800CAAFC
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x4800             # s3 = 80124800
    sll     t7, s0,  2
lbl_800CAAD8:
    addu    t8, s3, t7
    lw      a0, 0x0000(t8)             # 00000000
    addiu   t9, s0, 0x0001             # t9 = 00000001
    jal     func_800C9FAC
    sb      t9, 0x0000(s1)             # 801043B4
    lbu     s0, 0x0000(s1)             # 801043B4
    lbu     t0, 0x0000(s2)             # 801043B0
    bnel    s0, t0, lbl_800CAAD8
    sll     t7, s0,  2
lbl_800CAAFC:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800CAB18:
# MqDbg: Audio_GetActiveSeqId
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  5
    lui     t7, 0x8013                 # t7 = 80130000
    addu    t7, t7, t6
    lw      t7, -0x74A0(t7)            # 80128B60
    sll     t9, a0,  2
    addu    t9, t9, a0
    srl     t8, t7, 31
    bne     t8, $zero, lbl_800CAB5C
    sll     t9, t9,  2
    jr      $ra
    ori     v0, $zero, 0xFFFF          # v0 = 0000FFFF
lbl_800CAB5C:
    subu    t9, t9, a0
    sll     t9, t9,  3
    addu    t9, t9, a0
    sll     t9, t9,  2
    lui     v0, 0x8012                 # v0 = 80120000
    addu    v0, v0, t9
    lhu     v0, 0x4E54(v0)             # 80124E54
    jr      $ra
    nop


func_800CAB80:
# MqDbg: Audio_IsSeqCmdNotQueued
    lui     v0, 0x8010                 # v0 = 80100000
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43B0(v1)             # 801043B0
    lbu     v0, 0x43B4(v0)             # 801043B4
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x4800             # a2 = 80124800
    beq     v1, v0, lbl_800CABCC
    sll     t6, v0,  2
lbl_800CABA0:
    addu    t7, a2, t6
    lw      t8, 0x0000(t7)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 80100001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    and     t9, t8, a1
    bne     a0, t9, lbl_800CABC4
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CABC4:
    bnel    v1, v0, lbl_800CABA0
    sll     t6, v0,  2
lbl_800CABCC:
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    jr      $ra
    nop


func_800CABD8:
# MqDbg: Audio_ResetSequenceRequests
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8012                # $at = 80120000
    addu    $at, $at, a0
    jr      $ra
    sb      $zero, 0x47F8($at)         # 801247F8


func_800CABF0:
# MqDbg: Audio_ReplaceSeqCmdSetupOpVolRestore
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  3
    addu    t6, t6, a0
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4C00             # t7 = 80124C00
    sll     t6, t6,  2
    addu    v1, t6, t7
    lbu     a2, 0x004D(v1)             # 0000004D
    sw      a1, 0x0004($sp)
    andi    a3, a1, 0x00FF             # a3 = 00000000
    blez    a2, lbl_800CAC9C
    or      v0, $zero, $zero           # v0 = 00000000
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    subu    t8, t8, a0
    sll     t8, t8,  3
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    a1, t8, t7
    or      t0, a3, $zero              # t0 = 00000000
    lui     t2, 0xFF00                 # t2 = FF000000
    lui     t1, 0x00F0                 # t1 = 00F00000
    sll     t9, v0,  2
lbl_800CAC64:
    addu    a3, a1, t9
    lw      t3, 0x002C(a3)             # 0000002C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    and     a0, t3, t1
    srl     a0, a0, 20
    andi    a0, a0, 0x00FF             # a0 = 00000000
    bnel    t0, a0, lbl_800CAC94
    slt     $at, v0, a2
    sw      t2, 0x002C(a3)             # 0000002C
    lbu     a2, 0x004D(v1)             # 0000004D
    slt     $at, v0, a2
lbl_800CAC94:
    bnel    $at, $zero, lbl_800CAC64
    sll     t9, v0,  2
lbl_800CAC9C:
    jr      $ra
    nop


func_800CACA4:
# MqDbg: Audio_SetVolumeScale
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lbu     t6, 0x001B($sp)
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t7, t6,  2
    addu    t7, t7, t6
    sll     t7, t7,  2
    subu    t7, t7, t6
    sll     t7, t7,  3
    addu    t7, t7, t6
    sw      a1, 0x001C($sp)
    sll     t7, t7,  2
    andi    a1, a1, 0x00FF             # a1 = 00000000
    sw      a3, 0x0024($sp)
    addu    v1, t1, t7
    andi    a3, a3, 0x00FF             # a3 = 00000000
    addu    t9, v1, a1
    andi    t8, a2, 0x007F             # t8 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a2, 0x0020($sp)
    sb      t8, 0x000E(t9)             # 0000000E
    beq     a3, $zero, lbl_800CAD38
    or      t0, a3, $zero              # t0 = 00000000
    lbu     t2, 0x001B($sp)
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sll     t3, t2,  2
    addu    t3, t3, t2
    sll     t3, t3,  2
    subu    t3, t3, t2
    sll     t3, t3,  3
    addu    t3, t3, t2
    sll     t3, t3,  2
    addu    v0, t1, t3
    sb      t4, 0x0013(v0)             # 00000013
    b       lbl_800CAE30
    sb      a3, 0x0012(v0)             # 00000012
lbl_800CAD38:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f2                   # $f2 = 127.00
    or      v0, $zero, $zero           # v0 = 00000000
    addu    t5, v1, v0
lbl_800CAD50:
    lbu     t6, 0x000E(t5)             # 0000000E
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t6, $f4                    # $f4 = 0.00
    bgez    t6, lbl_800CAD70
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CAD70:
    div.s   $f10, $f6, $f2
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    mul.s   $f0, $f0, $f10
    bnel    $at, $zero, lbl_800CAD50
    addu    t5, v1, v0
    mul.s   $f16, $f0, $f2
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    lbu     t7, 0x001B($sp)
    lui     $at, 0x4000                # $at = 40000000
    sll     t2, t0, 16
    sll     t8, t7, 24
    or      t9, t8, $at                # t9 = 40000000
    cfc1    t4, $f31
    ctc1    t5, $f31
    or      t3, t9, t2                 # t3 = 40000000
    cvt.w.s $f18, $f16
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    beq     t5, $zero, lbl_800CAE10
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sub.s   $f18, $f16, $f18
    ctc1    t5, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    bne     t5, $zero, lbl_800CAE08
    nop
    mfc1    t5, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CAE20
    or      t5, t5, $at                # t5 = 80000000
lbl_800CAE08:
    b       lbl_800CAE20
    addiu   t5, $zero, 0xFFFF          # t5 = FFFFFFFF
lbl_800CAE10:
    mfc1    t5, $f18
    nop
    bltz    t5, lbl_800CAE08
    nop
lbl_800CAE20:
    ctc1    t4, $f31
    andi    t6, t5, 0x00FF             # t6 = 000000FF
    jal     func_800C9FAC
    or      a0, t3, t6                 # a0 = 400000FF
lbl_800CAE30:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CAE40:
# MqDbg: Audio_UpdateActiveSequences
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s7, 0x003C($sp)
    sdc1    $f20, 0x0018($sp)
    lui     $at, 0x42FE                # $at = 42FE0000
    sw      s8, 0x0040($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    lui     s7, 0x8012                 # s7 = 80120000
    mtc1    $at, $f20                  # $f20 = 127.00
    sw      $ra, 0x0044($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    addiu   s7, s7, 0x4C00             # s7 = 80124C00
    or      s5, $zero, $zero           # s5 = 00000000
    lui     s6, 0xE300                 # s6 = E3000000
    addiu   s8, $zero, 0x0264          # s8 = 00000264
lbl_800CAE8C:
    multu   s5, s8
    mflo    t6
    addu    s2, s7, t6
    lbu     t7, 0x0260(s2)             # 00000260
    beql    t7, $zero, lbl_800CAEE0
    lbu     t8, 0x0013(s2)             # 00000013
    jal     func_800BB3E0
    addiu   a0, $sp, 0x0070            # a0 = FFFFFFE0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0004         # $at = 00000004
    bnel    v0, $at, lbl_800CAEE0
    lbu     t8, 0x0013(s2)             # 00000013
lbl_800CAED0:
    sb      $zero, 0x0260(s2)          # 00000260
    jal     func_800C9FAC
    lw      a0, 0x025C(s2)             # 0000025C
    lbu     t8, 0x0013(s2)             # 00000013
lbl_800CAEE0:
    beq     t8, $zero, lbl_800CB000
    sll     t9, s5,  2
    addu    t9, t9, s5
    sll     t9, t9,  2
    subu    t9, t9, s5
    sll     t9, t9,  3
    lui     $at, 0x3F80                # $at = 3F800000
    addu    t9, t9, s5
    sll     t9, t9,  2
    mtc1    $at, $f0                   # $f0 = 1.00
    addu    s4, s7, t9
    or      s3, $zero, $zero           # s3 = 00000000
    or      v0, s5, $zero              # v0 = 00000000
    addu    t2, s4, s3
lbl_800CAF18:
    lbu     t3, 0x000E(t2)             # 0000000E
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t3, $f4                    # $f4 = 0.00
    bgez    t3, lbl_800CAF38
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CAF38:
    div.s   $f10, $f6, $f20
    addiu   s3, s3, 0x0001             # s3 = 00000001
    andi    s3, s3, 0x00FF             # s3 = 00000001
    slti    $at, s3, 0x0004
    mul.s   $f0, $f0, $f10
    bnel    $at, $zero, lbl_800CAF18
    addu    t2, s4, s3
    mul.s   $f16, $f0, $f20
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lbu     t4, 0x0012(s2)             # 00000012
    lui     $at, 0x4000                # $at = 40000000
    sll     t7, v0, 24
    sll     t5, t4, 16
    or      t6, t5, $at                # t6 = 40000000
    cfc1    t9, $f31
    ctc1    t2, $f31
    or      t8, t6, t7                 # t8 = 40000000
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f18, $f16
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    beql    t2, $zero, lbl_800CAFE0
    mfc1    t2, $f18
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sub.s   $f18, $f16, $f18
    ctc1    t2, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    bne     t2, $zero, lbl_800CAFD4
    nop
    mfc1    t2, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CAFEC
    or      t2, t2, $at                # t2 = 80000000
lbl_800CAFD4:
    b       lbl_800CAFEC
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
    mfc1    t2, $f18
lbl_800CAFE0:
    nop
    bltz    t2, lbl_800CAFD4
    nop
lbl_800CAFEC:
    ctc1    t9, $f31
    andi    t3, t2, 0x00FF             # t3 = 000000FF
    jal     func_800CAA70
    or      a0, t8, t3                 # a0 = 400000FF
    sb      $zero, 0x0013(s2)          # 00000013
lbl_800CB000:
    lhu     v0, 0x000C(s2)             # 0000000C
    beq     v0, $zero, lbl_800CB04C
    addiu   t4, v0, 0xFFFF             # t4 = FFFFFFFF
    andi    t5, t4, 0xFFFF             # t5 = 0000FFFF
    beq     t5, $zero, lbl_800CB02C
    sh      t4, 0x000C(s2)             # 0000000C
    lwc1    $f4, 0x0000(s2)            # 00000000
    lwc1    $f8, 0x0008(s2)            # 00000008
    sub.s   $f6, $f4, $f8
    b       lbl_800CB034
    swc1    $f6, 0x0000(s2)            # 00000000
lbl_800CB02C:
    lwc1    $f10, 0x0004(s2)           # 00000004
    swc1    $f10, 0x0000(s2)           # 00000000
lbl_800CB034:
    andi    a0, s5, 0x00FF             # a0 = 00000000
    sll     a0, a0, 16
    lui     $at, 0x4100                # $at = 41000000
    or      a0, a0, $at                # a0 = 41000000
    jal     func_800BB098
    lw      a1, 0x0000(s2)             # 00000000
lbl_800CB04C:
    lw      a1, 0x0014(s2)             # 00000014
    beq     a1, $zero, lbl_800CB290
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, a1, $at
    srl     v0, v0, 15
    andi    a0, a1, 0x0FFF             # a0 = 00000000
    andi    a3, v0, 0x00FF             # a3 = 00000000
    or      v1, a1, $zero              # v1 = 00000000
    andi    t0, v0, 0x00FF             # t0 = 00000000
    bne     a3, $zero, lbl_800CB080
    andi    a2, a0, 0xFFFF             # a2 = 00000000
    addiu   t0, a3, 0x0001             # t0 = 00000001
    andi    t0, t0, 0x00FF             # t0 = 00000001
lbl_800CB080:
    sll     t6, s5,  2
    subu    t6, t6, s5
    sll     t6, t6,  2
    subu    t6, t6, s5
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  5
    addu    a1, t6, t7
    lw      t9, 0x3530(a1)             # 00003530
    addiu   $at, $zero, 0x0030         # $at = 00000030
    andi    v0, v1, 0xF000             # v0 = 00000000
    srl     t2, t9, 31
    beql    t2, $zero, lbl_800CB294
    lhu     v0, 0x0028(s2)             # 00000028
    lhu     t1, 0x3538(a1)             # 00003538
    srl     v0, v0, 12
    andi    v0, v0, 0x00FF             # v0 = 00000000
    div     $zero, t1, $at
    mflo    t1
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CB104
    andi    a3, t1, 0xFFFF             # a3 = 00000000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800CB114
    andi    v1, a0, 0xFFFF             # v1 = 00000000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800CB130
    andi    t3, a0, 0xFFFF             # t3 = 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    beql    v0, $at, lbl_800CB20C
    lhu     v0, 0x0018(s2)             # 00000018
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB104:
    addu    a2, a0, a3
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB114:
    slt     $at, v1, a3
    beq     $at, $zero, lbl_800CB128
    or      v0, a3, $zero              # v0 = 00000000
    subu    a2, v0, v1
    andi    a2, a2, 0xFFFF             # a2 = 00000000
lbl_800CB128:
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB130:
    mtc1    t3, $f16                   # $f16 = 0.00
    mtc1    a3, $f10                   # $f10 = 0.00
    bgez    t3, lbl_800CB150
    cvt.s.w $f18, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800CB150:
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f8                   # $f8 = 100.00
    cvt.s.w $f16, $f10
    bgez    a3, lbl_800CB174
    div.s   $f6, $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f16, $f16, $f4
lbl_800CB174:
    mul.s   $f18, $f16, $f6
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t4, $f31
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f18
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    beql    a2, $zero, lbl_800CB1EC
    mfc1    a2, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    sub.s   $f8, $f18, $f8
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    bne     a2, $zero, lbl_800CB1E0
    nop
    mfc1    a2, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CB1F8
    or      a2, a2, $at                # a2 = 80000000
lbl_800CB1E0:
    b       lbl_800CB1F8
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    mfc1    a2, $f8
lbl_800CB1EC:
    nop
    bltz    a2, lbl_800CB1E0
    nop
lbl_800CB1F8:
    ctc1    t4, $f31
    andi    a2, a2, 0xFFFF             # a2 = 0000FFFF
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB20C:
    andi    a2, a3, 0xFFFF             # a2 = 00000000
    beq     v0, $zero, lbl_800CB220
    nop
    b       lbl_800CB220
    andi    a2, v0, 0xFFFF             # a2 = 00000000
lbl_800CB220:
    mtc1    t1, $f16                   # $f16 = 0.00
    slti    $at, a2, 0x012D
    bne     $at, $zero, lbl_800CB234
    cvt.s.w $f2, $f16
    addiu   a2, $zero, 0x012C          # a2 = 0000012C
lbl_800CB234:
    mtc1    a2, $f10                   # $f10 = 0.00
    bne     v0, $zero, lbl_800CB244
    lui     $at, 0x4F80                # $at = 4F800000
    sh      a3, 0x0018(s2)             # 00000018
lbl_800CB244:
    bgez    a2, lbl_800CB258
    cvt.s.w $f0, $f10
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f0, $f0, $f4
lbl_800CB258:
    mtc1    t0, $f18                   # $f18 = 0.00
    swc1    $f0, 0x0020(s2)            # 00000020
    swc1    $f2, 0x001C(s2)            # 0000001C
    sub.s   $f6, $f2, $f0
    lui     $at, 0x4F80                # $at = 4F800000
    bgez    t0, lbl_800CB280
    cvt.s.w $f8, $f18
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f8, $f8, $f10
lbl_800CB280:
    div.s   $f4, $f6, $f8
    sh      t0, 0x0028(s2)             # 00000028
    sw      $zero, 0x0014(s2)          # 00000014
    swc1    $f4, 0x0024(s2)            # 00000024
lbl_800CB290:
    lhu     v0, 0x0028(s2)             # 00000028
lbl_800CB294:
    beq     v0, $zero, lbl_800CB2E8
    addiu   t5, v0, 0xFFFF             # t5 = FFFFFFFF
    andi    t6, t5, 0xFFFF             # t6 = 0000FFFF
    andi    v1, s5, 0x00FF             # v1 = 00000000
    sh      t5, 0x0028(s2)             # 00000028
    beq     t6, $zero, lbl_800CB2C4
    sll     v1, v1, 16
    lwc1    $f16, 0x001C(s2)           # 0000001C
    lwc1    $f18, 0x0024(s2)           # 00000024
    sub.s   $f10, $f16, $f18
    b       lbl_800CB2CC
    swc1    $f10, 0x001C(s2)           # 0000001C
lbl_800CB2C4:
    lwc1    $f6, 0x0020(s2)            # 00000020
    swc1    $f6, 0x001C(s2)            # 0000001C
lbl_800CB2CC:
    lwc1    $f8, 0x001C(s2)            # 0000001C
    lui     $at, 0x4700                # $at = 47000000
    or      a0, v1, $at                # a0 = 47000000
    trunc.w.s $f4, $f8
    mfc1    a1, $f4
    jal     func_800BB0BC
    nop
lbl_800CB2E8:
    lhu     t9, 0x0252(s2)             # 00000252
    beq     t9, $zero, lbl_800CB3A0
    sll     t2, s5,  2
    addu    t2, t2, s5
    sll     t2, t2,  2
    subu    t2, t2, s5
    sll     t2, t2,  3
    addu    t2, t2, s5
    sll     t2, t2,  2
    addu    s4, s7, t2
    or      s0, $zero, $zero           # s0 = 00000000
    sll     a0, s0,  5
lbl_800CB318:
    addu    v0, s4, a0
    lhu     v1, 0x005C(v0)             # 0000005C
    andi    a2, s5, 0x00FF             # a2 = 00000000
    sll     a2, a2, 16
    beq     v1, $zero, lbl_800CB38C
    addiu   t8, v1, 0xFFFF             # t8 = FFFFFFFF
    lui     $at, 0x0100                # $at = 01000000
    andi    t3, t8, 0xFFFF             # t3 = 0000FFFF
    sh      t8, 0x005C(v0)             # 0000005C
    beq     t3, $zero, lbl_800CB358
    or      a2, a2, $at                # a2 = 01000000
    lwc1    $f16, 0x0050(v0)           # 00000050
    lwc1    $f18, 0x0058(v0)           # 00000058
    sub.s   $f10, $f16, $f18
    b       lbl_800CB378
    swc1    $f10, 0x0050(v0)           # 00000050
lbl_800CB358:
    addu    v1, s2, a0
    lwc1    $f6, 0x0054(v1)            # 00000054
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sllv    t6, t5, s0
    swc1    $f6, 0x0050(v1)            # 00000050
    lhu     t4, 0x0252(s2)             # 00000252
    xor     t7, t4, t6
    sh      t7, 0x0252(s2)             # 00000252
lbl_800CB378:
    andi    t9, s0, 0x00FF             # t9 = 00000000
    sll     t2, t9,  8
    or      a0, a2, t2                 # a0 = 01000000
    jal     func_800BB098
    lw      a1, 0x0050(v0)             # 00000050
lbl_800CB38C:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800CB318
    sll     a0, s0,  5
lbl_800CB3A0:
    lhu     t8, 0x0250(s2)             # 00000250
    beq     t8, $zero, lbl_800CB458
    sll     t3, s5,  2
    addu    t3, t3, s5
    sll     t3, t3,  2
    subu    t3, t3, s5
    sll     t3, t3,  3
    addu    t3, t3, s5
    sll     t3, t3,  2
    addu    s4, s7, t3
    or      s0, $zero, $zero           # s0 = 00000000
    sll     a0, s0,  5
lbl_800CB3D0:
    addu    v0, s4, a0
    lhu     v1, 0x006C(v0)             # 0000006C
    andi    a2, s5, 0x00FF             # a2 = 00000000
    sll     a2, a2, 16
    beq     v1, $zero, lbl_800CB444
    addiu   t5, v1, 0xFFFF             # t5 = FFFFFFFF
    lui     $at, 0x0400                # $at = 04000000
    andi    t4, t5, 0xFFFF             # t4 = 0000FFFF
    sh      t5, 0x006C(v0)             # 0000006C
    beq     t4, $zero, lbl_800CB410
    or      a2, a2, $at                # a2 = 04000000
    lwc1    $f8, 0x0060(v0)            # 00000060
    lwc1    $f4, 0x0068(v0)            # 00000068
    sub.s   $f16, $f8, $f4
    b       lbl_800CB430
    swc1    $f16, 0x0060(v0)           # 00000060
lbl_800CB410:
    addu    v1, s2, a0
    lwc1    $f18, 0x0064(v1)           # 00000064
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t9, t7, s0
    swc1    $f18, 0x0060(v1)           # 00000060
    lhu     t6, 0x0250(s2)             # 00000250
    xor     t2, t6, t9
    sh      t2, 0x0250(s2)             # 00000250
lbl_800CB430:
    andi    t8, s0, 0x00FF             # t8 = 00000000
    sll     t3, t8,  8
    or      a0, a2, t3                 # a0 = 04000000
    jal     func_800BB098
    lw      a1, 0x0060(v0)             # 00000060
lbl_800CB444:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800CB3D0
    sll     a0, s0,  5
lbl_800CB458:
    lbu     t5, 0x004D(s2)             # 0000004D
    beq     t5, $zero, lbl_800CB750
    lui     a0, 0xF000                 # a0 = F0000000
    jal     func_800CAB80
    or      a1, a0, $zero              # a1 = F0000000
    bnel    v0, $zero, lbl_800CB480
    lbu     v0, 0x004C(s2)             # 0000004C
    b       lbl_800CB764
    sb      $zero, 0x004D(s2)          # 0000004D
    lbu     v0, 0x004C(s2)             # 0000004C
lbl_800CB480:
    sll     t7, s5,  2
    subu    t7, t7, s5
    beq     v0, $zero, lbl_800CB49C
    sll     t7, t7,  2
    addiu   t4, v0, 0xFFFF             # t4 = FFFFFFFF
    b       lbl_800CB750
    sb      t4, 0x004C(s2)             # 0000004C
lbl_800CB49C:
    subu    t7, t7, s5
    sll     t7, t7,  5
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, t7
    lw      t6, -0x74A0(t6)            # 80128B60
    srl     t9, t6, 31
    bnel    t9, $zero, lbl_800CB754
    addiu   s5, s5, 0x0001             # s5 = 00000001
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t2, s5,  2
    addu    t2, t2, s5
    blez    v1, lbl_800CB74C
    or      s3, $zero, $zero           # s3 = 00000000
    sll     t2, t2,  2
    subu    t2, t2, s5
    sll     t2, t2,  3
    addu    t2, t2, s5
    sll     t2, t2,  2
    addu    s4, s7, t2
    sll     t8, s3,  2
lbl_800CB4EC:
    addu    t3, s4, t8
    lw      v0, 0x002C(t3)             # 0000002C
    lui     $at, 0x00F0                # $at = 00F00000
    and     a0, v0, $at
    lui     $at, 0x000F                # $at = 000F0000
    srl     a0, a0, 20
    and     s1, v0, $at
    andi    a0, a0, 0x00FF             # a0 = 00000000
    andi    s0, v0, 0xFF00             # s0 = 00000000
    srl     s1, s1, 16
    srl     s0, s0,  8
    sltiu   $at, a0, 0x000F
    or      a3, v0, $zero              # a3 = 00000000
    andi    s1, s1, 0x00FF             # s1 = 00000000
    andi    s0, s0, 0x00FF             # s0 = 00000000
    beq     $at, $zero, lbl_800CB738
    andi    a3, a3, 0x00FF             # a3 = 00000000
    sll     t5, a0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t5
    lw      t5, -0x5E90($at)           # 8010A170
    jr      t5
    nop
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800CACA4
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     t4, 0x8012                 # t4 = 80120000
    addu    t4, t4, s5
    lbu     t4, 0x47F8(t4)             # 801247F8
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    bne     a3, t4, lbl_800CB738
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    andi    a3, s0, 0x00FF             # a3 = 00000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lhu     t7, 0x0254(s2)             # 00000254
    lui     $at, 0x3000                # $at = 30000000
    sll     t9, s5, 24
    or      t6, t7, $at                # t6 = 30000000
    jal     func_800CAA70
    or      a0, t6, t9                 # a0 = 30000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    multu   s1, s8
    sll     t3, s1, 24
    lui     $at, 0x0001                # $at = 00010000
    mflo    t2
    addu    s0, s7, t2
    lhu     t8, 0x0254(s0)             # 00000254
    or      a0, t8, t3                 # a0 = 00000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 00010000
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    addiu   t4, $zero, 0x007F          # t4 = 0000007F
    sb      t5, 0x0013(s0)             # 00000013
    sb      t4, 0x000F(s0)             # 0000000F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x3000           # $at = B0003000
    sll     t7, s1, 24
    or      t6, t7, $at                # t6 = B0003000
    sll     t9, s0, 16
    or      t2, t6, t9                 # t2 = B0003000
    jal     func_800CAA70
    or      a0, t2, a3                 # a0 = B0003000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x4000           # $at = B0004000
    sll     t8, s1, 24
    or      t3, t8, $at                # t3 = B0004000
    sll     t5, a3, 16
    jal     func_800CAA70
    or      a0, t3, t5                 # a0 = B0004000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    multu   s1, s8
    sll     t9, s1, 24
    andi    v1, v0, 0xFFFF             # v1 = 00000000
    mflo    t4
    addu    s0, s7, t4
    lbu     t7, 0x004E(s0)             # 0000004E
    sll     t6, t7, 16
    or      t2, t6, t9                 # t2 = 00000000
    jal     func_800CAA70
    or      a0, t2, v1                 # a0 = 00000000
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    sb      $zero, 0x004E(s0)          # 0000004E
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sb      s0, 0x004E(s2)             # 0000004E
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    andi    a0, s1, 0x00FF             # a0 = 00000000
    andi    a1, s0, 0x00FF             # a1 = 00000000
    jal     func_800CACA4
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    andi    t8, a3, 0x0001             # t8 = 00000000
    beq     t8, $zero, lbl_800CB6B8
    or      s0, a3, $zero              # s0 = 00000000
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CB6B8:
    andi    t3, s0, 0x0002             # t3 = 00000000
    beq     t3, $zero, lbl_800CB6CC
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800CB6CC:
    andi    t5, s0, 0x0004             # t5 = 00000000
    beq     t5, $zero, lbl_800CB6E0
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0002          # a1 = 00000002
lbl_800CB6E0:
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t4, s1, 24
    lui     $at, 0xA000                # $at = A0000000
    andi    v1, v0, 0xFFFF             # v1 = 00000000
    or      t7, t4, $at                # t7 = A0000000
    jal     func_800CAA70
    or      a0, t7, v1                 # a0 = A0000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t3, a3,  2
    addu    t3, t3, a3
    sll     t6, s1, 24
    lui     $at, 0x5000                # $at = 50000000
    or      t9, t6, $at                # t9 = 50000000
    sll     t3, t3,  1
    sll     t2, s0, 16
    or      t8, t9, t2                 # t8 = 50000000
    andi    t5, t3, 0xFFFF             # t5 = 00000000
    jal     func_800CAA70
    or      a0, t8, t5                 # a0 = 50000000
    lbu     v1, 0x004D(s2)             # 0000004D
lbl_800CB738:
    addiu   s3, s3, 0x0001             # s3 = 00000001
    andi    s3, s3, 0x00FF             # s3 = 00000001
    slt     $at, s3, v1
    bnel    $at, $zero, lbl_800CB4EC
    sll     t8, s3,  2
lbl_800CB74C:
    sb      $zero, 0x004D(s2)          # 0000004D
lbl_800CB750:
    addiu   s5, s5, 0x0001             # s5 = 00000002
lbl_800CB754:
    andi    s5, s5, 0x00FF             # s5 = 00000002
    slti    $at, s5, 0x0004
    bne     $at, $zero, lbl_800CAE8C
    nop
lbl_800CB764:
    lw      $ra, 0x0044($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    lw      s7, 0x003C($sp)
    lw      s8, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_800CB798:
# MqDbg: func_800FAD34
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43C4(v1)             # 801043C4
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    beq     v1, $zero, lbl_800CB848
    or      v0, v1, $zero              # v0 = 80100000
    addiu   s0, $zero, 0x0001          # s0 = 00000001
    bne     s0, v0, lbl_800CB7F8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    jal     func_800BB49C
    nop
    bne     v0, s0, lbl_800CB7EC
    lui     $at, 0x8010                # $at = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sb      $zero, 0x43C4($at)         # 801043C4
    lb      a1, 0x438C(a1)             # 8010438C
    jal     func_800BB0E0
    lui     a0, 0x4602                 # a0 = 46020000
    jal     func_800C7E4C
    nop
lbl_800CB7EC:
    lui     v1, 0x8010                 # v1 = 80100000
    b       lbl_800CB848
    lbu     v1, 0x43C4(v1)             # 801043C4
lbl_800CB7F8:
    bnel    v0, $at, lbl_800CB84C
    lw      $ra, 0x001C($sp)
    jal     func_800BB49C
    nop
    beq     v0, s0, lbl_800CB820
    nop
lbl_800CB810:
    jal     func_800BB49C
    nop
    bne     v0, s0, lbl_800CB810
    nop
lbl_800CB820:
    lui     $at, 0x8010                # $at = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sb      $zero, 0x43C4($at)         # 801043C4
    lb      a1, 0x438C(a1)             # 8010438C
    jal     func_800BB0E0
    lui     a0, 0x4602                 # a0 = 46020000
    jal     func_800C7E4C
    nop
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43C4(v1)             # 801043C4
lbl_800CB848:
    lw      $ra, 0x001C($sp)
lbl_800CB84C:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    or      v0, v1, $zero              # v0 = 80100000


func_800CB85C:
# MqDbg: Audio_ResetActiveSequences
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x47F8             # a2 = 801247F8
    addiu   a3, a3, 0x4C00             # a3 = 80124C00
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    addiu   t2, $zero, 0x007F          # t2 = 0000007F
    ori     t1, $zero, 0xFFFF          # t1 = 0000FFFF
    addiu   t0, $zero, 0x0264          # t0 = 00000264
lbl_800CB880:
    multu   v0, t0
    addu    t6, a2, v0
    sb      $zero, 0x0000(t6)          # 00000000
    sll     t8, v0,  2
    addu    t8, t8, v0
    sll     t8, t8,  2
    subu    t8, t8, v0
    sll     t8, t8,  3
    addu    t8, t8, v0
    sll     t8, t8,  2
    mflo    t7
    addu    v1, a3, t7
    sh      t1, 0x0254(v1)             # 00000254
    sh      t1, 0x0256(v1)             # 00000256
    sh      $zero, 0x0028(v1)          # 00000028
    sh      $zero, 0x0018(v1)          # 00000018
    sw      $zero, 0x0014(v1)          # 00000014
    sh      $zero, 0x0258(v1)          # 00000258
    sb      $zero, 0x004D(v1)          # 0000004D
    sb      $zero, 0x004E(v1)          # 0000004E
    sh      $zero, 0x0250(v1)          # 00000250
    sh      $zero, 0x0252(v1)          # 00000252
    addu    a1, a3, t8
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800CB8E0:
    addu    t9, a1, a0
    addiu   a0, a0, 0x0001             # a0 = 00000001
    andi    a0, a0, 0x00FF             # a0 = 00000001
    slti    $at, a0, 0x0004
    bne     $at, $zero, lbl_800CB8E0
    sb      t2, 0x000E(t9)             # 0000000E
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    sb      t3, 0x0012(v1)             # 00000012
    bne     $at, $zero, lbl_800CB880
    sb      t3, 0x0013(v1)             # 00000013
    jr      $ra
    nop


func_800CB918:
# MqDbg: Audio_ResetActiveSequencesAndVolume
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     a3, 0x8012                 # a3 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    sw      $ra, 0x0014($sp)
    addiu   a3, a3, 0x4C00             # a3 = 80124C00
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   t0, $zero, 0x0264          # t0 = 00000264
    addiu   a0, $zero, 0x007F          # a0 = 0000007F
lbl_800CB93C:
    multu   a2, t0
    sll     t7, a2,  2
    addu    t7, t7, a2
    sll     t7, t7,  2
    subu    t7, t7, a2
    sll     t7, t7,  3
    addu    t7, t7, a2
    sll     t7, t7,  2
    addu    v1, a3, t7
    or      v0, $zero, $zero           # v0 = 00000000
    mflo    t6
    addu    a1, a3, t6
    swc1    $f0, 0x0000(a1)            # 00000000
    sh      $zero, 0x000C(a1)          # 0000000C
    sb      $zero, 0x0013(a1)          # 00000013
lbl_800CB978:
    addu    t8, v1, v0
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    bne     $at, $zero, lbl_800CB978
    sb      a0, 0x000E(t8)             # 0000000E
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a2, a2, 0x00FF             # a2 = 00000001
    slti    $at, a2, 0x0004
    bne     $at, $zero, lbl_800CB93C
    nop
    jal     func_800CB85C
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
