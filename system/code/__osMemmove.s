

.section .text
func_800D5E60:
# MqDbg: __osMemmove
    or      a3, a2, $zero              # a3 = 00000000
    or      v0, a0, $zero              # v0 = 00000000
    bne     a0, a1, lbl_800D5E78
    or      v1, a1, $zero              # v1 = 00000000
    jr      $ra
    or      v0, a0, $zero              # v0 = 00000000
lbl_800D5E78:
    sltu    $at, a0, a1
    beq     $at, $zero, lbl_800D5EB4
    addiu   t0, a3, 0xFFFF             # t0 = FFFFFFFF
    or      a2, a3, $zero              # a2 = 00000000
    beq     a3, $zero, lbl_800D5EE4
    addiu   a3, a3, 0xFFFF             # a3 = FFFFFFFF
lbl_800D5E90:
    lbu     t6, 0x0000(v1)             # 00000000
    or      a2, a3, $zero              # a2 = FFFFFFFF
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sb      t6, -0x0001(v0)            # 00000000
    bne     a3, $zero, lbl_800D5E90
    addiu   a3, a3, 0xFFFF             # a3 = FFFFFFFE
    b       lbl_800D5EE8
    or      v0, a0, $zero              # v0 = 00000000
lbl_800D5EB4:
    or      a2, a3, $zero              # a2 = FFFFFFFE
    addu    v0, a0, t0
    addu    v1, a1, t0
    beq     a3, $zero, lbl_800D5EE4
    addiu   a3, a3, 0xFFFF             # a3 = FFFFFFFD
lbl_800D5EC8:
    lbu     t7, 0x0000(v1)             # 00000001
    or      a2, a3, $zero              # a2 = FFFFFFFD
    addiu   v0, v0, 0xFFFF             # v0 = FFFFFFFF
    addiu   v1, v1, 0xFFFF             # v1 = 00000000
    sb      t7, 0x0001(v0)             # 00000000
    bne     a3, $zero, lbl_800D5EC8
    addiu   a3, a3, 0xFFFF             # a3 = FFFFFFFC
lbl_800D5EE4:
    or      v0, a0, $zero              # v0 = 00000000
lbl_800D5EE8:
    jr      $ra
    nop
