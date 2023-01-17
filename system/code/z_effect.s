# Particle Effects
#
# Starts at VRAM: 8001A880 / VROM: A907E0
#

.section .text
func_8001A880:
# MqDbg: Effect_GetPlayState
    lui     v0, 0x8011                 # v0 = 80110000
    lw      v0, 0x4DE0(v0)             # 80114DE0
    jr      $ra
    nop


func_8001A890:
# MqDbg: Effect_GetByIndex
    addiu   $at, $zero, 0x001F         # $at = 0000001F
    bnel    a0, $at, lbl_8001A8A8
    slti    $at, a0, 0x0003
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001A8A4:
    slti    $at, a0, 0x0003
lbl_8001A8A8:
    beq     $at, $zero, lbl_8001A8F4
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  3
    addu    t6, t6, a0
    lui     t7, 0x8011                 # t7 = 80110000
    addiu   t7, t7, 0x4DE0             # t7 = 80114DE0
    sll     t6, t6,  3
    addu    v1, t6, t7
    lbu     t8, 0x0004(v1)             # 00000004
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t8, $at, lbl_8001A8EC
    nop
    jr      $ra
    addiu   v0, v1, 0x0008             # v0 = 00000008
lbl_8001A8EC:
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001A8F4:
    addiu   a0, a0, 0xFFFD             # a0 = FFFFFFFD
    slti    $at, a0, 0x0019
    beq     $at, $zero, lbl_8001A940
    sll     t9, a0,  3
    subu    t9, t9, a0
    sll     t9, t9,  2
    subu    t9, t9, a0
    lui     t0, 0x8011                 # t0 = 80110000
    addiu   t0, t0, 0x4DE0             # t0 = 80114DE0
    sll     t9, t9,  4
    addu    v1, t9, t0
    lbu     t1, 0x0E5C(v1)             # 00000E5C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t1, $at, lbl_8001A938
    nop
    jr      $ra
    addiu   v0, v1, 0x0E60             # v0 = 00000E60
lbl_8001A938:
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001A940:
    addiu   a0, a0, 0xFFE7             # a0 = FFFFFFE4
    slti    $at, a0, 0x0003
    beq     $at, $zero, lbl_8001A998
    or      v0, $zero, $zero           # v0 = 00000000
    sll     t2, a0,  3
    subu    t2, t2, a0
    sll     t2, t2,  2
    addu    t2, t2, a0
    sll     t2, t2,  2
    subu    t2, t2, a0
    lui     t3, 0x8011                 # t3 = 80110000
    addiu   t3, t3, 0x4DE0             # t3 = 80114DE0
    sll     t2, t2,  2
    addu    v1, t2, t3
    lbu     t4, 0x388C(v1)             # 0000388C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t4, $at, lbl_8001A990
    nop
    jr      $ra
    addiu   v0, v1, 0x3890             # v0 = 00003890
lbl_8001A990:
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001A998:
    jr      $ra
    nop


func_8001A9A0:
# MqDbg: Effect_InitStatus
    sb      $zero, 0x0000(a0)          # 00000000
    sb      $zero, 0x0001(a0)          # 00000001
    sb      $zero, 0x0002(a0)          # 00000002
    jr      $ra
    nop


func_8001A9B4:
# MqDbg: Effect_InitContext
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0020($sp)
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s1, 0x8011                 # s1 = 80110000
    addiu   s1, s1, 0x5C3C             # s1 = 80115C3C
    addiu   s0, s0, 0x4DE4             # s0 = 80114DE4
lbl_8001A9D8:
    jal     func_8001A9A0
    or      a0, s0, $zero              # a0 = 80114DE4
    addiu   s0, s0, 0x04C8             # s0 = 801152AC
    sltu    $at, s0, s1
    bne     $at, $zero, lbl_8001A9D8
    nop
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x866C             # s1 = 8011866C
    addiu   s0, s0, 0x5C3C             # s0 = 80115C3C
lbl_8001AA00:
    jal     func_8001A9A0
    or      a0, s0, $zero              # a0 = 80115C3C
    addiu   s0, s0, 0x01B0             # s0 = 80115DEC
    sltu    $at, s0, s1
    bne     $at, $zero, lbl_8001AA00
    nop
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s1, 0x8011                 # s1 = 80110000
    addiu   s1, s1, 0x614C             # s1 = 8011614C
    addiu   s0, s0, 0x5C3C             # s0 = 80115C3C
lbl_8001AA28:
    jal     func_8001A9A0
    or      a0, s0, $zero              # a0 = 80115C3C
    addiu   s0, s0, 0x01B0             # s0 = 80115DEC
    bne     s0, s1, lbl_8001AA28
    nop
    lw      t6, 0x0020($sp)
    lui     $at, 0x8011                # $at = 80110000
    lw      $ra, 0x001C($sp)
    sw      t6, 0x4DE0($at)            # 80114DE0
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_8001AA5C:
# MqDbg: Effect_Add
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a1, 0x002C($sp)
    sw      a3, 0x0034($sp)
    lw      t7, 0x002C($sp)
    sw      $zero, 0x001C($sp)
    addiu   t6, $zero, 0x001F          # t6 = 0000001F
    sw      t6, 0x0000(t7)             # 00000000
    sw      $zero, 0x0018($sp)
    jal     func_8009DB54
    sw      a2, 0x0030($sp)
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lw      a2, 0x0030($sp)
    lw      a3, 0x001C($sp)
    lw      t0, 0x0018($sp)
    beq     v0, v1, lbl_8001ABCC
    lw      t1, 0x002C($sp)
    beq     a2, $zero, lbl_8001AAC8
    or      a1, $zero, $zero           # a1 = 00000000
    beq     a2, v1, lbl_8001AB0C
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a2, $at, lbl_8001AB0C
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    beq     a2, a0, lbl_8001AB50
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_8001AB84
    nop
lbl_8001AAC8:
    lui     v1, 0x8011                 # v1 = 80110000
    addiu   v1, v1, 0x4DE0             # v1 = 80114DE0
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
lbl_8001AAD8:
    lbu     t8, 0x0004(v1)             # 80114DE4
    bnel    t8, $zero, lbl_8001AAFC
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      v0, 0x0000(t1)             # 00000000
    addiu   a3, v1, 0x0008             # a3 = 80114DE8
    b       lbl_8001AB84
    addiu   t0, v1, 0x0004             # t0 = 80114DE4
    addiu   v0, v0, 0x0001             # v0 = 00000002
lbl_8001AAFC:
    bne     v0, a0, lbl_8001AAD8
    addiu   v1, v1, 0x04C8             # v1 = 801152A8
    b       lbl_8001AB84
    nop
lbl_8001AB0C:
    lui     v1, 0x8011                 # v1 = 80110000
    addiu   v1, v1, 0x4DE0             # v1 = 80114DE0
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a0, $zero, 0x0019          # a0 = 00000019
lbl_8001AB1C:
    lbu     t9, 0x0E5C(v1)             # 80115C3C
    bne     t9, $zero, lbl_8001AB3C
    addiu   t2, v0, 0x0003             # t2 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      t2, 0x0000(t1)             # 00000000
    addiu   a3, v1, 0x0E60             # a3 = 80115C40
    b       lbl_8001AB84
    addiu   t0, v1, 0x0E5C             # t0 = 80115C3C
lbl_8001AB3C:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    bne     v0, a0, lbl_8001AB1C
    addiu   v1, v1, 0x01B0             # v1 = 80114F90
    b       lbl_8001AB84
    nop
lbl_8001AB50:
    lui     v1, 0x8011                 # v1 = 80110000
    addiu   v1, v1, 0x4DE0             # v1 = 80114DE0
lbl_8001AB58:
    lbu     t3, 0x388C(v1)             # 8011866C
    bne     t3, $zero, lbl_8001AB78
    addiu   t4, v0, 0x001C             # t4 = 0000001D
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      t4, 0x0000(t1)             # 00000000
    addiu   a3, v1, 0x3890             # a3 = 80118670
    b       lbl_8001AB84
    addiu   t0, v1, 0x388C             # t0 = 8011866C
lbl_8001AB78:
    addiu   v0, v0, 0x0001             # v0 = 00000002
    bne     v0, a0, lbl_8001AB58
    addiu   v1, v1, 0x01CC             # v1 = 80114FAC
lbl_8001AB84:
    beq     a1, $zero, lbl_8001ABCC
    sll     t5, a2,  2
    addu    t5, t5, a2
    sll     t5, t5,  2
    lui     t9, 0x800E                 # t9 = 800E0000
    addu    t9, t9, t5
    lw      t9, 0x7AF4(t9)             # 800E7AF4
    or      a0, a3, $zero              # a0 = 80118670
    lw      a1, 0x003C($sp)
    jalr    $ra, t9
    sw      t0, 0x0018($sp)
    lw      t0, 0x0018($sp)
    lbu     t6, 0x0037($sp)
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sb      t6, 0x0002(t0)             # 00000002
    lbu     t7, 0x003B($sp)
    sb      t8, 0x0000(t0)             # 00000000
    sb      t7, 0x0001(t0)             # 00000001
lbl_8001ABCC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001ABDC:
# MqDbg: Effect_DrawAll
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s1, 0x0018($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s0, 0x0014($sp)
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s3, 0x800E                 # s3 = 800E0000
    lui     s2, 0x8011                 # s2 = 80110000
    addiu   s2, s2, 0x5C38             # s2 = 80115C38
    addiu   s3, s3, 0x7AF0             # s3 = 800E7AF0
    addiu   s0, s0, 0x4DE0             # s0 = 80114DE0
    lbu     t6, 0x0004(s0)             # 80114DE4
lbl_8001AC14:
    beql    t6, $zero, lbl_8001AC34
    addiu   s0, s0, 0x04C8             # s0 = 801152A8
    lw      t9, 0x0010(s3)             # 800E7B00
    addiu   a0, s0, 0x0008             # a0 = 801152B0
    or      a1, s1, $zero              # a1 = 00000000
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x04C8             # s0 = 80115770
lbl_8001AC34:
    sltu    $at, s0, s2
    bnel    $at, $zero, lbl_8001AC14
    lbu     t6, 0x0004(s0)             # 80115774
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s2, 0x8011                 # s2 = 80110000
    addiu   s2, s2, 0x7810             # s2 = 80117810
    addiu   s0, s0, 0x4DE0             # s0 = 80114DE0
    lbu     t7, 0x0E5C(s0)             # 80115C3C
lbl_8001AC54:
    beql    t7, $zero, lbl_8001AC74
    addiu   s0, s0, 0x01B0             # s0 = 80114F90
    lw      t9, 0x0024(s3)             # 800E7B14
    addiu   a0, s0, 0x0E60             # a0 = 80115DF0
    or      a1, s1, $zero              # a1 = 00000000
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x01B0             # s0 = 80115140
lbl_8001AC74:
    sltu    $at, s0, s2
    bnel    $at, $zero, lbl_8001AC54
    lbu     t7, 0x0E5C(s0)             # 80115F9C
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s2, 0x8011                 # s2 = 80110000
    addiu   s2, s2, 0x5344             # s2 = 80115344
    addiu   s0, s0, 0x4DE0             # s0 = 80114DE0
    lbu     t8, 0x388C(s0)             # 8011866C
lbl_8001AC94:
    beql    t8, $zero, lbl_8001ACB4
    addiu   s0, s0, 0x01CC             # s0 = 80114FAC
    lw      t9, 0x004C(s3)             # 800E7B3C
    addiu   a0, s0, 0x3890             # a0 = 8011883C
    or      a1, s1, $zero              # a1 = 00000000
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x01CC             # s0 = 80115178
lbl_8001ACB4:
    bnel    s0, s2, lbl_8001AC94
    lbu     t8, 0x388C(s0)             # 80118A04
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_8001ACD8:
# MqDbg: Effect_UpdateAll
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x001C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    lui     s1, 0x8011                 # s1 = 80110000
    lui     s3, 0x800E                 # s3 = 800E0000
    addiu   s3, s3, 0x7AF0             # s3 = 800E7AF0
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s4, $zero, 0x0001          # s4 = 00000001
lbl_8001AD14:
    lbu     t6, 0x0004(s1)             # 80114DE4
    beql    t6, $zero, lbl_8001AD44
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lw      t9, 0x000C(s3)             # 800E7AFC
    addiu   a0, s1, 0x0008             # a0 = 80114DE8
    jalr    $ra, t9
    nop
    bne     v0, s4, lbl_8001AD40
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_8001AE04
    or      a1, s0, $zero              # a1 = 00000001
lbl_8001AD40:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_8001AD44:
    slti    $at, s0, 0x0003
    bne     $at, $zero, lbl_8001AD14
    addiu   s1, s1, 0x04C8             # s1 = 801152A8
    lui     s1, 0x8011                 # s1 = 80110000
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
    or      s0, $zero, $zero           # s0 = 00000000
lbl_8001AD5C:
    lbu     t7, 0x0E5C(s1)             # 80115C3C
    beql    t7, $zero, lbl_8001AD8C
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lw      t9, 0x0020(s3)             # 800E7B10
    addiu   a0, s1, 0x0E60             # a0 = 80115C40
    jalr    $ra, t9
    nop
    bne     v0, s4, lbl_8001AD88
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_8001AE04
    addiu   a1, s0, 0x0003             # a1 = 00000004
lbl_8001AD88:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_8001AD8C:
    slti    $at, s0, 0x0019
    bne     $at, $zero, lbl_8001AD5C
    addiu   s1, s1, 0x01B0             # s1 = 80114F90
    lui     s1, 0x8011                 # s1 = 80110000
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s5, $zero, 0x0003          # s5 = 00000003
lbl_8001ADA8:
    lbu     t8, 0x388C(s1)             # 8011866C
    beql    t8, $zero, lbl_8001ADD8
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lw      t9, 0x0048(s3)             # 800E7B38
    addiu   a0, s1, 0x3890             # a0 = 80118670
    jalr    $ra, t9
    nop
    bne     v0, s4, lbl_8001ADD4
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_8001AE04
    addiu   a1, s0, 0x001C             # a1 = 0000001D
lbl_8001ADD4:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_8001ADD8:
    bne     s0, s5, lbl_8001ADA8
    addiu   s1, s1, 0x01CC             # s1 = 80114FAC
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_8001AE04:
# MqDbg: Effect_Delete
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    addiu   $at, $zero, 0x001F         # $at = 0000001F
    beq     a1, $at, lbl_8001AF00
    slti    $at, a1, 0x0003
    beq     $at, $zero, lbl_8001AE68
    sll     t6, a1,  2
    addu    t6, t6, a1
    sll     t6, t6,  2
    subu    t6, t6, a1
    sll     t6, t6,  3
    addu    t6, t6, a1
    lui     t7, 0x8011                 # t7 = 80110000
    addiu   t7, t7, 0x4DE0             # t7 = 80114DE0
    sll     t6, t6,  3
    addu    v0, t6, t7
    sb      $zero, 0x0004(v0)          # 00000004
    lui     t9, 0x800E                 # t9 = 800E0000
    lw      t9, 0x7AF8(t9)             # 800E7AF8
    addiu   a0, v0, 0x0008             # a0 = 00000008
    jalr    $ra, t9
    nop
    b       lbl_8001AF04
    lw      $ra, 0x0014($sp)
lbl_8001AE68:
    addiu   a1, a1, 0xFFFD             # a1 = FFFFFFFD
    slti    $at, a1, 0x0019
    beq     $at, $zero, lbl_8001AEB4
    sll     t8, a1,  3
    subu    t8, t8, a1
    sll     t8, t8,  2
    subu    t8, t8, a1
    lui     t0, 0x8011                 # t0 = 80110000
    addiu   t0, t0, 0x4DE0             # t0 = 80114DE0
    sll     t8, t8,  4
    addu    v0, t8, t0
    sb      $zero, 0x0E5C(v0)          # 00000E5C
    lui     t9, 0x800E                 # t9 = 800E0000
    lw      t9, 0x7B0C(t9)             # 800E7B0C
    addiu   a0, v0, 0x0E60             # a0 = 00000E60
    jalr    $ra, t9
    nop
    b       lbl_8001AF04
    lw      $ra, 0x0014($sp)
lbl_8001AEB4:
    addiu   a1, a1, 0xFFE7             # a1 = FFFFFFE7
    slti    $at, a1, 0x0003
    beq     $at, $zero, lbl_8001AF00
    sll     t1, a1,  3
    subu    t1, t1, a1
    sll     t1, t1,  2
    addu    t1, t1, a1
    sll     t1, t1,  2
    subu    t1, t1, a1
    lui     t2, 0x8011                 # t2 = 80110000
    addiu   t2, t2, 0x4DE0             # t2 = 80114DE0
    sll     t1, t1,  2
    addu    v0, t1, t2
    sb      $zero, 0x388C(v0)          # 0000388C
    lui     t9, 0x800E                 # t9 = 800E0000
    lw      t9, 0x7B34(t9)             # 800E7B34
    addiu   a0, v0, 0x3890             # a0 = 00003890
    jalr    $ra, t9
    nop
lbl_8001AF00:
    lw      $ra, 0x0014($sp)
lbl_8001AF04:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001AF10:
# MqDbg: Effect_DeleteAll
# Deallocates ?
# A0 = Global Context
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0028($sp)
    lui     s1, 0x8011                 # s1 = 80110000
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s3, 0x8011                 # s3 = 80110000
    lui     s2, 0x800E                 # s2 = 800E0000
    addiu   s2, s2, 0x7AF0             # s2 = 800E7AF0
    addiu   s3, s3, 0x5C40             # s3 = 80115C40
    addiu   s0, s0, 0x4DE8             # s0 = 80114DE8
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
lbl_8001AF4C:
    lw      t9, 0x0008(s2)             # 800E7AF8
    sb      $zero, 0x0004(s1)          # 80114DE4
    or      a0, s0, $zero              # a0 = 80114DE8
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x04C8             # s0 = 801152B0
    sltu    $at, s0, s3
    bne     $at, $zero, lbl_8001AF4C
    addiu   s1, s1, 0x04C8             # s1 = 801152A8
    lui     s1, 0x8011                 # s1 = 80110000
    lui     s0, 0x8011                 # s0 = 80110000
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x8670             # s3 = 80118670
    addiu   s0, s0, 0x5C40             # s0 = 80115C40
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
lbl_8001AF88:
    lw      t9, 0x001C(s2)             # 800E7B0C
    sb      $zero, 0x0E5C(s1)          # 80115C3C
    or      a0, s0, $zero              # a0 = 80115C40
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x01B0             # s0 = 80115DF0
    sltu    $at, s0, s3
    bne     $at, $zero, lbl_8001AF88
    addiu   s1, s1, 0x01B0             # s1 = 80114F90
    lui     s1, 0x8011                 # s1 = 80110000
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x8BD4             # s3 = 80118BD4
    addiu   s0, s0, 0x8670             # s0 = 80118670
    addiu   s1, s1, 0x4DE0             # s1 = 80114DE0
lbl_8001AFC4:
    lw      t9, 0x0044(s2)             # 800E7B34
    sb      $zero, 0x388C(s1)          # 8011866C
    or      a0, s0, $zero              # a0 = 80118670
    jalr    $ra, t9
    nop
    addiu   s0, s0, 0x01CC             # s0 = 8011883C
    bne     s0, s3, lbl_8001AFC4
    addiu   s1, s1, 0x01CC             # s1 = 80114FAC
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28

