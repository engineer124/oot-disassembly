# Transition System: Circles
#
# Starts at VRAM: 80098C00 / VROM: ??????
#

.section .text
func_80098C00:
# MqDbg: TransitionCircle_Start
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s0, 0x0030($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0034($sp)
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lbu     v0, 0x0017(s0)             # 00000017
    lui     t7, 0x8010                 # t7 = 80100000
    sb      $zero, 0x0018(s0)          # 00000018
    beq     v0, v1, lbl_80098C50
    addiu   t7, t7, 0xD548             # t7 = 800FD548
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    beq     v0, a0, lbl_80098C5C
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_80098C68
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t6, t6, 0xD148             # t6 = 800FD148
    b       lbl_80098C70
    sw      t6, 0x00A0(s0)             # 000000A0
lbl_80098C50:
    sw      t7, 0x00A0(s0)             # 000000A0
    b       lbl_80098C70
    addiu   a0, $zero, 0x0002          # a0 = 00000002
lbl_80098C5C:
    addiu   t8, t8, 0xD948             # t8 = 800FD948
    b       lbl_80098C70
    sw      t8, 0x00A0(s0)             # 000000A0
lbl_80098C68:
    addiu   t9, t9, 0xDD48             # t9 = 800FDD48
    sw      t9, 0x00A0(s0)             # 000000A0
lbl_80098C70:
    lbu     t0, 0x0016(s0)             # 00000016
    addiu   t1, $zero, 0x0014          # t1 = 00000014
    addiu   t2, $zero, 0x000A          # t2 = 0000000A
    bne     t0, $zero, lbl_80098C8C
    addiu   t3, $zero, 0x00FF          # t3 = 000000FF
    b       lbl_80098C90
    sw      t1, 0x0010(s0)             # 00000010
lbl_80098C8C:
    sw      t2, 0x0010(s0)             # 00000010
lbl_80098C90:
    lbu     v0, 0x0015(s0)             # 00000015
    bne     v0, $zero, lbl_80098CA4
    nop
    b       lbl_80098D00
    sw      t3, 0x0000(s0)             # 00000000
lbl_80098CA4:
    bne     v1, v0, lbl_80098CB8
    lui     t4, 0xA0A0                 # t4 = A0A00000
    ori     t4, t4, 0xA0FF             # t4 = A0A0A0FF
    b       lbl_80098D00
    sw      t4, 0x0000(s0)             # 00000000
lbl_80098CB8:
    bne     a0, v0, lbl_80098CD8
    addiu   t5, $zero, 0x00FF          # t5 = 000000FF
    addiu   v0, $zero, 0x0064          # v0 = 00000064
    sb      v0, 0x0000(s0)             # 00000000
    sb      v0, 0x0001(s0)             # 00000001
    sb      v0, 0x0002(s0)             # 00000002
    b       lbl_80098D00
    sb      t5, 0x0003(s0)             # 00000003
lbl_80098CD8:
    lbu     t7, 0x0017(s0)             # 00000017
    addiu   t6, $zero, 0x0028          # t6 = 00000028
    sw      t6, 0x0010(s0)             # 00000010
    bne     v1, t7, lbl_80098CF8
    lui     t9, 0xA0A0                 # t9 = A0A00000
    addiu   t8, $zero, 0x00FF          # t8 = 000000FF
    b       lbl_80098D00
    sw      t8, 0x0000(s0)             # 00000000
lbl_80098CF8:
    ori     t9, t9, 0xA0FF             # t9 = A0A0A0FF
    sw      t9, 0x0000(s0)             # 00000000
lbl_80098D00:
    lbu     t0, 0x0014(s0)             # 00000014
    beql    t0, $zero, lbl_80098D2C
    lbu     t4, 0x0017(s0)             # 00000017
    lbu     t1, 0x0015(s0)             # 00000015
    addiu   $at, $zero, 0x0003         # $at = 00000003
    sw      $zero, 0x000C(s0)          # 0000000C
    bne     t1, $at, lbl_80098D64
    addiu   t2, $zero, 0x00FA          # t2 = 000000FA
    b       lbl_80098D64
    sw      t2, 0x000C(s0)             # 0000000C
    lbu     t4, 0x0017(s0)             # 00000017
lbl_80098D2C:
    addiu   t3, $zero, 0x01F4          # t3 = 000001F4
    sw      t3, 0x000C(s0)             # 0000000C
    bne     a0, t4, lbl_80098D64
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t5, 0x8010                 # t5 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t5, t5, 0x43A8             # t5 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t5, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x5804          # a0 = 00005804
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
lbl_80098D64:
    lui     $at, 0x4120                # $at = 41200000
    mtc1    $at, $f4                   # $f4 = 10.00
    lui     $at, 0x4648                # $at = 46480000
    mtc1    $at, $f6                   # $f6 = 12800.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    lui     a3, 0x3FAA                 # a3 = 3FAA0000
    ori     a3, a3, 0xAAAB             # a3 = 3FAAAAAB
    addiu   a0, s0, 0x0020             # a0 = 00000020
    addiu   a1, s0, 0x001A             # a1 = 0000001A
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
    addiu   a0, s0, 0x0060             # a0 = 00000060
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


func_80098DEC:
# MqDbg: TransitionCircle_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0228          # a1 = 00000228
    lw      v0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80098E18:
# MqDbg: TransitionCircle_Destroy
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_80098E24:
# MqDbg: TransitionCircle_Update
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0020($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a1, 0x002C($sp)
    lbu     t6, 0x0014(s0)             # 00000014
    beql    t6, $zero, lbl_80098F04
    lw      t7, 0x0010(s0)             # 00000010
    lw      v0, 0x000C(s0)             # 0000000C
    bnel    v0, $zero, lbl_80098E94
    lw      t9, 0x0010(s0)             # 00000010
    lbu     t7, 0x0017(s0)             # 00000017
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    t7, $at, lbl_80098E94
    lw      t9, 0x0010(s0)             # 00000010
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t8, t8, 0x43A8             # t8 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t8, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x5803          # a0 = 00005803
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      v0, 0x000C(s0)             # 0000000C
    lw      t9, 0x0010(s0)             # 00000010
lbl_80098E94:
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    lw      t1, 0x002C($sp)
    multu   t9, v1
    addiu   t5, $zero, 0x01F4          # t5 = 000001F4
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    mflo    t0
    nop
    nop
    div     $zero, t0, t1
    bne     t1, $zero, lbl_80098EC4
    nop
    break   # 0x01C00
lbl_80098EC4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t1, $at, lbl_80098EDC
    lui     $at, 0x8000                # $at = 80000000
    bne     t0, $at, lbl_80098EDC
    nop
    break   # 0x01800
lbl_80098EDC:
    mflo    t2
    addu    t3, v0, t2
    slti    $at, t3, 0x01F4
    sw      t3, 0x000C(s0)             # 0000000C
    bne     $at, $zero, lbl_80098F94
    or      t4, t3, $zero              # t4 = 00000000
    sw      t5, 0x000C(s0)             # 0000000C
    b       lbl_80098F94
    sb      t6, 0x0018(s0)             # 00000018
    lw      t7, 0x0010(s0)             # 00000010
lbl_80098F04:
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    lw      t9, 0x002C($sp)
    multu   t7, v1
    lw      t1, 0x000C(s0)             # 0000000C
    lbu     t3, 0x0015(s0)             # 00000015
    mflo    t8
    nop
    nop
    div     $zero, t8, t9
    mflo    t0
    subu    t2, t1, t0
    bne     t9, $zero, lbl_80098F3C
    nop
    break   # 0x01C00
lbl_80098F3C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t9, $at, lbl_80098F54
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_80098F54
    nop
    break   # 0x01800
lbl_80098F54:
    sw      t2, 0x000C(s0)             # 0000000C
    beql    v1, t3, lbl_80098F78
    lw      t6, 0x000C(s0)             # 0000000C
    bgtz    t2, lbl_80098F94
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sw      $zero, 0x000C(s0)          # 0000000C
    b       lbl_80098F94
    sb      t5, 0x0018(s0)             # 00000018
    lw      t6, 0x000C(s0)             # 0000000C
lbl_80098F78:
    addiu   t7, $zero, 0x00FA          # t7 = 000000FA
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    slti    $at, t6, 0x00FB
    beql    $at, $zero, lbl_80098F98
    lw      $ra, 0x0024($sp)
    sw      t7, 0x000C(s0)             # 0000000C
    sb      t8, 0x0018(s0)             # 00000018
lbl_80098F94:
    lw      $ra, 0x0024($sp)
lbl_80098F98:
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_80098FA8:
# MqDbg: TransitionCircle_Draw
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      s0, 0x001C($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0020($sp)
    sw      a1, 0x0084($sp)
    lw      t6, 0x0084($sp)
    lui     t2, 0xE700                 # t2 = E7000000
    addiu   a0, $sp, 0x007C            # a0 = FFFFFFFC
    lw      t7, 0x0000(t6)             # 00000000
    addiu   a3, $zero, 0x0010          # a3 = 00000010
    addiu   t3, $zero, 0x0040          # t3 = 00000040
    sw      t7, 0x007C($sp)
    lbu     v0, 0x0019(s0)             # 00000019
    sll     t8, v0,  2
    subu    t8, t8, v0
    sll     t8, t8,  6
    xori    t9, v0, 0x0001             # t9 = 00000001
    addu    s1, s0, t8
    sb      t9, 0x0019(s0)             # 00000019
    addiu   s1, s1, 0x00A8             # s1 = 000000A8
    lw      t0, 0x007C($sp)
    addiu   t1, t0, 0x0008             # t1 = 00000008
    sw      t1, 0x007C($sp)
    sw      $zero, 0x0004(t0)          # 00000004
    sw      t2, 0x0000(t0)             # 00000000
    lw      a1, 0x0008(s0)             # 00000008
    lw      a2, 0x000C(s0)             # 0000000C
    jal     func_8007EA1C
    sw      t3, 0x0010($sp)
    lw      t4, 0x007C($sp)
    lui     t6, 0xDB06                 # t6 = DB060000
    ori     t6, t6, 0x0024             # t6 = DB060024
    addiu   t5, t4, 0x0008             # t5 = 00000008
    sw      t5, 0x007C($sp)
    sw      v0, 0x0004(t4)             # 00000004
    sw      t6, 0x0000(t4)             # 00000000
    lw      t7, 0x007C($sp)
    lui     t9, 0xDB06                 # t9 = DB060000
    ori     t9, t9, 0x0020             # t9 = DB060020
    addiu   t8, t7, 0x0008             # t8 = 00000008
    sw      t8, 0x007C($sp)
    sw      t9, 0x0000(t7)             # 00000000
    lw      t0, 0x00A0(s0)             # 000000A0
    lui     t3, 0xFA00                 # t3 = FA000000
    sw      t0, 0x0004(t7)             # 00000004
    lw      t1, 0x007C($sp)
    addiu   t2, t1, 0x0008             # t2 = 00000008
    sw      t2, 0x007C($sp)
    sw      t3, 0x0000(t1)             # 00000000
    lw      t4, 0x0000(s0)             # 00000000
    lui     t7, 0xFB00                 # t7 = FB000000
    addiu   t2, s0, 0x0020             # t2 = 00000020
    sw      t4, 0x0004(t1)             # 00000004
    lw      t5, 0x007C($sp)
    addiu   t6, t5, 0x0008             # t6 = 00000010
    sw      t6, 0x007C($sp)
    sw      t7, 0x0000(t5)             # 00000008
    lw      t8, 0x0000(s0)             # 00000000
    lui     $at, 0x8011                # $at = 80110000
    lui     t1, 0xDA38                 # t1 = DA380000
    sw      t8, 0x0004(t5)             # 0000000C
    lwc1    $f0, -0x7380($at)          # 80108C80
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    lw      t9, 0x007C($sp)
    addiu   t0, t9, 0x0008             # t0 = DB060028
    sw      t0, 0x007C($sp)
    ori     t1, t1, 0x0007             # t1 = DA380007
    sw      t1, 0x0000(t9)             # DB060020
    sw      t2, 0x0004(t9)             # DB060024
    lw      t3, 0x007C($sp)
    lui     t5, 0xDB0E                 # t5 = DB0E0000
    lui     t9, 0xDA38                 # t9 = DA380000
    addiu   t4, t3, 0x0008             # t4 = FA000008
    sw      t4, 0x007C($sp)
    sw      t5, 0x0000(t3)             # FA000000
    lhu     t6, 0x001A(s0)             # 0000001A
    sw      t6, 0x0004(t3)             # FA000004
    lw      t7, 0x007C($sp)
    ori     t9, t9, 0x0005             # t9 = DA380005
    addiu   t0, s0, 0x0060             # t0 = 00000060
    addiu   t8, t7, 0x0008             # t8 = FB000008
    sw      t8, 0x007C($sp)
    sw      t0, 0x0004(t7)             # FB000004
    sw      t9, 0x0000(t7)             # FB000000
    c.eq.s  $f0, $f2
    nop
    bc1tl   lbl_80099150
    mtc1    $zero, $f0                 # $f0 = 0.00
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f2
    jal     func_800CF424
    or      a0, s1, $zero              # a0 = 000000A8
    lw      t1, 0x007C($sp)
    lui     t3, 0xDA38                 # t3 = DA380000
    ori     t3, t3, 0x0003             # t3 = DA380003
    addiu   t2, t1, 0x0008             # t2 = 00000008
    sw      t2, 0x007C($sp)
    sw      s1, 0x0004(t1)             # 00000004
    sw      t3, 0x0000(t1)             # 00000000
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    nop
    mtc1    $zero, $f0                 # $f0 = 0.00
lbl_80099150:
    addiu   s0, s1, 0x0040             # s0 = 000000E8
    or      a0, s0, $zero              # a0 = 000000E8
    c.eq.s  $f0, $f0
    nop
    bc1tl   lbl_800991A0
    c.eq.s  $f0, $f0
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_800D28A4
    swc1    $f2, 0x0010($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    lw      t4, 0x007C($sp)
    addiu   t5, t4, 0x0008             # t5 = 00000008
    sw      t5, 0x007C($sp)
    lui     t6, 0xDA38                 # t6 = DA380000
    ori     t6, t6, 0x0001             # t6 = DA380001
    sw      t6, 0x0000(t4)             # 00000000
    sw      s0, 0x0004(t4)             # 00000004
    c.eq.s  $f0, $f0
lbl_800991A0:
    addiu   s0, s1, 0x0080             # s0 = 00000128
    bc1fl   lbl_800991C0
    mfc1    a1, $f0
    c.eq.s  $f0, $f0
    nop
    bc1tl   lbl_800991F0
    lw      t0, 0x007C($sp)
    mfc1    a1, $f0
lbl_800991C0:
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_800D3338
    or      a0, s0, $zero              # a0 = 00000128
    lw      t7, 0x007C($sp)
    lui     t9, 0xDA38                 # t9 = DA380000
    ori     t9, t9, 0x0001             # t9 = DA380001
    addiu   t8, t7, 0x0008             # t8 = 00000008
    sw      t8, 0x007C($sp)
    sw      s0, 0x0004(t7)             # 00000004
    sw      t9, 0x0000(t7)             # 00000000
    lw      t0, 0x007C($sp)
lbl_800991F0:
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   t3, t3, 0xE368             # t3 = 800FE368
    addiu   t1, t0, 0x0008             # t1 = 00000008
    sw      t1, 0x007C($sp)
    lui     t2, 0xDE00                 # t2 = DE000000
    sw      t2, 0x0000(t0)             # 00000000
    sw      t3, 0x0004(t0)             # 00000004
    lw      t4, 0x007C($sp)
    lui     t6, 0xE700                 # t6 = E7000000
    addiu   t5, t4, 0x0008             # t5 = 00000008
    sw      t5, 0x007C($sp)
    sw      $zero, 0x0004(t4)          # 00000004
    sw      t6, 0x0000(t4)             # 00000000
    lw      t7, 0x007C($sp)
    lw      t8, 0x0084($sp)
    sw      t7, 0x0000(t8)             # 00000008
    lw      $ra, 0x0024($sp)
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080           # $sp += 0x80


func_80099244:
# MqDbg: TransitionCircle_IsDone
    lbu     v0, 0x0018(a0)             # 00000018
    jr      $ra
    nop


func_80099250:
# MqDbg: TransitionCircle_SetType
    andi    t6, a1, 0x0080             # t6 = 00000000
    beq     t6, $zero, lbl_8009928C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sra     t7, a1,  5
    sra     t9, a1,  3
    sra     t2, a1,  1
    andi    t8, t7, 0x0001             # t8 = 00000000
    andi    t0, t9, 0x0003             # t0 = 00000000
    andi    t1, a1, 0x0001             # t1 = 00000000
    andi    t3, t2, 0x0003             # t3 = 00000000
    sb      t8, 0x0014(a0)             # 00000014
    sb      t0, 0x0015(a0)             # 00000015
    sb      t1, 0x0016(a0)             # 00000016
    jr      $ra
    sb      t3, 0x0017(a0)             # 00000017
lbl_8009928C:
    bne     a1, $at, lbl_8009929C
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    jr      $ra
    sb      t4, 0x0014(a0)             # 00000014
lbl_8009929C:
    sb      $zero, 0x0014(a0)          # 00000014
    jr      $ra
    nop


func_800992A8:
# MqDbg: TransitionCircle_SetColor
    sw      a1, 0x0000(a0)             # 00000000
    jr      $ra
    nop


func_800992B4:
# MqDbg: TransitionCircle_SetUnkColor
    sw      a1, 0x0004(a0)             # 00000004
    jr      $ra
    nop
