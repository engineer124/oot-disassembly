# Audio Effects
#
# Starts at VRAM: 800BDE80 / VROM: ??????
#

.section .text
func_800BDE80:
# MqDbg: Audio_SequenceChannelProcessSound
    lw      v0, 0x0000(a0)             # 00000000
    or      a3, a0, $zero              # a3 = 00000000
    addiu   t1, $zero, 0x0010          # t1 = 00000010
    sll     t7, v0,  9
    bltz    t7, lbl_800BDEA0
    addiu   t0, $zero, 0x0080          # t0 = 00000080
    beql    a1, $zero, lbl_800BDEF4
    sll     t6, v0, 10
lbl_800BDEA0:
    lwc1    $f4, 0x002C(a0)            # 0000002C
    lwc1    $f6, 0x0028(a0)            # 00000028
    lw      v0, 0x004C(a0)             # 0000004C
    mul.s   $f8, $f4, $f6
    lwc1    $f10, 0x0030(v0)           # 00000030
    lw      t8, 0x0000(v0)             # 00000000
    sll     t2, t8,  2
    mul.s   $f0, $f8, $f10
    bgez    t2, lbl_800BDEE4
    nop
    lbu     t3, 0x0003(a0)             # 00000003
    andi    t4, t3, 0x0020             # t4 = 00000000
    beq     t4, $zero, lbl_800BDEE4
    nop
    lwc1    $f16, 0x0028(v0)           # 00000028
    mul.s   $f0, $f16, $f0
    nop
lbl_800BDEE4:
    mul.s   $f18, $f0, $f0
    lw      v0, 0x0000(a0)             # 00000000
    swc1    $f18, 0x0034(a0)           # 00000034
    sll     t6, v0, 10
lbl_800BDEF4:
    bgez    t6, lbl_800BDF14
    nop
    lbu     t7, 0x000A(a0)             # 0000000A
    lbu     t8, 0x000B(a0)             # 0000000B
    multu   t7, t8
    mflo    t9
    sw      t9, 0x0030(a0)             # 00000030
    nop
lbl_800BDF14:
    beq     a2, $zero, lbl_800BDF38
    lwc1    $f0, 0x0038(a0)            # 00000038
    lw      t2, 0x004C(a0)             # 0000004C
    lbu     t4, 0x0001(a0)             # 00000001
    lwc1    $f4, 0x0034(t2)            # 00000034
    ori     t5, t4, 0x0080             # t5 = 00000080
    sb      t5, 0x0001(a0)             # 00000001
    mul.s   $f0, $f0, $f4
    nop
lbl_800BDF38:
    or      a2, $zero, $zero           # a2 = 00000000
lbl_800BDF3C:
    lw      v1, 0x0050(a3)             # 00000050
    addiu   a2, a2, 0x0004             # a2 = 00000004
    beq     v1, $zero, lbl_800BE038
    nop
    lw      t6, 0x0000(v1)             # 00000000
    srl     t7, t6, 31
    beq     t7, $zero, lbl_800BE038
    nop
    lw      t8, 0x002C(v1)             # 0000002C
    beq     t8, $zero, lbl_800BE038
    nop
    lbu     v0, 0x0000(v1)             # 00000000
    andi    t9, v0, 0x0001             # t9 = 00000000
    beql    t9, $zero, lbl_800BDFC8
    lb      t2, 0x0001(a0)             # 00000001
    lwc1    $f6, 0x0030(v1)            # 00000030
    lwc1    $f10, 0x0038(v1)           # 00000038
    lbu     t2, 0x0006(v1)             # 00000006
    mul.s   $f8, $f6, $f0
    andi    t9, v0, 0xFFFE             # t9 = 00000000
    swc1    $f8, 0x0044(v1)            # 00000044
    lwc1    $f16, 0x0034(a0)           # 00000034
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0040(v1)           # 00000040
    lbu     t3, 0x000B(a0)             # 0000000B
    lw      t6, 0x0030(a0)             # 00000030
    sb      t9, 0x0000(v1)             # 00000000
    subu    t4, t0, t3
    multu   t2, t4
    mflo    t5
    addu    t7, t6, t5
    sra     t8, t7,  7
    b       lbl_800BE038
    sb      t8, 0x0007(v1)             # 00000007
    lb      t2, 0x0001(a0)             # 00000001
lbl_800BDFC8:
    bgezl   t2, lbl_800BDFE0
    lw      v0, 0x0000(a0)             # 00000000
    lwc1    $f4, 0x0030(v1)            # 00000030
    mul.s   $f6, $f4, $f0
    swc1    $f6, 0x0044(v1)            # 00000044
    lw      v0, 0x0000(a0)             # 00000000
lbl_800BDFE0:
    sll     t6, v0,  9
    bltzl   t6, lbl_800BDFF8
    lwc1    $f8, 0x0038(v1)            # 00000038
    beql    a1, $zero, lbl_800BE00C
    sll     t7, v0, 10
    lwc1    $f8, 0x0038(v1)            # 00000038
lbl_800BDFF8:
    lwc1    $f10, 0x0034(a0)           # 00000034
    mul.s   $f16, $f8, $f10
    swc1    $f16, 0x0040(v1)           # 00000040
    lw      v0, 0x0000(a0)             # 00000000
    sll     t7, v0, 10
lbl_800BE00C:
    bgez    t7, lbl_800BE038
    nop
    lbu     t9, 0x000B(a0)             # 0000000B
    lbu     t8, 0x0006(v1)             # 00000006
    lw      t4, 0x0030(a0)             # 00000030
    subu    t3, t0, t9
    multu   t8, t3
    mflo    t2
    addu    t6, t4, t2
    sra     t5, t6,  7
    sb      t5, 0x0007(v1)             # 00000007
lbl_800BE038:
    bne     a2, t1, lbl_800BDF3C
    addiu   a3, a3, 0x0004             # a3 = 00000004
    jr      $ra
    sb      $zero, 0x0001(a0)          # 00000001


func_800BE048:
# MqDbg: Audio_SequencePlayerProcessSound
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lhu     t6, 0x0012(a0)             # 00000012
    or      s2, a0, $zero              # s2 = 00000000
    or      s1, s2, $zero              # s1 = 00000000
    beq     t6, $zero, lbl_800BE108
    or      s0, $zero, $zero           # s0 = 00000000
    lwc1    $f4, 0x001C(a0)            # 0000001C
    lwc1    $f6, 0x0020(a0)            # 00000020
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    add.s   $f8, $f4, $f6
    lbu     t8, 0x0000(a0)             # 00000000
    swc1    $f8, 0x001C(a0)            # 0000001C
    lwc1    $f0, 0x001C(a0)            # 0000001C
    ori     t9, t8, 0x0004             # t9 = 00000004
    sb      t9, 0x0000(a0)             # 00000000
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_800BE0BC
    mtc1    $zero, $f2                 # $f2 = 0.00
    swc1    $f2, 0x001C(a0)            # 0000001C
    lwc1    $f0, 0x001C(a0)            # 0000001C
    mtc1    $zero, $f2                 # $f2 = 0.00
lbl_800BE0BC:
    nop
    c.lt.s  $f0, $f2
    nop
    bc1fl   lbl_800BE0D8
    lhu     t0, 0x0012(s2)             # 00000012
    swc1    $f2, 0x001C(s2)            # 0000001C
    lhu     t0, 0x0012(s2)             # 00000012
lbl_800BE0D8:
    addiu   t1, t0, 0xFFFF             # t1 = FFFFFFFF
    andi    t2, t1, 0xFFFF             # t2 = 0000FFFF
    bne     t2, $zero, lbl_800BE108
    sh      t1, 0x0012(s2)             # 00000012
    lbu     t3, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    t3, $at, lbl_800BE10C
    lw      t4, 0x0000(s2)             # 00000000
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800BE178
    lw      $ra, 0x002C($sp)
lbl_800BE108:
    lw      t4, 0x0000(s2)             # 00000000
lbl_800BE10C:
    addiu   s4, $zero, 0x0040          # s4 = 00000040
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    sll     t6, t4,  5
    bgez    t6, lbl_800BE130
    nop
    lwc1    $f10, 0x001C(s2)           # 0000001C
    lwc1    $f16, 0x002C(s2)           # 0000002C
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0030(s2)           # 00000030
lbl_800BE130:
    lw      a0, 0x0038(s1)             # 00000038
    lw      t7, 0x0000(a0)             # 00000000
    srl     t8, t7, 31
    bnel    s3, t8, lbl_800BE160
    addiu   s0, s0, 0x0004             # s0 = 00000004
    lw      a1, 0x0000(s2)             # 00000000
    lbu     a2, 0x0000(s2)             # 00000000
    sll     a1, a1,  5
    srl     a1, a1, 31
    jal     func_800BDE80
    andi    a2, a2, 0x0001             # a2 = 00000000
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800BE160:
    bne     s0, s4, lbl_800BE130
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lbu     t9, 0x0000(s2)             # 00000000
    andi    t0, t9, 0xFFFB             # t0 = 00000000
    sb      t0, 0x0000(s2)             # 00000000
    lw      $ra, 0x002C($sp)
lbl_800BE178:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BE194:
# MqDbg: Audio_GetPortamentoFreqScale
    lhu     t6, 0x0002(a0)             # 00000002
    lhu     t7, 0x0004(a0)             # 00000004
    addu    v0, t6, t7
    sh      v0, 0x0002(a0)             # 00000002
    sra     v0, v0,  8
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sltiu   $at, v0, 0x007F
    bnel    $at, $zero, lbl_800BE1C4
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
    sb      $zero, 0x0000(a0)          # 00000000
    lui     $at, 0x3F80                # $at = 3F800000
lbl_800BE1C4:
    mtc1    $at, $f12                  # $f12 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    sll     t9, v0,  2
    addu    $at, $at, t9
    lwc1    $f4, 0x05C4($at)           # 801005C4
    lwc1    $f8, 0x0008(a0)            # 00000008
    sub.s   $f6, $f4, $f12
    mul.s   $f10, $f6, $f8
    add.s   $f2, $f10, $f12
    jr      $ra
    mov.s   $f0, $f2


func_800BE1F0:
# MqDbg: Audio_GetVibratoPitchChange
    lwc1    $f4, 0x0010(a0)            # 00000010
    lw      t6, 0x0004(a0)             # 00000004
    lw      t0, 0x0008(a0)             # 00000008
    trunc.w.s $f6, $f4
    mfc1    t8, $f6
    nop
    addu    t9, t6, t8
    srl     v1, t9, 10
    andi    v1, v1, 0x003F             # v1 = 00000000
    sll     t1, v1,  1
    sw      t9, 0x0004(a0)             # 00000004
    addu    t2, t0, t1
    jr      $ra
    lh      v0, 0x0000(t2)             # 00000000


func_800BE228:
# MqDbg: Audio_GetVibratoFreqScale
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lhu     v0, 0x001A(a0)             # 0000001A
    lw      v1, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $zero, lbl_800BE254
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    b       lbl_800BE454
    sh      t6, 0x001A(a0)             # 0000001A
lbl_800BE254:
    beql    v1, $at, lbl_800BE3B0
    mtc1    $zero, $f4                 # $f4 = 0.00
    lhu     v0, 0x0018(a0)             # 00000018
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_800BE2CC
    lwc1    $f4, 0x000C(a0)            # 0000000C
    bne     v0, $at, lbl_800BE290
    or      a1, v0, $zero              # a1 = 00000000
    lhu     t7, 0x0016(v1)             # 00000016
    lhu     v0, 0x0018(a0)             # 00000018
    mtc1    t7, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    b       lbl_800BE2BC
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE290:
    lhu     t8, 0x0016(v1)             # 00000016
    mtc1    a1, $f6                    # $f6 = 0.00
    lwc1    $f0, 0x000C(a0)            # 0000000C
    mtc1    t8, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    cvt.s.w $f8, $f6
    sub.s   $f4, $f10, $f0
    div.s   $f10, $f4, $f8
    add.s   $f6, $f0, $f10
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE2BC:
    addiu   t9, v0, 0xFFFF             # t9 = FFFFFFFF
    b       lbl_800BE304
    sh      t9, 0x0018(a0)             # 00000018
    lwc1    $f4, 0x000C(a0)            # 0000000C
lbl_800BE2CC:
    lhu     t2, 0x0016(v1)             # 00000016
    trunc.w.s $f8, $f4
    mfc1    t1, $f8
    nop
    beql    t1, t2, lbl_800BE308
    lhu     v0, 0x0016(a0)             # 00000016
    lhu     v0, 0x001A(v1)             # 0000001A
    bne     v0, $zero, lbl_800BE304
    sh      v0, 0x0018(a0)             # 00000018
    lhu     t3, 0x0016(v1)             # 00000016
    mtc1    t3, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f6, $f10
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE304:
    lhu     v0, 0x0016(a0)             # 00000016
lbl_800BE308:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_800BE374
    lwc1    $f4, 0x0010(a0)            # 00000010
    bne     v0, $at, lbl_800BE338
    or      a1, v0, $zero              # a1 = 00000000
    lhu     t4, 0x0014(v1)             # 00000014
    lhu     v0, 0x0016(a0)             # 00000016
    mtc1    t4, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f8, $f4
    b       lbl_800BE364
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE338:
    lhu     t5, 0x0014(v1)             # 00000014
    mtc1    a1, $f8                    # $f8 = 0.00
    lwc1    $f0, 0x0010(a0)            # 00000010
    mtc1    t5, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f6, $f10
    cvt.s.w $f10, $f8
    sub.s   $f4, $f6, $f0
    div.s   $f6, $f4, $f10
    add.s   $f8, $f0, $f6
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE364:
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800BE3AC
    sh      t6, 0x0016(a0)             # 00000016
    lwc1    $f4, 0x0010(a0)            # 00000010
lbl_800BE374:
    lhu     t9, 0x0014(v1)             # 00000014
    trunc.w.s $f10, $f4
    mfc1    t8, $f10
    nop
    beql    t8, t9, lbl_800BE3B0
    mtc1    $zero, $f4                 # $f4 = 0.00
    lhu     v0, 0x0018(v1)             # 00000018
    bne     v0, $zero, lbl_800BE3AC
    sh      v0, 0x0016(a0)             # 00000016
    lhu     t0, 0x0014(v1)             # 00000014
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE3AC:
    mtc1    $zero, $f4                 # $f4 = 0.00
lbl_800BE3B0:
    lwc1    $f10, 0x000C(a0)           # 0000000C
    lui     $at, 0x3F80                # $at = 3F800000
    c.eq.s  $f4, $f10
    nop
    bc1f    lbl_800BE3D4
    nop
    mtc1    $at, $f0                   # $f0 = 1.00
    b       lbl_800BE458
    lw      $ra, 0x0014($sp)
lbl_800BE3D4:
    jal     func_800BE1F0
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f18                  # $f18 = 1.00
    lui     $at, 0x3980                # $at = 39800000
    mtc1    $at, $f8                   # $f8 = 0.00
    lwc1    $f6, 0x000C(a0)            # 0000000C
    mtc1    v0, $f4                    # $f4 = 0.00
    lui     $at, 0x4700                # $at = 47000000
    mul.s   $f16, $f6, $f8
    mtc1    $at, $f6                   # $f6 = 32768.00
    lui     $at, 0x4780                # $at = 47800000
    lui     t1, 0x8010                 # t1 = 80100000
    lw      t1, 0x1824(t1)             # 80101824
    cvt.s.w $f10, $f4
    addiu   t2, t1, 0x0001             # t2 = 80100001
    add.s   $f2, $f16, $f18
    add.s   $f8, $f10, $f6
    mtc1    $at, $f6                   # $f6 = 65536.00
    lui     $at, 0x8010                # $at = 80100000
    div.s   $f12, $f18, $f2
    sub.s   $f4, $f2, $f12
    mul.s   $f10, $f4, $f8
    div.s   $f4, $f10, $f6
    lwc1    $f10, 0x1820($at)          # 80101820
    add.s   $f8, $f4, $f12
    div.s   $f0, $f18, $f8
    add.s   $f6, $f10, $f0
    swc1    $f6, 0x1820($at)           # 80101820
    lui     $at, 0x8010                # $at = 80100000
    sw      t2, 0x1824($at)            # 80101824
lbl_800BE454:
    lw      $ra, 0x0014($sp)
lbl_800BE458:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BE464:
# MqDbg: Audio_NoteVibratoUpdate
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lbu     t6, 0x0090(a0)             # 00000090
    or      a1, a0, $zero              # a1 = 00000000
    addiu   a0, a0, 0x0090             # a0 = 00000090
    beql    t6, $zero, lbl_800BE494
    lbu     t7, 0x00B0(a1)             # 000000B0
    jal     func_800BE194
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    swc1    $f0, 0x0038(a1)            # 00000038
    lbu     t7, 0x00B0(a1)             # 000000B0
lbl_800BE494:
    addiu   a0, a1, 0x009C             # a0 = 0000009C
    beql    t7, $zero, lbl_800BE4B4
    lw      $ra, 0x0014($sp)
    jal     func_800BE228
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    swc1    $f0, 0x003C(a1)            # 0000003C
    lw      $ra, 0x0014($sp)
lbl_800BE4B4:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BE4C0:
# MqDbg: Audio_NoteVibratoInit
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sb      t6, 0x00B0(a0)             # 000000B0
    sw      $zero, 0x00A0(a0)          # 000000A0
    lui     t7, 0x8010                 # t7 = 80100000
    swc1    $f4, 0x003C(a0)            # 0000003C
    lw      t7, 0x03A8(t7)             # 801003A8
    lw      t8, 0x0044(a0)             # 00000044
    sw      t7, 0x00A4(a0)             # 000000A4
    lw      t9, 0x0050(t8)             # 00000050
    sw      t9, 0x009C(a0)             # 0000009C
    lhu     a1, 0x001A(t9)             # 0000001A
    or      v1, t9, $zero              # v1 = 00000000
    bne     a1, $zero, lbl_800BE51C
    sh      a1, 0x00B4(a0)             # 000000B4
    lhu     t0, 0x0016(t9)             # 00000016
    addiu   v0, a0, 0x009C             # v0 = 0000009C
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    b       lbl_800BE534
    swc1    $f8, 0x000C(v0)            # 000000A8
lbl_800BE51C:
    lhu     t1, 0x0012(v1)             # 00000012
    addiu   v0, a0, 0x009C             # v0 = 0000009C
    mtc1    t1, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f16, $f10
    swc1    $f16, 0x000C(v0)           # 000000A8
lbl_800BE534:
    lhu     a1, 0x0018(v1)             # 00000018
    bne     a1, $zero, lbl_800BE558
    sh      a1, 0x0016(v0)             # 000000B2
    lhu     t2, 0x0014(v1)             # 00000014
    mtc1    t2, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f4, $f18
    b       lbl_800BE56C
    swc1    $f4, 0x0010(v0)            # 000000AC
lbl_800BE558:
    lhu     t3, 0x0010(v1)             # 00000010
    mtc1    t3, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    swc1    $f8, 0x0010(v0)            # 000000AC
lbl_800BE56C:
    lhu     t4, 0x001C(v1)             # 0000001C
    jr      $ra
    sh      t4, 0x001A(v0)             # 000000B6


func_800BE578:
# MqDbg: Audio_NotePortamentoInit
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    lw      t6, 0x0044(a0)             # 00000044
    swc1    $f4, 0x0038(a0)            # 00000038
    lw      t8, 0x0020(t6)             # 00000020
    sw      t8, 0x0090(a0)             # 00000090
    lw      t7, 0x0024(t6)             # 00000024
    sw      t7, 0x0094(a0)             # 00000094
    lw      t8, 0x0028(t6)             # 00000028
    jr      $ra
    sw      t8, 0x0098(a0)             # 00000098


func_800BE5A4:
# MqDbg: Audio_AdsrInit
    sw      a2, 0x0008($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    sb      $zero, 0x0000(a0)          # 00000000
    sh      $zero, 0x0002(a0)          # 00000002
    sw      a1, 0x001C(a0)             # 0000001C
    swc1    $f0, 0x0004(a0)            # 00000004
    jr      $ra
    swc1    $f0, 0x0010(a0)            # 00000010


func_800BE5C4:
# MqDbg: Audio_AdsrUpdate
    lbu     v1, 0x0000(a0)             # 00000000
    or      v0, v1, $zero              # v0 = 00000000
    andi    v0, v0, 0x000F             # v0 = 00000000
    sltiu   $at, v0, 0x0009
    beq     $at, $zero, lbl_800BE860
    or      a1, v0, $zero              # a1 = 00000000
    sll     t6, v0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6630($at)           # 801099D0
    jr      t6
    nop
    mtc1    $zero, $f0                 # $f0 = 0.00
    jr      $ra
    nop
    lw      t7, 0x0000(a0)             # 00000000
    andi    t0, v1, 0xFFF0             # t0 = 00000000
    ori     t1, t0, 0x0005             # t1 = 00000005
    sll     t9, t7,  1
    bgezl   t9, lbl_800BE624
    andi    t2, v1, 0xFFF0             # t2 = 00000000
    b       lbl_800BE860
    sb      t1, 0x0000(a0)             # 00000000
    andi    t2, v1, 0xFFF0             # t2 = 00000000
lbl_800BE624:
    ori     t3, t2, 0x0003             # t3 = 00000003
    sb      $zero, 0x0001(a0)          # 00000001
    sb      t3, 0x0000(a0)             # 00000000
lbl_800BE630:
    lbu     t5, 0x0001(a0)             # 00000001
    lw      t4, 0x001C(a0)             # 0000001C
    addiu   $at, $zero, 0xFFFD         # $at = FFFFFFFD
    sll     t6, t5,  2
    addu    v0, t4, t6
    lh      t7, 0x0000(v0)             # 00000000
    sh      t7, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    beq     a1, $at, lbl_800BE6A0
    addiu   $at, $zero, 0xFFFE         # $at = FFFFFFFE
    beq     a1, $at, lbl_800BE694
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beql    a1, $at, lbl_800BE684
    lbu     t0, 0x0000(a0)             # 00000000
    bnel    a1, $zero, lbl_800BE6B8
    mtc1    a1, $f4                    # $f4 = 0.00
    lbu     t8, 0x0000(a0)             # 00000000
    andi    t9, t8, 0xFFF0             # t9 = 00000000
    b       lbl_800BE75C
    sb      t9, 0x0000(a0)             # 00000000
    lbu     t0, 0x0000(a0)             # 00000000
lbl_800BE684:
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    ori     t2, t1, 0x0005             # t2 = 00000005
    b       lbl_800BE75C
    sb      t2, 0x0000(a0)             # 00000000
lbl_800BE694:
    lh      t3, 0x0002(v0)             # 00000002
    b       lbl_800BE630
    sb      t3, 0x0001(a0)             # 00000001
lbl_800BE6A0:
    lbu     t5, 0x0000(a0)             # 00000000
    andi    t4, t5, 0xFFF0             # t4 = 00000000
    ori     t6, t4, 0x0001             # t6 = 00000001
    b       lbl_800BE75C
    sb      t6, 0x0000(a0)             # 00000000
    mtc1    a1, $f4                    # $f4 = 0.00
lbl_800BE6B8:
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f8, 0x7E9C($at)           # 80127E9C
    cvt.s.w $f6, $f4
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    mul.s   $f10, $f6, $f8
    trunc.w.s $f16, $f10
    mfc1    t8, $f16
    nop
    sh      t8, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    bnel    a1, $zero, lbl_800BE6F4
    lbu     v0, 0x0001(a0)             # 00000001
    sh      t9, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    lbu     v0, 0x0001(a0)             # 00000001
lbl_800BE6F4:
    lw      t0, 0x001C(a0)             # 0000001C
    lui     $at, 0x8011                # $at = 80110000
    sll     t1, v0,  2
    addu    t2, t0, t1
    lh      t3, 0x0002(t2)             # 00000007
    lwc1    $f6, -0x660C($at)          # 801099F4
    lbu     t5, 0x0000(a0)             # 00000000
    mtc1    t3, $f18                   # $f18 = 0.00
    addiu   t7, v0, 0x0001             # t7 = 00000001
    andi    t4, t5, 0xFFF0             # t4 = 00000000
    cvt.s.w $f4, $f18
    lwc1    $f18, 0x0010(a0)           # 00000010
    ori     t6, t4, 0x0004             # t6 = 00000004
    sb      t6, 0x0000(a0)             # 00000000
    sb      t7, 0x0001(a0)             # 00000001
    div.s   $f8, $f4, $f6
    mtc1    a1, $f6                    # $f6 = 0.00
    swc1    $f8, 0x0014(a0)            # 00000014
    lwc1    $f0, 0x0014(a0)            # 00000014
    cvt.s.w $f8, $f6
    mul.s   $f10, $f0, $f0
    swc1    $f10, 0x0014(a0)           # 00000014
    lwc1    $f16, 0x0014(a0)           # 00000014
    sub.s   $f4, $f16, $f18
    div.s   $f10, $f4, $f8
    swc1    $f10, 0x0008(a0)           # 00000008
lbl_800BE75C:
    lbu     t8, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    andi    t9, t8, 0x000F             # t9 = 00000000
    bnel    t9, $at, lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lh      t0, 0x0002(a0)             # 00000002
    lwc1    $f16, 0x0010(a0)           # 00000010
    lwc1    $f18, 0x0008(a0)           # 00000008
    addiu   t1, t0, 0xFFFF             # t1 = FFFFFFFF
    sh      t1, 0x0002(a0)             # 00000002
    add.s   $f6, $f16, $f18
    lh      t2, 0x0002(a0)             # 00000002
    bgtz    t2, lbl_800BE860
    swc1    $f6, 0x0010(a0)            # 00000010
    lbu     t3, 0x0000(a0)             # 00000000
    andi    t5, t3, 0xFFF0             # t5 = 00000000
    ori     t4, t5, 0x0003             # t4 = 00000003
    b       lbl_800BE860
    sb      t4, 0x0000(a0)             # 00000000
    mtc1    $zero, $f12                # $f12 = 0.00
    lwc1    $f0, 0x0004(a0)            # 00000004
    lwc1    $f4, 0x0010(a0)            # 00000010
    lwc1    $f8, 0x000C(a0)            # 0000000C
    c.eq.s  $f12, $f0
    addiu   $at, $zero, 0x0006         # $at = 00000006
    sub.s   $f10, $f4, $f8
    bc1t    lbl_800BE808
    swc1    $f10, 0x0010(a0)           # 00000010
    bne     a1, $at, lbl_800BE808
    nop
    lwc1    $f16, 0x0010(a0)           # 00000010
    addiu   t6, $zero, 0x0080          # t6 = 00000080
    c.lt.s  $f16, $f0
    nop
    bc1fl   lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t7, 0x0000(a0)             # 00000000
    swc1    $f0, 0x0010(a0)            # 00000010
    sh      t6, 0x0002(a0)             # 00000002
    andi    t8, t7, 0xFFF0             # t8 = 00000000
    ori     t9, t8, 0x0008             # t9 = 00000008
    b       lbl_800BE860
    sb      t9, 0x0000(a0)             # 00000000
lbl_800BE808:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x6608($at)          # 801099F8
    lwc1    $f18, 0x0010(a0)           # 00000010
    c.lt.s  $f18, $f6
    nop
    bc1fl   lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t0, 0x0000(a0)             # 00000000
    swc1    $f12, 0x0010(a0)           # 00000010
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    b       lbl_800BE860
    sb      t1, 0x0000(a0)             # 00000000
    lh      t2, 0x0002(a0)             # 00000002
    addiu   t3, t2, 0xFFFF             # t3 = 00000004
    sh      t3, 0x0002(a0)             # 00000002
    lh      t5, 0x0002(a0)             # 00000002
    bnel    t5, $zero, lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t4, 0x0000(a0)             # 00000000
    andi    t6, t4, 0xFFF0             # t6 = 00000000
    ori     t7, t6, 0x0007             # t7 = 00000007
    sb      t7, 0x0000(a0)             # 00000000
lbl_800BE860:
    lw      v0, 0x0000(a0)             # 00000000
lbl_800BE864:
    mtc1    $zero, $f12                # $f12 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    sll     t9, v0,  2
    bgezl   t9, lbl_800BE898
    sll     t6, v0,  3
    lbu     t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    ori     t3, t1, 0x0006             # t3 = 00000006
    sb      t3, 0x0000(a0)             # 00000000
    andi    t5, t3, 0x00DF             # t5 = 00000006
    sb      t5, 0x0000(a0)             # 00000000
    lw      v0, 0x0000(a0)             # 00000000
    sll     t6, v0,  3
lbl_800BE898:
    bgezl   t6, lbl_800BE8BC
    lwc1    $f2, 0x0010(a0)            # 00000010
    lbu     t7, 0x0000(a0)             # 00000000
    andi    t8, t7, 0xFFF0             # t8 = 00000000
    ori     t0, t8, 0x0007             # t0 = 00000007
    sb      t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0x00EF             # t1 = 00000007
    sb      t1, 0x0000(a0)             # 00000000
    lwc1    $f2, 0x0010(a0)            # 00000010
lbl_800BE8BC:
    c.lt.s  $f2, $f12
    nop
    bc1fl   lbl_800BE8D8
    mtc1    $at, $f12                  # $f12 = 1.00
    jr      $ra
    mov.s   $f0, $f12
lbl_800BE8D4:
    mtc1    $at, $f12                  # $f12 = 1.00
lbl_800BE8D8:
    nop
    c.lt.s  $f12, $f2
    nop
    bc1fl   lbl_800BE8F8
    mov.s   $f0, $f2
    jr      $ra
    mov.s   $f0, $f12
lbl_800BE8F4:
    mov.s   $f0, $f2
lbl_800BE8F8:
    jr      $ra
    nop
    