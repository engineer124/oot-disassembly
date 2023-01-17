# Transition System: Fading
#
# Starts at VRAM: 800992C0 / VROM: ??????
#

.section .text
func_800992C0:
# MqDbg: TransitionFade_Start
# Transition Animation 5 ?
# A0 = Data Start (Global Context + 0x121C8)
    lbu     v0, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_80099314
    sb      $zero, 0x0001(a0)          # 00000001
    beq     v0, $at, lbl_800992E8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beql    v0, $at, lbl_80099310
    sb      $zero, 0x0007(a0)          # 00000007
    b       lbl_80099314
    sb      $zero, 0x0001(a0)          # 00000001
lbl_800992E8:
    lbu     t6, 0x0002(a0)             # 00000002
    sh      $zero, 0x0008(a0)          # 00000008
    addiu   t7, $zero, 0x00FF          # t7 = 000000FF
    beq     t6, $zero, lbl_80099304
    nop
    b       lbl_80099310
    sb      t7, 0x0007(a0)             # 00000007
lbl_80099304:
    b       lbl_80099310
    sb      $zero, 0x0007(a0)          # 00000007
    sb      $zero, 0x0007(a0)          # 00000007
lbl_80099310:
    sb      $zero, 0x0001(a0)          # 00000001
lbl_80099314:
    jr      $ra
    nop


func_8009931C:
# MqDbg: TransitionFade_Init
# Transition Animation 5 Init
# Blanks 0xC bytes at A0
# A0 = Data Start (Global Context + 0x121C8)
# V0 = Allocated Data (A0)?
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x000C          # a1 = 0000000C
    lw      v0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80099348:
# MqDbg: TransitionFade_Destroy
# Transition Animation 5 ?
# A0 = ?
    sw      a0, 0x0000($sp)
    jr      $ra
    nop


func_80099354:
# MqDbg: TransitionFade_Update
# Transition Animation 5 Update Function?
# A0 = Data Start (Global Context + 0x121C8)
# A1 = Framerate Divisor (s16)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    or      a3, a0, $zero              # a3 = 00000000
    lbu     v0, 0x0000(a3)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_800994D8
    lw      $ra, 0x0014($sp)
    beq     v0, $at, lbl_80099388
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beql    v0, $at, lbl_80099438
    lbu     t3, 0x0007(a3)             # 00000007
    b       lbl_800994D8
    lw      $ra, 0x0014($sp)
lbl_80099388:
    lhu     t6, 0x0008(a3)             # 00000008
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addu    t7, t6, a1
    sh      t7, 0x0008(a3)             # 00000008
    lbu     v0, -0x4618(v0)            # 8011B9E8
    andi    v1, t7, 0xFFFF             # v1 = 00000000
    addiu   t1, $zero, 0x00FF          # t1 = 000000FF
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800993CC
    mtc1    v1, $f6                    # $f6 = 0.00
    sh      v0, 0x0008(a3)             # 00000008
    andi    v1, v0, 0xFFFF             # v1 = 00000000
    lui     v0, 0x8012                 # v0 = 80120000
    sb      t8, 0x0001(a3)             # 00000001
    lbu     v0, -0x4618(v0)            # 8011B9E8
    mtc1    v1, $f6                    # $f6 = 0.00
lbl_800993CC:
    lui     $at, 0x437F                # $at = 437F0000
    mtc1    $at, $f4                   # $f4 = 255.00
    bgez    v1, lbl_800993EC
    cvt.s.w $f8, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f8, $f8, $f10
lbl_800993EC:
    mtc1    v0, $f18                   # $f18 = 0.00
    mul.s   $f16, $f4, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    bgez    v0, lbl_8009940C
    cvt.s.w $f6, $f18
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_8009940C:
    div.s   $f4, $f16, $f6
    lbu     t0, 0x0002(a3)             # 00000002
    trunc.w.s $f8, $f4
    mfc1    a0, $f8
    beq     t0, $zero, lbl_8009942C
    subu    t2, t1, a0
    b       lbl_800994D4
    sb      t2, 0x0007(a3)             # 00000007
lbl_8009942C:
    b       lbl_800994D4
    sb      a0, 0x0007(a3)             # 00000007
    lbu     t3, 0x0007(a3)             # 00000007
lbl_80099438:
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, -0x4600(v0)            # 8011BA00
    sh      t3, 0x002A($sp)
    lh      v1, 0x0D38(v0)             # 80120D38
    beql    v1, $zero, lbl_800994D0
    lh      t9, 0x002A($sp)
    bgez    v1, lbl_80099488
    addiu   a0, v0, 0x0D38             # a0 = 80120D38
    addiu   a0, $sp, 0x002A            # a0 = FFFFFFFA
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    jal     func_800637D4
    sw      a3, 0x0030($sp)
    beq     v0, $zero, lbl_800994CC
    lw      a3, 0x0030($sp)
    lui     t5, 0x8012                 # t5 = 80120000
    lw      t5, -0x4600(t5)            # 8011BA00
    addiu   t4, $zero, 0x0096          # t4 = 00000096
    b       lbl_800994CC
    sh      t4, 0x0D38(t5)             # 80120D38
lbl_80099488:
    addiu   a1, $zero, 0x0014          # a1 = 00000014
    addiu   a2, $zero, 0x003C          # a2 = 0000003C
    jal     func_800637D4
    sw      a3, 0x0030($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, -0x4600(t6)            # 8011BA00
    addiu   a0, $sp, 0x002A            # a0 = FFFFFFFA
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800637D4
    lh      a2, 0x0D38(t6)             # 80120D38
    beq     v0, $zero, lbl_800994CC
    lw      a3, 0x0030($sp)
    lui     t7, 0x8012                 # t7 = 80120000
    lw      t7, -0x4600(t7)            # 8011BA00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sh      $zero, 0x0D38(t7)          # 80120D38
    sb      t8, 0x0001(a3)             # 00000001
lbl_800994CC:
    lh      t9, 0x002A($sp)
lbl_800994D0:
    sb      t9, 0x0007(a3)             # 00000007
lbl_800994D4:
    lw      $ra, 0x0014($sp)
lbl_800994D8:
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800994E4:
# MqDbg: TransitionFade_Draw
# Transition Animation 5 Draw Function?
    lbu     t6, 0x0007(a0)             # 00000007
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0xE440             # t8 = 800FE440
    beq     t6, $zero, lbl_800995A8
    lui     t7, 0xDE00                 # t7 = DE000000
    lw      v1, 0x0000(a1)             # 00000000
    or      a2, v1, $zero              # a2 = 00000000
    sw      t7, 0x0000(a2)             # 00000000
    sw      t8, 0x0004(a2)             # 00000004
    addiu   v1, v1, 0x0008             # v1 = 00000008
    or      a3, v1, $zero              # a3 = 00000008
    lui     t9, 0xFA00                 # t9 = FA000000
    sw      t9, 0x0000(a3)             # 00000008
    addiu   v0, a0, 0x0004             # v0 = 00000004
    lbu     t3, 0x0000(v0)             # 00000004
    lbu     t6, 0x0001(v0)             # 00000005
    lbu     t2, 0x0002(v0)             # 00000006
    sll     t4, t3, 24
    sll     t7, t6, 16
    or      t8, t4, t7                 # t8 = DE000000
    lbu     t4, 0x0003(v0)             # 00000007
    sll     t3, t2,  8
    or      t5, t8, t3                 # t5 = DE000000
    or      t7, t5, t4                 # t7 = DE000000
    sw      t7, 0x0004(a3)             # 0000000C
    addiu   v1, v1, 0x0008             # v1 = 00000010
    lui     t9, 0x8010                 # t9 = 80100000
    lw      t9, -0x1B00(t9)            # 800FE500
    lui     t5, 0x8010                 # t5 = 80100000
    lw      t5, -0x1AFC(t5)            # 800FE504
    addiu   t2, t9, 0xFFFF             # t2 = 800FFFFF
    andi    t8, t2, 0x03FF             # t8 = 000003FF
    addiu   t4, t5, 0xFFFF             # t4 = 800FFFFF
    andi    t7, t4, 0x03FF             # t7 = 000003FF
    sll     t3, t8, 14
    or      t0, v1, $zero              # t0 = 00000010
    lui     $at, 0xF600                # $at = F6000000
    or      t6, t3, $at                # t6 = F6000000
    sll     t9, t7,  2
    or      t2, t6, t9                 # t2 = F6100000
    sw      t2, 0x0000(t0)             # 00000010
    sw      $zero, 0x0004(t0)          # 00000014
    addiu   v1, v1, 0x0008             # v1 = 00000018
    or      t1, v1, $zero              # t1 = 00000018
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(t1)             # 00000018
    sw      $zero, 0x0004(t1)          # 0000001C
    addiu   v1, v1, 0x0008             # v1 = 00000020
    sw      v1, 0x0000(a1)             # 00000000
lbl_800995A8:
    jr      $ra
    nop


func_800995B0:
# MqDbg: TransitionFade_IsDone
# Transition Animation 5 ?
# A0 = Data Start (Global Context + 0x121C8)
# V0 = lbu 0x0001(A0)
    lbu     v0, 0x0001(a0)             # 00000001
    jr      $ra
    nop


func_800995BC:
# MqDbg: TransitionFade_SetColor
# Transition Animation 5 ?
# A0 = Data Start (Global Context + 0x121C8)
# A1 = ?
# Writes sw A1 to 0x0004(A0)
    sw      a1, 0x0004(a0)             # 00000004
    jr      $ra
    nop


func_800995C8:
# MqDbg: TransitionFade_SetType
# Transition Animation 5 ?
# A0 = Data Start (Global Context + 0x121C8)
# A1 = ? (1 if fading out, 2 if fading in)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     a1, $at, lbl_800995E0
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    sb      v0, 0x0000(a0)             # 00000000
    jr      $ra
    sb      v0, 0x0002(a0)             # 00000002
lbl_800995E0:
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     a1, $at, lbl_800995F8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    sb      v0, 0x0000(a0)             # 00000000
    jr      $ra
    sb      $zero, 0x0002(a0)          # 00000002
lbl_800995F8:
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     a1, $at, lbl_8009960C
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    jr      $ra
    sb      t6, 0x0000(a0)             # 00000000
lbl_8009960C:
    sb      $zero, 0x0000(a0)          # 00000000
    jr      $ra
    nop
    nop
    nop