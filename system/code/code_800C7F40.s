# Audio External Sfx
#
# Starts at VRAM: 800C7F40 / VROM: B3DEA0
#

.section .text
func_800C7F40:
# MqDbg: Audio_SetSfxBanksMute
    sw      a0, 0x0000($sp)
    lui     a1, 0x8012                 # a1 = 80120000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    addiu   a1, a1, 0x4754             # a1 = 80124754
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800C7F58:
    andi    t6, a0, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800C7F70
    or      v1, a0, $zero              # v1 = 00000000
    addu    t7, a1, v0
    b       lbl_800C7F78
    sb      a2, 0x0000(t7)             # 00000000
lbl_800C7F70:
    addu    t8, a1, v0
    sb      $zero, 0x0000(t8)          # 00000000
lbl_800C7F78:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    sra     a0, v1,  1
    bne     $at, $zero, lbl_800C7F58
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    jr      $ra
    nop


func_800C7F98:
# MqDbg: Audio_QueueSeqCmdMute
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     t7, 0x001B($sp)
    addiu   v0, v0, 0x4390             # v0 = 80104390
    lhu     t6, 0x0000(v0)             # 80104390
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sllv    t9, t8, t7
    sw      $ra, 0x0014($sp)
    or      t0, t6, t9                 # t0 = 00000000
    sh      t0, 0x0000(v0)             # 80104390
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x0040          # a2 = 00000040
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x0040          # a2 = 00000040
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7FFC:
# MqDbg: Audio_ClearBGMMute
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x4390             # v0 = 80104390
    sw      a0, 0x0018($sp)
    lhu     t6, 0x0000(v0)             # 80104390
    andi    a0, a0, 0x00FF             # a0 = 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t8, t7, a0
    xori    t9, t8, 0xFFFF             # t9 = FFFFFFFF
    and     t0, t6, t9
    andi    t1, t0, 0xFFFF             # t1 = 00000000
    sw      $ra, 0x0014($sp)
    bne     t1, $zero, lbl_800C805C
    sh      t0, 0x0000(v0)             # 80104390
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
lbl_800C805C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C806C:
# MqDbg: Audio_PlaySfxGeneral
# Global Play Sfx?
# A0 = SFX ID
# A1 = ?
# A2 = ?
# A3 = ?
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sra     t6, a0, 12
    andi    t7, t6, 0x00FF             # t7 = 00000000
    lui     t8, 0x8012                 # t8 = 80120000
    addu    t8, t8, t7
    lbu     t8, 0x4754(t8)             # 80124754
    sw      a2, 0x0008($sp)
    andi    a2, a2, 0x00FF             # a2 = 00000000
    bne     t8, $zero, lbl_800C80E4
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x4360             # v1 = 80104360
    lbu     t9, 0x0000(v1)             # 80104360
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x2E90             # t1 = 80122E90
    sll     t0, t9,  2
    subu    t0, t0, t9
    sll     t0, t0,  3
    addu    v0, t0, t1
    sh      a0, 0x0000(v0)             # 00000000
    sw      a1, 0x0004(v0)             # 00000004
    sb      a2, 0x0008(v0)             # 00000008
    sw      a3, 0x000C(v0)             # 0000000C
    lw      t2, 0x0010($sp)
    sw      t2, 0x0010(v0)             # 00000010
    lw      t3, 0x0014($sp)
    sw      t3, 0x0014(v0)             # 00000014
    lbu     t4, 0x0000(v1)             # 80104360
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t5, 0x0000(v1)             # 80104360
lbl_800C80E4:
    jr      $ra
    nop


func_800C80EC:
# MqDbg: Audio_RemoveMatchingSfxRequests
    lui     v0, 0x8010                 # v0 = 80100000
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v0, 0x4364(v0)             # 80104364
    lbu     v1, 0x4360(v1)             # 80104360
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    beq     v1, v0, lbl_800C8284
    or      a3, a1, $zero              # a3 = 00000000
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x2E90             # t0 = 80122E90
    or      a2, a0, $zero              # a2 = 00000000
    addiu   t1, $zero, 0x0018          # t1 = 00000018
    sltiu   $at, a2, 0x0006
lbl_800C8120:
    beq     $at, $zero, lbl_800C8254
    or      a0, $zero, $zero           # a0 = 00000000
    sll     t6, a2,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x5EF0($at)           # 8010A110
    jr      t6
    nop
    multu   v0, t1
    lhu     t7, 0x0028(a3)             # 00000028
    andi    t8, t7, 0xF000             # t8 = 00000000
    mflo    t9
    addu    t2, t0, t9
    lhu     t3, 0x0000(t2)             # 00000000
    andi    t4, t3, 0xF000             # t4 = 00000000
    bne     t8, t4, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lhu     t6, 0x0028(a3)             # 00000028
    andi    t7, t6, 0xF000             # t7 = 00000000
    mflo    t5
    addu    a1, t0, t5
    lhu     t9, 0x0000(a1)             # 00000000
    andi    t2, t9, 0xF000             # t2 = 00000000
    bne     t7, t2, lbl_800C8254
    nop
    lw      t3, 0x0000(a3)             # 00000000
    lw      t8, 0x0004(a1)             # 00000004
    bne     t3, t8, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lw      t4, 0x0000(a3)             # 00000000
    mflo    t5
    addu    t6, t0, t5
    lw      t9, 0x0004(t6)             # 00000004
    bne     t4, t9, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lw      t2, 0x0000(a3)             # 00000000
    mflo    t7
    addu    a1, t0, t7
    lw      t3, 0x0004(a1)             # 00000004
    bne     t2, t3, lbl_800C8254
    nop
    lhu     t8, 0x0028(a3)             # 00000028
    lhu     t5, 0x0000(a1)             # 00000000
    bne     t8, t5, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lbu     t4, 0x000C(a3)             # 0000000C
    mflo    t6
    addu    a1, t0, t6
    lbu     t9, 0x0008(a1)             # 00000008
    bne     t4, t9, lbl_800C8254
    nop
    lhu     t7, 0x0028(a3)             # 00000028
    lhu     t2, 0x0000(a1)             # 00000000
    bne     t7, t2, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lhu     t3, 0x0028(a3)             # 00000028
    mflo    t8
    addu    t5, t0, t8
    lhu     t6, 0x0000(t5)             # 00000000
    bne     t3, t6, lbl_800C8254
    nop
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800C8254:
    beql    a0, $zero, lbl_800C8278
    addiu   v0, v0, 0x0001             # v0 = 80100001
    multu   v0, t1
    lui     v1, 0x8010                 # v1 = 80100000
    mflo    t4
    addu    t9, t0, t4
    sh      $zero, 0x0000(t9)          # 00000000
    lbu     v1, 0x4360(v1)             # 80104360
    addiu   v0, v0, 0x0001             # v0 = 80100002
lbl_800C8278:
    andi    v0, v0, 0x00FF             # v0 = 00000002
    bnel    v1, v0, lbl_800C8120
    sltiu   $at, a2, 0x0006
lbl_800C8284:
    jr      $ra
    nop


func_800C828C:
# MqDbg: Audio_ProcessSfxRequest
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x4364(t6)             # 80104364
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x2E90             # t8 = 80122E90
    sll     t7, t6,  2
    subu    t7, t7, t6
    sll     t7, t7,  3
    sw      $ra, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    addu    t2, t7, t8
    lhu     a3, 0x0000(t2)             # 00000000
    addiu   s1, $zero, 0x0080          # s1 = 00000080
    lui     t6, 0x8010                 # t6 = 80100000
    beq     a3, $zero, lbl_800C8700
    andi    s5, a3, 0xF000             # s5 = 00000000
    sra     s5, s5, 12
    andi    s5, s5, 0x00FF             # s5 = 00000000
    sll     t9, s5,  2
    addiu   t6, t6, 0x4368             # t6 = 80104368
    addu    t0, t9, t6
    lw      t3, 0x0000(t0)             # 00000000
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      t4, $zero, $zero           # t4 = 00000000
    lbu     a1, 0x002D(t3)             # 0000002D
    beq     s6, a1, lbl_800C85C0
    or      v0, a1, $zero              # v0 = 00000000
    beq     a1, $zero, lbl_800C85C0
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    lui     s3, 0x8010                 # s3 = 80100000
    addiu   s3, s3, 0x433C             # s3 = 8010433C
    lbu     s2, 0x004B($sp)
lbl_800C8324:
    multu   a1, s4
    lw      t8, 0x0004(t2)             # 00000004
    mflo    t7
    addu    s0, t3, t7
    lw      t9, 0x0000(s0)             # 00000000
    bne     t8, t9, lbl_800C8590
    nop
    lhu     a3, 0x0000(t2)             # 00000000
    sra     t6, a3, 12
    andi    t7, t6, 0x00FF             # t7 = 00000068
    sll     t8, t7,  2
    addu    t9, s3, t8
    lw      t5, 0x0000(t9)             # 00000000
    andi    $ra, a3, 0x01FF            # $ra = 00000000
    sll     $ra, $ra,  2
    addu    a2, t5, $ra
    lhu     t6, 0x0002(a2)             # 00000002
    andi    t7, t6, 0x0020             # t7 = 00000020
    beq     t7, $zero, lbl_800C8384
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t8, 0x0000(a2)             # 00000000
    lbu     t9, 0x0024(s0)             # 00000024
    beql    t8, t9, lbl_800C8704
    lw      $ra, 0x0034($sp)
lbl_800C8384:
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     v0, 0x8010                 # v0 = 80100000
    lhu     v1, 0x0028(s0)             # 00000028
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    t8, t7, s5
    addu    v0, v0, t8
    lbu     v0, 0x18A4(v0)             # 801018A4
    bne     a3, v1, lbl_800C83B8
    or      t1, v0, $zero              # t1 = 80100000
    andi    t4, v0, 0x00FF             # t4 = 00000000
    b       lbl_800C8450
    or      v1, t4, $zero              # v1 = 00000000
lbl_800C83B8:
    bne     t4, $zero, lbl_800C83EC
    andi    a0, v1, 0xFFFF             # a0 = 00000000
    sra     t9, a0, 12
    andi    t6, t9, 0x00FF             # t6 = 00000000
    sll     t7, t6,  2
    addu    t8, s3, t7
    lw      t9, 0x0000(t8)             # 80122E90
    andi    t6, a0, 0x01FF             # t6 = 00000000
    sll     t7, t6,  2
    addu    t8, t9, t7
    andi    s1, a1, 0x00FF             # s1 = 00000000
    b       lbl_800C8424
    lbu     s2, 0x0000(t8)             # 80122E90
lbl_800C83EC:
    lbu     t6, 0x0024(s0)             # 00000024
    andi    a0, v1, 0xFFFF             # a0 = 00000000
    sra     t9, a0, 12
    slt     $at, t6, s2
    beq     $at, $zero, lbl_800C8424
    andi    t7, t9, 0x00FF             # t7 = 00000000
    sll     t8, t7,  2
    addu    t6, s3, t8
    lw      t9, 0x0000(t6)             # 00000000
    andi    t7, a0, 0x01FF             # t7 = 00000000
    sll     t8, t7,  2
    addu    t6, t9, t8
    andi    s1, a1, 0x00FF             # s1 = 00000000
    lbu     s2, 0x0000(t6)             # 00000000
lbl_800C8424:
    addiu   t4, t4, 0x0001             # t4 = 00000001
    andi    t4, t4, 0x00FF             # t4 = 00000001
    bne     t4, t1, lbl_800C8450
    or      v1, t4, $zero              # v1 = 00000001
    lbu     t7, 0x0000(a2)             # 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    slt     $at, t7, s2
    bne     $at, $zero, lbl_800C8450
    nop
    b       lbl_800C8450
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C8450:
    bne     v1, t1, lbl_800C8590
    sll     v0, a1,  2
    subu    v0, v0, a1
    sll     v0, v0,  4
    andi    t9, a3, 0x0C00             # t9 = 00000000
    addu    v1, t5, $ra
    bne     t9, $zero, lbl_800C8488
    addu    s0, t3, v0
    lhu     t8, 0x0002(v1)             # 00000003
    andi    t6, t8, 0x0004             # t6 = 00000000
    bnel    t6, $zero, lbl_800C848C
    lhu     t7, 0x0026(s0)             # 00000026
    bnel    s1, a1, lbl_800C8574
    lbu     t6, 0x002A(s0)             # 0000002A
lbl_800C8488:
    lhu     t7, 0x0026(s0)             # 00000026
lbl_800C848C:
    andi    t9, t7, 0x0008             # t9 = 00000000
    beql    t9, $zero, lbl_800C84E4
    lbu     t7, 0x0008(t2)             # 00000008
    lbu     t8, 0x002A(s0)             # 0000002A
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    t8, $at, lbl_800C84E4
    lbu     t7, 0x0008(t2)             # 00000008
    lbu     a0, 0x002E(s0)             # 0000002E
    sb      t4, 0x005D($sp)
    sw      t2, 0x0058($sp)
    sw      t0, 0x0040($sp)
    sw      v1, 0x0050($sp)
    jal     func_800C7FFC
    sw      v0, 0x0038($sp)
    lw      t0, 0x0040($sp)
    lw      v0, 0x0038($sp)
    lw      v1, 0x0050($sp)
    lw      t6, 0x0000(t0)             # 00000000
    lw      t2, 0x0058($sp)
    lbu     t4, 0x005D($sp)
    addu    s0, t6, v0
    lbu     t7, 0x0008(t2)             # 00000008
lbl_800C84E4:
    sb      t7, 0x000C(s0)             # 0000000C
    lw      t8, 0x0000(t0)             # 00000000
    lhu     t9, 0x0000(t2)             # 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    addu    t6, t8, v0
    sh      t9, 0x0028(t6)             # 00000028
    lw      t8, 0x0000(t0)             # 00000000
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    addu    t9, t8, v0
    sb      t7, 0x002A(t9)             # 0000002A
    lw      t8, 0x0000(t0)             # 00000000
    addu    t7, t8, v0
    sb      t6, 0x002B(t7)             # 0000002C
    lw      t8, 0x0000(t0)             # 00000000
    lw      t9, 0x000C(t2)             # 0000000C
    addu    t6, t8, v0
    sw      t9, 0x0010(t6)             # 00000012
    lw      t8, 0x0000(t0)             # 00000000
    lw      t7, 0x0010(t2)             # 00000010
    addu    t9, t8, v0
    sw      t7, 0x0014(t9)             # 00000014
    lw      t8, 0x0000(t0)             # 00000000
    lw      t6, 0x0014(t2)             # 00000014
    addu    t7, t8, v0
    sw      t6, 0x0018(t7)             # 00000019
    lw      t8, 0x0000(t0)             # 00000000
    lhu     t9, 0x0002(v1)             # 00000002
    addu    t6, t8, v0
    sh      t9, 0x0026(t6)             # 00000028
    lw      t8, 0x0000(t0)             # 00000000
    lbu     t7, 0x0000(v1)             # 00000000
    addu    t9, t8, v0
    sb      t7, 0x0024(t9)             # 00000024
    b       lbl_800C858C
    lw      t3, 0x0000(t0)             # 00000000
    lbu     t6, 0x002A(s0)             # 0000002A
lbl_800C8574:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    addiu   t8, $zero, 0x0004          # t8 = 00000004
    bnel    t6, $at, lbl_800C8590
    or      a1, $zero, $zero           # a1 = 00000000
    sb      t8, 0x002A(s0)             # 0000002A
    lw      t3, 0x0000(t0)             # 00000000
lbl_800C858C:
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C8590:
    beq     a1, $zero, lbl_800C85AC
    or      v0, a1, $zero              # v0 = 00000000
    multu   a1, s4
    mflo    t7
    addu    t9, t3, t7
    lbu     a1, 0x002D(t9)             # 0000002D
    or      v0, a1, $zero              # v0 = 00000000
lbl_800C85AC:
    beq     s6, v0, lbl_800C85C0
    nop
    bne     v0, $zero, lbl_800C8324
    nop
    sb      s2, 0x004B($sp)
lbl_800C85C0:
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x4698             # t6 = 80124698
    addu    a2, s5, t6
    lbu     t1, 0x0000(a2)             # 00000000
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    lui     s3, 0x8010                 # s3 = 80100000
    multu   t1, s4
    addiu   s3, s3, 0x433C             # s3 = 8010433C
    mflo    t8
    addu    t7, t3, t8
    lbu     t9, 0x002D(t7)             # 0000002E
    beql    s6, t9, lbl_800C8704
    lw      $ra, 0x0034($sp)
    beq     v0, $zero, lbl_800C8700
    andi    a1, t1, 0x00FF             # a1 = 00000000
    multu   a1, s4
    lw      t8, 0x0004(t2)             # 00000004
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    mflo    t6
    addu    v0, t3, t6
    sw      t8, 0x0000(v0)             # 00000000
    lw      t7, 0x0004(t2)             # 00000004
    addiu   t9, t7, 0x0004             # t9 = 00000005
    sw      t9, 0x0004(v0)             # 00000004
    lw      t6, 0x0004(t2)             # 00000004
    addiu   t8, t6, 0x0008             # t8 = 801246A0
    sw      t8, 0x0008(v0)             # 00000008
    lbu     t7, 0x0008(t2)             # 00000008
    sb      t7, 0x000C(v0)             # 0000000C
    lw      t9, 0x000C(t2)             # 0000000C
    sw      t9, 0x0010(v0)             # 00000010
    lw      t6, 0x0010(t2)             # 00000010
    sw      t6, 0x0014(v0)             # 00000014
    lw      t8, 0x0014(t2)             # 00000014
    sw      t8, 0x0018(v0)             # 00000018
    lhu     a3, 0x0000(t2)             # 00000000
    sra     t7, a3, 12
    andi    t9, t7, 0x00FF             # t9 = 00000001
    sll     t6, t9,  2
    addu    t8, s3, t6
    lw      t7, 0x0000(t8)             # 801246A0
    andi    t9, a3, 0x01FF             # t9 = 00000000
    sll     t6, t9,  2
    addu    v1, t7, t6
    lhu     t8, 0x0002(v1)             # 00000002
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sh      t8, 0x0026(v0)             # 00000026
    lbu     t9, 0x0000(v1)             # 00000000
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sb      t9, 0x0024(v0)             # 00000024
    lhu     t7, 0x0000(t2)             # 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x4690             # t9 = 80124690
    sb      t6, 0x002A(v0)             # 0000002A
    sb      t8, 0x002B(v0)             # 0000002B
    addu    a0, s5, t9
    sh      t7, 0x0028(v0)             # 00000028
    lbu     t7, 0x0000(a0)             # 00000000
    sb      t7, 0x002C(v0)             # 0000002C
    lbu     t9, 0x0000(a0)             # 00000000
    lw      t8, 0x0000(t0)             # 00000000
    lbu     t6, 0x0000(a2)             # 00000000
    multu   t9, s4
    mflo    t7
    addu    t9, t8, t7
    sb      t6, 0x002D(t9)             # 801246BD
    lbu     t1, 0x0000(a2)             # 00000000
    lw      t3, 0x0000(t0)             # 00000000
    multu   t1, s4
    sb      t1, 0x0000(a0)             # 00000000
    mflo    t8
    addu    t7, t3, t8
    lbu     t6, 0x002D(t7)             # 0000002E
    andi    t9, t6, 0x00FF             # t9 = 00000001
    multu   t9, s4
    sb      t6, 0x0000(a2)             # 00000000
    mflo    t8
    addu    t7, t3, t8
    sb      a1, 0x002C(t7)             # 0000002D
    sb      a1, 0x002D(v0)             # 0000002D
lbl_800C8700:
    lw      $ra, 0x0034($sp)
lbl_800C8704:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C8728:
# MqDbg: Audio_RemoveSfxBankEntry
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      a1, 0x0034($sp)
    lbu     t8, 0x0037($sp)
    addiu   t3, $zero, 0x0030          # t3 = 00000030
    sw      s0, 0x0018($sp)
    multu   t8, t3
    andi    s0, a0, 0x00FF             # s0 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s0,  2
    addu    t2, t6, t7
    lw      t1, 0x0000(t2)             # 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0030($sp)
    mflo    t9
    addu    a2, t1, t9
    lhu     t4, 0x0026(a2)             # 00000026
    andi    t5, t4, 0x0008             # t5 = 00000000
    beq     t5, $zero, lbl_800C8798
    nop
    lbu     a0, 0x002E(a2)             # 0000002E
    sw      t2, 0x0024($sp)
    jal     func_800C7FFC
    sw      a2, 0x002C($sp)
    lw      t2, 0x0024($sp)
    lw      a2, 0x002C($sp)
    addiu   t3, $zero, 0x0030          # t3 = 00000030
    lw      t1, 0x0000(t2)             # 00000000
lbl_800C8798:
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x4690             # t6 = 80124690
    addu    v0, s0, t6
    lbu     t7, 0x0000(v0)             # 00000000
    lbu     t0, 0x0037($sp)
    bnel    t0, t7, lbl_800C87C4
    lbu     t4, 0x002D(a2)             # 0000002D
    lbu     t8, 0x002C(a2)             # 0000002C
    b       lbl_800C87DC
    sb      t8, 0x0000(v0)             # 00000000
    lbu     t4, 0x002D(a2)             # 0000002D
lbl_800C87C4:
    lbu     t9, 0x002C(a2)             # 0000002C
    multu   t4, t3
    mflo    t5
    addu    t6, t1, t5
    sb      t9, 0x002C(t6)             # 801246BC
    lw      t1, 0x0000(t2)             # 00000000
lbl_800C87DC:
    lbu     t8, 0x002C(a2)             # 0000002C
    lbu     t7, 0x002D(a2)             # 0000002D
    lui     t9, 0x8012                 # t9 = 80120000
    multu   t8, t3
    addiu   t9, t9, 0x4698             # t9 = 80124698
    addu    v1, s0, t9
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
    lui     a0, 0x8010                 # a0 = 80100000
    or      v0, $zero, $zero           # v0 = 00000000
    mflo    t4
    addu    t5, t1, t4
    sb      t7, 0x002D(t5)             # 0000002D
    lbu     t6, 0x0000(v1)             # 00000000
    sb      a3, 0x002C(a2)             # 0000002C
    sb      t6, 0x002D(a2)             # 0000002D
    lbu     t7, 0x0000(v1)             # 00000000
    lw      t4, 0x0000(t2)             # 00000000
    lbu     t8, 0x0037($sp)
    multu   t7, t3
    lui     t7, 0x8010                 # t7 = 80100000
    mflo    t5
    addu    t9, t4, t5
    sb      t8, 0x002C(t9)             # 801246C4
    lbu     t6, 0x0037($sp)
    sll     t8, s0,  2
    subu    t8, t8, s0
    sb      t6, 0x0000(v1)             # 00000000
    sb      $zero, 0x002A(a2)          # 0000002A
    lbu     t7, 0x438C(t7)             # 8010438C
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x46A8             # t9 = 801246A8
    sll     t4, t7,  3
    subu    t4, t4, t7
    addu    t5, t4, s0
    addu    a0, a0, t5
    lbu     a0, 0x1888(a0)             # 80101888
    sll     t8, t8,  3
    addu    a2, t8, t9
    blez    a0, lbl_800C88AC
    or      a1, a0, $zero              # a1 = 80100000
    sll     t6, v0,  3
lbl_800C8880:
    addu    v1, a2, t6
    lbu     t7, 0x0004(v1)             # 00000004
    bnel    t0, t7, lbl_800C889C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    sb      a3, 0x0004(v1)             # 00000004
    andi    v0, a0, 0x00FF             # v0 = 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000001
lbl_800C889C:
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slt     $at, v0, a1
    bnel    $at, $zero, lbl_800C8880
    sll     t6, v0,  3
lbl_800C88AC:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C88C0:
# MqDbg: Audio_ChooseActiveSfx
    addiu   $sp, $sp, 0xFF68           # $sp -= 0x98
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    lui     v0, 0x7FFF                 # v0 = 7FFF0000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0098($sp)
    or      s2, $zero, $zero           # s2 = 00000000
    ori     v0, v0, 0xFFFF             # v0 = 7FFFFFFF
    addiu   s1, $sp, 0x006C            # s1 = FFFFFFD4
    addiu   s4, $zero, 0x00FF          # s4 = 000000FF
    or      t3, $zero, $zero           # t3 = 00000000
lbl_800C8908:
    sll     t6, t3,  3
    addiu   t3, t3, 0x0001             # t3 = 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slti    $at, t3, 0x0003
    addu    a3, s1, t6
    sw      v0, 0x0000(a3)             # 00000000
    bne     $at, $zero, lbl_800C8908
    sb      s4, 0x0004(a3)             # 00000004
    lbu     t7, 0x009B($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x4368             # t9 = 80104368
    sll     t8, t7,  2
    addu    s5, t8, t9
    lw      v1, 0x0000(s5)             # 00000000
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    or      s0, $zero, $zero           # s0 = 00000000
    lbu     s3, 0x002D(v1)             # 0000002D
    addiu   s8, $zero, 0x0001          # s8 = 00000001
    addiu   s6, $zero, 0x0030          # s6 = 00000030
    beql    s7, s3, lbl_800C8D60
    addiu   s6, $zero, 0x0030          # s6 = 00000030
lbl_800C895C:
    multu   s3, s6
    mflo    a2
    addu    v0, v1, a2
    lbu     a0, 0x002A(v0)             # 80000029
    bnel    s8, a0, lbl_800C89A0
    lhu     t9, 0x0028(v0)             # 80000027
    lhu     t5, 0x0028(v0)             # 80000027
    andi    t6, t5, 0x0C00             # t6 = 00000000
    beql    t6, $zero, lbl_800C89A0
    lhu     t9, 0x0028(v0)             # 80000027
    lbu     t7, 0x002B(v0)             # 8000002A
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    sb      t8, 0x002B(v0)             # 8000002A
    lw      v1, 0x0000(s5)             # 00000000
    b       lbl_800C89E8
    addu    v0, v1, a2
    lhu     t9, 0x0028(v0)             # 80000027
lbl_800C89A0:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    andi    t5, t9, 0x0C00             # t5 = 00000000
    bnel    t5, $zero, lbl_800C89EC
    lbu     t6, 0x002B(v0)             # 8000002A
    bne     a0, $at, lbl_800C89E8
    or      a1, $zero, $zero           # a1 = 00000000
    lbu     a0, 0x002E(v0)             # 8000002D
    lui     $at, 0x0602                # $at = 06020000
    sw      a2, 0x005C($sp)
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lbu     a0, 0x009B($sp)
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    lw      a2, 0x005C($sp)
    lw      v1, 0x0000(s5)             # 00000000
    addu    v0, v1, a2
lbl_800C89E8:
    lbu     t6, 0x002B(v0)             # 0000002B
lbl_800C89EC:
    lbu     a0, 0x009B($sp)
    bnel    t6, $zero, lbl_800C8A0C
    lbu     t7, 0x002A(v0)             # 0000002A
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    b       lbl_800C8D44
    lw      v1, 0x0000(s5)             # 00000000
    lbu     t7, 0x002A(v0)             # 0000002A
lbl_800C8A0C:
    addu    t2, v1, a2
    beq     t7, $zero, lbl_800C8D44
    nop
    lw      v0, 0x0000(t2)             # 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x4394             # t8 = 80104394
    bnel    t8, v0, lbl_800C8A3C
    lw      t9, 0x0004(t2)             # 00000004
    mtc1    $zero, $f4                 # $f4 = 0.00
    b       lbl_800C8A7C
    swc1    $f4, 0x001C(t2)            # 0000001C
    lw      t9, 0x0004(t2)             # 00000004
lbl_800C8A3C:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    lwc1    $f6, 0x0000(t9)            # 00000000
    lwc1    $f12, 0x0000(v0)           # 00000000
    lw      t5, 0x0008(t2)             # 00000008
    mul.s   $f0, $f6, $f8
    lui     $at, 0x4120                # $at = 41200000
    lwc1    $f2, 0x0000(t5)            # 00000000
    mul.s   $f10, $f12, $f12
    mtc1    $at, $f8                   # $f8 = 10.00
    mul.s   $f16, $f0, $f0
    add.s   $f18, $f10, $f16
    mul.s   $f4, $f2, $f2
    add.s   $f6, $f4, $f18
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x001C(t2)           # 0000001C
lbl_800C8A7C:
    lhu     t6, 0x0026(t2)             # 00000026
    lbu     a1, 0x0024(t2)             # 00000024
    lui     $at, 0x4F00                # $at = 4F000000
    andi    t7, t6, 0x0010             # t7 = 00000000
    beq     t7, $zero, lbl_800C8AD0
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    subu    v0, s7, a1
    multu   v0, v0
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mflo    t8
    sll     t9, t8,  2
    subu    t9, t9, t8
    sll     t9, t9,  2
    subu    t9, t9, t8
    sll     t9, t9,  2
    addu    t9, t9, t8
    sll     t9, t9,  3
    addu    t9, t9, t8
    sll     t9, t9,  4
    b       lbl_800C8C00
    sw      t9, 0x0020(t2)             # 00000020
lbl_800C8AD0:
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    lui     $at, 0x4EE0                # $at = 4EE00000
    c.lt.s  $f16, $f0
    nop
    bc1fl   lbl_800C8B00
    cfc1    t5, $f31
    mtc1    $at, $f4                   # $f4 = 1879048000.00
    nop
    swc1    $f4, 0x001C(t2)            # 0000001C
    lwc1    $f0, 0x001C(t2)            # 0000001C
    cfc1    t5, $f31
lbl_800C8B00:
    ctc1    t6, $f31
    lhu     v1, 0x0028(t2)             # 00000028
    subu    v0, s7, a1
    cvt.w.s $f18, $f0
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t6, $f31
    nop
    andi    t6, t6, 0x0078             # t6 = 00000000
    beql    t6, $zero, lbl_800C8B70
    mfc1    t6, $f18
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sub.s   $f18, $f0, $f18
    ctc1    t6, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t6, $f31
    nop
    andi    t6, t6, 0x0078             # t6 = 00000000
    bne     t6, $zero, lbl_800C8B64
    nop
    mfc1    t6, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C8B7C
    or      t6, t6, $at                # t6 = 80000000
lbl_800C8B64:
    b       lbl_800C8B7C
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    mfc1    t6, $f18
lbl_800C8B70:
    nop
    bltz    t6, lbl_800C8B64
    nop
lbl_800C8B7C:
    multu   v0, v0
    ctc1    t5, $f31
    mtc1    $zero, $f6                 # $f6 = 0.00
    lui     $at, 0x40C0                # $at = 40C00000
    mflo    t7
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    addu    t8, t8, t7
    sll     t8, t8,  3
    addu    t8, t8, t7
    sll     t8, t8,  4
    addu    t9, t6, t8
    lw      t6, 0x0008(t2)             # 00000008
    addu    t5, t9, v1
    subu    t7, t5, v1
    sw      t7, 0x0020(t2)             # 00000020
    lwc1    $f2, 0x0000(t6)            # FFFFFFFF
    c.lt.s  $f2, $f6
    nop
    bc1f    lbl_800C8C00
    nop
    mtc1    $at, $f10                  # $f10 = 6.00
    neg.s   $f8, $f2
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mul.s   $f16, $f8, $f10
    trunc.w.s $f4, $f16
    mfc1    t9, $f4
    nop
    addu    t7, t7, t9
    sw      t7, 0x0020(t2)             # 00000020
lbl_800C8C00:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5ED8($at)         # 8010A128
    lui     t9, 0x8010                 # t9 = 80100000
    c.lt.s  $f18, $f0
    nop
    bc1f    lbl_800C8C70
    nop
    lbu     t6, 0x002A(t2)             # 0000002A
    addiu   $at, $zero, 0x0004         # $at = 00000004
    or      a1, $zero, $zero           # a1 = 00000000
    bnel    t6, $at, lbl_800C8D40
    andi    s0, s3, 0x00FF             # s0 = 00000000
    lbu     a0, 0x002E(t2)             # 0000002E
    lui     $at, 0x0602                # $at = 06020000
    sw      t2, 0x0084($sp)
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lw      t2, 0x0084($sp)
    lbu     a0, 0x009B($sp)
    lhu     t8, 0x0028(t2)             # 00000028
    andi    t5, t8, 0x0C00             # t5 = 00000000
    beql    t5, $zero, lbl_800C8D40
    andi    s0, s3, 0x00FF             # s0 = 00000000
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    b       lbl_800C8D3C
    andi    s3, s0, 0x00FF             # s3 = 00000000
lbl_800C8C70:
    lbu     t9, 0x438C(t9)             # 0000438C
    lbu     t6, 0x009B($sp)
    lui     t4, 0x8010                 # t4 = 80100000
    sll     t7, t9,  3
    subu    t7, t7, t9
    addu    t8, t7, t6
    addu    t4, t4, t8
    lbu     t4, 0x1888(t4)             # 80101888
    or      t3, $zero, $zero           # t3 = 00000000
    andi    t1, t4, 0x00FF             # t1 = 00000000
    blez    t1, lbl_800C8D3C
    or      t0, t1, $zero              # t0 = 00000000
    sll     t5, t3,  3
lbl_800C8CA4:
    addu    a3, s1, t5
    lw      t9, 0x0000(a3)             # 00000000
    lw      v1, 0x0020(t2)             # 00000020
    addiu   v0, t0, 0xFFFF             # v0 = FFFFFFFF
    andi    a1, v0, 0x00FF             # a1 = 000000FF
    sltu    $at, t9, v1
    bne     $at, $zero, lbl_800C8D28
    or      a2, t3, $zero              # a2 = 00000000
    slt     $at, s2, t4
    beq     $at, $zero, lbl_800C8CD8
    andi    a0, v0, 0x00FF             # a0 = 000000FF
    addiu   s2, s2, 0x0001             # s2 = 00000001
    andi    s2, s2, 0x00FF             # s2 = 00000001
lbl_800C8CD8:
    slt     $at, a2, a0
    beq     $at, $zero, lbl_800C8D20
    andi    t3, t1, 0x00FF             # t3 = 00000000
    or      v1, a1, $zero              # v1 = 000000FF
lbl_800C8CE8:
    sll     t6, v1,  3
    addu    v0, s1, t6
    lw      t8, -0x0008(v0)            # FFFFFFF7
    sll     t7, a1,  3
    addu    a0, s1, t7
    addiu   a1, a1, 0xFFFF             # a1 = 000000FE
    sw      t8, 0x0000(a0)             # 000000FF
    lbu     t5, -0x0004(v0)            # FFFFFFFB
    andi    a1, a1, 0x00FF             # a1 = 000000FE
    slt     $at, a2, a1
    or      v1, a1, $zero              # v1 = 000000FE
    bne     $at, $zero, lbl_800C8CE8
    sb      t5, 0x0004(a0)             # 00000103
    lw      v1, 0x0020(t2)             # 00000020
lbl_800C8D20:
    sw      v1, 0x0000(a3)             # 00000000
    sb      s3, 0x0004(a3)             # 00000004
lbl_800C8D28:
    addiu   t3, t3, 0x0001             # t3 = 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slt     $at, t3, t0
    bnel    $at, $zero, lbl_800C8CA4
    sll     t5, t3,  3
lbl_800C8D3C:
    andi    s0, s3, 0x00FF             # s0 = 00000000
lbl_800C8D40:
    lw      v1, 0x0000(s5)             # 00000000
lbl_800C8D44:
    multu   s0, s6
    mflo    t9
    addu    t7, v1, t9
    lbu     s3, 0x002D(t7)             # 0000002D
    bne     s7, s3, lbl_800C895C
    nop
    addiu   s6, $zero, 0x0030          # s6 = 00000030
lbl_800C8D60:
    addiu   s8, $zero, 0x0001          # s8 = 00000001
    or      t3, $zero, $zero           # t3 = 00000000
    blez    s2, lbl_800C8DD0
    or      a1, s2, $zero              # a1 = 00000001
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    addiu   v0, $zero, 0x0002          # v0 = 00000002
    sll     t6, t3,  3
lbl_800C8D7C:
    addu    t8, s1, t6
    lbu     t5, 0x0004(t8)             # 00000004
    lw      t7, 0x0000(s5)             # 00000000
    addiu   t3, t3, 0x0001             # t3 = 00000001
    multu   t5, s6
    andi    t3, t3, 0x00FF             # t3 = 00000001
    addiu   $at, $zero, 0x0004         # $at = 00000004
    mflo    t9
    addu    t2, t9, t7
    lbu     a0, 0x002A(t2)             # 0000002A
    bne     s8, a0, lbl_800C8DB4
    nop
    b       lbl_800C8DC0
    sb      v0, 0x002A(t2)             # 0000002A
lbl_800C8DB4:
    bnel    a0, $at, lbl_800C8DC4
    slt     $at, t3, a1
    sb      v1, 0x002A(t2)             # 0000002A
lbl_800C8DC0:
    slt     $at, t3, a1
lbl_800C8DC4:
    bnel    $at, $zero, lbl_800C8D7C
    sll     t6, t3,  3
    or      t3, $zero, $zero           # t3 = 00000000
lbl_800C8DD0:
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    lbu     v0, 0x009B($sp)
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t8, t6,  3
    subu    t8, t8, t6
    addu    t5, t8, v0
    addu    t1, t1, t5
    lbu     t1, 0x1888(t1)             # 80101888
    sll     t9, v0,  2
    subu    t9, t9, v0
    blez    t1, lbl_800C8FD0
    or      t0, t1, $zero              # t0 = 80100000
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x46A8             # t7 = 801246A8
    sll     t9, t9,  3
    addu    a2, t9, t7
    addiu   t4, $zero, 0x0003          # t4 = 00000003
    sll     t6, t3,  3
lbl_800C8E1C:
    addu    s3, a2, t6
    lbu     a1, 0x0004(s3)             # 00000004
    or      v1, $zero, $zero           # v1 = 00000000
    bne     s7, a1, lbl_800C8E38
    or      v0, a1, $zero              # v0 = 00000001
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8E38:
    multu   a1, s6
    lw      t5, 0x0000(s5)             # 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    mflo    t8
    addu    t2, t8, t5
    lbu     a0, 0x002A(t2)             # 0000002A
    bne     a0, $at, lbl_800C8EAC
    nop
    lhu     t9, 0x0028(t2)             # 00000028
    lbu     a0, 0x009B($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    andi    t7, t9, 0x0C00             # t7 = 00000000
    beql    t7, $zero, lbl_800C8EA4
    sb      t6, 0x002A(t2)             # 0000002A
    sw      a2, 0x005C($sp)
    sw      t0, 0x004C($sp)
    sb      t1, 0x0096($sp)
    jal     func_800C8728
    sb      t3, 0x0094($sp)
    lw      a2, 0x005C($sp)
    lw      t0, 0x004C($sp)
    lbu     t1, 0x0096($sp)
    lbu     t3, 0x0094($sp)
    addiu   t4, $zero, 0x0003          # t4 = 00000003
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sb      t6, 0x002A(t2)             # 0000002A
lbl_800C8EA4:
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8EAC:
    bne     a0, $zero, lbl_800C8EC0
    nop
    sb      s4, 0x0004(s3)             # 00000004
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8EC0:
    blez    t0, lbl_800C8EF8
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t8, a1,  3
lbl_800C8ECC:
    addu    a0, s1, t8
    lbu     t5, 0x0004(a0)             # 00000004
    bnel    v0, t5, lbl_800C8EE8
    addiu   a1, a1, 0x0001             # a1 = 00000001
    sb      s4, 0x0004(a0)             # 00000004
    andi    a1, t1, 0x00FF             # a1 = 00000000
    addiu   a1, a1, 0x0001             # a1 = 00000001
lbl_800C8EE8:
    andi    a1, a1, 0x00FF             # a1 = 00000001
    slt     $at, a1, t0
    bnel    $at, $zero, lbl_800C8ECC
    sll     t8, a1,  3
lbl_800C8EF8:
    addiu   s2, s2, 0xFFFF             # s2 = 00000000
    andi    s2, s2, 0x00FF             # s2 = 00000000
lbl_800C8F00:
    bne     s8, v1, lbl_800C8FBC
    or      t2, v1, $zero              # t2 = 00000001
    blez    t0, lbl_800C8FB0
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t9, a1,  3
lbl_800C8F14:
    addu    a0, s1, t9
    lbu     a3, 0x0004(a0)             # 00000004
    beq     s7, a3, lbl_800C8F9C
    or      v0, a3, $zero              # v0 = 00000000
    multu   a3, s6
    lw      t7, 0x0000(s5)             # 00000000
    mflo    t6
    addu    t8, t7, t6
    lbu     t5, 0x002A(t8)             # 0000002A
    beql    t4, t5, lbl_800C8FA0
    addiu   a1, a1, 0x0001             # a1 = 00000001
    blez    t0, lbl_800C8F7C
    or      s0, $zero, $zero           # s0 = 00000000
    sll     t9, s0,  3
lbl_800C8F4C:
    addu    t7, a2, t9
    lbu     t6, 0x0004(t7)             # 00000004
    bnel    v0, t6, lbl_800C8F68
    addiu   s0, s0, 0x0001             # s0 = 00000001
    or      v1, $zero, $zero           # v1 = 00000000
    andi    s0, t1, 0x00FF             # s0 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
lbl_800C8F68:
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s0, t0
    bnel    $at, $zero, lbl_800C8F4C
    sll     t9, s0,  3
    or      t2, v1, $zero              # t2 = 00000000
lbl_800C8F7C:
    bnel    s8, t2, lbl_800C8FA0
    addiu   a1, a1, 0x0001             # a1 = 00000002
    addiu   a1, t0, 0x0001             # a1 = 00000001
    addiu   s2, s2, 0xFFFF             # s2 = FFFFFFFF
    sb      a3, 0x0004(s3)             # 00000004
    sb      s4, 0x0004(a0)             # 00000004
    andi    a1, a1, 0x00FF             # a1 = 00000001
    andi    s2, s2, 0x00FF             # s2 = 000000FF
lbl_800C8F9C:
    addiu   a1, a1, 0x0001             # a1 = 00000002
lbl_800C8FA0:
    andi    a1, a1, 0x00FF             # a1 = 00000002
    slt     $at, a1, t0
    bnel    $at, $zero, lbl_800C8F14
    sll     t9, a1,  3
lbl_800C8FB0:
    bnel    t0, a1, lbl_800C8FC0
    addiu   t3, t3, 0x0001             # t3 = 00000001
    sb      s4, 0x0004(s3)             # 00000004
lbl_800C8FBC:
    addiu   t3, t3, 0x0001             # t3 = 00000002
lbl_800C8FC0:
    andi    t3, t3, 0x00FF             # t3 = 00000002
    slt     $at, t3, t0
    bnel    $at, $zero, lbl_800C8E1C
    sll     t6, t3,  3
lbl_800C8FD0:
    lw      $ra, 0x003C($sp)
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
    addiu   $sp, $sp, 0x0098           # $sp += 0x98


func_800C9000:
# MqDbg: Audio_PlayActiveSfx
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      s2, 0x0020($sp)
    sll     t7, t6,  3
    andi    s2, a0, 0x00FF             # s2 = 00000000
    subu    t7, t7, t6
    addu    t8, t7, s2
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t8
    lbu     v1, 0x1888(v1)             # 80101888
    sw      s4, 0x0028($sp)
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0060($sp)
    blez    v1, lbl_800C92F0
    or      s4, $zero, $zero           # s4 = 00000000
    sll     t9, s2,  2
    subu    t9, t9, s2
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x46A8             # t0 = 801246A8
    sll     t9, t9,  3
    addu    t1, t9, t0
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x4750             # s3 = 80124750
    sw      t1, 0x0044($sp)
    addiu   s8, $zero, 0x0004          # s8 = 00000004
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    lui     s6, 0x0602                 # s6 = 06020000
lbl_800C908C:
    lw      t2, 0x0044($sp)
    sll     t3, s4,  3
    sll     t5, s2,  2
    addu    t4, t2, t3
    lbu     s1, 0x0004(t4)             # 00000004
    lui     t6, 0x8010                 # t6 = 80100000
    addu    t6, t6, t5
    beq     s7, s1, lbl_800C92D4
    sll     t7, s1,  2
    lw      t6, 0x4368(t6)             # 80104368
    subu    t7, t7, s1
    lbu     a2, 0x0000(s3)             # 80124750
    sll     t7, t7,  4
    addu    s0, t6, t7
    lbu     v0, 0x002A(s0)             # 0000002A
    lui     a0, 0x8013                 # a0 = 80130000
    sll     t8, a2,  2
    addu    a0, a0, t8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_800C9228
    lw      a0, -0x71A8(a0)            # 80128E58
    lhu     v0, 0x0026(s0)             # 00000026
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x1880             # t9 = 80101880
    andi    t0, v0, 0x0008             # t0 = 00000000
    sb      a2, 0x002E(s0)             # 0000002E
    beq     t0, $zero, lbl_800C9108
    addu    s5, s2, t9
    jal     func_800C7F98
    lbu     a0, 0x0000(s3)             # 80124750
    lhu     v0, 0x0026(s0)             # 00000026
lbl_800C9108:
    andi    v1, v0, 0x00C0             # v1 = 00000000
    beq     v1, $zero, lbl_800C916C
    addiu   $at, $zero, 0x0040         # $at = 00000040
    beq     v1, $at, lbl_800C9134
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beq     v1, $at, lbl_800C9148
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    beq     v1, $at, lbl_800C915C
    nop
    b       lbl_800C916C
    sb      $zero, 0x002F(s0)          # 0000002F
lbl_800C9134:
    jal     func_800BBD80
    nop
    andi    t1, v0, 0x000F             # t1 = 00000000
    b       lbl_800C916C
    sb      t1, 0x002F(s0)             # 0000002F
lbl_800C9148:
    jal     func_800BBD80
    nop
    andi    t2, v0, 0x001F             # t2 = 00000000
    b       lbl_800C916C
    sb      t2, 0x002F(s0)             # 0000002F
lbl_800C915C:
    jal     func_800BBD80
    nop
    andi    t3, v0, 0x003F             # t3 = 00000000
    sb      t3, 0x002F(s0)             # 0000002F
lbl_800C916C:
    andi    a0, s2, 0x00FF             # a0 = 00000000
    andi    a1, s1, 0x00FF             # a1 = 00000000
    jal     func_800C473C
    lbu     a2, 0x0000(s3)             # 80124750
    lbu     t5, 0x0000(s3)             # 80124750
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sll     t6, t5,  8
    jal     func_800BB0E0
    or      a0, t6, s6                 # a0 = 06020000
    lbu     t8, 0x0000(s3)             # 80124750
    lhu     a1, 0x0028(s0)             # 00000028
    sll     t9, t8,  8
    or      a0, t9, s6                 # a0 = 06020000
    sll     a1, a1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0004             # a0 = 06020004
    lbu     t0, 0x0000(s5)             # 00000000
    beql    t0, $zero, lbl_800C91E8
    lhu     t4, 0x0028(s0)             # 00000028
    lhu     a1, 0x0028(s0)             # 00000028
    lbu     t2, 0x0000(s3)             # 80124750
    andi    a1, a1, 0x0100             # a1 = 00000000
    sra     a1, a1,  8
    sll     t3, t2,  8
    or      a0, t3, s6                 # a0 = 06020000
    sll     a1, a1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0005             # a0 = 06020005
    lhu     t4, 0x0028(s0)             # 00000028
lbl_800C91E8:
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t6, $zero, 0x0005          # t6 = 00000005
    andi    t5, t4, 0x0C00             # t5 = 00000000
    beql    t5, $zero, lbl_800C9208
    sb      t6, 0x002A(s0)             # 0000002A
    b       lbl_800C9208
    sb      s8, 0x002A(s0)             # 0000002A
    sb      t6, 0x002A(s0)             # 0000002A
lbl_800C9208:
    lbu     t7, 0x438C(t7)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t8, t7,  3
    subu    t8, t8, t7
    addu    t9, t8, s2
    addu    v1, v1, t9
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C9228:
    lbu     t0, 0x00C5(a0)             # 000000C5
    andi    a0, s2, 0x00FF             # a0 = 00000000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s7, t0, lbl_800C9268
    nop
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
    lui     t1, 0x8010                 # t1 = 80100000
    lbu     t1, 0x438C(t1)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t2, t1,  3
    subu    t2, t2, t1
    addu    t3, t2, s2
    addu    v1, v1, t3
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C9268:
    bne     v0, $at, lbl_800C92D4
    andi    a0, s2, 0x00FF             # a0 = 00000000
    jal     func_800C473C
    andi    a1, s1, 0x00FF             # a1 = 00000000
    lhu     t4, 0x0028(s0)             # 00000028
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t9, $zero, 0x0005          # t9 = 00000005
    andi    t5, t4, 0x0C00             # t5 = 00000000
    beq     t5, $zero, lbl_800C92B4
    lui     t0, 0x8010                 # t0 = 80100000
    sb      s8, 0x002A(s0)             # 0000002A
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    t8, t7, s2
    addu    v1, v1, t8
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C92B4:
    sb      t9, 0x002A(s0)             # 0000002A
    lbu     t0, 0x438C(t0)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t1, t0,  3
    subu    t1, t1, t0
    addu    t2, t1, s2
    addu    v1, v1, t2
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C92D4:
    lbu     t3, 0x0000(s3)             # 80124750
    addiu   s4, s4, 0x0001             # s4 = 00000001
    andi    s4, s4, 0x00FF             # s4 = 00000001
    slt     $at, s4, v1
    addiu   t4, t3, 0x0001             # t4 = 00000001
    bne     $at, $zero, lbl_800C908C
    sb      t4, 0x0000(s3)             # 80124750
lbl_800C92F0:
    lw      $ra, 0x003C($sp)
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
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C9320:
# MqDbg: Audio_StopSfxByBank
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      s6, 0x0030($sp)
    andi    s6, a0, 0x00FF             # s6 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s2, 0x0020($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s6,  2
    addu    s2, t6, t7
    lw      v1, 0x0000(s2)             # 00000000
    sw      $ra, 0x0034($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0080($sp)
    lbu     s1, 0x002D(v1)             # 0000002D
    addiu   s3, $zero, 0x00FF          # s3 = 000000FF
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    beq     s3, s1, lbl_800C93C8
    lui     s5, 0x0602                 # s5 = 06020000
lbl_800C9374:
    multu   s1, s4
    mflo    t8
    addu    s0, v1, t8
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C93A8
    nop
    lbu     t0, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t1, t0,  8
    jal     func_800BB0E0
    or      a0, t1, s5                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C93A8:
    beq     v0, $zero, lbl_800C93B8
    andi    a0, s6, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C93B8:
    lw      v1, 0x0000(s2)             # 00000000
    lbu     s1, 0x002D(v1)             # 0000002D
    bne     s3, s1, lbl_800C9374
    nop
lbl_800C93C8:
    sll     t2, s6, 12
    sh      t2, 0x0070($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800C80EC
    addiu   a1, $sp, 0x0048            # a1 = FFFFFFC8
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080           # $sp += 0x80


func_800C9404:
# MqDbg: func_800F8884
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s5, 0x002C($sp)
    andi    s5, a0, 0x00FF             # s5 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s4, 0x0028($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s5,  2
    addu    s4, t6, t7
    lw      v0, 0x0000(s4)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0040($sp)
    lbu     s1, 0x002D(v0)             # 0000002D
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    or      s6, a1, $zero              # s6 = 00000000
    beq     s7, s1, lbl_800C94F0
    or      s2, $zero, $zero           # s2 = 00000000
    addiu   s8, $zero, 0x0030          # s8 = 00000030
lbl_800C9464:
    multu   s1, s8
    mflo    t8
    addu    s0, v0, t8
    lw      t9, 0x0000(s0)             # 00000000
    bnel    s6, t9, lbl_800C94D4
    andi    s2, s1, 0x00FF             # s2 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    sll     s3, s2,  2
    subu    s3, s3, s2
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C94B0
    sll     s3, s3,  4
    lbu     a0, 0x002E(s0)             # 0000002E
    lui     $at, 0x0602                # $at = 06020000
    or      a1, $zero, $zero           # a1 = 00000000
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C94B0:
    beq     v0, $zero, lbl_800C94C0
    andi    a0, s5, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C94C0:
    lw      v0, 0x0000(s4)             # 00000000
    addu    t0, v0, s3
    b       lbl_800C94E8
    lbu     s1, 0x002D(t0)             # 0000002D
    andi    s2, s1, 0x00FF             # s2 = 00000000
lbl_800C94D4:
    sll     t1, s2,  2
    subu    t1, t1, s2
    sll     t1, t1,  4
    addu    t2, v0, t1
    lbu     s1, 0x002D(t2)             # 0000002D
lbl_800C94E8:
    bne     s7, s1, lbl_800C9464
    nop
lbl_800C94F0:
    lw      $ra, 0x003C($sp)
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
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800C9520:
# MqDbg: Audio_StopSfxByPosAndBank
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a1, 0x004C($sp)
    jal     func_800C9404
    lbu     a0, 0x004B($sp)
    lbu     t6, 0x004B($sp)
    lw      t8, 0x004C($sp)
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sll     t7, t6, 12
    sh      t7, 0x0040($sp)
    addiu   a1, $sp, 0x0018            # a1 = FFFFFFD0
    jal     func_800C80EC
    sw      t8, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800C9568:
# MqDbg: Audio_StopSfxByPos
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x001C($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    andi    a0, s0, 0x00FF             # a0 = 00000000
lbl_800C9584:
    jal     func_800C9404
    or      a1, s1, $zero              # a1 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0007
    bnel    $at, $zero, lbl_800C9584
    andi    a0, s0, 0x00FF             # a0 = 00000001
    sw      s1, 0x0024($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    jal     func_800C80EC
    addiu   a1, $sp, 0x0024            # a1 = FFFFFFCC
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058           # $sp += 0x58


func_800C95C4:
# MqDbg: Audio_StopSfxByPosAndId
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      s7, 0x0034($sp)
    sw      a1, 0x008C($sp)
    lhu     s7, 0x008E($sp)
    sw      s8, 0x0038($sp)
    lui     t7, 0x8010                 # t7 = 80100000
    andi    s8, s7, 0xF000             # s8 = 00000000
    sra     s8, s8, 12
    andi    s8, s8, 0x00FF             # s8 = 00000000
    sw      s3, 0x0024($sp)
    sll     t6, s8,  2
    addiu   t7, t7, 0x4368             # t7 = 80104368
    addu    s3, t6, t7
    lw      t8, 0x0000(s3)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0088($sp)
    lbu     s1, 0x002D(t8)             # 0000002D
    addiu   s5, $zero, 0x00FF          # s5 = 000000FF
    or      s4, $zero, $zero           # s4 = 00000000
    beq     s5, s1, lbl_800C96D4
    or      v0, s1, $zero              # v0 = 00000000
    lui     s6, 0x0602                 # s6 = 06020000
    addiu   s2, $zero, 0x0030          # s2 = 00000030
lbl_800C9638:
    multu   s1, s2
    lw      t9, 0x0000(s3)             # 00000000
    lw      t1, 0x0088($sp)
    mflo    t0
    addu    s0, t9, t0
    lw      t2, 0x0000(s0)             # 00000000
    bnel    t1, t2, lbl_800C96AC
    andi    s4, s1, 0x00FF             # s4 = 00000000
    lhu     t3, 0x0028(s0)             # 00000028
    bnel    s7, t3, lbl_800C96AC
    andi    s4, s1, 0x00FF             # s4 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C968C
    nop
    lbu     t5, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t6, t5,  8
    jal     func_800BB0E0
    or      a0, t6, s6                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C968C:
    beq     v0, $zero, lbl_800C969C
    andi    a0, s8, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C969C:
    addiu   s1, $zero, 0x00FF          # s1 = 000000FF
    b       lbl_800C96AC
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    andi    s4, s1, 0x00FF             # s4 = 000000FF
lbl_800C96AC:
    beq     s5, v0, lbl_800C96CC
    nop
    multu   s4, s2
    lw      t7, 0x0000(s3)             # 00000000
    mflo    t8
    addu    t9, t7, t8
    lbu     s1, 0x002D(t9)             # 0000002D
    or      v0, s1, $zero              # v0 = 000000FF
lbl_800C96CC:
    bne     s5, v0, lbl_800C9638
    nop
lbl_800C96D4:
    lw      t0, 0x0088($sp)
    lhu     t1, 0x008E($sp)
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $sp, 0x0050            # a1 = FFFFFFC8
    sw      t0, 0x0050($sp)
    jal     func_800C80EC
    sh      t1, 0x0078($sp)
    lw      $ra, 0x003C($sp)
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


func_800C9720:
# MqDbg: Audio_StopSfxByTokenAndId
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s8, 0x0038($sp)
    sw      a1, 0x0094($sp)
    lhu     s8, 0x0096($sp)
    lui     t0, 0x8010                 # t0 = 80100000
    sw      s4, 0x0028($sp)
    andi    t6, s8, 0xF000             # t6 = 00000000
    sra     t7, t6, 12
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8,  2
    addiu   t0, t0, 0x4368             # t0 = 80104368
    addu    s4, t9, t0
    lw      t1, 0x0000(s4)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0090($sp)
    sw      t8, 0x0050($sp)
    lbu     s1, 0x002D(t1)             # 0000002D
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      s5, $zero, $zero           # s5 = 00000000
    beq     s6, s1, lbl_800C9838
    or      s2, s1, $zero              # s2 = 00000000
    lbu     t2, 0x0093($sp)
    lui     s7, 0x0602                 # s7 = 06020000
    addiu   s3, $zero, 0x0030          # s3 = 00000030
    sw      t2, 0x0044($sp)
lbl_800C97A0:
    multu   s1, s3
    lw      t3, 0x0000(s4)             # 00000000
    lw      t5, 0x0044($sp)
    mflo    t4
    addu    s0, t3, t4
    lbu     t6, 0x000C(s0)             # 0000000C
    bnel    t5, t6, lbl_800C9810
    andi    s5, s1, 0x00FF             # s5 = 00000000
    lhu     t7, 0x0028(s0)             # 00000028
    bnel    s8, t7, lbl_800C9810
    andi    s5, s1, 0x00FF             # s5 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C97F4
    nop
    lbu     t9, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t0, t9,  8
    jal     func_800BB0E0
    or      a0, t0, s7                 # a0 = 86124368
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C97F4:
    beq     v0, $zero, lbl_800C9810
    lbu     a0, 0x0053($sp)
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
    b       lbl_800C9810
    nop
    andi    s5, s1, 0x00FF             # s5 = 00000000
lbl_800C9810:
    beq     s6, s2, lbl_800C9830
    nop
    multu   s5, s3
    lw      t1, 0x0000(s4)             # 00000000
    mflo    t2
    addu    t3, t1, t2
    lbu     s1, 0x002D(t3)             # 0000002D
    or      s2, s1, $zero              # s2 = 00000000
lbl_800C9830:
    bne     s6, s2, lbl_800C97A0
    nop
lbl_800C9838:
    lbu     t4, 0x0093($sp)
    lhu     t5, 0x0096($sp)
    addiu   a0, $zero, 0x0004          # a0 = 00000004
    addiu   a1, $sp, 0x0058            # a1 = FFFFFFC8
    sb      t4, 0x0064($sp)
    jal     func_800C80EC
    sh      t5, 0x0080($sp)
    lw      $ra, 0x003C($sp)
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
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_800C9884:
# MqDbg: Audio_StopSfxById
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      s4, 0x0028($sp)
    andi    s4, a0, 0xF000             # s4 = 00000000
    srl     s4, s4, 12
    andi    s4, s4, 0x00FF             # s4 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s5, 0x002C($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s4,  2
    addu    s5, t6, t7
    lw      v0, 0x0000(s5)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0088($sp)
    lbu     s1, 0x002D(v0)             # 0000002D
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      s2, $zero, $zero           # s2 = 00000000
    beq     s6, s1, lbl_800C9978
    addiu   s7, $zero, 0x0030          # s7 = 00000030
    lui     s8, 0x0602                 # s8 = 06020000
lbl_800C98EC:
    multu   s1, s7
    lw      t9, 0x0088($sp)
    mflo    t8
    addu    s0, v0, t8
    lhu     t0, 0x0028(s0)             # 00000028
    bnel    t9, t0, lbl_800C995C
    andi    s2, s1, 0x00FF             # s2 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    sll     s3, s2,  2
    subu    s3, s3, s2
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C9938
    sll     s3, s3,  4
    lbu     t2, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t3, t2,  8
    jal     func_800BB0E0
    or      a0, t3, s8                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C9938:
    beq     v0, $zero, lbl_800C9948
    andi    a0, s4, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C9948:
    lw      v0, 0x0000(s5)             # 00000000
    addu    t4, v0, s3
    b       lbl_800C9970
    lbu     s1, 0x002D(t4)             # 0000002D
    andi    s2, s1, 0x00FF             # s2 = 00000000
lbl_800C995C:
    sll     t5, s2,  2
    subu    t5, t5, s2
    sll     t5, t5,  4
    addu    t6, v0, t5
    lbu     s1, 0x002D(t6)             # 0000002D
lbl_800C9970:
    bne     s6, s1, lbl_800C98EC
    nop
lbl_800C9978:
    lw      t7, 0x0088($sp)
    addiu   a0, $zero, 0x0005          # a0 = 00000005
    addiu   a1, $sp, 0x0050            # a1 = FFFFFFC8
    jal     func_800C80EC
    sh      t7, 0x0078($sp)
    lw      $ra, 0x003C($sp)
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


func_800C99BC:
# MqDbg: Audio_ProcessSfxRequests
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    lui     s0, 0x8010                 # s0 = 80100000
    lui     s1, 0x8010                 # s1 = 80100000
    addiu   s1, s1, 0x4360             # s1 = 80104360
    addiu   s0, s0, 0x4364             # s0 = 80104364
    lbu     t6, 0x0000(s0)             # 80104364
    lbu     t7, 0x0000(s1)             # 80104360
    sw      $ra, 0x001C($sp)
    beql    t6, t7, lbl_800C9A10
    lw      $ra, 0x001C($sp)
lbl_800C99EC:
    jal     func_800C828C
    nop
    lbu     t8, 0x0000(s0)             # 80104364
    lbu     t1, 0x0000(s1)             # 80104360
    addiu   t9, t8, 0x0001             # t9 = 00000001
    andi    t0, t9, 0x00FF             # t0 = 00000001
    bne     t0, t1, lbl_800C99EC
    sb      t9, 0x0000(s0)             # 80104364
    lw      $ra, 0x001C($sp)
lbl_800C9A10:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800C9A20:
# MqDbg: Audio_SetUnusedBankLerp
    sw      a2, 0x0008($sp)
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    bne     a2, $zero, lbl_800C9A44
    andi    a0, a0, 0x00FF             # a0 = 00000000
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a2, a2, 0xFFFF             # a2 = 00000001
lbl_800C9A44:
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4760             # t7 = 80124760
    sll     t6, a0,  4
    addu    v0, t6, t7
    bgez    a1, lbl_800C9A70
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C9A70:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lwc1    $f16, 0x0000(v0)           # 00000000
    mtc1    a2, $f4                    # $f4 = 0.00
    div.s   $f0, $f6, $f10
    sh      a2, 0x000C(v0)             # 0000000C
    lui     $at, 0x4F80                # $at = 4F800000
    cvt.s.w $f8, $f4
    swc1    $f0, 0x0004(v0)            # 00000004
    bgez    a2, lbl_800C9AA8
    sub.s   $f18, $f16, $f0
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f8, $f8, $f6
lbl_800C9AA8:
    div.s   $f10, $f18, $f8
    jr      $ra
    swc1    $f10, 0x0008(v0)           # 00000008


func_800C9AB4:
# MqDbg: Audio_StepUnusedBankLerp
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4760             # t7 = 80124760
    sll     t6, a0,  4
    addu    v0, t6, t7
    lhu     v1, 0x000C(v0)             # 0000000C
    beq     v1, $zero, lbl_800C9B00
    addiu   t8, v1, 0xFFFF             # t8 = FFFFFFFF
    andi    t9, t8, 0xFFFF             # t9 = 0000FFFF
    beq     t9, $zero, lbl_800C9AF8
    sh      t8, 0x000C(v0)             # 0000000C
    lwc1    $f4, 0x0000(v0)            # 00000000
    lwc1    $f6, 0x0008(v0)            # 00000008
    sub.s   $f8, $f4, $f6
    jr      $ra
    swc1    $f8, 0x0000(v0)            # 00000000
lbl_800C9AF8:
    lwc1    $f10, 0x0004(v0)           # 00000004
    swc1    $f10, 0x0000(v0)           # 00000000
lbl_800C9B00:
    jr      $ra
    nop


func_800C9B08:
# MqDbg: func_800F8F88
    lui     t7, 0x8013                 # t7 = 80130000
    lw      t7, -0x71A8(t7)            # 80128E58
    lui     t6, 0x8013                 # t6 = 80130000
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    addiu   t6, t6, 0xB0E0             # t6 = 8012B0E0
    sw      $ra, 0x001C($sp)
    beq     t6, t7, lbl_800C9B60
    sw      s0, 0x0018($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x4750($at)         # 80124750
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C9B34:
    jal     func_800C88C0
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800C9000
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800C9AB4
    andi    a0, s0, 0x00FF             # a0 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0007
    bne     $at, $zero, lbl_800C9B34
    nop
lbl_800C9B60:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C9B74:
# MqDbg: Audio_IsSfxPlaying
    andi    t6, a0, 0xF000             # t6 = 00000000
    srl     t7, t6, 12
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8,  2
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t9
    lw      v1, 0x4368(v1)             # 80104368
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    addiu   a3, $zero, 0x0030          # a3 = 00000030
    lbu     v0, 0x002D(v1)             # 8010002D
    beql    a2, v0, lbl_800C9BD4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C9BA4:
    multu   v0, a3
    mflo    t0
    addu    a1, v1, t0
    lhu     t1, 0x0028(a1)             # 00000028
    bnel    a0, t1, lbl_800C9BC8
    lbu     v0, 0x002D(a1)             # 0000002D
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C9BC4:
    lbu     v0, 0x002D(a1)             # 0000002D
lbl_800C9BC8:
    bne     a2, v0, lbl_800C9BA4
    nop
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C9BD4:
    jr      $ra
    nop


func_800C9BDC:
# MqDbg: Audio_ResetSfx
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x4360($at)         # 80104360
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x4364($at)         # 80104364
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x4390($at)         # 80104390
    lui     $at, 0x3F80                # $at = 3F800000
    lui     t1, 0x8012                 # t1 = 80120000
    lui     t0, 0x8012                 # t0 = 80120000
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   a0, a0, 0x4690             # a0 = 80124690
    addiu   a1, a1, 0x4698             # a1 = 80124698
    addiu   a3, a3, 0x46A0             # a3 = 801246A0
    addiu   t0, t0, 0x4754             # t0 = 80124754
    addiu   t1, t1, 0x4760             # t1 = 80124760
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800C9C2C:
    addu    t6, a0, v0
    addu    t7, a1, v0
    sb      $zero, 0x0000(t6)          # 00000000
    addu    t8, a3, v0
    addu    t9, t0, v0
    sll     t4, v0,  4
    addiu   v0, v0, 0x0001             # v0 = 00000001
    sb      a2, 0x0000(t7)             # 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000001
    sb      $zero, 0x0000(t8)          # 00000000
    slti    $at, v0, 0x0007
    sb      $zero, 0x0000(t9)          # 00000000
    addu    v1, t1, t4
    swc1    $f0, 0x0000(v1)            # 00000000
    bne     $at, $zero, lbl_800C9C2C
    sh      $zero, 0x000C(v1)          # 0000000C
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    sll     t5, v0,  2
lbl_800C9C78:
    subu    t5, t5, v0
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x46A8             # t6 = 801246A8
    sll     t5, t5,  3
    addu    a0, t5, t6
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C9C90:
    sll     t7, v1,  3
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slti    $at, v1, 0x0003
    addu    t8, a0, t7
    bne     $at, $zero, lbl_800C9C90
    sb      t0, 0x0004(t8)             # 00000004
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    bnel    $at, $zero, lbl_800C9C78
    sll     t5, v0,  2
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x4368             # t1 = 80104368
    addiu   t2, t2, 0x4384             # t2 = 80104384
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t3, $zero, 0x0030          # t3 = 00000030
lbl_800C9CD8:
    sll     t9, v0,  2
    addu    a1, t1, t9
    lw      t4, 0x0000(a1)             # 80124698
    addu    a2, t2, v0
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sb      t0, 0x002C(t4)             # 0000002C
    lw      t5, 0x0000(a1)             # 80124698
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sb      t0, 0x002D(t5)             # 0000002D
    lbu     t6, 0x0000(a2)             # 00000001
    addiu   t7, t6, 0xFFFF             # t7 = 801246A7
    slti    $at, t7, 0x0002
    bne     $at, $zero, lbl_800C9D58
    nop
lbl_800C9D10:
    multu   v1, t3
    lw      t9, 0x0000(a1)             # 80124698
    addiu   t8, a0, 0xFFFF             # t8 = 00000000
    addiu   t5, a0, 0x0001             # t5 = 00000002
    addiu   v1, v1, 0x0001             # v1 = 00000002
    andi    v1, v1, 0x00FF             # v1 = 00000002
    or      a0, v1, $zero              # a0 = 00000002
    mflo    a3
    addu    t4, t9, a3
    sb      t8, 0x002C(t4)             # 0000002C
    lw      t6, 0x0000(a1)             # 80124698
    addu    t7, t6, a3
    sb      t5, 0x002D(t7)             # 801246D4
    lbu     t9, 0x0000(a2)             # 00000001
    addiu   t8, t9, 0xFFFF             # t8 = FFFFFFFF
    slt     $at, v1, t8
    bne     $at, $zero, lbl_800C9D10
    nop
lbl_800C9D58:
    multu   v1, t3
    lw      t6, 0x0000(a1)             # 80124698
    addiu   t4, v1, 0xFFFF             # t4 = 00000001
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    mflo    a3
    addu    t5, t6, a3
    sb      t4, 0x002C(t5)             # 0000002E
    lw      t7, 0x0000(a1)             # 80124698
    addu    t9, t7, a3
    bne     $at, $zero, lbl_800C9CD8
    sb      t0, 0x002D(t9)             # 0000002D
    jr      $ra
    nop
    nop
    nop
    nop
