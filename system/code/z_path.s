# "Path" part of the code file
#
# Starts at VRAM: 800790B0 / VROM: ??????
#

.section .text
func_800790B0:
# MqDbg: Path_CopyLastPoint
    beq     a0, $zero, lbl_8007913C
    lui     t9, 0x8012                 # t9 = 80120000
    lw      v1, 0x0004(a0)             # 00000004
    lbu     t2, 0x0000(a0)             # 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    sll     t6, v1,  4
    srl     t7, t6, 28
    sll     t8, t7,  2
    addu    t9, t9, t8
    lw      t9, 0x0C38(t9)             # 80120C38
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t0, v1, $at
    sll     t3, t2,  2
    subu    t3, t3, t2
    sll     t3, t3,  1
    lui     $at, 0x7FFF                # $at = 7FFF0000
    addu    t1, t9, t0
    addu    v0, t1, t3
    ori     $at, $at, 0xFFFA           # $at = 7FFFFFFA
    addu    v0, v0, $at
    lh      t4, 0x0000(v0)             # 00000000
    mtc1    t4, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    swc1    $f6, 0x0000(a1)            # 00000000
    lh      t5, 0x0002(v0)             # 00000002
    mtc1    t5, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    swc1    $f10, 0x0004(a1)           # 00000004
    lh      t6, 0x0004(v0)             # 00000004
    mtc1    t6, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    swc1    $f18, 0x0008(a1)           # 00000008
lbl_8007913C:
    jr      $ra
    nop
    nop
    nop
    nop


func_80079150:
# MqDbg: 
    sw      $zero, 0x0004(a0)          # 00000004
    sw      $zero, 0x0000(a0)          # 00000000
    jr      $ra
    nop


func_80079160:
# MqDbg: 
    addiu   v1, $zero, 0x0010          # v1 = 00000010
    lhu     t6, 0x0000(a1)             # 00000000
    andi    t7, t6, 0x0010             # t7 = 00000000
    bnel    v1, t7, lbl_80079198
    lw      t0, 0x0000(a0)             # 00000000
    lhu     t8, 0x000C(a1)             # 0000000C
    addiu   $at, $zero, 0x0400         # $at = 00000400
    andi    t9, t8, 0x0400             # t9 = 00000000
    bnel    t9, $at, lbl_80079198
    lw      t0, 0x0000(a0)             # 00000000
    lw      v0, 0x0000(a0)             # 00000000
    sltiu   v0, v0, 0x0001
    sw      v0, 0x0000(a0)             # 00000000
    lw      t0, 0x0000(a0)             # 00000000
lbl_80079198:
    beql    t0, $zero, lbl_800791E8
    sw      $zero, 0x0004(a0)          # 00000004
    lhu     v0, 0x0000(a1)             # 00000000
    addiu   $at, $zero, 0x2000         # $at = 00002000
    andi    t1, v0, 0x2000             # t1 = 00000000
    bnel    t1, $at, lbl_800791F4
    or      v0, $zero, $zero           # v0 = 00000000
    lhu     t2, 0x000C(a1)             # 0000000C
    andi    t4, v0, 0x0010             # t4 = 00000000
    andi    t3, t2, 0x0010             # t3 = 00000000
    beql    v1, t3, lbl_800791E8
    sw      $zero, 0x0004(a0)          # 00000004
    bnel    v1, t4, lbl_800791F4
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t5, 0x0004(a0)             # 00000004
    addiu   t6, t5, 0x0001             # t6 = 00000001
    slti    $at, t6, 0x0009
    bne     $at, $zero, lbl_800791F0
    sw      t6, 0x0004(a0)             # 00000004
    sw      $zero, 0x0004(a0)          # 00000004
lbl_800791E8:
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800791F0:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800791F4:
    jr      $ra
    nop
    nop
