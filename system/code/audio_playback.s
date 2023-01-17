# Audio Playback
#
# Starts at VRAM: 800BBF00 / VROM: B31E60
#

.section .text
func_800BBF00:
# MqDbg: Audio_InitNoteSub
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    lbu     t7, 0x0002(a2)             # 00000002
    lbu     v0, 0x0035(a0)             # 00000035
    lwc1    $f2, 0x0008(a2)            # 00000008
    sb      t7, 0x0027($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    addiu   t9, $sp, 0x0024            # t9 = FFFFFFDC
    or      a3, a1, $zero              # a3 = 00000000
    sb      t8, 0x0026($sp)
    lbu     t1, 0x0003(a2)             # 00000003
    or      a0, a1, $zero              # a0 = 00000000
    sb      t1, 0x0000(t9)             # FFFFFFDC
    lw      t2, 0x0048($sp)
    lbu     t4, 0x00C0(t2)             # 000000C0
    sb      t4, 0x0000(a1)             # 00000000
    lw      t5, 0x0048($sp)
    lbu     t7, 0x00C1(t5)             # 000000C1
    sb      t7, 0x0001(a1)             # 00000001
    lw      t8, 0x0048($sp)
    lw      t9, 0x00D0(t8)             # 000000D0
    sw      t9, 0x0010(a1)             # 00000010
    lw      t0, 0x0048($sp)
    lbu     t1, 0x00C6(t0)             # 000000C6
    sb      t1, 0x0006(a1)             # 00000006
    lw      a1, 0x0004(a2)             # 00000004
    sw      a3, 0x004C($sp)
    sw      a2, 0x0050($sp)
    sw      v0, 0x0020($sp)
    jal     func_800BC378
    swc1    $f2, 0x0028($sp)
    lbu     t2, 0x0027($sp)
    lw      a3, 0x004C($sp)
    lw      v0, 0x0020($sp)
    andi    t3, t2, 0x007F             # t3 = 00000000
    sb      t3, 0x0027($sp)
    lbu     t4, 0x0000(a3)             # 00000000
    lw      a2, 0x0050($sp)
    lwc1    $f2, 0x0028($sp)
    andi    t6, t4, 0xFFF7             # t6 = 00000000
    andi    t3, t6, 0x00FB             # t3 = 00000000
    sb      t6, 0x0000(a3)             # 00000000
    sb      t3, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t4, t3, 0x00FD             # t4 = 00000000
    mtc1    $zero, $f0                 # $f0 = 0.00
    sll     t9, t8,  6
    srl     t0, t9, 31
    sll     t1, t0,  1
    andi    t2, t1, 0x0002             # t2 = 00000000
    or      t9, t2, t4                 # t9 = 00000000
    sb      t9, 0x0000(a3)             # 00000000
    lbu     t7, 0x0024($sp)
    andi    t0, t9, 0x00FE             # t0 = 00000000
    lui     t3, 0x8012                 # t3 = 80120000
    andi    t8, t7, 0x0001             # t8 = 00000000
    or      t1, t8, t0                 # t1 = 00000000
    beq     v0, $zero, lbl_800BC070
    sb      t1, 0x0000(a3)             # 00000000
    lb      t3, 0x7ECA(t3)             # 80127ECA
    lbu     v1, 0x0027($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t3, $at, lbl_800BC070
    sra     v1, v1,  1
    slti    $at, v1, 0x0040
    bne     $at, $zero, lbl_800BC014
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   v1, $zero, 0x003F          # v1 = 0000003F
lbl_800BC014:
    sll     v0, v1,  1
    addu    t2, t2, v0
    lhu     t2, 0x0E34(t2)             # 80100E34
    subu    t4, $zero, v0
    lui     t5, 0x8010                 # t5 = 80100000
    lbu     t7, 0x0001(a3)             # 00000001
    addu    t5, t5, t4
    sb      t2, 0x0004(a3)             # 00000004
    lhu     t5, 0x0EB2(t5)             # 80100EB2
    ori     t9, t7, 0x0001             # t9 = 00000001
    sb      t9, 0x0001(a3)             # 00000001
    sb      t5, 0x0003(a3)             # 00000003
    lbu     t8, 0x0027($sp)
    lui     $at, 0x8010                # $at = 80100000
    sll     t0, t8,  2
    addu    $at, $at, t0
    lwc1    $f12, 0x0F38($at)          # 80100F38
    sll     t1, t8,  2
    subu    t3, $zero, t1
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t3
    b       lbl_800BC2D4
    lwc1    $f14, 0x1134($at)          # 80101134
lbl_800BC070:
    lui     v1, 0x8012                 # v1 = 80120000
    beq     v0, $zero, lbl_800BC23C
    lb      v1, 0x7ECA(v1)             # 80127ECA
    bnel    v1, $zero, lbl_800BC240
    addiu   $at, $zero, 0x0003         # $at = 00000003
    lbu     t2, 0x0001(a3)             # 00000001
    sb      $zero, 0x0003(a3)          # 00000003
    sb      $zero, 0x0004(a3)          # 00000004
    andi    t4, t2, 0xFFFE             # t4 = 00000000
    sb      t4, 0x0001(a3)             # 00000001
    lbu     t5, 0x0027($sp)
    lui     $at, 0x8010                # $at = 80100000
    or      v1, $zero, $zero           # v1 = 00000000
    sll     t6, t5,  2
    addu    $at, $at, t6
    lwc1    $f12, 0x1138($at)          # 80101138
    sll     t7, t5,  2
    subu    t9, $zero, t7
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t9
    lwc1    $f14, 0x1334($at)          # 80101334
    slti    $at, t5, 0x0020
    beq     $at, $zero, lbl_800BC0D8
    or      a0, $zero, $zero           # a0 = 00000000
    b       lbl_800BC0EC
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800BC0D8:
    lbu     t0, 0x0027($sp)
    slti    $at, t0, 0x0061
    bnel    $at, $zero, lbl_800BC0F0
    lbu     t2, 0x0000(a3)             # 00000000
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800BC0EC:
    lbu     t2, 0x0000(a3)             # 00000000
lbl_800BC0F0:
    sll     t1, v1,  3
    andi    t3, t1, 0x0008             # t3 = 00000000
    andi    t4, t2, 0xFFF7             # t4 = 00000000
    or      t0, t3, t4                 # t0 = 00000000
    sll     t9, a0,  2
    andi    t5, t9, 0x0004             # t5 = 00000000
    andi    t8, t0, 0x00FB             # t8 = 00000000
    sb      t0, 0x0000(a3)             # 00000000
    or      t1, t5, t8                 # t1 = 00000000
    sb      t1, 0x0000(a3)             # 00000000
    lw      v0, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     v0, v0,  2
    srl     v0, v0, 30
    beql    v0, $zero, lbl_800BC2D8
    c.lt.s  $f2, $f0
    beq     v0, $at, lbl_800BC158
    lw      t2, 0x0024($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800BC19C
    lw      t0, 0x0024($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800BC1EC
    lw      t0, 0x0024($sp)
    b       lbl_800BC2D8
    c.lt.s  $f2, $f0
lbl_800BC158:
    lbu     t9, 0x0000(a3)             # 00000000
    sll     t3, t2,  4
    srl     t4, t3, 31
    sll     t6, t4,  3
    andi    t7, t6, 0x0008             # t7 = 00000000
    andi    t0, t9, 0xFFF7             # t0 = 00000001
    or      t6, t7, t0                 # t6 = 00000001
    sb      t6, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t9, t6, 0x00FB             # t9 = 00000001
    sll     t1, t8,  5
    srl     t2, t1, 31
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000001
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC19C:
    sll     t5, t0,  4
    lbu     t4, 0x0000(a3)             # 00000000
    srl     t8, t5, 31
    or      t2, t8, v1                 # t2 = 00000001
    sll     t3, t2,  3
    andi    t6, t3, 0x0008             # t6 = 00000000
    andi    t9, t4, 0xFFF7             # t9 = 00000000
    or      t7, t6, t9                 # t7 = 00000000
    sb      t7, 0x0000(a3)             # 00000000
    lw      t0, 0x0024($sp)
    or      t6, t7, $zero              # t6 = 00000000
    andi    t9, t6, 0x00FB             # t9 = 00000000
    sll     t5, t0,  5
    srl     t8, t5, 31
    or      t2, t8, a0                 # t2 = 00000001
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000000
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC1EC:
    sll     t5, t0,  4
    lbu     t4, 0x0000(a3)             # 00000000
    srl     t8, t5, 31
    xor     t2, t8, v1
    sll     t3, t2,  3
    andi    t6, t3, 0x0008             # t6 = 00000000
    andi    t9, t4, 0xFFF7             # t9 = 00000000
    or      t7, t6, t9                 # t7 = 00000000
    sb      t7, 0x0000(a3)             # 00000000
    lw      t0, 0x0024($sp)
    or      t6, t7, $zero              # t6 = 00000000
    andi    t9, t6, 0x00FB             # t9 = 00000000
    sll     t5, t0,  5
    srl     t8, t5, 31
    xor     t2, t8, a0
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000000
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC23C:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_800BC240:
    bne     v1, $at, lbl_800BC26C
    lw      t2, 0x0024($sp)
    lbu     t0, 0x0000(a3)             # 00000000
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f14, -0x6660($at)         # 801099A0
    andi    t8, t0, 0xFFFD             # t8 = 00000001
    sb      t8, 0x0000(a3)             # 00000000
    andi    t1, t8, 0x00FE             # t1 = 00000000
    sb      t1, 0x0000(a3)             # 00000000
    b       lbl_800BC2D4
    mov.s   $f12, $f14
lbl_800BC26C:
    lbu     t7, 0x0000(a3)             # 00000000
    sll     t3, t2,  4
    srl     t6, t3, 31
    sll     t4, t6,  3
    andi    t9, t4, 0x0008             # t9 = 00000000
    andi    t0, t7, 0xFFF7             # t0 = 00000000
    or      t4, t9, t0                 # t4 = 00000000
    sb      t4, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t7, t4, 0x00FB             # t7 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sll     t1, t8,  5
    srl     t2, t1, 31
    sll     t3, t2,  2
    andi    t6, t3, 0x0004             # t6 = 00000000
    or      t9, t6, t7                 # t9 = 00000000
    sb      t9, 0x0000(a3)             # 00000000
    lbu     t0, 0x0027($sp)
    sll     t5, t0,  2
    addu    $at, $at, t5
    lwc1    $f12, 0x1338($at)          # 80101338
    sll     t8, t0,  2
    subu    t1, $zero, t8
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t1
    lwc1    $f14, 0x1534($at)          # 80101534
lbl_800BC2D4:
    c.lt.s  $f2, $f0
lbl_800BC2D8:
    lui     $at, 0x3F80                # $at = 3F800000
    bc1fl   lbl_800BC2EC
    mtc1    $at, $f0                   # $f0 = 1.00
    mov.s   $f2, $f0
    mtc1    $at, $f0                   # $f0 = 1.00
lbl_800BC2EC:
    nop
    c.lt.s  $f0, $f2
    nop
    bc1f    lbl_800BC304
    nop
    mov.s   $f2, $f0
lbl_800BC304:
    mul.s   $f4, $f2, $f12
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x665C($at)          # 801099A4
    mul.s   $f6, $f4, $f0
    nop
    mul.s   $f10, $f2, $f14
    trunc.w.s $f8, $f6
    mul.s   $f16, $f10, $f0
    mfc1    t3, $f8
    nop
    sh      t3, 0x0008(a3)             # 00000008
    trunc.w.s $f18, $f16
    mfc1    t6, $f18
    nop
    sh      t6, 0x000A(a3)             # 0000000A
    lbu     t7, 0x0001(a2)             # 00000001
    sb      t7, 0x0002(a3)             # 00000002
    lw      t9, 0x0010(a2)             # 00000010
    sw      t9, 0x0014(a3)             # 00000014
    lbu     t5, 0x0014(a2)             # 00000014
    sb      t5, 0x0007(a3)             # 00000007
    lhu     t0, 0x0016(a2)             # 00000016
    sh      t0, 0x000E(a3)             # 0000000E
    lbu     t8, 0x0026($sp)
    sb      t8, 0x0005(a3)             # 00000005
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800BC378:
# MqDbg: Audio_NoteSetResamplingRate
    lui     $at, 0x4000                # $at = 40000000
    mtc1    a1, $f12                   # $f12 = 0.00
    mtc1    $at, $f4                   # $f4 = 2.00
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f12, $f4
    nop
    bc1fl   lbl_800BC3C8
    lbu     t9, 0x0001(a0)             # 00000001
    lwc1    $f2, -0x6658($at)          # 801099A8
    lbu     t6, 0x0001(a0)             # 00000001
    c.lt.s  $f2, $f12
    andi    t7, t6, 0xFFFD             # t7 = 00000000
    sb      t7, 0x0001(a0)             # 00000001
    bc1f    lbl_800BC3BC
    nop
    b       lbl_800BC408
    mov.s   $f0, $f2
lbl_800BC3BC:
    b       lbl_800BC408
    mov.s   $f0, $f12
    lbu     t9, 0x0001(a0)             # 00000001
lbl_800BC3C8:
    lui     $at, 0x8011                # $at = 80110000
    ori     t0, t9, 0x0002             # t0 = 00000002
    sb      t0, 0x0001(a0)             # 00000001
    lwc1    $f6, -0x6654($at)          # 801099AC
    lui     $at, 0x3F00                # $at = 3F000000
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800BC3FC
    mtc1    $at, $f8                   # $f8 = 0.50
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BC408
    lwc1    $f0, -0x6650($at)          # 801099B0
    mtc1    $at, $f8                   # $f8 = 0.00
lbl_800BC3FC:
    nop
    mul.s   $f0, $f12, $f8
    nop
lbl_800BC408:
    lui     $at, 0x4700                # $at = 47000000
    mtc1    $at, $f10                  # $f10 = 32768.00
    nop
    mul.s   $f16, $f0, $f10
    trunc.w.s $f18, $f16
    mfc1    t2, $f18
    jr      $ra
    sh      t2, 0x000C(a0)             # 0000000C


func_800BC428:
# MqDbg: Audio_NoteInit
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0044(a0)             # 00000044
    or      a3, a0, $zero              # a3 = 00000000
    addiu   a2, a3, 0x0036             # a2 = 00000036
    lbu     t6, 0x0018(v0)             # 00000018
    bnel    t6, $zero, lbl_800BC46C
    lw      a1, 0x001C(v0)             # 0000001C
    lw      t7, 0x0050(v0)             # 00000050
    addiu   a0, a0, 0x0070             # a0 = 00000070
    addiu   a2, a3, 0x0036             # a2 = 00000036
    lw      a1, 0x0080(t7)             # 00000080
    jal     func_800BE5A4
    sw      a3, 0x0018($sp)
    b       lbl_800BC47C
    lw      a3, 0x0018($sp)
    lw      a1, 0x001C(v0)             # 0000001C
lbl_800BC46C:
    sw      a3, 0x0018($sp)
    jal     func_800BE5A4
    addiu   a0, a3, 0x0070             # a0 = 00000070
    lw      a3, 0x0018($sp)
lbl_800BC47C:
    lbu     t8, 0x0070(a3)             # 00000070
    lui     t1, 0x8010                 # t1 = 80100000
    sb      $zero, 0x0034(a3)          # 00000034
    andi    t9, t8, 0xFFF0             # t9 = 00000000
    ori     t0, t9, 0x0001             # t0 = 00000001
    sb      t0, 0x0070(a3)             # 00000070
    addiu   t1, t1, 0x0E14             # t1 = 80100E14
    lw      t3, 0x0000(t1)             # 80100E14
    sw      t3, 0x00C0(a3)             # 000000C0
    lw      t2, 0x0004(t1)             # 80100E18
    sw      t2, 0x00C4(a3)             # 000000C4
    lw      t3, 0x0008(t1)             # 80100E1C
    sw      t3, 0x00C8(a3)             # 000000C8
    lw      t2, 0x000C(t1)             # 80100E20
    sw      t2, 0x00CC(a3)             # 000000CC
    lw      t3, 0x0010(t1)             # 80100E24
    sw      t3, 0x00D0(a3)             # 000000D0
    lw      t2, 0x0014(t1)             # 80100E28
    sw      t2, 0x00D4(a3)             # 000000D4
    lw      t3, 0x0018(t1)             # 80100E2C
    sw      t3, 0x00D8(a3)             # 000000D8
    lw      t2, 0x001C(t1)             # 80100E30
    sw      t2, 0x00DC(a3)             # 000000DC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BC4E8:
# MqDbg: Audio_NoteDisable
    lw      t6, 0x00C0(a0)             # 000000C0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    mtc1    $zero, $f4                 # $f4 = 0.00
    sll     t7, t6,  1
    srl     t8, t7, 31
    bne     t8, $at, lbl_800BC510
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    lbu     t9, 0x00C0(a0)             # 000000C0
    andi    t0, t9, 0xFFBF             # t0 = 00000000
    sb      t0, 0x00C0(a0)             # 000000C0
lbl_800BC510:
    lbu     t1, 0x00C0(a0)             # 000000C0
    lbu     t5, 0x0070(a0)             # 00000070
    sb      $zero, 0x0030(a0)          # 00000030
    andi    t2, t1, 0xFF7F             # t2 = 00000000
    sb      t2, 0x00C0(a0)             # 000000C0
    lbu     t3, 0x00C0(a0)             # 000000C0
    andi    t6, t5, 0xFFF0             # t6 = 00000000
    sb      $zero, 0x0034(a0)          # 00000034
    andi    t4, t3, 0xFFDF             # t4 = 00000000
    sb      t4, 0x00C0(a0)             # 000000C0
    sw      v0, 0x0044(a0)             # 00000044
    sw      v0, 0x0040(a0)             # 00000040
    sb      t6, 0x0070(a0)             # 00000070
    jr      $ra
    swc1    $f4, 0x0080(a0)            # 00000080


func_800BC54C:
# MqDbg: Audio_ProcessNotes
    addiu   $sp, $sp, 0xFF60           # $sp -= 0xA0
    sw      s4, 0x0028($sp)
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x5630             # s4 = 80125630
    lw      v0, 0x2894(s4)             # 80127EC4
    sw      s5, 0x002C($sp)
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    blez    v0, lbl_800BC9EC
    or      s5, $zero, $zero           # s5 = 00000000
    or      s7, $zero, $zero           # s7 = 00000000
    addiu   s8, $sp, 0x006F            # s8 = FFFFFFCF
    addiu   s6, $zero, 0x0001          # s6 = 00000001
    addiu   s3, $zero, 0xFFFF          # s3 = FFFFFFFF
lbl_800BC59C:
    lw      t7, 0x5B84(s4)             # 8012B1B4
    lw      t0, 0x0014(s4)             # 80125644
    lw      t6, 0x352C(s4)             # 80128B5C
    addu    t8, t7, s5
    sll     t9, t8,  5
    addu    t1, t9, t0
    sw      t1, 0x0090($sp)
    addu    s1, s7, t6
    lw      t2, 0x0044(s1)             # 00000044
    addiu   s0, s1, 0x0030             # s0 = 00000030
    beql    s3, t2, lbl_800BC6D4
    lbu     t9, 0x0004(s0)             # 00000034
    addiu   s0, s1, 0x0030             # s0 = 00000030
    lw      a0, 0x0014(s0)             # 00000044
    lui     $at, 0x7FFF                # $at = 7FFF0000
    ori     $at, $at, 0xFFFF           # $at = 7FFFFFFF
    sltu    $at, a0, $at
    bnel    $at, $zero, lbl_800BC9E0
    addiu   s5, s5, 0x0001             # s5 = 00000001
    lw      t3, 0x002C(a0)             # 0000002C
    beql    s1, t3, lbl_800BC62C
    lw      t9, 0x0000(a0)             # 00000000
    lbu     t4, 0x0004(s0)             # 00000034
    bnel    t4, $zero, lbl_800BC62C
    lw      t9, 0x0000(a0)             # 00000000
    lbu     t6, 0x0040(s0)             # 00000070
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    andi    v0, s6, 0x00FF             # v0 = 00000001
    ori     t7, t6, 0x0010             # t7 = 00000010
    sb      t7, 0x0040(s0)             # 00000070
    lwc1    $f4, 0x2864(s4)            # 80127E94
    sb      s6, 0x0000(s0)             # 00000030
    sb      t8, 0x0004(s0)             # 00000034
    b       lbl_800BC6EC
    swc1    $f4, 0x004C(s0)            # 0000007C
    lw      t9, 0x0000(a0)             # 00000000
lbl_800BC62C:
    srl     t0, t9, 31
    bnel    t0, $zero, lbl_800BC654
    lw      a1, 0x0050(a0)             # 00000050
    lbu     t1, 0x0004(s0)             # 00000034
    bnel    t1, $zero, lbl_800BC654
    lw      a1, 0x0050(a0)             # 00000050
    lbu     t2, 0x0000(s0)             # 00000030
    bgtz    t2, lbl_800BC6A0
    nop
    lw      a1, 0x0050(a0)             # 00000050
lbl_800BC654:
    lw      v0, 0x004C(a1)             # 0000004C
    bnel    v0, $zero, lbl_800BC67C
    lw      t3, 0x0000(v0)             # 00000001
    jal     func_800BEE88
    or      a0, a1, $zero              # a0 = 00000000
    sb      s6, 0x0000(s0)             # 00000030
    sb      s6, 0x0004(s0)             # 00000034
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lw      t3, 0x0000(v0)             # 00000000
lbl_800BC67C:
    sll     t5, t3,  2
    bgez    t5, lbl_800BC698
    nop
    lbu     t6, 0x0003(a1)             # 00000003
    andi    t7, t6, 0x0040             # t7 = 00000000
    bne     t7, $zero, lbl_800BC6A0
    nop
lbl_800BC698:
    b       lbl_800BC6EC
    lbu     v0, 0x0000(s0)             # 00000030
lbl_800BC6A0:
    jal     func_800BD140
    nop
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800BD65C
    addiu   a0, a0, 0x0010             # a0 = 00000010
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sb      s6, 0x0000(s0)             # 00000030
    b       lbl_800BC6E8
    sb      t8, 0x0004(s0)             # 00000034
    lbu     t9, 0x0004(s0)             # 00000034
lbl_800BC6D4:
    bnel    t9, $zero, lbl_800BC6EC
    lbu     v0, 0x0000(s0)             # 00000030
    lbu     t0, 0x0000(s0)             # 00000030
    bgtzl   t0, lbl_800BC9E0
    addiu   s5, s5, 0x0001             # s5 = 00000002
lbl_800BC6E8:
    lbu     v0, 0x0000(s0)             # 00000030
lbl_800BC6EC:
    beql    v0, $zero, lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lbu     v0, 0x0004(s0)             # 00000034
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    bgtzl   v0, lbl_800BC718
    lbu     t4, 0x0040(s0)             # 00000070
    lw      t1, 0x0000(s2)             # 000000C0
    sll     t3, t1,  2
    bgezl   t3, lbl_800BC7FC
    lbu     t4, 0x0040(s0)             # 00000070
    lbu     t4, 0x0040(s0)             # 00000070
lbl_800BC718:
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    andi    t5, t4, 0x000F             # t5 = 00000000
    beql    t5, $zero, lbl_800BC73C
    lw      t9, 0x0018(s0)             # 00000048
    lw      t6, 0x0000(s2)             # 000000C0
    sll     t8, t6,  2
    bgez    t8, lbl_800BC844
    nop
    lw      t9, 0x0018(s0)             # 00000048
lbl_800BC73C:
    beql    s3, t9, lbl_800BC7C0
    lw      a0, 0x0014(s0)             # 00000044
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    lw      a1, 0x0018(s0)             # 00000048
    or      a0, s1, $zero              # a0 = 00000000
    lw      t0, 0x0050(a1)             # 00000050
    beq     t0, $zero, lbl_800BC798
    nop
    jal     func_800BD748
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    jal     func_800BE4C0
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BE578
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800BF1E8
    addiu   a0, a0, 0x0030             # a0 = 00000030
    b       lbl_800BC844
    sw      s3, 0x0018(s0)             # 00000048
lbl_800BC798:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9D8
    sw      s3, 0x0018(s0)             # 00000048
    lw      a0, 0x0014(s0)             # 00000044
lbl_800BC7C0:
    beq     s3, a0, lbl_800BC7D4
    nop
    lbu     t2, 0x0000(a0)             # 00000000
    ori     t3, t2, 0x0002             # t3 = 00000002
    sb      t3, 0x0000(a0)             # 00000000
lbl_800BC7D4:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lbu     t4, 0x0040(s0)             # 00000070
lbl_800BC7FC:
    andi    t5, t4, 0x000F             # t5 = 00000000
    bne     t5, $zero, lbl_800BC844
    nop
    lw      a0, 0x0014(s0)             # 00000044
    beq     s3, a0, lbl_800BC820
    nop
    lbu     t7, 0x0000(a0)             # 00000000
    ori     t8, t7, 0x0002             # t8 = 00000002
    sb      t8, 0x0000(a0)             # 00000000
lbl_800BC820:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
lbl_800BC844:
    jal     func_800BE5C4
    addiu   a0, s0, 0x0040             # a0 = 00000070
    swc1    $f0, 0x0064($sp)
    jal     func_800BE464
    or      a0, s1, $zero              # a0 = 00000000
    lbu     v0, 0x0004(s0)             # 00000034
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BC86C
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_800BC8CC
lbl_800BC86C:
    addiu   v0, s0, 0x001C             # v0 = 0000004C
    lwc1    $f6, 0x0008(v0)            # 00000054
    swc1    $f6, 0x0070($sp)
    lwc1    $f8, 0x000C(v0)            # 00000058
    swc1    $f8, 0x0074($sp)
    lbu     t9, 0x0002(v0)             # 0000004E
    sb      t9, 0x006E($sp)
    lbu     t0, 0x0000(v0)             # 0000004C
    sb      t0, 0x006C($sp)
    lbu     t2, 0x0003(v0)             # 0000004F
    sb      t2, 0x0000(s8)             # FFFFFFCF
    lbu     t3, 0x0001(v0)             # 0000004D
    sb      t3, 0x006D($sp)
    lw      t4, 0x0010(v0)             # 0000005C
    sw      t4, 0x007C($sp)
    lbu     t5, 0x0004(v0)             # 00000050
    sb      t5, 0x0080($sp)
    lhu     t6, 0x0006(v0)             # 00000052
    sh      t6, 0x0082($sp)
    lw      v1, 0x0000(s2)             # 000000C0
    sll     v1, v1, 11
    srl     v1, v1, 30
    b       lbl_800BC974
    andi    v1, v1, 0x00FF             # v1 = 00000000
lbl_800BC8CC:
    lw      v1, 0x0014(s0)             # 00000044
    lwc1    $f10, 0x0044(v1)           # 00000044
    lw      v0, 0x0050(v1)             # 00000050
    swc1    $f10, 0x0070($sp)
    lwc1    $f16, 0x0040(v1)           # 00000040
    swc1    $f16, 0x0074($sp)
    lbu     t7, 0x0007(v1)             # 00000007
    sb      t7, 0x006E($sp)
    lbu     t8, 0x0001(v1)             # 00000001
    bnel    t8, $zero, lbl_800BC908
    lbu     t2, 0x0001(v1)             # 00000001
    lbu     t0, 0x00D0(v0)             # 0000011C
    b       lbl_800BC90C
    sb      t0, 0x0000(s8)             # FFFFFFCF
    lbu     t2, 0x0001(v1)             # 00000001
lbl_800BC908:
    sb      t2, 0x0000(s8)             # FFFFFFCF
lbl_800BC90C:
    lbu     t3, 0x0004(v0)             # 00000050
    sb      t3, 0x006C($sp)
    lbu     t4, 0x000C(v0)             # 00000058
    sb      t4, 0x006D($sp)
    lw      t5, 0x00CC(v0)             # 00000118
    sw      t5, 0x007C($sp)
    lbu     t6, 0x000F(v0)             # 0000005B
    sb      t6, 0x0080($sp)
    lhu     t7, 0x0020(v0)             # 0000006C
    sh      t7, 0x0082($sp)
    lw      t8, 0x004C(v0)             # 00000098
    lbu     v1, 0x0009(v0)             # 00000055
    lw      t9, 0x0000(t8)             # 00000000
    andi    v1, v1, 0x0007             # v1 = 00000000
    andi    v1, v1, 0x00FF             # v1 = 00000000
    sll     t1, t9,  2
    bgezl   t1, lbl_800BC978
    lwc1    $f6, 0x000C(s0)            # 0000003C
    lbu     t2, 0x0003(v0)             # 0000004F
    andi    t3, t2, 0x0008             # t3 = 00000000
    beql    t3, $zero, lbl_800BC978
    lwc1    $f6, 0x000C(s0)            # 0000003C
    mtc1    $zero, $f18                # $f18 = 0.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    swc1    $f18, 0x0070($sp)
    swc1    $f4, 0x0074($sp)
lbl_800BC974:
    lwc1    $f6, 0x000C(s0)            # 0000003C
lbl_800BC978:
    lwc1    $f8, 0x0008(s0)            # 00000038
    lwc1    $f16, 0x0070($sp)
    lwc1    $f4, 0x2860(s4)            # 80127E90
    mul.s   $f10, $f6, $f8
    lwc1    $f8, 0x0074($sp)
    sb      v1, 0x006B($sp)
    or      a0, s1, $zero              # a0 = 00000000
    lw      a1, 0x0090($sp)
    addiu   a2, $sp, 0x006C            # a2 = FFFFFFCC
    mul.s   $f18, $f16, $f10
    lwc1    $f16, 0x0064($sp)
    mul.s   $f6, $f18, $f4
    swc1    $f18, 0x0070($sp)
    mul.s   $f10, $f8, $f16
    swc1    $f6, 0x0070($sp)
    jal     func_800BBF00
    swc1    $f10, 0x0074($sp)
    lbu     t4, 0x006B($sp)
    lbu     t7, 0x0001(s2)             # 000000C1
    sll     t5, t4,  3
    andi    t6, t5, 0x0018             # t6 = 00000000
    andi    t8, t7, 0xFFE7             # t8 = 00000000
    or      t9, t6, t8                 # t9 = 00000000
    sb      t9, 0x0001(s2)             # 000000C1
lbl_800BC9D8:
    lw      v0, 0x2894(s4)             # 80127EC4
lbl_800BC9DC:
    addiu   s5, s5, 0x0001             # s5 = 00000003
lbl_800BC9E0:
    slt     $at, s5, v0
    bne     $at, $zero, lbl_800BC59C
    addiu   s7, s7, 0x00E0             # s7 = 000000E0
lbl_800BC9EC:
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
    addiu   $sp, $sp, 0x00A0           # $sp += 0xA0


func_800BCA1C:
# MqDbg: Audio_GetInstrumentTunedSample
    lbu     t6, 0x0001(a0)             # 00000001
    slt     $at, a1, t6
    beql    $at, $zero, lbl_800BCA38
    lbu     t7, 0x0002(a0)             # 00000002
    jr      $ra
    addiu   v0, a0, 0x0008             # v0 = 00000008
lbl_800BCA34:
    lbu     t7, 0x0002(a0)             # 00000002
lbl_800BCA38:
    addiu   v1, a0, 0x0018             # v1 = 00000018
    slt     $at, t7, a1
    bne     $at, $zero, lbl_800BCA50
    nop
    jr      $ra
    addiu   v0, a0, 0x0010             # v0 = 00000010
lbl_800BCA50:
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000018


func_800BCA58:
# MqDbg: Audio_GetInstrumentInner
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     a0, $at, lbl_800BCA70
    sw      $ra, 0x0014($sp)
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCA70:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a1, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCAA4
    lw      a1, 0x001C($sp)
    lui     a2, 0x8012                 # a2 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCAA4:
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lw      t7, 0x2844(a2)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lbu     t9, 0x0000(v0)             # 00000000
    sll     t0, a0,  8
    addu    t1, t0, a1
    slt     $at, a1, t9
    bne     $at, $zero, lbl_800BCAE8
    lui     $at, 0x0300                # $at = 03000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCAE8:
    lw      t3, 0x0008(v0)             # 00000008
    sll     t4, a1,  2
    sll     t6, a0,  8
    addu    t5, t3, t4
    lw      v1, 0x0000(t5)             # 00000000
    addu    t7, t6, a1
    lui     $at, 0x0100                # $at = 01000000
    bne     v1, $zero, lbl_800BCB18
    addu    t8, t7, $at
    sw      t8, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, v1, $zero              # v0 = 00000000
lbl_800BCB18:
    or      v0, v1, $zero              # v0 = 00000000
lbl_800BCB1C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCB2C:
# MqDbg: Audio_GetDrum
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800BCB48
    or      a2, a1, $zero              # a2 = 00000000
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCB48:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a2, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCB7C
    lw      a2, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a3)             # 80127FB0
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCB7C:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      t7, 0x2844(a3)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lbu     t9, 0x0001(v0)             # 00000001
    sll     t0, a0,  8
    addu    t1, t0, a2
    slt     $at, a2, t9
    bne     $at, $zero, lbl_800BCBC0
    lui     $at, 0x0400                # $at = 04000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a3)             # 80127FB0
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCBC0:
    lw      v1, 0x000C(v0)             # 0000000C
    lui     $at, 0x8000                # $at = 80000000
    sll     t3, a2,  2
    sltu    $at, v1, $at
    beq     $at, $zero, lbl_800BCBE0
    addu    t4, v1, t3
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCBE0:
    lw      a1, 0x0000(t4)             # 00000000
    sll     t5, a0,  8
    addu    t6, t5, a2
    bne     a1, $zero, lbl_800BCC00
    or      v0, a1, $zero              # v0 = 00000000
    lui     $at, 0x0500                # $at = 05000000
    addu    t7, t6, $at
    sw      t7, 0x2980(a3)             # 80127FB0
lbl_800BCC00:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCC10:
# MqDbg: Audio_GetSoundEffect
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800BCC2C
    or      a2, a1, $zero              # a2 = 00000000
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCC2C:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a2, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCC60
    lw      a2, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a3)             # 80127FB0
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCC60:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      t7, 0x2844(a3)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lhu     t9, 0x0004(v0)             # 00000004
    sll     t0, a0,  8
    addu    t1, t0, a2
    slt     $at, a2, t9
    bne     $at, $zero, lbl_800BCCA4
    lui     $at, 0x0400                # $at = 04000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a3)             # 80127FB0
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCA4:
    lw      a1, 0x0010(v0)             # 00000010
    lui     $at, 0x8000                # $at = 80000000
    sll     t3, a2,  3
    sltu    $at, a1, $at
    beq     $at, $zero, lbl_800BCCC4
    addu    v1, a1, t3
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCC4:
    bne     v1, $zero, lbl_800BCCDC
    sll     t4, a0,  8
    addu    t5, t4, a2
    lui     $at, 0x0500                # $at = 05000000
    addu    t6, t5, $at
    sw      t6, 0x2980(a3)             # 80127FB0
lbl_800BCCDC:
    lw      t7, 0x0000(v1)             # 00000000
    or      v0, v1, $zero              # v0 = 00000000
    bne     t7, $zero, lbl_800BCCF4
    nop
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCF4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCD04:
# MqDbg: Audio_SetFontInstrument
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a1, $at, lbl_800BCD20
    sw      a0, 0x0018($sp)
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BCD20:
    or      a0, a1, $zero              # a0 = 00000000
    sw      a1, 0x001C($sp)
    sw      a2, 0x0020($sp)
    jal     func_800B6E70
    sw      a3, 0x0024($sp)
    lw      v1, 0x0018($sp)
    lw      a1, 0x001C($sp)
    lw      a2, 0x0020($sp)
    bne     v0, $zero, lbl_800BCD50
    lw      a3, 0x0024($sp)
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFE          # v0 = FFFFFFFE
lbl_800BCD50:
    beq     v1, $zero, lbl_800BCD6C
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v1, $at, lbl_800BCDAC
    lui     t2, 0x8012                 # t2 = 80120000
    b       lbl_800BCDF8
    lui     t0, 0x8012                 # t0 = 80120000
lbl_800BCD6C:
    lw      t6, 0x7E74(t6)             # 80127E74
    sll     t7, a1,  2
    addu    t7, t7, a1
    sll     t7, t7,  2
    addu    v0, t6, t7
    lbu     t8, 0x0001(v0)             # FFFFFFFF
    slt     $at, a2, t8
    bnel    $at, $zero, lbl_800BCD9C
    lw      t9, 0x000C(v0)             # 0000000A
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t9, 0x000C(v0)             # 00000009
lbl_800BCD9C:
    sll     t0, a2,  2
    addu    t1, t9, t0
    b       lbl_800BCE34
    sw      a3, 0x0000(t1)             # 00000000
lbl_800BCDAC:
    lw      t2, 0x7E74(t2)             # 80127E74
    sll     t3, a1,  2
    addu    t3, t3, a1
    sll     t3, t3,  2
    addu    v0, t2, t3
    lhu     t4, 0x0004(v0)             # 00000001
    slt     $at, a2, t4
    bnel    $at, $zero, lbl_800BCDDC
    lw      t5, 0x0010(v0)             # 0000000D
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t5, 0x0010(v0)             # 0000000D
lbl_800BCDDC:
    lw      t9, 0x0000(a3)             # 00000000
    sll     t6, a2,  3
    addu    t7, t5, t6
    sw      t9, 0x0000(t7)             # 00000000
    lw      t8, 0x0004(a3)             # 00000004
    b       lbl_800BCE34
    sw      t8, 0x0004(t7)             # 00000004
lbl_800BCDF8:
    lw      t0, 0x7E74(t0)             # 80127E74
    sll     t1, a1,  2
    addu    t1, t1, a1
    sll     t1, t1,  2
    addu    v0, t0, t1
    lbu     t2, 0x0000(v0)             # FFFFFFFD
    slt     $at, a2, t2
    bnel    $at, $zero, lbl_800BCE28
    lw      t3, 0x0008(v0)             # 00000005
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t3, 0x0008(v0)             # 00000005
lbl_800BCE28:
    sll     t4, a2,  2
    addu    t5, t3, t4
    sw      a3, 0x0000(t5)             # 00000000
lbl_800BCE34:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCE38:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCE48:
# MqDbg: Audio_SeqLayerDecayRelease
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    beq     a0, t0, lbl_800BD10C
    sw      a1, 0x002C($sp)
    lbu     t6, 0x0000(a0)             # 00000000
    lw      v0, 0x002C(a0)             # 0000002C
    andi    t7, t6, 0xFFF7             # t7 = 00000000
    beq     v0, $zero, lbl_800BD10C
    sb      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0048(v0)             # 00000048
    or      a2, v0, $zero              # a2 = 00000000
    bnel    a0, t8, lbl_800BCE90
    lw      v0, 0x0044(a2)             # 00000044
    sw      t0, 0x0048(v0)             # 00000048
    lw      v0, 0x0044(a2)             # 00000044
lbl_800BCE90:
    beql    s0, v0, lbl_800BCEE4
    lbu     t7, 0x0070(a2)             # 00000070
    bnel    t0, v0, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lw      t9, 0x0048(a2)             # 00000048
    bnel    t0, t9, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lw      t2, 0x0040(a2)             # 00000040
    lw      t3, 0x002C($sp)
    bne     s0, t2, lbl_800BD10C
    addiu   t1, $zero, 0x0006          # t1 = 00000006
    beql    t3, t1, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lbu     t5, 0x0070(a2)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f4, 0x7E94($at)           # 80127E94
    ori     t6, t5, 0x0010             # t6 = 00000010
    sb      t6, 0x0070(a2)             # 00000070
    b       lbl_800BD10C
    swc1    $f4, 0x007C(a2)            # 0000007C
    lbu     t7, 0x0070(a2)             # 00000070
lbl_800BCEE4:
    addiu   t1, $zero, 0x0006          # t1 = 00000006
    andi    t8, t7, 0x000F             # t8 = 00000000
    beql    t1, t8, lbl_800BD0E8
    lw      t9, 0x002C($sp)
    lwc1    $f6, 0x0044(s0)            # 00000044
    addiu   a0, a2, 0x004C             # a0 = 0000004C
    swc1    $f6, 0x0008(a0)            # 00000054
    lwc1    $f8, 0x0040(s0)            # 00000040
    swc1    $f8, 0x000C(a0)            # 00000058
    lbu     t9, 0x0007(s0)             # 00000007
    sb      t9, 0x0002(a0)             # 0000004E
    lw      v0, 0x0050(s0)             # 00000050
    beql    v0, $zero, lbl_800BD00C
    lbu     t5, 0x0001(s0)             # 00000001
    lbu     t2, 0x0004(v0)             # 00000004
    or      a3, v0, $zero              # a3 = 00000000
    or      v1, a0, $zero              # v1 = 0000004C
    sb      t2, 0x0000(a0)             # 0000004C
    lbu     t3, 0x000C(v0)             # 0000000C
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    sb      t3, 0x0001(a0)             # 0000004D
    lw      t4, 0x00CC(v0)             # 000000CC
    or      v0, $zero, $zero           # v0 = 00000000
    beq     t4, $zero, lbl_800BCF9C
    sw      t4, 0x0010(a0)             # 0000005C
lbl_800BCF48:
    lw      t6, 0x0010(a0)             # 0000005C
    addiu   v1, v1, 0x0008             # v1 = 00000054
    addu    t7, t6, v0
    lh      t8, 0x0000(t7)             # 00000000
    sh      t8, 0x000C(v1)             # 00000060
    lw      t9, 0x0010(a0)             # 0000005C
    addu    t2, t9, v0
    lh      t3, 0x0002(t2)             # 00000002
    sh      t3, 0x000E(v1)             # 00000062
    lw      t4, 0x0010(a0)             # 0000005C
    addu    t5, t4, v0
    lh      t6, 0x0004(t5)             # 00000004
    sh      t6, 0x0010(v1)             # 00000064
    lw      t7, 0x0010(a0)             # 0000005C
    addu    t8, t7, v0
    lh      t9, 0x0006(t8)             # 00000006
    addiu   v0, v0, 0x0008             # v0 = 00000008
    bne     v0, a1, lbl_800BCF48
    sh      t9, 0x0012(v1)             # 00000066
    addiu   t2, a0, 0x0014             # t2 = 00000060
    sw      t2, 0x0010(a0)             # 0000005C
lbl_800BCF9C:
    lhu     t3, 0x0020(a3)             # 00000020
    sh      t3, 0x0006(a0)             # 00000052
    lbu     t4, 0x000F(a3)             # 0000000F
    sb      t4, 0x0004(a0)             # 00000050
    lw      t5, 0x004C(a3)             # 0000004C
    lw      t6, 0x0000(t5)             # 00000000
    sll     t8, t6,  2
    bgezl   t8, lbl_800BCFE0
    lbu     t6, 0x0001(s0)             # 00000001
    lbu     t9, 0x0003(a3)             # 00000003
    andi    t2, t9, 0x0008             # t2 = 00000000
    beql    t2, $zero, lbl_800BCFE0
    lbu     t6, 0x0001(s0)             # 00000001
    lbu     t4, 0x00C0(a2)             # 000000C0
    ori     t5, t4, 0x0020             # t5 = 00000020
    sb      t5, 0x00C0(a2)             # 000000C0
    lbu     t6, 0x0001(s0)             # 00000001
lbl_800BCFE0:
    bnel    t6, $zero, lbl_800BCFF8
    lbu     t2, 0x0001(s0)             # 00000001
    lbu     t8, 0x00D0(a3)             # 000000D0
    b       lbl_800BCFFC
    sb      t8, 0x0003(a0)             # 0000004F
    lbu     t2, 0x0001(s0)             # 00000001
lbl_800BCFF8:
    sb      t2, 0x0003(a0)             # 0000004F
lbl_800BCFFC:
    lbu     t3, 0x0006(a3)             # 00000006
    b       lbl_800BD018
    sb      t3, 0x0030(a2)             # 00000030
    lbu     t5, 0x0001(s0)             # 00000001
lbl_800BD00C:
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sb      t5, 0x0003(a0)             # 0000004F
    sb      t6, 0x0030(a2)             # 00000030
lbl_800BD018:
    lw      t7, 0x0044(a2)             # 00000044
    sw      t0, 0x0044(a2)             # 00000044
    addiu   $at, $zero, 0x0007         # $at = 00000007
    sw      t7, 0x0040(a2)             # 00000040
    lw      t8, 0x002C($sp)
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    bnel    t8, $at, lbl_800BD05C
    lbu     t7, 0x0070(a2)             # 00000070
    lbu     t2, 0x0070(a2)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f10, 0x7E94($at)          # 80127E94
    ori     t3, t2, 0x0010             # t3 = 00000010
    sb      t3, 0x0070(a2)             # 00000070
    sb      t4, 0x0034(a2)             # 00000034
    b       lbl_800BD0E4
    swc1    $f10, 0x007C(a2)           # 0000007C
    lbu     t7, 0x0070(a2)             # 00000070
lbl_800BD05C:
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sb      t5, 0x0034(a2)             # 00000034
    ori     t8, t7, 0x0020             # t8 = 00000020
    sb      t8, 0x0070(a2)             # 00000070
    lbu     v0, 0x0018(s0)             # 00000018
    lui     t6, 0x8013                 # t6 = 80130000
    bne     v0, $zero, lbl_800BD0A0
    nop
    lw      t2, 0x0050(s0)             # 00000050
    lui     t9, 0x8013                 # t9 = 80130000
    lw      t9, -0x74B0(t9)            # 80128B50
    lbu     t3, 0x007C(t2)             # 0000007C
    sll     t4, t3,  2
    addu    t5, t9, t4
    lwc1    $f16, 0x0000(t5)           # 00000001
    b       lbl_800BD0B4
    swc1    $f16, 0x007C(a2)           # 0000007C
lbl_800BD0A0:
    lw      t6, -0x74B0(t6)            # 80128B50
    sll     t7, v0,  2
    addu    t8, t6, t7
    lwc1    $f18, 0x0000(t8)           # 00000020
    swc1    $f18, 0x007C(a2)           # 0000007C
lbl_800BD0B4:
    lw      t2, 0x0050(s0)             # 00000050
    lwc1    $f8, 0x0080(a2)            # 00000080
    lui     $at, 0x3B80                # $at = 3B800000
    lbu     t3, 0x007D(t2)             # 0000007D
    mtc1    $at, $f16                  # $f16 = 0.00
    mtc1    t3, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    mul.s   $f10, $f6, $f8
    nop
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0074(a2)           # 00000074
lbl_800BD0E4:
    lw      t9, 0x002C($sp)
lbl_800BD0E8:
    or      a0, a2, $zero              # a0 = 00000000
    bnel    t9, t1, lbl_800BD110
    lw      $ra, 0x001C($sp)
    jal     func_800BD69C
    sw      a2, 0x0024($sp)
    lw      a1, 0x0024($sp)
    lw      a0, 0x000C(a1)             # 0000000C
    jal     func_800BD65C
    addiu   a0, a0, 0x0010             # a0 = 00000010
lbl_800BD10C:
    lw      $ra, 0x001C($sp)
lbl_800BD110:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BD120:
# MqDbg: Audio_SeqLayerNoteDecay
# Wrapper for 800BCE48 (A1 = 6)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BCE48
    addiu   a1, $zero, 0x0006          # a1 = 00000006
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD140:
# MqDbg: Audio_SeqLayerNoteRelease
# Wrapper for 800BCE48 (A1 = 7)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BCE48
    addiu   a1, $zero, 0x0007          # a1 = 00000007
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD160:
# MqDbg: Audio_BuildSyntheticWave
    slti    $at, a2, 0x0080
    beq     $at, $zero, lbl_800BD170
    or      v1, $zero, $zero           # v1 = 00000000
    addiu   a2, $zero, 0x0080          # a2 = 00000080
lbl_800BD170:
    lbu     t6, 0x0020(a1)             # 00000020
    lwc1    $f0, 0x0030(a1)            # 00000030
    beq     t6, $zero, lbl_800BD1B0
    mov.s   $f2, $f0
    lwc1    $f12, 0x0028(a1)           # 00000028
    mtc1    $zero, $f4                 # $f4 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    c.lt.s  $f4, $f12
    nop
    bc1f    lbl_800BD1B0
    nop
    mtc1    $at, $f6                   # $f6 = 1.00
    nop
    add.s   $f8, $f12, $f6
    mul.s   $f2, $f2, $f8
    nop
lbl_800BD1B0:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x664C($at)         # 801099B4
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f10
    nop
    bc1f    lbl_800BD1D8
    nop
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BD230
    lwc1    $f2, -0x6648($at)          # 801099B8
lbl_800BD1D8:
    lwc1    $f16, -0x6644($at)         # 801099BC
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f16
    nop
    bc1f    lbl_800BD200
    nop
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BD230
    lwc1    $f2, -0x6640($at)          # 801099C0
lbl_800BD200:
    lwc1    $f18, -0x663C($at)         # 801099C4
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f18
    nop
    bc1f    lbl_800BD22C
    nop
    lui     $at, 0x8011                # $at = 80110000
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    b       lbl_800BD230
    lwc1    $f2, -0x6638($at)          # 801099C8
lbl_800BD22C:
    lwc1    $f2, -0x6634($at)          # 801099CC
lbl_800BD230:
    mul.s   $f4, $f0, $f2
    sll     t7, a2,  2
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    sll     t9, v1,  7
    or      v0, v1, $zero              # v0 = 00000002
    swc1    $f4, 0x0030(a1)            # 00000030
    sb      a2, 0x0031(a0)             # 00000031
    sb      v1, 0x0032(a0)             # 00000032
    lw      t8, 0x01A0(t8)             # 801001A0
    addu    t0, t8, t9
    jr      $ra
    sw      t0, 0x00D0(a0)             # 000000D0


func_800BD264:
# MqDbg: Audio_InitSyntheticWave
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lbu     a2, 0x0002(a1)             # 00000002
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bnel    a2, $at, lbl_800BD288
    lbu     v1, 0x0032(a0)             # 00000032
    lw      t6, 0x0050(a1)             # 00000050
    lh      a2, 0x0024(t6)             # 00000024
    lbu     v1, 0x0032(a0)             # 00000032
lbl_800BD288:
    sw      a0, 0x0020($sp)
    jal     func_800BD160
    sw      v1, 0x001C($sp)
    lw      v1, 0x001C($sp)
    sll     t7, v0,  2
    lw      a0, 0x0020($sp)
    beq     v0, v1, lbl_800BD2AC
    addu    t8, t7, v1
    sb      t8, 0x00C6(a0)             # 000000C6
lbl_800BD2AC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD2BC:
# MqDbg: Audio_InitNoteList
    sw      a0, 0x0000(a0)             # 00000000
    sw      a0, 0x0004(a0)             # 00000004
    jr      $ra
    sw      $zero, 0x0008(a0)          # 00000008


func_800BD2CC:
# MqDbg: Audio_InitNoteLists
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    jal     func_800BD2BC
    or      s0, a0, $zero              # s0 = 00000000
    jal     func_800BD2BC
    addiu   a0, s0, 0x0010             # a0 = 00000010
    jal     func_800BD2BC
    addiu   a0, s0, 0x0020             # a0 = 00000020
    jal     func_800BD2BC
    addiu   a0, s0, 0x0030             # a0 = 00000030
    sw      s0, 0x000C(s0)             # 0000000C
    sw      s0, 0x001C(s0)             # 0000001C
    sw      s0, 0x002C(s0)             # 0000002C
    sw      s0, 0x003C(s0)             # 0000003C
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD31C:
# MqDbg: Audio_InitNoteFreeList
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s3, 0x0020($sp)
    lui     s3, 0x8013                 # s3 = 80130000
    addiu   s3, s3, 0xB1C8             # s3 = 8012B1C8
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    jal     func_800BD2CC
    or      a0, s3, $zero              # a0 = 8012B1C8
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x5630             # s1 = 80125630
    lw      t6, 0x2894(s1)             # 80127EC4
    or      s2, $zero, $zero           # s2 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    blezl   t6, lbl_800BD3A8
    lw      $ra, 0x0024($sp)
    lw      v0, 0x352C(s1)             # 80128B5C
lbl_800BD364:
    or      a0, s3, $zero              # a0 = 8012B1C8
    addu    t7, s0, v0
    addu    t8, v0, s0
    sw      t7, 0x0008(t8)             # 00000008
    lw      t9, 0x352C(s1)             # 80128B5C
    addu    t0, t9, s0
    sw      $zero, 0x0000(t0)          # 00000000
    lw      t1, 0x352C(s1)             # 80128B5C
    jal     func_800BF1E8
    addu    a1, s0, t1
    lw      t2, 0x2894(s1)             # 80127EC4
    addiu   s2, s2, 0x0001             # s2 = 00000001
    addiu   s0, s0, 0x00E0             # s0 = 000000E0
    slt     $at, s2, t2
    bnel    $at, $zero, lbl_800BD364
    lw      v0, 0x352C(s1)             # 80128B5C
    lw      $ra, 0x0024($sp)
lbl_800BD3A8:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BD3C0:
# MqDbg: Audio_NotePoolClear
# Audio?
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    lui     a2, 0x8013                 # a2 = 80130000
    lui     a1, 0x8013                 # a1 = 80130000
    lui     v1, 0x8013                 # v1 = 80130000
    lui     v0, 0x8013                 # v0 = 80130000
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s0, 0x0018($sp)
    addiu   v0, v0, 0xB1F8             # v0 = 8012B1F8
    addiu   v1, v1, 0xB1E8             # v1 = 8012B1E8
    addiu   a1, a1, 0xB1D8             # a1 = 8012B1D8
    addiu   a2, a2, 0xB1C8             # a2 = 8012B1C8
    lw      s1, 0x0048($sp)
    lw      s2, 0x0040($sp)
    or      s3, $zero, $zero           # s3 = 00000000
    addiu   s5, $zero, 0x0001          # s5 = 00000001
    addiu   s6, $zero, 0x0002          # s6 = 00000002
    addiu   s7, $zero, 0x0003          # s7 = 00000003
    addiu   s8, $zero, 0x0004          # s8 = 00000004
lbl_800BD42C:
    beql    s3, $zero, lbl_800BD458
    or      s1, s4, $zero              # s1 = 00000000
    beql    s3, s5, lbl_800BD468
    addiu   s1, s4, 0x0010             # s1 = 00000010
    beql    s3, s6, lbl_800BD478
    addiu   s1, s4, 0x0020             # s1 = 00000020
    beql    s3, s7, lbl_800BD488
    addiu   s1, s4, 0x0030             # s1 = 00000030
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000034
    or      s1, s4, $zero              # s1 = 00000000
lbl_800BD458:
    or      s2, a2, $zero              # s2 = 8012B1C8
    b       lbl_800BD490
    lw      s0, 0x0004(s4)             # 00000004
    addiu   s1, s4, 0x0010             # s1 = 00000010
lbl_800BD468:
    or      s2, a1, $zero              # s2 = 8012B1D8
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000014
    addiu   s1, s4, 0x0020             # s1 = 00000020
lbl_800BD478:
    or      s2, v1, $zero              # s2 = 8012B1E8
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000024
    addiu   s1, s4, 0x0030             # s1 = 00000030
lbl_800BD488:
    or      s2, v0, $zero              # s2 = 8012B1F8
    lw      s0, 0x0004(s1)             # 00000034
lbl_800BD490:
    beql    s0, s1, lbl_800BD4E0
    addiu   s3, s3, 0x0001             # s3 = 00000001
lbl_800BD498:
    beql    s0, $zero, lbl_800BD4E0
    addiu   s3, s3, 0x0001             # s3 = 00000002
    jal     func_800BD69C
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s2, $zero              # a0 = 8012B1F8
    jal     func_800BF1E8
    or      a1, s0, $zero              # a1 = 00000000
    lw      s0, 0x0004(s1)             # 00000034
    lui     a2, 0x8013                 # a2 = 80130000
    lui     a1, 0x8013                 # a1 = 80130000
    lui     v1, 0x8013                 # v1 = 80130000
    lui     v0, 0x8013                 # v0 = 80130000
    addiu   v0, v0, 0xB1F8             # v0 = 8012B1F8
    addiu   v1, v1, 0xB1E8             # v1 = 8012B1E8
    addiu   a1, a1, 0xB1D8             # a1 = 8012B1D8
    bne     s0, s1, lbl_800BD498
    addiu   a2, a2, 0xB1C8             # a2 = 8012B1C8
    addiu   s3, s3, 0x0001             # s3 = 00000003
lbl_800BD4E0:
    bne     s3, s8, lbl_800BD42C
    nop
    lw      $ra, 0x003C($sp)
    sw      s2, 0x0040($sp)
    sw      s1, 0x0048($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s0, 0x0018($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800BD520:
# MqDbg: Audio_NotePoolFill
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x003C($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    or      s3, a1, $zero              # s3 = 00000000
    or      s5, a0, $zero              # s5 = 00000000
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    jal     func_800BD3C0
    sw      s0, 0x0018($sp)
    or      s4, $zero, $zero           # s4 = 00000000
    blez    s3, lbl_800BD62C
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s8, $zero, 0x0002          # s8 = 00000002
    addiu   s7, $zero, 0x0001          # s7 = 00000001
    addiu   s6, $zero, 0x0004          # s6 = 00000004
    lw      s2, 0x0044($sp)
    lw      s1, 0x0048($sp)
lbl_800BD578:
    beql    s4, s6, lbl_800BD630
    lw      $ra, 0x003C($sp)
    beq     s4, $zero, lbl_800BD5A8
    nop
    beq     s4, s7, lbl_800BD5B8
    nop
    beq     s4, s8, lbl_800BD5C8
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     s4, $at, lbl_800BD5D8
    nop
    b       lbl_800BD5E8
    slt     $at, s0, s3
lbl_800BD5A8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1C8             # s1 = 8012B1C8
    b       lbl_800BD5E4
    or      s2, s5, $zero              # s2 = 00000000
lbl_800BD5B8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1D8             # s1 = 8012B1D8
    b       lbl_800BD5E4
    addiu   s2, s5, 0x0010             # s2 = 00000010
lbl_800BD5C8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1E8             # s1 = 8012B1E8
    b       lbl_800BD5E4
    addiu   s2, s5, 0x0020             # s2 = 00000020
lbl_800BD5D8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1F8             # s1 = 8012B1F8
    addiu   s2, s5, 0x0030             # s2 = 00000030
lbl_800BD5E4:
    slt     $at, s0, s3
lbl_800BD5E8:
    beql    $at, $zero, lbl_800BD61C
    slt     $at, s0, s3
lbl_800BD5F0:
    jal     func_800BF228
    or      a0, s1, $zero              # a0 = 8012B1F8
    beq     v0, $zero, lbl_800BD618
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800BF1E8
    or      a0, s2, $zero              # a0 = 00000030
    addiu   s0, s0, 0x0001             # s0 = 00000001
    slt     $at, s0, s3
    bne     $at, $zero, lbl_800BD5F0
    nop
lbl_800BD618:
    slt     $at, s0, s3
lbl_800BD61C:
    bne     $at, $zero, lbl_800BD578
    addiu   s4, s4, 0x0001             # s4 = 00000001
    sw      s2, 0x0044($sp)
    sw      s1, 0x0048($sp)
lbl_800BD62C:
    lw      $ra, 0x003C($sp)
lbl_800BD630:
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
    addiu   $sp, $sp, 0x0058           # $sp += 0x58


func_800BD65C:
# MqDbg: Audio_AudioListPushFront
    lw      t6, 0x0000(a1)             # 00000000
    bne     t6, $zero, lbl_800BD694
    nop
    sw      a0, 0x0000(a1)             # 00000000
    lw      t7, 0x0004(a0)             # 00000004
    sw      t7, 0x0004(a1)             # 00000004
    lw      t8, 0x0004(a0)             # 00000004
    sw      a1, 0x0000(t8)             # 00000000
    lw      t9, 0x0008(a0)             # 00000008
    lw      t1, 0x000C(a0)             # 0000000C
    sw      a1, 0x0004(a0)             # 00000004
    addiu   t0, t9, 0x0001             # t0 = 00000001
    sw      t0, 0x0008(a0)             # 00000008
    sw      t1, 0x000C(a1)             # 0000000C
lbl_800BD694:
    jr      $ra
    nop


func_800BD69C:
# MqDbg: Audio_AudioListRemove
# Audio, delete?
# A0 = some struct ptr
    lw      v0, 0x0000(a0)             # 00000000
    beq     v0, $zero, lbl_800BD6C0
    nop
    lw      t6, 0x0004(a0)             # 00000004
    sw      t6, 0x0004(v0)             # 00000004
    lw      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0004(a0)             # 00000004
    sw      t7, 0x0000(t8)             # 00000000
    sw      $zero, 0x0000(a0)          # 00000000
lbl_800BD6C0:
    jr      $ra
    nop


func_800BD6C8:
# MqDbg: Audio_FindNodeWithPrioLessThan
    lw      v0, 0x0004(a0)             # 00000004
    bne     v0, a0, lbl_800BD6DC
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD6DC:
    beq     v0, a0, lbl_800BD710
    or      v1, v0, $zero              # v1 = 00000000
    lw      t6, 0x0008(v1)             # 00000008
lbl_800BD6E8:
    lw      t8, 0x0008(v0)             # 00000008
    lbu     t7, 0x0030(t6)             # 00000030
    lbu     t9, 0x0030(t8)             # 00000030
    slt     $at, t7, t9
    bnel    $at, $zero, lbl_800BD708
    lw      v0, 0x0004(v0)             # 00000004
    or      v1, v0, $zero              # v1 = 00000000
    lw      v0, 0x0004(v0)             # 00000004
lbl_800BD708:
    bnel    v0, a0, lbl_800BD6E8
    lw      t6, 0x0008(v1)             # 00000008
lbl_800BD710:
    bnel    v1, $zero, lbl_800BD724
    lw      a0, 0x0008(v1)             # 00000008
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD720:
    lw      a0, 0x0008(v1)             # 00000008
lbl_800BD724:
    lbu     t0, 0x0030(a0)             # 00000030
    or      v0, a0, $zero              # v0 = 00000000
    slt     $at, t0, a1
    bne     $at, $zero, lbl_800BD740
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD740:
    jr      $ra
    nop


func_800BD748:
# MqDbg: Audio_NoteInitForLayer
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0014($sp)
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    sw      t6, 0x0040(a0)             # 00000040
    sw      a1, 0x0044(a0)             # 00000044
    lw      t7, 0x0050(a1)             # 00000050
    mtc1    $zero, $f4                 # $f4 = 0.00
    lbu     t8, 0x0005(t7)             # 00000005
    sb      t8, 0x0030(a0)             # 00000030
    lbu     t0, 0x0000(a1)             # 00000000
    lw      t5, 0x0050(a1)             # 00000050
    sw      a0, 0x002C(a1)             # 0000002C
    ori     t3, t0, 0x0001             # t3 = 00000001
    sb      t3, 0x0000(a1)             # 00000000
    ori     t4, t3, 0x0008             # t4 = 00000009
    sb      t4, 0x0000(a1)             # 00000000
    sw      a0, 0x0040(t5)             # 00000040
    lw      t6, 0x0050(a1)             # 00000050
    sw      a1, 0x0044(t6)             # 00000043
    swc1    $f4, 0x0040(a1)            # 00000040
    sw      a1, 0x003C($sp)
    jal     func_800BC428
    sw      a0, 0x0038($sp)
    lw      a1, 0x003C($sp)
    lw      a0, 0x0038($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    lbu     a2, 0x0002(a1)             # 00000002
    addiu   v1, a0, 0x00C0             # v1 = 000000C0
    bnel    a2, $at, lbl_800BD7CC
    lw      t8, 0x004C(a1)             # 0000004C
    lw      t7, 0x0050(a1)             # 00000050
    lh      a2, 0x0024(t7)             # 00000024
    lw      t8, 0x004C(a1)             # 0000004C
lbl_800BD7CC:
    slti    $at, a2, 0x0080
    bne     $at, $zero, lbl_800BD7F4
    sw      t8, 0x0010(v1)             # 000000D0
    slti    $at, a2, 0x00C0
    beql    $at, $zero, lbl_800BD7F8
    lbu     t2, 0x0001(v1)             # 000000C1
    lbu     t0, 0x0001(v1)             # 000000C1
    ori     t1, t0, 0x0004             # t1 = 00000004
    b       lbl_800BD800
    sb      t1, 0x0001(v1)             # 000000C1
lbl_800BD7F4:
    lbu     t2, 0x0001(v1)             # 000000C1
lbl_800BD7F8:
    andi    t3, t2, 0xFFFB             # t3 = 00000000
    sb      t3, 0x0001(v1)             # 000000C1
lbl_800BD800:
    lw      t4, 0x0000(v1)             # 000000C0
    sll     t6, t4, 13
    bgezl   t6, lbl_800BD830
    lw      t7, 0x0050(a1)             # 00000050
    sw      v1, 0x001C($sp)
    sw      a0, 0x0038($sp)
    jal     func_800BD160
    sw      a1, 0x003C($sp)
    lw      v1, 0x001C($sp)
    lw      a0, 0x0038($sp)
    lw      a1, 0x003C($sp)
    lw      t7, 0x0050(a1)             # 00000050
lbl_800BD830:
    addiu   v0, a0, 0x0030             # v0 = 00000030
    lbu     t8, 0x0007(t7)             # 00000007
    sb      t8, 0x0003(v0)             # 00000033
    lw      t9, 0x0050(a1)             # 00000050
    lw      t0, 0x0000(t9)             # 00000000
    sll     t1, t0,  5
    srl     t2, t1, 31
    sb      t2, 0x0005(v0)             # 00000035
    lw      t3, 0x0050(a1)             # 00000050
    lbu     t9, 0x0001(v1)             # 00000001
    lbu     t4, 0x0008(t3)             # 00000008
    andi    t0, t9, 0xFF1F             # t0 = 00000000
    andi    t6, t4, 0x0003             # t6 = 00000000
    sll     t8, t6,  5
    or      t1, t8, t0                 # t1 = 00000000
    sb      t1, 0x0001(v1)             # 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800BD880:
# MqDbg: func_800E82C0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_800BD140
    lw      a0, 0x0044(a0)             # 00000044
    lw      t7, 0x001C($sp)
    lw      t8, 0x0018($sp)
    sw      t7, 0x0048(t8)             # 00000048
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD8B4:
# MqDbg: Audio_NoteReleaseAndTakeOwnership
    sw      a1, 0x0048(a0)             # 00000048
    lw      t6, 0x0050(a1)             # 00000050
    lbu     t9, 0x0070(a0)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lbu     t7, 0x0005(t6)             # 00000005
    ori     t0, t9, 0x0010             # t0 = 00000010
    sb      t7, 0x0030(a0)             # 00000030
    lwc1    $f4, 0x7E94($at)           # 80127E94
    sb      t0, 0x0070(a0)             # 00000070
    jr      $ra
    swc1    $f4, 0x007C(a0)            # 0000007C


func_800BD8E0:
# MqDbg: Audio_AllocNoteFromDisabled
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_800BF228
    sw      a1, 0x0024($sp)
    beq     v0, $zero, lbl_800BD918
    sw      v0, 0x001C($sp)
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_800BD748
    lw      a1, 0x0024($sp)
    lw      a0, 0x0020($sp)
    lw      a1, 0x001C($sp)
    jal     func_800BD65C
    addiu   a0, a0, 0x0030             # a0 = 00000030
lbl_800BD918:
    lw      $ra, 0x0014($sp)
    lw      v0, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD92C:
# MqDbg: Audio_AllocNoteFromDecaying
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_800BF228
    addiu   a0, a0, 0x0010             # a0 = 00000010
    beq     v0, $zero, lbl_800BD968
    sw      v0, 0x001C($sp)
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_800BD8B4
    lw      a1, 0x0024($sp)
    lw      a0, 0x0020($sp)
    lw      a1, 0x001C($sp)
    jal     func_800BF1E8
    addiu   a0, a0, 0x0020             # a0 = 00000020
lbl_800BD968:
    lw      $ra, 0x0014($sp)
    lw      v0, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD97C:
# MqDbg: Audio_AllocNoteFromActive
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    addiu   t6, $zero, 0x0010          # t6 = 00000010
    addiu   t7, $zero, 0x0010          # t7 = 00000010
    sw      $ra, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      t7, 0x002C($sp)
    sw      t6, 0x0028($sp)
    lw      t8, 0x0050(a1)             # 00000050
    or      s0, a0, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    addiu   a0, a0, 0x0020             # a0 = 00000020
    lbu     a1, 0x0005(t8)             # 00000005
    jal     func_800BD6C8
    sw      a0, 0x0024($sp)
    beq     v0, $zero, lbl_800BD9C8
    or      v1, v0, $zero              # v1 = 00000000
    lbu     t9, 0x0030(v0)             # 00000030
    sw      t9, 0x002C($sp)
lbl_800BD9C8:
    lw      t0, 0x0050(s1)             # 00000050
    addiu   a0, s0, 0x0030             # a0 = 00000030
    lbu     a1, 0x0005(t0)             # 00000005
    jal     func_800BD6C8
    sw      v1, 0x0034($sp)
    lw      v1, 0x0034($sp)
    beq     v0, $zero, lbl_800BD9F0
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t1, 0x0030(v0)             # 00000030
    sw      t1, 0x0028($sp)
lbl_800BD9F0:
    bne     v1, $zero, lbl_800BDA08
    lw      t2, 0x0028($sp)
    bnel    v0, $zero, lbl_800BDA0C
    lw      t3, 0x002C($sp)
    b       lbl_800BDA60
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BDA08:
    lw      t3, 0x002C($sp)
lbl_800BDA0C:
    slt     $at, t2, t3
    beql    $at, $zero, lbl_800BDA50
    sw      s1, 0x0048(v1)             # 00000048
    jal     func_800BD69C
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BD880
    or      a1, s1, $zero              # a1 = 00000000
    lw      a0, 0x0024($sp)
    jal     func_800BF1E8
    or      a1, s0, $zero              # a1 = 00000000
    lw      t4, 0x0050(s1)             # 00000050
    or      v0, s0, $zero              # v0 = 00000000
    lbu     t5, 0x0005(t4)             # 00000005
    b       lbl_800BDA60
    sb      t5, 0x0030(s0)             # 00000030
    sw      s1, 0x0048(v1)             # 00000048
lbl_800BDA50:
    lw      t6, 0x0050(s1)             # 00000050
    or      v0, v1, $zero              # v0 = 00000000
    lbu     t7, 0x0005(t6)             # 00000005
    sb      t7, 0x0030(v1)             # 00000030
lbl_800BDA60:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800BDA74:
# MqDbg: Audio_AllocNote
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      v1, 0x0050(a0)             # 00000050
    or      s0, a0, $zero              # s0 = 00000000
    lbu     v0, 0x0002(v1)             # 00000002
    andi    t6, v0, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800BDAEC
    andi    t9, v0, 0x0002             # t9 = 00000000
    lw      a2, 0x002C(a0)             # 0000002C
    beq     a2, $zero, lbl_800BDAEC
    nop
    lw      t7, 0x0040(a2)             # 00000040
    bne     a0, t7, lbl_800BDAEC
    nop
    lw      t8, 0x0048(a2)             # 00000048
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    or      a0, a2, $zero              # a0 = 00000000
    bne     t8, $at, lbl_800BDAEC
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD8B4
    sw      a2, 0x0024($sp)
    jal     func_800BD69C
    lw      a0, 0x0024($sp)
    lw      a1, 0x0024($sp)
    lw      a0, 0x000C(a1)             # 0000000C
    jal     func_800BF1E8
    addiu   a0, a0, 0x0020             # a0 = 00000020
    b       lbl_800BDD34
    lw      v0, 0x0024($sp)
lbl_800BDAEC:
    beq     t9, $zero, lbl_800BDB40
    andi    t0, v0, 0x0004             # t0 = 00000000
    addiu   a0, v1, 0x0084             # a0 = 00000084
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDB38
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDB38
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDB38:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDB40:
    beq     t0, $zero, lbl_800BDBE8
    andi    t4, v0, 0x0008             # t4 = 00000000
    addiu   a0, v1, 0x0084             # a0 = 00000084
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t1, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t1)             # 0000004C
    jal     func_800BD8E0
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t2, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t2)             # 0000004C
    jal     func_800BD92C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t3, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t3)             # 0000004C
    jal     func_800BD97C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDBE0:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDBE8:
    beq     t4, $zero, lbl_800BDC40
    addiu   a0, v1, 0x0084             # a0 = 00000084
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDC38
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD92C
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDC38
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD97C
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDC38:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDC40:
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t5, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t5)             # 0000004C
    jal     func_800BD8E0
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t6, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t6)             # 0000004C
    jal     func_800BD92C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD92C
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t7, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t7)             # 0000004C
    jal     func_800BD97C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD97C
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDD1C:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDD24:
    lbu     t9, 0x0000(s0)             # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    ori     t0, t9, 0x0008             # t0 = 00000008
    sb      t0, 0x0000(s0)             # 00000000
lbl_800BDD34:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BDD48:
# MqDbg: Audio_NoteInitAll
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s4, 0x0030($sp)
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x5630             # s4 = 80125630
    lw      t6, 0x2894(s4)             # 80127EC4
    sw      s1, 0x0024($sp)
    sw      $ra, 0x003C($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s0, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    blez    t6, lbl_800BDE48
    or      s1, $zero, $zero           # s1 = 00000000
    lui     s6, 0x8012                 # s6 = 80120000
    lui     s5, 0x8010                 # s5 = 80100000
    mtc1    $zero, $f20                # $f20 = 0.00
    addiu   s5, s5, 0x0DF4             # s5 = 80100DF4
    addiu   s6, s6, 0x7FF0             # s6 = 80127FF0
    or      s2, $zero, $zero           # s2 = 00000000
    addiu   s3, $zero, 0xFFFF          # s3 = FFFFFFFF
    lw      t7, 0x352C(s4)             # 80128B5C
lbl_800BDDA4:
    lw      t9, 0x0000(s5)             # 80100DF4
    or      a0, s6, $zero              # a0 = 80127FF0
    addu    s0, s2, t7
    sw      t9, 0x00C0(s0)             # 000000C0
    lw      t8, 0x0004(s5)             # 80100DF8
    addiu   a1, $zero, 0x01E0          # a1 = 000001E0
    sw      t8, 0x00C4(s0)             # 000000C4
    lw      t9, 0x0008(s5)             # 80100DFC
    sw      t9, 0x00C8(s0)             # 000000C8
    lw      t8, 0x000C(s5)             # 80100E00
    sw      t8, 0x00CC(s0)             # 000000CC
    lw      t9, 0x0010(s5)             # 80100E04
    sw      t9, 0x00D0(s0)             # 000000D0
    lw      t8, 0x0014(s5)             # 80100E08
    sw      t8, 0x00D4(s0)             # 000000D4
    lw      t9, 0x0018(s5)             # 80100E0C
    sw      t9, 0x00D8(s0)             # 000000D8
    lw      t8, 0x001C(s5)             # 80100E10
    sb      $zero, 0x0030(s0)          # 00000030
    sb      $zero, 0x0034(s0)          # 00000034
    sw      s3, 0x0044(s0)             # 00000044
    sw      s3, 0x0048(s0)             # 00000048
    sw      s3, 0x0040(s0)             # 00000040
    sb      $zero, 0x0031(s0)          # 00000031
    swc1    $f20, 0x0058(s0)           # 00000058
    sh      $zero, 0x0036(s0)          # 00000036
    sb      $zero, 0x0070(s0)          # 00000070
    sb      $zero, 0x00B0(s0)          # 000000B0
    sh      $zero, 0x0092(s0)          # 00000092
    sh      $zero, 0x0094(s0)          # 00000094
    sb      $zero, 0x0035(s0)          # 00000035
    sw      $zero, 0x00BC(s0)          # 000000BC
    jal     func_800B38C8
    sw      t8, 0x00DC(s0)             # 000000DC
    sw      v0, 0x001C(s0)             # 0000001C
    lw      t0, 0x2894(s4)             # 80127EC4
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s2, s2, 0x00E0             # s2 = 000000E0
    slt     $at, s1, t0
    bnel    $at, $zero, lbl_800BDDA4
    lw      t7, 0x352C(s4)             # 80128B5C
lbl_800BDE48:
    lw      $ra, 0x003C($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    nop
    nop
    nop
    