# "Actor" Overlay Tables
#
# Starts at VRAM: 8002B160 / VROM: ??????
#

.section .text
func_8002B160:
# MqDbg: ActorOverlayTable_LogPrint
    jr      $ra
    nop


func_8002B168:
# MqDbg: ActorOverlayTable_FaultPrint
# Actor overlay related. - Specifically actor_dlftbls [?]
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0044($sp)
    sw      s8, 0x0040($sp)
    sw      s7, 0x003C($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sw      a0, 0x0048($sp)
    sw      a1, 0x004C($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x1C9C(v0)             # 80121C9C
    or      s6, $zero, $zero           # s6 = 00000000
    or      s5, $zero, $zero           # s5 = 00000000
    beq     v0, $zero, lbl_8002B1BC
    nop
    b       lbl_8002B1BC
    lw      s6, 0x011C(v0)             # 8012011C
lbl_8002B1BC:
    beq     v0, $zero, lbl_8002B1D0
    nop
    lw      t6, 0x0100(v0)             # 80120100
    b       lbl_8002B1D0
    lw      s5, 0x0104(v0)             # 80120104
lbl_8002B1D0:
    jal     func_800ADB98
    nop
    lui     s0, 0x800F                 # s0 = 800F0000
    addiu   s0, s0, 0xC010             # s0 = 800EC010
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x69E0             # a0 = 801069E0
    jal     func_800ADBF8
    lw      a1, 0x0000(s0)             # 800EC010
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800ADBF8
    addiu   a0, a0, 0x69F4             # a0 = 801069F4
    lw      v1, 0x0000(s0)             # 800EC010
    lui     s3, 0x800F                 # s3 = 800F0000
    addiu   s3, s3, 0x8530             # s3 = 800E8530
    beq     v1, $zero, lbl_8002B2BC
    or      s4, $zero, $zero           # s4 = 00000000
    lui     s8, 0x8010                 # s8 = 80100000
    lui     s7, 0x8010                 # s7 = 80100000
    addiu   s7, s7, 0x6A14             # s7 = 80106A14
    addiu   s8, s8, 0x6A28             # s8 = 80106A28
lbl_8002B220:
    lw      v0, 0x0008(s3)             # 800E8538
    lw      s0, 0x0010(s3)             # 800E8540
    lw      t8, 0x000C(s3)             # 800E853C
    or      a0, s7, $zero              # a0 = 80106A14
    subu    s2, v0, s0
    beq     s0, $zero, lbl_8002B2AC
    subu    t0, t8, v0
    addu    s1, s0, t0
    or      a3, s1, $zero              # a3 = 00000000
    or      a1, s4, $zero              # a1 = 00000000
    or      a2, s0, $zero              # a2 = 800EC010
    jal     func_800ADBF8
    sw      s2, 0x0010($sp)
    sltu    $at, s6, s0
    bne     $at, $zero, lbl_8002B278
    sltu    $at, s6, s1
    beq     $at, $zero, lbl_8002B278
    or      a0, s8, $zero              # a0 = 80106A28
    jal     func_800ADBF8
    addu    a1, s6, s2
    b       lbl_8002B298
    nop
lbl_8002B278:
    sltu    $at, s5, s0
    bne     $at, $zero, lbl_8002B298
    sltu    $at, s5, s1
    beq     $at, $zero, lbl_8002B298
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x6A34             # a0 = 80106A34
    jal     func_800ADBF8
    addu    a1, s5, s2
lbl_8002B298:
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800ADBF8
    addiu   a0, a0, 0x6A40             # a0 = 80106A40
    lui     v1, 0x800F                 # v1 = 800F0000
    lw      v1, -0x3FF0(v1)            # 800EC010
lbl_8002B2AC:
    addiu   s4, s4, 0x0001             # s4 = 00000001
    sltu    $at, s4, v1
    bne     $at, $zero, lbl_8002B220
    addiu   s3, s3, 0x0020             # s3 = 800E8550
lbl_8002B2BC:
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
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_8002B2EC:
# MqDbg: ActorOverlayTable_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   t6, $zero, 0x01D7          # t6 = 000001D7
    lui     $at, 0x800F                # $at = 800F0000
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8003                 # a1 = 80030000
    sw      t6, -0x3FF0($at)           # 800EC010
    addiu   a1, a1, 0xB168             # a1 = 8002B168
    addiu   a0, a0, 0x8C60             # a0 = 80118C60
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800AEF8C
    or      a3, $zero, $zero           # a3 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8002B32C:
# MqDbg: ActorOverlayTable_Cleanup
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800AF014
    addiu   a0, a0, 0x8C60             # a0 = 80118C60
    lui     $at, 0x800F                # $at = 800F0000
    sw      $zero, -0x3FF0($at)        # 800EC010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop
