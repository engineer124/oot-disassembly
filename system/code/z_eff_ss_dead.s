# Particle Effects: ss dead
#
# Starts at VRAM: 8001A0E0 / VROM: A90040
#

.section .text
func_8001A0E0:
# MqDbg: func_80026230
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    sll     a3, a3, 16
    sll     a2, a2, 16
    sra     a2, a2, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    ori     t7, $zero, 0x8000          # t7 = 00008000
    div     $zero, t7, a3
    mflo    t8
    lw      t6, 0x0028($sp)
    nop
    multu   t8, a2
    lw      t0, 0x0000(t6)             # 00000000
    lw      v0, 0x02C0(t0)             # 000002C0
    bne     a3, $zero, lbl_8001A130
    nop
    break   # 0x01C00
lbl_8001A130:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a3, $at, lbl_8001A148
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8001A148
    nop
    break   # 0x01800
lbl_8001A148:
    mflo    a0
    sll     a0, a0, 16
    sra     a0, a0, 16
    sw      a1, 0x002C($sp)
    sw      t0, 0x0018($sp)
    jal     func_80063684              # coss?
    sw      v0, 0x0020($sp)
    mtc1    $zero, $f4                 # $f4 = 0.00
    lw      v0, 0x0020($sp)
    lw      a1, 0x002C($sp)
    c.le.s  $f4, $f0
    or      v1, v0, $zero              # v1 = 00000000
    lw      t0, 0x0018($sp)
    lui     t9, 0xE700                 # t9 = E7000000
    bc1f    lbl_8001A190
    addiu   v0, v0, 0x0008             # v0 = 00000008
    b       lbl_8001A194
    mov.s   $f2, $f0
lbl_8001A190:
    neg.s   $f2, $f0
lbl_8001A194:
    sw      t9, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    bne     a1, $zero, lbl_8001A1C4
    lui     $at, 0x8010                # $at = 80100000
    or      v1, v0, $zero              # v1 = 00000008
    lui     t1, 0xF800                 # t1 = F8000000
    lui     t2, 0xFF00                 # t2 = FF000000
    sw      t2, 0x0004(v1)             # 0000000C
    sw      t1, 0x0000(v1)             # 00000008
    addiu   v0, v0, 0x0008             # v0 = 00000010
    b       lbl_8001A204
    or      v1, v0, $zero              # v1 = 00000010
lbl_8001A1C4:
    or      v1, v0, $zero              # v1 = 00000010
    lui     t3, 0xF800                 # t3 = F8000000
    sw      t3, 0x0000(v1)             # 00000010
    lbu     t8, 0x0001(a1)             # 00000001
    lbu     t5, 0x0000(a1)             # 00000000
    lbu     t2, 0x0002(a1)             # 00000002
    sll     t9, t8, 16
    lbu     t8, 0x0003(a1)             # 00000003
    sll     t6, t5, 24
    or      t1, t6, t9                 # t1 = E7000000
    sll     t4, t2,  8
    or      t5, t1, t4                 # t5 = E7000000
    or      t6, t5, t8                 # t6 = E7000000
    sw      t6, 0x0004(v1)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000018
    or      v1, v0, $zero              # v1 = 00000018
lbl_8001A204:
    lui     t9, 0xDB08                 # t9 = DB080000
    sw      t9, 0x0000(v1)             # 00000018
    lwc1    $f6, 0x6070($at)           # 80106070
    lui     t5, 0x0001                 # t5 = 00010000
    ori     t5, t5, 0xF400             # t5 = 0001F400
    mul.s   $f8, $f2, $f6
    addiu   v0, v0, 0x0008             # v0 = 00000020
    trunc.w.s $f10, $f8
    mfc1    t3, $f10
    nop
    sll     t1, t3, 16
    sra     t4, t1, 16
    addiu   t7, t4, 0x05DC             # t7 = 000005DC
    div     $zero, t5, t7
    mflo    a0
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sll     t8, a0, 16
    or      t6, t8, a0                 # t6 = 00000000
    sw      t6, 0x0004(v1)             # 0000001C
    bne     t7, $zero, lbl_8001A25C
    nop
    break   # 0x01C00
lbl_8001A25C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_8001A274
    lui     $at, 0x8000                # $at = 80000000
    bne     t5, $at, lbl_8001A274
    nop
    break   # 0x01800
lbl_8001A274:
    sw      v0, 0x02C0(t0)             # 000002C0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001A288:
# MqDbg: func_80026400
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    sll     a3, a3, 16
    sll     a2, a2, 16
    sra     a2, a2, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    addiu   t7, $zero, 0x4000          # t7 = 00004000
    div     $zero, t7, a3
    mflo    t8
    lw      t6, 0x0028($sp)
    nop
    multu   t8, a2
    lw      t0, 0x0000(t6)             # 00000000
    bne     a3, $zero, lbl_8001A2D4
    nop
    break   # 0x01C00
lbl_8001A2D4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a3, $at, lbl_8001A2EC
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8001A2EC
    nop
    break   # 0x01800
lbl_8001A2EC:
    mflo    a0
    sll     a0, a0, 16
    sra     a0, a0, 16
    sw      a1, 0x002C($sp)
    jal     func_80063684              # coss?
    sw      t0, 0x001C($sp)
    lw      t0, 0x001C($sp)
    mtc1    $zero, $f2                 # $f2 = 0.00
    lw      a1, 0x002C($sp)
    lw      v0, 0x02C0(t0)             # 000002C0
    or      v1, v0, $zero              # v1 = 00000000
    lui     t9, 0xE700                 # t9 = E7000000
    sw      t9, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      a0, v0, $zero              # a0 = 00000008
    lui     t1, 0xF800                 # t1 = F8000000
    sw      t1, 0x0000(a0)             # 00000008
    lbu     t6, 0x0001(a1)             # 00000001
    lbu     t3, 0x0000(a1)             # 00000000
    lbu     t9, 0x0002(a1)             # 00000002
    sll     t7, t6, 16
    lbu     t6, 0x0003(a1)             # 00000003
    sll     t4, t3, 24
    or      t8, t4, t7                 # t8 = 00000000
    sll     t2, t9,  8
    or      t3, t8, t2                 # t3 = 00000000
    or      t4, t3, t6                 # t4 = 00000000
    sw      t4, 0x0004(a0)             # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    c.le.s  $f2, $f0
    or      a2, v0, $zero              # a2 = 00000010
    lui     t7, 0xDB08                 # t7 = DB080000
    sw      t7, 0x0000(a2)             # 00000010
    bc1f    lbl_8001A384
    addiu   v0, v0, 0x0008             # v0 = 00000018
    b       lbl_8001A388
    mov.s   $f12, $f0
lbl_8001A384:
    neg.s   $f12, $f0
lbl_8001A388:
    c.le.s  $f2, $f0
    lui     $at, 0x452F                # $at = 452F0000
    bc1fl   lbl_8001A3A4
    neg.s   $f2, $f0
    b       lbl_8001A3A4
    mov.s   $f2, $f0
    neg.s   $f2, $f0
lbl_8001A3A4:
    mtc1    $at, $f0                   # $f0 = 2800.00
    lui     v1, 0x0001                 # v1 = 00010000
    ori     v1, v1, 0xF400             # v1 = 0001F400
    mul.s   $f4, $f2, $f0
    trunc.w.s $f6, $f4
    mul.s   $f8, $f0, $f12
    mfc1    t1, $f6
    nop
    sll     t8, t1, 16
    sra     t2, t8, 16
    addiu   t5, t2, 0x06A4             # t5 = 000006A4
    div     $zero, v1, t5
    trunc.w.s $f10, $f8
    mflo    t3
    andi    t6, t3, 0xFFFF             # t6 = 00000000
    bne     t5, $zero, lbl_8001A3EC
    nop
    break   # 0x01C00
lbl_8001A3EC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t5, $at, lbl_8001A404
    lui     $at, 0x8000                # $at = 80000000
    bne     v1, $at, lbl_8001A404
    nop
    break   # 0x01800
lbl_8001A404:
    mfc1    t7, $f10
    nop
    sll     t9, t7, 16
    sra     t1, t9, 16
    addiu   t8, t1, 0x06A4             # t8 = F80006A4
    div     $zero, v1, t8
    mflo    t2
    andi    t5, t2, 0xFFFF             # t5 = 00000000
    sll     t3, t5, 16
    or      t4, t6, t3                 # t4 = 00000000
    sw      t4, 0x0004(a2)             # 00000014
    bne     t8, $zero, lbl_8001A43C
    nop
    break   # 0x01C00
lbl_8001A43C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t8, $at, lbl_8001A454
    lui     $at, 0x8000                # $at = 80000000
    bne     v1, $at, lbl_8001A454
    nop
    break   # 0x01800
lbl_8001A454:
    sw      v0, 0x02C0(t0)             # 000002C0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001A468:
# MqDbg: func_80026608
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lw      a2, 0x0000(a0)             # 00000000
    lw      v1, 0x02C0(a2)             # 000002C0
    lui     t7, 0xE700                 # t7 = E7000000
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02C0(a2)             # 000002C0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t7, 0x0000(v1)             # 00000000
    lw      a1, 0x02C0(a2)             # 000002C0
    jal     func_8009A574
    sw      a2, 0x0018($sp)
    lw      a2, 0x0018($sp)
    sw      v0, 0x02C0(a2)             # 000002C0
    lw      $ra, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_8001A4AC:
# MqDbg: func_80026690
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    sll     a3, a3, 16
    sll     a2, a2, 16
    sra     a2, a2, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    ori     t7, $zero, 0x8000          # t7 = 00008000
    div     $zero, t7, a3
    mflo    t8
    lw      t6, 0x0028($sp)
    nop
    multu   t8, a2
    lw      t0, 0x0000(t6)             # 00000000
    lw      v0, 0x02D0(t0)             # 000002D0
    bne     a3, $zero, lbl_8001A4FC
    nop
    break   # 0x01C00
lbl_8001A4FC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a3, $at, lbl_8001A514
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8001A514
    nop
    break   # 0x01800
lbl_8001A514:
    mflo    a0
    sll     a0, a0, 16
    sra     a0, a0, 16
    sw      a1, 0x002C($sp)
    sw      t0, 0x0018($sp)
    jal     func_80063684              # coss?
    sw      v0, 0x0020($sp)
    mtc1    $zero, $f4                 # $f4 = 0.00
    lw      v0, 0x0020($sp)
    lw      a1, 0x002C($sp)
    c.le.s  $f4, $f0
    or      v1, v0, $zero              # v1 = 00000000
    lw      t0, 0x0018($sp)
    lui     t9, 0xE700                 # t9 = E7000000
    bc1f    lbl_8001A55C
    addiu   v0, v0, 0x0008             # v0 = 00000008
    b       lbl_8001A560
    mov.s   $f2, $f0
lbl_8001A55C:
    neg.s   $f2, $f0
lbl_8001A560:
    sw      t9, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    bne     a1, $zero, lbl_8001A590
    lui     $at, 0x8010                # $at = 80100000
    or      v1, v0, $zero              # v1 = 00000008
    lui     t1, 0xF800                 # t1 = F8000000
    lui     t2, 0xFF00                 # t2 = FF000000
    sw      t2, 0x0004(v1)             # 0000000C
    sw      t1, 0x0000(v1)             # 00000008
    addiu   v0, v0, 0x0008             # v0 = 00000010
    b       lbl_8001A5D0
    or      v1, v0, $zero              # v1 = 00000010
lbl_8001A590:
    or      v1, v0, $zero              # v1 = 00000010
    lui     t3, 0xF800                 # t3 = F8000000
    sw      t3, 0x0000(v1)             # 00000010
    lbu     t8, 0x0001(a1)             # 00000001
    lbu     t5, 0x0000(a1)             # 00000000
    lbu     t2, 0x0002(a1)             # 00000002
    sll     t9, t8, 16
    lbu     t8, 0x0003(a1)             # 00000003
    sll     t6, t5, 24
    or      t1, t6, t9                 # t1 = E7000000
    sll     t4, t2,  8
    or      t5, t1, t4                 # t5 = E7000000
    or      t6, t5, t8                 # t6 = E7000000
    sw      t6, 0x0004(v1)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000018
    or      v1, v0, $zero              # v1 = 00000018
lbl_8001A5D0:
    lui     t9, 0xDB08                 # t9 = DB080000
    sw      t9, 0x0000(v1)             # 00000018
    lwc1    $f6, 0x6074($at)           # 80106074
    lui     t5, 0x0001                 # t5 = 00010000
    ori     t5, t5, 0xF400             # t5 = 0001F400
    mul.s   $f8, $f2, $f6
    addiu   v0, v0, 0x0008             # v0 = 00000020
    trunc.w.s $f10, $f8
    mfc1    t3, $f10
    nop
    sll     t1, t3, 16
    sra     t4, t1, 16
    addiu   t7, t4, 0x05DC             # t7 = 000005DC
    div     $zero, t5, t7
    mflo    a0
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sll     t8, a0, 16
    or      t6, t8, a0                 # t6 = 00000000
    sw      t6, 0x0004(v1)             # 0000001C
    bne     t7, $zero, lbl_8001A628
    nop
    break   # 0x01C00
lbl_8001A628:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_8001A640
    lui     $at, 0x8000                # $at = 80000000
    bne     t5, $at, lbl_8001A640
    nop
    break   # 0x01800
lbl_8001A640:
    sw      v0, 0x02D0(t0)             # 000002D0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001A654:
# MqDbg: func_80026860
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    sll     a3, a3, 16
    sll     a2, a2, 16
    sra     a2, a2, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    addiu   t7, $zero, 0x4000          # t7 = 00004000
    div     $zero, t7, a3
    mflo    t8
    lw      t6, 0x0028($sp)
    nop
    multu   t8, a2
    lw      t0, 0x0000(t6)             # 00000000
    lw      v0, 0x02D0(t0)             # 000002D0
    bne     a3, $zero, lbl_8001A6A4
    nop
    break   # 0x01C00
lbl_8001A6A4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a3, $at, lbl_8001A6BC
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8001A6BC
    nop
    break   # 0x01800
lbl_8001A6BC:
    mflo    a0
    sll     a0, a0, 16
    sra     a0, a0, 16
    sw      a1, 0x002C($sp)
    sw      t0, 0x001C($sp)
    jal     func_80063684              # coss?
    sw      v0, 0x0020($sp)
    mtc1    $zero, $f2                 # $f2 = 0.00
    lw      v0, 0x0020($sp)
    lw      a1, 0x002C($sp)
    lw      t0, 0x001C($sp)
    or      v1, v0, $zero              # v1 = 00000000
    lui     t9, 0xE700                 # t9 = E7000000
    sw      t9, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      a0, v0, $zero              # a0 = 00000008
    lui     t1, 0xF800                 # t1 = F8000000
    sw      t1, 0x0000(a0)             # 00000008
    lbu     t6, 0x0001(a1)             # 00000001
    lbu     t3, 0x0000(a1)             # 00000000
    lbu     t9, 0x0002(a1)             # 00000002
    sll     t7, t6, 16
    lbu     t6, 0x0003(a1)             # 00000003
    sll     t4, t3, 24
    or      t8, t4, t7                 # t8 = 00000000
    sll     t2, t9,  8
    or      t3, t8, t2                 # t3 = 00000000
    or      t4, t3, t6                 # t4 = 00000000
    sw      t4, 0x0004(a0)             # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    c.le.s  $f2, $f0
    or      a2, v0, $zero              # a2 = 00000010
    lui     t7, 0xDB08                 # t7 = DB080000
    sw      t7, 0x0000(a2)             # 00000010
    bc1f    lbl_8001A758
    addiu   v0, v0, 0x0008             # v0 = 00000018
    b       lbl_8001A75C
    mov.s   $f12, $f0
lbl_8001A758:
    neg.s   $f12, $f0
lbl_8001A75C:
    c.le.s  $f2, $f0
    lui     $at, 0x452F                # $at = 452F0000
    bc1fl   lbl_8001A778
    neg.s   $f2, $f0
    b       lbl_8001A778
    mov.s   $f2, $f0
    neg.s   $f2, $f0
lbl_8001A778:
    mtc1    $at, $f0                   # $f0 = 2800.00
    lui     v1, 0x0001                 # v1 = 00010000
    ori     v1, v1, 0xF400             # v1 = 0001F400
    mul.s   $f4, $f2, $f0
    trunc.w.s $f6, $f4
    mul.s   $f8, $f0, $f12
    mfc1    t1, $f6
    nop
    sll     t8, t1, 16
    sra     t2, t8, 16
    addiu   t5, t2, 0x06A4             # t5 = 000006A4
    div     $zero, v1, t5
    trunc.w.s $f10, $f8
    mflo    t3
    andi    t6, t3, 0xFFFF             # t6 = 00000000
    bne     t5, $zero, lbl_8001A7C0
    nop
    break   # 0x01C00
lbl_8001A7C0:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t5, $at, lbl_8001A7D8
    lui     $at, 0x8000                # $at = 80000000
    bne     v1, $at, lbl_8001A7D8
    nop
    break   # 0x01800
lbl_8001A7D8:
    mfc1    t7, $f10
    nop
    sll     t9, t7, 16
    sra     t1, t9, 16
    addiu   t8, t1, 0x06A4             # t8 = F80006A4
    div     $zero, v1, t8
    mflo    t2
    andi    t5, t2, 0xFFFF             # t5 = 00000000
    sll     t3, t5, 16
    or      t4, t6, t3                 # t4 = 00000000
    sw      t4, 0x0004(a2)             # 00000014
    bne     t8, $zero, lbl_8001A810
    nop
    break   # 0x01C00
lbl_8001A810:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t8, $at, lbl_8001A828
    lui     $at, 0x8000                # $at = 80000000
    bne     v1, $at, lbl_8001A828
    nop
    break   # 0x01800
lbl_8001A828:
    sw      v0, 0x02D0(t0)             # 000002D0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001A83C:
# MqDbg: func_80026A6C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lw      a2, 0x0000(a0)             # 00000000
    lw      v1, 0x02D0(a2)             # 000002D0
    lui     t7, 0xE700                 # t7 = E7000000
    addiu   t6, v1, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(a2)             # 000002D0
    sw      $zero, 0x0004(v1)          # 00000004
    sw      t7, 0x0000(v1)             # 00000000
    lw      a1, 0x02D0(a2)             # 000002D0
    jal     func_8009A574
    sw      a2, 0x0018($sp)
    lw      a2, 0x0018($sp)
    sw      v0, 0x02D0(a2)             # 000002D0
    lw      $ra, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20

