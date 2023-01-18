

.section .text
func_800CED80:
# MqDbg: JpegDecoder_Decode
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
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
    sw      a3, 0x0074($sp)
    sw      $zero, 0x0058($sp)
    lw      t7, 0x0000(a0)             # 00000000
    lui     $at, 0x8013                # $at = 80130000
    andi    t6, a3, 0x00FF             # t6 = 00000000
    sw      t7, -0x4550($at)           # 8012BAB0
    lbu     t8, 0x0004(a0)             # 00000004
    or      a3, t6, $zero              # a3 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    bne     t8, $zero, lbl_800CEDE0
    or      s6, a2, $zero              # s6 = 00000000
    b       lbl_800CEDF8
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800CEDE0:
    lbu     t9, 0x0005(a0)             # 00000005
    addiu   $at, $zero, 0x0001         # $at = 00000001
    addiu   v0, $zero, 0x0004          # v0 = 00000004
    bne     t9, $at, lbl_800CEDF8
    addiu   t0, $zero, 0x0080          # t0 = 00000080
    sw      t0, 0x0058($sp)
lbl_800CEDF8:
    lw      s4, 0x0008(a0)             # 00000008
    lw      s5, 0x000C(a0)             # 0000000C
    lw      s7, 0x0010(a0)             # 00000010
    bne     a3, $zero, lbl_800CEE40
    lw      s8, 0x0014(a0)             # 00000014
    lui     $at, 0x8013                # $at = 80130000
    sw      $zero, -0x454C($at)        # 8012BAB4
    lui     $at, 0x8013                # $at = 80130000
    addiu   t1, $zero, 0x0020          # t1 = 00000020
    sb      t1, -0x4548($at)           # 8012BAB8
    lui     $at, 0x8013                # $at = 80130000
    sw      $zero, -0x4544($at)        # 8012BABC
    lui     $at, 0x8013                # $at = 80130000
    sb      $zero, -0x4547($at)        # 8012BAB9
    sh      $zero, 0x0064($sp)
    sh      $zero, 0x0062($sp)
    b       lbl_800CEE8C
    sh      $zero, 0x0060($sp)
lbl_800CEE40:
    lw      t2, 0x0078($sp)
    lui     $at, 0x8013                # $at = 80130000
    lw      t3, 0x0000(t2)             # 00000000
    sw      t3, -0x454C($at)           # 8012BAB4
    lbu     t4, 0x0004(t2)             # 00000004
    lui     $at, 0x8013                # $at = 80130000
    sb      t4, -0x4548($at)           # 8012BAB8
    lw      t5, 0x0008(t2)             # 00000008
    lui     $at, 0x8013                # $at = 80130000
    sw      t5, -0x4544($at)           # 8012BABC
    lbu     t6, 0x0005(t2)             # 00000005
    lui     $at, 0x8013                # $at = 80130000
    sb      t6, -0x4547($at)           # 8012BAB9
    lh      t7, 0x000C(t2)             # 0000000C
    sh      t7, 0x0064($sp)
    lh      t8, 0x000E(t2)             # 0000000E
    sh      t8, 0x0062($sp)
    lh      t9, 0x0010(t2)             # 00000010
    sh      t9, 0x0060($sp)
lbl_800CEE8C:
    beq     s6, $zero, lbl_800CEF28
    or      s2, v0, $zero              # s2 = 00000004
    addiu   s3, $sp, 0x0064            # s3 = FFFFFFFC
lbl_800CEE98:
    beq     s2, $zero, lbl_800CEECC
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800CEEA0:
    or      a0, s4, $zero              # a0 = 00000000
    or      a1, s5, $zero              # a1 = 00000000
    or      a2, s1, $zero              # a2 = 00000000
    jal     func_800CEFA8
    or      a3, s3, $zero              # a3 = FFFFFFFC
    beq     v0, $zero, lbl_800CEEC4
    addiu   s0, s0, 0x0001             # s0 = 00000001
    b       lbl_800CEF78
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800CEEC4:
    bne     s0, s2, lbl_800CEEA0
    addiu   s1, s1, 0x0080             # s1 = 00000080
lbl_800CEECC:
    or      a0, s7, $zero              # a0 = 00000000
    or      a1, s8, $zero              # a1 = 00000000
    or      a2, s1, $zero              # a2 = 00000080
    jal     func_800CEFA8
    addiu   a3, $sp, 0x0062            # a3 = FFFFFFFA
    beq     v0, $zero, lbl_800CEEF0
    addiu   s1, s1, 0x0080             # s1 = 00000100
    b       lbl_800CEF78
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800CEEF0:
    or      a0, s7, $zero              # a0 = 00000000
    or      a1, s8, $zero              # a1 = 00000000
    or      a2, s1, $zero              # a2 = 00000100
    jal     func_800CEFA8
    addiu   a3, $sp, 0x0060            # a3 = FFFFFFF8
    beq     v0, $zero, lbl_800CEF14
    lw      t0, 0x0058($sp)
    b       lbl_800CEF78
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800CEF14:
    addiu   s6, s6, 0xFFFF             # s6 = FFFFFFFF
    addiu   s1, s1, 0x0080             # s1 = 00000180
    sll     t1, t0,  1
    bne     s6, $zero, lbl_800CEE98
    addu    s1, s1, t1
lbl_800CEF28:
    lui     t3, 0x8013                 # t3 = 80130000
    lw      v1, 0x0078($sp)
    lw      t3, -0x454C(t3)            # 8012BAB4
    lui     t4, 0x8013                 # t4 = 80130000
    lui     t5, 0x8013                 # t5 = 80130000
    sw      t3, 0x0000(v1)             # 00000000
    lbu     t4, -0x4548(t4)            # 8012BAB8
    lui     t6, 0x8013                 # t6 = 80130000
    or      v0, $zero, $zero           # v0 = 00000000
    sb      t4, 0x0004(v1)             # 00000004
    lw      t5, -0x4544(t5)            # 8012BABC
    sw      t5, 0x0008(v1)             # 00000008
    lbu     t6, -0x4547(t6)            # 8012BAB9
    sb      t6, 0x0005(v1)             # 00000005
    lh      t7, 0x0064($sp)
    sh      t7, 0x000C(v1)             # 0000000C
    lh      t8, 0x0062($sp)
    sh      t8, 0x000E(v1)             # 0000000E
    lh      t2, 0x0060($sp)
    sh      t2, 0x0010(v1)             # 00000010
lbl_800CEF78:
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
    addiu   $sp, $sp, 0x0068           # $sp += 0x68


func_800CEFA8:
# MqDbg: JpegDecoder_ProcessMcu
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s1, 0x0018($sp)
    or      s1, a2, $zero              # s1 = 00000000
    or      s3, a1, $zero              # s3 = 00000000
    addiu   s4, $sp, 0x0034            # s4 = FFFFFFFC
    addiu   s5, $sp, 0x0036            # s5 = FFFFFFFE
    sw      $ra, 0x002C($sp)
    sw      s2, 0x001C($sp)
    or      s2, a3, $zero              # s2 = 00000000
    sw      s0, 0x0014($sp)
    or      a2, s5, $zero              # a2 = FFFFFFFE
    jal     func_800CF144
    or      a1, s4, $zero              # a1 = FFFFFFFC
    beq     v0, $zero, lbl_800CEFF8
    lh      t7, 0x0034($sp)
    b       lbl_800CF120
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CEFF8:
    lh      t6, 0x0000(s2)             # 00000000
    addiu   s0, $zero, 0x0001          # s0 = 00000001
    slti    $at, s0, 0x0040
    addu    t8, t6, t7
    sh      t8, 0x0000(s2)             # 00000000
    lh      t9, 0x0000(s2)             # 00000000
    addiu   s2, $zero, 0x000F          # s2 = 0000000F
    beq     $at, $zero, lbl_800CF11C
    sh      t9, 0x0000(s1)             # 00000000
    or      a0, s3, $zero              # a0 = 00000000
lbl_800CF020:
    or      a1, s4, $zero              # a1 = FFFFFFFC
    jal     func_800CF144
    or      a2, s5, $zero              # a2 = FFFFFFFE
    beq     v0, $zero, lbl_800CF03C
    lh      t0, 0x0034($sp)
    b       lbl_800CF120
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CF03C:
    bne     t0, $zero, lbl_800CF0B8
    lb      v1, 0x0036($sp)
    lb      v1, 0x0036($sp)
    bne     v1, s2, lbl_800CF088
    addiu   t2, v1, 0xFFFF             # t2 = FFFFFFFF
    bltz    v1, lbl_800CF110
    sb      t2, 0x0036($sp)
lbl_800CF058:
    sll     t3, s0,  1
    addu    t4, s1, t3
    sh      $zero, 0x0000(t4)          # 00000000
    lb      t7, 0x0036($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000002
    sll     t5, s0, 24
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    sb      t8, 0x0036($sp)
    bgez    t7, lbl_800CF058
    sra     s0, t5, 24
    b       lbl_800CF114
    slti    $at, s0, 0x0040
lbl_800CF088:
    slti    $at, s0, 0x0040
    beq     $at, $zero, lbl_800CF11C
lbl_800CF090:
    sll     t9, s0,  1
    addiu   s0, s0, 0x0001             # s0 = 00000003
    sll     t1, s0, 24
    sra     s0, t1, 24
    slti    $at, s0, 0x0040
    addu    t0, s1, t9
    bne     $at, $zero, lbl_800CF090
    sh      $zero, 0x0000(t0)          # 00000000
    b       lbl_800CF120
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CF0B8:
    slt     v0, $zero, v1
    addiu   t4, v1, 0xFFFF             # t4 = FFFFFFFF
    beq     v0, $zero, lbl_800CF0F4
    sb      t4, 0x0036($sp)
lbl_800CF0C8:
    sll     t5, s0,  1
    addu    t6, s1, t5
    sh      $zero, 0x0000(t6)          # 00000000
    lb      t9, 0x0036($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000004
    sll     t7, s0, 24
    slt     v0, $zero, t9
    addiu   t0, t9, 0xFFFF             # t0 = FFFFFFFF
    sb      t0, 0x0036($sp)
    bne     v0, $zero, lbl_800CF0C8
    sra     s0, t7, 24
lbl_800CF0F4:
    lh      t1, 0x0034($sp)
    sll     t2, s0,  1
    addiu   s0, s0, 0x0001             # s0 = 00000005
    sll     t4, s0, 24
    addu    t3, s1, t2
    sra     s0, t4, 24
    sh      t1, 0x0000(t3)             # 00000000
lbl_800CF110:
    slti    $at, s0, 0x0040
lbl_800CF114:
    bnel    $at, $zero, lbl_800CF020
    or      a0, s3, $zero              # a0 = 00000000
lbl_800CF11C:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CF120:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800CF144:
# MqDbg: JpegDecoder_ParseNextSymbol
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    addiu   a0, $zero, 0x0010          # a0 = 00000010
    jal     func_800CF280
    sh      $zero, 0x0024($sp)
    lhu     t1, 0x0024($sp)
    lw      t2, 0x002C($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   t0, $zero, 0x000F          # t0 = 0000000F
    ori     a3, $zero, 0xFFFF          # a3 = 0000FFFF
lbl_800CF17C:
    sll     t6, a2,  1
    addu    t7, s0, t6
    lhu     a0, 0x0030(t7)             # 00000030
    subu    t8, t0, a2
    srav    v1, v0, t8
    beq     a3, a0, lbl_800CF1A8
    or      a1, a2, $zero              # a1 = 00000000
    andi    t9, v1, 0xFFFF             # t9 = 00000000
    slt     $at, a0, t9
    beq     $at, $zero, lbl_800CF1BC
    andi    t1, v1, 0xFFFF             # t1 = 00000000
lbl_800CF1A8:
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a1, a2, 0x00FF             # a1 = 00000001
    slti    $at, a1, 0x0010
    bne     $at, $zero, lbl_800CF17C
    or      a2, a1, $zero              # a2 = 00000001
lbl_800CF1BC:
    slti    $at, a1, 0x0010
    bne     $at, $zero, lbl_800CF1D0
    lui     v0, 0x8013                 # v0 = 80130000
    b       lbl_800CF26C
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CF1D0:
    addu    t4, s0, a2
    sll     t7, a2,  1
    lbu     t5, 0x0000(t4)             # 00000000
    addu    t8, s0, t7
    lhu     t9, 0x0010(t8)             # 00000010
    lw      t4, 0x0050(s0)             # 00000050
    addu    t6, t5, t1
    subu    t3, t6, t9
    addu    t5, t3, t4
    lbu     a0, 0x0000(t5)             # 00000000
    lw      t8, 0x0030($sp)
    addiu   v0, v0, 0xBAB8             # v0 = FFFFBAB9
    sra     t7, a0,  4
    sb      t7, 0x0000(t8)             # 00000000
    lbu     t9, 0x0000(v0)             # FFFFBAB9
    andi    t6, a0, 0x000F             # t6 = 00000000
    or      a0, t6, $zero              # a0 = 00000000
    addu    t3, t9, a1
    addiu   t4, t3, 0xFFF1             # t4 = FFFFFFF1
    sb      t4, 0x0000(v0)             # FFFFBAB9
    beq     t6, $zero, lbl_800CF268
    sh      $zero, 0x0000(t2)          # 00000000
    jal     func_800CF280
    sb      t6, 0x0026($sp)
    lw      t2, 0x002C($sp)
    lbu     a0, 0x0026($sp)
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sh      v0, 0x0000(t2)             # 00000000
    lh      a1, 0x0000(t2)             # 00000000
    addiu   t5, a0, 0x001F             # t5 = 0000001F
    sllv    t8, t7, t5
    slt     $at, a1, t8
    beq     $at, $zero, lbl_800CF268
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    sllv    t9, t6, a0
    addu    t3, a1, t9
    addiu   t4, t3, 0x0001             # t4 = 00000001
    sh      t4, 0x0000(t2)             # 00000000
lbl_800CF268:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CF26C:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800CF280:
# MqDbg: JpegDecoder_ReadBits
    lui     t0, 0x8013                 # t0 = 80130000
    addiu   t0, t0, 0xBAB8             # t0 = 8012BAB8
    lbu     a1, 0x0000(t0)             # 8012BAB8
    sw      a0, 0x0000($sp)
    andi    a3, a0, 0x00FF             # a3 = 00000000
    sra     v0, a1,  3
    andi    t6, v0, 0x00FF             # t6 = 00000000
    blez    t6, lbl_800CF344
    or      v0, t6, $zero              # v0 = 00000000
    lui     a2, 0x8013                 # a2 = 80130000
    lui     t5, 0x8013                 # t5 = 80130000
    lui     t2, 0x8013                 # t2 = 80130000
    lui     t1, 0x8013                 # t1 = 80130000
    addiu   t1, t1, 0xBAB4             # t1 = 8012BAB4
    addiu   t2, t2, 0xBAB9             # t2 = 8012BAB9
    addiu   t5, t5, 0xBABC             # t5 = 8012BABC
    lw      a2, -0x4550(a2)            # 8012BAB0
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    addiu   t3, $zero, 0x00FF          # t3 = 000000FF
lbl_800CF2CC:
    lw      a0, 0x0000(t1)             # 8012BAB4
    lbu     t9, 0x0000(t2)             # 8012BAB9
    lbu     a1, 0x0000(t0)             # 8012BAB8
    addu    t7, a0, a2
    lbu     v1, 0x0000(t7)             # 00000000
    addiu   t8, a0, 0x0001             # t8 = 00000001
    beq     t9, $zero, lbl_800CF300
    sw      t8, 0x0000(t1)             # 8012BAB4
    bne     v1, $zero, lbl_800CF300
    addu    t6, t8, a2
    lbu     v1, 0x0000(t6)             # 00000000
    addiu   t7, t8, 0x0001             # t7 = 00000002
    sw      t7, 0x0000(t1)             # 8012BAB4
lbl_800CF300:
    bne     t3, v1, lbl_800CF310
    or      a0, v1, $zero              # a0 = 00000000
    b       lbl_800CF314
    sb      t4, 0x0000(t2)             # 8012BAB9
lbl_800CF310:
    sb      $zero, 0x0000(t2)          # 8012BAB9
lbl_800CF314:
    lw      t8, 0x0000(t5)             # 8012BABC
    addiu   v0, v0, 0xFFFF             # v0 = FFFFFFFF
    sll     t9, t8,  8
    sw      t9, 0x0000(t5)             # 8012BABC
    or      t7, t9, a0                 # t7 = 00000000
    andi    t9, v0, 0x00FF             # t9 = 000000FF
    addiu   t8, a1, 0xFFF8             # t8 = FFFFFFF8
    or      v0, t9, $zero              # v0 = 000000FF
    sw      t7, 0x0000(t5)             # 8012BABC
    bgtz    t9, lbl_800CF2CC
    sb      t8, 0x0000(t0)             # 8012BAB8
    andi    a1, t8, 0x00FF             # a1 = 000000F8
lbl_800CF344:
    lui     t5, 0x8013                 # t5 = 80130000
    addiu   t5, t5, 0xBABC             # t5 = 8012BABC
    lw      t6, 0x0000(t5)             # 8012BABC
    subu    t7, $zero, a3
    addu    t8, a1, a3
    sllv    v1, t6, a1
    srlv    v1, v1, t7
    sb      t8, 0x0000(t0)             # 8012BAB8
    jr      $ra
    andi    v0, v1, 0xFFFF             # v0 = 00000000
    nop
