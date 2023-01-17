# Audio SeqPlayer
#
# Starts at VRAM: 800BE900 / VROM: B34860
#

.section .text
func_800BE900:
# MqDbg: AudioSeq_GetScriptControlFlowArgument
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, a1
    lbu     v0, 0x1780(v0)             # 80101780
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0014($sp)
    andi    t7, v0, 0x0003             # t7 = 00000000
    bne     t7, $at, lbl_800BE954
    or      v1, $zero, $zero           # v1 = 00000000
    andi    t8, v0, 0x0080             # t8 = 00000000
    bne     t8, $zero, lbl_800BE948
    nop
    jal     func_800BF308
    nop
    b       lbl_800BE954
    andi    v1, v0, 0xFFFF             # v1 = 00000000
lbl_800BE948:
    jal     func_800BF31C
    nop
    andi    v1, v0, 0xFFFF             # v1 = 00000000
lbl_800BE954:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800BE968:
# MqDbg: AudioSeq_HandleScriptFlowControl
    addiu   t6, a2, 0xFF0E             # t6 = FFFFFF0E
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sltiu   $at, t6, 0x000E
    sw      $ra, 0x0014($sp)
    beq     $at, $zero, lbl_800BEB30
    or      v0, a2, $zero              # v0 = 00000000
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6600($at)           # 80109A00
    jr      t6
    nop
    lbu     v0, 0x0018(a1)             # 00000018
    bne     v0, $zero, lbl_800BE9AC
    addiu   v1, v0, 0xFFFF             # v1 = FFFFFFFF
    b       lbl_800BEB34
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BE9AC:
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    sll     t7, v1,  2
    addu    t8, a1, t7
    sb      v1, 0x0018(a1)             # 00000018
    lw      t9, 0x0004(t8)             # 00000004
    b       lbl_800BEB30
    sw      t9, 0x0000(a1)             # 00000000
    jal     func_800BF354
    or      a0, a1, $zero              # a0 = 00000000
    b       lbl_800BEB38
    lw      $ra, 0x0014($sp)
    b       lbl_800BEB34
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    lbu     t1, 0x0018(a1)             # 00000018
    lw      t0, 0x0000(a1)             # 00000000
    andi    t7, a3, 0xFFFF             # t7 = 00000000
    sll     t2, t1,  2
    addu    t3, a1, t2
    sw      t0, 0x0004(t3)             # 00000004
    lbu     t4, 0x0018(a1)             # 00000018
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t5, 0x0018(a1)             # 00000018
    lw      t6, 0x0018(a0)             # 00000018
    addu    t8, t6, t7
    b       lbl_800BEB30
    sw      t8, 0x0000(a1)             # 00000000
    lbu     t9, 0x0018(a1)             # 00000018
    addu    t1, a1, t9
    sb      a3, 0x0014(t1)             # 00000014
    lbu     t0, 0x0018(a1)             # 00000018
    lw      t2, 0x0000(a1)             # 00000000
    sll     t3, t0,  2
    addu    t4, a1, t3
    sw      t2, 0x0004(t4)             # 00000004
    lbu     t5, 0x0018(a1)             # 00000018
    addiu   t6, t5, 0x0001             # t6 = 00000002
    b       lbl_800BEB30
    sb      t6, 0x0018(a1)             # 00000018
    lbu     t7, 0x0018(a1)             # 00000018
    addu    v1, a1, t7
    lbu     t8, 0x0013(v1)             # 00000013
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    sb      t9, 0x0013(v1)             # 00000013
    lbu     v0, 0x0018(a1)             # 00000018
    addu    t1, a1, v0
    lbu     t0, 0x0013(t1)             # 00000013
    or      a0, v0, $zero              # a0 = 00000001
    sll     t3, a0,  2
    beq     t0, $zero, lbl_800BEA84
    addiu   t5, v0, 0xFFFF             # t5 = 00000000
    addu    t2, a1, t3
    lw      t4, 0x0000(t2)             # 00000000
    b       lbl_800BEB30
    sw      t4, 0x0000(a1)             # 00000000
lbl_800BEA84:
    b       lbl_800BEB30
    sb      t5, 0x0018(a1)             # 00000018
    lbu     t6, 0x0018(a1)             # 00000018
    addiu   t7, t6, 0xFFFF             # t7 = 00000001
    b       lbl_800BEB30
    sb      t7, 0x0018(a1)             # 00000018
    addiu   $at, $zero, 0x00FA         # $at = 000000FA
    bnel    v0, $at, lbl_800BEAB4
    addiu   $at, $zero, 0x00F9         # $at = 000000F9
    lb      t8, 0x0019(a1)             # 00000019
    bne     t8, $zero, lbl_800BEB30
    addiu   $at, $zero, 0x00F9         # $at = 000000F9
lbl_800BEAB4:
    bnel    v0, $at, lbl_800BEAC8
    addiu   $at, $zero, 0x00F5         # $at = 000000F5
    lb      t9, 0x0019(a1)             # 00000019
    bgez    t9, lbl_800BEB30
    addiu   $at, $zero, 0x00F5         # $at = 000000F5
lbl_800BEAC8:
    bnel    v0, $at, lbl_800BEAE0
    lw      t0, 0x0018(a0)             # 00000019
    lb      t1, 0x0019(a1)             # 00000019
    bltzl   t1, lbl_800BEB34
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t0, 0x0018(a0)             # 00000019
lbl_800BEAE0:
    andi    t3, a3, 0xFFFF             # t3 = 00000000
    addu    t2, t0, t3
    b       lbl_800BEB30
    sw      t2, 0x0000(a1)             # 00000000
    addiu   $at, $zero, 0x00F3         # $at = 000000F3
    bnel    v0, $at, lbl_800BEB08
    addiu   $at, $zero, 0x00F2         # $at = 000000F2
    lb      t4, 0x0019(a1)             # 00000019
    bne     t4, $zero, lbl_800BEB30
    addiu   $at, $zero, 0x00F2         # $at = 000000F2
lbl_800BEB08:
    bnel    v0, $at, lbl_800BEB20
    lw      t6, 0x0000(a1)             # 00000000
    lb      t5, 0x0019(a1)             # 00000019
    bgezl   t5, lbl_800BEB34
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t6, 0x0000(a1)             # 00000000
lbl_800BEB20:
    sll     t8, a3, 24
    sra     t9, t8, 24
    addu    t1, t6, t9
    sw      t1, 0x0000(a1)             # 00000000
lbl_800BEB30:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BEB34:
    lw      $ra, 0x0014($sp)
lbl_800BEB38:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEB44:
# MqDbg: AudioSeq_InitSequenceChannel
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   t7, t6, 0x5AB0             # t7 = 8012B0E0
    sw      $ra, 0x0014($sp)
    beq     a0, t7, lbl_800BEC88
    or      a1, a0, $zero              # a1 = 00000000
    lbu     t8, 0x0000(a0)             # 00000000
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    andi    t0, t8, 0xFF7F             # t0 = 00000000
    andi    t2, t0, 0x00BF             # t2 = 00000000
    sb      t0, 0x0000(a0)             # 00000000
    andi    t4, t2, 0x00DF             # t4 = 00000000
    sb      t2, 0x0000(a0)             # 00000000
    andi    t6, t4, 0x00EF             # t6 = 00000000
    sb      t4, 0x0000(a0)             # 00000000
    andi    t8, t6, 0x00F7             # t8 = 00000000
    sb      t6, 0x0000(a0)             # 00000000
    andi    t0, t8, 0x00FB             # t0 = 00000000
    sb      t8, 0x0000(a0)             # 00000000
    addiu   v0, $zero, 0x0800          # v0 = 00000800
    lui     t7, 0x8010                 # t7 = 80100000
    sb      t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0x00FD             # t1 = 00000000
    addiu   t2, $zero, 0x00FF          # t2 = 000000FF
    addiu   t3, $zero, 0x0040          # t3 = 00000040
    addiu   t4, $zero, 0x0080          # t4 = 00000080
    addiu   t5, $zero, 0x0003          # t5 = 00000003
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    addiu   t7, t7, 0x0DE4             # t7 = 80100DE4
    addiu   t8, $zero, 0x00F0          # t8 = 000000F0
    sh      v0, 0x0014(a0)             # 00000014
    sh      v0, 0x0010(a0)             # 00000010
    sh      $zero, 0x0026(a0)          # 00000026
    sb      t1, 0x0000(a0)             # 00000000
    sb      $zero, 0x0009(a0)          # 00000009
    sb      $zero, 0x00D0(a0)          # 000000D0
    sb      t2, 0x0001(a0)             # 00000001
    sb      $zero, 0x0078(a0)          # 00000078
    sb      t3, 0x000A(a0)             # 0000000A
    sb      t4, 0x000B(a0)             # 0000000B
    sb      $zero, 0x000D(a0)          # 0000000D
    sb      $zero, 0x000E(a0)          # 0000000E
    sw      $zero, 0x0040(a0)          # 00000040
    sb      $zero, 0x0008(a0)          # 00000008
    sb      $zero, 0x0004(a0)          # 00000004
    sb      $zero, 0x000C(a0)          # 0000000C
    sb      t5, 0x0005(a0)             # 00000005
    sb      t6, 0x0006(a0)             # 00000006
    sh      $zero, 0x001E(a0)          # 0000001E
    sw      t7, 0x0080(a0)             # 00000080
    sb      t8, 0x007C(a0)             # 0000007C
    sb      $zero, 0x007D(a0)          # 0000007D
    sh      $zero, 0x0016(a0)          # 00000016
    sh      $zero, 0x0012(a0)          # 00000012
    sh      $zero, 0x0018(a0)          # 00000018
    sh      $zero, 0x001A(a0)          # 0000001A
    sh      $zero, 0x001C(a0)          # 0000001C
    sw      $zero, 0x00CC(a0)          # 000000CC
    sh      $zero, 0x0020(a0)          # 00000020
    sb      $zero, 0x000F(a0)          # 0000000F
    swc1    $f0, 0x002C(a0)            # 0000002C
    swc1    $f0, 0x0028(a0)            # 00000028
    swc1    $f0, 0x0038(a0)            # 00000038
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    or      v1, a1, $zero              # v1 = 00000000
    addiu   a2, $zero, 0x0008          # a2 = 00000008
lbl_800BEC58:
    addiu   a0, a0, 0x0004             # a0 = 00000004
    sb      v0, 0x00C5(v1)             # 000000C5
    sb      v0, 0x00C6(v1)             # 000000C6
    sb      v0, 0x00C7(v1)             # 000000C7
    addiu   v1, v1, 0x0004             # v1 = 00000004
    bne     a0, a2, lbl_800BEC58
    sb      v0, 0x00C0(v1)             # 000000C4
    lbu     t9, 0x0000(a1)             # 00000000
    addiu   a0, a1, 0x0084             # a0 = 00000084
    andi    t0, t9, 0xFFFE             # t0 = 00000000
    jal     func_800BD2CC
    sb      t0, 0x0000(a1)             # 00000000
lbl_800BEC88:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEC98:
# MqDbg: AudioSeq_SeqChannelSetLayer
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sll     t7, a1,  2
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    addu    a2, a0, t7
    lw      a3, 0x0050(a2)             # 00000050
    bne     a3, $zero, lbl_800BECE0
    or      a0, a3, $zero              # a0 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1B8             # a0 = 8012B1B8
    jal     func_800BF228
    sw      a2, 0x001C($sp)
    lw      a2, 0x001C($sp)
    bne     v0, $zero, lbl_800BECEC
    sw      v0, 0x0050(a2)             # 00000050
    sw      $zero, 0x0050(a2)          # 00000050
    b       lbl_800BEDAC
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BECE0:
    jal     func_800BD120
    sw      a2, 0x001C($sp)
    lw      a2, 0x001C($sp)
lbl_800BECEC:
    lw      v1, 0x0050(a2)             # 00000050
    lw      t8, 0x0028($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    lbu     t3, 0x0000(v1)             # 00000000
    sw      t8, 0x0050(v1)             # 00000050
    lw      t9, 0x0028($sp)
    ori     t5, t3, 0x0080             # t5 = 00000080
    andi    t7, t5, 0x00BF             # t7 = 00000080
    lw      t1, 0x007C(t9)             # 0000007C
    mtc1    $at, $f0                   # $f0 = 1.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    sw      t1, 0x0018(v1)             # 00000018
    lw      t0, 0x0080(t9)             # 00000080
    andi    t9, t7, 0x00DF             # t9 = 00000080
    sb      t5, 0x0000(v1)             # 00000000
    andi    t1, t9, 0x00EF             # t1 = 00000080
    sb      t7, 0x0000(v1)             # 00000000
    andi    t3, t1, 0x00F7             # t3 = 00000080
    sb      t9, 0x0000(v1)             # 00000000
    andi    t5, t3, 0x00FB             # t5 = 00000080
    sb      t1, 0x0000(v1)             # 00000000
    andi    t7, t5, 0x00FD             # t7 = 00000080
    sb      t3, 0x0000(v1)             # 00000000
    sb      t5, 0x0000(v1)             # 00000000
    sw      t0, 0x001C(v1)             # 0000001C
    andi    t8, t7, 0x00FE             # t8 = 00000080
    addiu   t9, $zero, 0x0080          # t9 = 00000080
    addiu   t0, $zero, 0x0040          # t0 = 00000040
    addiu   t1, $zero, 0x00FF          # t1 = 000000FF
    sb      t7, 0x0000(v1)             # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    sb      $zero, 0x0018(v1)          # 00000018
    sb      t8, 0x0000(v1)             # 00000000
    sb      $zero, 0x0001(v1)          # 00000001
    sb      $zero, 0x0020(v1)          # 00000020
    sb      $zero, 0x006C(v1)          # 0000006C
    sb      t9, 0x0003(v1)             # 00000003
    sb      t0, 0x0006(v1)             # 00000006
    sh      $zero, 0x0010(v1)          # 00000010
    sh      $zero, 0x0008(v1)          # 00000008
    sh      $zero, 0x000A(v1)          # 0000000A
    sh      $zero, 0x000C(v1)          # 0000000C
    sw      $zero, 0x002C(v1)          # 0000002C
    sw      $zero, 0x0048(v1)          # 00000048
    sb      t1, 0x0002(v1)             # 00000002
    swc1    $f0, 0x0030(v1)            # 00000030
    swc1    $f0, 0x0034(v1)            # 00000034
    swc1    $f4, 0x0038(v1)            # 00000038
lbl_800BEDAC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BEDBC:
# MqDbg: AudioSeq_SeqLayerDisable
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    beq     a0, $zero, lbl_800BEE28
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0050(a0)             # 00000050
    lui     t6, 0x8013                 # t6 = 80130000
    addiu   t6, t6, 0xB0E0             # t6 = 8012B0E0
    beq     t6, v0, lbl_800BEE08
    nop
    lw      t7, 0x004C(v0)             # 0000004C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      t8, 0x0000(t7)             # 00000000
    sll     t9, t8,  1
    srl     t0, t9, 31
    bne     t0, $at, lbl_800BEE08
    nop
    jal     func_800BD140
    sw      a0, 0x0018($sp)
    b       lbl_800BEE14
    lw      a0, 0x0018($sp)
lbl_800BEE08:
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
lbl_800BEE14:
    lbu     t1, 0x0000(a0)             # 00000000
    andi    t4, t1, 0xFF7F             # t4 = 00000000
    sb      t4, 0x0000(a0)             # 00000000
    ori     t5, t4, 0x0040             # t5 = 00000040
    sb      t5, 0x0000(a0)             # 00000000
lbl_800BEE28:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEE38:
# MqDbg: AudioSeq_SeqLayerFree
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sll     t6, a1,  2
    sw      $ra, 0x0014($sp)
    addu    v0, a0, t6
    lw      a2, 0x0050(v0)             # 00000050
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1B8             # a0 = 8012B1B8
    beq     a2, $zero, lbl_800BEE78
    addiu   a1, a2, 0x0070             # a1 = 00000070
    sw      v0, 0x0018($sp)
    jal     func_800BF1E8
    sw      a2, 0x001C($sp)
    jal     func_800BEDBC
    lw      a0, 0x001C($sp)
    lw      v0, 0x0018($sp)
    sw      $zero, 0x0050(v0)          # 00000050
lbl_800BEE78:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BEE88:
# MqDbg: AudioSeq_SequenceChannelDisable
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x0024($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s2, $zero, 0x0004          # s2 = 00000004
    or      a0, s1, $zero              # a0 = 00000000
lbl_800BEEAC:
    jal     func_800BEE38
    or      a1, s0, $zero              # a1 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, s2, lbl_800BEEAC
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD3C0
    addiu   a0, s1, 0x0084             # a0 = 00000084
    lbu     t6, 0x0000(s1)             # 00000000
    andi    t9, t6, 0xFF7F             # t9 = 00000000
    sb      t9, 0x0000(s1)             # 00000000
    ori     t0, t9, 0x0040             # t0 = 00000040
    sb      t0, 0x0000(s1)             # 00000000
    lw      $ra, 0x0024($sp)
    lw      s2, 0x0020($sp)
    lw      s1, 0x001C($sp)
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BEEF4:
# MqDbg: AudioSeq_SequencePlayerSetupChannels
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    or      a2, a0, $zero              # a2 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a3, $zero, 0x0010          # a3 = 00000010
lbl_800BEF08:
    andi    t6, a1, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800BEF38
    or      v1, a1, $zero              # v1 = 00000000
    sll     t7, v0,  2
    addu    t8, a2, t7
    lw      a0, 0x0038(t8)             # 00000038
    lbu     t9, 0x0005(a2)             # 00000005
    sb      t9, 0x0007(a0)             # 00000007
    lbu     t0, 0x0003(a2)             # 00000003
    sb      t0, 0x0003(a0)             # 00000003
    lbu     t1, 0x0002(a2)             # 00000002
    sb      t1, 0x0002(a0)             # 00000002
lbl_800BEF38:
    sra     a1, v1,  1
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t2, v1, 0x0001             # t2 = 00000000
    beq     t2, $zero, lbl_800BEF70
    sra     a1, v1,  1
    sll     t3, v0,  2
    addu    t4, a2, t3
    lw      a0, 0x003C(t4)             # 0000003C
    lbu     t5, 0x0005(a2)             # 00000005
    sb      t5, 0x0007(a0)             # 00000007
    lbu     t6, 0x0003(a2)             # 00000003
    sb      t6, 0x0003(a0)             # 00000003
    lbu     t7, 0x0002(a2)             # 00000002
    sb      t7, 0x0002(a0)             # 00000002
lbl_800BEF70:
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t8, v1, 0x0001             # t8 = 00000000
    beq     t8, $zero, lbl_800BEFA4
    sra     a1, v1,  1
    sll     t9, v0,  2
    addu    t0, a2, t9
    lw      a0, 0x0040(t0)             # 00000040
    lbu     t1, 0x0005(a2)             # 00000005
    sb      t1, 0x0007(a0)             # 00000007
    lbu     t2, 0x0003(a2)             # 00000003
    sb      t2, 0x0003(a0)             # 00000003
    lbu     t3, 0x0002(a2)             # 00000002
    sb      t3, 0x0002(a0)             # 00000002
lbl_800BEFA4:
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t4, v1, 0x0001             # t4 = 00000000
    beq     t4, $zero, lbl_800BEFD8
    sra     a1, v1,  1
    sll     t5, v0,  2
    addu    t6, a2, t5
    lw      a0, 0x0044(t6)             # 00000044
    lbu     t7, 0x0005(a2)             # 00000005
    sb      t7, 0x0007(a0)             # 00000007
    lbu     t8, 0x0003(a2)             # 00000003
    sb      t8, 0x0003(a0)             # 00000003
    lbu     t9, 0x0002(a2)             # 00000002
    sb      t9, 0x0002(a0)             # 00000002
lbl_800BEFD8:
    addiu   v0, v0, 0x0004             # v0 = 00000004
    bne     v0, a3, lbl_800BEF08
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    jr      $ra
    nop


func_800BEFEC:
# MqDbg: AudioSeq_SequencePlayerDisableChannels
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x0020($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lui     s2, 0x8013                 # s2 = 80130000
    sw      $ra, 0x002C($sp)
    sw      a1, 0x0034($sp)
    addiu   s2, s2, 0xB0E0             # s2 = 8012B0E0
    or      s0, $zero, $zero           # s0 = 00000000
    or      s1, a0, $zero              # s1 = 00000000
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    addiu   s4, $zero, 0x0040          # s4 = 00000040
lbl_800BF024:
    lw      a0, 0x0038(s1)             # 00000038
    xor     t6, a0, s2
    sltu    t6, $zero, t6
    bnel    s3, t6, lbl_800BF044
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800BEE88
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800BF044:
    bne     s0, s4, lbl_800BF024
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BF06C:
# MqDbg: AudioSeq_SequenceChannelEnable
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a1, 0x002C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    sll     t6, a1,  2
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addu    t7, a0, t6
    lw      s2, 0x0038(t7)             # 00000038
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s3, $zero, 0x0004          # s3 = 00000004
    lbu     t9, 0x0000(s2)             # 00000000
    sb      $zero, 0x0078(s2)          # 00000078
    sw      a2, 0x0060(s2)             # 00000060
    ori     t1, t9, 0x0080             # t1 = 00000080
    andi    t2, t1, 0x00BF             # t2 = 00000080
    sb      t1, 0x0000(s2)             # 00000000
    sb      t2, 0x0000(s2)             # 00000000
    sh      $zero, 0x001E(s2)          # 0000001E
    or      s1, s2, $zero              # s1 = 00000000
lbl_800BF0C4:
    lw      t3, 0x0050(s1)             # 00000050
    or      a0, s2, $zero              # a0 = 00000000
    beql    t3, $zero, lbl_800BF0E0
    addiu   s0, s0, 0x0001             # s0 = 00000001
    jal     func_800BEE38
    or      a1, s0, $zero              # a1 = 00000001
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800BF0E0:
    bne     s0, s3, lbl_800BF0C4
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BF104:
# MqDbg: AudioSeq_SequencePlayerDisableAsFinished
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lbu     t7, 0x0000(a0)             # 00000000
    ori     t8, t7, 0x0040             # t8 = 00000040
    jal     func_800BF12C
    sb      t8, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF12C:
# MqDbg: AudioSeq_SequencePlayerDisable
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    jal     func_800BEFEC
    ori     a1, $zero, 0xFFFF          # a1 = 0000FFFF
    jal     func_800BD3C0
    addiu   a0, s0, 0x009C             # a0 = 0000009C
    lw      t6, 0x0000(s0)             # 00000000
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800BF1D8
    lw      $ra, 0x001C($sp)
    lbu     t8, 0x0000(s0)             # 00000000
    lbu     a0, 0x0004(s0)             # 00000004
    andi    t1, t8, 0xFF7F             # t1 = 00000000
    sb      t1, 0x0000(s0)             # 00000000
    ori     t2, t1, 0x0040             # t2 = 00000040
    jal     func_800B6EE8
    sb      t2, 0x0000(s0)             # 00000000
    beq     v0, $zero, lbl_800BF188
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    jal     func_800B7008
    lbu     a0, 0x0004(s0)             # 00000004
lbl_800BF188:
    jal     func_800B6E70
    lbu     a0, 0x0005(s0)             # 00000005
    beq     v0, $zero, lbl_800BF1A0
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    jal     func_800B6FD8
    lbu     a0, 0x0005(s0)             # 00000005
lbl_800BF1A0:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lh      t3, 0x2C22(v1)             # 80128252
    lbu     v0, 0x0005(s0)             # 00000005
    bnel    v0, t3, lbl_800BF1C4
    lh      t4, 0x2C2E(v1)             # 8012825E
    b       lbl_800BF1D4
    sw      $zero, 0x2C04(v1)          # 80128234
    lh      t4, 0x2C2E(v1)             # 8012825E
lbl_800BF1C4:
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    bnel    v0, t4, lbl_800BF1D8
    lw      $ra, 0x001C($sp)
    sw      t5, 0x2C04(v1)             # 80128234
lbl_800BF1D4:
    lw      $ra, 0x001C($sp)
lbl_800BF1D8:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BF1E8:
# MqDbg: AudioSeq_AudioListPushBack
# Audio?
    lw      t6, 0x0000(a1)             # 00000000
    bne     t6, $zero, lbl_800BF220
    nop
    lw      t7, 0x0000(a0)             # 00000000
    sw      a1, 0x0004(t7)             # 00000004
    lw      t8, 0x0000(a0)             # 00000000
    sw      a0, 0x0004(a1)             # 00000004
    sw      t8, 0x0000(a1)             # 00000000
    lw      t9, 0x0008(a0)             # 00000008
    lw      t1, 0x000C(a0)             # 0000000C
    sw      a1, 0x0000(a0)             # 00000000
    addiu   t0, t9, 0x0001             # t0 = 00000001
    sw      t0, 0x0008(a0)             # 00000008
    sw      t1, 0x000C(a1)             # 0000000C
lbl_800BF220:
    jr      $ra
    nop


func_800BF228:
# MqDbg: AudioSeq_AudioListPopBack
    lw      v1, 0x0000(a0)             # 00000000
    bnel    v1, a0, lbl_800BF240
    lw      t6, 0x0000(v1)             # 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF23C:
    lw      t6, 0x0000(v1)             # 00000000
lbl_800BF240:
    sw      a0, 0x0004(t6)             # 00000004
    lw      t7, 0x0000(v1)             # 00000000
    sw      t7, 0x0000(a0)             # 00000000
    sw      $zero, 0x0000(v1)          # 00000000
    lw      t8, 0x0008(a0)             # 00000008
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    sw      t9, 0x0008(a0)             # 00000008
    lw      v0, 0x0008(v1)             # 00000008
    jr      $ra
    nop


func_800BF268:
# MqDbg: AudioSeq_InitLayerFreelist
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    sw      s3, 0x0024($sp)
    lui     s3, 0x8013                 # s3 = 80130000
    addiu   s3, s3, 0xB1B8             # s3 = 8012B1B8
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s1, 0x8013                 # s1 = 80130000
    lui     s2, 0x8013                 # s2 = 80130000
    lui     s4, 0x8013                 # s4 = 80130000
    sw      $ra, 0x002C($sp)
    sw      s3, 0x5B88(v0)             # 8012B1B8
    sw      s3, 0x5B8C(v0)             # 8012B1BC
    sw      $zero, 0x5B90(v0)          # 8012B1C0
    sw      $zero, 0x5B94(v0)          # 8012B1C4
    addiu   s4, s4, 0xB150             # s4 = 8012B150
    addiu   s2, s2, 0x90E0             # s2 = 801290E0
    addiu   s1, s1, 0x9150             # s1 = 80129150
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800BF2C4:
    sw      s2, 0x3B28(s0)             # 80129158
    sw      $zero, 0x3B20(s0)          # 80129150
    or      a0, s3, $zero              # a0 = 8012B1B8
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 80129150
    addiu   s1, s1, 0x0080             # s1 = 801291D0
    addiu   s0, s0, 0x0080             # s0 = 801256B0
    bne     s1, s4, lbl_800BF2C4
    addiu   s2, s2, 0x0080             # s2 = 80129160
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BF308:
# MqDbg: AudioSeq_ScriptReadU8
    lw      a1, 0x0000(a0)             # 00000000
    lbu     v0, 0x0000(a1)             # 00000000
    addiu   t6, a1, 0x0001             # t6 = 00000001
    jr      $ra
    sw      t6, 0x0000(a0)             # 00000000


func_800BF31C:
# MqDbg: AudioSeq_ScriptReadS16
    lw      a1, 0x0000(a0)             # 00000000
    lbu     v1, 0x0000(a1)             # 00000000
    addiu   t6, a1, 0x0001             # t6 = 00000001
    sw      t6, 0x0000(a0)             # 00000000
    lbu     t7, 0x0000(t6)             # 00000001
    sll     v1, v1,  8
    sll     v1, v1, 16
    sra     v1, v1, 16
    or      v1, t7, v1                 # v1 = 00000000
    sll     v1, v1, 16
    addiu   t8, t6, 0x0001             # t8 = 00000002
    sw      t8, 0x0000(a0)             # 00000000
    jr      $ra
    sra     v0, v1, 16


func_800BF354:
# MqDbg: AudioSeq_ScriptReadCompressedU16
    lw      v0, 0x0000(a0)             # 00000000
    lbu     v1, 0x0000(v0)             # 00000000
    addiu   t6, v0, 0x0001             # t6 = 00000001
    sw      t6, 0x0000(a0)             # 00000000
    andi    t7, v1, 0x0080             # t7 = 00000000
    beq     t7, $zero, lbl_800BF38C
    or      a1, v1, $zero              # a1 = 00000000
    lbu     t8, 0x0000(t6)             # 00000001
    sll     v1, a1,  8
    andi    v1, v1, 0x7F00             # v1 = 00000000
    addiu   t9, t6, 0x0001             # t9 = 00000002
    or      v1, t8, v1                 # v1 = 00000000
    andi    v1, v1, 0xFFFF             # v1 = 00000000
    sw      t9, 0x0000(a0)             # 00000000
lbl_800BF38C:
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000000


func_800BF394:
# MqDbg: AudioSeq_SeqLayerProcessScript
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      v0, 0x0000(a0)             # 00000000
    or      s0, a0, $zero              # s0 = 00000000
    srl     t6, v0, 31
    beql    t6, $zero, lbl_800BF488
    lw      $ra, 0x001C($sp)
    lh      v1, 0x0008(a0)             # 00000008
    sll     t9, v0,  2
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_800BF3FC
    addiu   t7, v1, 0xFFFF             # t7 = FFFFFFFF
    bltz    t9, lbl_800BF484
    sh      t7, 0x0008(a0)             # 00000008
    lh      t0, 0x000A(a0)             # 0000000A
    lh      t1, 0x0008(a0)             # 00000008
    slt     $at, t0, t1
    bnel    $at, $zero, lbl_800BF488
    lw      $ra, 0x001C($sp)
    jal     func_800BD120
    nop
    lbu     t3, 0x0000(s0)             # 00000000
    ori     t4, t3, 0x0020             # t4 = 00000020
    b       lbl_800BF484
    sb      t4, 0x0000(s0)             # 00000000
lbl_800BF3FC:
    jal     func_800BF498
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BF680
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BF484
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800C00A0
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BF438
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800BFA00
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
lbl_800BF438:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beql    v0, $at, lbl_800BF450
    lw      v0, 0x0000(s0)             # 00000000
    jal     func_800BF524
    or      a0, s0, $zero              # a0 = 00000000
    lw      v0, 0x0000(s0)             # 00000000
lbl_800BF450:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t5, v0,  2
    srl     t6, t5, 31
    bnel    t6, $at, lbl_800BF488
    lw      $ra, 0x001C($sp)
    lw      t7, 0x002C(s0)             # 0000002C
    sll     t9, v0,  3
    bne     t7, $zero, lbl_800BF47C
    nop
    bgezl   t9, lbl_800BF488
    lw      $ra, 0x001C($sp)
lbl_800BF47C:
    jal     func_800BD120
    or      a0, s0, $zero              # a0 = 00000000
lbl_800BF484:
    lw      $ra, 0x001C($sp)
lbl_800BF488:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BF498:
# MqDbg: AudioSeq_SeqLayerProcessScriptStep1
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      t6, 0x0000(a0)             # 00000000
    sll     t8, t6,  3
    bltzl   t8, lbl_800BF4C4
    lw      v0, 0x002C(a0)             # 0000002C
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    b       lbl_800BF4E4
    lw      a0, 0x0018($sp)
    lw      v0, 0x002C(a0)             # 0000002C
lbl_800BF4C4:
    beql    v0, $zero, lbl_800BF4E8
    lbu     v0, 0x0020(a0)             # 00000020
    lw      t9, 0x0048(v0)             # 00000048
    bnel    a0, t9, lbl_800BF4E8
    lbu     v0, 0x0020(a0)             # 00000020
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
lbl_800BF4E4:
    lbu     v0, 0x0020(a0)             # 00000020
lbl_800BF4E8:
    addiu   $at, $zero, 0xFF7F         # $at = FFFFFF7F
    and     v0, v0, $at
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BF504
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    v0, $at, lbl_800BF50C
    lbu     t1, 0x0000(a0)             # 00000000
lbl_800BF504:
    sb      $zero, 0x0020(a0)          # 00000020
    lbu     t1, 0x0000(a0)             # 00000000
lbl_800BF50C:
    ori     t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF524:
# MqDbg: AudioSeq_SeqLayerProcessScriptStep5
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0000(a0)             # 00000000
    or      a3, a0, $zero              # a3 = 00000000
    sll     t7, v0,  2
    bltzl   t7, lbl_800BF588
    sll     v1, v0,  3
    lw      v1, 0x004C(a0)             # 0000004C
    beql    v1, $zero, lbl_800BF588
    sll     v1, v0,  3
    lw      t8, 0x0000(v1)             # 00000000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lw      a0, 0x0000(t8)             # 00000000
    srl     t9, a0, 28
    bne     t9, $at, lbl_800BF584
    sll     t0, a0,  4
    srl     t1, t0, 30
    beql    t1, $zero, lbl_800BF588
    sll     v1, v0,  3
    lbu     t3, 0x0000(a3)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t4, t3, 0x0020             # t4 = 00000020
    b       lbl_800BF670
    sb      t4, 0x0000(a3)             # 00000000
lbl_800BF584:
    sll     v1, v0,  3
lbl_800BF588:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    srl     v1, v1, 31
    bne     a0, v1, lbl_800BF5AC
    sll     t5, v0,  6
    srl     t6, t5, 31
    bne     a0, t6, lbl_800BF5AC
    nop
    b       lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF5AC:
    bne     a0, v1, lbl_800BF604
    nop
    lw      a2, 0x002C(a3)             # 0000002C
    sll     t8, v0,  4
    beq     a2, $zero, lbl_800BF604
    nop
    bgez    t8, lbl_800BF604
    nop
    bne     a1, a0, lbl_800BF604
    nop
    lw      t9, 0x0044(a2)             # 00000044
    bne     a3, t9, lbl_800BF604
    nop
    lw      t0, 0x004C(a3)             # 0000004C
    or      a0, a2, $zero              # a0 = 00000000
    or      a1, a3, $zero              # a1 = 00000000
    bnel    t0, $zero, lbl_800BF650
    lw      a2, 0x002C(a3)             # 0000002C
    jal     func_800BD264
    sw      a3, 0x0018($sp)
    b       lbl_800BF64C
    lw      a3, 0x0018($sp)
lbl_800BF604:
    bne     a1, $zero, lbl_800BF618
    or      a0, a3, $zero              # a0 = 00000000
    jal     func_800BD120
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
lbl_800BF618:
    or      a0, a3, $zero              # a0 = 00000000
    jal     func_800BDA74
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
    beq     v0, $zero, lbl_800BF64C
    sw      v0, 0x002C(a3)             # 0000002C
    lw      t1, 0x0044(v0)             # 00000044
    or      a0, v0, $zero              # a0 = 00000000
    bnel    a3, t1, lbl_800BF650
    lw      a2, 0x002C(a3)             # 0000002C
    jal     func_800BE4C0
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
lbl_800BF64C:
    lw      a2, 0x002C(a3)             # 0000002C
lbl_800BF650:
    beql    a2, $zero, lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t2, 0x0044(a2)             # 00000044
    bnel    a3, t2, lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
    jal     func_800BE578
    or      a0, a2, $zero              # a0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF670:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF680:
# MqDbg: AudioSeq_SeqLayerProcessScriptStep2
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0034($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    lw      s4, 0x0050(a0)             # 00000050
    lui     $at, 0x8011                # $at = 80110000
    or      s1, a0, $zero              # s1 = 00000000
    lwc1    $f20, -0x65C8($at)         # 80109A38
    addiu   s2, a0, 0x0054             # s2 = 00000054
    lw      s3, 0x004C(s4)             # 0000004C
lbl_800BF6B8:
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    slti    $at, v0, 0x00C1
    andi    s0, v0, 0x00FF             # s0 = 00000000
    beq     $at, $zero, lbl_800BF6D8
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800BF9DC
    or      v0, s0, $zero              # v0 = 00000000
lbl_800BF6D8:
    slti    $at, a0, 0x00F2
    bne     $at, $zero, lbl_800BF71C
    addiu   t6, a0, 0xFF3F             # t6 = FFFFFF3F
    or      a0, s2, $zero              # a0 = 00000054
    jal     func_800BE900
    andi    a1, s0, 0x00FF             # a1 = 00000000
    or      a0, s3, $zero              # a0 = 00000000
    or      a1, s2, $zero              # a1 = 00000054
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    or      a3, v0, $zero              # a3 = 00000000
    beq     v0, $zero, lbl_800BF6B8
    nop
    jal     func_800BEDBC
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800BF9DC
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BF71C:
    sltiu   $at, t6, 0x000F
    beq     $at, $zero, lbl_800BF978
    andi    v1, a0, 0x00F0             # v1 = 00000000
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x65C4($at)           # 80109A3C
    jr      t6
    nop
    lw      v1, 0x0000(s2)             # 00000054
    addiu   $at, $zero, 0x00C1         # $at = 000000C1
    lbu     a1, 0x0000(v1)             # 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    bne     a0, $at, lbl_800BF778
    sw      t7, 0x0000(s2)             # 00000054
    multu   a1, a1
    mflo    t8
    mtc1    t8, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    div.s   $f8, $f6, $f20
    b       lbl_800BF6B8
    swc1    $f8, 0x003C(s1)            # 0000003C
lbl_800BF778:
    b       lbl_800BF6B8
    sb      a1, 0x0006(s1)             # 00000006
    lw      v1, 0x0000(s2)             # 00000054
    addiu   $at, $zero, 0x00C9         # $at = 000000C9
    lbu     a1, 0x0000(v1)             # 00000000
    addiu   t9, v1, 0x0001             # t9 = 00000001
    bne     a0, $at, lbl_800BF7A0
    sw      t9, 0x0000(s2)             # 00000054
    b       lbl_800BF6B8
    sb      a1, 0x0003(s1)             # 00000003
lbl_800BF7A0:
    b       lbl_800BF6B8
    sh      a1, 0x0010(s1)             # 00000010
    addiu   $at, $zero, 0x00C4         # $at = 000000C4
    bnel    a0, $at, lbl_800BF7C8
    lbu     t3, 0x0000(s1)             # 00000000
    lbu     t1, 0x0000(s1)             # 00000000
    ori     t2, t1, 0x0010             # t2 = 00000010
    b       lbl_800BF7D0
    sb      t2, 0x0000(s1)             # 00000000
    lbu     t3, 0x0000(s1)             # 00000000
lbl_800BF7C8:
    andi    t4, t3, 0xFFEF             # t4 = 00000000
    sb      t4, 0x0000(s1)             # 00000000
lbl_800BF7D0:
    lbu     t5, 0x0000(s1)             # 00000000
    or      a0, s1, $zero              # a0 = 00000000
    andi    t6, t5, 0xFFFD             # t6 = 00000000
    jal     func_800BD120
    sb      t6, 0x0000(s1)             # 00000000
    b       lbl_800BF6B8
    nop
    jal     func_800BF354
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sh      v0, 0x0012(s1)             # 00000012
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    slti    $at, v0, 0x007E
    andi    s0, v0, 0x00FF             # s0 = 00000000
    bne     $at, $zero, lbl_800BF858
    or      a0, v0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x007E         # $at = 0000007E
    bne     v0, $at, lbl_800BF828
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    b       lbl_800BF844
    sb      t7, 0x0002(s1)             # 00000002
lbl_800BF828:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    bnel    a0, $at, lbl_800BF840
    sb      v0, 0x0002(s1)             # 00000002
    b       lbl_800BF844
    sb      $zero, 0x0002(s1)          # 00000002
    sb      v0, 0x0002(s1)             # 00000002
lbl_800BF840:
    sw      $zero, 0x0048(s1)          # 00000048
lbl_800BF844:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     a0, $at, lbl_800BF6B8
    nop
    b       lbl_800BF6B8
    sb      $zero, 0x0018(s1)          # 00000018
lbl_800BF858:
    or      a0, s4, $zero              # a0 = 00000000
    andi    a1, s0, 0x00FF             # a1 = 00000000
    addiu   a2, s1, 0x0048             # a2 = 00000048
    jal     func_800C04E4
    addiu   a3, s1, 0x0018             # a3 = 00000018
    bne     v0, $zero, lbl_800BF6B8
    sb      v0, 0x0002(s1)             # 00000002
    addiu   t8, $zero, 0x00FF          # t8 = 000000FF
    b       lbl_800BF6B8
    sb      t8, 0x0002(s1)             # 00000002
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    sb      v0, 0x0020(s1)             # 00000020
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    lh      t9, 0x0026(s4)             # 00000026
    lh      t0, 0x0010(s1)             # 00000010
    lh      t1, 0x000E(s3)             # 0000000E
    addu    s0, v0, t9
    addu    s0, s0, t0
    addu    s0, s0, t1
    andi    s0, s0, 0x00FF             # s0 = 00000000
    slti    $at, s0, 0x0080
    bnel    $at, $zero, lbl_800BF8C4
    lbu     t2, 0x0020(s1)             # 00000020
    or      s0, $zero, $zero           # s0 = 00000000
    lbu     t2, 0x0020(s1)             # 00000020
lbl_800BF8C4:
    sb      s0, 0x0005(s1)             # 00000005
    andi    t3, t2, 0x0080             # t3 = 00000000
    beq     t3, $zero, lbl_800BF8F0
    nop
    lw      t4, 0x0000(s2)             # 00000054
    lbu     t5, 0x0000(t4)             # 00000000
    sh      t5, 0x000E(s1)             # 0000000E
    lw      t6, 0x0000(s2)             # 00000054
    addiu   t7, t6, 0x0001             # t7 = 00000001
    b       lbl_800BF6B8
    sw      t7, 0x0000(s2)             # 00000054
lbl_800BF8F0:
    jal     func_800BF354
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sh      v0, 0x000E(s1)             # 0000000E
    b       lbl_800BF6B8
    sb      $zero, 0x0020(s1)          # 00000020
    jal     func_800BF31C
    or      a0, s2, $zero              # a0 = 00000054
    lw      t8, 0x0018(s3)             # 00000018
    andi    t9, v0, 0xFFFF             # t9 = 00000000
    addu    t0, t8, t9
    sw      t0, 0x001C(s1)             # 0000001C
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sb      v0, 0x0018(s1)             # 00000018
    lbu     t2, 0x0000(s1)             # 00000000
    ori     t3, t2, 0x0004             # t3 = 00000004
    b       lbl_800BF6B8
    sb      t3, 0x0000(s1)             # 00000000
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sb      v0, 0x0001(s1)             # 00000001
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    addiu   t4, v0, 0x0080             # t4 = 00000080
    andi    t5, t4, 0x00FF             # t5 = 00000080
    sll     t6, t5,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t6
    lwc1    $f10, 0x07C4($at)          # 801007C4
    b       lbl_800BF6B8
    swc1    $f10, 0x0034(s1)           # 00000034
lbl_800BF978:
    addiu   $at, $zero, 0x00D0         # $at = 000000D0
    beq     v1, $at, lbl_800BF994
    addiu   $at, $zero, 0x00E0         # $at = 000000E0
    beql    v1, $at, lbl_800BF9C8
    lw      t1, 0x0098(s3)             # 00000098
    b       lbl_800BF6B8
    nop
lbl_800BF994:
    lw      t7, 0x0094(s3)             # 00000094
    andi    t8, a0, 0x000F             # t8 = 00000000
    addu    t9, t7, t8
    lbu     a1, 0x0000(t9)             # 00000000
    multu   a1, a1
    mflo    t0
    mtc1    t0, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    div.s   $f4, $f18, $f20
    b       lbl_800BF6B8
    swc1    $f4, 0x003C(s1)            # 0000003C
    lw      t1, 0x0098(s3)             # 00000098
lbl_800BF9C8:
    andi    t2, a0, 0x000F             # t2 = 00000000
    addu    t3, t1, t2
    lbu     t4, 0x0000(t3)             # 00000000
    b       lbl_800BF6B8
    sb      t4, 0x0003(s1)             # 00000003
lbl_800BF9DC:
    lw      $ra, 0x0034($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800BFA00:
# MqDbg: AudioSeq_SeqLayerProcessScriptStep4
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sw      $ra, 0x0014($sp)
    sw      a1, 0x007C($sp)
    lbu     v0, 0x0002(a0)             # 00000002
    lw      v1, 0x0050(a0)             # 00000050
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    or      a2, a0, $zero              # a2 = 00000000
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    bne     v0, t0, lbl_800BFA44
    lw      t2, 0x004C(v1)             # 0000004C
    lw      t6, 0x0000(v1)             # 00000000
    sll     t8, t6,  4
    bltzl   t8, lbl_800BFA44
    lh      v0, 0x0024(v1)             # 00000024
    b       lbl_800C0090
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    lh      v0, 0x0024(v1)             # 00000024
lbl_800BFA44:
    beq     v0, $zero, lbl_800BFA60
    lbu     t9, 0x007F($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BFAF8
    lbu     t6, 0x007F($sp)
    b       lbl_800BFB70
    lh      t7, 0x000E(t2)             # 0000000E
lbl_800BFA60:
    lh      t4, 0x0026(v1)             # 00000026
    lh      t6, 0x0010(a2)             # 00000010
    addu    t5, t9, t4
    addu    t1, t5, t6
    andi    a1, t1, 0x00FF             # a1 = 00000000
    sb      a1, 0x0004(a2)             # 00000004
    lbu     a0, 0x0007(v1)             # 00000007
    sw      t3, 0x0074($sp)
    sw      t2, 0x0040($sp)
    jal     func_800BCB2C
    sw      a2, 0x0078($sp)
    lw      a2, 0x0078($sp)
    lw      t2, 0x0040($sp)
    bne     v0, $zero, lbl_800BFAB8
    lw      t3, 0x0074($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    lh      t4, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t9, t8, 0x0020             # t9 = 00000020
    sb      t9, 0x0000(a2)             # 00000000
    b       lbl_800C0090
    sh      t4, 0x000C(a2)             # 0000000C
lbl_800BFAB8:
    lw      t5, 0x000C(v0)             # 0000000B
    lw      t7, 0x0000(a2)             # 00000000
    addiu   v1, v0, 0x0004             # v1 = 00000003
    sw      t5, 0x001C(a2)             # 0000001C
    lbu     t6, 0x0000(v0)             # FFFFFFFF
    sll     t9, t7,  5
    bltz    t9, lbl_800BFAE0
    sb      t6, 0x0018(a2)             # 00000018
    lbu     t4, 0x0001(v0)             # 00000000
    sb      t4, 0x0006(a2)             # 00000006
lbl_800BFAE0:
    sw      v1, 0x004C(a2)             # 0000004C
    lwc1    $f4, 0x0004(v1)            # 00000007
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    b       lbl_800BFF00
    swc1    $f4, 0x0030(a2)            # 00000030
lbl_800BFAF8:
    lbu     v0, 0x007F($sp)
    lh      t5, 0x0010(a2)             # 00000010
    sb      v0, 0x0004(a2)             # 00000004
    lbu     a0, 0x0007(v1)             # 0000000A
    sll     t6, t5,  6
    addu    a3, t6, v0
    andi    a1, a3, 0xFFFF             # a1 = 00000000
    sw      t3, 0x0074($sp)
    sw      t2, 0x0040($sp)
    jal     func_800BCC10
    sw      a2, 0x0078($sp)
    lw      a2, 0x0078($sp)
    lw      t2, 0x0040($sp)
    bne     v0, $zero, lbl_800BFB54
    lw      t3, 0x0074($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    lh      t4, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t9, t8, 0x0020             # t9 = 00000020
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t9, 0x0000(a2)             # 00000000
    b       lbl_800C0090
    sh      t5, 0x000C(a2)             # 0000000C
lbl_800BFB54:
    sw      v0, 0x004C(a2)             # 0000004C
    lwc1    $f6, 0x0004(v0)            # 00000003
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    b       lbl_800BFF00
    swc1    $f6, 0x0030(a2)            # 00000030
    lh      t7, 0x000E(t2)             # 0000000E
lbl_800BFB70:
    lh      t9, 0x0026(v1)             # 00000026
    lh      t5, 0x0010(a2)             # 00000010
    addu    t8, t6, t7
    addu    t4, t8, t9
    addu    t1, t4, t5
    andi    t1, t1, 0x00FF             # t1 = 00000000
    slti    $at, t1, 0x0080
    sb      t1, 0x0004(a2)             # 00000004
    bne     $at, $zero, lbl_800BFBAC
    or      a3, t1, $zero              # a3 = 00000000
    lbu     t7, 0x0000(a2)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t8, t7, 0x0020             # t8 = 00000020
    b       lbl_800C0090
    sb      t8, 0x0000(a2)             # 00000000
lbl_800BFBAC:
    lbu     t9, 0x0002(a2)             # 00000002
    bnel    t0, t9, lbl_800BFBC4
    lw      a0, 0x0048(a2)             # 00000048
    b       lbl_800BFBC4
    lw      a0, 0x0048(v1)             # 00000048
    lw      a0, 0x0048(a2)             # 00000048
lbl_800BFBC4:
    lbu     t4, 0x0020(a2)             # 00000020
    beq     t4, $zero, lbl_800BFE44
    nop
    addiu   t0, a2, 0x0020             # t0 = 00000020
    sw      t0, 0x0060($sp)
    lbu     v1, 0x0005(a2)             # 00000005
    slt     $at, v1, a3
    beq     $at, $zero, lbl_800BFBF0
    or      a1, v1, $zero              # a1 = 00000000
    b       lbl_800BFBF0
    or      a1, a3, $zero              # a1 = 00000000
lbl_800BFBF0:
    beq     a0, $zero, lbl_800BFC3C
    lui     $at, 0x3F80                # $at = 3F800000
    sw      a2, 0x0078($sp)
    sw      a3, 0x0020($sp)
    sw      t0, 0x001C($sp)
    sb      t1, 0x003F($sp)
    jal     func_800BCA1C
    sw      t2, 0x0040($sp)
    lw      a2, 0x0078($sp)
    lw      a3, 0x0020($sp)
    lw      t0, 0x001C($sp)
    lw      t5, 0x004C(a2)             # 0000004C
    lbu     t1, 0x003F($sp)
    lw      t2, 0x0040($sp)
    sw      v0, 0x004C(a2)             # 0000004C
    xor     t3, v0, t5
    sltiu   t3, t3, 0x0001
    b       lbl_800BFC84
    lwc1    $f0, 0x0004(v0)            # 00000004
lbl_800BFC3C:
    mtc1    $at, $f0                   # $f0 = 0.00
    slti    $at, v0, 0x00C0
    bne     $at, $zero, lbl_800BFC84
    sw      $zero, 0x004C(a2)          # 0000004C
    sll     t6, v0,  2
    subu    t6, t6, v0
    sll     t6, t6,  2
    subu    t6, t6, v0
    sll     t6, t6,  3
    lui     a1, 0x8012                 # a1 = 80120000
    addu    t6, t6, v0
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t6, t6,  3
    lui     $at, 0xFFFD                # $at = FFFD0000
    ori     $at, $at, 0xEC98           # $at = FFFDEC98
    addu    t7, a1, t6
    addu    t8, t7, $at
    sw      t8, 0x004C(a2)             # 0000004C
lbl_800BFC84:
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     t5, 0x0005(a2)             # 00000005
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sll     t9, a3,  2
    addu    t4, v1, t9
    lwc1    $f8, 0x0000(t4)            # 00000000
    lbu     v0, 0x0000(t0)             # 00000000
    sll     t6, t5,  2
    addu    t7, v1, t6
    lwc1    $f10, 0x0000(t7)           # 00000000
    mul.s   $f2, $f8, $f0
    addiu   a0, $zero, 0xFF7F          # a0 = FFFFFF7F
    and     t8, v0, a0
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    lui     a1, 0x8012                 # a1 = 80120000
    sltiu   $at, t9, 0x0005
    mul.s   $f14, $f10, $f0
    beq     $at, $zero, lbl_800BFD00
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x6588($at)           # 80109A78
    jr      t9
    nop
    mov.s   $f0, $f2
    b       lbl_800BFD08
    mov.s   $f12, $f14
    mov.s   $f12, $f2
    b       lbl_800BFD08
    mov.s   $f0, $f14
lbl_800BFD00:
    mov.s   $f12, $f2
    mov.s   $f0, $f2
lbl_800BFD08:
    div.s   $f16, $f0, $f12
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f18                  # $f18 = 1.00
    andi    t4, v0, 0x0080             # t4 = 00000000
    sub.s   $f4, $f16, $f18
    beq     t4, $zero, lbl_800BFDB4
    swc1    $f4, 0x0008(t0)            # 00000008
    lhu     t5, 0x0008(t2)             # 00000008
    lh      t7, 0x2898(a1)             # 80127EC8
    lh      v0, 0x0008(a2)             # 00000008
    sll     t6, t5, 15
    div     $zero, t6, t7
    mflo    v1
    bne     t7, $zero, lbl_800BFD48
    nop
    break   # 0x01C00
lbl_800BFD48:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800BFD60
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800BFD60
    nop
    break   # 0x01800
lbl_800BFD60:
    beql    v0, $zero, lbl_800BFE00
    slti    $at, v1, 0x7FFF
    lhu     t9, 0x000E(a2)             # 0000000E
    sll     t8, v1,  8
    multu   v0, t9
    mflo    t4
    nop
    nop
    div     $zero, t8, t4
    mflo    v1
    bne     t4, $zero, lbl_800BFD94
    nop
    break   # 0x01C00
lbl_800BFD94:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t4, $at, lbl_800BFDAC
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800BFDAC
    nop
    break   # 0x01800
lbl_800BFDAC:
    b       lbl_800BFE00
    slti    $at, v1, 0x7FFF
lbl_800BFDB4:
    lhu     t5, 0x000E(a2)             # 0000000E
    lh      t6, 0x2854(a1)             # 80127E84
    lui     t9, 0x0002                 # t9 = 00020000
    multu   t5, t6
    mflo    t7
    nop
    nop
    div     $zero, t9, t7
    mflo    v1
    bne     t7, $zero, lbl_800BFDE4
    nop
    break   # 0x01C00
lbl_800BFDE4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800BFDFC
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800BFDFC
    nop
    break   # 0x01800
lbl_800BFDFC:
    slti    $at, v1, 0x7FFF
lbl_800BFE00:
    bne     $at, $zero, lbl_800BFE10
    nop
    b       lbl_800BFE1C
    addiu   v1, $zero, 0x7FFF          # v1 = 00007FFF
lbl_800BFE10:
    bgtzl   v1, lbl_800BFE20
    sh      v1, 0x0004(t0)             # 00000004
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800BFE1C:
    sh      v1, 0x0004(t0)             # 00000004
lbl_800BFE20:
    sh      $zero, 0x0002(t0)          # 00000002
    swc1    $f12, 0x0030(a2)           # 00000030
    lbu     t8, 0x0000(t0)             # 00000000
    addiu   $at, $zero, 0x0005         # $at = 00000005
    and     t4, t8, a0
    bnel    t4, $at, lbl_800BFF04
    lwc1    $f18, 0x0030(a2)           # 00000030
    b       lbl_800BFF00
    sb      t1, 0x0005(a2)             # 00000005
lbl_800BFE44:
    beq     a0, $zero, lbl_800BFE9C
    or      a1, a3, $zero              # a1 = 00000000
    sw      a2, 0x0078($sp)
    sw      a3, 0x0020($sp)
    jal     func_800BCA1C
    sw      t2, 0x0040($sp)
    lw      a2, 0x0078($sp)
    lw      a3, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lw      t5, 0x004C(a2)             # 0000004C
    lw      t2, 0x0040($sp)
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sw      v0, 0x004C(a2)             # 0000004C
    sll     t6, a3,  2
    addu    t9, v1, t6
    lwc1    $f6, 0x0000(t9)            # 00000000
    lwc1    $f8, 0x0004(v0)            # 00000004
    xor     t3, v0, t5
    sltiu   t3, t3, 0x0001
    mul.s   $f10, $f6, $f8
    b       lbl_800BFEF8
    swc1    $f10, 0x0030(a2)           # 00000030
lbl_800BFE9C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sll     t7, a3,  2
    sw      $zero, 0x004C(a2)          # 0000004C
    addu    t8, v1, t7
    lwc1    $f16, 0x0000(t8)           # 00000000
    slti    $at, v0, 0x00C0
    bne     $at, $zero, lbl_800BFEF8
    swc1    $f16, 0x0030(a2)           # 00000030
    sll     t4, v0,  2
    subu    t4, t4, v0
    sll     t4, t4,  2
    subu    t4, t4, v0
    sll     t4, t4,  3
    lui     a1, 0x8012                 # a1 = 80120000
    addu    t4, t4, v0
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t4, t4,  3
    lui     $at, 0xFFFD                # $at = FFFD0000
    ori     $at, $at, 0xEC98           # $at = FFFDEC98
    addu    t5, a1, t4
    addu    t6, t5, $at
    sw      t6, 0x004C(a2)             # 0000004C
lbl_800BFEF8:
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
lbl_800BFF00:
    lwc1    $f18, 0x0030(a2)           # 00000030
lbl_800BFF04:
    lwc1    $f4, 0x0034(a2)            # 00000034
    lh      v0, 0x0008(a2)             # 00000008
    mul.s   $f6, $f18, $f4
    sh      v0, 0x000C(a2)             # 0000000C
    bne     v0, $zero, lbl_800C008C
    swc1    $f6, 0x0030(a2)            # 00000030
    lw      v0, 0x004C(a2)             # 0000004C
    beql    v0, $zero, lbl_800BFF5C
    mtc1    $zero, $f0                 # $f0 = 0.00
    lw      t9, 0x0000(v0)             # 00000000
    lui     $at, 0x4F80                # $at = 4F800000
    lw      t7, 0x0008(t9)             # 00000008
    lw      t8, 0x0004(t7)             # 00000004
    mtc1    t8, $f8                    # $f8 = 0.00
    bgez    t8, lbl_800BFF60
    cvt.s.w $f0, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f0, $f0, $f10
    b       lbl_800BFF64
    lhu     t4, 0x0008(t2)             # 00000008
    mtc1    $zero, $f0                 # $f0 = 0.00
lbl_800BFF5C:
    nop
lbl_800BFF60:
    lhu     t4, 0x0008(t2)             # 00000008
lbl_800BFF64:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f2, -0x6574($at)          # 80109A8C
    mtc1    t4, $f16                   # $f16 = 0.00
    bgez    t4, lbl_800BFF88
    cvt.s.w $f18, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800BFF88:
    mul.s   $f0, $f0, $f18
    lwc1    $f6, 0x2870(a1)            # 80127EA0
    lwc1    $f8, 0x0030(a2)            # 00000030
    mul.s   $f0, $f0, $f6
    div.s   $f0, $f0, $f8
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_800BFFB4
    trunc.w.s $f10, $f0
    mov.s   $f0, $f2
    trunc.w.s $f10, $f0
lbl_800BFFB4:
    lbu     t8, 0x0020(a2)             # 00000020
    sh      $zero, 0x000A(a2)          # 0000000A
    mfc1    t9, $f10
    nop
    addiu   t7, t9, 0x0001             # t7 = 00000001
    beq     t8, $zero, lbl_800C008C
    sh      t7, 0x0008(a2)             # 00000008
    lw      t4, 0x0060($sp)
    lbu     t5, 0x0000(t4)             # 00000000
    andi    t6, t5, 0x0080             # t6 = 00000000
    beql    t6, $zero, lbl_800C0090
    or      v0, t3, $zero              # v0 = 00000000
    lhu     t9, 0x0008(t2)             # 00000008
    lh      t8, 0x2898(a1)             # 80127EC8
    lh      t4, 0x0008(a2)             # 00000008
    sll     t7, t9, 15
    div     $zero, t7, t8
    mflo    v0
    lhu     t5, 0x000E(a2)             # 0000000E
    sll     t9, v0,  8
    bne     t8, $zero, lbl_800C0010
    nop
    break   # 0x01C00
lbl_800C0010:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t8, $at, lbl_800C0028
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_800C0028
    nop
    break   # 0x01800
lbl_800C0028:
    multu   t4, t5
    lw      t7, 0x0060($sp)
    mflo    t6
    nop
    nop
    div     $zero, t9, t6
    bne     t6, $zero, lbl_800C004C
    nop
    break   # 0x01C00
lbl_800C004C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t6, $at, lbl_800C0064
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800C0064
    nop
    break   # 0x01800
lbl_800C0064:
    mflo    v0
    slti    $at, v0, 0x7FFF
    bne     $at, $zero, lbl_800C007C
    nop
    b       lbl_800C0088
    addiu   v0, $zero, 0x7FFF          # v0 = 00007FFF
lbl_800C007C:
    bgtzl   v0, lbl_800C008C
    sh      v0, 0x0004(t7)             # 00000005
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C0088:
    sh      v0, 0x0004(t7)             # 00000005
lbl_800C008C:
    or      v0, t3, $zero              # v0 = 00000000
lbl_800C0090:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0078           # $sp += 0x78
    jr      $ra
    nop


func_800C00A0:
# MqDbg: AudioSeq_SeqLayerProcessScriptStep3
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0044($sp)
    lw      t0, 0x0050(a0)             # 00000050
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    or      a2, a0, $zero              # a2 = 00000000
    lw      t6, 0x004C(t0)             # 0000004C
    bne     a1, $at, lbl_800C00F4
    sw      t6, 0x002C($sp)
    addiu   a0, a2, 0x0054             # a0 = 00000054
    jal     func_800BF354
    sw      a2, 0x0040($sp)
    lw      a2, 0x0040($sp)
    lbu     t9, 0x0000(a2)             # 00000000
    sh      v0, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t2, t9, 0x0020             # t2 = 00000020
    andi    t3, t2, 0x00FD             # t3 = 00000020
    sb      t2, 0x0000(a2)             # 00000000
    b       lbl_800C04A4
    sb      t3, 0x0000(a2)             # 00000000
lbl_800C00F4:
    lbu     t4, 0x0000(a2)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    t5, t4, 0xFFDF             # t5 = 00000000
    sb      t5, 0x0000(a2)             # 00000000
    lw      t6, 0x0000(t0)             # 00000000
    lw      a1, 0x0044($sp)
    sll     t7, t6,  6
    srl     t8, t7, 31
    bne     t8, $at, lbl_800C0264
    andi    a1, a1, 0x00C0             # a1 = 00000000
    lw      a1, 0x0044($sp)
    addiu   $at, $zero, 0x0040         # $at = 00000040
    andi    a1, a1, 0x00C0             # a1 = 00000000
    beql    a1, $zero, lbl_800C014C
    addiu   a0, a2, 0x0054             # a0 = 00000054
    beq     a1, $at, lbl_800C01A4
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beql    a1, $at, lbl_800C01F0
    lh      t6, 0x0014(a2)             # 00000014
    b       lbl_800C0220
    lw      a3, 0x0034($sp)
    addiu   a0, a2, 0x0054             # a0 = 00000054
lbl_800C014C:
    sw      a0, 0x001C($sp)
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a0, 0x001C($sp)
    sh      v0, 0x003A($sp)
    lw      a2, 0x0040($sp)
    lw      v1, 0x0000(a0)             # 00000000
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t9, v1, 0x0001             # t9 = 00000001
    sw      t9, 0x0000(a0)             # 00000000
    lbu     t2, 0x0000(t9)             # 00000001
    or      t1, t9, $zero              # t1 = 00000001
    sb      t2, 0x0003(a2)             # 00000003
    lw      t3, 0x0000(a0)             # 00000000
    addiu   t4, t3, 0x0001             # t4 = 00000001
    sw      t4, 0x0000(a0)             # 00000000
    b       lbl_800C0220
    sh      v0, 0x0014(a2)             # 00000014
lbl_800C01A4:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sw      a0, 0x001C($sp)
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a0, 0x001C($sp)
    sh      v0, 0x003A($sp)
    lw      a2, 0x0040($sp)
    lw      v1, 0x0000(a0)             # 00000000
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t5, v1, 0x0001             # t5 = 00000001
    sw      t5, 0x0000(a0)             # 00000000
    sb      $zero, 0x0003(a2)          # 00000003
    b       lbl_800C0220
    sh      v0, 0x0014(a2)             # 00000014
    lh      t6, 0x0014(a2)             # 00000014
lbl_800C01F0:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sh      t6, 0x003A($sp)
    lw      v1, 0x0000(a0)             # 00000054
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    sw      t7, 0x0000(a0)             # 00000054
    lbu     t9, 0x0000(t7)             # 00000001
    or      t8, t7, $zero              # t8 = 00000001
    sb      t9, 0x0003(a2)             # 00000003
    lw      t1, 0x0000(a0)             # 00000054
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sw      t2, 0x0000(a0)             # 00000054
lbl_800C0220:
    slti    $at, a3, 0x0080
    beql    $at, $zero, lbl_800C0238
    addiu   a3, $zero, 0x007F          # a3 = 0000007F
    bgezl   a3, lbl_800C023C
    mtc1    a3, $f4                    # $f4 = 0.00
    addiu   a3, $zero, 0x007F          # a3 = 0000007F
lbl_800C0238:
    mtc1    a3, $f4                    # $f4 = 0.00
lbl_800C023C:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f8, -0x6570($at)          # 80109A90
    cvt.s.w $f0, $f4
    mul.s   $f6, $f0, $f0
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x003C(a2)           # 0000003C
    lw      t3, 0x0044($sp)
    subu    t4, t3, a1
    b       lbl_800C02D4
    sw      t4, 0x0044($sp)
lbl_800C0264:
    beq     a1, $zero, lbl_800C0288
    addiu   $at, $zero, 0x0040         # $at = 00000040
    beql    a1, $at, lbl_800C02B8
    lh      t5, 0x0012(a2)             # 00000012
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beql    a1, $at, lbl_800C02C4
    lh      t6, 0x0014(a2)             # 00000014
    b       lbl_800C02CC
    lw      t7, 0x0044($sp)
lbl_800C0288:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a2, 0x0040($sp)
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    sh      v0, 0x003A($sp)
    b       lbl_800C02C8
    sh      v0, 0x0014(a2)             # 00000014
    lh      t5, 0x0012(a2)             # 00000012
lbl_800C02B8:
    b       lbl_800C02C8
    sh      t5, 0x003A($sp)
    lh      t6, 0x0014(a2)             # 00000014
lbl_800C02C4:
    sh      t6, 0x003A($sp)
lbl_800C02C8:
    lw      t7, 0x0044($sp)
lbl_800C02CC:
    subu    t8, t7, a1
    sw      t8, 0x0044($sp)
lbl_800C02D4:
    lbu     v1, 0x000D(t0)             # 0000000D
    lui     v0, 0x8012                 # v0 = 80120000
    beql    v1, $zero, lbl_800C0388
    lwc1    $f16, 0x003C(a2)           # 0000003C
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lwc1    $f12, 0x003C(a2)           # 0000003C
    lui     $at, 0x4F80                # $at = 4F800000
    divu    $zero, v0, v1
    mfhi    t9
    mtc1    t9, $f16                   # $f16 = 0.00
    bne     v1, $zero, lbl_800C0308
    nop
    break   # 0x01C00
lbl_800C0308:
    cvt.s.w $f18, $f16
    bgez    t9, lbl_800C0320
    nop
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800C0320:
    mul.s   $f6, $f12, $f18
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f8                   # $f8 = 100.00
    andi    t1, v0, 0x8000             # t1 = 00000000
    beq     t1, $zero, lbl_800C033C
    div.s   $f2, $f6, $f8
    neg.s   $f2, $f2
lbl_800C033C:
    add.s   $f0, $f12, $f2
    mtc1    $zero, $f14                # $f14 = 0.00
    nop
    c.lt.s  $f0, $f14
    swc1    $f0, 0x0038(a2)            # 00000038
    bc1fl   lbl_800C0364
    lui     $at, 0x3F80                # $at = 3F800000
    b       lbl_800C038C
    swc1    $f14, 0x0038(a2)           # 00000038
    lui     $at, 0x3F80                # $at = 3F800000
lbl_800C0364:
    mtc1    $at, $f0                   # $f0 = 1.00
    lwc1    $f10, 0x0038(a2)           # 00000038
    c.lt.s  $f0, $f10
    nop
    bc1fl   lbl_800C0390
    lhu     v0, 0x003A($sp)
    b       lbl_800C038C
    swc1    $f0, 0x0038(a2)            # 00000038
    lwc1    $f16, 0x003C(a2)           # 0000003C
lbl_800C0388:
    swc1    $f16, 0x0038(a2)           # 00000038
lbl_800C038C:
    lhu     v0, 0x003A($sp)
lbl_800C0390:
    lbu     t2, 0x0003(a2)             # 00000003
    sh      v0, 0x0008(a2)             # 00000008
    multu   t2, v0
    lui     v0, 0x8012                 # v0 = 80120000
    mflo    t3
    sra     t4, t3,  8
    sh      t4, 0x000A(a2)             # 0000000A
    lbu     t5, 0x000E(t0)             # 0000000E
    beql    t5, $zero, lbl_800C0438
    lw      t1, 0x002C($sp)
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lbu     t6, 0x000D(t0)             # 0000000D
    lh      v1, 0x000A(a2)             # 0000000A
    addiu   $at, $zero, 0x0064         # $at = 00000064
    divu    $zero, v0, t6
    mfhi    t7
    andi    t8, v0, 0x4000             # t8 = 00000000
    bne     t6, $zero, lbl_800C03E0
    nop
    break   # 0x01C00
lbl_800C03E0:
    multu   v1, t7
    mflo    a0
    nop
    nop
    divu    $zero, a0, $at
    mflo    a0
    beql    t8, $zero, lbl_800C0408
    addu    t9, v1, a0
    subu    a0, $zero, a0
    addu    t9, v1, a0
lbl_800C0408:
    sh      t9, 0x000A(a2)             # 0000000A
    lh      v1, 0x000A(a2)             # 0000000A
    bgezl   v1, lbl_800C0424
    lh      v0, 0x0008(a2)             # 00000008
    b       lbl_800C0434
    sh      $zero, 0x000A(a2)          # 0000000A
    lh      v0, 0x0008(a2)             # 00000008
lbl_800C0424:
    slt     $at, v0, v1
    beql    $at, $zero, lbl_800C0438
    lw      t1, 0x002C($sp)
    sh      v0, 0x000A(a2)             # 0000000A
lbl_800C0434:
    lw      t1, 0x002C($sp)
lbl_800C0438:
    lw      t2, 0x0000(t1)             # 00000000
    sll     t4, t2,  2
    bgezl   t4, lbl_800C045C
    lw      t7, 0x0000(t0)             # 00000000
    lbu     t5, 0x0003(t0)             # 00000003
    andi    t6, t5, 0x0050             # t6 = 00000000
    bnel    t6, $zero, lbl_800C0470
    lbu     t2, 0x0000(a2)             # 00000000
    lw      t7, 0x0000(t0)             # 00000000
lbl_800C045C:
    lw      t4, 0x002C($sp)
    sll     t9, t7,  3
    bgezl   t9, lbl_800C0484
    lw      t5, 0x00DC(t4)             # 000000DC
    lbu     t2, 0x0000(a2)             # 00000000
lbl_800C0470:
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t3, t2, 0x0020             # t3 = 00000020
    b       lbl_800C04A4
    sb      t3, 0x0000(a2)             # 00000000
    lw      t5, 0x00DC(t4)             # 000000DC
lbl_800C0484:
    lw      v0, 0x0044($sp)
    beq     t5, $zero, lbl_800C04A4
    nop
    lbu     t7, 0x0000(a2)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t8, t7, 0x0020             # t8 = 00000020
    b       lbl_800C04A4
    sb      t8, 0x0000(a2)             # 00000000
lbl_800C04A4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_800C04B4:
# MqDbg: AudioSeq_SetChannelPriorities
    andi    v0, a1, 0x00FF             # v0 = 00000000
    andi    v1, v0, 0x000F             # v1 = 00000000
    beq     v1, $zero, lbl_800C04C8
    sw      a1, 0x0004($sp)
    sb      v1, 0x0005(a0)             # 00000005
lbl_800C04C8:
    sra     a1, v0,  4
    andi    a1, a1, 0x00FF             # a1 = 00000000
    beq     a1, $zero, lbl_800C04DC
    nop
    sb      a1, 0x0006(a0)             # 00000006
lbl_800C04DC:
    jr      $ra
    nop


func_800C04E4:
# MqDbg: AudioSeq_GetInstrument
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a1, 0x0024($sp)
    lbu     a1, 0x0027($sp)
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    sw      a3, 0x002C($sp)
    lbu     a0, 0x0007(a0)             # 00000007
    jal     func_800BCA58
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    lw      a2, 0x0028($sp)
    lw      a3, 0x002C($sp)
    bne     v0, $zero, lbl_800C052C
    or      v1, v0, $zero              # v1 = 00000000
    sw      $zero, 0x0000(a2)          # 00000000
    b       lbl_800C0548
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C052C:
    lw      t7, 0x0004(v1)             # 00000004
    addiu   a0, a1, 0x0002             # a0 = 00000002
    andi    v0, a0, 0x00FF             # v0 = 00000002
    sw      t7, 0x0004(a3)             # 00000004
    lbu     t8, 0x0003(v1)             # 00000003
    sb      t8, 0x0000(a3)             # 00000000
    sw      v1, 0x0000(a2)             # 00000000
lbl_800C0548:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C0558:
# MqDbg: AudioSeq_SetInstrument
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    slti    $at, a1, 0x0080
    sw      $ra, 0x0014($sp)
    bne     $at, $zero, lbl_800C0580
    or      v0, a1, $zero              # v0 = 00000000
    sh      v0, 0x0024(a0)             # 00000024
    b       lbl_800C05E8
    sw      $zero, 0x0048(a0)          # 00000048
lbl_800C0580:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    bne     v0, $at, lbl_800C0598
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sh      $zero, 0x0024(a0)          # 00000024
    b       lbl_800C05E8
    sw      t6, 0x0048(a0)             # 00000048
lbl_800C0598:
    addiu   $at, $zero, 0x007E         # $at = 0000007E
    bne     v0, $at, lbl_800C05B8
    addiu   a2, a0, 0x0048             # a2 = 00000048
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sh      t7, 0x0024(a0)             # 00000024
    b       lbl_800C05E8
    sw      t8, 0x0048(a0)             # 00000048
lbl_800C05B8:
    addiu   a3, a0, 0x007C             # a3 = 0000007C
    jal     func_800C04E4
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    sll     t9, v0, 16
    sra     t0, t9, 16
    bne     t0, $zero, lbl_800C05E8
    sh      v0, 0x0024(a0)             # 00000024
    lbu     t1, 0x0000(a0)             # 00000000
    andi    t2, t1, 0xFFF7             # t2 = 00000000
    b       lbl_800C05F4
    sb      t2, 0x0000(a0)             # 00000000
lbl_800C05E8:
    lbu     t4, 0x0000(a0)             # 00000000
    ori     t5, t4, 0x0008             # t5 = 00000008
    sb      t5, 0x0000(a0)             # 00000000
lbl_800C05F4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C0604:
# MqDbg: AudioSeq_SequenceChannelSetVolume
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    cvt.s.w $f6, $f4
    div.s   $f10, $f6, $f8
    jr      $ra
    swc1    $f10, 0x002C(a0)           # 0000002C


func_800C0628:
# MqDbg: AudioSeq_SequenceChannelProcessScript
# Audio, related to playing the Ocarina
# A0 = ptr to some struct
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
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
    lw      t6, 0x0000(a0)             # 00000000
    or      s4, a0, $zero              # s4 = 00000000
    sll     t8, t6,  2
    bgezl   t8, lbl_800C0674
    lw      s7, 0x004C(s4)             # 0000004C
    b       lbl_800C12C0
    or      s0, $zero, $zero           # s0 = 00000000
    lw      s7, 0x004C(s4)             # 0000004C
lbl_800C0674:
    lw      t9, 0x0000(s7)             # 00000000
    sll     t1, t9,  2
    bgezl   t1, lbl_800C0698
    lhu     v1, 0x001E(s4)             # 0000001E
    lbu     t2, 0x0003(s4)             # 00000003
    andi    t3, t2, 0x0080             # t3 = 00000000
    bnel    t3, $zero, lbl_800C12EC
    lw      $ra, 0x003C($sp)
    lhu     v1, 0x001E(s4)             # 0000001E
lbl_800C0698:
    addiu   s6, s4, 0x0060             # s6 = 00000060
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_800C06B0
    addiu   t4, v1, 0xFFFF             # t4 = FFFFFFFF
    b       lbl_800C12BC
    sh      t4, 0x001E(s4)             # 0000001E
lbl_800C06B0:
    addiu   s8, $zero, 0xFFFF          # s8 = FFFFFFFF
lbl_800C06B4:
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    slti    $at, v0, 0x00B0
    andi    s2, v0, 0x00FF             # s2 = 00000000
    bne     $at, $zero, lbl_800C0FEC
    or      a0, v0, $zero              # a0 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, a0
    lbu     v1, 0x1780(v1)             # 80101780
    addiu   s0, $sp, 0x0060            # s0 = FFFFFFD8
    andi    a1, v1, 0x0003             # a1 = 00000000
    andi    t5, a1, 0x00FF             # t5 = 00000000
    blez    t5, lbl_800C0734
    andi    s5, a1, 0x00FF             # s5 = 00000000
    sll     t7, s5,  2
    addu    s3, t7, s0
lbl_800C06F4:
    andi    t8, v1, 0x0080             # t8 = 00000000
    bne     t8, $zero, lbl_800C0710
    or      s1, v1, $zero              # s1 = 80100000
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    b       lbl_800C071C
    sw      v0, 0x0000(s0)             # FFFFFFD8
lbl_800C0710:
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    sw      v0, 0x0000(s0)             # FFFFFFD8
lbl_800C071C:
    addiu   s0, s0, 0x0004             # s0 = FFFFFFDC
    sltu    $at, s0, s3
    sll     v1, s1,  1
    bne     $at, $zero, lbl_800C06F4
    andi    v1, v1, 0x00FF             # v1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C0734:
    slti    $at, s2, 0x00F2
    bne     $at, $zero, lbl_800C077C
    or      s0, s2, $zero              # s0 = 00000000
    or      a0, s7, $zero              # a0 = 00000000
    or      a1, s6, $zero              # a1 = 00000060
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    lw      a3, 0x0060($sp)
    beq     v0, $zero, lbl_800C06B4
    nop
    bne     v0, s8, lbl_800C0774
    nop
    jal     func_800BEE88
    or      a0, s4, $zero              # a0 = 00000000
    b       lbl_800C12C0
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C0774:
    b       lbl_800C12BC
    sh      v0, 0x001E(s4)             # 0000001E
lbl_800C077C:
    addiu   t9, s0, 0xFF50             # t9 = FFFFFF50
    sltiu   $at, t9, 0x0042
    beq     $at, $zero, lbl_800C06B4
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x656C($at)           # 80109A94
    jr      t9
    nop
    lbu     t1, 0x0000(s4)             # 00000000
    ori     t2, t1, 0x0020             # t2 = 00000020
    b       lbl_800C12BC
    sb      t2, 0x0000(s4)             # 00000000
    addiu   s0, s4, 0x0084             # s0 = 00000084
    jal     func_800BD3C0
    or      a0, s0, $zero              # a0 = 00000084
    lbu     a1, 0x0063($sp)
    jal     func_800BD520
    or      a0, s0, $zero              # a0 = 00000084
    b       lbl_800C06B4
    nop
    jal     func_800BD3C0
    addiu   a0, s4, 0x0084             # a0 = 00000084
    b       lbl_800C06B4
    nop
    lhu     s1, 0x0062($sp)
    lw      t3, 0x0018(s7)             # 00000018
    addu    t4, t3, s1
    b       lbl_800C06B4
    sw      t4, 0x003C(s4)             # 0000003C
    lb      v0, 0x0019(s6)             # 00000079
    beq     s8, v0, lbl_800C06B4
    nop
    lw      t5, 0x003C(s4)             # 0000003C
    sll     t7, v0,  1
    lw      t0, 0x0018(s7)             # 00000018
    addu    s0, t5, t7
    lbu     t8, 0x0000(s0)             # 00000084
    lbu     t6, 0x0001(s0)             # 00000085
    sll     t9, t8,  8
    addu    s1, t6, t9
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t1, t0, s1
    b       lbl_800C06B4
    sw      t1, 0x003C(s4)             # 0000003C
    lbu     t3, 0x0005(s7)             # 00000005
    lbu     t2, 0x0063($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t3, $at, lbl_800C0874
    or      s2, t2, $zero              # s2 = 00000000
    lbu     t4, 0x0004(s7)             # 00000004
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7E6C(v0)             # 80127E6C
    sll     t5, t4,  1
    addu    t7, v0, t5
    lhu     s1, 0x0000(t7)             # 00000000
    addu    t8, s1, v0
    lbu     s5, 0x0000(t8)             # 00000000
    addu    t6, s1, s5
    subu    t9, t6, t2
    addu    t0, t9, v0
    lbu     s2, 0x0000(t0)             # 00000000
lbl_800C0874:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s2, $zero              # a2 = 00000000
    beql    v0, $zero, lbl_800C0894
    lw      t1, 0x0064($sp)
    sb      s2, 0x0007(s4)             # 00000007
    lw      t1, 0x0064($sp)
lbl_800C0894:
    sw      t1, 0x0060($sp)
    lbu     a1, 0x0063($sp)
    jal     func_800C0558
    or      a0, s4, $zero              # a0 = 00000000
    b       lbl_800C06B4
    nop
    lbu     t3, 0x0000(s4)             # 00000000
    andi    t4, t3, 0xFFFD             # t4 = 00000000
    b       lbl_800C06B4
    sb      t4, 0x0000(s4)             # 00000000
    lbu     t7, 0x0000(s4)             # 00000000
    ori     t8, t7, 0x0002             # t8 = 00000002
    b       lbl_800C06B4
    sb      t8, 0x0000(s4)             # 00000000
    lbu     a1, 0x0063($sp)
    jal     func_800C0604
    or      a0, s4, $zero              # a0 = 00000000
    lbu     t2, 0x0001(s4)             # 00000001
    ori     t9, t2, 0x0040             # t9 = 00000040
    b       lbl_800C06B4
    sb      t9, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    lui     $at, 0x3C00                # $at = 3C000000
    mtc1    $at, $f8                   # $f8 = 0.01
    mtc1    s2, $f4                    # $f4 = 0.00
    lbu     t1, 0x0001(s4)             # 00000001
    cvt.s.w $f6, $f4
    ori     t3, t1, 0x0040             # t3 = 00000040
    sb      t3, 0x0001(s4)             # 00000001
    mul.s   $f10, $f6, $f8
    b       lbl_800C06B4
    swc1    $f10, 0x0028(s4)           # 00000028
    lhu     s1, 0x0062($sp)
    lui     $at, 0x4700                # $at = 47000000
    mtc1    $at, $f4                   # $f4 = 32768.00
    mtc1    s1, $f16                   # $f16 = 0.00
    lbu     t5, 0x0001(s4)             # 00000001
    cvt.s.w $f18, $f16
    ori     t7, t5, 0x0080             # t7 = 00000080
    sb      t7, 0x0001(s4)             # 00000001
    div.s   $f6, $f18, $f4
    b       lbl_800C06B4
    swc1    $f6, 0x0038(s4)            # 00000038
    lbu     s2, 0x0063($sp)
    lbu     t2, 0x0001(s4)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    addiu   s2, s2, 0x0080             # s2 = 00000080
    andi    s2, s2, 0x00FF             # s2 = 00000080
    sll     t8, s2,  2
    addu    $at, $at, t8
    lwc1    $f8, 0x03C4($at)           # 801003C4
    ori     t9, t2, 0x0080             # t9 = 00000080
    sb      t9, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    swc1    $f8, 0x0038(s4)            # 00000038
    lbu     s2, 0x0063($sp)
    lbu     t3, 0x0001(s4)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    addiu   s2, s2, 0x0080             # s2 = 00000100
    andi    s2, s2, 0x00FF             # s2 = 00000000
    sll     t0, s2,  2
    addu    $at, $at, t0
    lwc1    $f10, 0x07C4($at)          # 801007C4
    ori     t4, t3, 0x0080             # t4 = 000000C0
    sb      t4, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    swc1    $f10, 0x0038(s4)           # 00000038
    lbu     t7, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t8, t7, 0x0020             # t8 = 000000A0
    sb      t8, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x000A(s4)             # 0000000A
    lbu     t2, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t9, t2, 0x0020             # t9 = 00000020
    sb      t9, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x000B(s4)             # 0000000B
    lb      v0, 0x0063($sp)
    b       lbl_800C06B4
    sh      v0, 0x0026(s4)             # 00000026
    lhu     s1, 0x0062($sp)
    lw      t0, 0x0018(s7)             # 00000018
    addu    t1, t0, s1
    b       lbl_800C06B4
    sw      t1, 0x0080(s4)             # 00000080
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x007C(s4)             # 0000007C
    lbu     s2, 0x0063($sp)
    sh      $zero, 0x0012(s4)          # 00000012
    sh      $zero, 0x001A(s4)          # 0000001A
    sll     t3, s2,  3
    b       lbl_800C06B4
    sh      t3, 0x0016(s4)             # 00000016
    lbu     s2, 0x0063($sp)
    sh      $zero, 0x0018(s4)          # 00000018
    sll     v0, s2,  5
    sh      v0, 0x0014(s4)             # 00000014
    b       lbl_800C06B4
    sh      v0, 0x0010(s4)             # 00000010
    lbu     s2, 0x0063($sp)
    sll     t4, s2,  3
    sh      t4, 0x0012(s4)             # 00000012
    lbu     s2, 0x0067($sp)
    sll     t5, s2,  3
    sh      t5, 0x0016(s4)             # 00000016
    lbu     s2, 0x006B($sp)
    sll     t7, s2,  4
    b       lbl_800C06B4
    sh      t7, 0x001A(s4)             # 0000001A
    lbu     s2, 0x0063($sp)
    sll     t8, s2,  5
    sh      t8, 0x0010(s4)             # 00000010
    lbu     s2, 0x0067($sp)
    sll     t6, s2,  5
    sh      t6, 0x0014(s4)             # 00000014
    lbu     s2, 0x006B($sp)
    sll     t2, s2,  4
    b       lbl_800C06B4
    sh      t2, 0x0018(s4)             # 00000018
    lbu     s2, 0x0063($sp)
    sll     t9, s2,  4
    b       lbl_800C06B4
    sh      t9, 0x001C(s4)             # 0000001C
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0004(s4)             # 00000004
    lbu     t1, 0x0005(s7)             # 00000005
    lbu     t0, 0x0063($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t1, $at, lbl_800C0ADC
    or      s2, t0, $zero              # s2 = 00000000
    lbu     t3, 0x0004(s7)             # 00000004
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7E6C(v0)             # 80127E6C
    sll     t4, t3,  1
    addu    t5, v0, t4
    lhu     s1, 0x0000(t5)             # 00000000
    addu    t7, s1, v0
    lbu     s5, 0x0000(t7)             # 00000080
    addu    t8, s1, s5
    subu    t6, t8, t0
    addu    t2, t6, v0
    lbu     s2, 0x0000(t2)             # 00000000
lbl_800C0ADC:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s2, $zero              # a2 = 00000000
    beq     v0, $zero, lbl_800C06B4
    nop
    b       lbl_800C06B4
    sb      s2, 0x0007(s4)             # 00000007
    lbu     s2, 0x0063($sp)
    lhu     s1, 0x0066($sp)
    lw      t9, 0x0018(s7)             # 00000018
    lbu     t1, 0x0019(s6)             # 00000079
    addu    v0, t9, s1
    addu    t3, t1, s2
    b       lbl_800C06B4
    sb      t3, 0x0000(v0)             # 00000000
    addiu   $at, $zero, 0x00C8         # $at = 000000C8
    bne     s0, $at, lbl_800C0B38
    lb      v0, 0x0063($sp)
    lb      t4, 0x0019(s6)             # 00000079
    subu    t5, t4, v0
    b       lbl_800C06B4
    sb      t5, 0x0019(s6)             # 00000079
lbl_800C0B38:
    addiu   $at, $zero, 0x00CC         # $at = 000000CC
    bnel    s0, $at, lbl_800C0B50
    lb      t7, 0x0019(s6)             # 00000079
    b       lbl_800C06B4
    sb      v0, 0x0019(s6)             # 00000079
    lb      t7, 0x0019(s6)             # 00000079
lbl_800C0B50:
    and     t8, t7, v0
    b       lbl_800C06B4
    sb      t8, 0x0019(s6)             # 00000079
    lbu     s2, 0x0063($sp)
    sll     t0, s2,  2
    addu    t6, s7, t0
    jal     func_800BEE88
    lw      a0, 0x0038(t6)             # 00000038
    b       lbl_800C06B4
    nop
    lbu     t9, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t1, t9, 0x0040             # t1 = 00000040
    sb      t1, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x0003(s4)             # 00000003
    lhu     s1, 0x0062($sp)
    lb      t4, 0x0019(s6)             # 00000079
    lw      t3, 0x0018(s7)             # 00000018
    addu    t5, s1, t4
    addu    t7, t3, t5
    lbu     t8, 0x0000(t7)             # 00000000
    b       lbl_800C06B4
    sb      t8, 0x0019(s6)             # 00000079
    lhu     s1, 0x0062($sp)
    b       lbl_800C06B4
    sh      s1, 0x0022(s4)             # 00000022
    lhu     s1, 0x0062($sp)
    lw      t0, 0x0018(s7)             # 00000018
    lhu     t6, 0x0022(s4)             # 00000022
    addu    v0, t0, s1
    sra     t9, t6,  8
    sb      t9, 0x0000(v0)             # 00000000
    lhu     t4, 0x0022(s4)             # 00000022
    b       lbl_800C06B4
    sb      t4, 0x0001(v0)             # 00000001
    lbu     s0, 0x0063($sp)
    andi    t3, s0, 0x0080             # t3 = 00000080
    beq     t3, $zero, lbl_800C0C00
    andi    t2, s0, 0x007F             # t2 = 00000004
    lbu     t7, 0x0000(s4)             # 00000000
    ori     t8, t7, 0x0004             # t8 = 00000004
    b       lbl_800C0C0C
    sb      t8, 0x0000(s4)             # 00000000
lbl_800C0C00:
    lbu     t0, 0x0000(s4)             # 00000000
    andi    t6, t0, 0xFFFB             # t6 = 00000000
    sb      t6, 0x0000(s4)             # 00000000
lbl_800C0C0C:
    b       lbl_800C06B4
    sb      t2, 0x00D0(s4)             # 000000D0
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0002(s4)             # 00000002
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x007D(s4)             # 0000007D
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0008(s4)             # 00000008
    lb      v0, 0x0019(s6)             # 00000079
    beq     s8, v0, lbl_800C06B4
    nop
    lbu     t3, 0x0018(s6)             # 00000078
    lw      t4, 0x0000(s6)             # 00000060
    lw      t9, 0x003C(s4)             # 0000003C
    sll     t5, t3,  2
    addu    t7, s6, t5
    sw      t4, 0x0004(t7)             # 00000004
    lbu     t8, 0x0018(s6)             # 00000078
    sll     t1, v0,  1
    addu    s0, t9, t1
    addiu   t0, t8, 0x0001             # t0 = 00000005
    sb      t0, 0x0018(s6)             # 00000078
    lbu     t2, 0x0000(s0)             # 00000084
    lbu     t6, 0x0001(s0)             # 00000085
    lw      t1, 0x0018(s7)             # 00000018
    sll     t9, t2,  8
    addu    s1, t6, t9
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t3, t1, s1
    b       lbl_800C06B4
    sw      t3, 0x0000(s6)             # 00000060
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0009(s4)             # 00000009
    lhu     s1, 0x0062($sp)
    lw      t5, 0x0018(s7)             # 00000018
    or      a0, s4, $zero              # a0 = 00000000
    addu    s0, t5, s1
    lbu     t4, 0x0000(s0)             # 00000084
    addiu   s0, s0, 0x0003             # s0 = 00000087
    sb      t4, 0x0003(s4)             # 00000003
    lbu     t7, -0x0002(s0)            # 00000085
    sb      t7, 0x0002(s4)             # 00000002
    jal     func_800C04B4
    lbu     a1, -0x0001(s0)            # 00000086
    lb      t8, 0x0000(s0)             # 00000087
    lbu     t3, 0x0001(s4)             # 00000001
    addiu   s0, s0, 0x0004             # s0 = 0000008B
    sh      t8, 0x0026(s4)             # 00000026
    lbu     t0, -0x0003(s0)            # 00000088
    ori     t5, t3, 0x0020             # t5 = 00000020
    sb      t0, 0x000A(s4)             # 0000000A
    lbu     t2, -0x0002(s0)            # 00000089
    sb      t2, 0x000B(s4)             # 0000000B
    lbu     t6, -0x0001(s0)            # 0000008A
    sb      t6, 0x0004(s4)             # 00000004
    lbu     t9, 0x0000(s0)             # 0000008B
    sb      t5, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      t9, 0x0008(s4)             # 00000008
    lw      t4, 0x0060($sp)
    or      a0, s4, $zero              # a0 = 00000000
    sb      t4, 0x0003(s4)             # 00000003
    lw      t7, 0x0064($sp)
    sb      t7, 0x0002(s4)             # 00000002
    jal     func_800C04B4
    lbu     a1, 0x006B($sp)
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t8, v0, 24
    sra     t0, t8, 24
    sh      t0, 0x0026(s4)             # 00000026
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x000A(s4)             # 0000000A
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x000B(s4)             # 0000000B
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x0004(s4)             # 00000004
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    lbu     t6, 0x0001(s4)             # 00000001
    sb      v0, 0x0008(s4)             # 00000008
    ori     t9, t6, 0x0020             # t9 = 00000020
    b       lbl_800C06B4
    sb      t9, 0x0001(s4)             # 00000001
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f16                  # $f16 = 1.00
    sh      $zero, 0x0016(s4)          # 00000016
    sh      $zero, 0x0012(s4)          # 00000012
    sh      $zero, 0x001A(s4)          # 0000001A
    sh      $zero, 0x0014(s4)          # 00000014
    sh      $zero, 0x0010(s4)          # 00000010
    sh      $zero, 0x0018(s4)          # 00000018
    sw      $zero, 0x00CC(s4)          # 000000CC
    sb      $zero, 0x000C(s4)          # 0000000C
    sb      $zero, 0x007D(s4)          # 0000007D
    sb      $zero, 0x000D(s4)          # 0000000D
    sb      $zero, 0x000E(s4)          # 0000000E
    sb      $zero, 0x000F(s4)          # 0000000F
    sh      $zero, 0x0020(s4)          # 00000020
    sb      $zero, 0x0009(s4)          # 00000009
    b       lbl_800C06B4
    swc1    $f16, 0x0038(s4)           # 00000038
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800C04B4
    lbu     a1, 0x0063($sp)
    b       lbl_800C06B4
    nop
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x000C(s4)             # 0000000C
    lhu     s1, 0x0062($sp)
    lw      t1, 0x0018(s7)             # 00000018
    addu    s0, t1, s1
    b       lbl_800C06B4
    sw      s0, 0x00CC(s4)             # 000000CC
    b       lbl_800C06B4
    sw      $zero, 0x00CC(s4)          # 000000CC
    lw      a0, 0x00CC(s4)             # 000000CC
    lbu     s2, 0x0063($sp)
    beq     a0, $zero, lbl_800C06B4
    sra     s5, s2,  4
    or      s0, s2, $zero              # s0 = 00000000
    andi    s5, s5, 0x000F             # s5 = 00000000
    andi    s2, s2, 0x000F             # s2 = 00000000
    andi    a1, s5, 0x00FF             # a1 = 00000000
    jal     func_800B4C48
    andi    a2, s2, 0x00FF             # a2 = 00000000
    b       lbl_800C06B4
    nop
    lb      t5, 0x0019(s6)             # 00000079
    lhu     s1, 0x0062($sp)
    lw      t3, 0x0018(s7)             # 00000018
    sll     t4, t5,  1
    addu    t7, s1, t4
    addu    t8, t3, t7
    lhu     t0, 0x0000(t8)             # 00000000
    b       lbl_800C06B4
    sh      t0, 0x0022(s4)             # 00000022
    lw      t2, 0x0018(s7)             # 00000018
    lhu     t6, 0x0022(s4)             # 00000022
    addu    t9, t2, t6
    b       lbl_800C06B4
    sw      t9, 0x003C(s4)             # 0000003C
    lb      t5, 0x0019(s6)             # 00000079
    lw      t1, 0x003C(s4)             # 0000003C
    sll     t4, t5,  1
    addu    t3, t1, t4
    lhu     t7, 0x0000(t3)             # 00000000
    b       lbl_800C06B4
    sh      t7, 0x0022(s4)             # 00000022
    lw      t8, 0x003C(s4)             # 0000003C
    lb      t0, 0x0019(s6)             # 00000079
    addu    t2, t8, t0
    lbu     t6, 0x0000(t2)             # 00000000
    b       lbl_800C06B4
    sb      t6, 0x0019(s6)             # 00000079
    lw      t9, 0x0060($sp)
    lui     t4, 0x8012                 # t4 = 80120000
    lw      t3, 0x0060($sp)
    bne     t9, $zero, lbl_800C0EBC
    nop
    lui     t5, 0x8012                 # t5 = 80120000
    lw      t1, 0x7FAC(t5)             # 80127FAC
    b       lbl_800C06B4
    sh      t1, 0x0022(s4)             # 00000022
lbl_800C0EBC:
    lw      t4, 0x7FAC(t4)             # 80127FAC
    divu    $zero, t4, t3
    mfhi    t7
    sh      t7, 0x0022(s4)             # 00000022
    bne     t3, $zero, lbl_800C0ED8
    nop
    break   # 0x01C00
lbl_800C0ED8:
    b       lbl_800C06B4
    nop
    lw      t8, 0x0060($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t9, 0x0060($sp)
    bne     t8, $zero, lbl_800C0F04
    nop
    lui     t0, 0x8012                 # t0 = 80120000
    lw      t2, 0x7FAC(t0)             # 80127FAC
    b       lbl_800C06B4
    sb      t2, 0x0019(s6)             # 00000079
lbl_800C0F04:
    lw      t6, 0x7FAC(t6)             # 80127FAC
    divu    $zero, t6, t9
    mfhi    t5
    sb      t5, 0x0019(s6)             # 00000079
    bne     t9, $zero, lbl_800C0F20
    nop
    break   # 0x01C00
lbl_800C0F20:
    b       lbl_800C06B4
    nop
    jal     func_800BBD80
    nop
    lw      t1, 0x0060($sp)
    lw      t3, 0x0060($sp)
    bne     t1, $zero, lbl_800C0F48
    nop
    b       lbl_800C0F60
    sh      v0, 0x0022(s4)             # 00000022
lbl_800C0F48:
    divu    $zero, v0, t3
    mfhi    t7
    sh      t7, 0x0022(s4)             # 00000022
    bne     t3, $zero, lbl_800C0F60
    nop
    break   # 0x01C00
lbl_800C0F60:
    lhu     t8, 0x0022(s4)             # 00000022
    lw      t0, 0x0064($sp)
    addu    t2, t8, t0
    andi    v0, t2, 0xFFFF             # v0 = 00000000
    sh      t2, 0x0022(s4)             # 00000022
    bgez    v0, lbl_800C0F84
    sra     v1, v0,  8
    addiu   $at, v0, 0x00FF            # $at = 000000FF
    sra     v1, $at,  8
lbl_800C0F84:
    addiu   v1, v1, 0x0080             # v1 = 00000080
    bgez    v0, lbl_800C0F9C
    andi    a0, v0, 0x00FF             # a0 = 00000000
    beq     a0, $zero, lbl_800C0F9C
    nop
    addiu   a0, a0, 0xFF00             # a0 = FFFFFF00
lbl_800C0F9C:
    sll     t6, v1,  8
    or      t9, t6, a0                 # t9 = FFFFFF00
    b       lbl_800C06B4
    sh      t9, 0x0022(s4)             # 00000022
    lw      t5, 0x0060($sp)
    b       lbl_800C06B4
    sb      t5, 0x000D(s4)             # 0000000D
    lw      t1, 0x0060($sp)
    b       lbl_800C06B4
    sb      t1, 0x000E(s4)             # 0000000E
    lw      t4, 0x0060($sp)
    sb      t4, 0x000F(s4)             # 0000000F
    lw      t3, 0x0064($sp)
    b       lbl_800C06B4
    sh      t3, 0x0020(s4)             # 00000020
    lhu     t7, 0x0022(s4)             # 00000022
    lw      t8, 0x0060($sp)
    addu    t0, t7, t8
    b       lbl_800C06B4
    sh      t0, 0x0022(s4)             # 00000022
lbl_800C0FEC:
    slti    $at, a0, 0x0070
    bne     $at, $zero, lbl_800C1168
    andi    a1, a0, 0x000F             # a1 = 00000000
    andi    a1, a0, 0x0007             # a1 = 00000000
    andi    v1, a0, 0x00F8             # v1 = 00000000
    addiu   $at, $zero, 0x0070         # $at = 00000070
    beq     v1, $at, lbl_800C1020
    andi    s5, a1, 0x00FF             # s5 = 00000000
    andi    t2, a1, 0x00FF             # t2 = 00000000
    slti    $at, t2, 0x0004
    bnel    $at, $zero, lbl_800C1024
    addiu   t6, v1, 0xFF90             # t6 = FFFFFF90
    or      s5, $zero, $zero           # s5 = 00000000
lbl_800C1020:
    addiu   t6, v1, 0xFF90             # t6 = FFFFFF90
lbl_800C1024:
    sltiu   $at, t6, 0x0029
    beq     $at, $zero, lbl_800C06B4
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6464($at)           # 80109B9C
    jr      t6
    nop
    sll     t9, s5,  2
    addu    t5, s4, t9
    lw      v0, 0x0050(t5)             # 00000050
    beq     v0, $zero, lbl_800C106C
    nop
    lw      t1, 0x0000(v0)             # 00000000
    sll     t4, t1,  1
    srl     t3, t4, 31
    b       lbl_800C06B4
    sb      t3, 0x0019(s6)             # 00000079
lbl_800C106C:
    b       lbl_800C06B4
    sb      s8, 0x0019(s6)             # 00000079
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    andi    s1, v0, 0xFFFF             # s1 = 00000000
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800C06B4
    sll     t0, s5,  2
    lw      t7, 0x0018(s7)             # 00000018
    addu    t2, s4, t0
    lw      t6, 0x0050(t2)             # 00000050
    addu    t8, t7, s1
    b       lbl_800C06B4
    sw      t8, 0x0054(t6)             # 00000054
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEE38
    or      a1, s5, $zero              # a1 = 00000000
    b       lbl_800C06B4
    nop
    lb      t9, 0x0019(s6)             # 00000079
    or      a0, s4, $zero              # a0 = 00000000
    beq     s8, t9, lbl_800C06B4
    nop
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    beq     v0, s8, lbl_800C06B4
    sll     t6, s5,  2
    lb      t1, 0x0019(s6)             # 00000079
    lw      t5, 0x003C(s4)             # 0000003C
    lw      t2, 0x0018(s7)             # 00000018
    sll     t4, t1,  1
    addu    s0, t5, t4
    lbu     t7, 0x0000(s0)             # 00000000
    lbu     t3, 0x0001(s0)             # 00000001
    addu    t9, s4, t6
    sll     t0, t7,  8
    addu    s1, t3, t0
    lw      t1, 0x0050(t9)             # 00000050
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t8, t2, s1
    b       lbl_800C06B4
    sw      t8, 0x0054(t1)             # 00000054
    lb      t5, 0x0019(s6)             # 00000079
    addu    t4, s4, s5
    b       lbl_800C06B4
    sb      t5, 0x00C4(t4)             # 000000C4
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    sll     s0, v0, 16
    sra     s0, s0, 16
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800C06B4
    sll     t0, s5,  2
    lw      t7, 0x0000(s6)             # 00000060
    addu    t2, s4, t0
    lw      t6, 0x0050(t2)             # 00000050
    addu    t3, t7, s0
    b       lbl_800C06B4
    sw      t3, 0x0054(t6)             # 00000054
lbl_800C1168:
    andi    t9, a0, 0x00F0             # t9 = 00000000
    sltiu   $at, t9, 0x0061
    beq     $at, $zero, lbl_800C06B4
    andi    s5, a1, 0x00FF             # s5 = 00000000
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x63C0($at)           # 80109C40
    jr      t9
    nop
    andi    t8, a1, 0x00FF             # t8 = 00000000
    b       lbl_800C12BC
    sh      t8, 0x001E(s4)             # 0000001E
    andi    t1, a1, 0x00FF             # t1 = 00000000
    slti    $at, t1, 0x0008
    beq     $at, $zero, lbl_800C11D8
    andi    s5, s2, 0x000F             # s5 = 00000000
    andi    t4, s2, 0x000F             # t4 = 00000000
    addu    v0, s4, t4
    sb      s8, 0x00C4(v0)             # 000000C4
    lb      a1, 0x0019(s6)             # 00000079
    lbu     a0, 0x0007(s4)             # 00000007
    jal     func_800B89D4
    addiu   a2, v0, 0x00C4             # a2 = 000000C4
    bne     v0, s8, lbl_800C06B4
    nop
    b       lbl_800C06B4
    nop
lbl_800C11D8:
    addiu   s5, s5, 0xFFF8             # s5 = FFFFFFF8
    andi    s5, s5, 0x00FF             # s5 = 000000F8
    addu    v0, s4, s5
    sb      s8, 0x00C4(v0)             # 000000C4
    lhu     a1, 0x0022(s4)             # 00000022
    lbu     a0, 0x0007(s4)             # 00000007
    addiu   a2, v0, 0x00C4             # a2 = 000000C4
    jal     func_800B89D4
    addiu   a1, a1, 0x0100             # a1 = 00000100
    bne     v0, s8, lbl_800C06B4
    nop
    b       lbl_800C06B4
    nop
    andi    v1, a1, 0x00FF             # v1 = 00000000
    addu    a0, s4, v1
    lb      t7, 0x00C4(a0)             # 000000C4
    slti    $at, v1, 0x0002
    beq     $at, $zero, lbl_800C06B4
    sb      t7, 0x0019(s6)             # 00000079
    b       lbl_800C06B4
    sb      s8, 0x00C4(a0)             # 000000C4
    andi    t2, a1, 0x00FF             # t2 = 00000000
    addu    t3, s4, t2
    lb      t6, 0x00C4(t3)             # 000000C4
    lb      t0, 0x0019(s6)             # 00000079
    subu    t9, t0, t6
    b       lbl_800C06B4
    sb      t9, 0x0019(s6)             # 00000079
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    lw      t8, 0x0018(s7)             # 00000018
    or      a1, s2, $zero              # a1 = 00000000
    andi    t1, v0, 0xFFFF             # t1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s7, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t8, t1
    b       lbl_800C06B4
    nop
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t4, s5,  2
    addu    t7, s7, t4
    lw      t2, 0x0038(t7)             # 00000038
    lb      t5, 0x0019(s6)             # 00000079
    addu    t3, t2, v0
    b       lbl_800C06B4
    sb      t5, 0x00C4(t3)             # 000000C4
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t0, s5,  2
    addu    t6, s7, t0
    lw      t9, 0x0038(t6)             # 00000038
    addu    t8, t9, v0
    lb      t1, 0x00C4(t8)             # 000000C4
    b       lbl_800C06B4
    sb      t1, 0x0019(s6)             # 00000079
lbl_800C12BC:
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C12C0:
    or      s1, s4, $zero              # s1 = 00000000
    addiu   s2, $zero, 0x0010          # s2 = 00000010
lbl_800C12C8:
    lw      a0, 0x0050(s1)             # 00000050
    beql    a0, $zero, lbl_800C12E0
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800BF394
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800C12E0:
    bne     s0, s2, lbl_800C12C8
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x003C($sp)
lbl_800C12EC:
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
    addiu   $sp, $sp, 0x0088           # $sp += 0x88


func_800C1318:
# MqDbg: AudioSeq_SequencePlayerProcessSequence
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      t6, 0x0000(a0)             # 00000000
    or      s2, a0, $zero              # s2 = 00000000
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    jal     func_800B6EE8
    lbu     a0, 0x0004(a0)             # 00000004
    beq     v0, $zero, lbl_800C1360
    nop
    jal     func_800B6E70
    lbu     a0, 0x0005(s2)             # 00000005
    bne     v0, $zero, lbl_800C1370
    addiu   a1, $zero, 0x0002          # a1 = 00000002
lbl_800C1360:
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800C1B10
    lw      $ra, 0x0024($sp)
lbl_800C1370:
    jal     func_800B7008
    lbu     a0, 0x0004(s2)             # 00000004
    lbu     a0, 0x0005(s2)             # 00000005
    jal     func_800B6FD8
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    lw      t8, 0x0000(s2)             # 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    sll     t0, t8,  2
    bgezl   t0, lbl_800C13AC
    lhu     t5, 0x000A(s2)             # 0000000A
    lbu     t1, 0x0003(s2)             # 00000003
    andi    t2, t1, 0x0080             # t2 = 00000000
    bnel    t2, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    lhu     t5, 0x000A(s2)             # 0000000A
lbl_800C13AC:
    lhu     t6, 0x0008(s2)             # 00000008
    lw      t3, 0x00E0(s2)             # 000000E0
    lh      t9, 0x000C(s2)             # 0000000C
    addu    t8, t5, t6
    sh      t8, 0x000A(s2)             # 0000000A
    addiu   t4, t3, 0x0001             # t4 = 00000001
    addu    t0, t8, t9
    sw      t4, 0x00E0(s2)             # 000000E0
    sh      t0, 0x000A(s2)             # 0000000A
    lh      a0, 0x7EC8(a0)             # 80127EC8
    andi    v0, t0, 0xFFFF             # v0 = 00000000
    slt     $at, v0, a0
    bnel    $at, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    lw      t3, 0x0000(s2)             # 00000000
    subu    t2, v0, a0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t4, t3,  6
    srl     t5, t4, 31
    beq     t5, $at, lbl_800C1B0C
    sh      t2, 0x000A(s2)             # 0000000A
    lhu     v0, 0x0010(s2)             # 00000010
    slti    $at, v0, 0x0002
    bne     $at, $zero, lbl_800C1418
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800C1AD8
    sh      t6, 0x0010(s2)             # 00000010
lbl_800C1418:
    lbu     t8, 0x0000(s2)             # 00000000
    addiu   s1, s2, 0x0078             # s1 = 00000078
    ori     t9, t8, 0x0004             # t9 = 00000004
    sb      t9, 0x0000(s2)             # 00000000
lbl_800C1428:
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000078
    slti    $at, v0, 0x00F2
    bne     $at, $zero, lbl_800C1488
    andi    s0, v0, 0x00FF             # s0 = 00000000
    or      a0, s1, $zero              # a0 = 00000078
    jal     func_800BE900
    andi    a1, s0, 0x00FF             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    or      a1, s1, $zero              # a1 = 00000078
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    or      a3, v0, $zero              # a3 = 00000000
    beq     v0, $zero, lbl_800C1428
    nop
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800C1480
    nop
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800C1ADC
    or      s1, s2, $zero              # s1 = 00000000
lbl_800C1480:
    b       lbl_800C1AD8
    sh      v0, 0x0010(s2)             # 00000010
lbl_800C1488:
    andi    v1, v0, 0x00FF             # v1 = 00000000
    slti    $at, v1, 0x00C0
    bne     $at, $zero, lbl_800C194C
    andi    v0, v1, 0x00F0             # v0 = 00000000
    addiu   t0, v1, 0xFF3C             # t0 = FFFFFF3C
    sltiu   $at, t0, 0x002E
    beq     $at, $zero, lbl_800C1428
    sll     t0, t0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t0
    lw      t0, -0x623C($at)           # 80109DC4
    jr      t0
    nop
    addiu   s0, s2, 0x009C             # s0 = 0000009C
    jal     func_800BD3C0
    or      a0, s0, $zero              # a0 = 0000009C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 0000009C
    jal     func_800BD520
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800C1428
    nop
    b       lbl_800C1428
    nop
    jal     func_800BD3C0
    addiu   a0, s2, 0x009C             # a0 = 0000009C
    b       lbl_800C1428
    nop
    sh      $zero, 0x000E(s2)          # 0000000E
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lh      t1, 0x000E(s2)             # 0000000E
    sll     t2, v0, 24
    sra     t3, t2, 24
    addu    t4, t1, t3
    b       lbl_800C1428
    sh      t4, 0x000E(s2)             # 0000000E
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t5, v0,  2
    subu    t5, t5, v0
    sll     t5, t5,  4
    sh      t5, 0x0008(s2)             # 00000008
    lui     a0, 0x8012                 # a0 = 80120000
    lh      a0, 0x7EC8(a0)             # 80127EC8
    andi    v1, t5, 0xFFFF             # v1 = 00000000
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    slt     $at, a0, v1
    beql    $at, $zero, lbl_800C1560
    sll     t6, v1, 16
    sh      a0, 0x0008(s2)             # 00000008
    andi    v1, a0, 0xFFFF             # v1 = 00000000
    sll     t6, v1, 16
lbl_800C1560:
    sra     t7, t6, 16
    bgtz    t7, lbl_800C1428
    nop
    b       lbl_800C1428
    sh      t8, 0x0008(s2)             # 00000008
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t9, v0, 24
    sra     t0, t9, 24
    sll     t2, t0,  2
    subu    t2, t2, t0
    sll     t2, t2,  4
    b       lbl_800C1428
    sh      t2, 0x000C(s2)             # 0000000C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    beq     s0, $zero, lbl_800C15D0
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a0, $at, lbl_800C15D0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a0, $at, lbl_800C15EC
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    b       lbl_800C1428
    nop
lbl_800C15D0:
    lbu     t1, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t1, $at, lbl_800C1428
    nop
    sh      v0, 0x0014(s2)             # 00000014
    b       lbl_800C1428
    sb      s0, 0x0001(s2)             # 00000001
lbl_800C15EC:
    mtc1    t3, $f10                   # $f10 = 0.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    lwc1    $f6, 0x001C(s2)            # 0000001C
    cvt.s.w $f16, $f10
    sh      v0, 0x0012(s2)             # 00000012
    sb      s0, 0x0001(s2)             # 00000001
    sub.s   $f8, $f4, $f6
    div.s   $f18, $f8, $f16
    b       lbl_800C1428
    swc1    $f18, 0x0020(s2)           # 00000020
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lbu     v1, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v1, $zero, lbl_800C1654
    lhu     v1, 0x0014(s2)             # 00000014
    beq     v1, $at, lbl_800C1644
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v1, $at, lbl_800C1428
    nop
    b       lbl_800C1428
    nop
lbl_800C1644:
    mtc1    $zero, $f4                 # $f4 = 0.00
    sb      $zero, 0x0001(s2)          # 00000001
    swc1    $f4, 0x001C(s2)            # 0000001C
    lhu     v1, 0x0014(s2)             # 00000014
lbl_800C1654:
    beq     v1, $zero, lbl_800C1690
    sh      v1, 0x0012(s2)             # 00000012
    mtc1    v0, $f6                    # $f6 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    cvt.s.w $f10, $f6
    andi    t4, v1, 0xFFFF             # t4 = 00000000
    mtc1    t4, $f6                    # $f6 = 0.00
    lwc1    $f18, 0x001C(s2)           # 0000001C
    div.s   $f16, $f10, $f8
    cvt.s.w $f10, $f6
    sub.s   $f4, $f16, $f18
    div.s   $f8, $f4, $f10
    b       lbl_800C1428
    swc1    $f8, 0x0020(s2)            # 00000020
lbl_800C1690:
    mtc1    v0, $f16                   # $f16 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f6                   # $f6 = 127.00
    cvt.s.w $f18, $f16
    div.s   $f4, $f18, $f6
    b       lbl_800C1428
    swc1    $f4, 0x001C(s2)            # 0000001C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t5, v0, 24
    sra     t6, t5, 24
    mtc1    t6, $f10                   # $f10 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f16                  # $f16 = 127.00
    cvt.s.w $f8, $f10
    div.s   $f18, $f8, $f16
    b       lbl_800C1428
    swc1    $f18, 0x002C(s2)           # 0000002C
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BEEF4
    andi    a1, v0, 0xFFFF             # a1 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t7, v0, 24
    sra     t8, t7, 24
    mtc1    t8, $f6                    # $f6 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    cvt.s.w $f4, $f6
    div.s   $f8, $f4, $f10
    b       lbl_800C1428
    swc1    $f8, 0x0028(s2)            # 00000028
    lbu     t0, 0x0000(s2)             # 00000000
    ori     t2, t0, 0x0020             # t2 = 00000020
    b       lbl_800C1428
    sb      t2, 0x0000(s2)             # 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0003(s2)             # 00000003
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t1, 0x0018(s2)             # 00000018
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    addiu   $at, $zero, 0x00D2         # $at = 000000D2
    bne     s0, $at, lbl_800C1774
    addu    v1, t1, t3
    b       lbl_800C1428
    sw      v1, 0x0094(s2)             # 00000094
lbl_800C1774:
    b       lbl_800C1428
    sw      v1, 0x0098(s2)             # 00000098
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0002(s2)             # 00000002
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    bne     v0, $zero, lbl_800C17B0
    lui     t7, 0x8012                 # t7 = 80120000
    lui     t4, 0x8012                 # t4 = 80120000
    lw      t4, 0x7FAC(t4)             # 80127FAC
    srl     t6, t4,  2
    b       lbl_800C1428
    sb      t6, 0x0019(s1)             # 00000019
lbl_800C17B0:
    lw      t7, 0x7FAC(t7)             # 80127FAC
    andi    t9, v0, 0x00FF             # t9 = 00000000
    srl     t8, t7,  2
    divu    $zero, t8, t9
    mfhi    t0
    sb      t0, 0x0019(s1)             # 00000019
    bne     t9, $zero, lbl_800C17D4
    nop
    break   # 0x01C00
lbl_800C17D4:
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lb      a1, 0x0019(s1)             # 00000019
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     a1, $at, lbl_800C1428
    nop
    lbu     a2, 0x0018(s1)             # 00000018
    addiu   $at, $zero, 0x0003         # $at = 00000003
    andi    t2, v0, 0xFFFF             # t2 = 00000000
    beq     a2, $at, lbl_800C1428
    sll     t1, a1,  1
    lw      t5, 0x0000(s1)             # 00000000
    sll     t6, a2,  2
    lw      t4, 0x0018(s2)             # 00000018
    addu    t7, s1, t6
    sw      t5, 0x0004(t7)             # 00000004
    lbu     t8, 0x0018(s1)             # 00000018
    addu    t3, t2, t1
    addu    v0, t4, t3
    addiu   t9, t8, 0x0001             # t9 = 00000001
    sb      t9, 0x0018(s1)             # 00000018
    lbu     t2, 0x0000(v0)             # 00000000
    lbu     t0, 0x0001(v0)             # 00000001
    lw      t4, 0x0018(s2)             # 00000018
    sll     t1, t2,  8
    addu    v1, t0, t1
    andi    v1, v1, 0xFFFF             # v1 = 00000000
    addu    t3, t4, v1
    b       lbl_800C1428
    sw      t3, 0x0000(s1)             # 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lb      t6, 0x0019(s1)             # 00000019
    and     t5, t6, v0
    b       lbl_800C1428
    sb      t5, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lb      t7, 0x0019(s1)             # 00000019
    subu    t8, t7, v0
    b       lbl_800C1428
    sb      t8, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t9, 0x0018(s2)             # 00000018
    lbu     t0, 0x0019(s1)             # 00000019
    andi    t2, v0, 0xFFFF             # t2 = 00000000
    addu    a1, t9, t2
    addu    t1, t0, s0
    b       lbl_800C1428
    sb      t1, 0x0000(a1)             # 00000000
    lbu     t3, 0x0000(s2)             # 00000000
    ori     t6, t3, 0x0002             # t6 = 00000002
    b       lbl_800C1B0C
    sb      t6, 0x0000(s2)             # 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    andi    t5, v0, 0xFFFF             # t5 = 00000000
    b       lbl_800C1428
    sw      t5, 0x00E0(s2)             # 000000E0
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     v0, $at, lbl_800C1918
    andi    s0, v0, 0x00FF             # s0 = 00000000
    lbu     s0, 0x0007(s2)             # 00000007
lbl_800C1918:
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B7694
    sw      s0, 0x002C($sp)
    lw      a0, 0x002C($sp)
    lbu     t7, 0x0007(s2)             # 00000007
    bne     t7, a0, lbl_800C1428
    nop
    b       lbl_800C1B10
    lw      $ra, 0x0024($sp)
lbl_800C194C:
    andi    a0, v1, 0x000F             # a0 = 00000000
    blez    v0, lbl_800C197C
    sb      a0, 0x0066($sp)
    addiu   t8, v0, 0xFFC0             # t8 = FFFFFFC0
    sltiu   $at, t8, 0x0071
    beq     $at, $zero, lbl_800C1428
    sll     t8, t8,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t8
    lw      t8, -0x6184($at)           # 80109E7C
    jr      t8
    nop
lbl_800C197C:
    bne     v0, $zero, lbl_800C1428
    andi    t9, a0, 0x00FF             # t9 = 00000000
    sll     t2, t9,  2
    addu    t0, s2, t2
    lw      t1, 0x0038(t0)             # 00000038
    lw      t4, 0x0000(t1)             # 00000000
    srl     t3, t4, 31
    xori    t6, t3, 0x0001             # t6 = 00000001
    b       lbl_800C1428
    sb      t6, 0x0019(s1)             # 00000019
    andi    t7, a0, 0x00FF             # t7 = 00000000
    addu    t8, s2, t7
    lb      t9, 0x0158(t8)             # 00000118
    lb      t5, 0x0019(s1)             # 00000019
    subu    t2, t5, t9
    b       lbl_800C1428
    sb      t2, 0x0019(s1)             # 00000019
    lb      t0, 0x0019(s1)             # 00000019
    andi    t1, a0, 0x00FF             # t1 = 00000000
    addu    t4, s2, t1
    b       lbl_800C1428
    sb      t0, 0x0158(t4)             # 00000158
    andi    v0, a0, 0x00FF             # v0 = 00000000
    addu    v1, s2, v0
    lb      t3, 0x0158(v1)             # 00000158
    slti    $at, v0, 0x0002
    beq     $at, $zero, lbl_800C1428
    sb      t3, 0x0019(s1)             # 00000019
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    b       lbl_800C1428
    sb      t6, 0x0158(v1)             # 00000158
    andi    t8, s0, 0x000F             # t8 = 00000000
    sll     t5, t8,  2
    addu    t9, s2, t5
    jal     func_800BEE88
    lw      a0, 0x0038(t9)             # 00000038
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t2, 0x0018(s2)             # 00000018
    or      a1, s0, $zero              # a1 = 00000000
    andi    t1, v0, 0xFFFF             # t1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t2, t1
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t0, 0x0000(s1)             # 00000000
    or      a1, s0, $zero              # a1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t0, v0
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lbu     t6, 0x0066($sp)
    lw      t4, 0x0018(s2)             # 00000018
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    addu    a2, s2, t6
    addiu   a2, a2, 0x0158             # a2 = 00000158
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800B8ECC
    addu    a1, t4, t3
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      s0, v0, $zero              # s0 = 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lbu     t7, 0x0066($sp)
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
    addu    a2, s2, t7
    jal     func_800BA4AC
    addiu   a2, a2, 0x0158             # a2 = 00000158
    b       lbl_800C1428
    nop
lbl_800C1AD8:
    or      s1, s2, $zero              # s1 = 00000000
lbl_800C1ADC:
    addiu   s2, $zero, 0x0040          # s2 = 00000040
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C1AE4:
    lw      a0, 0x0038(s1)             # 00000038
    lw      t8, 0x0000(a0)             # 00000000
    srl     t5, t8, 31
    beql    t5, $zero, lbl_800C1B04
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800C0628
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800C1B04:
    bne     s0, s2, lbl_800C1AE4
    addiu   s1, s1, 0x0004             # s1 = 00000004
lbl_800C1B0C:
    lw      $ra, 0x0024($sp)
lbl_800C1B10:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068           # $sp += 0x68


func_800C1B24:
# MqDbg: AudioSeq_ProcessSequences
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lh      t6, 0x2854(v1)             # 80127E84
    lw      t9, 0x2894(v1)             # 80127EC4
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    subu    t7, t6, a0
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    multu   t8, t9
    lh      v0, 0x285C(v1)             # 80127E8C
    sw      s1, 0x0018($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    lui     s1, 0x8012                 # s1 = 80120000
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0014($sp)
    addiu   s1, s1, 0x5630             # s1 = 80125630
    or      s2, $zero, $zero           # s2 = 00000000
    mflo    t0
    sw      t0, 0x5B84(v1)             # 8012B1B4
    beq     v0, $zero, lbl_800C1BB4
    addiu   s3, $zero, 0x0001          # s3 = 00000001
lbl_800C1B78:
    lw      t1, 0x3530(s1)             # 80128B60
    addiu   s0, s1, 0x3530             # s0 = 80128B60
    srl     t2, t1, 31
    bnel    s3, t2, lbl_800C1BA8
    addiu   s2, s2, 0x0001             # s2 = 00000001
    jal     func_800C1318
    or      a0, s0, $zero              # a0 = 80128B60
    jal     func_800BE048
    or      a0, s0, $zero              # a0 = 80128B60
    lui     v0, 0x8012                 # v0 = 80120000
    lh      v0, 0x7E8C(v0)             # 80127E8C
    addiu   s2, s2, 0x0001             # s2 = 00000002
lbl_800C1BA8:
    sltu    $at, s2, v0
    bne     $at, $zero, lbl_800C1B78
    addiu   s1, s1, 0x0160             # s1 = 80125790
lbl_800C1BB4:
    jal     func_800BC54C
    nop
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C1BD8:
# MqDbg: AudioSeq_SkipForwardSequence
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      t6, 0x00DC(a0)             # 000000DC
    or      s0, a0, $zero              # s0 = 00000000
    blezl   t6, lbl_800C1C18
    lw      $ra, 0x001C($sp)
lbl_800C1BF4:
    jal     func_800C1318
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BE048
    or      a0, s0, $zero              # a0 = 00000000
    lw      t7, 0x00DC(s0)             # 000000DC
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    bgtz    t8, lbl_800C1BF4
    sw      t8, 0x00DC(s0)             # 000000DC
    lw      $ra, 0x001C($sp)
lbl_800C1C18:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C1C28:
# MqDbg: AudioSeq_ResetSequencePlayer
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    jal     func_800BF12C
    sw      a0, 0x0028($sp)
    lw      s1, 0x0028($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    mtc1    $zero, $f0                 # $f0 = 0.00
    lbu     t6, 0x0000(s1)             # 00000000
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f6                   # $f6 = 0.50
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   t9, $zero, 0x1680          # t9 = 00001680
    addiu   t0, t0, 0x0DC4             # t0 = 80100DC4
    addiu   t1, t1, 0x0DD4             # t1 = 80100DD4
    andi    t7, t6, 0xFFFD             # t7 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s2, $zero, 0x0040          # s2 = 00000040
    sb      t7, 0x0000(s1)             # 00000000
    sh      $zero, 0x0010(s1)          # 00000010
    sb      t8, 0x0001(s1)             # 00000001
    sh      $zero, 0x0012(s1)          # 00000012
    sh      $zero, 0x0014(s1)          # 00000014
    sh      $zero, 0x000A(s1)          # 0000000A
    sh      t9, 0x0008(s1)             # 00000008
    sh      $zero, 0x000C(s1)          # 0000000C
    sh      $zero, 0x000E(s1)          # 0000000E
    sb      $zero, 0x0002(s1)          # 00000002
    sw      t0, 0x0094(s1)             # 00000094
    sw      t1, 0x0098(s1)             # 00000098
    sw      $zero, 0x00E0(s1)          # 000000E0
    swc1    $f4, 0x001C(s1)            # 0000001C
    swc1    $f0, 0x0020(s1)            # 00000020
    swc1    $f0, 0x0024(s1)            # 00000024
    swc1    $f6, 0x0028(s1)            # 00000028
lbl_800C1CC8:
    jal     func_800BEB44
    lw      a0, 0x0038(s1)             # 00000038
    addiu   s0, s0, 0x0004             # s0 = 00000004
    bne     s0, s2, lbl_800C1CC8
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C1CF4:
# MqDbg: AudioSeq_InitSequencePlayerChannels
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  5
    lui     t8, 0x8012                 # t8 = 80120000
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    addiu   t8, t8, 0x5630             # t8 = 80125630
    addiu   t7, t6, 0x3530             # t7 = 00003530
    sw      s5, 0x0028($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addu    s2, t7, t8
    lui     s3, 0x8012                 # s3 = 80120000
    lui     s4, 0x8013                 # s4 = 80130000
    sw      $ra, 0x002C($sp)
    addiu   s4, s4, 0xB0E0             # s4 = 8012B0E0
    addiu   s3, s3, 0x7FF0             # s3 = 80127FF0
    or      s0, s2, $zero              # s0 = 00000000
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s5, $zero, 0x0040          # s5 = 00000040
lbl_800C1D54:
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3940
    addiu   a1, $zero, 0x00D4          # a1 = 000000D4
    bne     v0, $zero, lbl_800C1D70
    sw      v0, 0x0038(s0)             # 00000038
    b       lbl_800C1D94
    sw      s4, 0x0038(s0)             # 00000038
lbl_800C1D70:
    lw      v1, 0x0038(s0)             # 00000038
    lbu     t9, 0x0000(v1)             # 00000000
    sw      s2, 0x004C(v1)             # 0000004C
    sw      $zero, 0x0054(v1)          # 00000054
    andi    t0, t9, 0xFF7F             # t0 = 00000000
    sb      t0, 0x0000(v1)             # 00000000
    sw      $zero, 0x0058(v1)          # 00000058
    sw      $zero, 0x005C(v1)          # 0000005C
    sw      $zero, 0x0050(v1)          # 00000050
lbl_800C1D94:
    jal     func_800BEB44
    lw      a0, 0x0038(s0)             # 00000038
    addiu   s1, s1, 0x0004             # s1 = 00000004
    bne     s1, s5, lbl_800C1D54
    addiu   s0, s0, 0x0004             # s0 = 00000004
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C1DCC:
# MqDbg: AudioSeq_InitSequencePlayer
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a0, $zero              # a2 = 00000000
    or      v1, a0, $zero              # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    sw      $ra, 0x0014($sp)
    addiu   v0, v0, 0xB0E0             # v0 = 8012B0E0
    addiu   a0, $zero, 0x0010          # a0 = 00000010
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C1DEC:
    addiu   a1, a1, 0x0004             # a1 = 00000004
    sw      v0, 0x003C(v1)             # 0000003C
    sw      v0, 0x0040(v1)             # 00000040
    sw      v0, 0x0044(v1)             # 00000044
    addiu   v1, v1, 0x0010             # v1 = 00000010
    bne     a1, a0, lbl_800C1DEC
    sw      v0, 0x0028(v1)             # 00000038
    lbu     t6, 0x0000(a2)             # 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    or      v1, a2, $zero              # v1 = 00000000
    andi    t8, t6, 0xFF7F             # t8 = 00000000
    andi    t0, t8, 0x00DF             # t0 = 00000000
    sb      t8, 0x0000(a2)             # 00000000
    andi    t2, t0, 0x00F7             # t2 = 00000000
    sb      t0, 0x0000(a2)             # 00000000
    andi    t4, t2, 0x00EF             # t4 = 00000000
    sb      t2, 0x0000(a2)             # 00000000
    sb      t4, 0x0000(a2)             # 00000000
    andi    t5, t4, 0x00FE             # t5 = 00000000
    sb      t5, 0x0000(a2)             # 00000000
    addiu   a1, $zero, 0x0008          # a1 = 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800C1E44:
    addiu   a0, a0, 0x0004             # a0 = 00000004
    sb      v0, 0x0159(v1)             # 00000159
    sb      v0, 0x015A(v1)             # 0000015A
    sb      v0, 0x015B(v1)             # 0000015B
    addiu   v1, v1, 0x0004             # v1 = 00000004
    bne     a0, a1, lbl_800C1E44
    sb      v0, 0x0154(v1)             # 00000158
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   t6, $zero, 0x0060          # t6 = 00000060
    sb      t6, 0x0003(a2)             # 00000003
    swc1    $f0, 0x002C(a2)            # 0000002C
    swc1    $f0, 0x0034(a2)            # 00000034
    sw      a2, 0x0018($sp)
    jal     func_800BD2CC
    addiu   a0, a2, 0x009C             # a0 = 0000009C
    jal     func_800C1C28
    lw      a0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C1E9C:
# MqDbg: AudioSeq_InitSequencePlayers
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s1, 0x0018($sp)
    jal     func_800BF268
    sw      s0, 0x0014($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x7630             # v1 = 80127630
    addiu   v0, v0, 0x5630             # v0 = 80125630
lbl_800C1EC0:
    lbu     t6, 0x3AB0(v0)             # 801290E0
    addiu   v0, v0, 0x0080             # v0 = 801256B0
    sltu    $at, v0, v1
    andi    t7, t6, 0xFF7F             # t7 = 00000000
    sw      $zero, 0x3A80(v0)          # 80129130
    bne     $at, $zero, lbl_800C1EC0
    sb      t7, 0x3A30(v0)             # 801290E0
    lui     s0, 0x8013                 # s0 = 80130000
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0x90E0             # s1 = 801290E0
    addiu   s0, s0, 0x8B60             # s0 = 80128B60
lbl_800C1EEC:
    jal     func_800C1DCC
    or      a0, s0, $zero              # a0 = 80128B60
    addiu   s0, s0, 0x0160             # s0 = 80128CC0
    bne     s0, s1, lbl_800C1EEC
    nop
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    nop
    nop
    nop
