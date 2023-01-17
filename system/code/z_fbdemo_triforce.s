# Transition System: Triforce (Unused)
#
# Starts at VRAM: 800981E0 / VROM: B0E140
#

.section .text
func_800981E0:
# MqDbg: TransitionTriforce_Start
    lw      v0, 0x000C(a0)             # 0000000C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800981F4
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_80098204
lbl_800981F4:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    jr      $ra
    swc1    $f4, 0x0004(a0)            # 00000004
lbl_80098204:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x73A0($at)          # 80108C60
    swc1    $f6, 0x0004(a0)            # 00000004
    jr      $ra
    nop


func_80098218:
# MqDbg: TransitionTriforce_Init
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s0, 0x0028($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x002C($sp)
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x01E0          # a1 = 000001E0
    lui     $at, 0x42F0                # $at = 42F00000
    mtc1    $at, $f4                   # $f4 = 120.00
    lui     $at, 0xC47A                # $at = C47A0000
    mtc1    $at, $f6                   # $f6 = -1000.00
    lui     $at, 0x447A                # $at = 447A0000
    mtc1    $at, $f8                   # $f8 = 1000.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    addiu   a0, s0, 0x0018             # a0 = 00000018
    lui     a1, 0xC320                 # a1 = C3200000
    lui     a2, 0x4320                 # a2 = 43200000
    lui     a3, 0xC2F0                 # a3 = C2F00000
    swc1    $f4, 0x0010($sp)
    swc1    $f6, 0x0014($sp)
    swc1    $f8, 0x0018($sp)
    jal     func_800D2C64
    swc1    $f10, 0x001C($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f16                  # $f16 = 1.00
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    sw      t6, 0x000C(s0)             # 0000000C
    lui     $at, 0x8011                # $at = 80110000
    swc1    $f16, 0x0004(s0)           # 00000004
    lwc1    $f18, -0x739C($at)         # 80108C64
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sw      t7, 0x0010(s0)             # 00000010
    or      v0, s0, $zero              # v0 = 00000000
    swc1    $f18, 0x0008(s0)           # 00000008
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0028($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800982B8:
# MqDbg: TransitionTriforce_Destroy
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_800982C4:
# MqDbg: TransitionTriforce_Update
    blez    a1, lbl_800983D0
    or      v0, a1, $zero              # v0 = 00000000
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f12, -0x7398($at)         # 80108C68
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    addiu   t0, $zero, 0x0004          # t0 = 00000004
    addiu   a3, $zero, 0x0003          # a3 = 00000003
    addiu   a2, $zero, 0x0002          # a2 = 00000002
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      v1, 0x000C(a0)             # 0000000C
lbl_800982F0:
    addiu   v0, v0, 0xFFFF             # v0 = FFFFFFFF
    bne     a1, v1, lbl_8009832C
    nop
    lwc1    $f6, 0x0008(a0)            # 00000008
    lwc1    $f4, 0x0004(a0)            # 00000004
    sub.s   $f8, $f2, $f6
    mul.s   $f0, $f4, $f8
    c.lt.s  $f0, $f12
    nop
    bc1f    lbl_80098324
    nop
    b       lbl_800983C8
    swc1    $f12, 0x0004(a0)           # 00000004
lbl_80098324:
    b       lbl_800983C8
    swc1    $f0, 0x0004(a0)            # 00000004
lbl_8009832C:
    bne     a2, v1, lbl_80098360
    nop
    lwc1    $f10, 0x0004(a0)           # 00000004
    lwc1    $f16, 0x0008(a0)           # 00000008
    sub.s   $f0, $f10, $f16
    c.lt.s  $f0, $f12
    nop
    bc1f    lbl_80098358
    nop
    b       lbl_800983C8
    swc1    $f12, 0x0004(a0)           # 00000004
lbl_80098358:
    b       lbl_800983C8
    swc1    $f0, 0x0004(a0)            # 00000004
lbl_80098360:
    bne     a3, v1, lbl_80098398
    nop
    lwc1    $f6, 0x0008(a0)            # 00000008
    lwc1    $f18, 0x0004(a0)           # 00000004
    sub.s   $f4, $f2, $f6
    div.s   $f0, $f18, $f4
    c.lt.s  $f2, $f0
    nop
    bc1f    lbl_80098390
    nop
    b       lbl_800983C8
    swc1    $f2, 0x0004(a0)            # 00000004
lbl_80098390:
    b       lbl_800983C8
    swc1    $f0, 0x0004(a0)            # 00000004
lbl_80098398:
    bne     t0, v1, lbl_800983C8
    nop
    lwc1    $f8, 0x0004(a0)            # 00000004
    lwc1    $f10, 0x0008(a0)           # 00000008
    add.s   $f0, $f8, $f10
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_800983C8
    swc1    $f0, 0x0004(a0)            # 00000004
    b       lbl_800983C8
    swc1    $f2, 0x0004(a0)            # 00000004
    swc1    $f0, 0x0004(a0)            # 00000004
lbl_800983C8:
    bnel    v0, $zero, lbl_800982F0
    lw      v1, 0x000C(a0)             # 0000000C
lbl_800983D0:
    jr      $ra
    nop


func_800983D8:
# MqDbg: TransitionTriforce_SetColor
    sw      a1, 0x0000(a0)             # 00000000
    jr      $ra
    nop


func_800983E4:
# MqDbg: TransitionTriforce_SetType
    sw      a1, 0x0010(a0)             # 00000010
    jr      $ra
    nop


func_800983F0:
# MqDbg: TransitionTriforce_SetState
    sw      a1, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800983FC:
# MqDbg: TransitionTriforce_Draw
    addiu   $sp, $sp, 0xFF68           # $sp -= 0x98
    sw      s1, 0x0024($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s0, 0x0020($sp)
    sw      a1, 0x009C($sp)
    lui     $at, 0x43B4                # $at = 43B40000
    mtc1    $at, $f4                   # $f4 = 360.00
    lwc1    $f0, 0x0004(s1)            # 00000004
    lw      t6, 0x009C($sp)
    lui     $at, 0x3F20                # $at = 3F200000
    mul.s   $f6, $f0, $f4
    mtc1    $at, $f8                   # $f8 = 0.63
    lw      s0, 0x0000(t6)             # 00000000
    lui     a3, 0x3F80                 # a3 = 3F800000
    mul.s   $f2, $f0, $f8
    swc1    $f6, 0x0080($sp)
    lw      v0, 0x0058(s1)             # 00000058
    sll     t7, v0,  2
    subu    t7, t7, v0
    sll     t7, t7,  6
    addu    s2, s1, t7
    addiu   s2, s2, 0x0060             # s2 = 00000060
    mfc1    a1, $f2
    mfc1    a2, $f2
    xori    t8, v0, 0x0001             # t8 = 00000001
    sw      t8, 0x0058(s1)             # 00000058
    jal     func_800CF424
    or      a0, s2, $zero              # a0 = 00000060
    mtc1    $zero, $f0                 # $f0 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    addiu   a0, s2, 0x0040             # a0 = 000000A0
    mfc1    a2, $f0
    mfc1    a3, $f0
    sw      a0, 0x0034($sp)
    lw      a1, 0x0080($sp)
    jal     func_800D28A4
    swc1    $f10, 0x0010($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   a0, s2, 0x0080             # a0 = 000000E0
    sw      a0, 0x0030($sp)
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_800D3338
    nop
    or      v0, s0, $zero              # v0 = 00000000
    lui     t9, 0xE700                 # t9 = E7000000
    sw      t9, 0x0000(v0)             # 00000000
    sw      $zero, 0x0004(v0)          # 00000004
    addiu   s0, s0, 0x0008             # s0 = 00000008
    or      v1, s0, $zero              # v1 = 00000008
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0xC5D0             # t1 = 800FC5D0
    lui     t0, 0xDE00                 # t0 = DE000000
    sw      t0, 0x0000(v1)             # 00000008
    sw      t1, 0x0004(v1)             # 0000000C
    addiu   s0, s0, 0x0008             # s0 = 00000010
    or      a0, s0, $zero              # a0 = 00000010
    lui     t2, 0xFA00                 # t2 = FA000000
    sw      t2, 0x0000(a0)             # 00000010
    lw      t3, 0x0000(s1)             # 00000000
    addiu   s0, s0, 0x0008             # s0 = 00000018
    or      a1, s0, $zero              # a1 = 00000018
    sw      t3, 0x0004(a0)             # 00000014
    lui     t4, 0xFCFF                 # t4 = FCFF0000
    lui     t5, 0xFFFD                 # t5 = FFFD0000
    ori     t5, t5, 0xF6FB             # t5 = FFFDF6FB
    ori     t4, t4, 0xFFFF             # t4 = FCFFFFFF
    sw      t4, 0x0000(a1)             # 00000018
    sw      t5, 0x0004(a1)             # 0000001C
    addiu   s0, s0, 0x0008             # s0 = 00000020
    or      a2, s0, $zero              # a2 = 00000020
    lui     t6, 0xDA38                 # t6 = DA380000
    ori     t6, t6, 0x0007             # t6 = DA380007
    lui     a3, 0xDA38                 # a3 = DA380000
    addiu   t7, s1, 0x0018             # t7 = 00000018
    sw      t7, 0x0004(a2)             # 00000024
    ori     a3, a3, 0x0001             # a3 = DA380001
    sw      t6, 0x0000(a2)             # 00000020
    addiu   s0, s0, 0x0008             # s0 = 00000028
    or      v0, s0, $zero              # v0 = 00000028
    lui     t8, 0xDA38                 # t8 = DA380000
    ori     t8, t8, 0x0003             # t8 = DA380003
    sw      t8, 0x0000(v0)             # 00000028
    sw      s2, 0x0004(v0)             # 0000002C
    addiu   s0, s0, 0x0008             # s0 = 00000030
    or      v1, s0, $zero              # v1 = 00000030
    sw      a3, 0x0000(v1)             # 00000030
    lw      t9, 0x0034($sp)
    addiu   s0, s0, 0x0008             # s0 = 00000038
    or      a0, s0, $zero              # a0 = 00000038
    sw      t9, 0x0004(v1)             # 00000034
    sw      a3, 0x0000(a0)             # 00000038
    lw      t0, 0x0030($sp)
    addiu   s0, s0, 0x0008             # s0 = 00000040
    or      a1, s0, $zero              # a1 = 00000040
    sw      t0, 0x0004(a0)             # 0000003C
    lui     t1, 0x0100                 # t1 = 01000000
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   t2, t2, 0xC600             # t2 = 800FC600
    ori     t1, t1, 0xA014             # t1 = 0100A014
    sw      t1, 0x0000(a1)             # 00000040
    sw      t2, 0x0004(a1)             # 00000044
    addiu   s0, s0, 0x0008             # s0 = 00000048
    jal     func_80098700
    or      a0, s1, $zero              # a0 = 00000000
    bnel    v0, $zero, lbl_8009869C
    lw      v0, 0x0010(s1)             # 00000010
    lw      v0, 0x0010(s1)             # 00000010
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     t3, 0x0600                 # t3 = 06000000
    beq     v0, $at, lbl_800985E0
    ori     t3, t3, 0x080A             # t3 = 0600080A
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_80098618
    lui     t6, 0x0606                 # t6 = 06060000
    b       lbl_800986D0
    or      v0, s0, $zero              # v0 = 00000048
lbl_800985E0:
    or      v0, s0, $zero              # v0 = 00000048
    lui     t4, 0x0008                 # t4 = 00080000
    ori     t4, t4, 0x0206             # t4 = 00080206
    sw      t4, 0x0004(v0)             # 0000004C
    sw      t3, 0x0000(v0)             # 00000048
    addiu   s0, s0, 0x0008             # s0 = 00000050
    or      v1, s0, $zero              # v1 = 00000050
    lui     t5, 0x050A                 # t5 = 050A0000
    ori     t5, t5, 0x0604             # t5 = 050A0604
    sw      t5, 0x0000(v1)             # 00000050
    sw      $zero, 0x0004(v1)          # 00000054
    addiu   s0, s0, 0x0008             # s0 = 00000058
    b       lbl_800986D0
    or      v0, s0, $zero              # v0 = 00000058
lbl_80098618:
    or      v0, s0, $zero              # v0 = 00000058
    ori     t6, t6, 0x080A             # t6 = 0606080A
    addiu   t7, $zero, 0x040C          # t7 = 0000040C
    sw      t7, 0x0004(v0)             # 0000005C
    sw      t6, 0x0000(v0)             # 00000058
    addiu   s0, s0, 0x0008             # s0 = 00000060
    or      v1, s0, $zero              # v1 = 00000060
    lui     t8, 0x0600                 # t8 = 06000000
    lui     t9, 0x0002                 # t9 = 00020000
    ori     t9, t9, 0x000E             # t9 = 0002000E
    ori     t8, t8, 0x0C0E             # t8 = 06000C0E
    sw      t8, 0x0000(v1)             # 00000060
    sw      t9, 0x0004(v1)             # 00000064
    addiu   s0, s0, 0x0008             # s0 = 00000068
    or      a0, s0, $zero              # a0 = 00000068
    lui     t0, 0x0602                 # t0 = 06020000
    lui     t1, 0x0002                 # t1 = 00020000
    ori     t1, t1, 0x1012             # t1 = 00021012
    ori     t0, t0, 0x0E10             # t0 = 06020E10
    sw      t0, 0x0000(a0)             # 00000068
    sw      t1, 0x0004(a0)             # 0000006C
    addiu   s0, s0, 0x0008             # s0 = 00000070
    or      a1, s0, $zero              # a1 = 00000070
    lui     t2, 0x0602                 # t2 = 06020000
    lui     t3, 0x0004                 # t3 = 00040000
    ori     t3, t3, 0x120C             # t3 = 0004120C
    ori     t2, t2, 0x1204             # t2 = 06021204
    sw      t2, 0x0000(a1)             # 00000070
    sw      t3, 0x0004(a1)             # 00000074
    addiu   s0, s0, 0x0008             # s0 = 00000078
    b       lbl_800986D0
    or      v0, s0, $zero              # v0 = 00000078
    lw      v0, 0x0010(s1)             # 00000010
lbl_8009869C:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800986CC
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_800986CC
    lui     t4, 0x070C                 # t4 = 070C0000
    or      v0, s0, $zero              # v0 = 00000078
    lui     t5, 0x000C                 # t5 = 000C0000
    ori     t5, t5, 0x1012             # t5 = 000C1012
    ori     t4, t4, 0x0E10             # t4 = 070C0E10
    sw      t4, 0x0000(v0)             # 00000078
    sw      t5, 0x0004(v0)             # 0000007C
    addiu   s0, s0, 0x0008             # s0 = 00000080
lbl_800986CC:
    or      v0, s0, $zero              # v0 = 00000080
lbl_800986D0:
    lui     t6, 0xE700                 # t6 = E7000000
    sw      t6, 0x0000(v0)             # 00000080
    sw      $zero, 0x0004(v0)          # 00000084
    addiu   s0, s0, 0x0008             # s0 = 00000088
    lw      t7, 0x009C($sp)
    sw      s0, 0x0000(t7)             # 0000040C
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0098           # $sp += 0x98


func_80098700:
# MqDbg: TransitionTriforce_IsDone
    lw      v0, 0x000C(a0)             # 0000000C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_80098714
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_80098740
lbl_80098714:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x7394($at)          # 80108C6C
    lwc1    $f6, 0x0004(a0)            # 00000004
    or      v0, $zero, $zero           # v0 = 00000000
    c.le.s  $f6, $f4
    nop
    bc1f    lbl_80098738
    nop
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_80098738:
    jr      $ra
    nop
lbl_80098740:
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_80098750
    addiu   $at, $zero, 0x0004         # $at = 00000004
    bne     v0, $at, lbl_8009877C
lbl_80098750:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    lwc1    $f8, 0x0004(a0)            # 00000004
    or      v0, $zero, $zero           # v0 = 00000000
    c.le.s  $f10, $f8
    nop
    bc1f    lbl_80098774
    nop
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_80098774:
    jr      $ra
    nop
lbl_8009877C:
    or      v0, $zero, $zero           # v0 = 00000000
    jr      $ra
    nop
    nop
    nop