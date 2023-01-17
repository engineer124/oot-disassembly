# Audio External General
#
# Starts at VRAM: 800C1F20 / VROM: B37E80
#

.section .text
func_800C1F20:
# MqDbg: AudioOcarina_ReadControllerInput
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x1F24(t6)             # 80121F24
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0xD500             # a0 = 8011D500
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFA0
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800A279C
    sw      t6, 0x0018($sp)
    lhu     t7, 0x0020($sp)
    lw      t8, 0x0018($sp)
    lui     $at, 0x8012                # $at = 80120000
    sw      t7, 0x1F24($at)            # 80121F24
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    lb      t9, 0x0034($sp)
    lb      t0, 0x0035($sp)
    sw      t8, 0x1F2C($at)            # 80121F2C
    lui     $at, 0x8012                # $at = 80120000
    addiu   $sp, $sp, 0x0080           # $sp += 0x80
    sb      t9, 0x1F20($at)            # 80121F20
    jr      $ra
    sb      t0, 0x1F21($at)            # 80121F21


func_800C1F80:
# MqDbg: AudioOcarina_BendPitchTwoSemitones
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    slti    $at, a0, 0x0041
    bnel    $at, $zero, lbl_800C1FA4
    slti    $at, a0, 0xFFC0
    b       lbl_800C1FF8
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
    slti    $at, a0, 0xFFC0
lbl_800C1FA4:
    beq     $at, $zero, lbl_800C1FB4
    nop
    b       lbl_800C1FF8
    addiu   v0, $zero, 0xFF80          # v0 = FFFFFF80
lbl_800C1FB4:
    bltz    a0, lbl_800C1FE0
    sll     v0, a0,  7
    sll     v0, a0,  7
    subu    v0, v0, a0
    bgez    v0, lbl_800C1FD0
    addu    $at, v0, $zero
    addiu   $at, v0, 0x003F            # $at = FFFFFFBF
lbl_800C1FD0:
    sra     v0, $at,  6
    sll     v0, v0, 24
    b       lbl_800C1FF8
    sra     v0, v0, 24
lbl_800C1FE0:
    bgez    v0, lbl_800C1FEC
    addu    $at, v0, $zero
    addiu   $at, v0, 0x003F            # $at = FFFFFFBF
lbl_800C1FEC:
    sra     v0, $at,  6
    sll     v0, v0, 24
    sra     v0, v0, 24
lbl_800C1FF8:
    sll     t6, v0,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t6
    lwc1    $f2, 0x09C4($at)           # 801009C4
    jr      $ra
    mov.s   $f0, $f2


func_800C2010:
# MqDbg: AudioOcarina_GetPlayingState
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x2B74             # a0 = 80102B74
    lbu     v0, 0x0000(a0)             # 80102B74
    beq     v0, $zero, lbl_800C2030
    addiu   v1, v0, 0xFFFF             # v1 = FFFFFFFF
    andi    v0, v1, 0x00FF             # v0 = 000000FF
    jr      $ra
    sb      $zero, 0x0000(a0)          # 80102B74
lbl_800C2030:
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x2238(t6)             # 80102238
    beql    t6, $zero, lbl_800C204C
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    jr      $ra
    addiu   v0, $zero, 0x00FE          # v0 = 000000FE
lbl_800C2048:
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
lbl_800C204C:
    jr      $ra
    or      v0, v1, $zero              # v0 = 000000FF


func_800C2054:
# MqDbg: AudioOcarina_MapNoteToButton
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    andi    t6, a0, 0x003F             # t6 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t6
    lbu     v1, 0x2EEC(v1)             # 80102EEC
    addiu   $at, $zero, 0x0005         # $at = 00000005
    andi    t7, a0, 0x0080             # t7 = 00000000
    bne     v1, $at, lbl_800C2094
    or      v0, v1, $zero              # v0 = 80100000
    beq     t7, $zero, lbl_800C208C
    nop
    jr      $ra
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800C208C:
    jr      $ra
    addiu   v0, $zero, 0x0003          # v0 = 00000003
lbl_800C2094:
    jr      $ra
    nop


func_800C209C:
# MqDbg: AudioOcarina_MapNotesToScarecrowButtons
# Song playback & activation related.
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    addu    t6, t6, a0
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x227C             # t7 = 8010227C
    sll     t6, t6,  5
    lui     t0, 0x8010                 # t0 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    or      v0, $zero, $zero           # v0 = 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    addiu   a3, a3, 0x2EFC             # a3 = 80102EFC
    addiu   t0, t0, 0x2EEC             # t0 = 80102EEC
    addu    a1, t6, t7
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    sll     t8, v1,  3
lbl_800C20DC:
    addu    t9, a1, t8
    lbu     a0, 0x0000(t9)             # 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    beq     a2, a0, lbl_800C2108
    addu    t1, t0, a0
    lbu     t2, 0x0000(t1)             # 00000000
    addu    t3, a3, v0
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    sb      t2, 0x006D(t3)             # 0000006D
lbl_800C2108:
    slti    $at, v0, 0x0008
    beq     $at, $zero, lbl_800C211C
    slti    $at, v1, 0x0010
    bnel    $at, $zero, lbl_800C20DC
    sll     t8, v1,  3
lbl_800C211C:
    jr      $ra
    nop


func_800C2124:
# MqDbg: AudioOcarina_Start
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x2A08(v0)             # 80102A08
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a0, 0x0028($sp)
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    beq     v1, v0, lbl_800C215C
    sw      $ra, 0x0014($sp)
    andi    t6, a0, 0x0FFF             # t6 = 00000000
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
    bne     t6, $at, lbl_800C215C
    or      t0, a0, $zero              # t0 = 00000000
    ori     a0, t0, 0x1000             # a0 = 00001000
    andi    a0, a0, 0xFFFF             # a0 = 00001000
lbl_800C215C:
    ori     $at, $zero, 0xCFFF         # $at = 0000CFFF
    bne     a0, $at, lbl_800C2178
    or      t0, a0, $zero              # t0 = 00001000
    beql    v1, v0, lbl_800C217C
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
    ori     a0, $zero, 0xDFFF          # a0 = 0000DFFF
    ori     t0, $zero, 0xDFFF          # t0 = 0000DFFF
lbl_800C2178:
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
lbl_800C217C:
    bne     t0, $at, lbl_800C2194
    addiu   t8, $zero, 0x000E          # t8 = 0000000E
    beql    v1, v0, lbl_800C2198
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    addiu   a0, $zero, 0x1FFF          # a0 = 00001FFF
    addiu   t0, $zero, 0x1FFF          # t0 = 00001FFF
lbl_800C2194:
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
lbl_800C2198:
    beq     t0, $at, lbl_800C22BC
    lui     v0, 0x8012                 # v0 = 80120000
    lui     $at, 0x8000                # $at = 80000000
    addu    t7, a0, $at
    lui     $at, 0x8010                # $at = 80100000
    sw      t7, 0x2238($at)            # 80102238
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F42($at)         # 80121F42
    addiu   v0, v0, 0x1F43             # v0 = 80121F43
    ori     $at, $zero, 0xA000         # $at = 0000A000
    beq     t0, $at, lbl_800C21D0
    sb      t8, 0x0000(v0)             # 80121F43
    addiu   t1, t8, 0xFFFF             # t1 = 0000000D
    sb      t1, 0x0000(v0)             # 80121F43
lbl_800C21D0:
    andi    t2, t0, 0x3FFF             # t2 = 00001FFF
    lui     $at, 0x8012                # $at = 80120000
    sh      t2, 0x1F44($at)            # 80121F44
    lui     $at, 0x8010                # $at = 80100000
    addiu   t3, $zero, 0x0008          # t3 = 00000008
    sb      t3, 0x2B78($at)            # 80102B78
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F41($at)         # 80121F41
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B74($at)         # 80102B74
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F46($at)         # 80121F46
    jal     func_800C2010
    sw      t0, 0x001C($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      v0, 0x1F0F($at)            # 80121F0F
    lui     $at, 0x8010                # $at = 80100000
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sb      t4, 0x2208($at)            # 80102208
    lui     $at, 0x8010                # $at = 80100000
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a2, 0x8012                 # a2 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    lw      t0, 0x001C($sp)
    sh      $zero, 0x2248($at)         # 80102248
    addiu   a0, a0, 0x1F48             # a0 = 80121F48
    addiu   a1, a1, 0x1F68             # a1 = 80121F68
    addiu   a2, a2, 0x1F88             # a2 = 80121F88
    addiu   a3, a3, 0x1FA8             # a3 = 80121FA8
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C224C:
    sll     v0, v1,  1
    addu    t5, a0, v0
    addu    t8, a3, v1
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sh      $zero, 0x0000(t5)          # 00000000
    addu    t6, a1, v0
    andi    v1, v1, 0x00FF             # v1 = 00000001
    sh      $zero, 0x0000(t6)          # 00000000
    addu    t7, a2, v0
    slti    $at, v1, 0x000E
    sh      $zero, 0x0000(t7)          # 00000000
    bne     $at, $zero, lbl_800C224C
    sb      $zero, 0x0000(t8)          # 00000000
    andi    t9, t0, 0x8000             # t9 = 00000000
    beq     t9, $zero, lbl_800C2294
    andi    t1, t0, 0x4000             # t1 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B78($at)         # 80102B78
lbl_800C2294:
    beq     t1, $zero, lbl_800C22A4
    andi    t2, t0, 0xD000             # t2 = 00000000
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F40($at)         # 80121F40
lbl_800C22A4:
    beql    t2, $zero, lbl_800C22D0
    lw      $ra, 0x0014($sp)
    jal     func_800C209C
    addiu   a0, $zero, 0x000C          # a0 = 0000000C
    b       lbl_800C22D0
    lw      $ra, 0x0014($sp)
lbl_800C22BC:
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lw      $ra, 0x0014($sp)
lbl_800C22D0:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C22DC:
# MqDbg: AudioOcarina_CheckIfStartedSong
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2210(t6)             # 80102210
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    lui     v0, 0x8012                 # v0 = 80120000
    beq     t6, $at, lbl_800C2310
    addiu   v0, v0, 0x1F41             # v0 = 80121F41
    lbu     t7, 0x0000(v0)             # 80121F41
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   t9, $zero, 0x00FF          # t9 = 000000FF
    bne     t7, $zero, lbl_800C2310
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x0000(v0)             # 80121F41
    sb      t9, 0x221C($at)            # 8010221C
lbl_800C2310:
    jr      $ra
    nop


func_800C2318:
# MqDbg: AudioOcarina_CheckSongsWithMusicStaff
# Song playback related.
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      $ra, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sb      $zero, 0x005B($sp)
    jal     func_800C22DC
    sb      $zero, 0x0057($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1F41(t6)             # 80121F41
    lui     v0, 0x8010                 # v0 = 80100000
    beql    t6, $zero, lbl_800C2700
    lw      $ra, 0x002C($sp)
    lb      v0, 0x2228(v0)             # 80102228
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    bgez    v0, lbl_800C2374
    or      v1, v0, $zero              # v1 = 80100000
    b       lbl_800C2374
    subu    v1, $zero, v0
lbl_800C2374:
    slti    $at, v1, 0x0015
    bne     $at, $zero, lbl_800C238C
    lui     $ra, 0x8012                # $ra = 80120000
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C26FC
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C238C:
    lbu     t7, 0x2210(t7)             # 80102210
    lbu     t8, 0x2214(t8)             # 80102214
    lui     t6, 0x8012                 # t6 = 80120000
    sw      t7, 0x0040($sp)
    beq     t7, t8, lbl_800C23AC
    or      s5, t7, $zero              # s5 = 80100000
    addiu   t5, $zero, 0x00FF          # t5 = 000000FF
    bne     t5, t7, lbl_800C23B8
lbl_800C23AC:
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x005B($sp)
    addiu   t5, $zero, 0x00FF          # t5 = 000000FF
lbl_800C23B8:
    lbu     $ra, 0x1F42($ra)           # 80121F42
    lbu     t6, 0x1F43(t6)             # 80121F43
    lui     s0, 0x8012                 # s0 = 80120000
    or      a2, $ra, $zero             # a2 = 80120000
    slt     $at, $ra, t6
    beq     $at, $zero, lbl_800C26C8
    sw      t6, 0x0034($sp)
    lui     s4, 0x8010                 # s4 = 80100000
    lui     s3, 0x8012                 # s3 = 80120000
    lui     s2, 0x8010                 # s2 = 80100000
    lui     s1, 0x8012                 # s1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    addiu   s1, s1, 0x1FA8             # s1 = 80121FA8
    addiu   s2, s2, 0x221C             # s2 = 8010221C
    addiu   s3, s3, 0x1F48             # s3 = 80121F48
    addiu   s4, s4, 0x227C             # s4 = 8010227C
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2400:
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t3, t7, a2
    andi    t3, t3, 0xFFFF             # t3 = 00000000
    and     t8, s0, t3
    beq     t8, $zero, lbl_800C264C
    sll     t4, $ra,  1
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x1F88             # t6 = 80121F88
    addu    t0, t4, t6
    lhu     a0, 0x0000(t0)             # 00000000
    lbu     t7, 0x005B($sp)
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x1F68             # t9 = 80121F68
    addu    v1, t4, t9
    addiu   a1, a0, 0x0012             # a1 = 00000012
    beq     t7, $zero, lbl_800C24C4
    sh      a1, 0x0000(v1)             # 80100000
    andi    v0, a1, 0xFFFF             # v0 = 00000012
    addiu   t8, a0, 0xFFEE             # t8 = FFFFFFEE
    slt     $at, v0, t8
    bne     $at, $zero, lbl_800C24B8
    slt     $at, v0, a1
    bne     $at, $zero, lbl_800C24B8
    sll     t9, $ra,  2
    addu    t7, s3, t4
    lhu     t8, 0x0000(t7)             # 00000001
    addu    t9, t9, $ra
    sll     t9, t9,  5
    addu    t6, s4, t9
    sll     t9, t8,  3
    addu    t7, t6, t9
    lhu     t8, 0x0002(t7)             # 00000003
    addu    t9, s1, $ra
    bne     t8, $zero, lbl_800C24B8
    nop
    lbu     t6, 0x0000(s2)             # 8010221C
    lbu     t7, 0x0000(t9)             # 80121F68
    addiu   t8, a2, 0x0001             # t8 = 80120001
    lui     $at, 0x8010                # $at = 80100000
    bne     t6, t7, lbl_800C24B8
    nop
    sb      t8, 0x2B74($at)            # 80102B74
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C24B8:
    lui     v0, 0x8012                 # v0 = 80120000
    b       lbl_800C264C
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
lbl_800C24C4:
    lhu     v0, 0x0000(v1)             # 80100000
    addiu   t9, a0, 0xFFEE             # t9 = FFFFFFEE
    addu    a3, s3, t4
    slt     $at, v0, t9
    bne     $at, $zero, lbl_800C2608
    sll     t9, $ra,  2
    lbu     v0, 0x0000(s2)             # 8010221C
    addu    t6, s1, $ra
    addu    t9, t9, $ra
    beql    t5, v0, lbl_800C2528
    lhu     v0, 0x0000(a3)             # 00000000
    lbu     t7, 0x0000(t6)             # 80121F88
    xor     t8, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    bne     v0, t7, lbl_800C2518
    nop
    addiu   $at, $zero, 0x000C         # $at = 0000000C
    bnel    a2, $at, lbl_800C2528
    lhu     v0, 0x0000(a3)             # 00000000
    b       lbl_800C2524
    sh      $zero, 0x0000(v1)          # 80100000
lbl_800C2518:
    sh      t8, 0x1F44($at)            # 00001F50
    lui     s0, 0x8012                 # s0 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2524:
    lhu     v0, 0x0000(a3)             # 00000000
lbl_800C2528:
    sll     t9, t9,  5
    addu    a2, s4, t9
    addiu   t1, v0, 0x0001             # t1 = 80121F47
    andi    t1, t1, 0xFFFF             # t1 = 00001F47
    sll     t6, v0,  3
    addu    a1, a2, t6
    sh      t1, 0x0000(a3)             # 00000000
    lhu     t8, 0x0002(a1)             # 00000014
    sll     t7, t1,  3
    addu    t2, a2, t7
    sh      t8, 0x0000(t0)             # 00000000
    lbu     t9, 0x0000(a1)             # 00000012
    addu    v1, s1, $ra
    or      a0, t2, $zero              # a0 = 00000000
    andi    t6, t9, 0x00FF             # t6 = 000000EE
    beq     s5, t6, lbl_800C2580
    sb      t9, 0x0000(v1)             # 80100000
    xor     t7, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    sh      t7, 0x1F44($at)            # 80121F44
    lui     s0, 0x8012                 # s0 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2580:
    lbu     t8, 0x0000(a0)             # 00000000
    lbu     t9, 0x0000(a1)             # 00000012
    beql    t8, t9, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
    lbu     t6, 0x0000(t2)             # 00000000
    bne     t5, t6, lbl_800C25FC
    nop
    lhu     t7, 0x0002(t2)             # 00000002
    beq     t7, $zero, lbl_800C25FC
    nop
    lhu     t8, 0x0000(t0)             # 00000000
lbl_800C25AC:
    lhu     t9, 0x0002(a0)             # 00000002
    lhu     v0, 0x0000(a3)             # 00000000
    addu    t6, t8, t9
    addiu   t9, v0, 0x0001             # t9 = 80121F47
    sh      t6, 0x0000(t0)             # 00000000
    sh      t9, 0x0000(a3)             # 00000000
    sll     t7, v0,  3
    sll     t8, v0,  3
    addu    a1, a2, t7
    addu    a0, a2, t8
    lbu     v1, 0x0008(a0)             # 00000008
    lbu     t6, 0x0000(a1)             # 00000012
    addiu   a0, a0, 0x0008             # a0 = 00000008
    beql    v1, t6, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
    bne     t5, v1, lbl_800C25FC
    nop
    lhu     t7, 0x0002(a0)             # 0000000A
    bnel    t7, $zero, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
lbl_800C25FC:
    lui     v0, 0x8012                 # v0 = 80120000
    b       lbl_800C264C
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
lbl_800C2608:
    slti    $at, v0, 0x000A
    beq     $at, $zero, lbl_800C2630
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
    lw      t9, 0x0040($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    sb      t8, 0x0057($sp)
    sh      $zero, 0x0000(v1)          # 80100000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    b       lbl_800C264C
    sb      t9, 0x0000(s2)             # 8010221C
lbl_800C2630:
    xor     t6, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    sh      t6, 0x1F44($at)            # 80121F44
    lui     s0, 0x8012                 # s0 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C264C:
    bne     s0, $zero, lbl_800C26B0
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t7, 0x0000(v0)             # 80121F46
    lbu     t8, 0x2B78(t8)             # 80102B78
    slt     $at, t7, t8
    bnel    $at, $zero, lbl_800C26B4
    lw      t9, 0x0034($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x2238(v0)             # 80102238
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    andi    t9, v0, 0x4000             # t9 = 00000000
    beq     t9, $zero, lbl_800C26A4
    sll     t6, $ra,  2
    addu    t6, t6, $ra
    sll     t6, t6,  5
    addu    t7, s4, t6
    lbu     t8, 0x0000(t7)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    bne     s5, t8, lbl_800C26A4
    nop
    sh      v0, 0x2248($at)            # 80102248
lbl_800C26A4:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C26FC
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C26B0:
    lw      t9, 0x0034($sp)
lbl_800C26B4:
    addiu   $ra, $ra, 0x0001           # $ra = 80120001
    andi    $ra, $ra, 0x00FF           # $ra = 00000001
    slt     $at, $ra, t9
    bne     $at, $zero, lbl_800C2400
    or      a2, $ra, $zero             # a2 = 00000001
lbl_800C26C8:
    lbu     t6, 0x005B($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     s2, 0x8010                 # s2 = 80100000
    addiu   s2, s2, 0x221C             # s2 = 8010221C
    bne     t6, $zero, lbl_800C26FC
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lw      t7, 0x0040($sp)
    lbu     t8, 0x0000(v0)             # 80121F46
    lb      t9, 0x0057($sp)
    sb      t7, 0x0000(s2)             # 8010221C
    addu    t6, t8, t9
    addiu   t7, t6, 0x0001             # t7 = 000000EF
    sb      t7, 0x0000(v0)             # 80121F46
lbl_800C26FC:
    lw      $ra, 0x002C($sp)
lbl_800C2700:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C2720:
# MqDbg: AudioOcarina_CheckSongsWithoutMusicStaff
# Song activation related.
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x1F24(v0)             # 80121F24
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    andi    t6, v0, 0x0020             # t6 = 00000000
    beq     t6, $zero, lbl_800C2758
    sw      s0, 0x0018($sp)
    andi    t7, v0, 0x800F             # t7 = 00000000
    beq     t7, $zero, lbl_800C2758
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C2124
    lhu     a0, 0x223A(a0)             # 8010223A
    b       lbl_800C295C
    lw      $ra, 0x001C($sp)
lbl_800C2758:
    jal     func_800C22DC
    nop
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1F41(t8)             # 80121F41
    lui     a1, 0x8010                 # a1 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    beql    t8, $zero, lbl_800C295C
    lw      $ra, 0x001C($sp)
    lbu     a1, 0x2210(a1)             # 80102210
    lbu     t9, 0x2214(t9)             # 80102214
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beql    a1, t9, lbl_800C295C
    lw      $ra, 0x001C($sp)
    beq     a1, $at, lbl_800C2958
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t6, 0x0000(v0)             # 80121F46
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F40             # v1 = 80121F40
    addiu   t7, t6, 0x0001             # t7 = 00000001
    andi    t8, t7, 0x00FF             # t8 = 00000001
    slti    $at, t8, 0x0009
    bne     $at, $zero, lbl_800C27C0
    sb      t7, 0x0000(v0)             # 80121F46
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x0000(v0)             # 80121F46
lbl_800C27C0:
    lbu     v0, 0x0000(v1)             # 80121F40
    addiu   $at, $zero, 0x0008         # $at = 00000008
    or      t3, $zero, $zero           # t3 = 00000000
    bne     v0, $at, lbl_800C280C
    or      t2, v0, $zero              # t2 = 80121F46
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F38             # v0 = 80121F38
    or      t4, $zero, $zero           # t4 = 00000000
lbl_800C27E0:
    addu    t8, v0, t3
    addiu   t3, t3, 0x0001             # t3 = 00000001
    addu    t6, v0, t4
    lbu     t7, 0x0001(t6)             # 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slti    $at, t3, 0x0007
    or      t4, t3, $zero              # t4 = 00000001
    bne     $at, $zero, lbl_800C27E0
    sb      t7, 0x0000(t8)             # 00000001
    b       lbl_800C2820
    nop
lbl_800C280C:
    addiu   t9, v0, 0x0001             # t9 = 80121F39
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F38             # v0 = 80121F38
    sb      t9, 0x0000(v1)             # 80121F40
    andi    t2, t9, 0x00FF             # t2 = 00000039
lbl_800C2820:
    lui     v1, 0x8010                 # v1 = 80100000
    lb      v1, 0x2228(v1)             # 80102228
    lui     t3, 0x8012                 # t3 = 80120000
    lui     t5, 0x8012                 # t5 = 80120000
    bgez    v1, lbl_800C2840
    or      a0, v1, $zero              # a0 = 80100000
    b       lbl_800C2840
    subu    a0, $zero, v1
lbl_800C2840:
    slti    $at, a0, 0x0015
    bne     $at, $zero, lbl_800C285C
    addu    $ra, v0, t2
    addu    $ra, v0, t2
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    b       lbl_800C2860
    sb      t6, -0x0001($ra)           # FFFFFFFF
lbl_800C285C:
    sb      a1, -0x0001($ra)           # FFFFFFFF
lbl_800C2860:
    lbu     t3, 0x1F42(t3)             # 80121F42
    lbu     t5, 0x1F43(t5)             # 80121F43
    lui     s0, 0x8012                 # s0 = 80120000
    lui     t1, 0x8010                 # t1 = 80100000
    slt     $at, t3, t5
    beq     $at, $zero, lbl_800C2958
    or      t4, t3, $zero              # t4 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
    addiu   t1, t1, 0x2268             # t1 = 80102268
lbl_800C2884:
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t8, t7, t4
    andi    t9, t8, 0xFFFF             # t9 = 00000001
    and     t6, s0, t9
    beq     t6, $zero, lbl_800C2944
    sll     t7, t3,  3
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x2EFC             # t8 = 80102EFC
    addu    t7, t7, t3
    addu    t0, t7, t8
    lbu     a2, 0x0000(t0)             # 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    blez    a2, lbl_800C2924
    slt     $at, t2, a2
    bne     $at, $zero, lbl_800C2924
    subu    t9, $zero, a2
    addu    a3, $ra, t9
    or      a0, $zero, $zero           # a0 = 00000000
    addu    t7, t0, v1
lbl_800C28D4:
    lbu     t8, 0x0001(t7)             # 00000002
    addu    t6, a3, a0
    lbu     v0, 0x0000(t6)             # 000000FF
    addu    t9, t1, t8
    lbu     t6, 0x0000(t9)             # 00000001
    bnel    v0, t6, lbl_800C2904
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    b       lbl_800C2908
    or      a0, v1, $zero              # a0 = 00000001
    addiu   a1, a1, 0x0001             # a1 = 00000002
lbl_800C2904:
    andi    a1, a1, 0x00FF             # a1 = 00000002
lbl_800C2908:
    slt     $at, a0, a2
    beq     $at, $zero, lbl_800C2924
    nop
    bne     a1, $zero, lbl_800C2924
    slt     $at, t2, a2
    beql    $at, $zero, lbl_800C28D4
    addu    t7, t0, v1
lbl_800C2924:
    bne     v1, a2, lbl_800C2944
    addiu   t7, t4, 0x0001             # t7 = 80120001
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x2B74($at)            # 80102B74
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C2944:
    addiu   t3, t3, 0x0001             # t3 = 80120001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slt     $at, t3, t5
    bne     $at, $zero, lbl_800C2884
    or      t4, t3, $zero              # t4 = 00000001
lbl_800C2958:
    lw      $ra, 0x001C($sp)
lbl_800C295C:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C296C:
# MqDbg: AudioOcarina_PlayControllerInput
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x2238(t6)             # 80102238
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    beq     t6, $zero, lbl_800C29A0
    sw      a0, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2B7C             # v1 = 80102B7C
    lbu     v0, 0x0000(v1)             # 80102B7C
    beq     v0, $zero, lbl_800C29A0
    addiu   t7, v0, 0xFFFF             # t7 = FFFFFFFF
    b       lbl_800C2C70
    sb      t7, 0x0000(v1)             # 80102B7C
lbl_800C29A0:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F28             # v1 = 80121F28
    lw      v0, 0x0000(v1)             # 80121F28
    beq     v0, $zero, lbl_800C29C8
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F24(t8)             # 80121F24
    andi    t2, v0, 0x800F             # t2 = 00000000
    andi    t9, t8, 0x800F             # t9 = 00000000
    beql    t9, t2, lbl_800C2C74
    lw      $ra, 0x001C($sp)
lbl_800C29C8:
    sw      $zero, 0x0000(v1)          # 80121F28
    lui     a2, 0x8012                 # a2 = 80120000
    lw      a2, 0x1F24(a2)             # 80121F24
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    addiu   a1, a1, 0x2218             # a1 = 80102218
    sb      t0, 0x0000(t1)             # 80102210
    sb      t0, 0x0000(a1)             # 80102218
    lui     t3, 0x8012                 # t3 = 80120000
    lw      t3, 0x1F2C(t3)             # 80121F2C
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x1F30             # a0 = 80121F30
    lw      t4, 0x0000(a0)             # 80121F30
    andi    a3, a2, 0x800F             # a3 = 00000000
    and     v0, a3, t3
    andi    v0, v0, 0x800F             # v0 = 00000000
    and     v1, t4, v0
    bne     v1, $zero, lbl_800C2A2C
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    beql    a2, $zero, lbl_800C2A30
    sw      v1, 0x0000(a0)             # 80121F30
    b       lbl_800C2A30
    sw      a2, 0x0000(a0)             # 80121F30
lbl_800C2A2C:
    sw      v1, 0x0000(a0)             # 80121F30
lbl_800C2A30:
    lw      v0, 0x0000(a0)             # 80121F30
    lui     a0, 0x8010                 # a0 = 80100000
    lui     $at, 0x3F80                # $at = 3F800000
    andi    t5, v0, 0x8000             # t5 = 00000000
    beq     t5, $zero, lbl_800C2A54
    andi    t7, v0, 0x0004             # t7 = 00000000
    sb      t6, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      $zero, 0x0000(a1)          # 80102218
lbl_800C2A54:
    beq     t7, $zero, lbl_800C2A70
    andi    t2, v0, 0x0001             # t2 = 00000000
    addiu   t8, $zero, 0x0005          # t8 = 00000005
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t8, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t9, 0x0000(a1)             # 80102218
lbl_800C2A70:
    beq     t2, $zero, lbl_800C2A8C
    andi    t5, v0, 0x0002             # t5 = 00000000
    addiu   t3, $zero, 0x0009          # t3 = 00000009
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    sb      t3, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t4, 0x0000(a1)             # 80102218
lbl_800C2A8C:
    beq     t5, $zero, lbl_800C2AA8
    andi    t8, v0, 0x0008             # t8 = 00000000
    addiu   t6, $zero, 0x000B          # t6 = 0000000B
    addiu   t7, $zero, 0x0003          # t7 = 00000003
    sb      t6, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t7, 0x0000(a1)             # 80102218
lbl_800C2AA8:
    beq     t8, $zero, lbl_800C2ABC
    addiu   t9, $zero, 0x000E          # t9 = 0000000E
    addiu   t2, $zero, 0x0004          # t2 = 00000004
    sb      t9, 0x0000(t1)             # 80102210
    sb      t2, 0x0000(a1)             # 80102218
lbl_800C2ABC:
    lbu     v1, 0x0000(t1)             # 80102210
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
    andi    t3, a2, 0x0010             # t3 = 00000000
    beq     a3, v1, lbl_800C2B04
    or      v0, v1, $zero              # v0 = 80121F28
    beq     t3, $zero, lbl_800C2B04
    lui     t4, 0x8010                 # t4 = 80100000
    lbu     t4, 0x2B54(t4)             # 80102B54
    addiu   t0, $zero, 0x0002          # t0 = 00000002
    addiu   t7, v1, 0x0001             # t7 = 80121F29
    beql    t0, t4, lbl_800C2B08
    addiu   t0, $zero, 0x0002          # t0 = 00000002
    lbu     t5, 0x0000(a1)             # 80102218
    andi    v1, t7, 0x00FF             # v1 = 00000029
    or      v0, v1, $zero              # v0 = 00000029
    addiu   t6, t5, 0x0080             # t6 = 00000080
    sb      t6, 0x0000(a1)             # 80102218
    sb      t7, 0x0000(t1)             # 80102210
lbl_800C2B04:
    addiu   t0, $zero, 0x0002          # t0 = 00000002
lbl_800C2B08:
    beq     a3, v0, lbl_800C2B38
    lbu     a0, 0x2B54(a0)             # 80102B54
    andi    t8, a2, 0x2000             # t8 = 00000000
    beq     t8, $zero, lbl_800C2B38
    nop
    beq     t0, a0, lbl_800C2B38
    nop
    lbu     t9, 0x0000(a1)             # 80102218
    addiu   t3, v1, 0xFFFF             # t3 = 00000028
    sb      t3, 0x0000(t1)             # 80102210
    addiu   t2, t9, 0x0040             # t2 = 0000004E
    sb      t2, 0x0000(a1)             # 80102218
lbl_800C2B38:
    beq     t0, a0, lbl_800C2BB0
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t4, 0x8012                 # t4 = 80120000
    lb      t4, 0x1F21(t4)             # 80121F21
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2228             # v1 = 80102228
    sb      t4, 0x0000(v1)             # 80102228
    jal     func_800C1F80
    lb      a0, 0x0000(v1)             # 80102228
    lui     v0, 0x8012                 # v0 = 80120000
    lb      v0, 0x1F20(v0)             # 80121F20
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f0, 0x2220($at)           # 80102220
    bgez    v0, lbl_800C2B7C
    lui     a0, 0x0602                 # a0 = 06020000
    b       lbl_800C2B80
    subu    v1, $zero, v0
lbl_800C2B7C:
    or      v1, v0, $zero              # v1 = 80120000
lbl_800C2B80:
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x2230             # v0 = 80102230
    sra     t5, v1,  2
    sb      t5, 0x0000(v0)             # 80102230
    lb      a1, 0x0000(v0)             # 80102230
    jal     func_800BB0E0
    ori     a0, a0, 0x0D06             # a0 = 06020D06
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    lbu     v0, 0x0000(t1)             # 80102210
    b       lbl_800C2BC8
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
lbl_800C2BB0:
    mtc1    $at, $f4                   # $f4 = 0.00
    addiu   v1, v1, 0x2228             # v1 = 00002228
    sb      $zero, 0x0000(v1)          # 00002228
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f4, 0x2220($at)           # 80102220
    lbu     v0, 0x0000(t1)             # 80102210
lbl_800C2BC8:
    beq     a3, v0, lbl_800C2C50
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2214(t6)             # 80102214
    lui     a1, 0x8010                 # a1 = 80100000
    beq     v0, t6, lbl_800C2C50
    nop
    lb      a1, 0x220C(a1)             # 8010220C
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D07             # a0 = 06020D07
    addiu   a1, a1, 0xFFFF             # a1 = 800FFFFF
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D05             # a0 = 06020D05
    jal     func_800BB0E0
    lb      a1, 0x0000(t1)             # 80102210
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x43A8             # t8 = 801043A8
    addiu   t7, t7, 0x2224             # t7 = 80102224
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x2220             # a3 = 80102220
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t7, 0x0010($sp)
    sw      t8, 0x0014($sp)
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    b       lbl_800C2C74
    lw      $ra, 0x001C($sp)
lbl_800C2C50:
    lui     t9, 0x8010                 # t9 = 80100000
    lbu     t9, 0x2214(t9)             # 80102214
    beql    a3, t9, lbl_800C2C74
    lw      $ra, 0x001C($sp)
    bnel    a3, v0, lbl_800C2C74
    lw      $ra, 0x001C($sp)
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
lbl_800C2C70:
    lw      $ra, 0x001C($sp)
lbl_800C2C74:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C2C80:
# MqDbg: AudioOcarina_EnableInput
# sw A0, 0x0000(SP)
# sb a0, 0x80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, 0x0000($sp)
    jr      $ra
    sb      a0, 0x2208($at)            # 80102208


func_800C2C90:
# MqDbg: AudioOcarina_SetInstrument
# Handles setting the instrument for song playback?
# A0 = Instrument
    lui     t6, 0x8010                 # t6 = 80100000
    lb      t6, 0x220C(t6)             # 8010220C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      $ra, 0x0014($sp)
    beq     a0, t6, lbl_800C2D64
    or      v0, a0, $zero              # v0 = 00000000
    lui     $at, 0x8201                # $at = 82010000
    ori     $at, $at, 0x0D00           # $at = 82010D00
    or      a0, a0, $at                # a0 = 82010D00
    jal     func_800CAA70
    sw      v0, 0x001C($sp)
    lw      v0, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    ori     t7, $zero, 0xFFFF          # t7 = 0000FFFF
    bne     v0, $zero, lbl_800C2D40
    sb      v0, 0x220C($at)            # 8010220C
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F24($at)         # 80121F24
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F2C($at)         # 80121F2C
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F30($at)         # 80121F30
    lui     $at, 0x8012                # $at = 80120000
    sw      t7, 0x1F28($at)            # 80121F28
    jal     func_800C296C
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C7F40
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2234($at)         # 80102234
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x2244($at)         # 80102244
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
    jal     func_800C7FFC
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    b       lbl_800C2D68
    lw      $ra, 0x0014($sp)
lbl_800C2D40:
    lui     $at, 0x8012                # $at = 80120000
    jal     func_800C1F20
    sw      $zero, 0x1F24($at)         # 80121F24
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F24(t8)             # 80121F24
    lui     $at, 0x8012                # $at = 80120000
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    jal     func_800C7F98
    sw      t8, 0x1F28($at)            # 80121F28
lbl_800C2D64:
    lw      $ra, 0x0014($sp)
lbl_800C2D68:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C2D74:
# MqDbg: AudioOcarina_SetPlaybackSong
# Song playback related.
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    sll     a2, a1, 24
    sra     a2, a2, 24
    sw      $ra, 0x0014($sp)
    bne     a0, $zero, lbl_800C2DB0
    sw      a1, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2234($at)         # 80102234
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    b       lbl_800C2E68
    lw      $ra, 0x0014($sp)
lbl_800C2DB0:
    slti    $at, a0, 0x000F
    beq     $at, $zero, lbl_800C2DE8
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  5
    lui     t8, 0x8010                 # t8 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   t8, t8, 0x227C             # t8 = 8010227C
    addiu   t7, t6, 0xFF60             # t7 = FFFFFF60
    addiu   a3, a3, 0x2B3C             # a3 = 80102B3C
    addu    t9, t7, t8
    b       lbl_800C2DFC
    sw      t9, 0x0000(a3)             # 80102B3C
lbl_800C2DE8:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   a3, a3, 0x2B3C             # a3 = 80102B3C
    addiu   t0, t0, 0x2B80             # t0 = 80102B80
    sw      t0, 0x0000(a3)             # 80102B3C
lbl_800C2DFC:
    lui     $at, 0x8010                # $at = 80100000
    sb      a2, 0x2234($at)            # 80102234
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x223C($at)         # 8010223C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t1, $zero, 0x00FF          # t1 = 000000FF
    sb      t1, 0x224C($at)            # 8010224C
    addiu   v1, v1, 0x2240             # v1 = 80102240
    sh      $zero, 0x0000(v1)          # 80102240
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x2244($at)         # 80102244
    lhu     v0, 0x0000(v1)             # 80102240
    lw      a0, 0x0000(a3)             # 80102B3C
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    sll     t2, v0,  3
    addu    t3, a0, t2
    lbu     t4, 0x0000(t3)             # 00000000
    bne     a1, t4, lbl_800C2E64
    addiu   t5, v0, 0x0001             # t5 = 00000001
lbl_800C2E48:
    andi    v0, t5, 0xFFFF             # v0 = 00000001
    sll     t6, v0,  3
    addu    t7, a0, t6
    sh      t5, 0x0000(v1)             # 80102240
    lbu     t8, 0x0000(t7)             # FFFFFF60
    beql    a1, t8, lbl_800C2E48
    addiu   t5, v0, 0x0001             # t5 = 00000002
lbl_800C2E64:
    lw      $ra, 0x0014($sp)
lbl_800C2E68:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C2E74:
# MqDbg: AudioOcarina_PlaybackSong
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x2234             # t0 = 80102234
    lbu     a3, 0x0000(t0)             # 80102234
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    beq     a3, $zero, lbl_800C3190
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2244             # t1 = 80102244
    lhu     t6, 0x0000(t1)             # 80102244
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x223C             # v1 = 8010223C
    bne     t6, $zero, lbl_800C2EB0
    lui     t7, 0x8012                 # t7 = 80120000
    b       lbl_800C2EC0
    addiu   a0, $zero, 0x0003          # a0 = 00000003
lbl_800C2EB0:
    lui     t8, 0x8010                 # t8 = 80100000
    lw      t8, 0x2264(t8)             # 80102264
    lw      t7, 0x1F1C(t7)             # 80121F1C
    subu    a0, t7, t8
lbl_800C2EC0:
    lw      v0, 0x0000(v1)             # 8010223C
    lui     a2, 0x8010                 # a2 = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sltu    $at, a0, v0
    beq     $at, $zero, lbl_800C2EE4
    subu    t2, a0, v0
    subu    t9, v0, a0
    b       lbl_800C2EEC
    sw      t9, 0x0000(v1)             # 8010223C
lbl_800C2EE4:
    sw      t2, 0x0020($sp)
    sw      $zero, 0x0000(v1)          # 8010223C
lbl_800C2EEC:
    lw      t3, 0x0000(v1)             # 8010223C
    bnel    t3, $zero, lbl_800C3194
    lw      $ra, 0x001C($sp)
    lhu     a1, 0x2240(a1)             # 80102240
    lw      a2, 0x2B3C(a2)             # 80102B3C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t4, a1,  3
    addu    a0, a2, t4
    lhu     t5, 0x0002(a0)             # 00000005
    addiu   t8, a3, 0xFFFF             # t8 = FFFFFFFF
    bne     a1, $at, lbl_800C2F24
    sw      t5, 0x0000(v1)             # 8010223C
    addiu   t7, t5, 0x0001             # t7 = 00000001
    sw      t7, 0x0000(v1)             # 8010223C
lbl_800C2F24:
    lw      v0, 0x0000(v1)             # 8010223C
    lw      t3, 0x0020($sp)
    andi    t9, t8, 0x00FF             # t9 = 000000FF
    bne     v0, $zero, lbl_800C2F70
    subu    t4, v0, t3
    beq     t9, $zero, lbl_800C2F60
    sb      t8, 0x0000(t0)             # 80102234
    lui     a2, 0x8010                 # a2 = 80100000
    lui     $at, 0x8010                # $at = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    sh      $zero, 0x2240($at)         # 80102240
    addiu   t2, $zero, 0x00FF          # t2 = 000000FF
    sh      $zero, 0x0000(t1)          # 80102244
    b       lbl_800C3190
    sb      t2, 0x0000(a2)             # 8010224C
lbl_800C2F60:
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    b       lbl_800C3194
    lw      $ra, 0x001C($sp)
lbl_800C2F70:
    sw      t4, 0x0000(v1)             # 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2250             # v1 = 80102250
    lbu     t5, 0x0000(v1)             # 80102250
    lbu     v0, 0x0004(a0)             # 00000004
    beq     t5, v0, lbl_800C2FC0
    andi    t6, v0, 0x00FF             # t6 = 00000000
    mtc1    t6, $f4                    # $f4 = 0.00
    sb      v0, 0x0000(v1)             # 80102250
    bgez    t6, lbl_800C2FAC
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C2FAC:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     $at, 0x8010                # $at = 80100000
    div.s   $f16, $f6, $f10
    swc1    $f16, 0x2260($at)          # 80102260
lbl_800C2FC0:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2254             # v1 = 80102254
    lbu     t7, 0x0000(v1)             # 80102254
    lbu     v0, 0x0005(a0)             # 00000005
    beq     t7, v0, lbl_800C300C
    nop
    sb      v0, 0x0000(v1)             # 80102254
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D06             # a0 = 06020D06
    jal     func_800BB0E0
    lb      a1, 0x0000(v1)             # 80102254
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
    lui     a2, 0x8010                 # a2 = 80100000
    lw      a2, 0x2B3C(a2)             # 80102B3C
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t8, a1,  3
    addiu   t1, t1, 0x2244             # t1 = 80102244
    addu    a0, a2, t8
lbl_800C300C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2258             # v1 = 80102258
    lb      t9, 0x0000(v1)             # 80102258
    lb      v0, 0x0006(a0)             # 00000006
    beql    t9, v0, lbl_800C305C
    sll     t3, a1,  3
    sb      v0, 0x0000(v1)             # 80102258
    jal     func_800C1F80
    lb      a0, 0x0000(v1)             # 80102258
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
    lui     a2, 0x8010                 # a2 = 80100000
    lw      a2, 0x2B3C(a2)             # 80102B3C
    lui     t1, 0x8010                 # t1 = 80100000
    lui     $at, 0x8010                # $at = 80100000
    sll     t2, a1,  3
    swc1    $f0, 0x225C($at)           # 8010225C
    addiu   t1, t1, 0x2244             # t1 = 80102244
    addu    a0, a2, t2
    sll     t3, a1,  3
lbl_800C305C:
    addu    v0, a2, t3
    lbu     t5, -0x0004(v0)            # FFFFFFFC
    lbu     t4, 0x0004(a0)             # 00000004
    addiu   $at, $zero, 0x000A         # $at = 0000000A
    bne     t4, t5, lbl_800C30A0
    nop
    lbu     t6, 0x0005(a0)             # 00000005
    lbu     t7, -0x0003(v0)            # FFFFFFFD
    bne     t6, t7, lbl_800C30A0
    nop
    lb      t8, 0x0006(a0)             # 00000006
    lb      t9, -0x0002(v0)            # FFFFFFFE
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    bne     t8, t9, lbl_800C30A0
    addiu   t2, $zero, 0x00FE          # t2 = 000000FE
    sb      t2, 0x0000(a2)             # 8010224C
lbl_800C30A0:
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    lbu     t3, 0x0000(a2)             # 8010224C
    lbu     v0, 0x0000(a0)             # 00000000
    beq     t3, v0, lbl_800C3184
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $at, lbl_800C30D0
    or      a1, v1, $zero              # a1 = 00000000
    lbu     t4, 0x0007(a0)             # 00000007
    addu    t5, t4, a1
    b       lbl_800C30D4
    sb      t5, 0x0000(a2)             # 8010224C
lbl_800C30D0:
    sb      v1, 0x0000(a2)             # 8010224C
lbl_800C30D4:
    lbu     t6, 0x0000(a2)             # 8010224C
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t6, $at, lbl_800C3174
    nop
    lhu     t7, 0x0000(t1)             # 80102244
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a0, 0x0602                 # a0 = 06020000
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sh      t8, 0x0000(t1)             # 80102244
    lb      a1, 0x220C(a1)             # 8010220C
    ori     a0, a0, 0x0D07             # a0 = 06020D07
    addiu   a1, a1, 0xFFFF             # a1 = 800FFFFF
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    lbu     a1, 0x0000(a2)             # 8010224C
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D05             # a0 = 06020D05
    andi    a1, a1, 0x003F             # a1 = 00000000
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   t2, t2, 0x43A8             # t2 = 801043A8
    addiu   t9, t9, 0x2260             # t9 = 80102260
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x225C             # a3 = 8010225C
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t9, 0x0010($sp)
    sw      t2, 0x0014($sp)
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a1, 0x8010                 # a1 = 80100000
    b       lbl_800C3184
    lhu     a1, 0x2240(a1)             # 80102240
lbl_800C3174:
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
lbl_800C3184:
    addiu   t3, a1, 0x0001             # t3 = 80100001
    lui     $at, 0x8010                # $at = 80100000
    sh      t3, 0x2240($at)            # 80102240
lbl_800C3190:
    lw      $ra, 0x001C($sp)
lbl_800C3194:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C31A0:
# MqDbg: AudioOcarina_SetRecordingSong
# Song playback & activation related.
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lui     $ra, 0x8010                # $ra = 80100000
    addiu   $ra, $ra, 0x2B54           # $ra = 80102B54
    lbu     t6, 0x0000($ra)            # 80102B54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      a0, 0x0020($sp)
    bne     t6, $at, lbl_800C31D0
    lui     v0, 0x8010                 # v0 = 80100000
    lui     a0, 0x8010                 # a0 = 80100000
    b       lbl_800C31D8
    lw      a0, 0x2EE0(a0)             # 80102EE0
lbl_800C31D0:
    lui     a0, 0x8010                 # a0 = 80100000
    lw      a0, 0x2EE8(a0)             # 80102EE8
lbl_800C31D8:
    lui     t5, 0x8010                 # t5 = 80100000
    addiu   t5, t5, 0x2B58             # t5 = 80102B58
    lbu     t8, 0x0000(t5)             # 80102B58
    addiu   v0, v0, 0x2B60             # v0 = 80102B60
    lbu     t7, 0x0000(v0)             # 80102B60
    sll     t9, t8,  3
    addu    t6, a0, t9
    sb      t7, 0x0000(t6)             # 00000000
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F1C(t8)             # 80121F1C
    lw      t9, 0x2B5C(t9)             # 80102B5C
    lbu     t6, 0x0000(t5)             # 80102B58
    lui     v1, 0x8010                 # v1 = 80100000
    subu    t7, t8, t9
    sll     t8, t6,  3
    addu    t9, a0, t8
    sh      t7, 0x0002(t9)             # 80100002
    lbu     t8, 0x0000(t5)             # 80102B58
    addiu   v1, v1, 0x2B64             # v1 = 80102B64
    lbu     t6, 0x0000(v1)             # 80102B64
    sll     t7, t8,  3
    addu    t9, a0, t7
    sb      t6, 0x0004(t9)             # 80100004
    lbu     t7, 0x0000(t5)             # 80102B58
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x2B68             # a1 = 80102B68
    lbu     t8, 0x0000(a1)             # 80102B68
    sll     t6, t7,  3
    addu    t9, a0, t6
    sb      t8, 0x0005(t9)             # 80100005
    lbu     t6, 0x0000(t5)             # 80102B58
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x2B6C             # t0 = 80102B6C
    lb      t7, 0x0000(t0)             # 80102B6C
    sll     t8, t6,  3
    addu    t9, a0, t8
    lui     t1, 0x8010                 # t1 = 80100000
    sb      t7, 0x0006(t9)             # 80100006
    addiu   t1, t1, 0x2B70             # t1 = 80102B70
    lbu     t6, 0x0000(t1)             # 80102B70
    lbu     t7, 0x0000(t5)             # 80102B58
    addiu   $at, $zero, 0x006B         # $at = 0000006B
    andi    t8, t6, 0x00C0             # t8 = 00000000
    sll     t9, t7,  3
    addu    t6, a0, t9
    sb      t8, 0x0007(t6)             # 00000007
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2210(t7)             # 80102210
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t7, 0x0000(v0)             # 80102B60
    lb      t9, 0x222C(t9)             # 8010222C
    lui     t6, 0x8010                 # t6 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    sb      t9, 0x0000(v1)             # 80102B64
    lb      t8, 0x2230(t8)             # 80102230
    lbu     t9, 0x0000(t5)             # 80102B58
    sb      t8, 0x0000(a1)             # 80102B68
    lb      t6, 0x2228(t6)             # 80102228
    addiu   t8, t9, 0x0001             # t8 = 80100001
    andi    a3, t8, 0x00FF             # a3 = 00000001
    sb      t6, 0x0000(t0)             # 80102B6C
    lbu     t7, 0x2218(t7)             # 80102218
    sb      t8, 0x0000(t5)             # 80102B58
    or      a2, a3, $zero              # a2 = 00000001
    beq     a3, $at, lbl_800C32F0
    sb      t7, 0x0000(t1)             # 80102B70
    lbu     t6, 0x0023($sp)
    beq     t6, $zero, lbl_800C3598
lbl_800C32F0:
    andi    t1, a3, 0xFFFF             # t1 = 00000001
    beq     t1, $zero, lbl_800C3324
    or      v0, t1, $zero              # v0 = 00000001
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    addiu   t1, t1, 0xFFFF             # t1 = 00000000
lbl_800C3304:
    andi    t1, t1, 0xFFFF             # t1 = 00000000
    sll     t7, t1,  3
    addu    t9, a0, t7
    or      v0, t1, $zero              # v0 = 00000000
    beq     t1, $zero, lbl_800C3324
    lbu     v1, 0x0000(t9)             # 80100000
    beql    a1, v1, lbl_800C3304
    addiu   t1, t1, 0xFFFF             # t1 = FFFFFFFF
lbl_800C3324:
    addiu   t8, v0, 0x0001             # t8 = 00000001
    beq     t8, a2, lbl_800C3348
    addiu   t6, v0, 0x0002             # t6 = 00000002
    andi    t7, t6, 0x00FF             # t7 = 00000002
    sll     t9, t7,  3
    sb      t6, 0x0000(t5)             # 80102B58
    addu    t8, a0, t9
    sh      $zero, -0x0006(t8)         # FFFFFFFB
    lbu     a3, 0x0000(t5)             # 80102B58
lbl_800C3348:
    sll     t6, a3,  3
    addu    t7, a0, t6
    sh      $zero, 0x0002(t7)          # 00000004
    lbu     t9, 0x0000($ra)            # 80102B54
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lui     t8, 0x8012                 # t8 = 80120000
    bnel    t9, $at, lbl_800C3598
    sb      $zero, 0x0000($ra)         # 80102B54
    lbu     t8, 0x1F46(t8)             # 80121F46
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    slti    $at, t8, 0x0008
    bne     $at, $zero, lbl_800C3590
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    lbu     t6, 0x0000(t5)             # 80102B58
    or      t1, $zero, $zero           # t1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    blez    t6, lbl_800C33E0
    sll     t8, v0,  3
lbl_800C3394:
    addu    t6, a0, t8
    lwl     t8, 0x0008(t6)             # 0000000A
    lwr     t8, 0x000B(t6)             # 0000000D
    sll     t7, t1,  3
    addu    t9, a0, t7
    swl     t8, 0x0000(t9)             # 80100000
    swr     t8, 0x0003(t9)             # 80100003
    lwl     t7, 0x000C(t6)             # 0000000E
    lwr     t7, 0x000F(t6)             # 00000011
    addiu   t1, t1, 0x0001             # t1 = 00000001
    andi    t1, t1, 0xFFFF             # t1 = 00000001
    swl     t7, 0x0004(t9)             # 80100004
    swr     t7, 0x0007(t9)             # 80100007
    lbu     t9, 0x0000(t5)             # 80102B58
    or      v0, t1, $zero              # v0 = 00000001
    slt     $at, t1, t9
    bnel    $at, $zero, lbl_800C3394
    sll     t8, v0,  3
    or      t1, $zero, $zero           # t1 = 00000000
lbl_800C33E0:
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    jal     func_800C209C
    sh      t1, 0x001E($sp)
    lui     t5, 0x8010                 # t5 = 80100000
    lui     $ra, 0x8010                # $ra = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   $ra, $ra, 0x2B54           # $ra = 80102B54
    addiu   t5, t5, 0x2B58             # t5 = 80102B58
    lhu     t1, 0x001E($sp)
    addiu   a3, a3, 0x2EFC             # a3 = 80102EFC
    addiu   t4, $zero, 0x0009          # t4 = 00000009
    addiu   t3, $zero, 0x0009          # t3 = 00000009
lbl_800C3410:
    multu   t1, t4
    or      t0, $zero, $zero           # t0 = 00000000
    mflo    t6
    addu    t7, a3, t6
    lbu     a2, 0x0000(t7)             # 00000000
    subu    t2, t3, a2
    blezl   t2, lbl_800C34D4
    addiu   t1, t1, 0x0001             # t1 = 00000001
lbl_800C3430:
    blez    a2, lbl_800C34A0
    or      v1, $zero, $zero           # v1 = 00000000
    slti    $at, t0, 0x0008
    beq     $at, $zero, lbl_800C34A0
    or      a0, t0, $zero              # a0 = 00000000
    sll     t8, t1,  3
    addu    t8, t8, t1
    addu    a1, a3, t8
    addu    t6, a3, a0
    lbu     t7, 0x006D(t6)             # 0000006D
    lbu     t9, 0x0001(a1)             # 00000001
    bne     t9, t7, lbl_800C34A0
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800C3468:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, a2
    beq     $at, $zero, lbl_800C34A0
    or      v0, v1, $zero              # v0 = 00000001
    addu    t8, v0, a0
    slti    $at, t8, 0x0008
    beq     $at, $zero, lbl_800C34A0
    addu    t6, a1, v1
    addu    t7, a3, v0
    lbu     t9, 0x0001(t6)             # 00000001
    addu    t8, t7, a0
    lbu     t6, 0x006D(t8)             # 0000006D
    beql    t9, t6, lbl_800C3468
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800C34A0:
    bne     v1, a2, lbl_800C34BC
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    sb      v0, 0x0000($ra)            # 80102B54
    b       lbl_800C3598
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C34BC:
    addiu   t0, t0, 0x0001             # t0 = 00000001
    andi    t0, t0, 0x00FF             # t0 = 00000001
    slt     $at, t0, t2
    bne     $at, $zero, lbl_800C3430
    nop
    addiu   t1, t1, 0x0001             # t1 = 00000002
lbl_800C34D4:
    andi    t1, t1, 0xFFFF             # t1 = 00000002
    slti    $at, t1, 0x000C
    bne     $at, $zero, lbl_800C3410
    nop
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    lbu     v1, 0x006D(a3)             # 80102F69
lbl_800C34EC:
    addu    t7, a3, t1
    lbu     t8, 0x006D(t7)             # 0000006D
    addiu   t1, t1, 0x0001             # t1 = 00000002
    andi    t1, t1, 0xFFFF             # t1 = 00000002
    beq     v1, t8, lbl_800C350C
    nop
    b       lbl_800C350C
    addiu   t1, $zero, 0x0009          # t1 = 00000009
lbl_800C350C:
    slti    $at, t1, 0x0008
    bne     $at, $zero, lbl_800C34EC
    or      v0, t1, $zero              # v0 = 00000009
    addiu   $at, $zero, 0x0008         # $at = 00000008
    bne     v0, $at, lbl_800C3538
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    sb      v0, 0x0000($ra)            # 80102B54
    b       lbl_800C3598
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C3538:
    lbu     a2, 0x0000(t5)             # 80102B58
    or      t1, $zero, $zero           # t1 = 00000000
    blez    a2, lbl_800C3584
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
lbl_800C354C:
    sll     t9, t1,  3
    addu    v0, v1, t9
    lwl     t7, 0x0820(v0)             # 0000091F
    lwl     t6, 0x0824(v0)             # 00000923
    lwr     t7, 0x0823(v0)             # 00000922
    lwr     t6, 0x0827(v0)             # 00000926
    addiu   t1, t1, 0x0001             # t1 = 00000001
    andi    t1, t1, 0xFFFF             # t1 = 00000001
    slt     $at, t1, a2
    swl     t7, 0x0780(v0)             # 0000087F
    swl     t6, 0x0784(v0)             # 00000883
    swr     t7, 0x0783(v0)             # 00000882
    bne     $at, $zero, lbl_800C354C
    swr     t6, 0x0787(v0)             # 00000886
lbl_800C3584:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3594
    sb      $zero, 0x2208($at)         # 80102208
lbl_800C3590:
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C3594:
    sb      $zero, 0x0000($ra)         # 80102B54
lbl_800C3598:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C35A8:
# MqDbg: AudioOcarina_SetRecordingState
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x2B54(v0)             # 80102B54
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    andi    a1, a0, 0x00FF             # a1 = 00000000
    sw      $ra, 0x0014($sp)
    beq     a1, v0, lbl_800C36C4
    sw      a0, 0x0018($sp)
    beq     a1, $zero, lbl_800C3654
    lui     t4, 0x8010                 # t4 = 80100000
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x1F1C(t6)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t7, $zero, 0x00FF          # t7 = 000000FF
    sw      t6, 0x2B5C($at)            # 80102B5C
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x2B60($at)            # 80102B60
    lui     $at, 0x8010                # $at = 80100000
    addiu   t8, $zero, 0x0057          # t8 = 00000057
    sb      t8, 0x2B64($at)            # 80102B64
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B68($at)         # 80102B68
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B6C($at)         # 80102B6C
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B70($at)         # 80102B70
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B58($at)         # 80102B58
    lui     $at, 0x8010                # $at = 80100000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x2208($at)            # 80102208
    lui     $at, 0x8012                # $at = 80120000
    lui     t1, 0x8010                 # t1 = 80100000
    sb      $zero, 0x1F46($at)         # 80121F46
    addiu   t1, t1, 0x2B88             # t1 = 80102B88
    lwl     t3, 0x0000(t1)             # 80102B88
    lwl     t2, 0x0004(t1)             # 80102B8C
    lwr     t3, 0x0003(t1)             # 80102B8B
    lwr     t2, 0x0007(t1)             # 80102B8F
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x1FB8             # t0 = 80121FB8
    sw      t3, 0x0000(t0)             # 80121FB8
    b       lbl_800C36BC
    sw      t2, 0x0004(t0)             # 80121FBC
lbl_800C3654:
    lbu     t4, 0x2B58(t4)             # 80102B58
    lui     t5, 0x8010                 # t5 = 80100000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     t4, $zero, lbl_800C3690
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x1FB8             # t6 = 80121FB8
    lw      t8, 0x0000(t6)             # 80121FB8
    lw      t7, 0x0004(t6)             # 80121FBC
    addiu   t5, t5, 0x2B88             # t5 = 80102B88
    swl     t8, 0x0000(t5)             # 80102B88
    swl     t7, 0x0004(t5)             # 80102B8C
    swr     t8, 0x0003(t5)             # 80102B8B
    b       lbl_800C36AC
    swr     t7, 0x0007(t5)             # 80102B8F
lbl_800C3690:
    bne     v0, $at, lbl_800C36A0
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x8012                # $at = 80120000
    sb      t9, 0x1F46($at)            # 80121F46
lbl_800C36A0:
    jal     func_800C31A0
    sb      a1, 0x001B($sp)
    lbu     a1, 0x001B($sp)
lbl_800C36AC:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F46($at)         # 80121F46
lbl_800C36BC:
    lui     $at, 0x8010                # $at = 80100000
    sb      a1, 0x2B54($at)            # 80102B54
lbl_800C36C4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C36D4:
# MqDbg: AudioOcarina_UpdateRecordingStaff
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x2B54             # a0 = 80102B54
    lbu     v0, 0x0000(a0)             # 80102B54
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F16             # v1 = 80121F16
    lui     t6, 0x8012                 # t6 = 80120000
    sb      v0, 0x0001(v1)             # 80121F17
    lbu     t6, 0x1F46(t6)             # 80121F46
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     v0, $at, lbl_800C3704
    sb      t6, 0x0002(v1)             # 80121F18
    sb      $zero, 0x0000(a0)          # 80102B54
lbl_800C3704:
    jr      $ra
    nop


func_800C370C:
# MqDbg: AudioOcarina_UpdatePlayingStaff
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2218(t6)             # 80102218
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    andi    t7, t6, 0x003F             # t7 = 00000000
    jal     func_800C2010
    sb      t7, 0x1F0E($at)            # 80121F0E
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0E             # v1 = 80121F0E
    lw      $ra, 0x0014($sp)
    sb      v0, 0x0001(v1)             # 80121F0F
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1F46(t8)             # 80121F46
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    sb      t8, 0x0002(v1)             # 80121F10


func_800C3750:
# MqDbg: AudioOcarina_UpdatePlaybackStaff
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x224C(a0)             # 8010224C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    andi    t6, a0, 0x003F             # t6 = 00000000
    slti    $at, t6, 0x0010
    beq     $at, $zero, lbl_800C3784
    nop
    jal     func_800C2054
    nop
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F12             # v1 = 80121F12
    sb      v0, 0x0000(v1)             # 80121F12
lbl_800C3784:
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2234(t7)             # 80102234
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F12             # v1 = 80121F12
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t7, 0x0001(v1)             # 80121F13
    lw      t8, 0x2B3C(t8)             # 80102B3C
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x2B80             # t9 = 80102B80
    beq     t8, t9, lbl_800C37C0
    lui     v0, 0x8010                 # v0 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    lhu     t0, 0x2244(t0)             # 80102244
    b       lbl_800C37F0
    sb      t0, 0x0002(v1)             # 80121F14
lbl_800C37C0:
    lhu     v0, 0x2244(v0)             # 80102244
    bne     v0, $zero, lbl_800C37D4
    addiu   t1, v0, 0xFFFF             # t1 = 800FFFFF
    b       lbl_800C37F0
    sb      $zero, 0x0002(v1)          # 80121F14
lbl_800C37D4:
    bgez    t1, lbl_800C37E8
    andi    t2, t1, 0x0007             # t2 = 00000007
    beq     t2, $zero, lbl_800C37E8
    nop
    addiu   t2, t2, 0xFFF8             # t2 = FFFFFFFF
lbl_800C37E8:
    addiu   t3, t2, 0x0001             # t3 = 00000000
    sb      t3, 0x0002(v1)             # 80121F14
lbl_800C37F0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3800:
# MqDbg: AudioOcarina_GetRecordingStaff
# V0 = 80121F16
    lui     v0, 0x8012                 # v0 = 80120000
    jr      $ra
    addiu   v0, v0, 0x1F16             # v0 = 80121F16


func_800C380C:
# MqDbg: AudioOcarina_GetPlayingStaff
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0E             # v1 = 80121F0E
    lbu     t6, 0x0001(v1)             # 80121F0F
    slti    $at, t6, 0x00FE
    beq     $at, $zero, lbl_800C3828
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C3828:
    jr      $ra
    or      v0, v1, $zero              # v0 = 80121F0E


func_800C3830:
# MqDbg: AudioOcarina_GetPlaybackStaff
# V0 = 80121F12
    lui     v0, 0x8012                 # v0 = 80120000
    jr      $ra
    addiu   v0, v0, 0x1F12             # v0 = 80121F12


func_800C383C:
# MqDbg: AudioOcarina_RecordSong
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x2B54(a0)             # 80102B54
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     a0, $zero, lbl_800C39A4
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    lw      t7, 0x2B5C(t7)             # 80102B5C
    lw      t6, 0x1F1C(t6)             # 80121F1C
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    subu    t8, t6, t7
    sltiu   $at, t8, 0x0003
    bnel    $at, $zero, lbl_800C39A8
    lw      $ra, 0x0014($sp)
    lbu     v1, 0x2210(v1)             # 80102210
    lbu     t9, 0x2B60(t9)             # 80102B60
    or      v0, $zero, $zero           # v0 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    beq     v1, t9, lbl_800C3930
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     v1, $at, lbl_800C38C4
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t0, 0x8010                 # t0 = 80100000
    lbu     t0, 0x2218(t0)             # 80102218
    lui     $at, 0x8012                # $at = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    andi    t1, t0, 0x003F             # t1 = 00000000
    sb      t1, 0x1F16($at)            # 80121F16
    lbu     t2, 0x0000(v0)             # 80121F46
    addiu   t3, t2, 0x0001             # t3 = 00000001
    b       lbl_800C38F4
    sb      t3, 0x0000(v0)             # 80121F46
lbl_800C38C4:
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     a0, $at, lbl_800C38F4
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t4, 0x0000(v0)             # 80121F46
    addiu   $at, $zero, 0x0008         # $at = 00000008
    bne     t4, $at, lbl_800C38F4
    nop
    jal     func_800C31A0
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    b       lbl_800C39A8
    lw      $ra, 0x0014($sp)
lbl_800C38F4:
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t5, 0x0000(v0)             # 80121F46
    slti    $at, t5, 0x0009
    bne     $at, $zero, lbl_800C3928
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     a0, $at, lbl_800C3924
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    jal     func_800C31A0
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    b       lbl_800C39A8
    lw      $ra, 0x0014($sp)
lbl_800C3924:
    sb      t6, 0x0000(v0)             # 00000000
lbl_800C3928:
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3930:
    lb      t7, 0x222C(t7)             # 0000222C
    lbu     t8, 0x2B64(t8)             # 00002B64
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    beq     t7, t8, lbl_800C3950
    nop
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3950:
    lb      t9, 0x2230(t9)             # 80102230
    lbu     t0, 0x2B68(t0)             # 80102B68
    lui     t1, 0x8010                 # t1 = 80100000
    lui     t2, 0x8010                 # t2 = 80100000
    beq     t9, t0, lbl_800C3970
    nop
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3970:
    lb      t1, 0x2228(t1)             # 80102228
    lb      t2, 0x2B6C(t2)             # 80102B6C
    beq     t1, t2, lbl_800C3984
    nop
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3984:
    beql    v0, $zero, lbl_800C39A8
    lw      $ra, 0x0014($sp)
    jal     func_800C31A0
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t3, 0x8012                 # t3 = 80120000
    lw      t3, 0x1F1C(t3)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    sw      t3, 0x2B5C($at)            # 80102B5C
lbl_800C39A4:
    lw      $ra, 0x0014($sp)
lbl_800C39A8:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C39B4:
# MqDbg: AudioOcarina_MemoryGameInit
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    slti    $at, a0, 0x0003
    sw      $ra, 0x001C($sp)
    bne     $at, $zero, lbl_800C39D4
    sw      s0, 0x0018($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
lbl_800C39D4:
    lui     t6, 0x8010                 # t6 = 80100000
    addu    t6, t6, a0
    lbu     t6, 0x2278(t6)             # 80102278
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2270($at)         # 80102270
    lui     $at, 0x8010                # $at = 80100000
    or      s0, $zero, $zero           # s0 = 00000000
    sb      t6, 0x2274($at)            # 80102274
lbl_800C39F4:
    jal     func_800C3A24
    nop
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0003
    bne     $at, $zero, lbl_800C39F4
    nop
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C3A24:
# MqDbg: AudioOcarina_MemoryGameNextNote
# Song playback related.
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x2270             # a2 = 80102270
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2274(t6)             # 80102274
    lbu     t7, 0x0000(a2)             # 80102270
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    bne     t6, t7, lbl_800C3A50
    nop
    b       lbl_800C3B1C
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3A50:
    jal     func_800BBD80
    nop
    addiu   t0, $zero, 0x0005          # t0 = 00000005
    divu    $zero, v0, t0
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x2270             # a2 = 80102270
    lbu     v1, 0x0000(a2)             # 80102270
    lui     a0, 0x8010                 # a0 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x227C             # a3 = 8010227C
    addiu   a0, a0, 0x2268             # a0 = 80102268
    mfhi    t8
    sll     t1, v1,  3
    addu    t9, a0, t8
    addu    t2, a3, t1
    lbu     a1, 0x0000(t9)             # 00000000
    lbu     t3, 0x0818(t2)             # 00000818
    bne     t0, $zero, lbl_800C3AA0
    nop
    break   # 0x01C00
lbl_800C3AA0:
    addiu   t8, $zero, 0x002D          # t8 = 0000002D
    bne     a1, t3, lbl_800C3ACC
    sll     t7, v1,  3
    addiu   t4, v0, 0x0001             # t4 = 00000001
    divu    $zero, t4, t0
    mfhi    t5
    addu    t6, a0, t5
    lbu     a1, 0x0000(t6)             # 00000000
    bne     t0, $zero, lbl_800C3ACC
    nop
    break   # 0x01C00
lbl_800C3ACC:
    addu    v0, a3, t7
    addiu   t1, v1, 0x0001             # t1 = 00000001
    addiu   t9, $zero, 0x0050          # t9 = 00000050
    andi    v1, t1, 0x00FF             # v1 = 00000001
    sb      a1, 0x0820(v0)             # 00000820
    sh      t8, 0x0822(v0)             # 00000822
    sb      t9, 0x0824(v0)             # 00000824
    sb      $zero, 0x0825(v0)          # 00000825
    sb      $zero, 0x0826(v0)          # 00000826
    sll     t2, v1,  3
    addu    v0, a3, t2
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    sb      t0, 0x0820(v0)             # 00000820
    sh      $zero, 0x0822(v0)          # 00000822
    sll     t3, v1,  3
    addu    a0, a3, t3
    sb      t1, 0x0000(a2)             # 80102270
    sb      t0, 0x0828(a0)             # 80102A90
    sh      $zero, 0x082A(a0)          # 80102A92
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C3B1C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3B2C:
# MqDbg: AudioOcarina_Update
    lui     t7, 0x8010                 # t7 = 80100000
    lb      t7, 0x220C(t7)             # 8010220C
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7ECC(t6)             # 80127ECC
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     $at, 0x8012                # $at = 80120000
    sw      $ra, 0x0014($sp)
    beq     t7, $zero, lbl_800C3C34
    sw      t6, 0x1F1C($at)            # 80121F1C
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t8, 0x2208(t8)             # 80102208
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t8, $at, lbl_800C3B6C
    nop
    jal     func_800C1F20
    nop
lbl_800C3B6C:
    lui     t9, 0x8010                 # t9 = 80100000
    lbu     t9, 0x2234(t9)             # 80102234
    lui     t0, 0x8010                 # t0 = 80100000
    bne     t9, $zero, lbl_800C3B98
    nop
    lbu     t0, 0x2208(t0)             # 80102208
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t0, $at, lbl_800C3B98
    nop
    jal     func_800C296C
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800C3B98:
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x2238(v0)             # 80102238
    beq     v0, $zero, lbl_800C3BC8
    andi    t1, v0, 0x4000             # t1 = 00000000
    beq     t1, $zero, lbl_800C3BC0
    nop
    jal     func_800C2720
    nop
    b       lbl_800C3BC8
    nop
lbl_800C3BC0:
    jal     func_800C2318
    nop
lbl_800C3BC8:
    jal     func_800C2E74
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lbu     t3, 0x2234(t3)             # 80102234
    lui     t2, 0x8012                 # t2 = 80120000
    lw      t2, 0x1F1C(t2)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    bne     t3, $zero, lbl_800C3BF4
    sw      t2, 0x2264($at)            # 80102264
    jal     func_800C383C
    nop
lbl_800C3BF4:
    lui     t4, 0x8010                 # t4 = 80100000
    lw      t4, 0x2238(t4)             # 80102238
    lui     t5, 0x8010                 # t5 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    beq     t4, $zero, lbl_800C3C28
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t5, 0x2210(t5)             # 80102210
    lbu     t6, 0x2214(t6)             # 80102214
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    beq     t5, t6, lbl_800C3C28
    nop
    sb      t7, 0x2B7C($at)            # 80102B7C
lbl_800C3C28:
    lbu     t8, 0x2210(t8)             # 80102210
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x2214($at)            # 80102214
lbl_800C3C34:
    jal     func_800C370C
    nop
    jal     func_800C3750
    nop
    jal     func_800C36D4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3C5C:
# MqDbg: AudioOcarina_PlayLongScarecrowSong
    lui     a1, 0x8010                 # a1 = 80100000
    lbu     a1, 0x2F7C(a1)             # 80102F7C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     a1, $zero, lbl_800C3C90
    or      v0, a1, $zero              # v0 = 80100000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800C3CF0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C3D3C
    nop
    b       lbl_800C3D5C
    lw      $ra, 0x0014($sp)
lbl_800C3C90:
    lui     v1, 0x8010                 # v1 = 80100000
    lhu     v1, 0x2F84(v1)             # 80102F84
    lui     $at, 0x8010                # $at = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    sltiu   v0, v1, 0x0001
    addiu   v1, v1, 0xFFFF             # v1 = 800FFFFF
    beq     v0, $zero, lbl_800C3D58
    sh      v1, 0x2F84($at)            # 80102F84
    lbu     t6, 0x2F80(t6)             # 80102F80
    addiu   a1, a1, 0x0001             # a1 = 80100001
    or      a0, $zero, $zero           # a0 = 00000000
    slti    $at, t6, 0x0007
    beq     $at, $zero, lbl_800C3CD0
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3CE0
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3CD0:
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    lui     $at, 0x8010                # $at = 80100000
    jal     func_800C2C90
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3CE0:
    addiu   v1, $zero, 0x04B0          # v1 = 000004B0
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3D58
    sh      v1, 0x2F84($at)            # 80102F84
lbl_800C3CF0:
    jal     func_800C7F40
    or      a0, $zero, $zero           # a0 = 00000000
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C2C90
    lbu     a0, 0x2F80(a0)             # 80102F80
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
    jal     func_800C2D74
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2F80(t7)             # 80102F80
    lui     a1, 0x8010                 # a1 = 80100000
    lbu     a1, 0x2F7C(a1)             # 80102F7C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t8, t7, 0x0001             # t8 = 80100001
    sb      t8, 0x2F80($at)            # 80102F80
    lui     $at, 0x8010                # $at = 80100000
    addiu   a1, a1, 0x0001             # a1 = 80100001
    b       lbl_800C3D58
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3D3C:
    jal     func_800C3830
    nop
    lbu     t9, 0x0001(v0)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    bnel    t9, $zero, lbl_800C3D5C
    lw      $ra, 0x0014($sp)
    sb      $zero, 0x2F7C($at)         # 80102F7C
lbl_800C3D58:
    lw      $ra, 0x0014($sp)
lbl_800C3D5C:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3D68:
# MqDbg: AudioOcarina_ResetStaffs
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    lui     v0, 0x8012                 # v0 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x1F16             # a1 = 80121F16
    addiu   a0, a0, 0x1F12             # a0 = 80121F12
    addiu   v0, v0, 0x1F0E             # v0 = 80121F0E
    sb      v1, 0x0000(v0)             # 80121F0E
    sb      v1, 0x0001(v0)             # 80121F0F
    sb      $zero, 0x0002(v0)          # 80121F10
    sb      v1, 0x0000(a0)             # 80121F12
    sb      $zero, 0x0001(a0)          # 80121F13
    sb      $zero, 0x0002(a0)          # 80121F14
    sb      v1, 0x0000(a1)             # 80121F16
    sb      v1, 0x0001(a1)             # 80121F17
    sb      $zero, 0x0002(a1)          # 80121F18
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x2B7C($at)         # 80102B7C


func_800C3DB4:
# MqDbg: 
    jr      $ra
    sw      a0, 0x0000($sp)


func_800C3DBC:
# MqDbg: 
    sw      a0, 0x0000($sp)
    jr      $ra
    sw      a1, 0x0004($sp)


func_800C3DC8:
# MqDbg: func_800F3054
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CB798
    nop
    bnel    v0, $zero, lbl_800C3E60
    lw      $ra, 0x0014($sp)
    jal     func_800C3B2C
    nop
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800C54C4
    addiu   a0, a0, 0x1DD0             # a0 = 80121DD0
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800C54C4
    addiu   a0, a0, 0x1DE0             # a0 = 80121DE0
    jal     func_800C57B0
    nop
    jal     func_800C63FC
    nop
    jal     func_800C6A34
    nop
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x43C0(t6)             # 801043C0
    addiu   $at, $zero, 0x0007         # $at = 00000007
    bne     t6, $at, lbl_800C3E34
    nop
    jal     func_800C5E0C
    nop
lbl_800C3E34:
    jal     func_800C99BC
    nop
    jal     func_800CAA98
    nop
    jal     func_800C9B08
    nop
    jal     func_800CAE40
    nop
    jal     func_800BB140
    nop
    lw      $ra, 0x0014($sp)
lbl_800C3E60:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3E6C:
# MqDbg: func_800F3138
    jr      $ra
    sw      a0, 0x0000($sp)


func_800C3E74:
# MqDbg: func_800F3140
    sw      a0, 0x0000($sp)
    jr      $ra
    sw      a1, 0x0004($sp)


func_800C3E80:
# MqDbg: func_800F314C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    or      a2, a0, $zero              # a2 = 00000000
    or      a0, a2, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      $ra, 0x0014($sp)
    sll     a0, a0,  8
    lui     $at, 0x8200                # $at = 82000000
    or      a0, a0, $at                # a0 = 82000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3EBC:
# MqDbg: Audio_ComputeSfxVolume
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    addu    v0, t7, t8
    lhu     v1, 0x0026(v0)             # 00000026
    lui     $at, 0x8011                # $at = 80110000
    andi    t9, v1, 0x2000             # t9 = 00000000
    beq     t9, $zero, lbl_800C3F10
    nop
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    jr      $ra
    nop
lbl_800C3F10:
    lwc1    $f16, -0x5FC0($at)         # 3F7FA040
    lwc1    $f2, 0x001C(v0)            # 0000001C
    andi    v0, v1, 0x0003             # v0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    c.lt.s  $f16, $f2
    nop
    bc1f    lbl_800C3F3C
    nop
    mtc1    $zero, $f12                # $f12 = 0.00
    b       lbl_800C401C
    mov.s   $f0, $f12
lbl_800C3F3C:
    beq     v0, $at, lbl_800C3F60
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C3F6C
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800C3F78
    lui     $at, 0x43FA                # $at = 43FA0000
    mtc1    $at, $f0                   # $f0 = 500.00
    b       lbl_800C3F84
    lui     $at, 0x40A0                # $at = 40A00000
lbl_800C3F60:
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C3F80
    lwc1    $f0, -0x5FBC($at)          # 8010A044
lbl_800C3F6C:
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C3F80
    lwc1    $f0, -0x5FB8($at)          # 8010A048
lbl_800C3F78:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5FB4($at)          # 8010A04C
lbl_800C3F80:
    lui     $at, 0x40A0                # $at = 40A00000
lbl_800C3F84:
    mtc1    $at, $f4                   # $f4 = 5.00
    lui     $at, 0x3F80                # $at = 3F800000
    div.s   $f14, $f0, $f4
    c.lt.s  $f2, $f14
    nop
    bc1fl   lbl_800C3FB0
    c.lt.s  $f2, $f0
    mtc1    $at, $f12                  # $f12 = 1.00
    b       lbl_800C4010
    nop
    c.lt.s  $f2, $f0
lbl_800C3FB0:
    nop
    bc1fl   lbl_800C3FEC
    sub.s   $f8, $f2, $f0
    sub.s   $f16, $f0, $f14
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5FB0($at)         # 8010A050
    sub.s   $f6, $f2, $f14
    lui     $at, 0x8011                # $at = 80110000
    sub.s   $f8, $f16, $f6
    lwc1    $f6, -0x5FAC($at)          # 8010A054
    div.s   $f10, $f8, $f16
    mul.s   $f4, $f10, $f18
    b       lbl_800C4010
    add.s   $f12, $f4, $f6
    sub.s   $f8, $f2, $f0
lbl_800C3FEC:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    sub.s   $f10, $f16, $f0
    lui     $at, 0x8011                # $at = 80110000
    div.s   $f18, $f8, $f10
    lwc1    $f8, -0x5FA8($at)          # 8010A058
    sub.s   $f6, $f4, $f18
    mul.s   $f12, $f6, $f8
    nop
lbl_800C4010:
    mul.s   $f12, $f12, $f12
    nop
    mov.s   $f0, $f12
lbl_800C401C:
    jr      $ra
    nop


func_800C4024:
# MqDbg: Audio_ComputeSfxReverb
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    sw      a2, 0x0008($sp)
    addu    a3, t7, t8
    lhu     t9, 0x0026(a3)             # 00000026
    andi    a2, a2, 0x00FF             # a2 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    andi    t0, t9, 0x1000             # t0 = 00000000
    bne     t0, $zero, lbl_800C4104
    or      v1, $zero, $zero           # v1 = 00000000
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f2, -0x5FA4($at)          # 8010A05C
    lwc1    $f0, 0x001C(a3)            # 0000001C
    addiu   v0, $zero, 0x0046          # v0 = 00000046
    c.lt.s  $f0, $f2
    nop
    bc1f    lbl_800C4104
    nop
    lw      t1, 0x0008(a3)             # 00000008
    mtc1    $zero, $f4                 # $f4 = 0.00
    lwc1    $f6, 0x0000(t1)            # 00000000
    c.lt.s  $f4, $f6
    nop
    bc1fl   lbl_800C40DC
    div.s   $f4, $f0, $f2
    div.s   $f8, $f0, $f2
    lui     $at, 0x428C                # $at = 428C0000
    mtc1    $at, $f10                  # $f10 = 70.00
    nop
    mul.s   $f16, $f8, $f10
    trunc.w.s $f18, $f16
    mfc1    v0, $f18
    nop
    sll     v0, v0, 24
    b       lbl_800C4104
    sra     v0, v0, 24
    div.s   $f4, $f0, $f2
lbl_800C40DC:
    lui     $at, 0x42B6                # $at = 42B60000
    mtc1    $at, $f6                   # $f6 = 91.00
    nop
    mul.s   $f8, $f4, $f6
    trunc.w.s $f10, $f8
    mfc1    v0, $f10
    nop
    sll     v0, v0, 24
    b       lbl_800C4104
    sra     v0, v0, 24
lbl_800C4104:
    sll     t4, a2,  2
    lui     a1, 0x8013                 # a1 = 80130000
    addu    a1, a1, t4
    lw      a1, -0x71A8(a1)            # 80128E58
    lui     t5, 0x8013                 # t5 = 80130000
    addiu   t5, t5, 0xB0E0             # t5 = 8012B0E0
    beq     t5, a1, lbl_800C4134
    lui     t1, 0x8010                 # t1 = 80100000
    lb      v1, 0x00C5(a1)             # 801300C5
    bgezl   v1, lbl_800C4138
    lw      t6, 0x0018(a3)             # 00000018
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C4134:
    lw      t6, 0x0018(a3)             # 00000018
lbl_800C4138:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    lui     t3, 0x8010                 # t3 = 80100000
    lb      t7, 0x0000(t6)             # 00000000
    lui     t5, 0x8010                 # t5 = 80100000
    addu    t8, t7, v0
    bne     a0, $at, lbl_800C4168
    addu    a1, t8, v1
    lhu     t9, 0x0028(a3)             # 00000028
    andi    t0, t9, 0x01FF             # t0 = 00000000
    slti    $at, t0, 0x0002
    bnel    $at, $zero, lbl_800C4184
    slti    $at, a1, 0x0080
lbl_800C4168:
    lb      t1, 0x1924(t1)             # 80101924
    lb      t3, 0x1928(t3)             # 80101928
    lb      t5, 0x1920(t5)             # 80101920
    addu    t2, a1, t1
    addu    t4, t2, t3
    addu    a1, t4, t5
    slti    $at, a1, 0x0080
lbl_800C4184:
    bnel    $at, $zero, lbl_800C4194
    sll     v0, a1, 24
    addiu   a1, $zero, 0x007F          # a1 = 0000007F
    sll     v0, a1, 24
lbl_800C4194:
    jr      $ra
    sra     v0, v0, 24


func_800C419C:
# MqDbg: Audio_ComputeSfxPanSigned
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   $sp, $sp, 0xFFF0           # $sp -= 0x10
    sdc1    $f20, 0x0008($sp)
    c.lt.s  $f12, $f0
    mtc1    $zero, $f16                # $f16 = 0.00
    mov.s   $f20, $f12
    sw      a2, 0x0018($sp)
    bc1f    lbl_800C41C8
    lui     $at, 0x45FA                # $at = 45FA0000
    b       lbl_800C41CC
    neg.s   $f12, $f12
lbl_800C41C8:
    mov.s   $f12, $f20
lbl_800C41CC:
    c.lt.s  $f14, $f0
    mtc1    $at, $f0                   # $f0 = 8000.00
    bc1fl   lbl_800C41E8
    mov.s   $f2, $f14
    b       lbl_800C41E8
    neg.s   $f2, $f14
    mov.s   $f2, $f14
lbl_800C41E8:
    c.lt.s  $f0, $f12
    nop
    bc1fl   lbl_800C4200
    c.lt.s  $f0, $f2
    mov.s   $f12, $f0
    c.lt.s  $f0, $f2
lbl_800C4200:
    nop
    bc1fl   lbl_800C4214
    c.eq.s  $f20, $f16
    mov.s   $f2, $f0
    c.eq.s  $f20, $f16
lbl_800C4214:
    nop
    bc1fl   lbl_800C4240
    c.le.s  $f2, $f12
    c.eq.s  $f14, $f16
    lui     $at, 0x3F00                # $at = 3F000000
    bc1fl   lbl_800C4240
    c.le.s  $f2, $f12
    mtc1    $at, $f14                  # $f14 = 0.50
    b       lbl_800C42B0
    mov.s   $f0, $f14
    c.le.s  $f2, $f12
lbl_800C4240:
    lui     $at, 0x3F00                # $at = 3F000000
    bc1fl   lbl_800C429C
    mtc1    $at, $f14                  # $f14 = 0.50
    lui     $at, 0x467A                # $at = 467A0000
    mtc1    $at, $f18                  # $f18 = 16000.00
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5FA0($at)          # 8010A060
    sub.s   $f6, $f18, $f2
    lui     $at, 0x3F80                # $at = 3F800000
    sub.s   $f10, $f18, $f12
    mul.s   $f8, $f4, $f6
    c.le.s  $f16, $f20
    div.s   $f14, $f10, $f8
    bc1f    lbl_800C4288
    mov.s   $f0, $f14
    mtc1    $at, $f4                   # $f4 = 1.00
    nop
    sub.s   $f0, $f4, $f14
lbl_800C4288:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f14                  # $f14 = 0.50
    b       lbl_800C42B4
    lui     $at, 0x4248                # $at = 42480000
    mtc1    $at, $f14                  # $f14 = 50.00
lbl_800C429C:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F9C($at)          # 8010A064
    mul.s   $f10, $f6, $f2
    div.s   $f8, $f20, $f10
    add.s   $f0, $f8, $f14
lbl_800C42B0:
    lui     $at, 0x4248                # $at = 42480000
lbl_800C42B4:
    mtc1    $at, $f16                  # $f16 = 50.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    c.lt.s  $f2, $f16
    nop
    bc1f    lbl_800C42F8
    nop
    c.lt.s  $f12, $f16
    nop
    bc1f    lbl_800C42F8
    nop
    div.s   $f2, $f12, $f16
    sub.s   $f4, $f0, $f14
    mul.s   $f6, $f2, $f2
    nop
    mul.s   $f10, $f4, $f6
    add.s   $f0, $f10, $f14
lbl_800C42F8:
    mul.s   $f4, $f0, $f8
    ldc1    $f20, 0x0008($sp)
    addiu   $sp, $sp, 0x0010           # $sp += 0x10
    add.s   $f6, $f4, $f14
    trunc.w.s $f10, $f6
    mfc1    v0, $f10
    nop
    sll     v0, v0, 24
    jr      $ra
    sra     v0, v0, 24


func_800C4320:
# MqDbg: Audio_ComputeSfxFreqScale
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    addu    v1, t7, t8
    lhu     a2, 0x0026(v1)             # 00000026
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    andi    t9, a2, 0x4000             # t9 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    beq     t9, $zero, lbl_800C43A8
    mov.s   $f2, $f0
    lui     t0, 0x8012                 # t0 = 80120000
    lw      t0, 0x7FAC(t0)             # 80127FAC
    lui     $at, 0x4F80                # $at = 4F800000
    andi    t1, t0, 0x000F             # t1 = 00000000
    mtc1    t1, $f4                    # $f4 = 0.00
    bgez    t1, lbl_800C4394
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C4394:
    lui     $at, 0x4340                # $at = 43400000
    mtc1    $at, $f10                  # $f10 = 192.00
    nop
    div.s   $f16, $f6, $f10
    sub.s   $f2, $f0, $f16
lbl_800C43A8:
    sltiu   $at, a0, 0x0007
    beq     $at, $zero, lbl_800C43F4
    sll     t2, a0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t2
    lw      t2, -0x5F98($at)           # 8010A068
    jr      t2
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lbu     t3, 0x1954(t3)             # 80101954
    beql    t3, $zero, lbl_800C43F8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    b       lbl_800C43F4
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    lui     t4, 0x8010                 # t4 = 80100000
    lbu     t4, 0x1958(t4)             # 80101958
    beql    t4, $zero, lbl_800C43F8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C43F4:
    addiu   $at, $zero, 0x0001         # $at = 00000001
lbl_800C43F8:
    bne     v0, $at, lbl_800C4458
    andi    t8, a2, 0x2000             # t8 = 00000000
    andi    t5, a2, 0x0800             # t5 = 00000000
    bne     t5, $zero, lbl_800C4458
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7FAC(t6)             # 80127FAC
    lui     $at, 0x4F80                # $at = 4F800000
    andi    t7, t6, 0x000F             # t7 = 00000000
    mtc1    t7, $f18                   # $f18 = 0.00
    bgez    t7, lbl_800C4430
    cvt.s.w $f4, $f18
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f4, $f4, $f8
lbl_800C4430:
    lui     $at, 0x4310                # $at = 43100000
    mtc1    $at, $f6                   # $f6 = 144.00
    lui     $at, 0x8011                # $at = 80110000
    ldc1    $f18, -0x5F78($at)         # 8010A088
    div.s   $f10, $f4, $f6
    cvt.d.s $f4, $f2
    cvt.d.s $f16, $f10
    sub.d   $f8, $f18, $f16
    mul.d   $f6, $f4, $f8
    cvt.s.d $f2, $f6
lbl_800C4458:
    bne     t8, $zero, lbl_800C44A4
    lwc1    $f0, 0x001C(v1)            # 0000001C
    andi    t9, a2, 0x8000             # t9 = 00000000
    bne     t9, $zero, lbl_800C44A4
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f12, -0x5F70($at)         # 8010A090
    lui     $at, 0x8011                # $at = 80110000
    c.le.s  $f12, $f0
    nop
    bc1fl   lbl_800C4494
    div.s   $f16, $f0, $f12
    lwc1    $f10, -0x5F6C($at)         # 8010A094
    b       lbl_800C44A4
    add.s   $f2, $f2, $f10
    div.s   $f16, $f0, $f12
lbl_800C4494:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F68($at)         # 8010A098
    mul.s   $f4, $f18, $f16
    add.s   $f2, $f2, $f4
lbl_800C44A4:
    andi    t0, a2, 0x00C0             # t0 = 00000000
    beq     t0, $zero, lbl_800C44E4
    nop
    lbu     t1, 0x002F(v1)             # 0000002F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t1, $f8                    # $f8 = 0.00
    bgez    t1, lbl_800C44D0
    cvt.s.w $f6, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_800C44D0:
    lui     $at, 0x4340                # $at = 43400000
    mtc1    $at, $f18                  # $f18 = 192.00
    nop
    div.s   $f16, $f6, $f18
    add.s   $f2, $f2, $f16
lbl_800C44E4:
    jr      $ra
    mov.s   $f0, $f2


func_800C44EC:
# MqDbg: func_800F37B8
    sw      a2, 0x0008($sp)
    lw      t6, 0x0008(a1)             # 00000008
    sll     a2, a2, 24
    sra     a2, a2, 24
    lwc1    $f4, 0x0000(t6)            # 00000000
    slti    $at, a2, 0x0041
    or      v1, $zero, $zero           # v1 = 00000000
    c.lt.s  $f4, $f12
    nop
    bc1f    lbl_800C4588
    nop
    beq     $at, $zero, lbl_800C452C
    addiu   t7, $zero, 0x007F          # t7 = 0000007F
    sll     v0, a2, 24
    b       lbl_800C4538
    sra     v0, v0, 24
lbl_800C452C:
    subu    v0, t7, a2
    sll     v0, v0, 24
    sra     v0, v0, 24
lbl_800C4538:
    slti    $at, v0, 0x001E
    beql    $at, $zero, lbl_800C4550
    andi    $at, v0, 0xFFFF            # $at = 00000000
    b       lbl_800C4588
    or      v1, $zero, $zero           # v1 = 00000000
    andi    $at, v0, 0xFFFF            # $at = 00000000
lbl_800C4550:
    sll     a0, $at,  2
    addu    a0, a0, $at
    sll     a0, a0,  1
    addiu   a0, a0, 0xFED4             # a0 = FFFFFED4
    addiu   $at, $zero, 0x0022         # $at = 00000022
    div     $zero, a0, $at
    mflo    a0
    andi    a2, a0, 0x00FF             # a2 = 000000D4
    beq     a2, $zero, lbl_800C4588
    andi    v1, a0, 0x00FF             # v1 = 000000D4
    addiu   t8, $zero, 0x0010          # t8 = 00000010
    subu    v1, t8, a2
    b       lbl_800C4588
    andi    v1, v1, 0x00FF             # v1 = 000000D4
lbl_800C4588:
    bne     v1, $zero, lbl_800C45A4
    or      a0, v1, $zero              # a0 = 000000D4
    lhu     t9, 0x0026(a1)             # 00000026
    andi    t0, t9, 0x0200             # t0 = 00000000
    beql    t0, $zero, lbl_800C45A8
    lhu     v0, 0x0026(a1)             # 00000026
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
lbl_800C45A4:
    lhu     v0, 0x0026(a1)             # 00000026
lbl_800C45A8:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    v0, v0, 0x0003             # v0 = 00000000
    beq     v0, $at, lbl_800C45D4
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C45E4
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800C45F4
    lui     $at, 0x4170                # $at = 41700000
    mtc1    $at, $f0                   # $f0 = 15.00
    b       lbl_800C4600
    nop
lbl_800C45D4:
    lui     $at, 0x4140                # $at = 41400000
    mtc1    $at, $f0                   # $f0 = 12.00
    b       lbl_800C4600
    nop
lbl_800C45E4:
    lui     $at, 0x4110                # $at = 41100000
    mtc1    $at, $f0                   # $f0 = 9.00
    b       lbl_800C4600
    nop
lbl_800C45F4:
    lui     $at, 0x40C0                # $at = 40C00000
    mtc1    $at, $f0                   # $f0 = 6.00
    nop
lbl_800C4600:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f14, -0x5F64($at)         # 8010A09C
    lwc1    $f2, 0x001C(a1)            # 0000001C
    lui     $at, 0x4F00                # $at = 4F000000
    c.lt.s  $f14, $f2
    nop
    bc1fl   lbl_800C462C
    mov.s   $f12, $f2
    b       lbl_800C462C
    mov.s   $f12, $f14
    mov.s   $f12, $f2
lbl_800C462C:
    mul.s   $f6, $f0, $f12
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sll     t1, a0,  4
    div.s   $f8, $f6, $f14
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beql    t3, $zero, lbl_800C46A8
    mfc1    t3, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_800C469C
    nop
    mfc1    t3, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C46B4
    or      t3, t3, $at                # t3 = 80000000
lbl_800C469C:
    b       lbl_800C46B4
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
    mfc1    t3, $f10
lbl_800C46A8:
    nop
    bltz    t3, lbl_800C469C
    nop
lbl_800C46B4:
    ctc1    t2, $f31
    addu    v0, t1, t3
    jr      $ra
    andi    v0, v0, 0x00FF             # v0 = 00000000


func_800C46C4:
# MqDbg: func_800F3990
    mtc1    $zero, $f4                 # $f4 = 0.00
    sw      a1, 0x0004($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    c.le.s  $f4, $f12
    lui     $at, 0x8011                # $at = 80110000
    bc1fl   lbl_800C4730
    ori     v0, v1, 0x0001             # v0 = 00000001
    lwc1    $f0, -0x5F60($at)          # 8010A0A0
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    ori     v0, v1, 0x0001             # v0 = 0000007F
    c.lt.s  $f0, $f12
    sll     v0, v0, 24
    bc1fl   lbl_800C4708
    div.s   $f6, $f12, $f0
    jr      $ra
    sra     v0, v0, 24
lbl_800C4704:
    div.s   $f6, $f12, $f0
lbl_800C4708:
    lui     $at, 0x42FC                # $at = 42FC0000
    mtc1    $at, $f8                   # $f8 = 126.00
    nop
    mul.s   $f10, $f6, $f8
    trunc.w.s $f16, $f10
    mfc1    v1, $f16
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
    ori     v0, v1, 0x0001             # v0 = 0000007F
lbl_800C4730:
    sll     v0, v0, 24
    jr      $ra
    sra     v0, v0, 24


func_800C473C:
# MqDbg: Audio_SetSfxProperties
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      a0, 0x0048($sp)
    lbu     t7, 0x004B($sp)
    sw      a1, 0x004C($sp)
    lbu     t0, 0x004F($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    lui     t9, 0x8010                 # t9 = 80100000
    sll     t8, t7,  2
    addu    t9, t9, t8
    sll     t1, t0,  2
    lw      t9, 0x4368(t9)             # 80104368
    subu    t1, t1, t0
    addiu   t6, $zero, 0x0040          # t6 = 00000040
    sll     t1, t1,  4
    sltiu   $at, t7, 0x0007
    sw      $ra, 0x0014($sp)
    sw      a2, 0x0050($sp)
    sb      $zero, 0x0042($sp)
    sb      t6, 0x003B($sp)
    sb      $zero, 0x003A($sp)
    sb      $zero, 0x0039($sp)
    sb      $zero, 0x0038($sp)
    sb      $zero, 0x0033($sp)
    sw      t7, 0x0024($sp)
    swc1    $f2, 0x003C($sp)
    swc1    $f2, 0x0044($sp)
    beq     $at, $zero, lbl_800C49BC
    addu    a3, t9, t1
    sll     t2, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t2
    lw      t2, -0x5F5C($at)           # 8010A0A4
    jr      t2
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lb      t3, 0x1914(t3)             # 80101914
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    t3, $at, lbl_800C47FC
    lui     $at, 0x4120                # $at = 41200000
    lw      t4, 0x0004(a3)             # 00000004
    lhu     a1, 0x0026(a3)             # 00000026
    lwc1    $f12, 0x0000(t4)           # 00000000
    jal     func_800C46C4
    sw      a3, 0x002C($sp)
    lw      a3, 0x002C($sp)
    sb      v0, 0x0038($sp)
    lui     $at, 0x4120                # $at = 41200000
lbl_800C47FC:
    mtc1    $at, $f6                   # $f6 = 10.00
    lwc1    $f4, 0x001C(a3)            # 0000001C
    sw      a3, 0x002C($sp)
    mul.s   $f12, $f4, $f6
    jal     func_800D0DC0
    nop
    lw      a3, 0x002C($sp)
    swc1    $f0, 0x001C(a3)            # 0000001C
    lbu     a1, 0x004F($sp)
    jal     func_800C3EBC
    lbu     a0, 0x004B($sp)
    lw      a3, 0x002C($sp)
    lbu     a0, 0x004B($sp)
    lbu     a1, 0x004F($sp)
    lw      t5, 0x0014(a3)             # 00000014
    lbu     a2, 0x0053($sp)
    lwc1    $f8, 0x0000(t5)            # 00000000
    mul.s   $f10, $f8, $f0
    jal     func_800C4024
    swc1    $f10, 0x0044($sp)
    lw      a3, 0x002C($sp)
    sb      v0, 0x0042($sp)
    lw      t8, 0x0008(a3)             # 00000008
    lw      t6, 0x0000(a3)             # 00000000
    lbu     a2, 0x000C(a3)             # 0000000C
    lwc1    $f14, 0x0000(t8)           # 00000000
    jal     func_800C419C
    lwc1    $f12, 0x0000(t6)           # 00000000
    sb      v0, 0x003B($sp)
    lbu     a0, 0x004B($sp)
    jal     func_800C4320
    lbu     a1, 0x004F($sp)
    lw      a3, 0x002C($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lb      v1, 0x1914(v1)             # 80101914
    lw      t0, 0x0010(a3)             # 00000010
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lwc1    $f16, 0x0000(t0)           # 00000000
    mul.s   $f18, $f16, $f0
    bne     v1, $at, lbl_800C4938
    swc1    $f18, 0x003C($sp)
    lhu     v0, 0x0026(a3)             # 00000026
    lui     $at, 0x8010                # $at = 80100000
    andi    t9, v0, 0x0400             # t9 = 00000000
    sra     t1, t9, 10
    sll     t7, t1,  2
    addu    $at, $at, t7
    lwc1    $f4, 0x18D4($at)           # 801018D4
    andi    t2, v0, 0x0800             # t2 = 00000000
    bne     t2, $zero, lbl_800C4938
    swc1    $f4, 0x0034($sp)
    lw      t3, 0x0008(a3)             # 00000008
    lwc1    $f8, 0x0034($sp)
    addiu   t4, $zero, 0x0010          # t4 = 00000010
    lwc1    $f6, 0x0000(t3)            # 00000000
    c.lt.s  $f6, $f8
    nop
    bc1fl   lbl_800C48F0
    lbu     t5, 0x0053($sp)
    sb      t4, 0x003A($sp)
    lbu     t5, 0x0053($sp)
lbl_800C48F0:
    lui     v0, 0x8012                 # v0 = 80120000
    lbu     t8, 0x003A($sp)
    sll     t6, t5,  4
    addu    v0, v0, t6
    lb      v0, 0x1E12(v0)             # 80121E12
    lb      t1, 0x003B($sp)
    xor     t0, v0, t8
    andi    t9, t0, 0x0010             # t9 = 00000000
    beq     t9, $zero, lbl_800C4934
    slti    $at, t1, 0x0040
    beq     $at, $zero, lbl_800C492C
    xori    t2, v0, 0x0018             # t2 = 80120018
    xori    t7, v0, 0x0014             # t7 = 80120014
    b       lbl_800C4938
    sb      t7, 0x003A($sp)
lbl_800C492C:
    b       lbl_800C4938
    sb      t2, 0x003A($sp)
lbl_800C4934:
    sb      v0, 0x003A($sp)
lbl_800C4938:
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x194C(v0)             # 8010194C
    lw      a0, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $zero, lbl_800C496C
    lui     t4, 0x8010                 # t4 = 80100000
    beql    a0, $at, lbl_800C496C
    sb      v0, 0x0033($sp)
    beq     a0, $zero, lbl_800C4968
    addiu   $at, $zero, 0x0006         # $at = 00000006
    bnel    a0, $at, lbl_800C4970
    lbu     t3, 0x0033($sp)
lbl_800C4968:
    sb      v0, 0x0033($sp)
lbl_800C496C:
    lbu     t3, 0x0033($sp)
lbl_800C4970:
    lbu     t4, 0x1950(t4)             # 80101950
    addiu   $at, $zero, 0x0002         # $at = 00000002
    or      v0, t3, t4                 # v0 = 80100000
    beq     v0, $zero, lbl_800C498C
    nop
    b       lbl_800C49B8
    sb      v0, 0x0039($sp)
lbl_800C498C:
    bnel    v1, $at, lbl_800C49BC
    lwc1    $f2, 0x0044($sp)
    lhu     t5, 0x0026(a3)             # 00000026
    lwc1    $f12, 0x0034($sp)
    or      a1, a3, $zero              # a1 = 00000000
    andi    t6, t5, 0x2000             # t6 = 00000000
    bnel    t6, $zero, lbl_800C49BC
    lwc1    $f2, 0x0044($sp)
    jal     func_800C44EC
    lb      a2, 0x003B($sp)
    sb      v0, 0x0039($sp)
lbl_800C49B8:
    lwc1    $f2, 0x0044($sp)
lbl_800C49BC:
    lbu     t8, 0x0053($sp)
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x1E08             # t9 = 80121E08
    sll     t0, t8,  4
    addu    v0, t0, t9
    lwc1    $f10, 0x0000(v0)           # 00000000
    lui     $at, 0x42FE                # $at = 42FE0000
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    c.eq.s  $f2, $f10
    nop
    bc1t    lbl_800C4A88
    nop
    mtc1    $at, $f16                  # $f16 = 127.00
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f18, $f2, $f16
    cfc1    t1, $f31
    ctc1    a1, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    a1, $f31
    nop
    andi    a1, a1, 0x0078             # a1 = 00000000
    beql    a1, $zero, lbl_800C4A68
    mfc1    a1, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    a1, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    a1, $f31
    nop
    andi    a1, a1, 0x0078             # a1 = 00000000
    bne     a1, $zero, lbl_800C4A5C
    nop
    mfc1    a1, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C4A74
    or      a1, a1, $at                # a1 = 80000000
lbl_800C4A5C:
    b       lbl_800C4A74
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    mfc1    a1, $f4
lbl_800C4A68:
    nop
    bltz    a1, lbl_800C4A5C
    nop
lbl_800C4A74:
    ctc1    t1, $f31
    sll     a1, a1, 24
    sra     a1, a1, 24
    b       lbl_800C4A88
    swc1    $f2, 0x0000(v0)            # 00000000
lbl_800C4A88:
    lbu     v1, 0x0053($sp)
    lui     $at, 0x0602                # $at = 06020000
    sw      v0, 0x0024($sp)
    sll     v1, v1,  8
    or      a2, v1, $at                # a2 = 06020000
    ori     a0, a2, 0x0002             # a0 = 06020002
    sw      a2, 0x0018($sp)
    jal     func_800BB0E0
    sw      v1, 0x001C($sp)
    lw      v0, 0x0024($sp)
    lb      a1, 0x0042($sp)
    lw      a0, 0x001C($sp)
    lb      t7, 0x0008(v0)             # 00000008
    lui     $at, 0x0502                # $at = 05020000
    or      a0, a0, $at                # a0 = 05020000
    beql    a1, t7, lbl_800C4AE4
    lwc1    $f0, 0x003C($sp)
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lb      t2, 0x0042($sp)
    sb      t2, 0x0008(v0)             # 00000008
    lwc1    $f0, 0x003C($sp)
lbl_800C4AE4:
    lwc1    $f6, 0x0004(v0)            # 00000004
    lw      a0, 0x001C($sp)
    lui     $at, 0x0402                # $at = 04020000
    c.eq.s  $f0, $f6
    or      a0, a0, $at                # a0 = 04020000
    bc1tl   lbl_800C4B1C
    lbu     v1, 0x003A($sp)
    mfc1    a1, $f0
    jal     func_800BB098
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lwc1    $f8, 0x003C($sp)
    swc1    $f8, 0x0004(v0)            # 00000004
    lbu     v1, 0x003A($sp)
lbl_800C4B1C:
    lb      t3, 0x000A(v0)             # 0000000A
    lw      a0, 0x001C($sp)
    lui     $at, 0x0E02                # $at = 0E020000
    beq     v1, t3, lbl_800C4B54
    or      a0, a0, $at                # a0 = 0E020000
    ori     a1, v1, 0x0010             # a1 = 00000010
    sll     a1, a1, 24
    sra     a1, a1, 24
    sw      v0, 0x0024($sp)
    jal     func_800BB0E0
    sw      v1, 0x0020($sp)
    lw      v0, 0x0024($sp)
    lw      v1, 0x0020($sp)
    sb      v1, 0x000A(v0)             # 0000000A
lbl_800C4B54:
    lbu     v1, 0x0039($sp)
    lbu     t4, 0x000B(v0)             # 0000000B
    lw      a0, 0x0018($sp)
    sll     a1, v1, 24
    beq     v1, t4, lbl_800C4B84
    ori     a0, a0, 0x0003             # a0 = 00000003
    sra     a1, a1, 24
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lbu     t5, 0x0039($sp)
    sb      t5, 0x000B(v0)             # 0000000B
lbl_800C4B84:
    lb      t6, 0x0038($sp)
    lbu     t8, 0x000C(v0)             # 0000000C
    lw      a0, 0x001C($sp)
    lui     $at, 0x0C02                # $at = 0C020000
    beq     t6, t8, lbl_800C4BDC
    or      a0, a0, $at                # a0 = 0C020000
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lb      v1, 0x0038($sp)
    lw      a0, 0x001C($sp)
    lui     $at, 0x0D02                # $at = 0D020000
    or      a1, v1, $zero              # a1 = 00000000
    sll     a1, a1,  8
    addiu   a1, a1, 0x00FF             # a1 = 000000FF
    andi    a1, a1, 0xFFFF             # a1 = 000000FF
    sw      v1, 0x0020($sp)
    jal     func_800BB110
    or      a0, a0, $at                # a0 = 0D020000
    lw      v0, 0x0024($sp)
    lw      v1, 0x0020($sp)
    sb      v1, 0x000C(v0)             # 0000000C
lbl_800C4BDC:
    lb      t0, 0x003B($sp)
    lb      t9, 0x0009(v0)             # 00000009
    lw      a0, 0x001C($sp)
    lui     $at, 0x0302                # $at = 03020000
    beq     t0, t9, lbl_800C4C0C
    or      a0, a0, $at                # a0 = 03020000
    or      a1, t0, $zero              # a1 = 00000000
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lb      t1, 0x003B($sp)
    sb      t1, 0x0009(v0)             # 00000009
lbl_800C4C0C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800C4C1C:
# MqDbg: Audio_ResetSfxChannelState
    lui     $at, 0x3F80                # $at = 3F800000
    lui     a0, 0x8012                 # a0 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   a0, a0, 0x1E08             # a0 = 80121E08
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    addiu   a1, $zero, 0x0040          # a1 = 00000040
lbl_800C4C38:
    sll     t6, v0,  4
    addu    v1, a0, t6
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0010
    swc1    $f0, 0x0000(v1)            # 00000000
    swc1    $f0, 0x0004(v1)            # 00000004
    sb      $zero, 0x0008(v1)          # 00000008
    sb      a1, 0x0009(v1)             # 00000009
    sb      $zero, 0x000A(v1)          # 0000000A
    sb      a2, 0x000B(v1)             # 0000000B
    bne     $at, $zero, lbl_800C4C38
    sb      a2, 0x000C(v1)             # 0000000C
    sb      $zero, 0x00DC(a0)          # 80121EE4
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x192C($at)         # 8010192C
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x1928($at)         # 80101928


func_800C4C84:
# MqDbg: Audio_PlayCutsceneEffectsSequence
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x4754(t6)             # 80124754
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0014($sp)
    beq     t6, $at, lbl_800C4CBC
    sw      a0, 0x0018($sp)
    lui     a0, 0x0300                 # a0 = 03000000
    jal     func_800CAA70
    ori     a0, a0, 0x006D             # a0 = 0300006D
    lbu     a0, 0x001B($sp)
    lui     $at, 0x8300                # $at = 83000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 83000000
lbl_800C4CBC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C4CCC:
# MqDbg: func_800F3F84
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x40C0                # $at = 40C00000
    mtc1    $at, $f14                  # $f14 = 6.00
    lui     $at, 0x8012                # $at = 80120000
    mov.s   $f2, $f0
    c.lt.s  $f14, $f12
    nop
    bc1fl   lbl_800C4D10
    div.s   $f2, $f12, $f14
    swc1    $f0, 0x1DC0($at)           # 80121DC0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5F40($at)          # 8010A0C0
    lui     $at, 0x8012                # $at = 80120000
    jr      $ra
    swc1    $f4, 0x1DC8($at)           # 80121DC8
lbl_800C4D0C:
    div.s   $f2, $f12, $f14
lbl_800C4D10:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F3C($at)          # 8010A0C4
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x5F38($at)         # 8010A0C8
    lui     $at, 0x8012                # $at = 80120000
    mul.s   $f8, $f2, $f6
    add.s   $f16, $f8, $f10
    swc1    $f16, 0x1DC0($at)          # 80121DC0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F34($at)         # 8010A0CC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F30($at)          # 8010A0D0
    mul.s   $f4, $f2, $f18
    lui     $at, 0x8012                # $at = 80120000
    add.s   $f8, $f4, $f6
    swc1    $f8, 0x1DC8($at)           # 80121DC8
    jr      $ra
    mov.s   $f0, $f2


func_800C4D58:
# MqDbg: func_800F4010
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a2, 0x0030($sp)
    sw      a0, 0x0028($sp)
    sw      a1, 0x002C($sp)
    jal     func_800C4CCC
    lwc1    $f12, 0x0030($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    addiu   t6, t6, 0x1DC0             # t6 = 80121DC0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x002E($sp)
    lw      a1, 0x0028($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f0, 0x0024($sp)
    lhu     v1, 0x002E($sp)
    addiu   $at, $zero, 0x00B0         # $at = 000000B0
    lwc1    $f2, 0x0024($sp)
    andi    t8, v1, 0x00F0             # t8 = 00000000
    bne     t8, $at, lbl_800C4DD8
    lwc1    $f4, 0x0030($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5F2C($at)          # 8010A0D4
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    b       lbl_800C4DF0
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C4DD8:
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5F28($at)          # 8010A0D8
    andi    v0, v0, 0x0001             # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
lbl_800C4DF0:
    c.lt.s  $f0, $f4
    nop
    bc1fl   lbl_800C4E6C
    lw      $ra, 0x001C($sp)
    beq     v0, $zero, lbl_800C4E68
    andi    t9, v1, 0x0080             # t9 = 00000000
    beq     t9, $zero, lbl_800C4E18
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C4E1C
    addiu   a0, $zero, 0x0867          # a0 = 00000867
lbl_800C4E18:
    addiu   a0, $zero, 0x0866          # a0 = 00000866
lbl_800C4E1C:
    ldc1    $f8, -0x5F20($at)          # 8010A0E0
    cvt.d.s $f6, $f2
    lui     $at, 0x8011                # $at = 80110000
    mul.d   $f10, $f6, $f8
    ldc1    $f16, -0x5F18($at)         # 8010A0E8
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   v0, v0, 0x1DC4             # v0 = 80121DC4
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    add.d   $f18, $f10, $f16
    sw      t0, 0x0014($sp)
    sw      v0, 0x0010($sp)
    lw      a1, 0x0028($sp)
    cvt.s.d $f4, $f18
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f4, 0x0000(v0)            # 80121DC4
lbl_800C4E68:
    lw      $ra, 0x001C($sp)
lbl_800C4E6C:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C4E78:
# MqDbg: func_800F4138
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    mtc1    a2, $f12                   # $f12 = 0.00
    sw      a0, 0x0020($sp)
    jal     func_800C4CCC
    sw      a1, 0x0024($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    addiu   t6, t6, 0x1DC0             # t6 = 80121DC0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4ED0:
# MqDbg: func_800F4190
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a1, 0x0024($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t7, t7, 0x18C4             # t7 = 801018C4
    addiu   t6, t6, 0x43A0             # t6 = 801043A0
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x18C0             # a3 = 801018C0
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4F20:
# MqDbg: Audio_PlaySfxRandom
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_800BBD80
    sw      a2, 0x0028($sp)
    lbu     t7, 0x002B($sp)
    lhu     t6, 0x0026($sp)
    lui     a3, 0x8010                 # a3 = 80100000
    divu    $zero, v0, t7
    mfhi    t8
    andi    t9, t8, 0x00FF             # t9 = 00000000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    bne     t7, $zero, lbl_800C4F68
    nop
    break   # 0x01C00
lbl_800C4F68:
    addu    a0, t6, t9
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sw      t0, 0x0014($sp)
    sw      a3, 0x0010($sp)
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4F94:
# MqDbg: func_800F4254
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s0, 0x0020($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x18F0(t6)             # 801018F0
    or      s0, a1, $zero              # s0 = 00000000
    andi    s0, s0, 0x0003             # s0 = 00000000
    andi    s0, s0, 0x00FF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    beq     t6, s0, lbl_800C5064
    or      v0, s0, $zero              # v0 = 00000000
    sll     t7, s0,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t7
    lwc1    $f4, 0x18F4($at)           # 801018F4
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x1904             # a3 = 80101904
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     s0, $at, lbl_800C4FFC
    swc1    $f4, 0x0000(a3)            # 80101904
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C5030
    addiu   a0, $zero, 0x086D          # a0 = 0000086D
    b       lbl_800C505C
    nop
lbl_800C4FFC:
    lui     t8, 0x8010                 # t8 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x43A8             # t9 = 801043A8
    addiu   t8, t8, 0x43A0             # t8 = 801043A0
    sw      t8, 0x0010($sp)
    sw      t9, 0x0014($sp)
    addiu   a0, $zero, 0x086D          # a0 = 0000086D
    lw      a1, 0x0030($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      v0, 0x0028($sp)
    b       lbl_800C505C
    lw      v0, 0x0028($sp)
lbl_800C5030:
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x43A8             # t1 = 801043A8
    addiu   t0, t0, 0x43A0             # t0 = 801043A0
    sw      t0, 0x0010($sp)
    sw      t1, 0x0014($sp)
    lw      a1, 0x0030($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      v0, 0x0028($sp)
    lw      v0, 0x0028($sp)
lbl_800C505C:
    lui     $at, 0x8010                # $at = 80100000
    sb      s0, 0x18F0($at)            # 801018F0
lbl_800C5064:
    lui     a3, 0x8010                 # a3 = 80100000
    beq     v0, $zero, lbl_800C5098
    addiu   a3, a3, 0x1904             # a3 = 80101904
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   t3, t3, 0x43A8             # t3 = 801043A8
    addiu   t2, t2, 0x43A0             # t2 = 801043A0
    sw      t2, 0x0010($sp)
    sw      t3, 0x0014($sp)
    addiu   a0, $zero, 0x1022          # a0 = 00001022
    lw      a1, 0x0030($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
lbl_800C5098:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C50AC:
# MqDbg: func_800F436C
    lui     $at, 0x3F40                # $at = 3F400000
    mtc1    $at, $f0                   # $f0 = 0.75
    mtc1    a2, $f12                   # $f12 = 0.00
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     a3, 0x8012                 # a3 = 80120000
    c.lt.s  $f12, $f0
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    bc1f    lbl_800C5104
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    div.s   $f4, $f12, $f0
    lui     $at, 0x3E80                # $at = 3E800000
    mtc1    $at, $f6                   # $f6 = 0.25
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f10                  # $f10 = 0.50
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    mul.s   $f8, $f4, $f6
    add.s   $f16, $f8, $f10
    b       lbl_800C5108
    swc1    $f16, 0x0000(a3)           # 80121DF0
lbl_800C5104:
    swc1    $f12, 0x0000(a3)           # 80121DF0
lbl_800C5108:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f18                  # $f18 = 0.50
    lwc1    $f4, 0x0000(a3)            # 80121DF0
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t6, t6, 0x43A0             # t6 = 801043A0
    c.lt.s  $f18, $f4
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    bc1f    lbl_800C5144
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    sw      t7, 0x0014($sp)
    jal     func_800C806C
    sw      t6, 0x0010($sp)
lbl_800C5144:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5154:
# MqDbg: func_800F4414
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18C8             # v1 = 801018C8
    lb      t6, 0x0000(v1)             # 801018C8
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a2, $f12                   # $f12 = 0.00
    addiu   t7, t6, 0xFFFF             # t7 = FFFFFFFF
    sb      t7, 0x0000(v1)             # 801018C8
    lb      t8, 0x0000(v1)             # 801018C8
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    bne     t8, $zero, lbl_800C521C
    sw      a1, 0x0024($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    addiu   t9, t9, 0x43A0             # t9 = 801043A0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    sw      t9, 0x0010($sp)
    sw      t0, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f12, 0x0028($sp)
    lui     $at, 0x4000                # $at = 40000000
    mtc1    $at, $f0                   # $f0 = 2.00
    lwc1    $f12, 0x0028($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18C8             # v1 = 801018C8
    c.lt.s  $f0, $f12
    lui     v0, 0x8010                 # v0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    bc1f    lbl_800C51E4
    nop
    mov.s   $f12, $f0
lbl_800C51E4:
    lb      v0, 0x18D0(v0)             # 801018D0
    lb      t1, 0x18CC(t1)             # 801018CC
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    subu    t2, v0, t1
    mtc1    t2, $f4                    # $f4 = 0.00
    sub.s   $f10, $f8, $f12
    cvt.s.w $f6, $f4
    mul.s   $f16, $f6, $f10
    trunc.w.s $f18, $f16
    mfc1    t6, $f18
    nop
    addu    t7, t6, v0
    sb      t7, 0x0000(v1)             # 801018C8
lbl_800C521C:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C522C:
# MqDbg: func_800F44EC
    sw      a1, 0x0004($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    sll     a1, a1, 24
    sb      t6, 0x18C8($at)            # 801018C8
    sra     a1, a1, 24
    sw      a0, 0x0000($sp)
    lui     $at, 0x8010                # $at = 80100000
    sll     a0, a0, 24
    sb      a1, 0x18CC($at)            # 801018CC
    sra     a0, a0, 24
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      a0, 0x18D0($at)            # 801018D0


func_800C5264:
# MqDbg: func_800F4524
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lb      t6, 0x002B($sp)
    sw      a1, 0x0024($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   v0, v0, 0x1DF4             # v0 = 80121DF4
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    lhu     a0, 0x0026($sp)
    sw      v0, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sb      t6, 0x0000(v0)             # 80121DF4
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C52B8:
# MqDbg: func_800F4578
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a2, $f12                   # $f12 = 0.00
    sw      a1, 0x0024($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   v0, v0, 0x1DF8             # v0 = 80121DF8
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    sw      t6, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    sw      v0, 0x0010($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f12, 0x0000(v0)           # 80121DF8
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5310:
# MqDbg: func_800F45D0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    swc1    $f12, 0x0018($sp)
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x4394             # a0 = 80104394
    lw      a2, 0x0018($sp)
    jal     func_800C5154
    addiu   a1, $zero, 0x103D          # a1 = 0000103D
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5F10($at)          # 8010A0F0
    lwc1    $f6, 0x0018($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x5F0C($at)         # 8010A0F4
    mul.s   $f8, $f4, $f6
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x4394             # a0 = 80104394
    or      a1, $zero, $zero           # a1 = 00000000
    add.s   $f16, $f8, $f10
    mfc1    a2, $f16
    jal     func_800C50AC
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C5374:
# MqDbg: Audio_PlaySfxRiver
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   a0, $zero, 0x2006          # a0 = 00002006
    jal     func_800C9B74
    swc1    $f12, 0x0024($sp)
    bne     v0, $zero, lbl_800C53A8
    lwc1    $f12, 0x0024($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DD0             # a3 = 80121DD0
    b       lbl_800C53E8
    swc1    $f12, 0x0000(a3)           # 80121DD0
lbl_800C53A8:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DD0             # a3 = 80121DD0
    lwc1    $f0, 0x0000(a3)            # 80121DD0
    c.eq.s  $f12, $f0
    nop
    bc1t    lbl_800C53E8
    nop
    swc1    $f12, 0x0004(a3)           # 80121DD4
    lwc1    $f4, 0x0004(a3)            # 80121DD4
    lui     $at, 0x4220                # $at = 42200000
    mtc1    $at, $f8                   # $f8 = 40.00
    sub.s   $f6, $f4, $f0
    addiu   t6, $zero, 0x0028          # t6 = 00000028
    sw      t6, 0x000C(a3)             # 80121DDC
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x0008(a3)           # 80121DD8
lbl_800C53E8:
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x43A8             # t8 = 801043A8
    addiu   t7, t7, 0x43A0             # t7 = 801043A0
    sw      t7, 0x0010($sp)
    sw      t8, 0x0014($sp)
    addiu   a0, $zero, 0x2006          # a0 = 00002006
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5420:
# MqDbg: Audio_PlaySfxWaterfall
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   a0, $zero, 0x2007          # a0 = 00002007
    jal     func_800C9B74
    swc1    $f12, 0x0024($sp)
    bne     v0, $zero, lbl_800C5454
    lwc1    $f12, 0x0024($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DE0             # a3 = 80121DE0
    b       lbl_800C5494
    swc1    $f12, 0x0000(a3)           # 80121DE0
lbl_800C5454:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DE0             # a3 = 80121DE0
    lwc1    $f0, 0x0000(a3)            # 80121DE0
    c.eq.s  $f12, $f0
    nop
    bc1t    lbl_800C5494
    nop
    swc1    $f12, 0x0004(a3)           # 80121DE4
    lwc1    $f4, 0x0004(a3)            # 80121DE4
    lui     $at, 0x4220                # $at = 42200000
    mtc1    $at, $f8                   # $f8 = 40.00
    sub.s   $f6, $f4, $f0
    addiu   t6, $zero, 0x0028          # t6 = 00000028
    sw      t6, 0x000C(a3)             # 80121DEC
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x0008(a3)           # 80121DE8
lbl_800C5494:
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    sw      t7, 0x0014($sp)
    addiu   a0, $zero, 0x2007          # a0 = 00002007
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      a3, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C54C4:
# MqDbg: Audio_StepFreqLerp
    lw      v0, 0x000C(a0)             # 0000000C
    beq     v0, $zero, lbl_800C54F4
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    beq     t6, $zero, lbl_800C54EC
    sw      t6, 0x000C(a0)             # 0000000C
    lwc1    $f4, 0x0000(a0)            # 00000000
    lwc1    $f6, 0x0008(a0)            # 00000008
    add.s   $f8, $f4, $f6
    jr      $ra
    swc1    $f8, 0x0000(a0)            # 00000000
lbl_800C54EC:
    lwc1    $f10, 0x0004(a0)           # 00000004
    swc1    $f10, 0x0000(a0)           # 00000000
lbl_800C54F4:
    jr      $ra
    nop


func_800C54FC:
# MqDbg: Audio_SetBgmVolumeOffDuringFanfare
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C553C:
# MqDbg: Audio_SetBgmVolumeOnDuringFanfare
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0003          # a3 = 00000003
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0003          # a3 = 00000003
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C557C:
# MqDbg: Audio_SetMainBgmVolume
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    andi    a2, a0, 0x00FF             # a2 = 00000000
    andi    a3, a1, 0x00FF             # a3 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800CACA4
    or      a0, $zero, $zero           # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C55B0:
# MqDbg: Audio_SetGanonsTowerBgmVolumeLevel
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s1, 0x001C($sp)
    andi    v0, a0, 0x00FF             # v0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0030($sp)
    bne     v0, $zero, lbl_800C55D8
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s1, $zero, 0x007F          # s1 = 0000007F
lbl_800C55D8:
    or      s0, $zero, $zero           # s0 = 00000000
    sw      v0, 0x0028($sp)
    lui     s2, 0x0700                 # s2 = 07000000
    andi    t6, s0, 0x00FF             # t6 = 00000000
lbl_800C55E8:
    sll     t7, t6,  8
    sll     a1, s1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    or      a0, t7, s2                 # a0 = 07000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C55E8
    andi    t6, s0, 0x00FF             # t6 = 00000001
    lw      t8, 0x0028($sp)
    lw      t0, 0x0028($sp)
    addiu   $at, $zero, 0x0007         # $at = 00000007
    bne     t8, $at, lbl_800C5634
    andi    t1, t0, 0x0007             # t1 = 00000000
    addiu   t9, $zero, 0x0002          # t9 = 00000002
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C5644
    sb      t9, 0x1910($at)            # 80101910
lbl_800C5634:
    lui     a0, 0x8010                 # a0 = 80100000
    addu    a0, a0, t1
    jal     func_800C565C
    lbu     a0, 0x1908(a0)             # 80101908
lbl_800C5644:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C565C:
# MqDbg: Audio_SetGanonsTowerBgmVolume
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1E00(t6)             # 80121E00
    sw      s5, 0x0028($sp)
    andi    a2, a0, 0x00FF             # a2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0030($sp)
    beq     a2, t6, lbl_800C576C
    or      s5, a2, $zero              # s5 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a3, $zero, 0x0002          # a3 = 00000002
    jal     func_800CACA4
    sb      a2, 0x0033($sp)
    slti    $at, s5, 0x0040
    beq     $at, $zero, lbl_800C56BC
    addiu   v0, s5, 0xFFC0             # v0 = FFFFFFC0
    b       lbl_800C56CC
    addiu   v0, $zero, 0x0010          # v0 = 00000010
lbl_800C56BC:
    sra     v0, v0,  2
    addiu   v0, v0, 0x0001             # v0 = 00000011
    sll     v0, v0,  4
    andi    v0, v0, 0x00FF             # v0 = 00000011
lbl_800C56CC:
    lui     $at, 0x8004                # $at = 80040000
    ori     $at, $at, 0x0F00           # $at = 80040F00
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 80040F11
    lui     s2, 0x8012                 # s2 = 80120000
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB0E0             # s1 = 8012B0E0
    addiu   s2, s2, 0x5630             # s2 = 80125630
    or      s0, $zero, $zero           # s0 = 00000000
    lui     s4, 0x0500                 # s4 = 05000000
    addiu   s3, $zero, 0x00FF          # s3 = 000000FF
    sll     t7, s0,  2
lbl_800C56FC:
    addu    t8, s2, t7
    lw      v0, 0x3568(t8)             # 00003568
    beql    s1, v0, lbl_800C5750
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lb      v1, 0x00C9(v0)             # 000000C9
    andi    t1, s0, 0x00FF             # t1 = 00000001
    sll     t2, t1,  8
    andi    t9, v1, 0x00FF             # t9 = 00000000
    beq     s3, t9, lbl_800C574C
    subu    v0, v1, s5
    addiu   v0, v0, 0x007F             # v0 = 0000007F
    andi    v0, v0, 0xFFFF             # v0 = 0000007F
    slti    $at, v0, 0x0080
    bne     $at, $zero, lbl_800C573C
    or      a0, t2, s4                 # a0 = 05000000
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
lbl_800C573C:
    or      a1, v0, $zero              # a1 = 0000007F
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
lbl_800C574C:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800C5750:
    andi    s0, s0, 0x00FF             # s0 = 00000002
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C56FC
    sll     t7, s0,  2
    lbu     t3, 0x0033($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      t3, 0x1E00($at)            # 80121E00
lbl_800C576C:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF


func_800C5794:
# MqDbg: Audio_LowerMainBgmVolume
# Sound? Set u8 80121DFC to A0, u8 80121DFE to 1
# A0 = ?
    lui     $at, 0x8012                # $at = 80120000
    sb      a0, 0x1DFC($at)            # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      a0, 0x0000($sp)
    jr      $ra
    sb      t6, 0x1DFE($at)            # 80121DFE


func_800C57B0:
# MqDbg: Audio_UpdateRiverSoundVolumes
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1DFE(t6)             # 80121DFE
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    bne     v0, t6, lbl_800C5818
    sw      $ra, 0x0014($sp)
    lui     a2, 0x8012                 # a2 = 80120000
    lui     t7, 0x8012                 # t7 = 80120000
    lbu     t7, 0x1DFD(t7)             # 80121DFD
    lbu     a2, 0x1DFC(a2)             # 80121DFC
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    beq     a2, t7, lbl_800C580C
    nop
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1DFC(t8)             # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t8, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      t9, 0x1DFF($at)            # 80121DFF
lbl_800C580C:
    lui     $at, 0x8012                # $at = 80120000
    b       lbl_800C585C
    sb      $zero, 0x1DFE($at)         # 80121DFE
lbl_800C5818:
    lui     t0, 0x8012                 # t0 = 80120000
    lbu     t0, 0x1DFF(t0)             # 80121DFF
    lui     t1, 0x8010                 # t1 = 80100000
    bne     v0, t0, lbl_800C585C
    nop
    lb      t1, 0x1918(t1)             # 80101918
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    bne     t1, $zero, lbl_800C585C
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    addiu   t2, $zero, 0x007F          # t2 = 0000007F
    lui     $at, 0x8012                # $at = 80120000
    sb      t2, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFF($at)         # 80121DFF
lbl_800C585C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x1910             # v1 = 80101910
    lbu     v0, 0x0000(v1)             # 80101910
    beq     v0, $zero, lbl_800C5888
    addiu   t3, v0, 0xFFFF             # t3 = FFFFFFFF
    andi    t4, t3, 0x00FF             # t4 = 000000FF
    bne     t4, $zero, lbl_800C5888
    sb      t3, 0x0000(v1)             # 80101910
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C565C
    lbu     a0, 0x190F(a0)             # 8010190F
lbl_800C5888:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C5898:
# MqDbg: Audio_PlaySfxIncreasinglyTransposed
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x18DC(t6)             # 801018DC
    lw      t7, 0x0028($sp)
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    addu    t8, t6, t7
    lbu     t9, 0x0000(t8)             # 00000000
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    lui     t4, 0x8010                 # t4 = 80100000
    sll     t0, t9,  2
    or      a1, a0, $zero              # a1 = 00000000
    addiu   t1, t0, 0x009C             # t1 = 0000009C
    addiu   t4, t4, 0x43A8             # t4 = 801043A8
    addiu   t3, t3, 0x43A0             # t3 = 801043A0
    addiu   t2, t2, 0x0BC4             # t2 = 80100BC4
    addu    a3, t1, t2
    sw      t3, 0x0010($sp)
    sw      t4, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18DC             # v1 = 801018DC
    lbu     v0, 0x0000(v1)             # 801018DC
    slti    $at, v0, 0x000F
    beq     $at, $zero, lbl_800C5918
    addiu   t5, v0, 0x0001             # t5 = 00000001
    sb      t5, 0x0000(v1)             # 801018DC
lbl_800C5918:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5928:
# MqDbg: Audio_ResetIncreasingTranspose
# Zero u8? 801018DC
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x18DC($at)         # 801018DC


func_800C5934:
# MqDbg: Audio_PlaySfxTransposed
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lb      t6, 0x002B($sp)
    sw      a1, 0x0024($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t7, t6,  2
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t8, t7, 0x009C             # t8 = 0000009C
    addiu   t1, t1, 0x43A8             # t1 = 801043A8
    addiu   t0, t0, 0x43A0             # t0 = 801043A0
    addiu   t9, t9, 0x0BC4             # t9 = 80100BC4
    addu    a3, t8, t9
    sw      t0, 0x0010($sp)
    sw      t1, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5998:
# MqDbg: func_800F4C58
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      a1, 0x0054($sp)
    lhu     a3, 0x0056($sp)
    sw      s7, 0x003C($sp)
    sw      s8, 0x0040($sp)
    sra     v0, a3, 12
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    andi    s7, v0, 0x00FF             # s7 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      a0, 0x0050($sp)
    sw      a2, 0x0058($sp)
    or      s1, $zero, $zero           # s1 = 00000000
    andi    s8, v0, 0x00FF             # s8 = 00000000
    blez    s7, lbl_800C5A30
    or      s0, $zero, $zero           # s0 = 00000000
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x1888             # t8 = 80101888
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    v1, t7, t8
    or      v0, s8, $zero              # v0 = 00000000
lbl_800C5A0C:
    addu    t9, v1, s0
    lbu     t0, 0x0000(t9)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s0, v0
    addu    s1, s1, t0
    bne     $at, $zero, lbl_800C5A0C
    andi    s1, s1, 0x00FF             # s1 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C5A30:
    lui     t1, 0x8010                 # t1 = 80100000
    lbu     t1, 0x438C(t1)             # 8010438C
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   t3, t3, 0x1888             # t3 = 80101888
    sll     t2, t1,  3
    subu    t2, t2, t1
    addu    v1, t2, t3
    addu    t4, v1, s7
    lbu     t5, 0x0000(t4)             # 00000000
    sll     t6, s7,  2
    subu    t6, t6, s7
    blez    t5, lbl_800C5B18
    sll     t6, t6,  3
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x46A8             # t7 = 801246A8
    lui     s3, 0x8010                 # s3 = 80100000
    addiu   s3, s3, 0x4368             # s3 = 80104368
    addu    s6, t6, t7
    lui     s5, 0x0602                 # s5 = 06020000
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    addiu   s2, $zero, 0x00FF          # s2 = 000000FF
lbl_800C5A84:
    sll     t8, s0,  3
    addu    t9, s6, t8
    lbu     v0, 0x0004(t9)             # 00000004
    beql    s2, v0, lbl_800C5AFC
    addu    t1, v1, s8
    multu   v0, s4
    sll     t0, s7,  2
    addu    t1, s3, t0
    lw      t2, 0x0000(t1)             # 80100000
    andi    t6, s1, 0x00FF             # t6 = 00000000
    sll     t7, t6,  8
    or      a0, t7, s5                 # a0 = 861246A8
    ori     a0, a0, 0x0006             # a0 = 861246AE
    lb      a1, 0x005B($sp)
    mflo    t3
    addu    t4, t2, t3
    lhu     t5, 0x0028(t4)             # 00000028
    bnel    a3, t5, lbl_800C5AFC
    addu    t1, v1, s8
    jal     func_800BB0E0
    sw      a3, 0x0048($sp)
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t8, 0x438C(t8)             # 8010438C
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1888             # t0 = 80101888
    sll     t9, t8,  3
    subu    t9, t9, t8
    addu    v1, t9, t0
    lw      a3, 0x0048($sp)
    addu    t1, v1, s8
lbl_800C5AFC:
    lbu     t2, 0x0000(t1)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    addiu   s1, s1, 0x0001             # s1 = 00000001
    slt     $at, s0, t2
    bne     $at, $zero, lbl_800C5A84
    andi    s1, s1, 0x00FF             # s1 = 00000001
lbl_800C5B18:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t3, t3, 0x43A8             # t3 = 801043A8
    sw      t3, 0x0014($sp)
    sw      a3, 0x0010($sp)
    lhu     a0, 0x0056($sp)
    lw      a1, 0x0050($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x0044($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    lw      s7, 0x003C($sp)
    lw      s8, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800C5B70:
# MqDbg: func_800F4E30
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    lw      v0, 0x0000(v1)             # 8010195C
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x003C($sp)
    sw      s4, 0x0038($sp)
    sw      s3, 0x0034($sp)
    sw      s2, 0x0030($sp)
    sw      s1, 0x002C($sp)
    sw      s0, 0x0028($sp)
    sdc1    $f22, 0x0020($sp)
    bne     v0, $zero, lbl_800C5BC4
    sdc1    $f20, 0x0018($sp)
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    swc1    $f12, 0x0000(a1)           # 80101960
    sw      a0, 0x0000(v1)             # 8010195C
    lwc1    $f0, 0x0000(a1)            # 80101960
    b       lbl_800C5C08
    or      v0, a0, $zero              # v0 = 00000000
lbl_800C5BC4:
    beq     a0, v0, lbl_800C5BF8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    lwc1    $f0, 0x0000(a1)            # 80101960
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C5C0C
    lui     $at, 0x42C8                # $at = 42C80000
    swc1    $f12, 0x0000(a1)           # 80101960
    sw      a0, 0x0000(v1)             # 8010195C
    lwc1    $f0, 0x0000(a1)            # 80101960
    b       lbl_800C5C08
    or      v0, a0, $zero              # v0 = 00000000
lbl_800C5BF8:
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    swc1    $f12, 0x0000(a1)           # 80101960
    lwc1    $f0, 0x0000(a1)            # 80101960
lbl_800C5C08:
    lui     $at, 0x42C8                # $at = 42C80000
lbl_800C5C0C:
    mtc1    $at, $f14                  # $f14 = 100.00
    lwc1    $f2, 0x0000(v0)            # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    c.lt.s  $f14, $f2
    lui     s3, 0x0300                 # s3 = 03000000
    lui     s2, 0x6002                 # s2 = 60020000
    bc1fl   lbl_800C5C3C
    lui     $at, 0xC2C8                # $at = C2C80000
    b       lbl_800C5C88
    addiu   s4, $zero, 0x007F          # s4 = 0000007F
    lui     $at, 0xC2C8                # $at = C2C80000
lbl_800C5C3C:
    mtc1    $at, $f4                   # $f4 = -100.00
    nop
    c.lt.s  $f2, $f4
    nop
    bc1fl   lbl_800C5C60
    div.s   $f6, $f2, $f14
    b       lbl_800C5C88
    or      s4, $zero, $zero           # s4 = 00000000
    div.s   $f6, $f2, $f14
lbl_800C5C60:
    lui     $at, 0x4280                # $at = 42800000
    mtc1    $at, $f12                  # $f12 = 64.00
    nop
    mul.s   $f8, $f6, $f12
    add.s   $f10, $f8, $f12
    trunc.w.s $f16, $f10
    mfc1    s4, $f16
    nop
    sll     s4, s4, 24
    sra     s4, s4, 24
lbl_800C5C88:
    lui     $at, 0x43C8                # $at = 43C80000
    mtc1    $at, $f18                  # $f18 = 400.00
    nop
    c.lt.s  $f18, $f0
    nop
    bc1f    lbl_800C5CAC
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C5D08
    lwc1    $f22, -0x5F08($at)         # 8010A0F8
lbl_800C5CAC:
    lui     $at, 0x42F0                # $at = 42F00000
    mtc1    $at, $f2                   # $f2 = 120.00
    lui     $at, 0x438C                # $at = 438C0000
    c.lt.s  $f0, $f2
    nop
    bc1fl   lbl_800C5CDC
    sub.s   $f4, $f0, $f2
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f22                  # $f22 = 1.00
    b       lbl_800C5D0C
    lui     $at, 0x42FE                # $at = 42FE0000
    sub.s   $f4, $f0, $f2
lbl_800C5CDC:
    mtc1    $at, $f6                   # $f6 = 127.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    div.s   $f8, $f4, $f6
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F04($at)         # 8010A0FC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F00($at)          # 8010A100
    sub.s   $f16, $f10, $f8
    mul.s   $f4, $f16, $f18
    add.s   $f22, $f4, $f6
lbl_800C5D08:
    lui     $at, 0x42FE                # $at = 42FE0000
lbl_800C5D0C:
    mtc1    $at, $f20                  # $f20 = 127.00
    addiu   s1, $zero, 0x0009          # s1 = 00000009
lbl_800C5D14:
    beql    s1, v0, lbl_800C5DD4
    addiu   s0, s0, 0x0001             # s0 = 00000001
    mul.s   $f10, $f20, $f22
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sll     t7, v0,  8
    or      t8, t7, s2                 # t8 = 60020000
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t9, $f31
    ctc1    t0, $f31
    nop
    cvt.w.s $f8, $f10
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    beql    t0, $zero, lbl_800C5D9C
    mfc1    t0, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sub.s   $f8, $f10, $f8
    ctc1    t0, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    bne     t0, $zero, lbl_800C5D90
    nop
    mfc1    t0, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C5DA8
    or      t0, t0, $at                # t0 = 80000000
lbl_800C5D90:
    b       lbl_800C5DA8
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    mfc1    t0, $f8
lbl_800C5D9C:
    nop
    bltz    t0, lbl_800C5D90
    nop
lbl_800C5DA8:
    ctc1    t9, $f31
    andi    t1, t0, 0x00FF             # t1 = 000000FF
    jal     func_800CAA70
    or      a0, t8, t1                 # a0 = 600200FF
    andi    t2, s0, 0x00FF             # t2 = 00000001
    sll     t3, t2,  8
    sll     a1, s4, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    or      a0, t3, s3                 # a0 = 03000000
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800C5DD4:
    andi    s0, s0, 0x00FF             # s0 = 00000002
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C5D14
    or      v0, s0, $zero              # v0 = 00000002
    lw      $ra, 0x003C($sp)
    ldc1    $f20, 0x0018($sp)
    ldc1    $f22, 0x0020($sp)
    lw      s0, 0x0028($sp)
    lw      s1, 0x002C($sp)
    lw      s2, 0x0030($sp)
    lw      s3, 0x0034($sp)
    lw      s4, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800C5E0C:
# MqDbg: Audio_ClearSariaBgm
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x195C             # v0 = 8010195C
    lw      t6, 0x0000(v0)             # 8010195C
    beq     t6, $zero, lbl_800C5E24
    nop
    sw      $zero, 0x0000(v0)          # 8010195C
lbl_800C5E24:
    jr      $ra
    nop


func_800C5E2C:
# MqDbg: Audio_ClearSariaBgmAtPos
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x195C             # v0 = 8010195C
    lw      t6, 0x0000(v0)             # 8010195C
    bne     a0, t6, lbl_800C5E44
    nop
    sw      $zero, 0x0000(v0)          # 8010195C
lbl_800C5E44:
    jr      $ra
    nop


func_800C5E4C:
# MqDbg: Audio_SplitBgmChannels
# Sound-related function
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x2F88(t6)             # 80102F88
    sw      s1, 0x001C($sp)
    sll     s1, a0, 24
    sw      $ra, 0x002C($sp)
    sw      a0, 0x0048($sp)
    sra     s1, s1, 24
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    jal     func_800CAB18
    sh      t6, 0x0040($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    bnel    v0, $at, lbl_800C5FC4
    lw      $ra, 0x002C($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     v0, $at, lbl_800C5FC0
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   s4, $zero, 0x007F          # s4 = 0000007F
    addiu   s3, $zero, 0x000A          # s3 = 0000000A
    lui     s2, 0xA000                 # s2 = A0000000
lbl_800C5EB8:
    bne     v0, $zero, lbl_800C5EC8
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C5ED0
    andi    v1, s1, 0x00FF             # v1 = 00000000
lbl_800C5EC8:
    subu    v1, s4, s1
    andi    v1, v1, 0x00FF             # v1 = 00000000
lbl_800C5ED0:
    slti    $at, v1, 0x0065
    bne     $at, $zero, lbl_800C5EE4
    or      v0, v1, $zero              # v0 = 00000000
    b       lbl_800C5F2C
    addiu   a2, $zero, 0x000B          # a2 = 0000000B
lbl_800C5EE4:
    slti    $at, v0, 0x0014
    beq     $at, $zero, lbl_800C5EF8
    addiu   t7, v0, 0xFFEC             # t7 = FFFFFFEC
    b       lbl_800C5F2C
    addiu   a2, $zero, 0x0002          # a2 = 00000002
lbl_800C5EF8:
    div     $zero, t7, s3
    mflo    a2
    addiu   a2, a2, 0x0002             # a2 = 00000004
    andi    a2, a2, 0x00FF             # a2 = 00000004
    bne     s3, $zero, lbl_800C5F14
    nop
    break   # 0x01C00
lbl_800C5F14:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     s3, $at, lbl_800C5F2C
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_800C5F2C
    nop
    break   # 0x01800
lbl_800C5F2C:
    addu    a3, $sp, s0
    lbu     a3, 0x0040(a3)             # 00000040
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x5630             # t9 = 80125630
    sll     t8, a3,  2
    subu    t8, t8, a3
    sll     t8, t8,  2
    subu    t8, t8, a3
    sll     t8, t8,  5
    addu    v1, t8, t9
    or      v0, $zero, $zero           # v0 = 00000000
    or      a0, a2, $zero              # a0 = 00000004
    sll     t0, v0,  2
lbl_800C5F60:
    addu    t1, v1, t0
    lw      t2, 0x3568(t1)             # 00003568
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sllv    t5, t4, v0
    lbu     t3, 0x0005(t2)             # 00000005
    slt     $at, t3, a0
    beql    $at, $zero, lbl_800C5F8C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addu    a1, a1, t5
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000002
lbl_800C5F8C:
    andi    v0, v0, 0x00FF             # v0 = 00000002
    slti    $at, v0, 0x0010
    bnel    $at, $zero, lbl_800C5F60
    sll     t0, v0,  2
    sll     t6, a3, 24
    or      t7, t6, s2                 # t7 = A0000000
    jal     func_800CAA70
    or      a0, t7, a1                 # a0 = A0000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0002
    bne     $at, $zero, lbl_800C5EB8
    or      v0, s0, $zero              # v0 = 00000001
lbl_800C5FC0:
    lw      $ra, 0x002C($sp)
lbl_800C5FC4:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_800C5FE0:
# MqDbg: Audio_PlaySariaBgm
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0A             # v1 = 80121F0A
    lbu     v0, 0x0000(v1)             # 80121F0A
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x001C($sp)
    sw      a1, 0x003C($sp)
    beq     v0, $zero, lbl_800C600C
    sw      a2, 0x0040($sp)
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800C6248
    sb      t6, 0x0000(v1)             # 80121F0A
lbl_800C600C:
    lwc1    $f0, 0x0008(a0)            # 00000008
    lwc1    $f2, 0x0000(a0)            # 00000000
    sw      a0, 0x0038($sp)
    mul.s   $f4, $f0, $f0
    nop
    mul.s   $f6, $f2, $f2
    jal     func_800D0DC0
    add.s   $f12, $f4, $f6
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    lw      v0, 0x0000(v1)             # 8010195C
    mov.s   $f14, $f0
    bnel    v0, $zero, lbl_800C6078
    lwc1    $f0, 0x0008(v0)            # 00000008
    lw      t7, 0x0038($sp)
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sw      t8, 0x0010($sp)
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    lhu     a1, 0x003E($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    swc1    $f14, 0x0030($sp)
    jal     func_800C6B54
    sw      t7, 0x0000(v1)             # 8010195C
    b       lbl_800C60BC
    lwc1    $f14, 0x0030($sp)
    lwc1    $f0, 0x0008(v0)            # 00000008
lbl_800C6078:
    lwc1    $f2, 0x0000(v0)            # 00000000
    swc1    $f14, 0x0030($sp)
    mul.s   $f8, $f0, $f0
    nop
    mul.s   $f10, $f2, $f2
    jal     func_800D0DC0
    add.s   $f12, $f8, $f10
    lwc1    $f14, 0x0030($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    c.lt.s  $f14, $f0
    lw      t9, 0x0038($sp)
    bc1fl   lbl_800C60BC
    mov.s   $f14, $f0
    b       lbl_800C60BC
    sw      t9, 0x0000(v1)             # 8010195C
    mov.s   $f14, $f0
lbl_800C60BC:
    lw      t0, 0x0038($sp)
    mtc1    $zero, $f16                # $f16 = 0.00
    lhu     t1, 0x0042($sp)
    lwc1    $f0, 0x0004(t0)            # 00000004
    lhu     t3, 0x003E($sp)
    mtc1    t1, $f18                   # $f18 = 0.00
    c.lt.s  $f0, $f16
    nop
    bc1fl   lbl_800C60F0
    mov.s   $f2, $f0
    b       lbl_800C60F0
    neg.s   $f2, $f0
    mov.s   $f2, $f0
lbl_800C60F0:
    bgez    t1, lbl_800C6108
    cvt.s.w $f0, $f18
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f0, $f0, $f4
lbl_800C6108:
    lui     $at, 0x4170                # $at = 41700000
    mtc1    $at, $f6                   # $f6 = 15.00
    nop
    div.s   $f8, $f0, $f6
    c.lt.s  $f8, $f2
    nop
    bc1fl   lbl_800C6134
    c.lt.s  $f14, $f0
    b       lbl_800C61F8
    or      a2, $zero, $zero           # a2 = 00000000
    c.lt.s  $f14, $f0
lbl_800C6134:
    or      a2, $zero, $zero           # a2 = 00000000
    bc1f    lbl_800C61F8
    nop
    div.s   $f16, $f14, $f0
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f4                   # $f4 = 127.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    sub.s   $f18, $f10, $f16
    mul.s   $f6, $f18, $f4
    cfc1    t2, $f31
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f6
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    beql    a2, $zero, lbl_800C61E0
    mfc1    a2, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    sub.s   $f8, $f6, $f8
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    bnel    a2, $zero, lbl_800C61D0
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    mfc1    a2, $f8
    lui     $at, 0x8000                # $at = 80000000
    ctc1    t2, $f31
    or      a2, a2, $at                # a2 = FFFFFFFF
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
lbl_800C61D0:
    ctc1    t2, $f31
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
    mfc1    a2, $f8
lbl_800C61E0:
    nop
    bltzl   a2, lbl_800C61D0
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    ctc1    t2, $f31
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
lbl_800C61F8:
    addiu   $at, $zero, 0x0028         # $at = 00000028
    beq     t3, $at, lbl_800C6214
    sll     a0, a2, 24
    sra     a0, a0, 24
    jal     func_800C5E4C
    sb      a2, 0x002F($sp)
    lbu     a2, 0x002F($sp)
lbl_800C6214:
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    or      a3, $zero, $zero           # a3 = 00000000
    jal     func_800CACA4
    sw      a2, 0x0024($sp)
    lw      t4, 0x0024($sp)
    addiu   t5, $zero, 0x007F          # t5 = 0000007F
    or      a0, $zero, $zero           # a0 = 00000000
    subu    a2, t5, t4
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
lbl_800C6248:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800C6258:
# MqDbg: Audio_ClearSariaBgm2
# Zero u32? 8010195C
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sw      $zero, 0x195C($at)         # 8010195C


func_800C6264:
# MqDbg: Audio_PlayMorningSceneSequence
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    jal     func_800C62A4
    lhu     a0, 0x0022($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      t6, 0x0010($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    lhu     a1, 0x0022($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800C6B54
    or      a3, $zero, $zero           # a3 = 00000000
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C62A4:
# MqDbg: Audio_PlaySceneSequence
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0028($sp)
    sb      $zero, 0x0027($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    beql    v0, $at, lbl_800C63F0
    lw      $ra, 0x001C($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v0, $at, lbl_800C62F0
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    jal     func_800C9F24
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C62F0:
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x1940(t6)             # 80101940
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1964             # t0 = 80101964
    addu    t7, t0, t6
    lbu     t8, 0x0000(t7)             # 00000000
    lhu     a1, 0x002A($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t9, t8, 0x0020             # t9 = 00000000
    beq     t9, $zero, lbl_800C6378
    andi    v1, a1, 0x00FF             # v1 = 00000000
    andi    t1, v1, 0x00FF             # t1 = 00000000
    addu    t2, t0, t1
    lbu     t3, 0x0000(t2)             # 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    andi    t4, t3, 0x0010             # t4 = 00000000
    beql    t4, $zero, lbl_800C637C
    lhu     a1, 0x002A($sp)
    lbu     v0, 0x193C(v0)             # 8010193C
    addiu   t6, $zero, 0x001E          # t6 = 0000001E
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t5, v0, 0x003F             # t5 = 00000000
    beql    t5, $zero, lbl_800C635C
    lbu     a2, 0x0027($sp)
    sb      t6, 0x0027($sp)
    lbu     a2, 0x0027($sp)
lbl_800C635C:
    sw      v0, 0x0010($sp)
    jal     func_800C6B54
    sw      v1, 0x0020($sp)
    lui     $at, 0x8010                # $at = 80100000
    lw      v1, 0x0020($sp)
    b       lbl_800C63E4
    sb      $zero, 0x193C($at)         # 8010193C
lbl_800C6378:
    lhu     a1, 0x002A($sp)
lbl_800C637C:
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    or      a2, $zero, $zero           # a2 = 00000000
    andi    v1, a1, 0x00FF             # v1 = 00000000
    andi    t7, v1, 0x00FF             # t7 = 00000000
    addu    t8, t0, t7
    lbu     t9, 0x0000(t8)             # 00000000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    andi    t1, t9, 0x0040             # t1 = 00000000
    beq     t1, $zero, lbl_800C63AC
    nop
    b       lbl_800C63AC
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C63AC:
    sw      v0, 0x0010($sp)
    jal     func_800C6B54
    sw      v1, 0x0020($sp)
    lhu     t2, 0x002A($sp)
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1964             # t0 = 80101964
    addu    t3, t0, t2
    lbu     t4, 0x0000(t3)             # 00000000
    lw      v1, 0x0020($sp)
    addiu   t6, $zero, 0x00C0          # t6 = 000000C0
    andi    t5, t4, 0x0020             # t5 = 00000000
    bne     t5, $zero, lbl_800C63E4
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x193C($at)            # 8010193C
lbl_800C63E4:
    lui     $at, 0x8010                # $at = 80100000
    sb      v1, 0x1940($at)            # 80101940
    lw      $ra, 0x001C($sp)
lbl_800C63F0:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C63FC:
# MqDbg: Audio_UpdateSceneSequenceResumePoint
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     v0, $at, lbl_800C645C
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x193C             # v0 = 8010193C
    andi    t9, t8, 0x0010             # t9 = 00000000
    beql    t9, $zero, lbl_800C6460
    lw      $ra, 0x0014($sp)
    lbu     t0, 0x0000(v0)             # 8010193C
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    lui     t1, 0x8013                 # t1 = 80130000
    beql    t0, $at, lbl_800C645C
    sb      $zero, 0x0000(v0)          # 8010193C
    lb      t1, -0x7345(t1)            # 80128CBB
    b       lbl_800C645C
    sb      t1, 0x0000(v0)             # 8010193C
    sb      $zero, 0x0000(v0)          # 8010193C
lbl_800C645C:
    lw      $ra, 0x0014($sp)
lbl_800C6460:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C646C:
# MqDbg: Audio_PlayWindmillBgm
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    beql    v0, $at, lbl_800C6494
    lw      $ra, 0x0014($sp)
    jal     func_800CAA70
    addiu   a0, $zero, 0x004C          # a0 = 0000004C
    lw      $ra, 0x0014($sp)
lbl_800C6494:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C64A0:
# MqDbg: Audio_SetMainBgmTempoFreqAfterFanfare
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a1, 0x002C($sp)
    c.eq.s  $f12, $f4
    andi    a2, a1, 0x00FF             # a2 = 00000000
    sw      $ra, 0x0014($sp)
    or      a1, a2, $zero              # a1 = 00000000
    bc1f    lbl_800C6598
    lui     $at, 0x42C8                # $at = 42C80000
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x4000           # $at = B0004000
    sll     a0, a2, 16
    or      a0, a0, $at                # a0 = B0004000
    sw      a2, 0x0024($sp)
    jal     func_800CAA70
    swc1    $f12, 0x0028($sp)
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f6                   # $f6 = 100.00
    lwc1    $f12, 0x0028($sp)
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lw      a1, 0x0024($sp)
    mul.s   $f8, $f12, $f6
    lui     $at, 0x4F00                # $at = 4F000000
    sll     v0, a1,  8
    cfc1    t6, $f31
    ctc1    v1, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    beql    v1, $zero, lbl_800C6580
    mfc1    v1, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    v1, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    bnel    v1, $zero, lbl_800C6570
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    mfc1    v1, $f10
    lui     $at, 0x8000                # $at = 80000000
    ctc1    t6, $f31
    or      v1, v1, $at                # v1 = FFFFFFFF
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
lbl_800C6570:
    ctc1    t6, $f31
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    mfc1    v1, $f10
lbl_800C6580:
    nop
    bltzl   v1, lbl_800C6570
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    ctc1    t6, $f31
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
lbl_800C6598:
    mtc1    $at, $f16                  # $f16 = 0.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f18, $f12, $f16
    sll     v0, a2,  8
    cfc1    t7, $f31
    ctc1    v1, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    beql    v1, $zero, lbl_800C6618
    mfc1    v1, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    v1, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    bne     v1, $zero, lbl_800C660C
    nop
    mfc1    v1, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C6624
    or      v1, v1, $at                # v1 = 80000000
lbl_800C660C:
    b       lbl_800C6624
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    mfc1    v1, $f4
lbl_800C6618:
    nop
    bltz    v1, lbl_800C660C
    nop
lbl_800C6624:
    lui     $at, 0xC130                # $at = C1300000
    or      t8, v0, $at                # t8 = C1300000
    ctc1    t7, $f31
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    or      a0, t8, v1                 # a0 = C13000FF
    sw      v1, 0x001C($sp)
    jal     func_800CAA70
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    lw      v1, 0x001C($sp)
lbl_800C664C:
    lui     $at, 0xC1A0                # $at = C1A00000
    or      t9, v0, $at                # t9 = C1A00000
    jal     func_800CAA70
    or      a0, t9, v1                 # a0 = C1A00000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C666C:
# MqDbg: Audio_SetFastTempoForTimedMinigame
# Speed up playback of minigame music sequence
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x006C         # $at = 0000006C
    bne     v0, $at, lbl_800C66A0
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB80
    lui     a1, 0xF000                 # a1 = F0000000
    beq     v0, $zero, lbl_800C66A0
    lui     a0, 0xB005                 # a0 = B0050000
    jal     func_800CAA70
    ori     a0, a0, 0x00D2             # a0 = B00500D2
lbl_800C66A0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C66B0:
# MqDbg: Audio_PlaySequenceInCutscene
# Cutscenes, Play New Background Sequence
# A0 = Music Sequence ID
    andi    a1, a0, 0xFFFF             # a1 = 00000000
    andi    t7, a1, 0x00FF             # t7 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t7
    lbu     v1, 0x1964(v1)             # 80101964
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    andi    t8, v1, 0x0002             # t8 = 00000000
    sw      a0, 0x0020($sp)
    beq     t8, $zero, lbl_800C66EC
    or      v0, a1, $zero              # v0 = 00000000
    jal     func_800C69A0
    andi    a0, a1, 0xFFFF             # a0 = 00000000
    b       lbl_800C6730
    lw      $ra, 0x001C($sp)
lbl_800C66EC:
    andi    t9, v1, 0x0004             # t9 = 00000000
    beq     t9, $zero, lbl_800C670C
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x0100                # $at = 01000000
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 01000000
    b       lbl_800C6730
    lw      $ra, 0x001C($sp)
lbl_800C670C:
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    sw      t0, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800C6B54
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    lw      $ra, 0x001C($sp)
lbl_800C6730:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C673C:
# MqDbg: Audio_StopSequenceInCutscene
    andi    t7, a0, 0x00FF             # t7 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, t7
    lbu     v0, 0x1964(v0)             # 80101964
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    andi    t8, v0, 0x0002             # t8 = 00000000
    beq     t8, $zero, lbl_800C6774
    sw      a0, 0x0018($sp)
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    b       lbl_800C67A0
    lw      $ra, 0x0014($sp)
lbl_800C6774:
    andi    t9, v0, 0x0004             # t9 = 00000000
    beq     t9, $zero, lbl_800C6794
    lui     a0, 0x1000                 # a0 = 10000000
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    b       lbl_800C67A0
    lw      $ra, 0x0014($sp)
lbl_800C6794:
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 000000FF
    lw      $ra, 0x0014($sp)
lbl_800C67A0:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C67AC:
# MqDbg: Audio_IsSequencePlaying
    andi    v1, a0, 0x00FF             # v1 = 00000000
    andi    t6, v1, 0x00FF             # t6 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, t6
    lbu     v0, 0x1964(v0)             # 80101964
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    andi    t7, v0, 0x0002             # t7 = 00000000
    sw      a0, 0x0020($sp)
    beq     t7, $zero, lbl_800C67E0
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C67F0
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800C67E0:
    andi    t8, v0, 0x0004             # t8 = 00000000
    beql    t8, $zero, lbl_800C67F4
    andi    a0, a1, 0x00FF             # a0 = 00000001
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800C67F0:
    andi    a0, a1, 0x00FF             # a0 = 00000001
lbl_800C67F4:
    jal     func_800CAB18
    sw      v1, 0x0018($sp)
    lw      v1, 0x0018($sp)
    andi    t9, v0, 0x00FF             # t9 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    bne     v1, t9, lbl_800C6818
    lw      $ra, 0x0014($sp)
    b       lbl_800C6818
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C6818:
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800C6820:
# MqDbg: func_800F5ACC
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    andi    a0, v0, 0x00FF             # a0 = 00000000
    addiu   $at, $zero, 0x002E         # $at = 0000002E
    beq     a0, $at, lbl_800C6884
    andi    a2, v0, 0xFFFF             # a2 = 00000000
    addiu   $at, $zero, 0x0062         # $at = 00000062
    beq     a0, $at, lbl_800C6884
    lhu     a1, 0x002A($sp)
    beq     a1, v0, lbl_800C6884
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    sw      a1, 0x001C($sp)
    jal     func_800C6BCC
    sh      a2, 0x0026($sp)
    lhu     a2, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    lw      a1, 0x001C($sp)
    beq     a2, $at, lbl_800C687C
    lui     $at, 0x8010                # $at = 80100000
    sh      a2, 0x1938($at)            # 80101938
lbl_800C687C:
    jal     func_800CAA70
    or      a0, a1, $zero              # a0 = 00000000
lbl_800C6884:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C6894:
# MqDbg: func_800F5B58
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    ori     v1, $zero, 0xFFFF          # v1 = 0000FFFF
    beq     v1, v0, lbl_800C691C
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x1938(t6)             # 80101938
    beql    v1, t6, lbl_800C6920
    lw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    ori     v1, $zero, 0xFFFF          # v1 = 0000FFFF
    lui     v0, 0x8010                 # v0 = 80100000
    andi    t9, t8, 0x0008             # t9 = 00000000
    beql    t9, $zero, lbl_800C6920
    lw      $ra, 0x0014($sp)
    lhu     v0, 0x1938(v0)             # 80101938
    lui     a0, 0x1000                 # a0 = 10000000
    bne     v1, v0, lbl_800C6908
    nop
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 100000FF
    b       lbl_800C6914
    ori     t0, $zero, 0xFFFF          # t0 = 0000FFFF
lbl_800C6908:
    jal     func_800CAA70
    or      a0, v0, $zero              # a0 = 00000000
    ori     t0, $zero, 0xFFFF          # t0 = 0000FFFF
lbl_800C6914:
    lui     $at, 0x8010                # $at = 80100000
    sh      t0, 0x1938($at)            # 80101938
lbl_800C691C:
    lw      $ra, 0x0014($sp)
lbl_800C6920:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C692C:
# MqDbg: func_800F5BF0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800C6950
    lui     $at, 0x8010                # $at = 80100000
    sh      v0, 0x1938($at)            # 80101938
lbl_800C6950:
    jal     func_800C7C90
    lbu     a0, 0x001B($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C6968:
# MqDbg: func_800F5C2C
    lui     v0, 0x8010                 # v0 = 80100000
    lhu     v0, 0x1938(v0)             # 80101938
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     v0, $at, lbl_800C6988
    sw      $ra, 0x0014($sp)
    jal     func_800CAA70
    or      a0, v0, $zero              # a0 = 80100000
lbl_800C6988:
    lw      $ra, 0x0014($sp)
    ori     t6, $zero, 0xFFFF          # t6 = 0000FFFF
    lui     $at, 0x8010                # $at = 80100000
    sh      t6, 0x1938($at)            # 80101938
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C69A0:
# MqDbg: Audio_PlayFanfare
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sh      v0, 0x0026($sp)
    andi    a0, v0, 0x00FF             # a0 = 00000000
    jal     func_800BB444
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    lhu     a0, 0x002A($sp)
    sw      v0, 0x001C($sp)
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    jal     func_800BB444
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lhu     t6, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    lw      t7, 0x001C($sp)
    beq     t6, $at, lbl_800C6A04
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    lbu     t8, 0x0000(t7)             # 00000000
    lbu     t9, 0x0000(v0)             # 00000000
    addiu   t1, $zero, 0x0005          # t1 = 00000005
    lui     $at, 0x8012                # $at = 80120000
    bne     t8, t9, lbl_800C6A10
    lui     a0, 0x1100                 # a0 = 11000000
lbl_800C6A04:
    lui     $at, 0x8012                # $at = 80120000
    b       lbl_800C6A1C
    sb      t0, 0x1F0B($at)            # 80121F0B
lbl_800C6A10:
    sb      t1, 0x1F0B($at)            # 80121F0B
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
lbl_800C6A1C:
    lw      $ra, 0x0014($sp)
    lhu     t2, 0x002A($sp)
    lui     $at, 0x8012                # $at = 80120000
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    sh      t2, 0x1F0C($at)            # 80121F0C


func_800C6A34:
# MqDbg: Audio_UpdateFanfare
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0B             # v1 = 80121F0B
    lbu     v0, 0x0000(v1)             # 80121F0B
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    beq     v0, $zero, lbl_800C6B44
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x00FF             # t7 = 000000FF
    bne     t7, $zero, lbl_800C6B44
    sb      t6, 0x0000(v1)             # 80121F0B
    lui     a0, 0xE300                 # a0 = E3000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0xE300                 # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB18
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sh      v0, 0x0026($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    lhu     t8, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    sh      v0, 0x0022($sp)
    bne     t8, $at, lbl_800C6B00
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    lui     a0, 0xC180                 # a0 = C1800000
    jal     func_800CAA70
    ori     a0, a0, 0x010A             # a0 = C180010A
    lui     a0, 0xC183                 # a0 = C1830000
    jal     func_800CAA70
    ori     a0, a0, 0x010A             # a0 = C183010A
    jal     func_800CAA70
    lui     a0, 0xC190                 # a0 = C1900000
    lhu     t9, 0x0022($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     t9, $at, lbl_800C6B00
    nop
    jal     func_800CAA70
    lui     a0, 0xC193                 # a0 = C1930000
lbl_800C6B00:
    lui     a0, 0x8012                 # a0 = 80120000
    lhu     a0, 0x1F0C(a0)             # 80121F0C
    lhu     t0, 0x0022($sp)
    lui     $at, 0x0101                # $at = 01010000
    or      a0, a0, $at                # a0 = 81130000
    jal     func_800CAA70
    sw      t0, 0x001C($sp)
    lui     a0, 0xA000                 # a0 = A0000000
    jal     func_800CAA70
    ori     a0, a0, 0xFFFF             # a0 = A000FFFF
    lw      t1, 0x001C($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    lui     a0, 0xA300                 # a0 = A3000000
    beql    t1, $at, lbl_800C6B48
    lw      $ra, 0x0014($sp)
    jal     func_800CAA70
    ori     a0, a0, 0xFFFF             # a0 = A300FFFF
lbl_800C6B44:
    lw      $ra, 0x0014($sp)
lbl_800C6B48:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C6B54:
# MqDbg: Audio_PlaySequenceWithSeqPlayerIO
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    lbu     v0, 0x0023($sp)
    sw      a3, 0x002C($sp)
    sll     a3, a3, 24
    sra     a3, a3, 24
    andi    t7, a3, 0x00FF             # t7 = 00000000
    lui     $at, 0x7000                # $at = 70000000
    sll     v0, v0, 24
    lbu     t0, 0x0033($sp)
    or      t6, v0, $at                # t6 = 70000000
    sll     t8, t7, 16
    sw      $ra, 0x0014($sp)
    or      t9, t6, t8                 # t9 = 70000000
    sw      a1, 0x0024($sp)
    sw      a2, 0x0028($sp)
    sw      v0, 0x001C($sp)
    jal     func_800CAA70
    or      a0, t9, t0                 # a0 = 70000000
    lbu     t1, 0x002B($sp)
    lw      v0, 0x001C($sp)
    lhu     t4, 0x0026($sp)
    sll     t2, t1, 16
    or      t3, v0, t2                 # t3 = 00000000
    jal     func_800CAA70
    or      a0, t3, t4                 # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C6BCC:
# MqDbg: Audio_SetSequenceMode
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x1938(t6)             # 80101938
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    bne     t6, $at, lbl_800C6E38
    andi    a1, a0, 0x00FF             # a1 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    lb      t7, 0x191C(t7)             # 8010191C
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    beq     t7, $zero, lbl_800C6C08
    nop
    addiu   a1, $zero, 0x0003          # a1 = 00000003
lbl_800C6C08:
    lhu     v0, 0x4E54(v0)             # 80124E54
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    bne     v1, v0, lbl_800C6C3C
    or      t2, v0, $zero              # t2 = 80120000
    sb      a1, 0x0033($sp)
    jal     func_800CAB18
    sw      v0, 0x0024($sp)
    addiu   $at, $zero, 0x081A         # $at = 0000081A
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    lbu     a1, 0x0033($sp)
    bne     v0, $at, lbl_800C6C3C
    lw      t2, 0x0024($sp)
    addiu   a1, $zero, 0x0003          # a1 = 00000003
lbl_800C6C3C:
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     t2, $at, lbl_800C6C7C
    andi    t9, t2, 0x00FF             # t9 = 00000000
    lui     t5, 0x8010                 # t5 = 80100000
    addu    t5, t5, t9
    lbu     t5, 0x1964(t5)             # 80101964
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    andi    t6, t5, 0x0001             # t6 = 00000000
    bne     t6, $zero, lbl_800C6C7C
    nop
    lbu     v0, 0x0000(t4)             # 8010192C
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    andi    t7, v0, 0x007F             # t7 = 00000000
    bne     t3, t7, lbl_800C6DA0
    nop
lbl_800C6C7C:
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    lbu     v0, 0x0000(t4)             # 8010192C
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    or      t1, a1, $zero              # t1 = 00000003
    andi    v0, v0, 0x007F             # v0 = 00000000
    beql    v0, a1, lbl_800C6E3C
    lw      $ra, 0x0014($sp)
    bne     t3, a1, lbl_800C6D40
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x533B(t8)             # 8012533B
    lb      v1, 0x1934(v1)             # 80101934
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    v0, t8, v1
    bgez    v0, lbl_800C6CCC
    andi    a2, v1, 0x00FF             # a2 = 00000000
    b       lbl_800C6CD0
    subu    t0, $zero, v0
lbl_800C6CCC:
    or      t0, v0, $zero              # t0 = 00000000
lbl_800C6CD0:
    andi    a3, t0, 0x00FF             # a3 = 00000000
    sw      t1, 0x001C($sp)
    jal     func_800CACA4
    sw      t2, 0x0024($sp)
    lui     a0, 0x030A                 # a0 = 030A0000
    jal     func_800CAA70
    ori     a0, a0, 0x081A             # a0 = 030A081A
    lw      t2, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      t1, 0x001C($sp)
    beq     t2, $at, lbl_800C6D34
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t9, 0x8010                 # t9 = 80100000
    lb      t9, 0x1934(t9)             # 80101934
    addiu   t5, $zero, 0x007F          # t5 = 0000007F
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    a2, t5, t9
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    jal     func_800CACA4
    sw      t1, 0x001C($sp)
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C5E4C
    lb      a0, 0x1934(a0)             # 80101934
    lw      t1, 0x001C($sp)
lbl_800C6D34:
    lui     t4, 0x8010                 # t4 = 80100000
    b       lbl_800C6D94
    addiu   t4, t4, 0x192C             # t4 = 8010192C
lbl_800C6D40:
    bne     t3, v0, lbl_800C6D94
    lui     a0, 0x130A                 # a0 = 130A0000
    ori     a0, a0, 0x00FF             # a0 = 130A00FF
    jal     func_800CAA70
    sw      t1, 0x001C($sp)
    lw      t1, 0x001C($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      a0, $zero, $zero           # a0 = 00000000
    bne     t1, $at, lbl_800C6D70
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    b       lbl_800C6D74
    or      a3, $zero, $zero           # a3 = 00000000
lbl_800C6D70:
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
lbl_800C6D74:
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    sw      t1, 0x001C($sp)
    jal     func_800C5E4C
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    lw      t1, 0x001C($sp)
lbl_800C6D94:
    addiu   t6, t1, 0x0080             # t6 = 00000080
    b       lbl_800C6E38
    sb      t6, 0x0000(t4)             # 8010192C
lbl_800C6DA0:
    bne     a1, $zero, lbl_800C6DDC
    or      t1, a1, $zero              # t1 = 00000000
    bne     v1, v0, lbl_800C6DB8
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    sw      $zero, 0x0000(a0)          # 80101948
lbl_800C6DB8:
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    lw      t7, 0x0000(a0)             # 80101948
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1944             # v0 = 80101944
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sw      $zero, 0x0000(v0)          # 80101944
    b       lbl_800C6DF8
    sw      t8, 0x0000(a0)             # 80101948
lbl_800C6DDC:
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1944             # v0 = 80101944
    lw      t5, 0x0000(v0)             # 80101944
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    addiu   t9, t5, 0x0001             # t9 = 00000001
    sw      t9, 0x0000(v0)             # 80101944
lbl_800C6DF8:
    bnel    v1, t1, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    lw      t6, 0x0000(v0)             # 80101944
    sltiu   $at, t6, 0x001E
    beql    $at, $zero, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    lw      t7, 0x0000(a0)             # 80101948
    sltiu   $at, t7, 0x0015
    bnel    $at, $zero, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    or      a1, $zero, $zero           # a1 = 00000000
    or      t1, $zero, $zero           # t1 = 00000000
    lui     $at, 0x7002                # $at = 70020000
lbl_800C6E2C:
    sb      a1, 0x0000(t4)             # 8010192C
    jal     func_800CAA70
    or      a0, t1, $at                # a0 = 70020000
lbl_800C6E38:
    lw      $ra, 0x0014($sp)
lbl_800C6E3C:
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C6E48:
# MqDbg: Audio_SetBgmEnemyVolume
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x192C(t6)             # 8010192C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x0081         # $at = 00000081
    bne     t6, $at, lbl_800C6F88
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x1930($at)           # 80101930
    lui     $at, 0x4316                # $at = 43160000
    c.eq.s  $f12, $f4
    nop
    bc1t    lbl_800C6F60
    nop
    mtc1    $at, $f2                   # $f2 = 150.00
    lui     $at, 0x43FA                # $at = 43FA0000
    c.lt.s  $f12, $f2
    nop
    bc1fl   lbl_800C6EAC
    mtc1    $at, $f6                   # $f6 = 500.00
    lui     $at, 0x43AF                # $at = 43AF0000
    mtc1    $at, $f2                   # $f2 = 350.00
    mtc1    $zero, $f0                 # $f0 = 0.00
    b       lbl_800C6EE0
    sub.s   $f8, $f2, $f0
    mtc1    $at, $f6                   # $f6 = 350.00
lbl_800C6EAC:
    lui     $at, 0x43AF                # $at = 43AF0000
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800C6ED4
    sub.s   $f0, $f12, $f2
    lui     $at, 0x43AF                # $at = 43AF0000
    mtc1    $at, $f2                   # $f2 = 350.00
    b       lbl_800C6EDC
    mov.s   $f0, $f2
    sub.s   $f0, $f12, $f2
lbl_800C6ED4:
    mtc1    $at, $f2                   # $f2 = 350.00
    nop
lbl_800C6EDC:
    sub.s   $f8, $f2, $f0
lbl_800C6EE0:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1934             # v0 = 80101934
    mul.s   $f16, $f8, $f10
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    swc1    $f12, 0x0018($sp)
    div.s   $f18, $f16, $f2
    trunc.w.s $f4, $f18
    mfc1    t8, $f4
    nop
    sb      t8, 0x0000(v0)             # 80101934
    jal     func_800CACA4
    andi    a2, t8, 0x00FF             # a2 = 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    lhu     t9, 0x4E54(t9)             # 80124E54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lwc1    $f12, 0x0018($sp)
    beq     t9, $at, lbl_800C6F60
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t0, 0x8010                 # t0 = 80100000
    lb      t0, 0x1934(t0)             # 80101934
    addiu   t1, $zero, 0x007F          # t1 = 0000007F
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    a2, t1, t0
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    jal     func_800CACA4
    swc1    $f12, 0x0018($sp)
    lwc1    $f12, 0x0018($sp)
lbl_800C6F60:
    lui     t2, 0x8012                 # t2 = 80120000
    lhu     t2, 0x4E54(t2)             # 80124E54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     a0, 0x8010                 # a0 = 80100000
    beql    t2, $at, lbl_800C6F8C
    lw      $ra, 0x0014($sp)
    lb      a0, 0x1934(a0)             # 80101934
    jal     func_800C5E4C
    swc1    $f12, 0x0018($sp)
    lwc1    $f12, 0x0018($sp)
lbl_800C6F88:
    lw      $ra, 0x0014($sp)
lbl_800C6F8C:
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f12, 0x1930($at)          # 80101930
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C6F9C:
# MqDbg: Audio_UpdateMalonSinging
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1F09(t6)             # 80121F09
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x001C($sp)
    bne     t6, $zero, lbl_800C71F0
    sw      a1, 0x0034($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB18
    swc1    $f12, 0x0030($sp)
    lhu     v1, 0x0036($sp)
    or      a0, v0, $zero              # a0 = 00000000
    sll     a0, a0, 24
    sra     a0, a0, 24
    andi    v1, v1, 0x00FF             # v1 = 00000000
    bne     v1, a0, lbl_800C70BC
    lwc1    $f12, 0x0030($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v1, $at, lbl_800C70B4
    addiu   t8, $zero, 0x007F          # t8 = 0000007F
    lui     $at, 0x44FA                # $at = 44FA0000
    mtc1    $at, $f4                   # $f4 = 2000.00
    lui     $at, 0x4348                # $at = 43480000
    c.lt.s  $f4, $f12
    nop
    bc1fl   lbl_800C7010
    mtc1    $at, $f0                   # $f0 = 200.00
    b       lbl_800C7058
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    mtc1    $at, $f0                   # $f0 = 200.00
lbl_800C7010:
    lui     $at, 0x42FE                # $at = 42FE0000
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C7030
    sub.s   $f6, $f12, $f0
    b       lbl_800C7058
    or      v1, $zero, $zero           # v1 = 00000000
    sub.s   $f6, $f12, $f0
lbl_800C7030:
    mtc1    $at, $f8                   # $f8 = 127.00
    lui     $at, 0x44E1                # $at = 44E10000
    mtc1    $at, $f16                  # $f16 = 1800.00
    mul.s   $f10, $f6, $f8
    div.s   $f18, $f10, $f16
    trunc.w.s $f4, $f18
    mfc1    v1, $f4
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
lbl_800C7058:
    subu    v0, t8, v1
    lui     $at, 0x6003                # $at = 60030000
    or      a0, v0, $at                # a0 = 60030000
    sw      v0, 0x0028($sp)
    jal     func_800CAA70
    sb      v1, 0x002E($sp)
    lw      v0, 0x0028($sp)
    lui     $at, 0x6003                # $at = 60030000
    ori     $at, $at, 0x0100           # $at = 60030100
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 60030100
    lb      v1, 0x002E($sp)
    lui     $at, 0x6003                # $at = 60030000
    ori     $at, $at, 0x0D00           # $at = 60030D00
    andi    a0, v1, 0x00FF             # a0 = 00000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 60030D00
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F08             # v1 = 80121F08
    lbu     v0, 0x0000(v1)             # 80121F08
    bne     v0, $zero, lbl_800C70B4
    addiu   t9, v0, 0x0001             # t9 = 00000001
    sb      t9, 0x0000(v1)             # 80121F08
lbl_800C70B4:
    b       lbl_800C71D4
    nop
lbl_800C70BC:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     a0, $at, lbl_800C71D4
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v1, $at, lbl_800C71D4
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    sw      v1, 0x0024($sp)
    jal     func_800CAB18
    swc1    $f12, 0x0030($sp)
    lw      v1, 0x0024($sp)
    sll     t1, v0, 24
    sra     t2, t1, 24
    beq     v1, t2, lbl_800C7138
    lwc1    $f12, 0x0030($sp)
    lui     t3, 0x8012                 # t3 = 80120000
    lbu     t3, 0x1F08(t3)             # 80121F08
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x002F          # a1 = 0000002F
    slti    $at, t3, 0x000A
    beq     $at, $zero, lbl_800C7138
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, $zero, $zero           # a3 = 00000000
    sw      $zero, 0x0010($sp)
    jal     func_800C6B54
    swc1    $f12, 0x0030($sp)
    lui     a0, 0xA300                 # a0 = A3000000
    jal     func_800CAA70
    ori     a0, a0, 0xFFFC             # a0 = A300FFFC
    addiu   t4, $zero, 0x000A          # t4 = 0000000A
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f12, 0x0030($sp)
    sb      t4, 0x1F08($at)            # 80121F08
lbl_800C7138:
    lui     $at, 0x44FA                # $at = 44FA0000
    mtc1    $at, $f6                   # $f6 = 2000.00
    lui     $at, 0x4348                # $at = 43480000
    addiu   t6, $zero, 0x007F          # t6 = 0000007F
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800C7164
    mtc1    $at, $f0                   # $f0 = 200.00
    b       lbl_800C71AC
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    mtc1    $at, $f0                   # $f0 = 200.00
lbl_800C7164:
    lui     $at, 0x42FE                # $at = 42FE0000
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C7184
    sub.s   $f8, $f12, $f0
    b       lbl_800C71AC
    or      v1, $zero, $zero           # v1 = 00000000
    sub.s   $f8, $f12, $f0
lbl_800C7184:
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     $at, 0x44E1                # $at = 44E10000
    mtc1    $at, $f18                  # $f18 = 1800.00
    mul.s   $f16, $f8, $f10
    div.s   $f4, $f16, $f18
    trunc.w.s $f6, $f4
    mfc1    v1, $f6
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
lbl_800C71AC:
    subu    v0, t6, v1
    lui     $at, 0x6303                # $at = 63030000
    or      a0, v0, $at                # a0 = 63030000
    jal     func_800CAA70
    sw      v0, 0x0028($sp)
    lw      v0, 0x0028($sp)
    lui     $at, 0x6303                # $at = 63030000
    ori     $at, $at, 0x0100           # $at = 63030100
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 63030100
lbl_800C71D4:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F08             # v1 = 80121F08
    lbu     v0, 0x0000(v1)             # 80121F08
    slti    $at, v0, 0x000A
    beq     $at, $zero, lbl_800C71F0
    addiu   t7, v0, 0x0001             # t7 = 00000001
    sb      t7, 0x0000(v1)             # 80121F08
lbl_800C71F0:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C7200:
# MqDbg: func_800F64E0
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sw      $ra, 0x001C($sp)
    beq     a0, $zero, lbl_800C725C
    sb      a0, 0x1918($at)            # 80101918
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x4800          # a0 = 00004800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a0, 0xF100                 # a0 = F1000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C7298
    lw      $ra, 0x001C($sp)
lbl_800C725C:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t7, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x4801          # a0 = 00004801
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800C7298:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C72A4:
# MqDbg: Audio_ToggleMalonSinging
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s0, 0x001C($sp)
    andi    s0, a0, 0x00FF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a0, 0x0038($sp)
    lui     $at, 0x8012                # $at = 80120000
    sw      s1, 0x0020($sp)
    sb      s0, 0x1F09($at)            # 80121F09
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   s1, $zero, 0x002F          # s1 = 0000002F
    andi    t6, v0, 0x00FF             # t6 = 00000000
    bne     s1, t6, lbl_800C72E4
    or      v1, $zero, $zero           # v1 = 00000000
    b       lbl_800C7300
    sh      $zero, 0x0034($sp)
lbl_800C72E4:
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    andi    t7, v0, 0x00FF             # t7 = 00000000
    bne     s1, t7, lbl_800C73CC
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    ori     t8, $zero, 0xFFFC          # t8 = 0000FFFC
    sh      t8, 0x0034($sp)
lbl_800C7300:
    beq     s0, $zero, lbl_800C7364
    addiu   $at, $zero, 0x0003         # $at = 00000003
    sll     s1, v1, 24
    lui     $at, 0x6000                # $at = 60000000
    or      v0, s1, $at                # v0 = 6000002F
    lui     $at, 0x0001                # $at = 00010000
    or      v0, v0, $at                # v0 = 6001002F
    or      a0, v0, $zero              # a0 = 6001002F
    sw      v0, 0x0028($sp)
    jal     func_800CAA70
    or      s0, v1, $zero              # s0 = 00000003
    lw      v0, 0x0028($sp)
    jal     func_800CAA70
    ori     a0, v0, 0x0100             # a0 = 00000100
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s0, $at, lbl_800C73CC
    lhu     t0, 0x0034($sp)
    lui     $at, 0xA000                # $at = A0000000
    ori     t1, t0, 0x0003             # t1 = 00000003
    andi    t2, t1, 0xFFFF             # t2 = 00000003
    or      t9, s1, $at                # t9 = A000002F
    jal     func_800CAA70
    or      a0, t9, t2                 # a0 = A000002F
    b       lbl_800C73D0
    lw      $ra, 0x0024($sp)
lbl_800C7364:
    bne     v1, $at, lbl_800C7384
    or      s0, v1, $zero              # s0 = 00000000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x002F          # a1 = 0000002F
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, $zero, $zero           # a3 = 00000000
    jal     func_800C6B54
    sw      $zero, 0x0010($sp)
lbl_800C7384:
    sll     s1, s0, 24
    lui     $at, 0x6000                # $at = 60000000
    or      v0, s1, $at                # v0 = 6000002F
    lui     $at, 0x0001                # $at = 00010000
    or      v0, v0, $at                # v0 = 6001002F
    ori     a0, v0, 0x007F             # a0 = 6001007F
    jal     func_800CAA70
    sw      v0, 0x0028($sp)
    lw      a0, 0x0028($sp)
    jal     func_800CAA70
    ori     a0, a0, 0x017F             # a0 = 0000017F
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s0, $at, lbl_800C73CC
    lhu     t4, 0x0034($sp)
    lui     $at, 0xA000                # $at = A0000000
    or      t3, s1, $at                # t3 = A000002F
    jal     func_800CAA70
    or      a0, t3, t4                 # a0 = A000002F
lbl_800C73CC:
    lw      $ra, 0x0024($sp)
lbl_800C73D0:
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800C73E0:
# MqDbg: Audio_SetEnvReverb
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    andi    t6, a0, 0x007F             # t6 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      t6, 0x1924($at)            # 80101924


func_800C73FC:
# MqDbg: Audio_SetCodeReverb
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    beq     a0, $zero, lbl_800C7418
    andi    t6, a0, 0x007F             # t6 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x1928($at)            # 80101928
lbl_800C7418:
    jr      $ra
    nop


func_800C7420:
# MqDbg: func_800F6700
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    beq     a0, $zero, lbl_800C7464
    sw      $ra, 0x0014($sp)
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    beq     a0, v0, lbl_800C7474
    addiu   t6, $zero, 0x0003          # t6 = 00000003
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    beq     a0, v1, lbl_800C7488
    lui     $at, 0x8010                # $at = 80100000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     a0, $at, lbl_800C7494
    nop
    b       lbl_800C74A4
    lbu     a0, 0x001F($sp)
lbl_800C7464:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x001F($sp)
    b       lbl_800C74A0
    sb      $zero, 0x1914($at)         # 80101914
lbl_800C7474:
    addiu   t7, $zero, 0x0003          # t7 = 00000003
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x001F($sp)
    b       lbl_800C74A0
    sb      t7, 0x1914($at)            # 80101914
lbl_800C7488:
    sb      v0, 0x001F($sp)
    b       lbl_800C74A0
    sb      v0, 0x1914($at)            # 80101914
lbl_800C7494:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x001F($sp)
    sb      v1, 0x1914($at)            # 80101914
lbl_800C74A0:
    lbu     a0, 0x001F($sp)
lbl_800C74A4:
    lui     $at, 0xE000                # $at = E0000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = E0000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C74C0:
# MqDbg: Audio_SetBaseFilter
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x194C(v1)             # 8010194C
    lbu     v0, 0x0023($sp)
    sw      $ra, 0x001C($sp)
    beql    v0, v1, lbl_800C752C
    lbu     t7, 0x0023($sp)
    bne     v0, $zero, lbl_800C74F8
    nop
    jal     func_800C9884
    addiu   a0, $zero, 0x086B          # a0 = 0000086B
    b       lbl_800C752C
    lbu     t7, 0x0023($sp)
lbl_800C74F8:
    bne     v1, $zero, lbl_800C7528
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x086B          # a0 = 0000086B
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
lbl_800C7528:
    lbu     t7, 0x0023($sp)
lbl_800C752C:
    lw      $ra, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x194C($at)            # 8010194C
    lui     $at, 0x8010                # $at = 80100000
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    sb      t7, 0x1954($at)            # 80101954


func_800C7548:
# MqDbg: Audio_SetExtraFilter
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a0, 0x0028($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      a0, 0x1958($at)            # 80101958
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x4E54(t6)             # 80124E54
    lui     $at, 0x8010                # $at = 80100000
    sb      a0, 0x1950($at)            # 80101950
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    bne     t6, $at, lbl_800C75C4
    sw      s0, 0x0018($sp)
    sll     s1, a0, 24
    sra     s1, s1, 24
    or      s0, $zero, $zero           # s0 = 00000000
    lui     s2, 0x0600                 # s2 = 06000000
    andi    t7, s0, 0x00FF             # t7 = 00000000
lbl_800C7598:
    sll     t8, t7,  8
    or      a0, t8, s2                 # a0 = 06000000
    sll     a1, s1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0006             # a0 = 06000006
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C7598
    andi    t7, s0, 0x00FF             # t7 = 00000001
lbl_800C75C4:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C75DC:
# MqDbg: Audio_SetCutsceneFlag
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      a0, 0x191C($at)            # 8010191C


func_800C75F4:
# MqDbg: Audio_PlaySfxGeneralIfNotInCutscene
    lui     t6, 0x8010                 # t6 = 80100000
    lb      t6, 0x191C(t6)             # 8010191C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    andi    a2, a2, 0x00FF             # a2 = 00000000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    bne     t6, $zero, lbl_800C762C
    sw      $ra, 0x001C($sp)
    lw      t7, 0x0030($sp)
    lw      t8, 0x0034($sp)
    sw      t7, 0x0010($sp)
    jal     func_800C806C
    sw      t8, 0x0014($sp)
lbl_800C762C:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C763C:
# MqDbg: Audio_PlaySfxIfNotInCutscene
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    jal     func_800C75F4
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C7684:
# MqDbg: func_800F6964
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    andi    a1, a0, 0xFFFF             # a1 = 00000000
    sll     v0, a1,  2
    subu    v0, v0, a1
    sw      $ra, 0x0034($sp)
    sw      s7, 0x0030($sp)
    sw      a0, 0x0050($sp)
    sw      s6, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s7, a1, $zero              # s7 = 00000000
    bgez    v0, lbl_800C76CC
    addu    $at, v0, $zero
    addiu   $at, v0, 0x0001            # $at = 00000001
lbl_800C76CC:
    sra     v0, $at,  1
    lui     $at, 0x1000                # $at = 10000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    ori     $at, $at, 0x00FF           # $at = 100000FF
    or      a0, v0, $at                # a0 = 100000FF
    jal     func_800CAA70
    sw      v0, 0x003C($sp)
    lw      a0, 0x003C($sp)
    lui     $at, 0x1100                # $at = 11000000
    ori     $at, $at, 0x00FF           # $at = 110000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 110000FF
    lui     s6, 0x8010                 # s6 = 80100000
    addiu   s6, s6, 0x43C0             # s6 = 801043C0
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   s5, $zero, 0x000A          # s5 = 0000000A
    lui     s4, 0x6200                 # s4 = 62000000
    addiu   s3, $zero, 0x000D          # s3 = 0000000D
    addiu   s2, $zero, 0x000C          # s2 = 0000000C
    addiu   s1, $zero, 0x000B          # s1 = 0000000B
lbl_800C7724:
    beq     s1, v0, lbl_800C7744
    or      v1, $zero, $zero           # v1 = 00000000
    beql    v0, s2, lbl_800C7748
    lbu     t6, 0x0000(s6)             # 801043C0
    beql    v0, s3, lbl_800C775C
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    b       lbl_800C775C
    nop
lbl_800C7744:
    lbu     t6, 0x0000(s6)             # 801043C0
lbl_800C7748:
    bne     s5, t6, lbl_800C775C
    nop
    b       lbl_800C775C
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C775C:
    bne     v1, $zero, lbl_800C777C
    sra     t7, s7,  1
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8, 16
    or      t0, t9, s4                 # t0 = 62000000
    sll     t1, v0,  8
    jal     func_800CAA70
    or      a0, t0, t1                 # a0 = 62000000
lbl_800C777C:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C7724
    or      v0, s0, $zero              # v0 = 00000001
    lw      a0, 0x003C($sp)
    lui     $at, 0x1300                # $at = 13000000
    ori     $at, $at, 0x00FF           # $at = 130000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 130000FF
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    lw      s6, 0x002C($sp)
    lw      s7, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800C77D0:
# MqDbg: Audio_StopBgmAndFanfare
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    or      a1, a0, $zero              # a1 = 00000000
    andi    v0, a1, 0x00FF             # v0 = 00000000
    lui     $at, 0x1000                # $at = 10000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    ori     $at, $at, 0x00FF           # $at = 100000FF
    sll     v0, v0, 16
    or      a0, v0, $at                # a0 = 100000FF
    jal     func_800CAA70
    sw      v0, 0x001C($sp)
    lw      a0, 0x001C($sp)
    lui     $at, 0x1100                # $at = 11000000
    ori     $at, $at, 0x00FF           # $at = 110000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 110000FF
    lw      a0, 0x001C($sp)
    lui     $at, 0x1300                # $at = 13000000
    ori     $at, $at, 0x00FF           # $at = 130000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 130000FF
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C785C:
# MqDbg: func_800F6B3C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7888:
# MqDbg: Audio_DisableAllSeq
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8300                 # a0 = 83000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8301                 # a0 = 83010000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8302                 # a0 = 83020000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8303                 # a0 = 83030000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800BB140
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C78D8:
# MqDbg: func_800F6BB8
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BBC40
    nop
    lw      $ra, 0x0014($sp)
    sll     v0, v0, 24
    sra     v0, v0, 24
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C78FC:
# MqDbg: func_800F6BDC
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800C7888
    nop
    jal     func_800BB140
    nop
lbl_800C7914:
    jal     func_800C78D8
    nop
    bne     v0, $zero, lbl_800C7914
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7934:
# MqDbg: Audio_PreNMI
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BB5E4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7954:
# MqDbg: func_800F6C34
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x192C($at)         # 8010192C
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x1DC0($at)           # 80121DC0
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x1DC8($at)           # 80121DC8
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x194C($at)         # 8010194C
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1950($at)         # 80101950
    lui     $at, 0x8010                # $at = 80100000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sb      $zero, 0x1954($at)         # 80101954
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1958($at)         # 80101958
    jal     func_800C2C90
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     v0, 0x8012                 # v0 = 80120000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1DE0             # v1 = 80121DE0
    addiu   v0, v0, 0x1DD0             # v0 = 80121DD0
    sw      $zero, 0x000C(v0)          # 80121DDC
    sw      $zero, 0x000C(v1)          # 80121DEC
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x0000(v0)            # 80121DD0
    swc1    $f0, 0x0000(v1)            # 80121DE0
    swc1    $f0, 0x1DF0($at)           # 80121DF0
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    lui     $at, 0x8012                # $at = 80120000
    sb      a2, 0x1DFC($at)            # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    sb      a2, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFE($at)         # 80121DFE
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x43C0(t7)             # 801043C0
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFF($at)         # 80121DFF
    lui     $at, 0x8012                # $at = 80120000
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t6, 0x1E00($at)            # 80121E00
    addu    t8, t8, t7
    lb      t8, 0x19D4(t8)             # 801019D4
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F08($at)         # 80121F08
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x1920($at)            # 80101920
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1918($at)         # 80101918
    lui     $at, 0x8010                # $at = 80100000
    ori     t9, $zero, 0xFFFF          # t9 = 0000FFFF
    sh      t9, 0x1938($at)            # 80101938
    lui     a0, 0x4600                 # a0 = 46000000
    jal     func_800BB0E0
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x195C($at)         # 8010195C
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F0B($at)         # 80121F0B
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sb      t0, 0x1F0A($at)            # 80121F0A
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F09($at)         # 80121F09
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C7A78:
# MqDbg: Audio_SetNatureAmbienceChannelIO
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x4E54(t6)             # 80124E54
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    s1, a0, 0x00FF             # s1 = 00000000
    andi    s2, a1, 0x00FF             # s2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0040($sp)
    sw      a1, 0x0044($sp)
    beq     t6, $at, lbl_800C7ACC
    sw      a2, 0x0048($sp)
    lui     a1, 0xF000                 # a1 = F0000000
    ori     a1, a1, 0x00FF             # a1 = F00000FF
    jal     func_800CAB80
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    bne     v0, $zero, lbl_800C7B6C
lbl_800C7ACC:
    sll     t7, s1,  8
    addu    t8, t7, s2
    addiu   $at, $zero, 0x0101         # $at = 00000101
    or      s0, s1, $zero              # s0 = 00000000
    bne     t8, $at, lbl_800C7B04
    or      a1, s2, $zero              # a1 = 00000000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    jal     func_800CAB18
    sw      s2, 0x0034($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     v0, $at, lbl_800C7B04
    lw      a1, 0x0034($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F08($at)         # 80121F08
lbl_800C7B04:
    sra     v0, s0,  4
    andi    a0, s0, 0x000F             # a0 = 00000000
    andi    t9, v0, 0x00FF             # t9 = 00000000
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     t9, $zero, lbl_800C7B20
    andi    a2, a0, 0x00FF             # a2 = 00000000
    andi    v1, a0, 0x00FF             # v1 = 00000000
lbl_800C7B20:
    andi    t0, a0, 0x00FF             # t0 = 00000000
    slt     $at, t0, v1
    bne     $at, $zero, lbl_800C7B6C
    andi    s0, v1, 0x00FF             # s0 = 00000000
    sll     s3, a1, 16
    lui     $at, 0x8000                # $at = 80000000
    or      s3, s3, $at                # s3 = 80000000
    or      s2, a2, $zero              # s2 = 00000000
    or      s1, s0, $zero              # s1 = 00000000
    lbu     s4, 0x004B($sp)
lbl_800C7B48:
    sll     t1, s1,  8
    or      t2, s3, t1                 # t2 = 80000000
    jal     func_800CAA70
    or      a0, t2, s4                 # a0 = 80000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s2, s0
    beq     $at, $zero, lbl_800C7B48
    or      s1, s0, $zero              # s1 = 00000001
lbl_800C7B6C:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800C7B8C:
# MqDbg: Audio_StartNatureAmbienceSequence
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0014($sp)
    andi    s0, a0, 0xFFFF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0018($sp)
    sw      a0, 0x0028($sp)
    andi    s1, a1, 0xFFFF             # s1 = 00000000
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      a1, 0x002C($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    bne     v0, $at, lbl_800C7BD8
    lui     a0, 0x7000                 # a0 = 70000000
    jal     func_800C4C84
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
    b       lbl_800C7C78
    lw      $ra, 0x0024($sp)
lbl_800C7BD8:
    jal     func_800CAA70
    ori     a0, a0, 0x0001             # a0 = 00000001
    sra     a0, s0,  8
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x7004                # $at = 70040000
    or      a0, a0, $at                # a0 = 70040000
    jal     func_800CAA70
    or      s3, s0, $zero              # s3 = 00000000
    or      a0, s3, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x7005                # $at = 70050000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 70050000
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    jal     func_800CAA70
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    or      s2, s1, $zero              # s2 = 00000000
    lui     s1, 0x8001                 # s1 = 80010000
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C7C38:
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sllv    v1, t6, v0
    and     t7, s2, v1
    bne     t7, $zero, lbl_800C7C60
    and     t8, s3, v1
    beq     t8, $zero, lbl_800C7C60
    sll     t9, v0,  8
    or      a0, t9, s1                 # a0 = 80010000
    jal     func_800CAA70
    ori     a0, a0, 0x0001             # a0 = 80010001
lbl_800C7C60:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C7C38
    or      v0, s0, $zero              # v0 = 00000001
    lw      $ra, 0x0024($sp)
lbl_800C7C78:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C7C90:
# MqDbg: Audio_PlayNatureAmbienceSequence
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     v0, 0x8012                 # v0 = 80120000
    lhu     v0, 0x4E54(v0)             # 80124E54
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    andi    s1, a0, 0x00FF             # s1 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      a0, 0x0030($sp)
    beq     v0, $at, lbl_800C7CE0
    or      s0, $zero, $zero           # s0 = 00000000
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    andi    t9, t8, 0x0080             # t9 = 00000000
    bne     t9, $zero, lbl_800C7DB4
lbl_800C7CE0:
    sll     t0, s1,  2
    subu    t0, t0, s1
    sll     t0, t0,  2
    lui     s3, 0x8010                 # s3 = 80100000
    addu    t0, t0, s1
    addiu   s3, s3, 0x19E8             # s3 = 801019E8
    sll     t0, t0,  3
    addu    v0, s3, t0
    lhu     a0, 0x0000(v0)             # 80120000
    jal     func_800C7B8C
    lhu     a1, 0x0002(v0)             # 80120002
    sll     t1, s1,  2
    subu    t1, t1, s1
    sll     t1, t1,  2
    addu    t1, t1, s1
    sll     t1, t1,  3
    addu    s2, s3, t1
    lbu     t2, 0x0004(s2)             # 00000004
    addiu   s4, $zero, 0x00FF          # s4 = 000000FF
    addu    t3, s2, s0
    beq     s4, t2, lbl_800C7D9C
    lui     s3, 0x8000                 # s3 = 80000000
    lbu     s1, 0x0004(t3)             # 00000004
    addiu   s0, s0, 0x0001             # s0 = 00000001
lbl_800C7D40:
    andi    s0, s0, 0x00FF             # s0 = 00000001
    addu    t4, s2, s0
    lbu     v1, 0x0004(t4)             # 00000004
    addiu   s0, s0, 0x0001             # s0 = 00000002
    andi    s0, s0, 0x00FF             # s0 = 00000002
    andi    v0, s1, 0x00FF             # v0 = 00000000
    addu    t5, s2, s0
    sll     t6, v1, 16
    lbu     a1, 0x0004(t5)             # 00000004
    or      t7, t6, s3                 # t7 = 80000000
    sll     t8, v0,  8
    addiu   s0, s0, 0x0001             # s0 = 00000003
    or      t9, t7, t8                 # t9 = 80000000
    andi    s0, s0, 0x00FF             # s0 = 00000003
    jal     func_800CAA70
    or      a0, t9, a1                 # a0 = 80000000
    addu    t0, s2, s0
    lbu     s1, 0x0004(t0)             # 00000004
    slti    $at, s0, 0x0064
    beq     s4, s1, lbl_800C7D9C
    nop
    bnel    $at, $zero, lbl_800C7D40
    addiu   s0, s0, 0x0001             # s0 = 00000004
lbl_800C7D9C:
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x1914(a0)             # 80101914
    lui     $at, 0x8007                # $at = 80070000
    ori     $at, $at, 0x0D00           # $at = 80070D00
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 80170D00
lbl_800C7DB4:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C7DD4:
# MqDbg: Audio_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800B8654
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7DF8:
# MqDbg: Audio_InitSound
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800C7954
    nop
    jal     func_800C3D68
    nop
    jal     func_800C4C1C
    nop
    jal     func_800CB918
    nop
    jal     func_800C9BDC
    nop
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7E4C:
# MqDbg: func_800F7170
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800BB140
    nop
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7E98:
# MqDbg: func_800F71BC
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, 0x0018($sp)
    jal     func_800C7954
    sb      t6, 0x43C4($at)            # 801043C4
    jal     func_800C3D68
    nop
    jal     func_800C4C1C
    nop
    jal     func_800CB85C
    nop
    jal     func_800C9BDC
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7EE4:
# MqDbg: func_800F7208
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CB85C
    nop
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800C7954
    nop
    jal     func_800C4C1C
    nop
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop
    nop
