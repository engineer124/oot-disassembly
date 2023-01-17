# Transition System: Wiping
#
# Starts at VRAM: 80098790 / VROM: ??????
#

.section .text
func_80098790:
# MqDbg: TransitionWipe_Start
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s0, 0x0030($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0034($sp)
    lbu     t6, 0x0008(s0)             # 00000008
    sb      $zero, 0x000A(s0)          # 0000000A
    addiu   a0, s0, 0x0018             # a0 = 00000018
    beq     t6, $zero, lbl_800987C0
    addiu   a1, s0, 0x0010             # a1 = 00000010
    addiu   t7, $zero, 0x014D          # t7 = 0000014D
    b       lbl_800987C8
    sh      t7, 0x000E(s0)             # 0000000E
lbl_800987C0:
    addiu   t8, $zero, 0x0264          # t8 = 00000264
    sh      t8, 0x000E(s0)             # 0000000E
lbl_800987C8:
    lui     $at, 0x4120                # $at = 41200000
    mtc1    $at, $f4                   # $f4 = 10.00
    lui     $at, 0x4648                # $at = 46480000
    mtc1    $at, $f6                   # $f6 = 12800.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    lui     a3, 0x3FAA                 # a3 = 3FAA0000
    ori     a3, a3, 0xAAAB             # a3 = 3FAAAAAB
    lui     a2, 0x4270                 # a2 = 42700000
    swc1    $f4, 0x0010($sp)
    swc1    $f6, 0x0014($sp)
    jal     func_800D0570
    swc1    $f8, 0x0018($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    mfc1    a1, $f0
    mfc1    a2, $f0
    addiu   a0, s0, 0x0058             # a0 = 00000058
    lui     a3, 0x43C8                 # a3 = 43C80000
    swc1    $f0, 0x0010($sp)
    swc1    $f0, 0x0014($sp)
    swc1    $f0, 0x0018($sp)
    swc1    $f0, 0x001C($sp)
    swc1    $f0, 0x0024($sp)
    jal     func_800D0C58
    swc1    $f10, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0030($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_80098848:
# MqDbg: TransitionWipe_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0218          # a1 = 00000218
    lw      v0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80098874:
# MqDbg: TransitionWipe_Destroy
# Store A0 on stack
# A0 = ?
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_80098880:
# MqDbg: TransitionWipe_Update
    lbu     t6, 0x0008(a0)             # 00000008
    lui     v0, 0x8012                 # v0 = 80120000
    beq     t6, $zero, lbl_800988F8
    nop
    lui     v0, 0x8012                 # v0 = 80120000
    lbu     v0, -0x4617(v0)            # 8011B9E9
    lhu     t7, 0x000E(a0)             # 0000000E
    addiu   t2, $zero, 0x0264          # t2 = 00000264
    sll     t8, v0,  2
    subu    t8, t8, v0
    div     $zero, t8, a1
    bne     a1, $zero, lbl_800988B8
    nop
    break   # 0x01C00
lbl_800988B8:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a1, $at, lbl_800988D0
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800988D0
    nop
    break   # 0x01800
lbl_800988D0:
    mflo    t9
    addu    t0, t7, t9
    andi    t1, t0, 0xFFFF             # t1 = 00000000
    slti    $at, t1, 0x0264
    bne     $at, $zero, lbl_80098958
    sh      t0, 0x000E(a0)             # 0000000E
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sh      t2, 0x000E(a0)             # 0000000E
    jr      $ra
    sb      t3, 0x000A(a0)             # 0000000A
lbl_800988F8:
    lbu     v0, -0x4617(v0)            # 8011B9E9
    lhu     t4, 0x000E(a0)             # 0000000E
    addiu   t9, $zero, 0x014D          # t9 = 0000014D
    sll     t5, v0,  2
    subu    t5, t5, v0
    div     $zero, t5, a1
    bne     a1, $zero, lbl_8009891C
    nop
    break   # 0x01C00
lbl_8009891C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a1, $at, lbl_80098934
    lui     $at, 0x8000                # $at = 80000000
    bne     t5, $at, lbl_80098934
    nop
    break   # 0x01800
lbl_80098934:
    mflo    t6
    subu    t8, t4, t6
    andi    t7, t8, 0xFFFF             # t7 = 00000000
    slti    $at, t7, 0x014E
    beq     $at, $zero, lbl_80098958
    sh      t8, 0x000E(a0)             # 0000000E
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sh      t9, 0x000E(a0)             # 0000000E
    sb      t0, 0x000A(a0)             # 0000000A
lbl_80098958:
    jr      $ra
    nop


func_80098960:
# MqDbg: TransitionWipe_Draw
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      s0, 0x001C($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x7390($at)          # 80108C70
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0020($sp)
    sw      a1, 0x0084($sp)
    lw      t6, 0x0084($sp)
    mfc1    a1, $f0
    mfc1    a2, $f0
    lw      t7, 0x0000(t6)             # 00000000
    lui     a3, 0x3F80                 # a3 = 3F800000
    sw      t7, 0x007C($sp)
    lbu     v0, 0x0009(s0)             # 00000009
    sll     t8, v0,  2
    subu    t8, t8, v0
    sll     t8, t8,  6
    addu    s1, s0, t8
    addiu   s1, s1, 0x0098             # s1 = 00000098
    xori    t9, v0, 0x0001             # t9 = 00000001
    sb      t9, 0x0009(s0)             # 00000009
    jal     func_800CF424
    or      a0, s1, $zero              # a0 = 00000098
    mtc1    $zero, $f0                 # $f0 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   a0, s1, 0x0040             # a0 = 000000D8
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    sw      a0, 0x0030($sp)
    jal     func_800D28A4
    swc1    $f4, 0x0010($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   a0, s1, 0x0080             # a0 = 00000118
    sw      a0, 0x002C($sp)
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_800D3338
    nop
    lw      t0, 0x007C($sp)
    lui     t2, 0xE700                 # t2 = E7000000
    addiu   a0, $sp, 0x007C            # a0 = FFFFFFFC
    addiu   t1, t0, 0x0008             # t1 = 00000008
    sw      t1, 0x007C($sp)
    sw      $zero, 0x0004(t0)          # 00000004
    sw      t2, 0x0000(t0)             # 00000000
    lhu     a1, 0x000C(s0)             # 0000000C
    lhu     a2, 0x000E(s0)             # 0000000E
    sw      $zero, 0x0010($sp)
    jal     func_8007EA1C
    or      a3, $zero, $zero           # a3 = 00000000
    lw      t3, 0x007C($sp)
    lui     t5, 0xDB06                 # t5 = DB060000
    ori     t5, t5, 0x0020             # t5 = DB060020
    addiu   t4, t3, 0x0008             # t4 = 00000008
    sw      t4, 0x007C($sp)
    sw      v0, 0x0004(t3)             # 00000004
    sw      t5, 0x0000(t3)             # 00000000
    lw      a0, 0x007C($sp)
    lui     t8, 0xFA00                 # t8 = FA000000
    ori     t8, t8, 0x0080             # t8 = FA000080
    addiu   t7, a0, 0x0008             # t7 = 00000008
    sw      t7, 0x007C($sp)
    sw      t8, 0x0000(a0)             # 00000000
    lbu     t3, 0x0001(s0)             # 00000001
    lbu     t0, 0x0000(s0)             # 00000000
    lbu     t7, 0x0002(s0)             # 00000002
    sll     t4, t3, 16
    sll     t1, t0, 24
    or      t5, t1, t4                 # t5 = 00000008
    sll     t8, t7,  8
    or      t9, t5, t8                 # t9 = FA000088
    ori     t0, t9, 0x00FF             # t0 = FA0000FF
    sw      t0, 0x0004(a0)             # 00000004
    lw      t2, 0x007C($sp)
    lui     t1, 0xDA38                 # t1 = DA380000
    ori     t1, t1, 0x0007             # t1 = DA380007
    addiu   t3, t2, 0x0008             # t3 = 00000008
    sw      t3, 0x007C($sp)
    addiu   t4, s0, 0x0018             # t4 = 00000018
    sw      t4, 0x0004(t2)             # 00000004
    sw      t1, 0x0000(t2)             # 00000000
    lw      t6, 0x007C($sp)
    lui     t5, 0xDB0E                 # t5 = DB0E0000
    lui     a2, 0xDA38                 # a2 = DA380000
    addiu   t7, t6, 0x0008             # t7 = 00000008
    sw      t7, 0x007C($sp)
    sw      t5, 0x0000(t6)             # 00000000
    lhu     t8, 0x0010(s0)             # 00000010
    ori     a2, a2, 0x0001             # a2 = DA380001
    lui     t2, 0xDA38                 # t2 = DA380000
    sw      t8, 0x0004(t6)             # 00000004
    lw      t9, 0x007C($sp)
    ori     t2, t2, 0x0005             # t2 = DA380005
    addiu   t3, s0, 0x0058             # t3 = 00000058
    addiu   t0, t9, 0x0008             # t0 = FA000090
    sw      t0, 0x007C($sp)
    sw      t3, 0x0004(t9)             # FA00008C
    sw      t2, 0x0000(t9)             # FA000088
    lw      t1, 0x007C($sp)
    lui     t6, 0xDA38                 # t6 = DA380000
    ori     t6, t6, 0x0003             # t6 = DA380003
    addiu   t4, t1, 0x0008             # t4 = DA38000F
    sw      t4, 0x007C($sp)
    sw      s1, 0x0004(t1)             # DA38000B
    sw      t6, 0x0000(t1)             # DA380007
    lw      t7, 0x007C($sp)
    lui     t4, 0xDE00                 # t4 = DE000000
    addiu   t5, t7, 0x0008             # t5 = 00000010
    sw      t5, 0x007C($sp)
    sw      a2, 0x0000(t7)             # 00000008
    lw      t8, 0x0030($sp)
    sw      t8, 0x0004(t7)             # 0000000C
    lw      t9, 0x007C($sp)
    addiu   t0, t9, 0x0008             # t0 = FA000090
    sw      t0, 0x007C($sp)
    sw      a2, 0x0000(t9)             # FA000088
    lw      t2, 0x002C($sp)
    sw      t2, 0x0004(t9)             # FA00008C
    lw      t3, 0x007C($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t6, t6, 0xD030             # t6 = 800FD030
    addiu   t1, t3, 0x0008             # t1 = 00000060
    sw      t1, 0x007C($sp)
    sw      t6, 0x0004(t3)             # 0000005C
    sw      t4, 0x0000(t3)             # 00000058
    lw      t7, 0x007C($sp)
    lui     t8, 0xE700                 # t8 = E7000000
    addiu   t5, t7, 0x0008             # t5 = 00000010
    sw      t5, 0x007C($sp)
    sw      $zero, 0x0004(t7)          # 0000000C
    sw      t8, 0x0000(t7)             # 00000008
    lw      t9, 0x007C($sp)
    lw      t0, 0x0084($sp)
    sw      t9, 0x0000(t0)             # FA000090
    lw      $ra, 0x0024($sp)
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080           # $sp += 0x80


func_80098B9C:
# MqDbg: TransitionWipe_IsDone
# Return u8 0x000A(A0)
# A0 = ?
# V0 = LBU 0x000A(A0)
    lbu     v0, 0x000A(a0)             # 0000000A
    jr      $ra
    nop


func_80098BA8:
# MqDbg: TransitionWipe_SetType
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     a1, $at, lbl_80098BBC
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    b       lbl_80098BC0
    sb      t6, 0x0008(a0)             # 00000008
lbl_80098BBC:
    sb      $zero, 0x0008(a0)          # 00000008
lbl_80098BC0:
    lbu     t7, 0x0008(a0)             # 00000008
    addiu   t8, $zero, 0x014D          # t8 = 0000014D
    addiu   t9, $zero, 0x0264          # t9 = 00000264
    beql    t7, $zero, lbl_80098BE0
    sh      t9, 0x000E(a0)             # 0000000E
    jr      $ra
    sh      t8, 0x000E(a0)             # 0000000E
lbl_80098BDC:
    sh      t9, 0x000E(a0)             # 0000000E
lbl_80098BE0:
    jr      $ra
    nop


func_80098BE8:
# MqDbg: TransitionWipe_SetColor
    sw      a1, 0x0000(a0)             # 00000000
    jr      $ra
    nop


func_80098BF4:
# MqDbg: TransitionWipe_SetUnkColor
    sw      a1, 0x0004(a0)             # 00000004
    jr      $ra
    nop