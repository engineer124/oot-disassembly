

.section .text
func_800CCDA0:
# MqDbg: PadUtils_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0018          # a1 = 00000018
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CCDC0:
# MqDbg: func_800FCB70
    jr      $ra
    nop


func_800CCDC8:
# MqDbg: PadUtils_ResetPressRel
    sh      $zero, 0x000C(a0)          # 0000000C
    sb      $zero, 0x000E(a0)          # 0000000E
    sb      $zero, 0x000F(a0)          # 0000000F
    jr      $ra
    sh      $zero, 0x0012(a0)          # 00000012


func_800CCDDC:
# MqDbg: PadUtils_CheckCurExact
    sw      a1, 0x0004($sp)
    lhu     t6, 0x0000(a0)             # 00000000
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    xor     v0, t6, a1
    jr      $ra
    sltiu   v0, v0, 0x0001


func_800CCDF4:
# MqDbg: PadUtils_CheckCur
    sw      a1, 0x0004($sp)
    lhu     t6, 0x0000(a0)             # 00000000
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    and     t7, t6, a1
    xor     v0, t7, a1
    jr      $ra
    sltiu   v0, v0, 0x0001


func_800CCE10:
# MqDbg: PadUtils_CheckPressed
    sw      a1, 0x0004($sp)
    lhu     t6, 0x000C(a0)             # 0000000C
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    and     t7, t6, a1
    xor     v0, t7, a1
    jr      $ra
    sltiu   v0, v0, 0x0001


func_800CCE2C:
# MqDbg: PadUtils_CheckReleased
    sw      a1, 0x0004($sp)
    lhu     t6, 0x0012(a0)             # 00000012
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    and     t7, t6, a1
    xor     v0, t7, a1
    jr      $ra
    sltiu   v0, v0, 0x0001


func_800CCE48:
# MqDbg: PadUtils_GetCurButton
    jr      $ra
    lhu     v0, 0x0000(a0)             # 00000000


func_800CCE50:
# MqDbg: PadUtils_GetPressButton
    jr      $ra
    lhu     v0, 0x000C(a0)             # 0000000C


func_800CCE58:
# MqDbg: PadUtils_GetCurX
    jr      $ra
    lb      v0, 0x0002(a0)             # 00000002


func_800CCE60:
# MqDbg: PadUtils_GetCurY
    jr      $ra
    lb      v0, 0x0003(a0)             # 00000003


func_800CCE68:
# MqDbg: PadUtils_SetRelXY
# SB A1, 0x0014(A0) / SB A2, 0x0015 (A0)
# A0 = ?
# A1 = ?
# A2 = ?
    sb      a1, 0x0014(a0)             # 00000014
    jr      $ra
    sb      a2, 0x0015(a0)             # 00000015


func_800CCE74:
# MqDbg: PadUtils_GetRelXImpl
    jr      $ra
    lb      v0, 0x0014(a0)             # 00000014


func_800CCE7C:
# MqDbg: PadUtils_GetRelYImpl
    jr      $ra
    lb      v0, 0x0015(a0)             # 00000015


func_800CCE84:
# MqDbg: PadUtils_GetRelX
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CCE74
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CCEA4:
# MqDbg: PadUtils_GetRelY
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CCE7C
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CCEC4:
# MqDbg: N/A
    jr      $ra
    lb      v0, 0x000E(a0)             # 0000000E


func_800CCECC:
# MqDbg: N/A
    jr      $ra
    lb      v0, 0x000F(a0)             # 0000000F


func_800CCED4:
# MqDbg: PadUtils_UpdateRelXY
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800CCE58
    sw      a0, 0x0020($sp)
    lw      a0, 0x0020($sp)
    jal     func_800CCE60
    sw      v0, 0x001C($sp)
    lw      v1, 0x001C($sp)
    slti    $at, v1, 0x0008
    bne     $at, $zero, lbl_800CCF18
    slti    $at, v1, 0x0043
    beq     $at, $zero, lbl_800CCF10
    nop
    b       lbl_800CCF40
    addiu   a1, v1, 0xFFF9             # a1 = FFFFFFF9
lbl_800CCF10:
    b       lbl_800CCF40
    addiu   a1, $zero, 0x003C          # a1 = 0000003C
lbl_800CCF18:
    slti    $at, v1, 0xFFF9
    beq     $at, $zero, lbl_800CCF40
    or      a1, $zero, $zero           # a1 = 00000000
    slti    $at, v1, 0xFFBE
    bne     $at, $zero, lbl_800CCF38
    nop
    b       lbl_800CCF40
    addiu   a1, v1, 0x0007             # a1 = 00000007
lbl_800CCF38:
    b       lbl_800CCF40
    addiu   a1, $zero, 0xFFC4          # a1 = FFFFFFC4
lbl_800CCF40:
    slti    $at, v0, 0x0008
    bne     $at, $zero, lbl_800CCF64
    slti    $at, v0, 0x0043
    beq     $at, $zero, lbl_800CCF5C
    nop
    b       lbl_800CCF8C
    addiu   a2, v0, 0xFFF9             # a2 = FFFFFFF9
lbl_800CCF5C:
    b       lbl_800CCF8C
    addiu   a2, $zero, 0x003C          # a2 = 0000003C
lbl_800CCF64:
    slti    $at, v0, 0xFFF9
    beq     $at, $zero, lbl_800CCF8C
    or      a2, $zero, $zero           # a2 = 00000000
    slti    $at, v0, 0xFFBE
    bne     $at, $zero, lbl_800CCF84
    nop
    b       lbl_800CCF8C
    addiu   a2, v0, 0x0007             # a2 = 00000007
lbl_800CCF84:
    b       lbl_800CCF8C
    addiu   a2, $zero, 0xFFC4          # a2 = FFFFFFC4
lbl_800CCF8C:
    jal     func_800CCE68
    lw      a0, 0x0020($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop
    nop
    nop
    nop