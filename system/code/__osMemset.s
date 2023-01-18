

.section .text
func_800D5E30:
# MqDbg: __osMemset
# Initialize Memory (Custom Initial Value)
# A0 = Start ptr
# A1 = Initial Value (for each byte)
# A2 = Length
# V0 = A0
    or      v1, a2, $zero              # v1 = 00000000
    or      v0, a0, $zero              # v0 = 00000000
    beq     a2, $zero, lbl_800D5E54
    addiu   a2, a2, 0xFFFF             # a2 = FFFFFFFF
lbl_800D5E40:
    or      v1, a2, $zero              # v1 = FFFFFFFF
    sb      a1, 0x0000(v0)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000001
    bne     a2, $zero, lbl_800D5E40
    addiu   a2, a2, 0xFFFF             # a2 = FFFFFFFE
lbl_800D5E54:
    jr      $ra
    or      v0, a0, $zero              # v0 = 00000000
    nop