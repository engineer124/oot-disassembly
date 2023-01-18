

.section .text
func_800CD3D0:
# MqDbg: PadSetup_Init
# Init controllers (calls osContInit and sets the bit in the pattern for each standard controller)
# A0 = OSMesgQueue* message queue for available input event
# A1 = Pointer to controller bit pattern
# A2 = OSContStatus*  array of controllers status
# V0 = 0 for succes, else -1
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0020($sp)
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    sb      t6, 0x0000(a1)             # 00000000
    or      s0, a2, $zero              # s0 = 00000000
    sw      a1, 0x0024($sp)
    jal     func_800CFE20              # osContInit
    lw      a0, 0x0020($sp)
    beq     v0, $zero, lbl_800CD408
    lw      a3, 0x0024($sp)
    b       lbl_800CD4FC
    lw      $ra, 0x001C($sp)
lbl_800CD408:
    lbu     t7, 0x0000(a3)             # 00000000
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    lw      a0, 0x0020($sp)
    bnel    t7, $at, lbl_800CD4F8
    or      v0, $zero, $zero           # v0 = 00000000
    jal     func_800D0DF0              # osContStartQuery
    sw      a3, 0x0024($sp)
    beq     v0, $zero, lbl_800CD434
    lw      a3, 0x0024($sp)
    b       lbl_800CD4F8
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800CD434:
    lw      a0, 0x0020($sp)
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    jal     func_80002030              # osRecvMesg
    sw      a3, 0x0024($sp)
    jal     func_800D0E74              # osContGetQuery
    or      a0, s0, $zero              # a0 = 00000000
    lw      a3, 0x0024($sp)
    or      v0, s0, $zero              # v0 = 00000000
    addiu   v1, $zero, 0x0005          # v1 = 00000005
    sb      $zero, 0x0000(a3)          # 00000000
    lbu     t8, 0x0003(s0)             # 00000003
    bne     t8, $zero, lbl_800CD488
    nop
    lhu     t9, 0x0000(s0)             # 00000000
    addiu   v1, $zero, 0x0005          # v1 = 00000005
    ori     t1, $zero, 0x0001          # t1 = 00000001
    bnel    v1, t9, lbl_800CD48C
    lbu     t2, 0x0007(v0)             # 00000007
    b       lbl_800CD488
    sb      t1, 0x0000(a3)             # 00000000
lbl_800CD488:
    lbu     t2, 0x0007(v0)             # 00000007
lbl_800CD48C:
    bnel    t2, $zero, lbl_800CD4B0
    lbu     t6, 0x000B(v0)             # 0000000B
    lhu     t3, 0x0004(v0)             # 00000004
    bnel    v1, t3, lbl_800CD4B0
    lbu     t6, 0x000B(v0)             # 0000000B
    lbu     t4, 0x0000(a3)             # 00000000
    ori     t5, t4, 0x0002             # t5 = 00000002
    sb      t5, 0x0000(a3)             # 00000000
    lbu     t6, 0x000B(v0)             # 0000000B
lbl_800CD4B0:
    bnel    t6, $zero, lbl_800CD4D4
    lbu     t0, 0x000F(v0)             # 0000000F
    lhu     t7, 0x0008(v0)             # 00000008
    bnel    v1, t7, lbl_800CD4D4
    lbu     t0, 0x000F(v0)             # 0000000F
    lbu     t8, 0x0000(a3)             # 00000000
    ori     t9, t8, 0x0004             # t9 = 00000004
    sb      t9, 0x0000(a3)             # 00000000
    lbu     t0, 0x000F(v0)             # 0000000F
lbl_800CD4D4:
    bnel    t0, $zero, lbl_800CD4F8
    or      v0, $zero, $zero           # v0 = 00000000
    lhu     t1, 0x000C(v0)             # 0000000C
    bnel    v1, t1, lbl_800CD4F8
    or      v0, $zero, $zero           # v0 = 00000000
    lbu     t2, 0x0000(a3)             # 00000000
    ori     t3, t2, 0x0008             # t3 = 00000008
    sb      t3, 0x0000(a3)             # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CD4F8:
    lw      $ra, 0x001C($sp)
lbl_800CD4FC:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop
    nop

