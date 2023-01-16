# Audio dcache
#
# Starts at VRAM: 800BBE00 / VROM: ??????
#

.section .text
func_800BBE00:
# MqDbg: Audio_InvalDCache
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sw      v0, 0x001C($sp)
    lw      a0, 0x0020($sp)
    jal     func_80004250              # osInvalDCache
    lw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BBE40:
# MqDbg: Audio_WritebackDCache
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sw      v0, 0x001C($sp)
    lw      a0, 0x0020($sp)
    jal     func_80003440              # osWritebackDCache
    lw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop
