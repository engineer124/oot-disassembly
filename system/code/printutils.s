

.section .text
func_800CE810:
# MqDbg: PrintUtils_VPrintf
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    or      a3, a2, $zero              # a3 = 00000000
    lw      a2, 0x001C($sp)
    jal     func_800D1D00
    lw      a0, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CE844:
# MqDbg: PrintUtils_Printf
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a2, 0x0028($sp)
    sw      a1, 0x0024($sp)
    sw      a3, 0x002C($sp)
    jal     func_800CE810
    addiu   a2, $sp, 0x0028            # a2 = 00000008
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop