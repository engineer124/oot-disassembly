

.section .text
func_800CE740:
# MqDbg: proutSprintf
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800D2350
    sw      a2, 0x0020($sp)
    lw      $ra, 0x0014($sp)
    lw      t6, 0x0020($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    addu    v0, v0, t6


func_800CE764:
# MqDbg: vsprintf
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    or      a3, a2, $zero              # a3 = 00000000
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    lui     a0, 0x800D                 # a0 = 800D0000
    addiu   a0, a0, 0xE740             # a0 = 800CE740
    jal     func_800D1D00
    lw      a1, 0x0018($sp)
    bltz    v0, lbl_800CE7A0
    or      v1, v0, $zero              # v1 = 00000000
    lw      t6, 0x0018($sp)
    addu    t7, t6, v0
    sb      $zero, 0x0000(t7)          # 00000000
lbl_800CE7A0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800CE7B4:
# MqDbg: sprintf
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    sw      a2, 0x0028($sp)
    sw      a3, 0x002C($sp)
    lui     a0, 0x800D                 # a0 = 800D0000
    addiu   a0, a0, 0xE740             # a0 = 800CE740
    addiu   a3, $sp, 0x0028            # a3 = 00000008
    lw      a2, 0x0024($sp)
    jal     func_800D1D00
    lw      a1, 0x0020($sp)
    bltz    v0, lbl_800CE7F8
    or      v1, v0, $zero              # v1 = 00000000
    lw      t6, 0x0020($sp)
    addu    t7, t6, v0
    sb      $zero, 0x0000(t7)          # 00000000
lbl_800CE7F8:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop
    nop
