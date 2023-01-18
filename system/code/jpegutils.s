

.section .text
func_800CE870:
# MqDbg: JpegUtils_ProcessQuantizationTable
    andi    v1, a2, 0x00FF             # v1 = 00000000
    or      a3, a1, $zero              # a3 = 00000000
    sw      a2, 0x0008($sp)
    blez    v1, lbl_800CE8D0
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CE884:
    sll     t7, v0,  7
    addiu   a0, a0, 0x0001             # a0 = 00000001
    addu    a2, a3, t7
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CE894:
    sll     t9, a1,  1
    addiu   a1, a1, 0x0001             # a1 = 00000001
    lbu     t8, 0x0000(a0)             # 00000001
    andi    t1, a1, 0x00FF             # t1 = 00000001
    slti    $at, t1, 0x0040
    addu    t0, a2, t9
    or      a1, t1, $zero              # a1 = 00000001
    addiu   a0, a0, 0x0001             # a0 = 00000002
    bne     $at, $zero, lbl_800CE894
    sh      t8, 0x0000(t0)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    t2, v0, 0x00FF             # t2 = 00000001
    slt     $at, t2, v1
    bne     $at, $zero, lbl_800CE884
    or      v0, t2, $zero              # v0 = 00000001
lbl_800CE8D0:
    jr      $ra
    nop


func_800CE8D8:
# MqDbg: JpegUtils_ParseHuffmanCodesLengths
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    or      s0, a1, $zero              # s0 = 00000000
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    or      v1, $zero, $zero           # v1 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    addiu   a3, $zero, 0x0001          # a3 = 00000001
lbl_800CE8F4:
    addu    a1, a3, a0
    lbu     t6, -0x0001(a1)            # FFFFFFFF
    blez    t6, lbl_800CE930
lbl_800CE900:
    addu    t7, s0, v1
    sb      v0, 0x0000(t7)             # 00000000
    lbu     t2, -0x0001(a1)            # FFFFFFFF
    addiu   a2, a2, 0x0001             # a2 = 00000002
    sll     t0, a2, 16
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sra     a2, t0, 16
    sll     t8, v1, 16
    slt     $at, t2, a2
    beq     $at, $zero, lbl_800CE900
    sra     v1, t8, 16
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800CE930:
    addiu   v0, v0, 0x0001             # v0 = 00000002
    andi    a3, v0, 0x00FF             # a3 = 00000002
    slti    $at, a3, 0x0011
    bne     $at, $zero, lbl_800CE8F4
    or      v0, a3, $zero              # v0 = 00000002
    addu    t4, s0, v1
    sb      $zero, 0x0000(t4)          # 00000000
    lw      s0, 0x0004($sp)
    addiu   $sp, $sp, 0x0008           # $sp += 0x8
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000001


func_800CE95C:
# MqDbg: JpegUtils_GetHuffmanCodes
    lbu     a2, 0x0000(a0)             # 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    or      a3, a2, $zero              # a3 = 00000000
lbl_800CE96C:
    sll     t6, v1,  1
lbl_800CE970:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sll     t8, v1, 16
    sra     v1, t8, 16
    addu    t7, a1, t6
    sh      v0, 0x0000(t7)             # 00000000
    addu    t2, v1, a0
    lbu     t0, 0x0000(t2)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    t1, v0, 0xFFFF             # t1 = 00000001
    beq     a3, t0, lbl_800CE96C
    or      v0, t1, $zero              # v0 = 00000001
    beq     t0, $zero, lbl_800CE9C0
lbl_800CE9A0:
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a3, a2, 0x00FF             # a3 = 00000001
    sll     t3, v0,  1
    andi    v0, t3, 0xFFFF             # v0 = 00000000
    bne     t0, a3, lbl_800CE9A0
    or      a2, a3, $zero              # a2 = 00000001
    b       lbl_800CE970
    sll     t6, v1,  1
lbl_800CE9C0:
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000001


func_800CE9C8:
# MqDbg: JpegUtils_SetHuffmanTable
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    or      s0, a2, $zero              # s0 = 00000000
    or      a3, a1, $zero              # a3 = 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    ori     t0, $zero, 0xFFFF          # t0 = 0000FFFF
lbl_800CE9E4:
    addu    a1, v0, a0
    lbu     t6, 0x0000(a1)             # 00000000
    sll     t9, v0,  1
    addu    t7, a3, v0
    beq     t6, $zero, lbl_800CEA48
    addu    t1, a3, t9
    sll     t9, v1,  1
    sb      v1, 0x0000(t7)             # 00000000
    addu    t1, s0, t9
    lhu     t2, 0x0000(t1)             # 00000000
    sll     t8, v0,  1
    addu    a2, a3, t8
    sh      t2, 0x0010(a2)             # 00000010
    lbu     t3, 0x0000(a1)             # 00000000
    addu    v1, v1, t3
    addiu   v1, v1, 0xFFFF             # v1 = FFFFFFFF
    andi    t4, v1, 0xFFFF             # t4 = 0000FFFF
    sll     t5, t4,  1
    addu    t6, s0, t5
    lhu     t7, 0x0000(t6)             # 00000000
    addiu   v1, t4, 0x0001             # v1 = 00010000
    andi    t8, v1, 0xFFFF             # t8 = 00000000
    or      v1, t8, $zero              # v1 = 00000000
    b       lbl_800CEA4C
    sh      t7, 0x0030(a2)             # 00000030
lbl_800CEA48:
    sh      t0, 0x0030(t1)             # 00000030
lbl_800CEA4C:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    t2, v0, 0x00FF             # t2 = 00000001
    slti    $at, t2, 0x0010
    bne     $at, $zero, lbl_800CE9E4
    or      v0, t2, $zero              # v0 = 00000001
    lw      s0, 0x0004($sp)
    addiu   $sp, $sp, 0x0008           # $sp += 0x8
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000000


func_800CEA70:
# MqDbg: JpegUtils_ProcessHuffmanTableImpl
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    sw      a3, 0x002C($sp)
    jal     func_800CE8D8
    or      a1, a2, $zero              # a1 = 00000000
    sll     v1, v0, 16
    sra     t6, v1, 16
    beq     v0, $zero, lbl_800CEAC8
    or      v1, t6, $zero              # v1 = 00000000
    lbu     a0, 0x0033($sp)
    slti    $at, v0, 0x0101
    beq     a0, $zero, lbl_800CEAB8
    nop
    beq     $at, $zero, lbl_800CEAC8
    nop
lbl_800CEAB8:
    bne     a0, $zero, lbl_800CEAD0
    slti    $at, v0, 0x0011
    bnel    $at, $zero, lbl_800CEAD4
    lw      a0, 0x0028($sp)
lbl_800CEAC8:
    b       lbl_800CEB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CEAD0:
    lw      a0, 0x0028($sp)
lbl_800CEAD4:
    lw      a1, 0x002C($sp)
    jal     func_800CE95C
    sh      v1, 0x001E($sp)
    lh      v1, 0x001E($sp)
    lw      a0, 0x0020($sp)
    lw      a1, 0x0024($sp)
    beq     v0, v1, lbl_800CEAFC
    lw      a2, 0x002C($sp)
    b       lbl_800CEB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CEAFC:
    jal     func_800CE9C8
    sh      v1, 0x001E($sp)
    lh      v1, 0x001E($sp)
    beql    v1, v0, lbl_800CEB1C
    or      v0, v1, $zero              # v0 = 00000000
    b       lbl_800CEB1C
    or      v0, $zero, $zero           # v0 = 00000000
    or      v0, v1, $zero              # v0 = 00000000
lbl_800CEB1C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CEB2C:
# MqDbg: JpegUtils_ProcessHuffmanTable
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s4, 0x002C($sp)
    lbu     s4, 0x0053($sp)
    sw      s6, 0x0034($sp)
    sw      s5, 0x0030($sp)
    sw      s3, 0x0028($sp)
    sw      s1, 0x0020($sp)
    sw      s0, 0x001C($sp)
    or      s0, a0, $zero              # s0 = 00000000
    or      s3, a1, $zero              # s3 = 00000000
    or      s5, a2, $zero              # s5 = 00000000
    or      s6, a3, $zero              # s6 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s7, 0x0038($sp)
    sw      s2, 0x0024($sp)
    blez    s4, lbl_800CEBD4
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s7, $zero, 0x0054          # s7 = 00000054
lbl_800CEB74:
    multu   s1, s7
    lbu     v0, 0x0000(s0)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    or      a0, s0, $zero              # a0 = 00000001
    sra     t6, v0,  4
    sw      t6, 0x0010($sp)
    or      a2, s5, $zero              # a2 = 00000000
    or      a3, s6, $zero              # a3 = 00000000
    mflo    s2
    addu    a1, s2, s3
    jal     func_800CEA70
    nop
    bne     v0, $zero, lbl_800CEBB4
    addiu   s0, s0, 0x0010             # s0 = 00000011
    b       lbl_800CEBD8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CEBB4:
    addiu   s1, s1, 0x0001             # s1 = 00000001
    andi    t8, s1, 0x00FF             # t8 = 00000001
    addu    t7, s3, s2
    slt     $at, t8, s4
    sw      s0, 0x0050(t7)             # 00000050
    or      s1, t8, $zero              # s1 = 00000001
    bne     $at, $zero, lbl_800CEB74
    addu    s0, s0, v0
lbl_800CEBD4:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CEBD8:
    lw      $ra, 0x003C($sp)
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    lw      s2, 0x0024($sp)
    lw      s3, 0x0028($sp)
    lw      s4, 0x002C($sp)
    lw      s5, 0x0030($sp)
    lw      s6, 0x0034($sp)
    lw      s7, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800CEC04:
# MqDbg: JpegUtils_SetHuffmanTableOld
    addiu   $sp, $sp, 0xFFF0           # $sp -= 0x10
    sw      s0, 0x0008($sp)
    lh      s0, 0x0022($sp)
    sw      s1, 0x000C($sp)
    or      s1, a1, $zero              # s1 = 00000000
    blez    s0, lbl_800CEC9C
    or      v0, $zero, $zero           # v0 = 00000000
    lbu     a1, 0x0027($sp)
    addu    t6, v0, a0
lbl_800CEC28:
    beq     a1, $zero, lbl_800CEC5C
    lbu     v1, 0x0000(t6)             # 00000000
    sll     t7, v0,  1
    addu    t8, a3, t7
    lhu     t9, 0x0000(t8)             # 00000000
    sll     t0, v1,  1
    addu    t1, s1, t0
    addu    t2, v0, a2
    sh      t9, 0x0100(t1)             # 00000100
    lbu     t3, 0x0000(t2)             # 00000000
    addu    t4, s1, v1
    b       lbl_800CEC84
    sb      t3, 0x0000(t4)             # 00000000
lbl_800CEC5C:
    sll     t5, v0,  1
    addu    t6, a3, t5
    lhu     t7, 0x0000(t6)             # 00000000
    sll     t8, v1,  1
    addu    t0, s1, t8
    addu    t9, v0, a2
    sh      t7, 0x0010(t0)             # 00000010
    lbu     t1, 0x0000(t9)             # 00000000
    addu    t2, s1, v1
    sb      t1, 0x0000(t2)             # 00000000
lbl_800CEC84:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    sll     t3, v0, 16
    sra     v0, t3, 16
    slt     $at, v0, s0
    bnel    $at, $zero, lbl_800CEC28
    addu    t6, v0, a0
lbl_800CEC9C:
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0010           # $sp += 0x10


func_800CECAC:
# MqDbg: JpegUtils_ProcessHuffmanTableImplOld
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sw      a1, 0x0034($sp)
    sw      a2, 0x0038($sp)
    sw      a3, 0x003C($sp)
    lbu     v1, 0x0000(a0)             # 00000000
    addiu   s0, a0, 0x0001             # s0 = 00000001
    or      a0, s0, $zero              # a0 = 00000001
    sra     t7, v1,  4
    sb      t7, 0x002F($sp)
    jal     func_800CE8D8
    or      a1, a2, $zero              # a1 = 00000000
    sll     t0, v0, 16
    sra     t8, t0, 16
    or      t0, t8, $zero              # t0 = 00000000
    beq     v0, $zero, lbl_800CED14
    lbu     v1, 0x002F($sp)
    beq     v1, $zero, lbl_800CED04
    slti    $at, v0, 0x0101
    beq     $at, $zero, lbl_800CED14
    nop
lbl_800CED04:
    bne     v1, $zero, lbl_800CED1C
    slti    $at, v0, 0x0011
    bnel    $at, $zero, lbl_800CED20
    lw      a0, 0x0038($sp)
lbl_800CED14:
    b       lbl_800CED64
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CED1C:
    lw      a0, 0x0038($sp)
lbl_800CED20:
    lw      a1, 0x003C($sp)
    sb      v1, 0x002F($sp)
    jal     func_800CE95C
    sh      t0, 0x002C($sp)
    lh      t0, 0x002C($sp)
    lbu     v1, 0x002F($sp)
    addiu   a0, s0, 0x0010             # a0 = 00000011
    beq     v0, t0, lbl_800CED4C
    lw      a1, 0x0034($sp)
    b       lbl_800CED64
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CED4C:
    lw      a2, 0x0038($sp)
    lw      a3, 0x003C($sp)
    sw      t0, 0x0010($sp)
    jal     func_800CEC04
    sw      v1, 0x0014($sp)
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CED64:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop
    nop
    nop

    